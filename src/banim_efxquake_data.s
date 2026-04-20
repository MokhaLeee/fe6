	.section .rodata

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
