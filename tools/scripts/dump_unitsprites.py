#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import UNIT_SPRITES

def dump_one_part(rom_data, off):
    mode = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    print(f"\t\t.unk_00 = {mode},")

    size = int.from_bytes(rom_data[off + 2:off + 4], 'little')
    if size == 0:
        print(f"\t\t.size = UNITSPRITE_16x16,")
    elif size == 1:
        print(f"\t\t.size = UNITSPRITE_16x32,")
    elif size == 2:
        print(f"\t\t.size = UNITSPRITE_32x32,")
    else:
        print(f"\t\t.size = {mode}")

    img = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    print(f"\t\t.img = Img_UnitSprite_{img:08X}")

    print("\t},")
    return off + 8

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

    i = 0

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            print(f"\t[{UNIT_SPRITES[i]}] = " + "{")
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

            i = i + 1

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
