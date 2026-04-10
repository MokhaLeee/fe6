#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import ANIM_ROUND

def dump_one_part(rom_data, off):
    while True:
        anim_round_idx = rom_data[off]

        if anim_round_idx < 10 or anim_round_idx == 0xFF:
            anim_round = ANIM_ROUND[anim_round_idx]
        else:
            anim_round = f"0x{anim_round_idx:02X}"

        print(f"{anim_round}, 0x{rom_data[off + 1]:02X}, {rom_data[off + 2] + rom_data[off + 3] * 0x10}")

        off = off + 4
        if anim_round == "ANIM_ROUND_INVALID":
            break

    return off

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

        idx = 0

        while True:
            print(f"// {idx}")
            off = dump_one_part(rom_data, off)
            print("")
            idx = idx + 1

            if idx == 35:
                print(f"off=0x{off:X}\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
