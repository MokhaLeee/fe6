	.section .rodata

	.global String_Xmap_08336CD0
String_Xmap_08336CD0: @ 08336CD0
	.incbin "fe6-base.gba", 0x336CD0, (0x336CF0 - 0x336CD0) @ length: 0020

	.global String_Xmap_08336CF0
String_Xmap_08336CF0: @ 08336CF0
	.incbin "fe6-base.gba", 0x336CF0, (0x336CF8 - 0x336CF0) @ length: 0008

	.global String_Xmap_08336CF8
String_Xmap_08336CF8: @ 08336CF8
	.incbin "fe6-base.gba", 0x336CF8, (0x336D00 - 0x336CF8) @ length: 0008

	.global String_Xmap_08336D00
String_Xmap_08336D00: @ 08336D00
	.incbin "fe6-base.gba", 0x336D00, (0x336D3C - 0x336D00) @ length: 003C

	.global String_Xmap_08336D3C
String_Xmap_08336D3C: @ 08336D3C
	.incbin "fe6-base.gba", 0x336D3C, (0x336D48 - 0x336D3C) @ length: 000C

	.global String_Xmap_08336D48
String_Xmap_08336D48: @ 08336D48
	.incbin "fe6-base.gba", 0x336D48, (0x336D54 - 0x336D48) @ length: 000C

	.global String_Xmap_08336D54
String_Xmap_08336D54: @ 08336D54
	.incbin "fe6-base.gba", 0x336D54, (0x336D5C - 0x336D54) @ length: 0008
