SECTIONS
{
    . = 0x0;
    .data.oamr (NOLOAD) :
    {
        *(.data.oamr)
    }
    . = 0x0;
    .data.oaml (NOLOAD) :
    {
        *(.data.oaml)
    }
    . = 0x0;
    .data.script (NOLOAD) :
    {
        *(.data.script)
    }
    . = 0x0;
    .data.modes :
    {
        *(.data.modes)
    }
    . = 0x0;
    .data.frames (NOLOAD) :
    {
        *(.data.frames)
    }
}
