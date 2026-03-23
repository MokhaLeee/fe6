#!/bin/python3

import sys

def read_rom_words(rom_filename):
    words = []

    with open(rom_filename, 'rb') as rom:
        while True:
            word = rom.read(4)

            if word == b'':
                break

            words.append(word)

    return words

def pointer_iter(rom_filename, off, len):
    words = []

    with open(rom_filename, 'rb') as rom:
        while True:
            word = rom.read(4)

            if word == b'':
                break

            words.append(word)

    return words

    words  = read_rom_words(rom_filename)

    return (i * 4 for i, word in enumerate(words) if word == target)

def pointer_offsets(rom_filename, value):
    return tuple(pointer_iter(rom_filename, value))

def main(args):
    rom = "fe6-base.gba"
    rom_addr_base = 0x08000000

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
            ptr = int.from_bytes(rom_data[off:off + 4], 'little')
            
            if   ptr > 0x08000000 and ptr < 0x0A000000:
                print(f"ROM:   [0x{off:06X}]=0x{ptr:08X}")
            elif ptr > 0x02000000 and ptr < 0x02040000:
                print(f"EWROM: [0x{off:06X}]=0x{ptr:08X}")
            elif ptr > 0x03000000 and ptr < 0x03008000:
                print(f"IWROM: [0x{off:06X}]=0x{ptr:08X}")

            off = off + 4
            if off >= off_end:
                break


if __name__ == '__main__':
    main(sys.argv)
