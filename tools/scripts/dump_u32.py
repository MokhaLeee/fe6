#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import JID_DICT

def dump_one_part(rom_data, off):
	val1 = int.from_bytes(rom_data[off + 0: off + 4],  'little')
	val2 = int.from_bytes(rom_data[off + 4: off + 8],  'little')
	val3 = int.from_bytes(rom_data[off + 8: off + 12], 'little')
	val4 = int.from_bytes(rom_data[off + 12:off + 16], 'little')

	print(f"{val1}, {val2}, {val3}, {val4}")
	# print(f"0x{val1:04X}, 0x{val2:04X}, 0x{val3:04X}, 0x{val4:04X}")

	return off + 16

def main(args):
	rom = "fe6-base.gba"

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
			off = dump_one_part(rom_data, off)

			if off_end <= off:
				break

		print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
	main(sys.argv)
