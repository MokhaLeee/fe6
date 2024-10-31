#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import PID_DICT
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

def dump_one_part(rom_data, off):
    print("\t.pids = {")
    cnt = 0
    for i in range(10):
        pid = rom_data[off + 0x0 + i]
        if pid == 0:
            break

        cnt = cnt + 1

        print(f"\t\t{PID_DICT[pid]},")
    
    print("\t},")

    print("\t.exp_base = {")
    for i in range(cnt):
        base = rom_data[off + 0xA + i]
        print(f"\t\t{base},")
    print("\t},")

    print("\t.exp_growth = {")
    for i in range(cnt):
        growth = rom_data[off + 0x14 + i]
        print(f"\t\t{growth},")
    print("\t},")

    supportCount = rom_data[off + 0x1E]
    print(f'\t.count = {supportCount},')
    
    return off + 0x20

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

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            pointer = off | 0x08000000
            name = try_get_ptr_symbol(pointer)
            if name is None:
                name = f"SupportInfo_{off + 0x08000000:08X}"

            print(f"struct SupportInfo CONST_DATA {name} = " + "{")

            off = dump_one_part(rom_data, off)
            print("};\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
