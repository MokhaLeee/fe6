#!/bin/python3

import sys
import dump_one_sprite

def _dump_sprite(rom_data, off):
    name = f"Sprite_{off + 0x08000000:08X}"
    print(f"u16 CONST_DATA {name}[] =")
    print("{")

    num_oam = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    print("    {},".format(num_oam))

    for _ in range(num_oam):
        oam0 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
        oam1 = int.from_bytes(rom_data[off + 2:off + 4], 'little')
        oam2 = int.from_bytes(rom_data[off + 4:off + 6], 'little')
        off = off + 6

        affine = oam0 & 0x0100 != 0

        shape = dump_one_sprite.get_shape(oam0, oam1)

        print("    {}, {}, {},".format(
            dump_one_sprite.pretty_oam0(oam0, affine, shape),
            dump_one_sprite.pretty_oam1(oam1, affine, shape),
            dump_one_sprite.pretty_oam2(oam2)))

    print("};\n")
    return off

def main(args):
    rom = "fe6.gba"

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
            off = _dump_sprite(rom_data, off)
            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
