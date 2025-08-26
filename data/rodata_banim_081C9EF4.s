	.section .rodata

	.global EkrLvupMsgsStr
EkrLvupMsgsStr: @ 081C9FEC
	.incbin "fe6-base.gba", 0x1C9FEC, (0x1CA014 - 0x1C9FEC) @ length: 0028

	.global EkrLvupMsgsMag
EkrLvupMsgsMag: @ 081CA014
	.incbin "fe6-base.gba", 0x1CA014, (0x1CA03C - 0x1CA014) @ length: 0028

	.global sEfxLvupPartsPos
sEfxLvupPartsPos: @ 081CA03C
	.incbin "fe6-base.gba", 0x1CA03C, (0x1CA04C - 0x1CA03C) @ length: 0010

	.global gMsg_Lv
gMsg_Lv: @ 081CA04C
	.incbin "fe6-base.gba", 0x1CA04C, (0x1CA054 - 0x1CA04C) @ length: 0008

	.global FrameArray_EkrTriPegagusBGLeft
FrameArray_EkrTriPegagusBGLeft: @ 081CA054
	.incbin "fe6-base.gba", 0x1CA054, (0x1CA062 - 0x1CA054) @ length: 000E

	.global FrameArray_EkrTriPegagusBGRight
FrameArray_EkrTriPegagusBGRight: @ 081CA062
	.incbin "fe6-base.gba", 0x1CA062, (0x1CA070 - 0x1CA062) @ length: 000E

	.global Img_TriPegasusKnightBG
Img_TriPegasusKnightBG: @ 081CA070
	.incbin "fe6-base.gba", 0x1CA070, (0x1CAA14 - 0x1CA070) @ length: 09A4

	.global Img_TriFalconKnightLanceBG
Img_TriFalconKnightLanceBG: @ 081CAA14
	.incbin "fe6-base.gba", 0x1CAA14, (0x1CB404 - 0x1CAA14) @ length: 09F0

	.global Img_TriFalconKnightSwordBG
Img_TriFalconKnightSwordBG: @ 081CB404
	.incbin "fe6-base.gba", 0x1CB404, (0x1CC428 - 0x1CB404) @ length: 1024

	.global Img_TriPegasusKnightOBJ
Img_TriPegasusKnightOBJ: @ 081CC428
	.incbin "fe6-base.gba", 0x1CC428, (0x1CCDE0 - 0x1CC428) @ length: 09B8

	.global Img_TriFalconKnightLanceOBJ
Img_TriFalconKnightLanceOBJ: @ 081CCDE0
	.incbin "fe6-base.gba", 0x1CCDE0, (0x1CD7AC - 0x1CCDE0) @ length: 09CC

	.global Img_TriFalconKnightSwordOBJ
Img_TriFalconKnightSwordOBJ: @ 081CD7AC
	.incbin "fe6-base.gba", 0x1CD7AC, (0x1CE154 - 0x1CD7AC) @ length: 09A8

	.global Img_TriKnightOBJ
Img_TriKnightOBJ: @ 081CE154
	.incbin "fe6-base.gba", 0x1CE154, (0x1CE474 - 0x1CE154) @ length: 0320

	.global Img_TriGenerialLanceOBJ
Img_TriGenerialLanceOBJ: @ 081CE474
	.incbin "fe6-base.gba", 0x1CE474, (0x1CE848 - 0x1CE474) @ length: 03D4

	.global Img_TriGenerialAxeOBJ
Img_TriGenerialAxeOBJ: @ 081CE848
	.incbin "fe6-base.gba", 0x1CE848, (0x1CEC7C - 0x1CE848) @ length: 0434

	.global Img_TriGenerialHandAxeOBJ
Img_TriGenerialHandAxeOBJ: @ 081CEC7C
	.incbin "fe6-base.gba", 0x1CEC7C, (0x1CF03C - 0x1CEC7C) @ length: 03C0

	.global Img_TriKnightAtkOBJ
Img_TriKnightAtkOBJ: @ 081CF03C
	.incbin "fe6-base.gba", 0x1CF03C, (0x1CF574 - 0x1CF03C) @ length: 0538

	.global Img_TriGenerialLanceAtkOBJ
Img_TriGenerialLanceAtkOBJ: @ 081CF574
	.incbin "fe6-base.gba", 0x1CF574, (0x1CFCB0 - 0x1CF574) @ length: 073C

	.global Img_TriGenerialAxeAtkOBJ
Img_TriGenerialAxeAtkOBJ: @ 081CFCB0
	.incbin "fe6-base.gba", 0x1CFCB0, (0x1D043C - 0x1CFCB0) @ length: 078C

	.global Img_TriGenerialHandAxeAtkOBJ
Img_TriGenerialHandAxeAtkOBJ: @ 081D043C
	.incbin "fe6-base.gba", 0x1D043C, (0x1D0B4C - 0x1D043C)

	.global BanimBG_081D0B4C
