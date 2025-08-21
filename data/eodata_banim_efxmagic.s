	.section .rodata

	.global FrameConf_EfxResireBG3
FrameConf_EfxResireBG3: @ 0811A218
	.incbin "fe6-base.gba", 0x11A218, (0x11A276 - 0x11A218) @ length: 005E

	.global FrameConf_EfxResireBG2
FrameConf_EfxResireBG2: @ 0811A276
	.incbin "fe6-base.gba", 0x11A276, (0x11A27C - 0x11A276) @ length: 0006

	.global FrameConf_EfxLightningBG
FrameConf_EfxLightningBG: @ 0811A27C
	.incbin "fe6-base.gba", 0x11A27C, (0x11A302 - 0x11A27C) @ length: 0086

	.global FrameArray_EfxPurgeBG
FrameArray_EfxPurgeBG: @ 0811A302
	.incbin "fe6-base.gba", 0x11A302, (0x11A478 - 0x11A302) @ length: 0176

	.global FrameConf_EfxForblazeBG1
FrameConf_EfxForblazeBG1: @ 0811A478
	.incbin "fe6-base.gba", 0x11A478, (0x11A50E - 0x11A478) @ length: 0096

	.global FrameArray_EfxForblazeBGCOL1
FrameArray_EfxForblazeBGCOL1: @ 0811A50E
	.incbin "fe6-base.gba", 0x11A50E, (0x11A520 - 0x11A50E) @ length: 0012

	.global gUnk_0811A520
gUnk_0811A520: @ 0811A520
	.incbin "fe6-base.gba", 0x11A520, (0x11A530 - 0x11A520) @ length: 0010

	.global FrameArray_EfxDivineBG
FrameArray_EfxDivineBG: @ 0811A530
	.incbin "fe6-base.gba", 0x11A530, (0x11A59E - 0x11A530) @ length: 006E

	.global FrameArray_EfxDivineBG2
FrameArray_EfxDivineBG2: @ 0811A59E
	.incbin "fe6-base.gba", 0x11A59E, (0x11A5AC - 0x11A59E) @ length: 000E

	.global FrameArray_EfxDivineBG3
FrameArray_EfxDivineBG3: @ 0811A5AC
	.incbin "fe6-base.gba", 0x11A5AC, (0x11A602 - 0x11A5AC) @ length: 0056

	.global FrameArray_EfxAureolaBG
FrameArray_EfxAureolaBG: @ 0811A602
	.incbin "fe6-base.gba", 0x11A602, (0x11A618 - 0x11A602) @ length: 0016

	.global FrameArray_EfxAureolaBG2COL
FrameArray_EfxAureolaBG2COL: @ 0811A618
	.incbin "fe6-base.gba", 0x11A618, (0x11A62A - 0x11A618) @ length: 0012

	.global FrameArray_EfxApocalypseBGCOL2
FrameArray_EfxApocalypseBGCOL2: @ 0811A62A
	.incbin "fe6-base.gba", 0x11A62A, (0x11A668 - 0x11A62A) @ length: 003E

	.global FrameArray_EfxApocalypseBG2
FrameArray_EfxApocalypseBG2: @ 0811A668
	.incbin "fe6-base.gba", 0x11A668, (0x11A67A - 0x11A668) @ length: 0012

	.global FrameArray_EfxHazymoonBG1
FrameArray_EfxHazymoonBG1: @ 0811A67A
	.incbin "fe6-base.gba", 0x11A67A, (0x11A680 - 0x11A67A) @ length: 0006

	.global FrameArray_EfxHazymoonBG2
FrameArray_EfxHazymoonBG2: @ 0811A680
	.incbin "fe6-base.gba", 0x11A680, (0x11A722 - 0x11A680) @ length: 00A2

	.global FrameArray_EfxHazymoonBG3
FrameArray_EfxHazymoonBG3: @ 0811A722
	.incbin "fe6-base.gba", 0x11A722, (0x11A758 - 0x11A722) @ length: 0036

	.global FrameArray_EfxFenrirBGCOL
FrameArray_EfxFenrirBGCOL: @ 0811A758
	.incbin "fe6-base.gba", 0x11A758, (0x11A796 - 0x11A758) @ length: 003E

	.global FrameArray_EfxFenrirBG2_A
FrameArray_EfxFenrirBG2_A: @ 0811A796
	.incbin "fe6-base.gba", 0x11A796, (0x11A898 - 0x11A796) @ length: 0102

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

	.global EfxReserveBG_Songs
EfxReserveBG_Songs: @ 0811A9BA
	.incbin "fe6-base.gba", 0x11A9BA, (0x11A9C2 - 0x11A9BA) @ length: 0008

	.global EfxReserveBG_SongLocs
EfxReserveBG_SongLocs: @ 0811A9C2
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
