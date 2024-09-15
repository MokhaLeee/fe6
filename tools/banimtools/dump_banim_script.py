#!/bin/python3

import struct

import lzss_lib
from symbols import try_get_ptr_symbol
from rom_def import BANIM_MODES
from dump_banim_oam import BanimOAM

class BanimSCR:
    def __init__(self, name, offset):
        self.name = name
        self.offset = offset

def find_oam(oams, off):
    print(f"Type of oams: {type(oams)}")
    for oam in oams:
        if off == oam.offset:
            return oam

    return None

def dump_banim_script(prefix, addr, oams_r):
    scr_bytes = lzss_lib.lz77_decomp_data(addr)
    scr_data  = struct.unpack(f'{len(scr_bytes) // 4}I', scr_bytes)

    ret_scrs = []

    cur = 0
    scr_idx = 0
    new_scr = True

    anim_frames = []

    # print(f".global BANIM_SCR_{prefix}")
    # print(f"BANIM_SCR_{prefix}:")
    print(f"SCR:")

    while True:
        if cur >= len(scr_data):
            break

        if new_scr:
            if scr_idx in BANIM_MODES:
                name = f"SCR_{BANIM_MODES[scr_idx]}"
            else:
                name = f"SCR_{scr_idx}"

            ret_scrs.append(BanimSCR(name, cur * 4))
            print(name + ":")
            scr_idx += 1
            new_scr = False

        data = scr_data[cur]
        inst = (0x7F000000 & data) >> 24
        cur += 1

        if (data & 0x80000000) == 0:
            time1 = data & 3
            time2 = (data >> 26) & 0x1C
            time = time1 | time2

            sprite_ptr = data & 0x08FFFFFC
            ANIM_SPRITE = try_get_ptr_symbol(sprite_ptr)
            if ANIM_SPRITE == None:
                ANIM_SPRITE = f"{sprite_ptr:08X}"

            print(f"    ANIMSCR_FORCE_SPRITE " + ANIM_SPRITE + f", {time}")

        elif inst == 0: # ANFMT_INS_TYPE_STOP
            print("    ANIMSCR_BLOCKED")
            new_scr = True
            print("")

        elif inst == 1: # ANFMT_INS_TYPE_END
            print("    ANIMSCR_DISABLED")
            new_scr = True
            print("")

        elif inst == 2: # ANFMT_INS_TYPE_LOOP
            print("    ANIMSCR_LOOP")

        elif inst == 3: # ANFMT_INS_TYPE_MOVE
            print("[ERROR]: ANFMT_INS_TYPE_MOVE")

        elif inst == 4: # ANFMT_INS_TYPE_WAIT
            time = data & 0x00FFFFFF
            print(f"    ANIMSCR_WAIT {time}")

        elif inst == 5: # ANIM_INS_TYPE_COMMAND
            cmd = data & 0xFF
            print(f"    ANIMSCR_CMD 0x{cmd:02X}") # @ 0x{data:08X}

        elif inst == 6: # ANIM_INS_TYPE_FRAME
            frame_number = (data & 0x00FF0000) >> 16
            duration = data & 0xFFFF

            _data = scr_data[cur]
            cur += 1
            sheet_addr = _data

            anim_frames.append(sheet_addr)

            frame_name = try_get_ptr_symbol(sheet_addr)
            if frame_name == None:
                frame_name = f"0x{sheet_addr:08X}"

            _data = scr_data[cur]
            cur += 1
            oam_offset = _data

            oam_name = f"0x{oam_offset:04X}"
            for oam in oams_r:
                if oam.offset == oam_offset:
                    oam_name = f"{oam.name} - OAMR"

            print(f"    ANIMSCR_FRAME 0x{duration:02X}, {frame_name}, 0x{frame_number:02X}, {oam_name}") # @ 0x{data:08X}

        else:
            print("[ERROR] 0x{ins:08X}")

    return ret_scrs, anim_frames
