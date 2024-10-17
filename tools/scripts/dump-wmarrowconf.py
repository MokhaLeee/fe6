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

def dump_one_part(rom_data, off):
    _buf = int.from_bytes(rom_data[off:off + 4], 'little')
    buf = try_get_ptr_symbol(_buf)
    unk_04 = int.from_bytes(rom_data[off + 4:off + 6], 'little')
    unk_06 = int.from_bytes(rom_data[off + 6:off + 8], 'little')
    unk_08 = rom_data[off + 8]
    unk_09 = rom_data[off + 9]
    unk_0A = int.from_bytes(rom_data[off + 10:off + 12], 'little')

    print("    { " + f"{buf}, 0x{unk_04:04X}, 0x{unk_06:04X}, 0x{unk_08:02X}, 0x{unk_09:02X}, 0x{unk_0A:04X}" + " },")
    return off + 12

def main(args):
    rom = "fe6-base.gba"

    start = 0x68C414
    end   = 0x68C648

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
