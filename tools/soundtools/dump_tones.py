#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
import dump_sound
import local_util
from symbols import try_get_ptr_symbol


def dump_one(off, end, rom_data):

	i = 0

	while True:
		voice = dump_sound.ToneData(rom_data, local_util.addr_filter(off))

		wav_has_symbol = False
		wav_name = None
		if local_util.is_rom_u32(voice.wav):
			wav_name = try_get_ptr_symbol(voice.wav)
		if wav_name == None:
			wav_name = f"0x{voice.wav:08X}"
		else:
			wav_has_symbol = True

		done = False
		if voice.type == 0x80:
			done = True
			print(f"    voice_keysplit_all {wav_name}")

		elif voice.type == 0 or voice.type == 8 or voice.type == 16:
			if wav_has_symbol and voice.length == 0:
				if voice.type == 0:
					type_name = "voice_directsound"
				elif voice.type == 8:
					type_name = "voice_directsound_no_resample"
				elif voice.type == 16:
					type_name = "voice_directsound_alt"

				done = True
				print(f"    {type_name} {voice.key}, {voice.pan_sweep}, {wav_name}, 0x{voice.attack:02X}, 0x{voice.decay:02X}, 0x{voice.sustain:02X}, 0x{voice.release:02X}")

		elif voice.type == 1 or voice.type == 2 or voice.type == 9 or voice.type == 10:
			if voice.key == 60 and voice.length == 0:
				if voice.type == 1:
					done = True
					print(f"    voice_square_1 {voice.pan_sweep}, {voice.wav}, {voice.attack}, {voice.decay}, {voice.sustain}, {voice.release}")
				elif voice.type == 9:
					done = True
					print(f"    voice_square_1_alt {voice.pan_sweep}, {voice.wav}, {voice.attack}, {voice.decay}, {voice.sustain}, {voice.release}")
				elif voice.pan_sweep == 0:
					if voice.type == 2:
						done = True
						print(f"    voice_square_2 {voice.wav}, {voice.attack}, {voice.decay}, {voice.sustain}, {voice.release}")
					elif voice.type == 10:
						done = True
						print(f"    voice_square_2_alt {voice.wav}, {voice.attack}, {voice.decay}, {voice.sustain}, {voice.release}")

		elif voice.type == 3 or voice.type == 11:
			if voice.type == 3:
				type_name = "voice_programmable_wave"
			elif voice.type == 11:
				type_name = "voice_programmable_wave_alt"

			done = True
			print(f"    {type_name} {wav_name}, {voice.attack}, {voice.decay}, {voice.sustain}, {voice.release}")

		elif voice.type == 4 or voice.type == 12:
			if voice.type == 4:
				type_name = "voice_noise"
			elif voice.type == 12:
				type_name = "voice_noise_alt"

			done = True
			print(f"    {type_name} {voice.key}, {voice.length}, {voice.pan_sweep}, {voice.wav}, {voice.attack}, {voice.decay}, {voice.sustain}, {voice.release}")

		if done == False:
			print(f"    tone_data 0x{voice.type:02X}, 0x{voice.key:02X}, 0x{voice.length:02X}, 0x{voice.pan_sweep:02X}, {wav_name}, 0x{voice.attack:02X}, 0x{voice.decay:02X}, 0x{voice.sustain:02X}, 0x{voice.release:02X}")
			# print(f"    tone_data 0x{voice.type:02X}, {voice.key}, 0x{voice.length:02X}, 0x{voice.pan_sweep:02X}, {wav_name}, {voice.attack}, {voice.decay}, {voice.sustain}, {voice.release}")

		i = i + 1
		off = off + 0xC
		if try_get_ptr_symbol(off | 0x08000000) != None:
			# pass
			break

	return off

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

	print(".include \"MPlayDef.s\"")
	print(".include \"asm_m4a.inc\"")
	print(".include \"asm_music_voice.inc\"")
	print("")
	print(".section .rodata")
	print("")

	while True:
		addr = off | 0x08000000

		tone_name = try_get_ptr_symbol(addr)
		if tone_name == None:
			tone_name = f"Tone_{addr:08X}"

		print(f".global {tone_name}")
		print(f"{tone_name}: @ {addr:08X}")

		off = dump_one(off, end, rom_data)
		if off > end:
			break

		print("")

	# print(f"{off:X}")

if __name__ == '__main__':
	main(sys.argv)
