#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_part(rom_data, off):
    print("\t{")

    affinity = rom_data[off + 0]
    print(f"\t\t.affinity = AFFINITY_{affinity},")

    bonus_attack = rom_data[off + 1]
    print(f"\t\t.bonus_attack = {bonus_attack},")

    bonus_defense = rom_data[off + 2]
    print(f"\t\t.bonus_defense = {bonus_defense},")

    bonus_hit = rom_data[off + 3]
    print(f"\t\t.bonus_hit = {bonus_hit},")

    bonus_avoid = rom_data[off + 4]
    print(f"\t\t.bonus_avoid = {bonus_avoid},")

    bonus_crit = rom_data[off + 5]
    print(f"\t\t.bonus_crit = {bonus_crit},")

    bonus_dodge = rom_data[off + 6]
    print(f"\t\t.bonus_dodge = {bonus_dodge},")

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

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
