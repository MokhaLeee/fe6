	.include "asm_proc.inc"

	.data

    .incbin "fe6-base.gba", 0x68C1DC, (0x68C2CC - 0x68C1DC) @ length: 0300
