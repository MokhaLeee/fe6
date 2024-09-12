
	.section .rodata

	.global Img_UiWindowFrame_ThemeBlue
Img_UiWindowFrame_ThemeBlue: @ 0810F744
	.incbin "fe6-base.gba", 0x10F744, (0x10FF78 - 0x10F744)

	.global Pal_UiWindowFrame_ThemeBlue
Pal_UiWindowFrame_ThemeBlue: @ 0810FF78
	.incbin "fe6-base.gba", 0x10FF78, (0x10FF98 - 0x10FF78)

	.global Pal_UiStatBar_ThemeBlue
Pal_UiStatBar_ThemeBlue: @ 0810FF98
	.incbin "fe6-base.gba", 0x10FF98, (0x10FFB8 - 0x10FF98)

	.global Img_UiWindowFrame_ThemeRed
Img_UiWindowFrame_ThemeRed: @ 0810FFB8
	.incbin "fe6-base.gba", 0x10FFB8, (0x110838 - 0x10FFB8)

	.global Pal_UiWindowFrame_ThemeRed
Pal_UiWindowFrame_ThemeRed: @ 08110838
	.incbin "fe6-base.gba", 0x110838, (0x110858 - 0x110838)

	.global Pal_UiStatBar_ThemeRed
Pal_UiStatBar_ThemeRed: @ 08110858
	.incbin "fe6-base.gba", 0x110858, (0x110878 - 0x110858)

	.global Img_UiWindowFrame_ThemeGray
Img_UiWindowFrame_ThemeGray: @ 08110878
	.incbin "fe6-base.gba", 0x110878, (0x111110 - 0x110878)

	.global Pal_UiWindowFrame_ThemeGray
Pal_UiWindowFrame_ThemeGray: @ 08111110
	.incbin "fe6-base.gba", 0x111110, (0x111130 - 0x111110)

	.global Pal_UiStatBar_ThemeGray
Pal_UiStatBar_ThemeGray: @ 08111130
	.incbin "fe6-base.gba", 0x111130, (0x111150 - 0x111130)

	.global Img_UiWindowFrame_ThemeGreen
Img_UiWindowFrame_ThemeGreen: @ 08111150
	.incbin "fe6-base.gba", 0x111150, (0x111930 - 0x111150)

	.global Pal_UiWindowFrame_ThemeGreen
Pal_UiWindowFrame_ThemeGreen: @ 08111930
	.incbin "fe6-base.gba", 0x111930, (0x111950 - 0x111930)

	.global Pal_UiStatBar_ThemeGreen
Pal_UiStatBar_ThemeGreen: @ 08111950
	.incbin "fe6-base.gba", 0x111950, (0x111970 - 0x111950)

	.global Img_UiUnitNameFrame
Img_UiUnitNameFrame: @ 08111970
	.incbin "fe6-base.gba", 0x111970, (0x111BC4 - 0x111970) @ length: 0254

	.global Pal_UiUnitNameFrame
Pal_UiUnitNameFrame: @ 08111BC4
	.incbin "fe6-base.gba", 0x111BC4, (0x111C44 - 0x111BC4) @ length: 0080

	.global gEfxNoDmgBgShakeOff
gEfxNoDmgBgShakeOff: @ 08111C44
	.incbin "fe6-base.gba", 0x111C44, (0x111C60 - 0x111C44) @ length: 001C

	.global gEfxQuakePureVec1
gEfxQuakePureVec1: @ 08111C60
	.incbin "fe6-base.gba", 0x111C60, (0x111C82 - 0x111C60) @ length: 0022

	.global gEfxQuakePureVec2
gEfxQuakePureVec2: @ 08111C82
	.incbin "fe6-base.gba", 0x111C82, (0x111CCC - 0x111C82) @ length: 004A

	.global gEfxQuakePureVec3
gEfxQuakePureVec3: @ 08111CCC
	.incbin "fe6-base.gba", 0x111CCC, (0x111D16 - 0x111CCC) @ length: 004A

	.global gEfxQuakePureVec4
gEfxQuakePureVec4: @ 08111D16
	.incbin "fe6-base.gba", 0x111D16, (0x111D60 - 0x111D16) @ length: 004A

	.global gEfxQuakePureVec5
gEfxQuakePureVec5: @ 08111D60
	.incbin "fe6-base.gba", 0x111D60, (0x111DAA - 0x111D60) @ length: 004A

	.global gEfxQuakePureVec6
gEfxQuakePureVec6: @ 08111DAA
	.incbin "fe6-base.gba", 0x111DAA, (0x111E14 - 0x111DAA) @ length: 006A

	.global gEfxQuakeVec_08111E14
gEfxQuakeVec_08111E14: @ 08111E14
	.incbin "fe6-base.gba", 0x111E14, (0x111EC6 - 0x111E14) @ length: 011C

	.global gEfxQuakePureVec7
gEfxQuakePureVec7:
	.incbin "fe6-base.gba", 0x111EC6, (0x111ED8 - 0x111EC6)

	.global gEfxQuakePureVec8
gEfxQuakePureVec8:
	.incbin "fe6-base.gba", 0x111ED8, (0x111EFA - 0x111ED8)

	.global gEfxQuakePureVec9
gEfxQuakePureVec9:
	.incbin "fe6-base.gba", 0x111EFA, (0x111f0C - 0x111EFA)

	.global gEfxQuakePureVec10
gEfxQuakePureVec10:
	.incbin "fe6-base.gba", 0x111F0C, (0x111F1E - 0x111F0C)

	.global gEfxQuakePureVec11
gEfxQuakePureVec11:
	.incbin "fe6-base.gba", 0x111F1E, (0x111F30 - 0x111F1E)

	.global gEfxQuakeVec_08111F30
gEfxQuakeVec_08111F30: @ 08111F30
	.incbin "fe6-base.gba", 0x111F30, (0x111FC6 - 0x111F30)

	.global gEfxQuakeVec_08111FC6
gEfxQuakeVec_08111FC6: @ 08111FC6
	.incbin "fe6-base.gba", 0x111FC6, (0x1120F8 - 0x111FC6) @ length: 0132
