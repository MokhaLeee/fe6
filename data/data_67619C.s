	.data


	.global gUnk_0867619C
gUnk_0867619C: @ 0867619C
	.incbin "fe6-base.gba", 0x67619C, (0x6761B4 - 0x67619C) @ length: ????

	.global MoveScr_Unk_086761B4
MoveScr_Unk_086761B4: @ 086761B4
	.incbin "fe6-base.gba", 0x6761B4, (0x6761CD - 0x6761B4) @ length: ????

	.global MoveScr_Unk_086761CD
MoveScr_Unk_086761CD: @ 086761CD
	.incbin "fe6-base.gba", 0x6761CD, (0x6761E7 - 0x6761CD) @ length: ????

	.global MoveScr_Unk_086761E7
MoveScr_Unk_086761E7: @ 086761E7
	.incbin "fe6-base.gba", 0x6761E7, (0x676204 - 0x6761E7) @ length: ????

	.global FightScr_Unk_08676204
FightScr_Unk_08676204: @ 08676204
	.incbin "fe6-base.gba", 0x676204, (0x676210 - 0x676204) @ length: ????

	.global FightScr_Unk_08676210
FightScr_Unk_08676210:
	.incbin "fe6-base.gba", 0x676210, (0x676218 - 0x676210)

	.global FightScr_Unk_08676218
FightScr_Unk_08676218:
	.incbin "fe6-base.gba", 0x676218, (0x676220 - 0x676218)

	.global ProcScr_Unk_08676220
ProcScr_Unk_08676220: @ 08676220
	.incbin "fe6-base.gba", 0x676220, (0x676250 - 0x676220) @ length: 0518

	.global EventScr_DemoScene
EventScr_DemoScene:
	.incbin "fe6-base.gba", 0x676250, (0x676738 - 0x676250)

	.global EventScrs_DemoScene
EventScrs_DemoScene: @ 08676738
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene
	.word EventScr_DemoScene

	.global gpBuf
gpBuf:
	.word gBuf

	.global MoveScr_TrueEnding_086767D0
MoveScr_TrueEnding_086767D0:
	.incbin "fe6-base.gba", 0x6767D0, (0x6767DB - 0x6767D0)

	.global MoveScr_TrueEnding_086767DB
MoveScr_TrueEnding_086767DB:
	.incbin "fe6-base.gba", 0x6767DB, (0x6767E6 - 0x6767DB)

	.global MoveScr_TrueEnding_086767E6
MoveScr_TrueEnding_086767E6:
	.incbin "fe6-base.gba", 0x6767E6, (0x6767EB - 0x6767E6)

	.global MoveScr_TrueEnding_086767EB
MoveScr_TrueEnding_086767EB:
	.incbin "fe6-base.gba", 0x6767EB, (0x6767F3 - 0x6767EB)

	.global MoveScr_TrueEnding_086767F3
MoveScr_TrueEnding_086767F3:
	.incbin "fe6-base.gba", 0x6767F3, (0x676805 - 0x6767F3)

	.global MoveScr_TrueEnding_08676805
MoveScr_TrueEnding_08676805:
	.incbin "fe6-base.gba", 0x676805, (0x676810 - 0x676805)

	.global MoveScr_TrueEnding_08676810
MoveScr_TrueEnding_08676810:
	.incbin "fe6-base.gba", 0x676810, (0x676823 - 0x676810)

	.global MoveScr_TrueEnding_08676823
MoveScr_TrueEnding_08676823:
	.incbin "fe6-base.gba", 0x676823, (0x676831 - 0x676823)

	.global MoveScr_TrueEnding_08676831
MoveScr_TrueEnding_08676831:
	.incbin "fe6-base.gba", 0x676831, (0x67683C - 0x676831)

	.global MoveScr_TrueEnding_0867683C
MoveScr_TrueEnding_0867683C:
	.incbin "fe6-base.gba", 0x67683C, (0x676844 - 0x67683C)

	.global ProcScr_Unk_08676844
ProcScr_Unk_08676844: @ 08676844
	.incbin "fe6-base.gba", 0x676844, (0x676854 - 0x676844) @ length: 0010

	.global ProcScr_Unk_08676854
