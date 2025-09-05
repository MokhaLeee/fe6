	.section .rodata

	.global Pal_OpInfoViewLetters
Pal_OpInfoViewLetters: @ 08354760
	.incbin "fe6-base.gba", 0x354760, (0x354780 - 0x354760) @ length: 0020

	.global Img_OpInfoViewLettersB
Img_OpInfoViewLettersB: @ 08354780
	.incbin "fe6-base.gba", 0x354780, (0x357140 - 0x354780) @ length: 29C0

	.global Img_OpInfoViewLettersA
Img_OpInfoViewLettersA: @ 08357140
	.incbin "fe6-base.gba", 0x357140, (0x3599AC - 0x357140) @ length: 286C

	.global Img_OpInfoViewIcon
Img_OpInfoViewIcon: @ 083599AC
	.incbin "fe6-base.gba", 0x3599AC, (0x35A368 - 0x3599AC) @ length: 09BC

	.global Pal_OpInfoViewIcon
Pal_OpInfoViewIcon: @ 0835A368
	.incbin "fe6-base.gba", 0x35A368, (0x35A3E8 - 0x35A368) @ length: 0080

	.global gUnk_0835A3E8
gUnk_0835A3E8: @ 0835A3E8
	.incbin "fe6-base.gba", 0x35A3E8, (0x35A5D0 - 0x35A3E8) @ length: 01E8

	.global gUnk_0835A5D0
gUnk_0835A5D0: @ 0835A5D0
	.incbin "fe6-base.gba", 0x35A5D0, (0x35A5F0 - 0x35A5D0) @ length: 0020

	.global gUnk_0835A5F0
gUnk_0835A5F0: @ 0835A5F0
	.incbin "fe6-base.gba", 0x35A5F0, (0x35AB08 - 0x35A5F0) @ length: 0518

	.global gUnk_0835AB08
gUnk_0835AB08: @ 0835AB08
	.incbin "fe6-base.gba", 0x35AB08, (0x35AB28 - 0x35AB08) @ length: 0020

	.global gUnk_0835AB28
gUnk_0835AB28: @ 0835AB28
	.incbin "fe6-base.gba", 0x35AB28, (0x35B040 - 0x35AB28) @ length: 0518

	.global gUnk_0835B040
gUnk_0835B040: @ 0835B040
	.incbin "fe6-base.gba", 0x35B040, (0x35C034 - 0x35B040) @ length: 0FF4

	.global gUnk_0835C034
gUnk_0835C034: @ 0835C034
	.incbin "fe6-base.gba", 0x35C034, (0x35C7E4 - 0x35C034) @ length: 07D8
