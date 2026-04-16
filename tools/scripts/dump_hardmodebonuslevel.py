#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import PID_DICT, CHAPTER_DICT

def dump_one_part(rom_data, off):
    print("\t{")

    pid = rom_data[off + 0]
    print(f"\t\t.pid = {PID_DICT[pid]},")


    bonus_levels = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    print(f"\t\t.bonus_levels = {bonus_levels},")

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

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

            pid = rom_data[off + 0]
            if pid == 0:
                print("\t{}")
                off = off + 0x8
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
