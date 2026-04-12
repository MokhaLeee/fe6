#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
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

def read_string_len(rom_data, off, len):
    array = bytearray(b'')
    
    i = 0

    while True:
        byte = rom_data[off]

        if byte == 0:
            break

        array.append(byte)
        off = off + 1

        i = i + 1
        if i >= len:
            break

    return array

def dump_ptr(rom_data, off):
    ptr = int.from_bytes(rom_data[off:off + 4], 'little')

    symbol = try_get_ptr_symbol(ptr)
    if symbol == None:
        symbol = f"BanimTerrain_{ptr:08X}"
        
    return symbol

def dump_one_part(rom_data, off):
    string = read_string_len(rom_data, off, 12)
    print(f"\t\t.abbr = \"{string.decode('cp932')}\",")
    
    tileset = dump_ptr(rom_data, off + 12)
    print(f"\t\t.tileset = {tileset},")

    palette = dump_ptr(rom_data, off + 16)
    print(f"\t\t.palette = {palette},")

    print("\t\t.null_1 = 0,")
    return off + 24

def main(args):
    rom = "fe6-base.gba"

    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START [END]")

    try:
        end = eval(args[2])
    except IndexError:
        end = 0

    off     = start & 0x01FFFFFF
    off_end = end   & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            print("\t{")
            off = dump_one_part(rom_data, off)
            print("\t},")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
