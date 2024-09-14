SECTIONS
{
    . = 0x0;
    .data.oamr :
    {
        *(.data.oamr)
    }
    . = 0x0;
    .data.oaml :
    {
        *(.data.oaml)
    }
    . = 0x0;
    .data.script :
    {
        *(.data.script)
    }
    . = 0x0;
    .data.modes :
    {
        *(.data.modes)
    }
    . = 0x0;
    .data.frames :
    {
        *(.data.frames)
    }
}
