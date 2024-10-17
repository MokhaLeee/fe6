#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys

def main(args):
    with open(args[1], 'r') as f:
        for i, line in enumerate(f.readlines()):
            line = line.strip()

            print(f'    0x{i:02X}: "{line}",')

if __name__ == '__main__':
    main(sys.argv)
