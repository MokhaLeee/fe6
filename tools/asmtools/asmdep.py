#!/bin/python3
import os
import re
import argparse

def find_incbin_dependencies(file_path, include_dirs):
    incbin_pattern = re.compile(r'\.incbin\s+"([^"]+)"')
    dependencies = set()

    with open(file_path, 'r') as asm_file:
        for line in asm_file:
            match = incbin_pattern.search(line)
            if match:
                incbin_file = match.group(1)

                for dir in include_dirs:
                    full_path = os.path.join(dir, incbin_file)
                    if os.path.exists(full_path):
                        dependencies.add(full_path)
                        break
                else:
                    dependencies.add(incbin_file)

    return list(dependencies)


def print_dep(asm_file, dependencies):
    target = os.path.splitext(asm_file)[0] + '.o'
    print(f"{' '.join(dependencies)}")


def main():
    parser = argparse.ArgumentParser(description="生成 ASM 文件的 .incbin 依赖项，支持 -I 目录与去重")
    parser.add_argument("asm_file", help="要解析的 ASM 文件路径")
    parser.add_argument("-I", dest="include_dirs", action="append", default=[], help="指定包含目录")
    
    args = parser.parse_args()

    dependencies = find_incbin_dependencies(args.asm_file, args.include_dirs)

    print_dep(args.asm_file, dependencies)


if __name__ == "__main__":
    main()
