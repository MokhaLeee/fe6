#!/usr/bin/python3
# -*- coding: UTF-8 -*-

from fe6db import JID_DICT
import sys
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

def dump_one_group(rom_data, off):
    pointer = off | 0x08000000
    name = try_get_ptr_symbol(pointer)
    if name is None:
        name = f"Unk_{off + 0x08000000:08X}"

    print(f"CONST_DATA u8 {name}[] = " + "{")

    while True:
        jid = rom_data[off]
        off = off + 1

        if jid == 0:
            print("\n    JID_NONE")
            break
        else:
            print(f"    {JID_DICT[jid]},")

    print("};\n")
    return off

def main(args):
    rom = "fe6-base.gba"

    start = eval(args[1])
    end = eval(args[2])

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_one_group(rom_data, off)

            if off_end <= off:
                break

if __name__ == '__main__':
    main(sys.argv)
