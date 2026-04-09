#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import PID_DICT

def dump_one_part(rom_data, off, pid):
    msg1 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    msg2 = int.from_bytes(rom_data[off + 2:off + 4], 'little')
    msg3 = int.from_bytes(rom_data[off + 4:off + 6], 'little')
    msg4 = int.from_bytes(rom_data[off + 6:off + 8], 'little')

    if msg1 == 0 and msg2 == 0 and msg3 == 0 and msg4 == 0:
        return off + 8

    if msg1 == 0:
        msg1_name = "0"
    else:
        msg1_name = f"MSG_{msg1:03X}"

    if msg2 == 0:
        msg2_name = "0"
    else:
        msg2_name = f"MSG_{msg2:03X}"

    if msg3 == 0:
        msg3_name = "0"
    else:
        msg3_name = f"MSG_{msg3:03X}"

    if msg4 == 0:
        msg4_name = "0"
    else:
        msg4_name = f"MSG_{msg4:03X}"


    print(f"[{PID_DICT[pid]}] = " + "{ " + f"{msg1_name}, {msg2_name}, {msg3_name}, {msg4_name}" + " },")

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

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        pid = 1
        while True:
            off = dump_one_part(rom_data, off, pid)
            pid = pid + 1

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
