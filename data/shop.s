	.data

	.global Sprite_ShopGoldBox
Sprite_ShopGoldBox: @ 08691158
	.incbin "fe6-base.gba", 0x691158, (0x691190 - 0x691158) @ length: 0038

	.global ProcScr_GoldBox
ProcScr_GoldBox: @ 08691190
	.incbin "fe6-base.gba", 0x691190, (0x6911A0 - 0x691190) @ length: 0018

	.global ProcScr_ShopDrawHand
ProcScr_ShopDrawHand: @ 086911A0
	.incbin "fe6-base.gba", 0x6911A0, (0x6911A8 - 0x6911A0) @ length: 0004

	.global gpShopSt
gpShopSt: @ 086911A8
	.incbin "fe6-base.gba", 0x6911A8, (0x6911AC - 0x6911A8) @ length: 0004

	.global ProcScr_ArenaUiMain
ProcScr_ArenaUiMain: @ 086911AC
	.incbin "fe6-base.gba", 0x6911AC, (0x69130C - 0x6911AC) @ length: 0160

	.global ProcScr_ArenaUiResults
ProcScr_ArenaUiResults: @ 0869130C
	.incbin "fe6-base.gba", 0x69130C, (0x6913FC - 0x69130C) @ length: 0110

	.global ProcScr_ArenaUiResultBgm
ProcScr_ArenaUiResultBgm: @ 086913FC
	.incbin "fe6-base.gba", 0x6913FC, (0x69141C - 0x6913FC)

	.global EventScr_SuspendPrompt
EventScr_SuspendPrompt: @ 0869141C
	.incbin "fe6-base.gba", 0x69141C, (0x691480 - 0x69141C) @ length: 0064

/**
 * PROC_START_CHILD_LOCKING(0x086921E8)
 * PROC_END
 */
	.global ProcScr_TitleScreenHandler
ProcScr_TitleScreenHandler: @ 08691480
	.incbin "fe6-base.gba", 0x691480, (0x691494 - 0x691480) @ length: 0014

	.global gUnk_08691494
gUnk_08691494: @ 08691494
	.incbin "fe6-base.gba", 0x691494, (0x691498 - 0x691494) @ length: 0004

	.global gUnk_08691498
gUnk_08691498: @ 08691498
	.incbin "fe6-base.gba", 0x691498, (0x69149C - 0x691498) @ length: 0004

	.global gUnk_0869149C
gUnk_0869149C: @ 0869149C
	.incbin "fe6-base.gba", 0x69149C, (0x6914A0 - 0x69149C) @ length: 0004

	.global gUnk_086914A0
gUnk_086914A0: @ 086914A0
	.incbin "fe6-base.gba", 0x6914A0, (0x6914A4 - 0x6914A0) @ length: 0004

	.global gUnk_086914A4
gUnk_086914A4: @ 086914A4
	.incbin "fe6-base.gba", 0x6914A4, (0x6914A8 - 0x6914A4) @ length: 0004

	.global gUnk_086914A8
gUnk_086914A8: @ 086914A8
	.incbin "fe6-base.gba", 0x6914A8, (0x6914AC - 0x6914A8) @ length: 0004

	.global gUnk_086914AC
gUnk_086914AC: @ 086914AC
	.incbin "fe6-base.gba", 0x6914AC, (0x6914B0 - 0x6914AC) @ length: 0004

	.global gUnk_086914B0
gUnk_086914B0: @ 086914B0
	.incbin "fe6-base.gba", 0x6914B0, (0x6914B4 - 0x6914B0) @ length: 0004

	.global gUnk_086914B4
gUnk_086914B4: @ 086914B4
	.incbin "fe6-base.gba", 0x6914B4, (0x6914B8 - 0x6914B4) @ length: 0004

	.global gUnk_086914B8
gUnk_086914B8: @ 086914B8
	.incbin "fe6-base.gba", 0x6914B8, (0x6914BC - 0x6914B8) @ length: 0004

	.global gUnk_086914BC
gUnk_086914BC: @ 086914BC
	.incbin "fe6-base.gba", 0x6914BC, (0x6914C0 - 0x6914BC) @ length: 0004

	.global gUnk_086914C0
gUnk_086914C0: @ 086914C0
	.incbin "fe6-base.gba", 0x6914C0, (0x6914C4 - 0x6914C0) @ length: 0004

	.global gUnk_086914C4
gUnk_086914C4: @ 086914C4
	.incbin "fe6-base.gba", 0x6914C4, (0x6914C8 - 0x6914C4) @ length: 0004

	.global gUnk_086914C8
