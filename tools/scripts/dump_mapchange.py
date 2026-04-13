#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_tilearray(rom_data, ptr, length, height):
    off = ptr & 0x07FFFFFF

    j = 0
    while True:
        i = 0
        out = "\t"
        while True:
            data = rom_data[off + j * length * 2 + i * 2] | rom_data[off + j * length * 2 + i * 2 + 1] << 8
            out = out + f"0x{data:03X}"
            i = i + 1

            if i < length:
                out = out + ", "
            else:
                out = out + ","
                break

        print(out)

        j = j + 1
        if j < height:
            pass
        else:
            break

    return off + length * 2

def dump_one_part(rom_data, off, prefix):

    idx = rom_data[off + 0]
    print(f"\t\t.id = {idx},")

    x = rom_data[off + 1]
    print(f"\t\t.x = {x},")

    y = rom_data[off + 2]
    print(f"\t\t.y = {y},")

    width = rom_data[off + 3]
    print(f"\t\t.width = {width},")

    height = rom_data[off + 4]
    print(f"\t\t.height = {height},")

    print(f"\t\t.metatiles = Tiles_{prefix}_{idx},")

    return off + 12

def main(args):
    rom = "fe6-base.gba"

    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START [prefix]")


    try:
        prefix = args[2]
    except IndexError:
        prefix = "gUnk"

    end = 0

    off     = start & 0x01FFFFFF
    off_end = end   & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        i = 0
        while True:
            width = rom_data[off + 3]
            height = rom_data[off + 4]
            pr_tile = int.from_bytes(rom_data[off+8:off+12], 'little')

            print(f"static const u16 Tiles_{prefix}_{i}[] = " + "{")
            dump_one_tilearray(rom_data, pr_tile, width, height)
            print("};")
            print("")

            i = i + 1
            off = off + 12
            if rom_data[off] == 0xFF:
                break

        off     = start & 0x01FFFFFF
        print(f"const struct MapChangeInfo {prefix}[] = " + "{")

        while True:
            print("\t{")
            off = dump_one_part(rom_data, off, prefix)
            print("\t},")

            # if off_end <= off:
            if rom_data[off] == 0xFF:
                print("\t{ .id = -1 }")
                print("};")
                print("")
                off = off + 12
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
