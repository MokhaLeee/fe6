#!/bin/python3

import sys

from PIL import Image
import numpy as np

ROM="fe6-base.gba"

def convert_png_to_gba_4bpp(png_path):
    img = Image.open(png_path).convert('P')
    img_width, img_height = img.size
    palette = img.getpalette()
    img_data = np.array(img)

    data_4bpp = []

    t_width = img_width  // 8
    t_hight = img_height // 8
    tiles_8x8 = t_width * t_hight

    for tile_idx in range(tiles_8x8):
        base_y = tile_idx // t_width
        base_x = tile_idx % t_width

        for y in range(8):
            for x in range(0, 8, 2):
                real_x = x + base_x * 8
                real_y = y + base_y * 8

                px1 = img_data[real_y, real_x + 0]
                px2 = img_data[real_y, real_x + 1]

                data_4bpp.append((px2 << 4)| px1)

    return data_4bpp

def main(args):
    input_png  = args[1]
    output_bin = args[2]

    with open(output_bin, "wb") as f:
        data_4bpp = convert_png_to_gba_4bpp(input_png)
        f.write(bytes(data_4bpp))

if __name__ == '__main__':
    main(sys.argv)