gUnk_086914C8: @ 086914C8
	.incbin "fe6-base.gba", 0x6914C8, (0x6914CC - 0x6914C8) @ length: 0004

	.global gUnk_086914CC
gUnk_086914CC: @ 086914CC
	.incbin "fe6-base.gba", 0x6914CC, (0x6914D0 - 0x6914CC) @ length: 0004

	.global gUnk_086914D0
gUnk_086914D0: @ 086914D0
	.incbin "fe6-base.gba", 0x6914D0, (0x6914D4 - 0x6914D0) @ length: 0004

	.global gUnk_086914D4
gUnk_086914D4: @ 086914D4
	.incbin "fe6-base.gba", 0x6914D4, (0x6914D8 - 0x6914D4) @ length: 0004

	.global gUnk_086914D8
gUnk_086914D8: @ 086914D8
	.incbin "fe6-base.gba", 0x6914D8, (0x6914DC - 0x6914D8) @ length: 0004

	.global gUnk_086914DC
gUnk_086914DC: @ 086914DC
	.incbin "fe6-base.gba", 0x6914DC, (0x6914E0 - 0x6914DC) @ length: 0004

	.global gUnk_086914E0
gUnk_086914E0: @ 086914E0
	.incbin "fe6-base.gba", 0x6914E0, (0x6914F0 - 0x6914E0) @ length: 0010

	.global gUnk_086914F0
gUnk_086914F0: @ 086914F0
	.incbin "fe6-base.gba", 0x6914F0, (0x6914F4 - 0x6914F0) @ length: 0004

	.global gUnk_086914F4
gUnk_086914F4: @ 086914F4
	.incbin "fe6-base.gba", 0x6914F4, (0x6914F8 - 0x6914F4) @ length: 0004

	.global gUnk_086914F8
gUnk_086914F8: @ 086914F8
	.incbin "fe6-base.gba", 0x6914F8, (0x69150C - 0x6914F8) @ length: 0014

	.global ProcScr_OpeningSequence
ProcScr_OpeningSequence: @ 0869150C
	.incbin "fe6-base.gba", 0x69150C, (0x691604 - 0x69150C) @ length: 00F8

	.global gUnk_08691604
gUnk_08691604: @ 08691604
	.incbin "fe6-base.gba", 0x691604, (0x69161C - 0x691604) @ length: 0018

	.global gUnk_0869161C
gUnk_0869161C: @ 0869161C
	.incbin "fe6-base.gba", 0x69161C, (0x691634 - 0x69161C) @ length: 0018

	.global gUnk_08691634
gUnk_08691634: @ 08691634
	.incbin "fe6-base.gba", 0x691634, (0x691644 - 0x691634) @ length: 0010

	.global gUnk_08691644
gUnk_08691644: @ 08691644
	.incbin "fe6-base.gba", 0x691644, (0x6916E5 - 0x691644) @ length: 00A1

	.global gUnk_086916E5
gUnk_086916E5: @ 086916E5
	.incbin "fe6-base.gba", 0x6916E5, (0x691738 - 0x6916E5) @ length: 0053

	.global gUnk_08691738
gUnk_08691738: @ 08691738
	.incbin "fe6-base.gba", 0x691738, (0x691778 - 0x691738) @ length: 0040

	.global gUnk_08691778
gUnk_08691778: @ 08691778
	.incbin "fe6-base.gba", 0x691778, (0x6917D8 - 0x691778) @ length: 0060

	.global gUnk_086917D8
gUnk_086917D8: @ 086917D8
	.incbin "fe6-base.gba", 0x6917D8, (0x691858 - 0x6917D8) @ length: 0080

	.global gUnk_08691858
gUnk_08691858: @ 08691858
	.incbin "fe6-base.gba", 0x691858, (0x691890 - 0x691858) @ length: 0038

	.global gUnk_08691890
gUnk_08691890: @ 08691890
	.incbin "fe6-base.gba", 0x691890, (0x6918B0 - 0x691890) @ length: 0020

	.global gUnk_086918B0
gUnk_086918B0: @ 086918B0
	.incbin "fe6-base.gba", 0x6918B0, (0x691B20 - 0x6918B0) @ length: 0270

	.global gUnk_08691B20
gUnk_08691B20: @ 08691B20
	.incbin "fe6-base.gba", 0x691B20, (0x691B38 - 0x691B20) @ length: 0018

	.global gUnk_08691B38
gUnk_08691B38: @ 08691B38
	.incbin "fe6-base.gba", 0x691B38, (0x691B50 - 0x691B38) @ length: 0018

	.global gUnk_08691B50
