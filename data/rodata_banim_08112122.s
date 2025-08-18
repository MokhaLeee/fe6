	.section .rodata

	.global BanimDefaultModeConfig
BanimDefaultModeConfig: @ 08112298
	.incbin "fe6-base.gba", 0x112298, (0x1122C0 - 0x112298) @ length: 0028

	.global BanimDefaultStandingTypes
BanimDefaultStandingTypes: @ 081122C0
	.incbin "fe6-base.gba", 0x1122C0, (0x1122C5 - 0x1122C0) @ length: 0005

	.global BanimTypesPosLeft
BanimTypesPosLeft: @ 081122C5
	.incbin "fe6-base.gba", 0x1122C5, (0x1122CA - 0x1122C5) @ length: 0005

	.global BanimTypesPosRight
BanimTypesPosRight: @ 081122CA
	.incbin "fe6-base.gba", 0x1122CA, (0x1122D0 - 0x1122CA) @ length: 0006

	.global BanimLeftDefaultPos
BanimLeftDefaultPos: @ 081122D0
	.incbin "fe6-base.gba", 0x1122D0, (0x1122DA - 0x1122D0) @ length: 000A

	.global gUnk_081122DA
gUnk_081122DA: @ 081122DA
	.incbin "fe6-base.gba", 0x1122DA, (0x112370 - 0x1122DA) @ length: 0096

	.global gUnk_08112370
gUnk_08112370: @ 08112370
	.incbin "fe6-base.gba", 0x112370, (0x112380 - 0x112370) @ length: 0270

	.global TsaConf_BanimTmA_08112380
TsaConf_BanimTmA_08112380:	@ 0x08112380
	.incbin "fe6-base.gba", 0x112380, 0x112418 - 0x112380

	.global TsaConf_BanimTmA_08112418
TsaConf_BanimTmA_08112418:	@ 0x08112418
	.incbin "fe6-base.gba", 0x112418, 0x1124B0 - 0x112418

	.global TsaConf_BanimTmA_081124B0
TsaConf_BanimTmA_081124B0:	@ 0x081124B0
	.incbin "fe6-base.gba", 0x1124B0, 0x112548 - 0x1124B0

	.global TsaConf_BanimTmA_08112548
TsaConf_BanimTmA_08112548:	@ 0x08112548
	.incbin "fe6-base.gba", 0x112548, 0x1125E0 - 0x112548

	.global gUnk_081125E0
gUnk_081125E0: @ 081125E0
	.incbin "fe6-base.gba", 0x1125E0, (0x1127F0 - 0x1125E0) @ length: 0210

	.global gUnk_081127F0
gUnk_081127F0: @ 081127F0
	.incbin "fe6-base.gba", 0x1127F0, (0x112840 - 0x1127F0) @ length: 0050

	.global gUnk_08112840
gUnk_08112840: @ 08112840
	.incbin "fe6-base.gba", 0x112840, (0x1128AC - 0x112840) @ length: 006C

	.global gUnk_081128AC
gUnk_081128AC: @ 081128AC
	.incbin "fe6-base.gba", 0x1128AC, (0x1128FC - 0x1128AC) @ length: 0050

	.global gUnk_081128FC
gUnk_081128FC: @ 081128FC
	.incbin "fe6-base.gba", 0x1128FC, (0x112968 - 0x1128FC) @ length: 006C

	.global gUnk_08112968
gUnk_08112968: @ 08112968
	.incbin "fe6-base.gba", 0x112968, (0x112A1C - 0x112968) @ length: 00B4

	.global gUnk_08112A1C
gUnk_08112A1C: @ 08112A1C
	.incbin "fe6-base.gba", 0x112A1C, (0x112AD0 - 0x112A1C) @ length: 00B4

	.global gUnk_08112AD0
gUnk_08112AD0: @ 08112AD0
	.incbin "fe6-base.gba", 0x112AD0, (0x112BA4 - 0x112AD0) @ length: 00D4

	.global gUnk_08112BA4
gUnk_08112BA4: @ 08112BA4
	.incbin "fe6-base.gba", 0x112BA4, (0x112C84 - 0x112BA4) @ length: 00E0

	.global gUnk_08112C84
gUnk_08112C84: @ 08112C84
	.incbin "fe6-base.gba", 0x112C84, (0x112CD4 - 0x112C84) @ length: 0050

	.global gUnk_08112CD4
gUnk_08112CD4: @ 08112CD4
	.incbin "fe6-base.gba", 0x112CD4, (0x112D54 - 0x112CD4) @ length: 0080

	.global Img_EfxSideHitDmgCrit
Img_EfxSideHitDmgCrit: @ 08112D54
	.incbin "fe6-base.gba", 0x112D54, (0x112DF4 - 0x112D54) @ length: 00A0

	.global Img_EfxArrowWTA
Img_EfxArrowWTA: @ 08112DF4
	.incbin "fe6-base.gba", 0x112DF4, (0x113024 - 0x112DF4) @ length: 0230

	.global Img_EkrGaugeNumber
Img_EkrGaugeNumber: @ 08113024
	.incbin "fe6-base.gba", 0x113024, (0x1131A4 - 0x113024) @ length: 0180

	.global Pal_EkrGauge_081131A4
Pal_EkrGauge_081131A4: @ 081131A4
	.incbin "fe6-base.gba", 0x1131A4, (0x113224 - 0x1131A4) @ length: 0080

	.global Pal_08113224
Pal_08113224: @ 08113224
	.incbin "fe6-base.gba", 0x113224, (0x113424 - 0x113224) @ length: 0200

	.global gPalEfxHpBarPurple
