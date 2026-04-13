#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_part(rom_data, off, prefix):
    data = int.from_bytes(rom_data[off + 0:off + 4], 'little')

    if data == 0:
        name = "0"
    else:
        name = f"{prefix}_{data:08X}"
    print(f"\t.word {name}")

    sjis = rom_data[off + 4]
    length = rom_data[off + 5]
    data2 = rom_data[off + 6]
    data3 = rom_data[off + 7]
    print(f"\t.byte 0x{sjis:02X}, {length}, {data2}, {data3}")

    i = 0
    while True:
        cur = off + 8 + i * 4
        data1 = int.from_bytes(rom_data[cur + 0x0:cur + 0x4], 'little')
        data2 = int.from_bytes(rom_data[cur + 0x4:cur + 0x8], 'little')
        print(f"\t.word 0x{data1:08X}, 0x{data2:08X}")

        i = i + 2
        if i >= 16:
            break

    return off + 0x48

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
            ptr  = off + 0x08000000
            name = f"{prefix}_{ptr:08X}"

            print(f".global {name}")
            print(f"{name}: @ 0x{off:06X}")
            off = dump_one_part(rom_data, off, prefix)
            print("")

            if off_end <= off:
                break

if __name__ == '__main__':
    main(sys.argv)
