#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import PID_DICT, CHAPTER_DICT

def dump_one_part(rom_data, off):
    print("\t{")

    pid_a = rom_data[off + 0]
    print(f"\t\t.pid_a = {PID_DICT[pid_a]},")

    pid_b = rom_data[off + 1]
    print(f"\t\t.pid_b = {PID_DICT[pid_b]},")

    msg_talk_c = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    msg_talk_c = msg_talk_c - 0x30C
    print(f"\t\t.msg_talk_c = MSG_TALK_SUPPORT_{msg_talk_c:02X},")

    msg_talk_c = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    msg_talk_c = msg_talk_c - 0x30C
    print(f"\t\t.msg_talk_b = MSG_TALK_SUPPORT_{msg_talk_c:02X},")

    msg_talk_c = int.from_bytes(rom_data[off + 12:off + 16], 'little')
    msg_talk_c = msg_talk_c - 0x30C
    print(f"\t\t.msg_talk_a = MSG_TALK_SUPPORT_{msg_talk_c:02X},")

    print("\t},")
    return off + 0x10

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
                off = off + 0x10
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
