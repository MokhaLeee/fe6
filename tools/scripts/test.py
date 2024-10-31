#!/usr/bin/python3

import fe6db

with open("fe6-base.gba", 'rb') as f:
    rom_data = f.read()

for iid, iinfo in fe6db.all_iinfo(rom_data):
    print(f"    [{fe6db.IID_DICT[iid]}] =")
