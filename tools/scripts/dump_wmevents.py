#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys

import symbols
from fe6db import IID_DICT, JID_DICT, PID_DICT, CHAPTER_DICT, EVENT_COMMANDS

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
        return hex(val)
# ========================================================================

def unpack_EvtParams2(arg32):
    x = (arg32 >> 0x0) & 0xFFFF
    y = (arg32 >> 0x10) & 0xFFFF
    return x, y

def unpack_EvtParams4(arg32):
    a = (arg32 >> 0x00) & 0xFF
    b = (arg32 >> 0x08) & 0xFF
    c = (arg32 >> 0x10) & 0xFF
    d = (arg32 >> 0x18) & 0xFF
    return a, b, c, d

def parse_event(rom_data, off):
    cmd = int.from_bytes(rom_data[off + 0:off + 4], 'little')
    cmd_len = 1

    arg1_u32_le = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    arg1_u32_be = int.from_bytes(rom_data[off + 4:off + 8], 'big')
    arg2_u32_le = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    arg3_u32_le = int.from_bytes(rom_data[off + 12:off + 16], 'little')
    arg4_u32_le = int.from_bytes(rom_data[off + 16:off + 20], 'little')
    arg5_u32_le = int.from_bytes(rom_data[off + 20:off + 24], 'little')

    arg32 = arg1_u32_le

    match EVENT_COMMANDS[cmd]:
        case "EVT_CMD_END":
            print("    EvtEnd")

        case "EVT_CMD_SLEEP":
            cmd_len = 2
            print(f"    EvtSleep({arg32})")

        case "EVT_CMD_TALKCONT":
            print("    EvtTalkContinue")

        case "EVT_CMD_BGM_FADEOUT":
            cmd_len = 2
            speed = arg1_u32_le
            print(f"    EvtFadeBgmOut({speed})")

        case "EVT_CMD_NOSKIP_NOTEXTSKIP":
            print("    EvtNoSkipNoTextSkip")

        case "EVT_CMD_YESSKIP":
            print("    EvtYesSkip")

        case "EVT_CMD_FUNC":
            cmd_len = 2
            print(f"    EvtFunc({try_get_ptr_symbol(arg32)})")

        case "EVT_CMD_FUNC_ONSKIP":
            cmd_len = 2
            print(f"    EvtFuncOnSkip({try_get_ptr_symbol(arg32)})")

        case "EVT_CMD_WM_START":
            cmd_len = 2
            print(f"    EvtWmStart")

        case "EVT_CMD_WM_END":
            print("    EvtWmEnd")

        case "EVT_CMD_WM_ZOOMTO":
            cmd_len = 2
            x, y = unpack_EvtParams2(arg1_u32_le)
            print(f"    EvtWmZoomTo({hex(x)}, {hex(y)})")

        case "EVT_CMD_WM_PUTFACE":
            cmd_len = 4
            slot = arg1_u32_le
            x, y = unpack_EvtParams2(arg2_u32_le)
            fid = f"FID_{arg3_u32_le:02X}"
            print(f"    EvtWmPutFace({slot}, {hex(x)}, {hex(y)}, {fid})")

        case "EVT_CMD_WM_TALK":
            cmd_len = 2
            msg = f"MSG_{arg1_u32_le:03X}"
            print(f"    EvtWmTalk({msg})")

        case "EVT_CMD_WM_TALKBOX_BOTTOM":
            print("    EvtWmTalkBoxBottom")

        case "EVT_CMD_WM_TALKBOX_TOP":
            print("    EvtWmTalkBoxTop")

        case "EVT_CMD_WM_TALKBOX_REMOVE":
            print("    EvtWmTalkBoxRemove")

        case "EVT_CMD_WM_HIGHLIGHT":
            cmd_len = 2
            _id, nation = unpack_EvtParams2(arg1_u32_le)
            print(f"    EvtWmPutHighlight({_id}, {nation})")

        case "EVT_CMD_WM_HIGHLIGHT_REMOVEBOTH":
            print("    EvtWmRemoveBothHighlights")

        case "EVT_CMD_WM_DOT":
            cmd_len = 4
            _id = arg1_u32_le
            x, y = unpack_EvtParams2(arg2_u32_le)
            pal = arg3_u32_le
            print(f"    EvtWmPutDot({_id}, {hex(x)}, {hex(y)}, {pal})")

        case "EVT_CMD_WM_DOT_REMOVE":
            cmd_len = 2
            _id = arg1_u32_le
            print(f"    EvtWmRemoveDot({_id})")

        case "EVT_CMD_WM_MAPTEXT":
            cmd_len = 5
            tid = arg1_u32_le
            x, y = unpack_EvtParams2(arg2_u32_le)
            location = arg3_u32_le
            style, color = unpack_EvtParams2(arg4_u32_le)
            print(f"    EvtWmPutMapText({tid}, {hex(x)}, {hex(y)}, {location}, {style}, {color})")

        case "EVT_CMD_WM_MAPTEXT_REMOVE":
            cmd_len = 2
            _id = arg1_u32_le
            print(f"    EvtWmRemoveMapText({_id})")

        case _:
            print("[TODO]")
            print(f"cmd: {EVENT_COMMANDS[cmd]}")
            dat0 = int.from_bytes(rom_data[off + 4:off + 8], 'little')
            dat1 = int.from_bytes(rom_data[off + 8:off + 12], 'little')
            print(f"dat: {hex(off)}: {hex(dat0)} {hex(dat1)}")
            sys.exit(1)

    return cmd, off + cmd_len * 4

def dump_one_event(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        scr_name = f"EventScr_{off + 0x08000000:08X}"
    else:
        scr_name = _symbols[ptr]

    print(f"CONST_DATA EventScr {scr_name}[] = " + "{")
    while True:
        cmd, off = parse_event(rom_data, off)

        if cmd in EVENT_COMMANDS and EVENT_COMMANDS[cmd] == "EVT_CMD_END":
            break

    print("};\n")
    print(f"// end at 0x{off:06X}")
    return off

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
            off = dump_one_event(rom_data, off)

            if off_end <= off:
                break

if __name__ == '__main__':
    main(sys.argv)
