import sys

import symbols
from fe6db import IID_DICT, JID_DICT, PID_DICT, CHAPTER_DICT

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
