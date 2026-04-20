#!/usr/bin/python3
# -*- coding: UTF-8 -*-

# split data

import os, sys, subprocess
import symbols

# ========================================================================
elf = "fe6.elf"
with open(elf, 'rb') as f:
    _symbols = { addr: name for addr, name in symbols.from_elf(f) }

def try_get_ptr_symbol(val):
    is_symbol = False

    ptr = val

    if ptr > 0x08000000 and ptr < 0x09000000:
        is_symbol = True
    if ptr > 0x02000000 and ptr < 0x02040000:
        is_symbol = True
    if ptr > 0x03000000 and ptr < 0x03008000:
        is_symbol = True

    if ptr not in _symbols:
        is_symbol = False

    if is_symbol == True:
        return _symbols[ptr]
    else:
        return None
# ========================================================================

def generate_unsymboled_const_data(prefix):
    _identifier = ""
    start_offse = 0
    
    ptrs = []
    for line in sys.stdin.readlines():
        if _identifier != "" and _identifier not in line:
            continue

        ptr = eval(line[start_offse:start_offse+10])
        ptrs.append(ptr)

    sorted_ptrs = sorted(ptrs)

    list = {}
    sorted_list = []
    for ptr in sorted_ptrs:
        symbol = try_get_ptr_symbol(ptr)
        if symbol == None:
            symbol = f"{prefix}_{ptr:08X}"

        if ptr not in list:
            list[ptr] = symbol
            sorted_list.append(symbol)

    return sorted_list # sorted(list.values())

def write_data(fs, fh, symbol, start, end):
    # fh.write(f'// ??? {symbol}\n')
    fh.write(f'extern u16 {symbol}[];\n')

    fs.write(f'\n\t.global {symbol}\n')
    fs.write(f'{symbol}:\t@ 0x{symbol[-6:]}\n')
    fs.write(f'\t.incbin "fe6-base.gba", 0x{start:06X}, 0x{end:06X} - 0x{start:06X}\n')

def main(args):
    try:
        out_s = args[1]
        out_h = args[2]
    except IndexError:
        sys.exit(f"Usage: {args[0]} OUT_FILE_S OUT_FILE_H")

    try:
        prefix = args[3]
    except IndexError:
        prefix = "gUnk"

    symbols = generate_unsymboled_const_data(prefix)

    with open(out_s, 'w') as fs, open(out_h, 'w') as fh:
        for i in range(len(symbols)):
            symbol = symbols[i]
            off1 = eval(f'0x{symbol[-6:]}')

            if i == (len(symbols) - 1):
                off2 = 0
            else:
                symbol2 = symbols[i + 1]
                off2 = eval(f'0x{symbol2[-6:]}')

            print(symbol)

            write_data(fs, fh, symbol, off1, off2)

if __name__ == '__main__':
    main(sys.argv)
