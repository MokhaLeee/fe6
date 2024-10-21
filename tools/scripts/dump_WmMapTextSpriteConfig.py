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
        return hex(val)
# ========================================================================

def dump_one_part(i, rom_data, off):
    _sprite = int.from_bytes(rom_data[off:off + 4], 'little')
    x1 = int.from_bytes(rom_data[off + 4:off + 6], 'little')
    y1 = int.from_bytes(rom_data[off + 6:off + 8], 'little')
    x2 = int.from_bytes(rom_data[off + 8:off + 10], 'little')
    y2 = int.from_bytes(rom_data[off + 10:off + 12], 'little')

    sprite = try_get_ptr_symbol(_sprite)

    print("    " + f"[0x{i:02X}] = " + "{ " + f"{sprite}, {x1}, {y1}, {x2}, {y2}" + " },")
    return off + 12

def main(args):
    rom = "fe6-base.gba"

    start = 0x68C940
    end   = 0x68C970

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        i = 0

        while True:
            off = dump_one_part(i, rom_data, off)

            i = i + 1

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
