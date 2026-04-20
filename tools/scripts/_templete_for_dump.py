#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_part(rom_data, off, i):
    data = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    print(f"\t0x{data:X},")
    return off + 2

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
