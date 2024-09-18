#!/bin/python3

import sys, struct, os
import array
from PIL import Image

import lzss_lib
from dump_banim import Symbol

def read_palette_from_binary(palette_data):
    palette = []
    palette_len = len(palette_data)
    for i in range(0, palette_len, 2):
        color = struct.unpack('<H', palette_data[i:i+2])[0]
        r = (color & 0x1F) << 3 
        g = ((color >> 5) & 0x1F) << 3
        b = ((color >> 10) & 0x1F) << 3

        palette.append(r)
        palette.append(g)
        palette.append(b)

    return palette

def create_image_from_4bpp(img_data, pal_bytes, width, height):
    img = Image.new('P', (width, height))

    pal_data = read_palette_from_binary(pal_bytes)

    t_width = width  // 8
    t_hight = height // 8
    tiles_8x8 = t_width * t_hight

    pixels = [0] * (width * height)

    for tile_idx in range(tiles_8x8):
        base_y = tile_idx // t_width
        base_x = tile_idx % t_width

        for y in range(8):
            for x in range(0, 8, 2):
                offset = tile_idx * (8 * 8 // 2) + y * (8 // 2) + (x // 2)

                byte = img_data[offset]

                pixel1 = byte & 0x0F
                pixel2 = (byte >> 4) & 0x0F

                real_x = x + base_x * 8
                real_y = y + base_y * 8

                pixels[real_x + 0 + real_y * width] = pixel1
                pixels[real_x + 1 + real_y * width] = pixel2

    img.putpalette(pal_data)
    img.putdata(pixels)
    return img

def dump_banim_pal(pal_bytes, _abbr_str, out_dir):
    pal_fpath = f"{out_dir}/BANIM_PAL_{_abbr_str}.agbpal"
    if not os.path.exists(pal_fpath):
        with open(pal_fpath, 'wb') as fpal:
            fpal.write(pal_bytes)

def dump_banim_frames(prefix, _abbr_str, anim_frames, all_symbols, pal_addr, out_dir):
    pal_bytes = lzss_lib.lz77_decomp_data(pal_addr)

    dump_banim_pal(pal_bytes, _abbr_str, out_dir)

    for i, img_addr in enumerate(anim_frames):
        exists = False
        for symbol in all_symbols:
            if (symbol.ptr & 0x00FFFFFF) == (img_addr & 0x00FFFFFF):
                exists = True
                break

        if not exists:
            img_bytes = lzss_lib.lz77_decomp_data(img_addr)
            img_data = array.array('B', img_bytes)
            img = create_image_from_4bpp(img_data, pal_bytes, 256, 64)

            frame_name = f"BANIM_IMG_{prefix}_{i}"
            fpath = f"{out_dir}/{frame_name}.png"


            # print(f"{frame_name}: @ 0x{img_addr:08X}")
            # print(f"    .incbin {out_dir}/{frame_name}.4bpp.lz")
            # print("")

            os.makedirs(out_dir, exist_ok=True)
            img.save(fpath)
