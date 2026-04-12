	.include "asm_proc.inc"

	.data

	.global gEndingCredit_FontObjConf
gEndingCredit_FontObjConf: @ 0868BA3C
	.incbin "fe6-base.gba", 0x68BA3C, (0x68BB1C - 0x68BA3C) @ length: 00E0
