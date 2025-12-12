	.include "macro.inc"

	.syntax unified

	.section .data
	.global ProcScr_EkrGauge
ProcScr_EkrGauge: @ 085CB568
	.incbin "fe6-base.gba", 0x5CB568, (0x5CB580 - 0x5CB568) @ length: 0018

	.global gUnk_085CB580
gUnk_085CB580: @ 085CB580
	.incbin "fe6-base.gba", 0x5CB580, (0x5CB5B0 - 0x5CB580) @ length: 0030

	.global gUnk_085CB5B0
gUnk_085CB5B0: @ 085CB5B0
	.incbin "fe6-base.gba", 0x5CB5B0, (0x5CB5C8 - 0x5CB5B0) @ length: 0018

	.global gUnk_085CB5C8
gUnk_085CB5C8: @ 085CB5C8
	.incbin "fe6-base.gba", 0x5CB5C8, (0x5CB5F8 - 0x5CB5C8) @ length: 0030

	.global gUnk_085CB5F8
gUnk_085CB5F8: @ 085CB5F8
	.incbin "fe6-base.gba", 0x5CB5F8, (0x5CB634 - 0x5CB5F8) @ length: 003C

	.global gUnk_085CB634
gUnk_085CB634: @ 085CB634
	.incbin "fe6-base.gba", 0x5CB634, (0x5CB670 - 0x5CB634) @ length: 003C

	.global gUnk_085CB670
gUnk_085CB670: @ 085CB670
	.incbin "fe6-base.gba", 0x5CB670, (0x5CB688 - 0x5CB670) @ length: 0018

	.global gUnk_085CB688
gUnk_085CB688: @ 085CB688
	.incbin "fe6-base.gba", 0x5CB688, (0x5CB6A0 - 0x5CB688) @ length: 0018

	.global gUnk_085CB6A0
gUnk_085CB6A0: @ 085CB6A0
	.incbin "fe6-base.gba", 0x5CB6A0, (0x5CB6B8 - 0x5CB6A0) @ length: 0018

	.global gUnk_085CB6B8
gUnk_085CB6B8: @ 085CB6B8
	.incbin "fe6-base.gba", 0x5CB6B8, (0x5CB6D0 - 0x5CB6B8) @ length: 0018

	.global gUnk_085CB6D0
gUnk_085CB6D0: @ 085CB6D0
	.incbin "fe6-base.gba", 0x5CB6D0, (0x5CB6E8 - 0x5CB6D0) @ length: 0018

	.global gUnk_085CB6E8
gUnk_085CB6E8: @ 085CB6E8
	.incbin "fe6-base.gba", 0x5CB6E8, (0x5CB700 - 0x5CB6E8) @ length: 0018

	.global gUnk_085CB700
gUnk_085CB700: @ 085CB700
	.incbin "fe6-base.gba", 0x5CB700, (0x5CB718 - 0x5CB700) @ length: 0018
