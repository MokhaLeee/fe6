#!/bin/python3

import sys, struct
from PIL import Image
import lzss

ROM = "fe6-base.gba"

def lz77_decomp_data(offset):
    with open(ROM, "rb") as f:
        f.seek(offset)
        return lzss.lz77_decompress(f.read())

def read_palette_from_binary(palette_data):
    palette = []
    for i in range(0, len(palette_data), 2):
        color = struct.unpack('<H', palette_data[i:i+2])[0]
        r = (color & 0x1F) << 3 
        g = ((color >> 5) & 0x1F) << 3
        b = ((color >> 10) & 0x1F) << 3
        palette.append((r, g, b))

    return palette

def create_image_from_4bpp(image_data, palette_data, width, height):
    img = Image.new('RGB', (width, height))
    pixels = img.load()

    palette = read_palette_from_binary(palette_data)

    for y in range(height):
        for x in range(0, width, 2):
            byte = image_data[(y * width + x) // 2]

            pixel1 = byte & 0x0F
            pixel2 = (byte >> 4) & 0x0F

            pixels[x, y] = palette[pixel1]
            pixels[x + 1, y] = palette[pixel2]

    return img

def save_to_file(filename, data):
    with open(filename, "wb") as f:
        f.write(data)

def main(args):

    img_data = lz77_decomp_data(0x6A1000)
    pal_data = lz77_decomp_data(0x6A41E8)
    img = create_image_from_4bpp(img_data, pal_data, 256, 64)
    save_to_file("out.bin", img_data)
    img.save("out.png")

if __name__ == '__main__':
    main(sys.argv)
