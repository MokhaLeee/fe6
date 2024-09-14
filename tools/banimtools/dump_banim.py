#!/bin/python3

import os, sys, struct
import array
from PIL import Image
import lzss_lib

import rom_def
import dump_banim_frame
import dump_banim_script
import dump_banim_oam

from rom_def import BANIM_MODES

abbr_count = {}

class Symbol:
    def __init__(self, ptr, prefix, name, is_img=False):
        self.ptr = ptr
        self.prefix = prefix
        self.name = name
        self.is_img = is_img

all_symbols = []

def sort_symbols(symbols):
    seen_ptrs = set()
    unique_symbols = []

    for symbol in symbols:
        if symbol.ptr not in seen_ptrs:
            seen_ptrs.add(symbol.ptr)
            unique_symbols.append(symbol)

    return sorted(unique_symbols, key=lambda x: x.ptr)

def dump_scr_frame(img_addr, pal_addr, out_png):
    img_bytes = lzss_lib.lz77_decomp_data(img_addr)
    pal_bytes = lzss_lib.lz77_decomp_data(pal_addr)
    img_data = array.array('B', img_bytes)
    img = dump_banim_frame.create_image_from_4bpp(img_data, pal_bytes, 256, 64)
    img.save(out_png)

def dump_modes(prefix, addr):
    offset = addr & 0x00FFFFFF

    with open(rom_def.ROM, "rb") as f:
        f.seek(offset)
        data = f.read(12 * 2 * 4)

        for i in range(12):
            scr_offset = int.from_bytes(data[i*4 : i*4+4], 'little')
            print(f"    .word BANIM_SCR_{prefix}_{BANIM_MODES[i]} - BANIM_SCR_{prefix}_START @ 0x{scr_offset:X}")

        for i in range(12):
            print(f"    .word 0")

def dump_one_banim_data_ent(addr, out_dir):
    global abbr_count, all_symbols
    struct_format = '12s 5I'

    with open(rom_def.ROM, "rb") as f:
        f.seek(addr)
        data = f.read(32)

    abbr, modes, script, oam_r, oam_l, pal = struct.unpack(struct_format, data)

    abbr_str = abbr.decode('utf-8').rstrip(chr(0))
    if abbr_str in abbr_count:
        abbr_count[abbr_str] += 1
        abbr_str = f"{abbr_str}_{abbr_count[abbr_str]}"
    else:
        abbr_count[abbr_str] = 1

    all_symbols.append(Symbol(modes, abbr_str, f"BANIM_MODE_{abbr_str}"))
    all_symbols.append(Symbol(script, abbr_str, f"BANIM_SCR_{abbr_str}"))
    all_symbols.append(Symbol(oam_r, abbr_str, f"BANIM_OAMR_{abbr_str}"))
    all_symbols.append(Symbol(oam_l, abbr_str, f"BANIM_OAML_{abbr_str}"))
    all_symbols.append(Symbol(pal, abbr_str, f"BANIM_PAL_{abbr_str}"))

    out_dir_ext = f"{out_dir}/{abbr_str}"
    os.makedirs(out_dir_ext, exist_ok=True)
    out_sfile = f"{out_dir_ext}/{abbr_str}.s"

    with open(out_sfile, 'w') as file:

        original_stdout = sys.stdout
        sys.stdout = file

        try:
            print("")
            print(".section .data.oamr")
            dump_banim_oam.dump_banim_oam_r(abbr_str, oam_r)

            print("")
            print(".section .data.oaml")
            dump_banim_oam.dump_banim_oam_l(abbr_str, oam_l)

            print("")
            print(".section .data.script")
            anim_frames = dump_banim_script.dump_banim_script(abbr_str, script)

            anim_frames = list(set(anim_frames))
            anim_frames.sort()

            print("")
            print(".section .data.modes")
            dump_modes(abbr_str, modes)

            print("")
            print(".section .data.frames")
            dump_banim_frame.dump_banim_frames(abbr_str, anim_frames, pal, out_dir_ext)

            for i, img_addr in enumerate(anim_frames):
                all_symbols.append(Symbol(img_addr, abbr_str, f"BANIM_IMG_{abbr_str}_{i}", True))

        finally:
            sys.stdout = original_stdout


def main(args):
    global all_symbols

    for i in range(122):
        dump_one_banim_data_ent(0x6A0008 + i * 32, "data/banims")

    print("    .data")
    sorted_symbols = sort_symbols(all_symbols)
    for i, symbol in enumerate(sorted_symbols):
        print(f"    .global {symbol.name}")
        print(f"{symbol.name}: @ 0x{symbol.ptr:08X}")
        if symbol.is_img:
            print(f"    .incbin \"data/banims/{symbol.prefix}/{symbol.name}.4bpp.lz\"")
        else:
            end = 0x7E989C # hardcoded lol
            if i < (len(sorted_symbols) - 1):
                end = sorted_symbols[i + 1].ptr

            print(f"    .incbin \"fe6-base.gba\", 0x{(symbol.ptr & 0x00FFFFFF):06X}, 0x{(end & 0x00FFFFFF):06X} - 0x{(symbol.ptr & 0x00FFFFFF):06X}")

        print("")

if __name__ == '__main__':
    main(sys.argv)
