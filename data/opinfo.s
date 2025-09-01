	.include "asm_proc.inc"
	.data

	.global ProcScr_OpInfoEnter
ProcScr_OpInfoEnter: @ 0868FEFC
	PROC_19
	PROC_CALL StartFastFadeFromBlack
	PROC_REPEAT WhileFadeExists
	PROC_SLEEP 1
	PROC_CALL OpInfoEnter_Init
	PROC_REPEAT OpInfoEnter_Loop_In
	PROC_REPEAT OpInfoEnter_Loop_Out
PROC_LABEL 4
	PROC_CALL OpInfoEnter_OnEnd
	PROC_END

	.global ProcScr_OpInfoView
ProcScr_OpInfoView: @ 0868FF4C
	PROC_19
	PROC_SLEEP 1
	PROC_CALL OpInfoView_Init
	PROC_REPEAT OpInfoView_Loop_FadeIn
	PROC_REPEAT OpInfoView_Loop_Display
	PROC_REPEAT OpInfoView_Loop_FadeOut
	PROC_END

	.global ProcScr_OpInfoIcon
ProcScr_OpInfoIcon: @ 0868FF84
	PROC_19
	PROC_SLEEP 1
	PROC_CALL OpInfoIcon_Init
	PROC_REPEAT OpInfoIcon_Loop_FadeIn
	PROC_REPEAT OpInfoIcon_LoopA
	PROC_REPEAT OpInfoIcon_LoopB
PROC_LABEL 4
	PROC_REPEAT OpInfoIcon_Loop_FadeOut
	PROC_END

	.global ProcScr_ClassInfoDisp
ProcScr_ClassInfoDisp: @ 0868FFCC
	PROC_SLEEP 0
	PROC_CALL ClassInfoDisp_ExecEkrMainMini
	PROC_SLEEP 2
	PROC_REPEAT ClassInfoDisp_Loop_Intro
	PROC_REPEAT ClassInfoDisp_Loop_Main
	PROC_REPEAT ClassInfoDisp_Block
PROC_LABEL 4
	PROC_CALL ClassInfoDisp_OnEnd
	PROC_END

	.global gUnk_08690014
gUnk_08690014: @ 08690014
	PROC_19
	PROC_SLEEP 3
	PROC_CALL func_fe6_08095AE0
	PROC_REPEAT func_fe6_08095BCC
PROC_LABEL 4
	PROC_CALL func_fe6_08095D28
	PROC_END

	.global Sprite_OpInfo_0869004C
Sprite_OpInfo_0869004C:
	.incbin "fe6-base.gba", 0x69004C, (0x690054 - 0x69004C)

	.global Sprite_OpInfo_08690054
Sprite_OpInfo_08690054:
	.incbin "fe6-base.gba", 0x690054, (0x69005C - 0x690054)

	.global Sprite_OpInfo_0869005C
Sprite_OpInfo_0869005C:
	.incbin "fe6-base.gba", 0x69005C, (0x690064 - 0x69005C)

	.global Sprite_OpInfo_08690064
Sprite_OpInfo_08690064:
	.incbin "fe6-base.gba", 0x690064, (0x69006C - 0x690064)

	.global Sprites_OpInfo_0869006C
Sprites_OpInfo_0869006C: @ 0869006C
	.incbin "fe6-base.gba", 0x69006C, 0x10

	.global Sprite_OpInfo_0869007C
Sprite_OpInfo_0869007C:
	.incbin "fe6-base.gba", 0x69007C, (0x6900BC - 0x69007C)

	.global Sprites_OpInfo_086900BC
Sprites_OpInfo_086900BC: @ 086900BC
	.incbin "fe6-base.gba", 0x6900BC, (0x6900DC - 0x6900BC) @ length: 0020

	.global Sprite_OpInfo_086900DC
Sprite_OpInfo_086900DC: @ 086900DC
	.incbin "fe6-base.gba", 0x6900DC, (0x6900F0 - 0x6900DC) @ length: 0014

	.global Sprite_OpInfo_086900F0
Sprite_OpInfo_086900F0: @ 086900F0
	.incbin "fe6-base.gba", 0x6900F0, (0x6900F8 - 0x6900F0) @ length: 0008

	.global Sprite_OpInfo_086900F8
Sprite_OpInfo_086900F8: @ 086900F8
	.incbin "fe6-base.gba", 0x6900F8, (0x690100 - 0x6900F8) @ length: 0008

	.global Sprite_OpInfo_08690100
Sprite_OpInfo_08690100: @ 08690100
	.incbin "fe6-base.gba", 0x690100, (0x690288 - 0x690100) @ length: 0188

	.global Sprites_OpInfo_08690288
Sprites_OpInfo_08690288: @ 08690288
	.incbin "fe6-base.gba", 0x690288, (0x69056C - 0x690288) @ length: 02E4

	.global gUnk_0869056C
gUnk_0869056C: @ 0869056C
	.incbin "fe6-base.gba", 0x69056C, (0x69058C - 0x69056C) @ length: 0020

	.global gUnk_0869058C
gUnk_0869058C: @ 0869058C
	.incbin "fe6-base.gba", 0x69058C, (0x6905B0 - 0x69058C) @ length: 0024

	.global gUnk_086905B0
gUnk_086905B0: @ 086905B0
	.incbin "fe6-base.gba", 0x6905B0, (0x6905F8 - 0x6905B0) @ length: 0048

	.global gUnk_086905F8
gUnk_086905F8: @ 086905F8
	.incbin "fe6-base.gba", 0x6905F8, (0x6909A4 - 0x6905F8) @ length: 03AC

	.global gUnk_086909A4
gUnk_086909A4: @ 086909A4
	.incbin "fe6-base.gba", 0x6909A4, (0x690A53 - 0x6909A4) @ length: 00AF

	.global gUnk_08690A53
gUnk_08690A53: @ 08690A53
	.incbin "fe6-base.gba", 0x690A53, (0x690A99 - 0x690A53) @ length: 0046

	.global gUnk_08690A99
gUnk_08690A99: @ 08690A99
	.incbin "fe6-base.gba", 0x690A99, (0x690C14 - 0x690A99) @ length: 017B

	.global gUnk_08690C14
gUnk_08690C14: @ 08690C14
	.incbin "fe6-base.gba", 0x690C14, (0x690D44 - 0x690C14) @ length: 0130

	.global gUnk_08690D44
gUnk_08690D44: @ 08690D44
	.incbin "fe6-base.gba", 0x690D44, (0x690E60 - 0x690D44) @ length: 011C
