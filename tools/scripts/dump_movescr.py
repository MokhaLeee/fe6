#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
from fe6db import MOVE_COMMANDS

# ========================================================================
elf = "fe6.elf"
with open(elf, 'rb') as f:
    _symbols = { addr: name for addr, name in symbols.from_elf(f) }

def try_get_ptr_symbol(val):
    is_symbol = False

    ptr = val

    if ptr > 0x08000000 and ptr < 0x09000000:
        is_symbol = True
    if ptr > 0x02000000 and ptr < 0x02040000:
        is_symbol = True
    if ptr > 0x03000000 and ptr < 0x03008000:
        is_symbol = True

    if ptr not in _symbols:
        is_symbol = False

    if is_symbol == True:
        return _symbols[ptr]
    else:
        return f"(void *){hex(val)}"
# ========================================================================

def dump_one_part(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        scr_name = f"MoveScr_{off + 0x08000000:08X}"
    else:
        scr_name = _symbols[ptr]

    print(f"// 0x{off + 0x08000000:07X}")
    print(f"CONST_DATA u8 {scr_name}[] = " + "{")

    while True:
        data = rom_data[off]
        off = off + 1

        cmd = MOVE_COMMANDS[data]

        if cmd == "MOVE_CMD_SET_SPEED" or cmd == "MOVE_CMD_SLEEP":
            print(f"    {cmd}, {rom_data[off]},")
            off = off + 1
        else:
            print(f"    {cmd},")

        if cmd == "MOVE_CMD_HALT":
            break
            
    print("};\n")
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

        while True:
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