gPalEfxHpBarPurple: @ 08113424
	.incbin "fe6-base.gba", 0x113424, (0x1134A4 - 0x113424) @ length: 0080

	.global gPalEfxHpBarGreen
gPalEfxHpBarGreen: @ 081134A4
	.incbin "fe6-base.gba", 0x1134A4, (0x1134C4 - 0x1134A4) @ length: 0020

	.global Pal_081134C4
Pal_081134C4: @ 081134C4
	.incbin "fe6-base.gba", 0x1134C4, (0x113564 - 0x1134C4) @ length: 00A0

	.global Pal_BanimUnitFlashing
Pal_BanimUnitFlashing: @ 08113564
	.incbin "fe6-base.gba", 0x113564, (0x113584 - 0x113564) @ length: 0020

	.global Img_EkrExpBar
Img_EkrExpBar: @ 08113584
	.incbin "fe6-base.gba", 0x113584, (0x113884 - 0x113584) @ length: 0300

	.global Img_EkrExpBarChange
Img_EkrExpBarChange: @ 08113884
	.incbin "fe6-base.gba", 0x113884, (0x113B84 - 0x113884) @ length: 0300

	.global Img_BarNumfx
Img_BarNumfx: @ 08113B84
	.incbin "fe6-base.gba", 0x113B84, (0x113CE4 - 0x113B84) @ length: 0160

	.global Tsa_EkrExpBar
Tsa_EkrExpBar: @ 08113CE4
	.incbin "fe6-base.gba", 0x113CE4, (0x113D50 - 0x113CE4) @ length: 006C

	.global Pal_EkrExpBar
Pal_EkrExpBar: @ 08113D50
	.incbin "fe6-base.gba", 0x113D50, (0x113D70 - 0x113D50) @ length: 0020

	.global gUnk_08113D70
gUnk_08113D70: @ 08113D70
	.incbin "fe6-base.gba", 0x113D70, (0x113F98 - 0x113D70) @ length: 0228

	.global Pal_08113F98
Pal_08113F98: @ 08113F98
	.incbin "fe6-base.gba", 0x113F98, (0x113FB8 - 0x113F98) @ length: 0020

	.global Pal_08113FB8
Pal_08113FB8: @ 08113FB8
	.incbin "fe6-base.gba", 0x113FB8, (0x113FD8 - 0x113FB8) @ length: 0020

	.global Pal_08113FD8
Pal_08113FD8: @ 08113FD8
	.incbin "fe6-base.gba", 0x113FD8, (0x113FF8 - 0x113FD8) @ length: 0020

	.global Img_BanimArcherFBallistaIntro
Img_BanimArcherFBallistaIntro: @ 08113FF8
	.incbin "fe6-base.gba", 0x113FF8, (0x11446C - 0x113FF8) @ length: 0474

	.global Img_BanimArcherMBallistaIntro
Img_BanimArcherMBallistaIntro: @ 0811446C
	.incbin "fe6-base.gba", 0x11446C, (0x11490C - 0x11446C) @ length: 04A0

	.global Img_BanimSnipperFBallistaIntro
Img_BanimSnipperFBallistaIntro: @ 0811490C
	.incbin "fe6-base.gba", 0x11490C, (0x114D80 - 0x11490C) @ length: 0474

	.global Img_LevelUpFrame
Img_LevelUpFrame: @ 08114D80
	.incbin "fe6-base.gba", 0x114D80, (0x114FCC - 0x114D80) @ length: 024C

	.global Tm_LevelUpFrame
Tm_LevelUpFrame: @ 08114FCC
	.incbin "fe6-base.gba", 0x114FCC, (0x1150C8 - 0x114FCC) @ length: 00FC

	.global Pal_LevelUpFrame
Pal_LevelUpFrame: @ 081150C8
	.incbin "fe6-base.gba", 0x1150C8, (0x1150E8 - 0x1150C8) @ length: 0020

	.global gUnk_081150E8
gUnk_081150E8: @ 081150E8
	.incbin "fe6-base.gba", 0x1150E8, (0x1152FC - 0x1150E8) @ length: 0214

	.global gUnk_081152FC
gUnk_081152FC: @ 081152FC
	.incbin "fe6-base.gba", 0x1152FC, (0x11531C - 0x1152FC) @ length: 0020

	.global Img_EkrPopup
Img_EkrPopup: @ 0811531C
	.incbin "fe6-base.gba", 0x11531C, (0x115378 - 0x11531C) @ length: 005C

	.global Img_EkrUnkPopup
Img_EkrUnkPopup: @ 08115378
	.incbin "fe6-base.gba", 0x115378, (0x115478 - 0x115378) @ length: 0100

	.global Pal_EkrPopup
Pal_EkrPopup: @ 08115478
	.incbin "fe6-base.gba", 0x115478, (0x115498 - 0x115478) @ length: 0020

	.global Tsa_EkrPopup
Tsa_EkrPopup: @ 08115498
	.incbin "fe6-base.gba", 0x115498, (0x115524 - 0x115498) @ length: 008C

	.global gUnk_08115524
gUnk_08115524: @ 08115524
	.incbin "fe6-base.gba", 0x115524, (0x117B90 - 0x115524) @ length: 266C

	.global gUnk_08117B90
gUnk_08117B90: @ 08117B90
	.incbin "fe6-base.gba", 0x117B90, (0x118330 - 0x117B90) @ length: 07A0

	.global gUnk_08118330
gUnk_08118330: @ 08118330
	.incbin "fe6-base.gba", 0x118330, (0x119CD8 - 0x118330) @ length: 19A8

	.global gUnk_08119CD8
gUnk_08119CD8: @ 08119CD8
	.incbin "fe6-base.gba", 0x119CD8, (0x119CDC - 0x119CD8) @ length: 0004
