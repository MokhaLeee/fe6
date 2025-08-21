	.include "animscr.inc"
	.include "gba_sprites.inc"
	.section .data

	.incbin "fe6-base.gba", 0x5E59E8, (0x5E5C10 - 0x5E59E8) @ length: 03B8

	.global AnimScr_EfxForblazeOBJ2
AnimScr_EfxForblazeOBJ2: @ 085E5C10
	.incbin "fe6-base.gba", 0x5E5C10, (0x5E5C2C - 0x5E5C10) @ length: 001C

	.global AnimScr_EfxForblazeOBJ3
AnimScr_EfxForblazeOBJ3: @ 085E5C2C
	.incbin "fe6-base.gba", 0x5E5C2C, (0x5E5C34 - 0x5E5C2C) @ length: 0008

	.global AnimScr_EfxForblazeOBJ4
AnimScr_EfxForblazeOBJ4: @ 085E5C34
	.incbin "fe6-base.gba", 0x5E5C34, (0x5E5C3C - 0x5E5C34) @ length: 0008

	.global AnimScr_EfxForblazeOBJ5
AnimScr_EfxForblazeOBJ5: @ 085E5C3C
	.incbin "fe6-base.gba", 0x5E5C3C, (0x5E5C44 - 0x5E5C3C) @ length: 0008

	.global AnimScr_EfxForblazeOBJ6
AnimScr_EfxForblazeOBJ6: @ 085E5C44
	.incbin "fe6-base.gba", 0x5E5C44, (0x5E79F8 - 0x5E5C44) @ length: 1DB4

	.global AnimScr_EfxFimbulvetrOBJ1
AnimScr_EfxFimbulvetrOBJ1: @ 085E79F8
	.incbin "fe6-base.gba", 0x5E79F8, (0x5E7A64 - 0x5E79F8) @ length: 006C

	.global AnimScr_EfxFimbulvetrOBJ2Fall
AnimScr_EfxFimbulvetrOBJ2Fall: @ 085E7A64
	.incbin "fe6-base.gba", 0x5E7A64, (0x5E7AC4 - 0x5E7A64) @ length: 0060

	.global AnimScr_FimbulvetrOBJ2Fall_TypeA
AnimScr_FimbulvetrOBJ2Fall_TypeA: @ 085E7AC4
	.incbin "fe6-base.gba", 0x5E7AC4, (0x5E7ACC - 0x5E7AC4) @ length: 0008

	.global AnimScr_FimbulvetrOBJ2Fall_TypeB
AnimScr_FimbulvetrOBJ2Fall_TypeB: @ 085E7ACC
	.incbin "fe6-base.gba", 0x5E7ACC, (0x5E90AC - 0x5E7ACC) @ length: 15E0

	.global AnimScr_EfxAlacaliburOBJ_RF
AnimScr_EfxAlacaliburOBJ_RF: @ 085E90AC
	.incbin "fe6-base.gba", 0x5E90AC, (0x5E9160 - 0x5E90AC) @ length: 00B4

	.global AnimScr_EfxAlacaliburOBJ_RB
AnimScr_EfxAlacaliburOBJ_RB: @ 085E9160
	.incbin "fe6-base.gba", 0x5E9160, (0x5EA7F0 - 0x5E9160) @ length: 1690

	.global AnimScr_EfxAlacaliburOBJ_LF
AnimScr_EfxAlacaliburOBJ_LF: @ 085EA7F0
	.incbin "fe6-base.gba", 0x5EA7F0, (0x5EA8A4 - 0x5EA7F0) @ length: 00B4

	.global AnimScr_EfxAlacaliburOBJ_LB
AnimScr_EfxAlacaliburOBJ_LB: @ 085EA8A4
	.incbin "fe6-base.gba", 0x5EA8A4, (0x5EABC0 - 0x5EA8A4) @ length: 031C

	.global AnimScr_EfxMistyrainOBJ1_1
AnimScr_EfxMistyrainOBJ1_1: @ 085EABC0
	.incbin "fe6-base.gba", 0x5EABC0, (0x5EAC34 - 0x5EABC0) @ length: 0074

	.global AnimScr_EfxHazymoonOBJ3RND