gUnk_08691B50: @ 08691B50
	.incbin "fe6-base.gba", 0x691B50, (0x691C78 - 0x691B50) @ length: 0128

	.global gUnk_08691C78
gUnk_08691C78: @ 08691C78
	.incbin "fe6-base.gba", 0x691C78, (0x691CA8 - 0x691C78) @ length: 0030

	.global gUnk_08691CA8
gUnk_08691CA8: @ 08691CA8
	.incbin "fe6-base.gba", 0x691CA8, (0x691CC0 - 0x691CA8) @ length: 0018

	.global gUnk_08691CC0
gUnk_08691CC0: @ 08691CC0
	.incbin "fe6-base.gba", 0x691CC0, (0x691DE8 - 0x691CC0) @ length: 0128

	.global gUnk_08691DE8
gUnk_08691DE8: @ 08691DE8
	.incbin "fe6-base.gba", 0x691DE8, (0x691DF8 - 0x691DE8) @ length: 0010

	.global gUnk_08691DF8
gUnk_08691DF8: @ 08691DF8
	.incbin "fe6-base.gba", 0x691DF8, (0x691E10 - 0x691DF8) @ length: 0018

	.global gUnk_08691E10
gUnk_08691E10: @ 08691E10
	.incbin "fe6-base.gba", 0x691E10, (0x691E30 - 0x691E10) @ length: 0020

	.global gUnk_08691E30
gUnk_08691E30: @ 08691E30
	.incbin "fe6-base.gba", 0x691E30, (0x691EB8 - 0x691E30) @ length: 0088

	.global gUnk_08691EB8
gUnk_08691EB8: @ 08691EB8
	.incbin "fe6-base.gba", 0x691EB8, (0x6920A0 - 0x691EB8) @ length: 01E8

	.global gUnk_086920A0
gUnk_086920A0: @ 086920A0
	.incbin "fe6-base.gba", 0x6920A0, (0x6920B8 - 0x6920A0) @ length: 0018

	.global gUnk_086920B8
gUnk_086920B8: @ 086920B8
	.incbin "fe6-base.gba", 0x6920B8, (0x692118 - 0x6920B8) @ length: 0060

	.global gUnk_08692118
gUnk_08692118: @ 08692118
	.incbin "fe6-base.gba", 0x692118, (0x69211C - 0x692118) @ length: 0004

	.global gUnk_0869211C
gUnk_0869211C: @ 0869211C
	.incbin "fe6-base.gba", 0x69211C, (0x692120 - 0x69211C) @ length: 0004

	.global gUnk_08692120
gUnk_08692120: @ 08692120
	.incbin "fe6-base.gba", 0x692120, (0x692124 - 0x692120) @ length: 0004

	.global gUnk_08692124
gUnk_08692124: @ 08692124
	.incbin "fe6-base.gba", 0x692124, (0x692128 - 0x692124) @ length: 0004

	.global gUnk_08692128
gUnk_08692128: @ 08692128
	.incbin "fe6-base.gba", 0x692128, (0x69212C - 0x692128) @ length: 0004

	.global gUnk_0869212C
gUnk_0869212C: @ 0869212C
	.incbin "fe6-base.gba", 0x69212C, (0x692130 - 0x69212C)

	.global ProcScr_OpAnim_08692130
ProcScr_OpAnim_08692130: @ 08692130
	.incbin "fe6-base.gba", 0x692130, (0x6921E8 - 0x692130)

	.global ProcScr_TitleScreen
ProcScr_TitleScreen: @ 086921E8
	.incbin "fe6-base.gba", 0x6921E8, (0x692240 - 0x6921E8)

	.global gUnk_08692240
gUnk_08692240: @ 08692240
	.incbin "fe6-base.gba", 0x692240, (0x692258 - 0x692240) @ length: 0018

	.global gUnk_08692258
gUnk_08692258: @ 08692258
	.incbin "fe6-base.gba", 0x692258, (0x692298 - 0x692258) @ length: 0040

	.global gUnk_08692298
gUnk_08692298: @ 08692298
	.incbin "fe6-base.gba", 0x692298, (0x6922F0 - 0x692298) @ length: 0058

	.global gUnk_086922F0
gUnk_086922F0: @ 086922F0
	.incbin "fe6-base.gba", 0x6922F0, (0x6922F8 - 0x6922F0) @ length: 0008

	.global gUnk_086922F8
gUnk_086922F8: @ 086922F8
	.incbin "fe6-base.gba", 0x6922F8, (0x692300 - 0x6922F8) @ length: 0008

	.global gUnk_08692300
gUnk_08692300: @ 08692300
	.incbin "fe6-base.gba", 0x692300, (0x69B668 - 0x692300) @ length: 9368
