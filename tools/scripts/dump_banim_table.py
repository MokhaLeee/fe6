#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
import elf2sym
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
    abbr_data = rom_data[off:off + 12]
    off = off + 12
    abbr_endoff = abbr_data.find(b'\0')
    print(f"        .abbr = \"{abbr_data[0:abbr_endoff].decode('ascii')}\",")

    modes_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    mode_name = try_get_ptr_symbol(modes_ptr)
    if mode_name is None:
        mode_name = f"0x{modes_ptr:08X}"
    print(f"        .modes = {mode_name},")

    scr_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    scr_name = try_get_ptr_symbol(scr_ptr)
    if scr_name is None:
        scr_name = f"0x{scr_ptr:08X}"
    print(f"        .script = {scr_name},")

    oamr_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    oamr_name = try_get_ptr_symbol(oamr_ptr)
    if oamr_name is None:
        oamr_name = f"0x{oamr_ptr:08X}"
    print(f"        .oam_r = {oamr_name},")

    oaml_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    oaml_name = try_get_ptr_symbol(oaml_ptr)
    if oaml_name is None:
        oaml_name = f"0x{oaml_ptr:08X}"
    print(f"        .oam_l = {oaml_name},")

    pal_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    pal_name = try_get_ptr_symbol(pal_ptr)
    if pal_name is None:
        pal_name = f"0x{pal_ptr:08X}"
    print(f"        .pal = {pal_name},")

    return off

def dump_one_part_banimdef(rom_data, off):
    abbr_data = rom_data[off:off + 12]
    off = off + 12
    abbr_endoff = abbr_data.find(b'\0')

    modes_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    mode_name = try_get_ptr_symbol(modes_ptr)
    if mode_name is None:
        mode_name = f"0x{modes_ptr:08X}"
    print(f"extern int {mode_name}[];")

    scr_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    scr_name = try_get_ptr_symbol(scr_ptr)
    if scr_name is None:
        scr_name = f"0x{scr_ptr:08X}"
    print(f"extern u32 {scr_name}[];")

    oamr_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    oamr_name = try_get_ptr_symbol(oamr_ptr)
    if oamr_name is None:
        oamr_name = f"0x{oamr_ptr:08X}"
    print(f"extern u32 {oamr_name}[];")

    oaml_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    oaml_name = try_get_ptr_symbol(oaml_ptr)
    if oaml_name is None:
        oaml_name = f"0x{oaml_ptr:08X}"
    print(f"extern u32 {oaml_name}[];")

    pal_ptr = int.from_bytes(rom_data[off:off + 4], 'little')
    off = off + 4
    pal_name = try_get_ptr_symbol(pal_ptr)
    if pal_name is None:
        pal_name = f"0x{pal_ptr:08X}"
    print(f"extern u16 {pal_name}[];")

    return off

def main(args):
    rom = "fe6-base.gba"

    start = 0x6A0008
    end   = 0x6A0F48

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    index = 0
    PreName = ""

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            name = f"BANIM_{index:02X}"
            print(f"    [{name}] = ")
            print( "    {")
            off = dump_one_part(rom_data, off)
            index = index + 1
            print( "    },")
            print("")

            if off_end <= off:
                break


def main_dumpdef(args):
    rom = "fe6-base.gba"

    start = 0x6A0008
    end   = 0x6A0F48

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    index = 0
    PreName = ""

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_one_part_banimdef(rom_data, off)
            index = index + 1

            if off_end <= off:
                break

if __name__ == '__main__':
    main(sys.argv)
