ELF = "fe6.elf"
_symbols_cache = None

def from_elf(f):
    from elftools.elf.elffile import ELFFile
    from elftools.elf.sections import SymbolTableSection

    elf = ELFFile(f)
    section = elf.get_section_by_name('.symtab')

    if section == None or not isinstance(section, SymbolTableSection):
        return

    for sym in section.iter_symbols():
        if sym.entry.st_info.bind != 'STB_GLOBAL':
            continue

        yield (sym.entry.st_value, sym.name)

def get_symbols(elf_file_path):
    global _symbols_cache
    if _symbols_cache is None:
        with open(elf_file_path, 'rb') as f:
            _symbols_cache = {addr: name for addr, name in from_elf(f)}

    return _symbols_cache

def try_get_ptr_symbol(val):
    _symbols = get_symbols(ELF)
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
        return None
