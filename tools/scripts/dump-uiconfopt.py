#!/bin/python3

import sys, ctypes

def dump_one_part(rom_data, off):
    print("    {")

    _offset = 0

    msg = int.from_bytes(rom_data[off:off + 2], 'little') - 0x8B6
    _offset = _offset + 4
    print(f"        .msg = MSG_CONFIG_{msg},")

    print( "        .selectors = {")

    desc = int.from_bytes(rom_data[off + _offset + 0:off + _offset + 2], 'little')
    name = int.from_bytes(rom_data[off + _offset + 2:off + _offset + 4], 'little')
    x = rom_data[off + _offset + 4]
    unk_05 = rom_data[off + _offset + 5]
    _offset = _offset + 8
    if desc == 0 and name == 0 and x == 0 and unk_05 == 0:
        print("            { 0 },")
    else:
        print("            { " + f"MSG_CONFIG_{desc - 0x8B6}, MSG_CONFIG_{name - 0x8B6}, 0x{x:02X}, 0x{unk_05:02X}" + " },")

    desc = int.from_bytes(rom_data[off + _offset + 0:off + _offset + 2], 'little')
    name = int.from_bytes(rom_data[off + _offset + 2:off + _offset + 4], 'little')
    x = rom_data[off + _offset + 4]
    unk_05 = rom_data[off + _offset + 5]
    _offset = _offset + 8
    if desc == 0 and name == 0 and x == 0 and unk_05 == 0:
        print("            { 0 },")
    else:
        print("            { " + f"MSG_CONFIG_{desc - 0x8B6}, MSG_CONFIG_{name - 0x8B6}, 0x{x:02X}, 0x{unk_05:02X}" + " },")

    desc = int.from_bytes(rom_data[off + _offset + 0:off + _offset + 2], 'little')
    name = int.from_bytes(rom_data[off + _offset + 2:off + _offset + 4], 'little')
    x = rom_data[off + _offset + 4]
    unk_05 = rom_data[off + _offset + 5]
    _offset = _offset + 8
    if desc == 0 and name == 0 and x == 0 and unk_05 == 0:
        print("            { 0 },")
    else:
        print("            { " + f"MSG_CONFIG_{desc - 0x8B6}, MSG_CONFIG_{name - 0x8B6}, 0x{x:02X}, 0x{unk_05:02X}" + " },")

    desc = int.from_bytes(rom_data[off + _offset + 0:off + _offset + 2], 'little')
    name = int.from_bytes(rom_data[off + _offset + 2:off + _offset + 4], 'little')
    x = rom_data[off + _offset + 4]
    unk_05 = rom_data[off + _offset + 5]
    _offset = _offset + 8
    if desc == 0 and name == 0 and x == 0 and unk_05 == 0:
        print("            { 0 },")
    else:
        print("            { " + f"MSG_CONFIG_{desc - 0x8B6}, MSG_CONFIG_{name - 0x8B6}, 0x{x:02X}, 0x{unk_05:02X}" + " },")

    print( "        },")

    icon_chr = rom_data[off + 0x24]
    print(f"        .icon_chr = 0x{icon_chr:02X},")

    func = int.from_bytes(rom_data[off + 0x28:off + 0x2C], 'little')
    print(f"        .func = (void *)0x{func:08X},")

    print("    },\n")

    off = off + 0x2C
    return off

def main(args):
    rom = "fe6-base.gba"

    start = 0x68AB3C
    end   = 0x68ADA4

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("CONST_DATA struct UiConfigOption gUiConfigOptions[] = {")

        while True:
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

        print("};")
        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
