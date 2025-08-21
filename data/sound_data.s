    .section .rodata

.global gSongTable
gSongTable:
    .incbin "fe6-base.gba", 0x3994d8, (0x39A840 - 0x3994d8)

    .global dummy_song
    dummy_song:	@ 0x39A840
    .byte	0		@ trackCount
    .byte	0		@ blockCount
    .byte	0		@ priority
    .byte	0		@ reverb

    .incbin "fe6-base.gba", 0x39A844, (0x57A61C - 0x39A844)

    .global Song_Unk_0857A61C
Song_Unk_0857A61C: @ 0857A61C
    .incbin "fe6-base.gba", 0x57A61C, (0x57B774 - 0x57A61C) @ length: 1158

    .global Song_Unk_0857B774
Song_Unk_0857B774: @ 0857B774
    .incbin "fe6-base.gba", 0x57B774, (0x57C1E4 - 0x57B774) @ length: 0A70

    .global Song_Unk_0857C1E4
Song_Unk_0857C1E4: @ 0857C1E4
    .incbin "fe6-base.gba", 0x57C1E4, (0x57C95C - 0x57C1E4) @ length: 0778

    .global Song_Unk_0857C95C
Song_Unk_0857C95C: @ 0857C95C
    .incbin "fe6-base.gba", 0x57C95C, (0x58E578 - 0x57C95C) @ length: 11C1C
