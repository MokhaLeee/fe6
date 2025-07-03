#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
import fe6db

# ========================================================================
elf = "fe6.elf"
with open(elf, 'rb') as f:
	_symbols = { addr: name for addr, name in symbols.from_elf(f) }

def try_get_ptr_symbol(val):
	is_symbol = False

	ptr = val

	if ptr > 0x08000000 and ptr < 0x09000000:
		is_symbol = True
	if ptr > 0x02000000 and ptr < 0x02040000:
		is_symbol = True
	if ptr > 0x03000000 and ptr < 0x03008000:
		is_symbol = True

	if ptr not in _symbols:
		is_symbol = False

	if is_symbol == True:
		return _symbols[ptr]
	else:
		return f"(void *){hex(val)}"

def get_sym_name_direct(off):
	ptr = 0x08000000 | off
	if ptr in _symbols:
		scr_name = _symbols[ptr]
	else:
		scr_name = f"0x{ptr:08X}"

	return scr_name

def get_sym_name(off, preload):
	ptr = 0x08000000 | off
	if ptr in _symbols:
		scr_name = _symbols[ptr]
	elif preload != "":
		scr_name = f"{preload}_{ptr:08X}"
	else:
		scr_name = f"0x{ptr:08X}"

	return scr_name
# ========================================================================

def dump_one_part(rom_data, off):
	scr_name = get_sym_name(off, "HelpInfo")

	print(f"// 0x{off + 0x08000000:07X}")
	print(f"CONST_DATA struct HelpBoxInfo {scr_name} = " + "{")

	addr = int.from_bytes(rom_data[off + 0x00:off + 0x04], 'little')
	if addr != 0:
		hp_name = get_sym_name(addr, "HelpInfo")
		print(f"\t.adjacent_up =    &{hp_name},")

	addr = int.from_bytes(rom_data[off + 0x04:off + 0x08], 'little')
	if addr != 0:
		hp_name = get_sym_name(addr, "HelpInfo")
		print(f"\t.adjacent_down =  &{hp_name},")

	addr = int.from_bytes(rom_data[off + 0x08:off + 0x0C], 'little')
	if addr != 0:
		hp_name = get_sym_name(addr, "HelpInfo")
		print(f"\t.adjacent_left =  &{hp_name},")

	addr = int.from_bytes(rom_data[off + 0x0C:off + 0x10], 'little')
	if addr != 0:
		hp_name = get_sym_name(addr, "HelpInfo")
		print(f"\t.adjacent_right = &{hp_name},")

	x = rom_data[off + 0x10]
	print(f"\t.x = 0x{x:02X},")
	y = rom_data[off + 0x11]
	print(f"\t.y = 0x{y:02X},")

	msg = int.from_bytes(rom_data[off + 0x12:off + 0x14], 'little')
	if msg != 0:
		print(f"\t.msg = MSG_{msg:03X},")

	redirect = int.from_bytes(rom_data[off + 0x14:off + 0x18], 'little')
	if redirect != 0:
		print(f"\t.redirect = {get_sym_name_direct(redirect)},")

	populate = int.from_bytes(rom_data[off + 0x18:off + 0x1C], 'little')
	if populate != 0:
		print(f"\t.populate = {get_sym_name_direct(populate)},")

	print("};\n")
	return off + 0x1C

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