AnimScr_EfxHazymoonOBJ3RND: @ 085EAC34
	.incbin "fe6-base.gba", 0x5EAC34, (0x5EADB0 - 0x5EAC34) @ length: 017C

	.global AnimScr_EfxMistyrainOBJ1_2
AnimScr_EfxMistyrainOBJ1_2: @ 085EADB0
	.incbin "fe6-base.gba", 0x5EADB0, (0x5EB1A8 - 0x5EADB0) @ length: 03F8

	.global AnimScr_EfxMistyrainOBJ2_1
AnimScr_EfxMistyrainOBJ2_1: @ 085EB1A8
	.incbin "fe6-base.gba", 0x5EB1A8, (0x5EB1DC - 0x5EB1A8) @ length: 0034

	.global AnimScr_EfxMistyrainOBJ2_2
AnimScr_EfxMistyrainOBJ2_2: @ 085EB1DC
	.incbin "fe6-base.gba", 0x5EB1DC, (0x5EB264 - 0x5EB1DC) @ length: 0088

	.global AnimScr_EfxMistyrainOBJ1_3
AnimScr_EfxMistyrainOBJ1_3: @ 085EB264
	.incbin "fe6-base.gba", 0x5EB264, (0x5EB83C - 0x5EB264) @ length: 05D8

	.global AnimScr_EfxDivineOBJ
AnimScr_EfxDivineOBJ: @ 085EB83C
	.incbin "fe6-base.gba", 0x5EB83C, (0x5EBF40 - 0x5EB83C) @ length: 0704

	.global AnimScr_EfxApocalypseOBJ2_1
AnimScr_EfxApocalypseOBJ2_1: @ 085EBF40
	.incbin "fe6-base.gba", 0x5EBF40, (0x5EBF50 - 0x5EBF40) @ length: 0010

	.global AnimScr_EfxApocalypseOBJ3RND_1
AnimScr_EfxApocalypseOBJ3RND_1: @ 085EBF50
	.incbin "fe6-base.gba", 0x5EBF50, (0x5EBF58 - 0x5EBF50) @ length: 0008

	.global AnimScr_EfxApocalypseOBJ3RND_2
AnimScr_EfxApocalypseOBJ3RND_2: @ 085EBF58
	.incbin "fe6-base.gba", 0x5EBF58, (0x5EBF60 - 0x5EBF58) @ length: 0008

	.global AnimScr_EfxApocalypseOBJ3RND_3
AnimScr_EfxApocalypseOBJ3RND_3: @ 085EBF60
	.incbin "fe6-base.gba", 0x5EBF60, (0x5EC478 - 0x5EBF60) @ length: 0518

	.global AnimScr_EfxApocalypseOBJ2_2
AnimScr_EfxApocalypseOBJ2_2: @ 085EC478
	.incbin "fe6-base.gba", 0x5EC478, (0x5EC630 - 0x5EC478) @ length: 01B8

	.global AnimScr_EfxHazymoonOBJ2_1
AnimScr_EfxHazymoonOBJ2_1: @ 085EC630
	.incbin "fe6-base.gba", 0x5EC630, (0x5EC938 - 0x5EC630) @ length: 0308

	.global AnimScr_EfxHazymoonOBJ2_2
AnimScr_EfxHazymoonOBJ2_2: @ 085EC938
	.incbin "fe6-base.gba", 0x5EC938, (0x5ECC34 - 0x5EC938) @ length: 02FC

	.global AnimScr_EfxHazymoonOBJ2_3
AnimScr_EfxHazymoonOBJ2_3: @ 085ECC34
	.incbin "fe6-base.gba", 0x5ECC34, (0x5ED8CC - 0x5ECC34) @ length: 0C98

	.global AnimScr_EfxFenrirOBJ2Chiri1
AnimScr_EfxFenrirOBJ2Chiri1: @ 085ED8CC
	.incbin "fe6-base.gba", 0x5ED8CC, (0x5ED8F8 - 0x5ED8CC) @ length: 002C

	.global AnimScr_EfxFenrirOBJ2Chiri2
