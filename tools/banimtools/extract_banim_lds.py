#!/bin/python3

import re

def read_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def extract_paths(text):
    lines = text.splitlines()
    paths = []
    current_global = None

    for i, line in enumerate(lines):
        if "    .incbin " not in line:
            continue

        if ".incbin \"fe6-base.gba\"" in line:
            pre_line = lines[i - 1]

            if pre_line == "    @ ?":
                print(line)
                continue

            label = lines[i - 1].split(":")[0]
            if label[9] == '_':
                prefix = label[:9]
                name = label[10:]
            else:
                prefix = label[:8]
                name = label[9:]

            if prefix == "BANIM_SCR":
                print(f"data/banims/{name}/{name}.o|.data.script>lz")
            else:
                print("unk: ", prefix, name)
        else:
            print(re.compile(r'"([^"]+)"').search(line).group(1))

    return paths

file_path = 'data/data-banims.s'

text = read_file(file_path)
for path in extract_paths(text):
    print(path)
