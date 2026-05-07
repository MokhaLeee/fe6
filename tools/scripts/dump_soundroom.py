#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_part(rom_data, off, i):
    print("\t{")
    data = int.from_bytes(rom_data[off + 0:off + 4], 'little')
    print(f"\t\t.id = SONG_{data:02X},")

    data = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    data = data - 0x0C8A
    print(f"\t\t.msg_name1 = MSG_SOUNDROM_{data:02X}_NAME,")

    data = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    data = data - 0x0CCC
    print(f"\t\t.msg_name2 = MSG_SOUNDROM_{data:02X}_DESC,")
    print("\t},")
    return off + 0xC

def main(args):
    rom = "fe6-base.gba"

    try:
        start = eval(args[1])
    except IndexError:
        # sys.exit(f"Usage: {args[0]} START [END]")
        start = 0x68A664

    try:
        end = eval(args[2])
    except IndexError:
        # end = 0
        end = 0x68A988

    try:
        prefix = args[3]
    except IndexError:
        prefix = "gSoundRoomInfo"

    off     = start & 0x01FFFFFF
    off_end = end   & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("CONST_DATA struct SoundRoomInfo gSoundRoomInfo[] = {")

        i = 0
        while True:
            off = dump_one_part(rom_data, off, i)

            if off_end <= off:
                break

            i = i + 1

        print("};")
        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