AnimScr_EfxFenrirOBJ2Chiri2: @ 085ED8F8
	.incbin "fe6-base.gba", 0x5ED8F8, (0x5ED924 - 0x5ED8F8) @ length: 002C

	.global AnimScr_EfxFenrirOBJ
AnimScr_EfxFenrirOBJ: @ 085ED924
	.incbin "fe6-base.gba", 0x5ED924, (0x5EDCC8 - 0x5ED924) @ length: 03A4

	.global AnimScr_EfxPurgeOBJ
AnimScr_EfxPurgeOBJ: @ 085EDCC8
	.incbin "fe6-base.gba", 0x5EDCC8, (0x5F0A14 - 0x5EDCC8) @ length: 2D4C

	.global AnimScr_EfxLiveOBJ
AnimScr_EfxLiveOBJ: @ 085F0A14
	.incbin "fe6-base.gba", 0x5F0A14, (0x5F0AA4 - 0x5F0A14) @ length: 0090

	.global AnimScr_EfxReserveOBJ
AnimScr_EfxReserveOBJ: @ 085F0AA4
	.incbin "fe6-base.gba", 0x5F0AA4, (0x5F1FC0 - 0x5F0AA4) @ length: 151C

	.global AnimScr_EfxReblowOBJ_L_A
AnimScr_EfxReblowOBJ_L_A: @ 085F1FC0
	.incbin "fe6-base.gba", 0x5F1FC0, (0x5F2034 - 0x5F1FC0) @ length: 0074

	.global AnimScr_EfxReblowOBJ_L_B
AnimScr_EfxReblowOBJ_L_B: @ 085F2034
	.incbin "fe6-base.gba", 0x5F2034, (0x5F35C0 - 0x5F2034) @ length: 158C

	.global AnimScr_EfxReblowOBJ_R_A
AnimScr_EfxReblowOBJ_R_A: @ 085F35C0
	.incbin "fe6-base.gba", 0x5F35C0, (0x5F3634 - 0x5F35C0) @ length: 0074

	.global AnimScr_EfxReblowOBJ_R_B
AnimScr_EfxReblowOBJ_R_B: @ 085F3634
	.incbin "fe6-base.gba", 0x5F3634, (0x5F63A8 - 0x5F3634) @ length: 2D74

	.global AnimScr_EfxRestOBJ
AnimScr_EfxRestOBJ: @ 085F63A8
	.incbin "fe6-base.gba", 0x5F63A8, (0x5F6674 - 0x5F63A8) @ length: 02CC

	.global AnimScr_EfxSilenceOBJ
AnimScr_EfxSilenceOBJ: @ 085F6674
	.incbin "fe6-base.gba", 0x5F6674, (0x5F9358 - 0x5F6674) @ length: 2CE4

	.global AnimScr_EfxHammarneOBJ
AnimScr_EfxHammarneOBJ: @ 085F9358
	.incbin "fe6-base.gba", 0x5F9358, (0x5FE3C4 - 0x5F9358) @ length: 506C

	.global AnimScr_EfxSleepOBJ2
AnimScr_EfxSleepOBJ2: @ 085FE3C4
	.incbin "fe6-base.gba", 0x5FE3C4, (0x5FE544 - 0x5FE3C4) @ length: 0180

	.global AnimScr_EfxSleepOBJ
AnimScr_EfxSleepOBJ: @ 085FE544
	.incbin "fe6-base.gba", 0x5FE544, (0x5FEAF8 - 0x5FE544) @ length: 05B4

	.global AnimScr_EfxBerserk1
AnimScr_EfxBerserk1: @ 085FEAF8
	.incbin "fe6-base.gba", 0x5FEAF8, (0x5FEB0C - 0x5FEAF8) @ length: 0014

	.global AnimScr_EfxBerserk2
AnimScr_EfxBerserk2: @ 085FEB0C
	.incbin "fe6-base.gba", 0x5FEB0C, (0x5FEB20 - 0x5FEB0C) @ length: 0014

	.global AnimScr_EfxBerserk3
