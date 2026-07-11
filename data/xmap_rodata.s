	.section .rodata

	.incbin "fe6-base.gba", 0x336D08, (0x336D3C - 0x336D08) @ length: 0034

	.global String_Xmap_08336D3C
String_Xmap_08336D3C: @ 08336D3C
	.incbin "fe6-base.gba", 0x336D3C, (0x336D48 - 0x336D3C) @ length: 000C

	.global String_Xmap_08336D48
String_Xmap_08336D48: @ 08336D48
	.incbin "fe6-base.gba", 0x336D48, (0x336D54 - 0x336D48) @ length: 000C

	.global String_Xmap_08336D54
String_Xmap_08336D54: @ 08336D54
	.incbin "fe6-base.gba", 0x336D54, (0x336D5C - 0x336D54) @ length: 0008