ProcScr_Unk_08676854: @ 08676854
	.incbin "fe6-base.gba", 0x676854, (0x67686C - 0x676854) @ length: 0018

	.global ProcScr_Unk_0867686C
ProcScr_Unk_0867686C: @ 0867686C
	.incbin "fe6-base.gba", 0x67686C, (0x67688C - 0x67686C) @ length: 0020

	.global ProcScr_Unk_0867688C
ProcScr_Unk_0867688C: @ 0867688C
	.incbin "fe6-base.gba", 0x67688C, (0x6768C4 - 0x67688C) @ length: 0038

	.global ProcScr_Unk_086768C4
ProcScr_Unk_086768C4: @ 086768C4
	.incbin "fe6-base.gba", 0x6768C4, (0x6768DC - 0x6768C4) @ length: 0018

	.global ProcScr_Unk_086768DC
ProcScr_Unk_086768DC: @ 086768DC
	.incbin "fe6-base.gba", 0x6768DC, (0x6768FC - 0x6768DC) @ length: 0020

	.global ProcScr_Unk_086768FC
ProcScr_Unk_086768FC: @ 086768FC
	.incbin "fe6-base.gba", 0x6768FC, (0x676914 - 0x6768FC) @ length: 0018

	.global ProcScr_Unk_08676914
ProcScr_Unk_08676914: @ 08676914
	.incbin "fe6-base.gba", 0x676914, (0x67692C - 0x676914) @ length: 0018

	.global gUnk_0867692C
gUnk_0867692C: @ 0867692C
	.incbin "fe6-base.gba", 0x67692C, (0x67695C - 0x67692C) @ length: 0030

	.global gUnk_0867695C
gUnk_0867695C: @ 0867695C
	.incbin "fe6-base.gba", 0x67695C, (0x676998 - 0x67695C) @ length: 0778

	.global EventScr_TrueEnding_08676998
EventScr_TrueEnding_08676998:
	.incbin "fe6-base.gba", 0x676998, (0x676E14 - 0x676998)

	.global EventScr_TrueEnding_08676E14
EventScr_TrueEnding_08676E14:
	.incbin "fe6-base.gba", 0x676E14, (0x6770D4 - 0x676E14)

	.global EventScrs_EndingScene
EventScrs_EndingScene: @ 086770D4
	.word EventScr_TrueEnding
	.word EventScr_TrueEnding
	.word EventScr_Ending

	.global EventScr_TrueEnding
EventScr_TrueEnding: @ 086770E0
	.incbin "fe6-base.gba", 0x6770E0, (0x6771CC - 0x6770E0)

	.global EventScr_Ending
EventScr_Ending: @ 086771CC
	.incbin "fe6-base.gba", 0x6771CC, (0x6772DC - 0x6771CC)

	.global EventScr_TrueEnding_086772DC
EventScr_TrueEnding_086772DC:
	.incbin "fe6-base.gba", 0x6772DC, (0x6772FC - 0x6772DC)

	.global gUnk_086772FC
gUnk_086772FC: @ 086772FC
	.incbin "fe6-base.gba", 0x6772FC, (0x67730C - 0x6772FC) @ length: 0010

	.global gUnk_0867730C
gUnk_0867730C: @ 0867730C
	.incbin "fe6-base.gba", 0x67730C, (0x67731C - 0x67730C) @ length: 0010

	.global gUnk_0867731C
gUnk_0867731C: @ 0867731C
	.incbin "fe6-base.gba", 0x67731C, (0x677327 - 0x67731C) @ length: 000B

	.global gUnk_08677327
gUnk_08677327: @ 08677327
	.incbin "fe6-base.gba", 0x677327, (0x677348 - 0x677327) @ length: 0021

	.global ProcScr_Unk_08677348
ProcScr_Unk_08677348: @ 08677348
	.incbin "fe6-base.gba", 0x677348, (0x677360 - 0x677348) @ length: 0018

	.global gUnk_08677360
gUnk_08677360: @ 08677360
	.incbin "fe6-base.gba", 0x677360, (0x677378 - 0x677360) @ length: 0018

	.global ProcScr_Unk_08677378
ProcScr_Unk_08677378: @ 08677378
	.incbin "fe6-base.gba", 0x677378, (0x6773D8 - 0x677378) @ length: 0060
