	.section .rodata

	.global FrameArray1_EfxLiveBG
FrameArray1_EfxLiveBG: @ 0811A898
	.incbin "fe6-base.gba", 0x11A898, (0x11A89E - 0x11A898) @ length: 0006

	.global FrameArray2_EfxLiveBG
FrameArray2_EfxLiveBG: @ 0811A89E
	.incbin "fe6-base.gba", 0x11A89E, (0x11A8A4 - 0x11A89E) @ length: 0006

	.global FrameArray3_EfxLiveBG
FrameArray3_EfxLiveBG: @ 0811A8A4
	.incbin "fe6-base.gba", 0x11A8A4, (0x11A8AA - 0x11A8A4) @ length: 0006

	.global FrameArray4_EfxLiveBG
FrameArray4_EfxLiveBG: @ 0811A8AA
	.incbin "fe6-base.gba", 0x11A8AA, (0x11A8B0 - 0x11A8AA) @ length: 0006

	.global FrameArray1_EfxLiveBGCOL
FrameArray1_EfxLiveBGCOL: @ 0811A8B0
	.incbin "fe6-base.gba", 0x11A8B0, (0x11A8F2 - 0x11A8B0) @ length: 0042

	.global FrameArray2_EfxLiveBGCOL
FrameArray2_EfxLiveBGCOL: @ 0811A8F2
	.incbin "fe6-base.gba", 0x11A8F2, (0x11A934 - 0x11A8F2) @ length: 0042

	.global FrameArray3_EfxLiveBGCOL
FrameArray3_EfxLiveBGCOL: @ 0811A934
	.incbin "fe6-base.gba", 0x11A934, (0x11A966 - 0x11A934) @ length: 0032

	.global FrameArray4_EfxLiveBGCOL
FrameArray4_EfxLiveBGCOL: @ 0811A966
	.incbin "fe6-base.gba", 0x11A966, (0x11A9A8 - 0x11A966) @ length: 0042

	.global FrameArray_EfxReserveBG
FrameArray_EfxReserveBG: @ 0811A9A8
	.incbin "fe6-base.gba", 0x11A9A8, (0x11A9BA - 0x11A9A8) @ length: 0012

	.global SfxArray_EfxReserveBG
SfxArray_EfxReserveBG: @ 0811A9BA
	.incbin "fe6-base.gba", 0x11A9BA, (0x11A9C2 - 0x11A9BA) @ length: 0008

	.global SfxLocArray_EfxReserveBG
SfxLocArray_EfxReserveBG: @ 0811A9C2
	.incbin "fe6-base.gba", 0x11A9C2, (0x11A9CA - 0x11A9C2) @ length: 0008

	.global FrameArray_EfxReserveBGCOL
FrameArray_EfxReserveBGCOL: @ 0811A9CA
	.incbin "fe6-base.gba", 0x11A9CA, (0x11AACC - 0x11A9CA) @ length: 0102

	.global FrameArray_EfxReserveBG2
FrameArray_EfxReserveBG2: @ 0811AACC
	.incbin "fe6-base.gba", 0x11AACC, (0x11AAD2 - 0x11AACC) @ length: 0006

	.global FrameArray_EfxReserveBGCOL2
FrameArray_EfxReserveBGCOL2: @ 0811AAD2
	.incbin "fe6-base.gba", 0x11AAD2, (0x11ABB0 - 0x11AAD2) @ length: 00DE

	.global FrameArray_EfxRestBG
FrameArray_EfxRestBG: @ 0811ABB0
	.incbin "fe6-base.gba", 0x11ABB0, (0x11ABE6 - 0x11ABB0) @ length: 0036

	.global FrameArray_EfxSilenceBG
FrameArray_EfxSilenceBG: @ 0811ABE6
	.incbin "fe6-base.gba", 0x11ABE6, (0x11AC30 - 0x11ABE6) @ length: 004A

	.global FrameArray_EfxSleepBG
FrameArray_EfxSleepBG: @ 0811AC30
	.incbin "fe6-base.gba", 0x11AC30, (0x11AD32 - 0x11AC30) @ length: 0102

	.global FrameArray_EfxHammarneBG
FrameArray_EfxHammarneBG: @ 0811AD32
	.incbin "fe6-base.gba", 0x11AD32, (0x11AD68 - 0x11AD32) @ length: 0036

	.global FrameArray_EfxMshieldBG
FrameArray_EfxMshieldBG: @ 0811AD68
	.incbin "fe6-base.gba", 0x11AD68, (0x11AE34 - 0x11AD68) @ length: 00CC
