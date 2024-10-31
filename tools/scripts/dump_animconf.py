#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import IID_DICT
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

ITEM_KIND_NAMES = {
    0x00: "ITEM_KIND_SWORD",
    0x01: "ITEM_KIND_LANCE",
    0x02: "ITEM_KIND_AXE",
    0x03: "ITEM_KIND_BOW",
    0x04: "ITEM_KIND_STAFF",
    0x05: "ITEM_KIND_ANIMA",
    0x06: "ITEM_KIND_LIGHT",
    0x07: "ITEM_KIND_ELDER",
    0x08: "ITEM_KIND_UNK8",
    0x09: "ITEM_KIND_ITEM",
    0x0A: "ITEM_KIND_DRAGON",
    0x0B: "ITEM_KIND_DRAGONSTONE"}

def dump_one_part(rom_data, off):

    while True:
        _type = rom_data[off + 1]
        index = (rom_data[off + 3] << 8) | rom_data[off + 2]

        if index == 0:
            print("\t{ 0 }")
            break

        print("\t{")
        match _type:
            case 0:
                # item
                key = IID_DICT[rom_data[off + 0]]
                print(f"\t\t.wtype = {key},")

            case 1:
                # wtype
                key = ITEM_KIND_NAMES[rom_data[off + 0]]
                print(f"\t\t.wtype = 0x0100 | {key},")

        print(f"\t\t.index = 0x{index:04X},")
        print("\t},")
        off = off + 4
    
    return off + 4

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
                name = f"BanimInfo_{off + 0x08000000:08X}"

            print(f"struct BanimInfoEnt CONST_DATA {name}[] = " + "{")

            off = dump_one_part(rom_data, off)
            print("};\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
