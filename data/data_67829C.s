	.include "asm_proc.inc"

    .data

	.global Sprites_086795F8
Sprites_086795F8: @ 086795F8
	.incbin "fe6-base.gba", 0x6795F8, (0x679654 - 0x6795F8) @ length: 005C

	.global Sprites_08679654
Sprites_08679654: @ 08679654
	.incbin "fe6-base.gba", 0x679654, (0x67966C - 0x679654) @ length: 0018

	.global ProcScr_0867966C
ProcScr_0867966C: @ 0867966C
	.incbin "fe6-base.gba", 0x67966C, (0x67968C - 0x67966C) @ length: 0020

	.global ProcScr_0867968C
ProcScr_0867968C: @ 0867968C
	.incbin "fe6-base.gba", 0x67968C, (0x6796C4 - 0x67968C) @ length: 0038

	.global ProcScr_086796C4
ProcScr_086796C4: @ 086796C4
	.incbin "fe6-base.gba", 0x6796C4, (0x6796F4 - 0x6796C4) @ length: 0030

	.global ProcScr_086796F4
ProcScr_086796F4: @ 086796F4
	.incbin "fe6-base.gba", 0x6796F4, (0x67971C - 0x6796F4) @ length: 0028
