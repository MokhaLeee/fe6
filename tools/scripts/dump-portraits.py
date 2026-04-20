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

def dump_one_part(rom_data, off, i):
    print(f"\t[FID_{i + 1:02X} - 1]" + " = {")
    data = int.from_bytes(rom_data[off + 0:off + 4], 'little')
    name = try_get_ptr_symbol(data)
    print(f"\t\t.img = {name},")
    
    data = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    name = try_get_ptr_symbol(data)
    print(f"\t\t.img_chibi = {name},")

    data = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    name = try_get_ptr_symbol(data)
    print(f"\t\t.pal = {name},")
    
    data = rom_data[off + 12]
    print(f"\t\t.x_mouth = {data},")

    data = rom_data[off + 13]
    print(f"\t\t.y_mouth = {data},")

    data = rom_data[off + 14]
    print(f"\t\t.unk_0E = {data}")

    print("\t},")

    return off + 16

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

    try:
        prefix = args[3]
    except IndexError:
        prefix = "gUnk"

    off     = start & 0x01FFFFFF
    off_end = end   & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        i = 0
        while True:
            off = dump_one_part(rom_data, off, i)

            if off_end <= off:
                break

            i = i + 1

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
