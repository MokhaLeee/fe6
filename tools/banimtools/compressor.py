#!/usr/bin/env python3

# compressor for linker
# compressor.py <filename> <comptype>

import os
import sys
import struct

filename = sys.argv[1]
targetname = sys.argv[2]
comptype = sys.argv[3]

if comptype == 'lz':
    os.system('tools/gbagfx/gbagfx %s %s.lz' % (filename, filename))
elif comptype == 'fk':
    size = os.path.getsize(filename) + 4
    with open(filename, 'rb') as f:
        data = f.read()
    with open(targetname, 'wb') as f:
        f.write(struct.pack('<I', size << 8))
        f.write(data)
