#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import IID_DICT, MANIM_FACINGS, MU_FLASHINGS
import symbols

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
        return None
# ========================================================================

def dump_one_part(rom_data, off):
    item = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    if item == 0xFFFF:
        item_name = "0xFFFF"
    else:
        item_name = IID_DICT[item]

    count = rom_data[off + 2]

    efx = int.from_bytes(rom_data[off + 4:off + 6], 'little')
    if efx == 0xFFFF:
        efx_name = "-1"
    else:
        efx_name = f"EFX_MAGIC({efx})"

    pr_proc = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    if pr_proc == 0:
        proc_scr = "NULL"
    else:
        proc_scr = try_get_ptr_symbol(pr_proc)

    stat = rom_data[off + 12]
    if stat == 0:
        stat_name = "false"
    elif stat == 1:
        stat_name = "true"
    else:
        stat_name = f"{stat}"

    facing = MANIM_FACINGS[rom_data[off + 13]]
    flashing = MU_FLASHINGS[rom_data[off + 14]]


    print(f"\tSPELL_ASSOC_DATA({item_name}, {count}, {efx_name}, {proc_scr}, {stat_name}, {facing}, {flashing}),")
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

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
