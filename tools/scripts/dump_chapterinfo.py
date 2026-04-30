#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe6db import CHAPTER_DICT, WEATHERS

def dump_string(rom_data, ptr):
    off = ptr & 0x01FFFFFF
    array = bytearray(b'')

    i = 0
    while True:
        byte = rom_data[off + i]
        i = i + 1

        if byte == 0:
            break

        array.append(byte)

    return f"{array.decode('ascii')}".replace('\n', '\\n')

def dump_one_part(rom_data, off, i):
    pr_debug_name = int.from_bytes(rom_data[off + 0x0:off + 0x4], 'little')
    debug_name = dump_string(rom_data, pr_debug_name)

    print(f"\t[{CHAPTER_DICT[i]}] = " + "{")
    print(f"\t\t.debug_name = \"{debug_name}\",")

    asset_img_a = rom_data[off + 4]
    if asset_img_a != 0:
        print(f"\t\t.asset_img_a = CHAPTER_ASSET(0x{asset_img_a:02X}),")

    asset_img_b = rom_data[off + 5]
    if asset_img_b != 0:
        print(f"\t\t.asset_img_b = CHAPTER_ASSET(0x{asset_img_b:02X}),")

    asset_pal = rom_data[off + 6]
    if asset_pal != 0:
        print(f"\t\t.asset_pal = CHAPTER_ASSET(0x{asset_pal:02X}),")

    asset_tileset = rom_data[off + 7]
    if asset_tileset != 0:
        print(f"\t\t.asset_tileset = CHAPTER_ASSET(0x{asset_tileset:02X}),")

    asset_map = rom_data[off + 8]
    if asset_map != 0:
        print(f"\t\t.asset_map = CHAPTER_ASSET(0x{asset_map:02X}),")

    asset_img_anims = rom_data[off + 9]
    if asset_img_anims != 0:
        print(f"\t\t.asset_img_anims = CHAPTER_ASSET(0x{asset_img_anims:02X}),")

    asset_pal_anims = rom_data[off + 10]
    if asset_pal_anims != 0:
        print(f"\t\t.asset_pal_anims = CHAPTER_ASSET(0x{asset_pal_anims:02X}),")

    asset_map_changes = rom_data[off + 11]
    if asset_map_changes != 0:
        print(f"\t\t.asset_map_changes = CHAPTER_ASSET(0x{asset_map_changes:02X}),")

    fog = rom_data[off + 12]
    if fog != 0:
        print(f"\t\t.fog = {fog},")

    has_prep = rom_data[off + 13]
    if has_prep == 0:
        print(f"\t\t.has_prep = false,")
    elif has_prep == 1:
        print(f"\t\t.has_prep = true,")
    else:
        print(f"\t\t.has_prep = {has_prep},")

    title_id = rom_data[off + 14]
    if title_id == 41:
        print(f"\t\t.title_id = CHAPTER_TITLE_MAX,")
    else:
        print(f"\t\t.title_id = CHAPTER_TITLE({title_id}),")

    coord_x = rom_data[off + 15]
    if coord_x != 0:
        print(f"\t\t.coord_x = {coord_x},")

    coord_y = rom_data[off + 16]
    if coord_y != 0:
        print(f"\t\t.coord_y = {coord_y},")

    weather = rom_data[off + 17]
    if weather != 0:
        print(f"\t\t.weather = {WEATHERS[weather]},")

    banim_terrain_id = rom_data[off + 0x12]
    if banim_terrain_id != 0:
        print(f"\t\t.banim_terrain_id = BANIM_TERRAIN_SET_{banim_terrain_id},")

    hard_bonus_levels = rom_data[off + 0x13]
    if hard_bonus_levels != 0:
        print(f"\t\t.hard_bonus_levels = {hard_bonus_levels},")

    song_blue_bgm = rom_data[off + 0x14]
    if song_blue_bgm != 0:
        print(f"\t\t.song_blue_bgm    = SONG_{song_blue_bgm:02X},")

    song_red_bgm = rom_data[off + 0x15]
    if song_red_bgm != 0:
        print(f"\t\t.song_red_bgm     = SONG_{song_red_bgm:02X},")

    song_green_bgm = rom_data[off + 0x16]
    if song_green_bgm != 0:
        print(f"\t\t.song_green_bgm   = SONG_{song_green_bgm:02X},")

    song_intro_bgm = rom_data[off + 0x17]
    if song_intro_bgm != 0:
        print(f"\t\t.song_intro_bgm   = SONG_{song_intro_bgm:02X},")

    song_opening_bgm = rom_data[off + 0x18]
    if song_opening_bgm != 0:
        print(f"\t\t.song_opening_bgm = SONG_{song_opening_bgm:02X},")

    wall_hp = rom_data[off + 0x19]
    if wall_hp != 0:
        print(f"\t\t.wall_hp = {wall_hp},")

    class_roll_set = rom_data[off + 0x1A]
    if class_roll_set != 0:
        print(f"\t\t.class_roll_set = CLASSDEMO_SET{class_roll_set},")

    print("\t\t.tactics_ranks = { " + f"{rom_data[off + 0x1B]}, {rom_data[off + 0x1C]}, {rom_data[off + 0x1D]}, {rom_data[off + 0x1E]}" + " },")

    exp_ranks0 = int.from_bytes(rom_data[off + 0x20:off + 0x22], 'little')
    exp_ranks1 = int.from_bytes(rom_data[off + 0x22:off + 0x24], 'little')
    exp_ranks2 = int.from_bytes(rom_data[off + 0x24:off + 0x26], 'little')
    exp_ranks3 = int.from_bytes(rom_data[off + 0x26:off + 0x28], 'little')
    print("\t\t.exp_ranks = { " + f"{exp_ranks0}, {exp_ranks1}, {exp_ranks2}, {exp_ranks3}" + " },")

    combat_ranks0 = int.from_bytes(rom_data[off + 0x28:off + 0x2A], 'little')
    combat_ranks1 = int.from_bytes(rom_data[off + 0x2A:off + 0x2C], 'little')
    combat_ranks2 = int.from_bytes(rom_data[off + 0x2C:off + 0x2E], 'little')
    combat_ranks3 = int.from_bytes(rom_data[off + 0x2E:off + 0x30], 'little')
    print("\t\t.combat_ranks = { " + f"{combat_ranks0}, {combat_ranks1}, {combat_ranks2}, {combat_ranks3}" + " },")

    msg = int.from_bytes(rom_data[off + 0x30:off + 0x32], 'little')
    if msg != 0:
        print(f"\t\t.msg_clear_condition = MSG_{msg:03X},")

    msg = int.from_bytes(rom_data[off + 0x32:off + 0x34], 'little')
    if msg != 0:
        print(f"\t\t.msg_upper_army = MSG_{msg:03X},")

    msg = int.from_bytes(rom_data[off + 0x34:off + 0x36], 'little')
    if msg != 0:
        print(f"\t\t.msg_lower_army = MSG_{msg:03X},")

    enemy_flag_chibi = int.from_bytes(rom_data[off + 0x36:off + 0x38], 'little')
    if enemy_flag_chibi != 0:
        print(f"\t\t.enemy_flag_chibi = {enemy_flag_chibi},")

    msg = int.from_bytes(rom_data[off + 0x38:off + 0x3A], 'little')
    if msg != 0:
        if msg >= 0x0B6E and msg <= 0x0B93:
            msg = msg - 0x0B6E
            print(f"\t\t.msg_chapter_title = MSG_CHAPTERTITLE_{msg:02X},")
        else:
            print(f"\t\t.msg_chapter_title = MSG_{msg:03X},")

    asset = rom_data[off + 0x3A]
    if asset != 0:
        print(f"\t\t.asset_event_info = CHAPTER_ASSET(0x{asset:02X}),")

    asset = rom_data[off + 0x3B]
    if asset != 0:
        print(f"\t\t.asset_event_info_wm = CHAPTER_ASSET(0x{asset:02X}),")

    msg = int.from_bytes(rom_data[off + 0x3C:off + 0x3E], 'little')
    if msg != 0:
        if msg >= 0x0C49 and msg <= 0x0C6F:
            msg = msg - 0x0C49
            print(f"\t\t.msg_wm_location = MSG_LOCATION_{msg:02X},")
        else:
            print(f"\t\t.msg_wm_location = MSG_{msg:03X},")

    index_gaiden = rom_data[off + 0x3E]
    gaiden = index_gaiden & 1
    index = index_gaiden >> 1
    if gaiden == 0:
        _gaiden = "false"
    else:
        _gaiden = "true"
    print(f"\t\t.index_gaiden = ({index} << 1) | {_gaiden},")

    gmap_dispx = rom_data[off + 0x3F]
    gmap_dispy = rom_data[off + 0x40]
    gmap_cursorx = rom_data[off + 0x41]
    gmap_cursory = rom_data[off + 0x42]
    print(f"\t\t.gmap_dispx = 0x{gmap_dispx:X},")
    print(f"\t\t.gmap_dispy = 0x{gmap_dispy:X},")
    print(f"\t\t.gmap_cursorx = 0x{gmap_cursorx:X},")
    print(f"\t\t.gmap_cursory = 0x{gmap_cursory:X},")

    victory_bgm_enemy_threshold = rom_data[off + 0x43]
    if victory_bgm_enemy_threshold == 0xFF:
        victory_bgm_enemy_threshold = -1
    print(f"\t\t.victory_bgm_enemy_threshold = {victory_bgm_enemy_threshold},")

    data = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    # print(f"\t0x{data:X},")

    print("\t},")
    return off + 0x44

def main(args):
    rom = "fe6-base.gba"

    try:
        start = eval(args[1])
    except IndexError:
        # sys.exit(f"Usage: {args[0]} START [END]")
        start = 0x6637A4

    try:
        end = eval(args[2])
    except IndexError:
        # end = 0
        end = 0x664398

    try:
        prefix = args[3]
    except IndexError:
        prefix = "gUnk"

    off     = start & 0x01FFFFFF
    off_end = end   & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        i = 0
        while True:
            off = dump_one_part(rom_data, off, i)

            if off_end <= off:
                break

            i = i + 1

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