AnimScr_EfxBerserk3: @ 085FEB20
	.incbin "fe6-base.gba", 0x5FEB20, (0x5FEB34 - 0x5FEB20) @ length: 0014

	.global AnimScr_EfxBerserk4
AnimScr_EfxBerserk4: @ 085FEB34
	.incbin "fe6-base.gba", 0x5FEB34, (0x5FEB48 - 0x5FEB34) @ length: 0014

	.global AnimScr_EfxBerserk5
AnimScr_EfxBerserk5: @ 085FEB48
	.incbin "fe6-base.gba", 0x5FEB48, (0x5FEEBC - 0x5FEB48) @ length: 0374

	.global AnimScr_EfxBerserk6
AnimScr_EfxBerserk6: @ 085FEEBC
	.incbin "fe6-base.gba", 0x5FEEBC, (0x5FEEC8 - 0x5FEEBC) @ length: 000C

	.global AnimScr_EfxBerserk7
AnimScr_EfxBerserk7: @ 085FEEC8
	.incbin "fe6-base.gba", 0x5FEEC8, (0x5FEED4 - 0x5FEEC8) @ length: 000C

	.global AnimScr_EfxBerserk8
AnimScr_EfxBerserk8: @ 085FEED4
	.incbin "fe6-base.gba", 0x5FEED4, (0x5FEEE0 - 0x5FEED4) @ length: 000C

	.global AnimScr_EfxBerserk9
AnimScr_EfxBerserk9: @ 085FEEE0
	.incbin "fe6-base.gba", 0x5FEEE0, (0x5FEEEC - 0x5FEEE0) @ length: 000C

	.global AnimScr_EfxBerserk10
AnimScr_EfxBerserk10: @ 085FEEEC
	.incbin "fe6-base.gba", 0x5FEEEC, (0x602FAC - 0x5FEEEC) @ length: 40C0

	.global AnimScr_EfxMshieldOBJ
AnimScr_EfxMshieldOBJ: @ 08602FAC
	.incbin "fe6-base.gba", 0x602FAC, (0x6030FC - 0x602FAC) @ length: 0150

	.global AnimScr_EfxMshieldOBJ2
AnimScr_EfxMshieldOBJ2: @ 086030FC
	.incbin "fe6-base.gba", 0x6030FC, (0x603B1C - 0x6030FC) @ length: 0A20

	.global AnimScr_EfxAureolaOBJCtrl1
AnimScr_EfxAureolaOBJCtrl1: @ 08603B1C
	.incbin "fe6-base.gba", 0x603B1C, (0x603B24 - 0x603B1C) @ length: 0008

	.global AnimScr_EfxAureolaOBJCtrl2
AnimScr_EfxAureolaOBJCtrl2: @ 08603B24
	.incbin "fe6-base.gba", 0x603B24, (0x603B2C - 0x603B24) @ length: 0008

	.global AnimScr_EfxAureolaOBJCtrl3
AnimScr_EfxAureolaOBJCtrl3: @ 08603B2C
	.incbin "fe6-base.gba", 0x603B2C, (0x603B34 - 0x603B2C) @ length: 0008

	.global AnimScr_EfxAureolaOBJ2_1
AnimScr_EfxAureolaOBJ2_1: @ 08603B34
	.incbin "fe6-base.gba", 0x603B34, (0x603B58 - 0x603B34) @ length: 0024

	.global AnimScr_EfxAureolaOBJ2_2
AnimScr_EfxAureolaOBJ2_2: @ 08603B58
	.incbin "fe6-base.gba", 0x603B58, (0x603BA4 - 0x603B58) @ length: 004C

	.global AnimScr_EfxAureolaOBJ3_1
AnimScr_EfxAureolaOBJ3_1: @ 08603BA4
	.incbin "fe6-base.gba", 0x603BA4, (0x603BC0 - 0x603BA4) @ length: 001C

	.global AnimScr_EfxAureolaOBJ3_2
AnimScr_EfxAureolaOBJ3_2: @ 08603BC0
	.incbin "fe6-base.gba", 0x603BC0, (0x6046D8 - 0x603BC0) @ length: 0B18