BanimBG_081D0B4C:	@ 0x081D0B4C
	.incbin "fe6-base.gba", 0x1D0B4C, 0x1D41C8 - 0x1D0B4C

	.global BanimBG_081D41C8
BanimBG_081D41C8:	@ 0x081D41C8
	.incbin "fe6-base.gba", 0x1D41C8, 0x1D8E04 - 0x1D41C8

	.global BanimBG_081D8E04
BanimBG_081D8E04:	@ 0x081D8E04
	.incbin "fe6-base.gba", 0x1D8E04, 0x1DD1D4 - 0x1D8E04

	.global BanimBG_081DD1D4
BanimBG_081DD1D4:	@ 0x081DD1D4
	.incbin "fe6-base.gba", 0x1DD1D4, 0x1DD2C0 - 0x1DD1D4

	.global BanimBG_081DD2C0
BanimBG_081DD2C0:	@ 0x081DD2C0
	.incbin "fe6-base.gba", 0x1DD2C0, 0x1DD3F4 - 0x1DD2C0

	.global BanimBG_081DD3F4
BanimBG_081DD3F4:	@ 0x081DD3F4
	.incbin "fe6-base.gba", 0x1DD3F4, 0x1DD4DC - 0x1DD3F4

	.global BanimBG_081DD4DC
BanimBG_081DD4DC:	@ 0x081DD4DC
	.incbin "fe6-base.gba", 0x1DD4DC, 0x1DD5D4 - 0x1DD4DC

	.global BanimBG_081DD5D4
BanimBG_081DD5D4:	@ 0x081DD5D4
	.incbin "fe6-base.gba", 0x1DD5D4, 0x1DD6D4 - 0x1DD5D4

	.global BanimBG_081DD6D4
BanimBG_081DD6D4:	@ 0x081DD6D4
	.incbin "fe6-base.gba", 0x1DD6D4, 0x1DD7E4 - 0x1DD6D4

	.global BanimBG_081DD7E4
BanimBG_081DD7E4:	@ 0x081DD7E4
	.incbin "fe6-base.gba", 0x1DD7E4, 0x1DD890 - 0x1DD7E4

	.global BanimBG_081DD890
BanimBG_081DD890:	@ 0x081DD890
	.incbin "fe6-base.gba", 0x1DD890, 0x1DD950 - 0x1DD890

	.global BanimBG_081DD950
BanimBG_081DD950:	@ 0x081DD950
	.incbin "fe6-base.gba", 0x1DD950, 0x1DD9DC - 0x1DD950

	.global BanimBG_081DD9DC
BanimBG_081DD9DC:	@ 0x081DD9DC
	.incbin "fe6-base.gba", 0x1DD9DC, 0x1DDA68 - 0x1DD9DC

	.global BanimBG_081DDA68
BanimBG_081DDA68:	@ 0x081DDA68
	.incbin "fe6-base.gba", 0x1DDA68, 0x1DDAD4 - 0x1DDA68

	.global BanimBG_081DDAD4
BanimBG_081DDAD4:	@ 0x081DDAD4
	.incbin "fe6-base.gba", 0x1DDAD4, 0x1DDB8C - 0x1DDAD4

	.global BanimBG_081DDB8C
BanimBG_081DDB8C:	@ 0x081DDB8C
	.incbin "fe6-base.gba", 0x1DDB8C, 0x1DDCBC - 0x1DDB8C

	.global BanimBG_081DDCBC
BanimBG_081DDCBC:	@ 0x081DDCBC
	.incbin "fe6-base.gba", 0x1DDCBC, 0x1DDDAC - 0x1DDCBC

	.global BanimBG_081DDDAC
BanimBG_081DDDAC:	@ 0x081DDDAC
	.incbin "fe6-base.gba", 0x1DDDAC, 0x1DDE3C - 0x1DDDAC

	.global BanimBG_081DDE3C
BanimBG_081DDE3C:	@ 0x081DDE3C
	.incbin "fe6-base.gba", 0x1DDE3C, 0x1DDF24 - 0x1DDE3C

	.global BanimBG_081DDF24
BanimBG_081DDF24:	@ 0x081DDF24
	.incbin "fe6-base.gba", 0x1DDF24, 0x1DE008 - 0x1DDF24

	.global BanimBG_081DE008
BanimBG_081DE008:	@ 0x081DE008
	.incbin "fe6-base.gba", 0x1DE008, 0x1DE120 - 0x1DE008

	.global BanimBG_081DE120
BanimBG_081DE120:	@ 0x081DE120
	.incbin "fe6-base.gba", 0x1DE120, 0x1DE1E8 - 0x1DE120

	.global BanimBG_081DE1E8
