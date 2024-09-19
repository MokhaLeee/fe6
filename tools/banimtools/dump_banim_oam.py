#!/bin/python3

import struct, ctypes

import lzss_lib
import rom_def

class BanimOAM:
    def __init__(self, name, offset):
        self.name = name
        self.offset = offset

def lo16(data):
    return data & 0xFFFF

def hi16(data):
    return (data >> 16) & 0xFFFF

def dump_banim_oam(prefix, addr):
    ret_oams = []

    oam_bytes = lzss_lib.lz77_decomp_data(addr)
    oam_data  = struct.unpack(f'{len(oam_bytes) // 4}I', oam_bytes)

    cur = 0
    oam_idx = 0
    new_oam = True

    print(f"{prefix}:")

    while True:
        if cur >= len(oam_data):
            break

        if new_oam:
            name = f"{prefix}_{oam_idx}"
            ret_oams.append(BanimOAM(name, cur * 4))
            print(name + ":")
            new_oam = False
            oam_idx += 1

        pre = cur
        cur += 3

        oam0 = lo16(oam_data[pre + 0])
        oam1 = hi16(oam_data[pre + 0])
        oam2 = lo16(oam_data[pre + 1])
        x    = ctypes.c_int16(hi16(oam_data[pre + 1])).value
        y    = ctypes.c_int16(lo16(oam_data[pre + 2])).value
        _0   = hi16(oam_data[pre + 2])

        if oam1 == 0xFFFF:
            # affin
            cnt = lo16(oam_data[pre + 0])
            pa  = lo16(oam_data[pre + 1])
            pb  = hi16(oam_data[pre + 1])
            pc  = lo16(oam_data[pre + 2])
            pd  = hi16(oam_data[pre + 2])
            PREFIX = "ANIM_SPRITE_AFFIN"
            print(f"    {PREFIX} {cnt}, 0x{pa:04X}, 0x{pb:04X}, 0x{pc:04X}, 0x{pd:04X}")
            continue

        else:
            # sprite
            if _0 != 0:
                print("ERROR on _0")

            PREFIX = "ANIM_SPRITE"

            OAM0 = f"0x{oam0:04X}"
            if (oam0 & (3 << 14)) == (0 << 14):
                OAM0 = "ATTR0_SQUARE"
            if (oam0 & (3 << 14)) == (1 << 14):
                OAM0 = "ATTR0_WIDE"
            if (oam0 & (3 << 14)) == (2 << 14):
                OAM0 = "ATTR0_TALL"

            if oam0 & (1 << 8):
                OAM0 = OAM0 + " + OBJ_ROT_SCALE_ON"

            if oam1 & (1 << 12): # ATTR1_FLIP_X
                PREFIX = "ANIM_SPRITE_XFLIP"
                oam1 = oam1 & ~(1 << 12)

            OAM1 = f"0x{oam1:04X}"
            if oam1 == (0 << 14):
                OAM1 = "ATTR1_SIZE_8"
            if  oam1 == (1 << 14):
                OAM1 = "ATTR1_SIZE_16"
            if  oam1 == (2 << 14):
                OAM1 = "ATTR1_SIZE_32"
            if  oam1 == (3 << 14):
                OAM1 = "ATTR1_SIZE_64"

            OAM2 = f"0x{oam2:04X}"

        # end
        if oam0 == 1:
            if oam1 != 0 or oam2 != 0 or x != 0 or y != 0:
                print(f"@ [ERROR]: at hex{off}!")

            print("    ANIM_SPRITE_END")

            # if next is not end
            if cur < len(oam_data) and lo16(oam_data[cur]) != 1:
                new_oam = True

        else:
            print(f"    {PREFIX} {OAM0}, {OAM1}, {OAM2}, {x}, {y}")

    return ret_oams

def dump_banim_oam_r(prefix, addr):
    # print(f".global BANIM_OAMR_{prefix}")
    print(f"@ BANIM_OAMR_{prefix}:")
    return dump_banim_oam("OAMR", addr)

def dump_banim_oam_l(prefix, addr):
    # print(f".global BANIM_OAML_{prefix}")
    print(f"@ BANIM_OAML_{prefix}:")
    return dump_banim_oam("OAML", addr)
