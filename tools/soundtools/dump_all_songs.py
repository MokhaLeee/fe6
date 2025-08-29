#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
from local_util import *
from dump_sound import *

SONGTABLE_AMT = 0x26D
PR_SONGTABLE  = 0x3994D8

LOCAL_CONFIG_DUMP_TONE = False
LOCAL_CONFIG_DUMP_SONG_TABLE = False

SKIPPED_SONGS = [] # list(range(1, 0x47)) + [0x54, 0x55, 0x56]

class Song:
	def __init__(self, name, header, ms, me):
		self.name = name
		self.header = header
		self.ms = ms
		self.me = me

if __name__ == '__main__':
	# addr = eval(sys.argv[1]) & 0x07FFFFFF

	wav_groups = []
	songs = []

	with open(rom, 'rb') as f:
		rom_data = f.read()

	print(
'''.include "MPlayDef.s"
.include "asm_m4a.inc"
.section .rodata
'''
	)

	dummy_sound_addr = 0x0839A840

	for i in range(SONGTABLE_AMT):

		song_addr   = PR_SONGTABLE + 8 * i
		header_addr = ReadU32(rom_data, song_addr + 0)

		if header_addr == dummy_sound_addr:
			song = Song("dummy_song", None, 0, 0)
		elif i in SKIPPED_SONGS:
			song = Song("dummy_song", None, 0, 0)
		else:
			song_name = f"song_{i:03X}"

			header = dump_one_song(rom_data, header_addr, song_name, wav_groups)
			song = Song(song_name, header, ReadU16(rom_data, song_addr + 4), ReadU16(rom_data, song_addr + 6))
			print("")

		songs.append(song)

	if LOCAL_CONFIG_DUMP_TONE:
		print("")
		print("@ ******************************** WAVs ******************************")
		dump_all_wavs(rom_data, wav_groups)

	if LOCAL_CONFIG_DUMP_SONG_TABLE:
		print("")
		print("@ ***************************** SongTable ****************************")
		print(".align 4")
		print(".global NewSongTable")
		print("NewSongTable:")
		for song in songs:
			print(f"    song {song.name}, {song.ms}, {song.me}")
