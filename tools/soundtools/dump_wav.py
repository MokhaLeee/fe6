#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
import dump_sound
import local_util

def dump_wave(wav, rom_data):
	print(".align 2, 0")
	print(f".global {wav.name}")
	print(f"{wav.name}: @ {wav.addr:08X}")
	local_util.format_print(f".short 0x{wav.type:X}", "type")
	local_util.format_print(f".short 0x{wav.status:X}", "status")
	local_util.format_print(f".word  0x{wav.freq:08X}", "freq")
	local_util.format_print(f".word  0x{wav.loopStart:X}", "loopStart")
	local_util.format_print(f".word  0x{wav.size:X}", "size")

	len = wav.size

	# align
	if (len % 4) != 0:
		align_len = (4 - (len % 4))
	else:
		align_len = 4

	# print(f"@ len=0x{len:04X} size=0x{wav.size:04X}")

	if False:
		print("    .byte ", end=' ')
		for i in range(len):
			print(f"0x{rom_data[wav.addr + 0x10 + i]:02X}", end='')

			if i >= (len - 1):
				print("")
			elif (i + 1) % 16 == 0:
				print("")
				print("    .byte ", end=' ')
			else:
				print(",", end=' ')
	else:
		print(f"    .incbin \"fe6-base.gba\", 0x{(wav.addr + 0x10):06X}, 0x{len:X} + 0x{align_len:X}")

	print("")

	return len + align_len

def dump_one(off, rom_data):
	wav = dump_sound.WaveData(rom_data, local_util.addr_filter(off), 0)

	len = dump_wave(wav, rom_data)
	return off + len + 0x10

def main(args):
	try:
		start = 0x1FFFFFF & int(args[1], base = 0)
	except IndexError:
		sys.exit(f"Usage: {sys.argv[0]} START [END]")

	try:
		end = 0x1FFFFFF & int(args[2], base = 0)
	except IndexError:
		end = start

	off = start

	with open(local_util.rom, 'rb') as f:
		rom_data = f.read()

	print(".section .rodata")

	while True:
		off = dump_one(off, rom_data)
		if off > end:
			break

if __name__ == '__main__':
	main(sys.argv)
