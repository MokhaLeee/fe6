#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
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
    hpBonus = rom_data[off + 0]
    if hpBonus != 0:
        print(f"\t.hp  = {hpBonus},")

    powBonus = rom_data[off + 1]
    if powBonus != 0:
        print(f"\t.pow = {powBonus},")

    sklBonus = rom_data[off + 2]
    if sklBonus != 0:
        print(f"\t.skl = {sklBonus},")

    spdBonus = rom_data[off + 3]
    if spdBonus != 0:
        print(f"\t.spd = {spdBonus},")

    defBonus = rom_data[off + 4]
    if defBonus != 0:
        print(f"\t.def = {defBonus},")

    resBonus = rom_data[off + 5]
    if resBonus != 0:
        print(f"\t.res = {resBonus},")

    lckBonus = rom_data[off + 6]
    if lckBonus != 0:
        print(f"\t.lck = {lckBonus},")

    movBonus = rom_data[off + 7]
    if movBonus != 0:
        print(f"\t.mov = {movBonus},")

    conBonus = rom_data[off + 8]
    if conBonus != 0:
        print(f"\t.con = {conBonus},")

    return off + 0xC

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
            pointer = off | 0x08000000
            name = try_get_ptr_symbol(pointer)
            if name is None:
                name = f"ItemBonuses_{off + 0x08000000:08X}"

            print(f"struct ItemBonuses CONST_DATA {name} = " + "{")
            off = dump_one_part(rom_data, off)
            print("};\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