BanimBG_081DE1E8:	@ 0x081DE1E8
	.incbin "fe6-base.gba", 0x1DE1E8, 0x1DE2E4 - 0x1DE1E8

	.global BanimBG_081DE2E4
BanimBG_081DE2E4:	@ 0x081DE2E4
	.incbin "fe6-base.gba", 0x1DE2E4, 0x1DE3FC - 0x1DE2E4

	.global BanimBG_081DE3FC
BanimBG_081DE3FC:	@ 0x081DE3FC
	.incbin "fe6-base.gba", 0x1DE3FC, 0x1DE4BC - 0x1DE3FC

	.global BanimBG_081DE4BC
BanimBG_081DE4BC:	@ 0x081DE4BC
	.incbin "fe6-base.gba", 0x1DE4BC, 0x1DE528 - 0x1DE4BC

	.global BanimBG_081DE528
BanimBG_081DE528:	@ 0x081DE528
	.incbin "fe6-base.gba", 0x1DE528, 0x1DE680 - 0x1DE528

	.global BanimBG_081DE680
BanimBG_081DE680:	@ 0x081DE680
	.incbin "fe6-base.gba", 0x1DE680, 0x1DE740 - 0x1DE680

	.global BanimBG_081DE740
BanimBG_081DE740:	@ 0x081DE740
	.incbin "fe6-base.gba", 0x1DE740, 0x1DE830 - 0x1DE740

	.global BanimBG_081DE830
BanimBG_081DE830:	@ 0x081DE830
	.incbin "fe6-base.gba", 0x1DE830, 0x1DE8A0 - 0x1DE830

	.global BanimBG_081DE8A0
BanimBG_081DE8A0:	@ 0x081DE8A0
	.incbin "fe6-base.gba", 0x1DE8A0, 0x1DEA58 - 0x1DE8A0

	.global BanimBG_081DEA58
BanimBG_081DEA58:	@ 0x081DEA58
	.incbin "fe6-base.gba", 0x1DEA58, 0x1DED04 - 0x1DEA58

	.global BanimBG_081DED04
BanimBG_081DED04:	@ 0x081DED04
	.incbin "fe6-base.gba", 0x1DED04, 0x1DEF48 - 0x1DED04

	.global BanimBG_081DEF48
BanimBG_081DEF48:	@ 0x081DEF48
	.incbin "fe6-base.gba", 0x1DEF48, 0x1DF110 - 0x1DEF48

	.global BanimBG_081DF110
BanimBG_081DF110:	@ 0x081DF110
	.incbin "fe6-base.gba", 0x1DF110, 0x1DF3DC - 0x1DF110

	.global BanimBG_081DF3DC
BanimBG_081DF3DC:	@ 0x081DF3DC
	.incbin "fe6-base.gba", 0x1DF3DC, 0x1DF650 - 0x1DF3DC

	.global BanimBG_081DF650
BanimBG_081DF650:	@ 0x081DF650
	.incbin "fe6-base.gba", 0x1DF650, 0x1DF7DC - 0x1DF650

	.global BanimBG_081DF7DC
BanimBG_081DF7DC:	@ 0x081DF7DC
	.incbin "fe6-base.gba", 0x1DF7DC, 0x1DF9E0 - 0x1DF7DC

	.global BanimBG_081DF9E0
BanimBG_081DF9E0:	@ 0x081DF9E0
	.incbin "fe6-base.gba", 0x1DF9E0, 0x1DFBBC - 0x1DF9E0

	.global BanimBG_081DFBBC
BanimBG_081DFBBC:	@ 0x081DFBBC
	.incbin "fe6-base.gba", 0x1DFBBC, 0x1DFE78 - 0x1DFBBC

	.global BanimBG_081DFE78
BanimBG_081DFE78:	@ 0x081DFE78
	.incbin "fe6-base.gba", 0x1DFE78, 0x1E0158 - 0x1DFE78

	.global BanimBG_081E0158
BanimBG_081E0158:	@ 0x081E0158
	.incbin "fe6-base.gba", 0x1E0158, 0x1E048C - 0x1E0158

	.global BanimBG_081E048C
BanimBG_081E048C:	@ 0x081E048C
	.incbin "fe6-base.gba", 0x1E048C, 0x1E0724 - 0x1E048C

	.global BanimBG_081E0724
BanimBG_081E0724:	@ 0x081E0724
	.incbin "fe6-base.gba", 0x1E0724, 0x1E09CC - 0x1E0724

	.global BanimBG_081E09CC
BanimBG_081E09CC:	@ 0x081E09CC
	.incbin "fe6-base.gba", 0x1E09CC, 0x1E0BF4 - 0x1E09CC

	.global BanimBG_081E0BF4
BanimBG_081E0BF4:	@ 0x081E0BF4
	.incbin "fe6-base.gba", 0x1E0BF4, 0x2563F4 - 0x1E0BF4 @ len=???
