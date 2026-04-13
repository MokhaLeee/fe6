#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_part(rom_data, off, length):
    out = "\t"

    i = 0

    while True:
        data = rom_data[off + i * 2] | rom_data[off + i * 2 + 1] << 8
        out = out + f"0x{data:03X}"
        i = i + 1

        if i < length:
            out = out + ", "
        else:
            out = out + ","
            break

    print(out)
    return off + length * 2

def main(args):
    rom = "fe6-base.gba"

    try:
        start  = eval(args[1])
        width  = eval(args[3])
        height = eval(args[2])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START WIDTH HEIGHT [NAME]")

    try:
        name = args[4]
    except IndexError:
        name = f"gUnk_{(start|0x08000000):08X}"

    end = start + width * height * 2

    off     = start & 0x01FFFFFF
    off_end = end   & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print(f"static const u16 {name}[] = " + "{")

        while True:
            off = dump_one_part(rom_data, off, width)

            if off_end <= off:
                break

        print("};")
        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
