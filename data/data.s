	.include "asm_proc.inc"

	.data

	.global ProcScr_0868B8AC
ProcScr_0868B8AC: @ 0868B8AC
	PROC_19
	PROC_CALL func_fe6_0808E6FC
	PROC_SLEEP 30
	PROC_CALL func_fe6_0808F8B8
	PROC_SLEEP 20
	PROC_REPEAT func_fe6_0808F984
	PROC_END

	.global ProcScr_PlayRank
ProcScr_PlayRank: @ 0868B8E4
	PROC_19
	PROC_CALL_ARG _StartBgm, 53
	PROC_CALL LockGame
	PROC_CALL PlayRank_InitBgConf
	PROC_CALL PlayRank_InitDisplay
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_CALL StartGreenText
	PROC_CALL func_fe6_0808F060
	PROC_REPEAT PlayRank_Loop
	PROC_REPEAT PlayRank_Idle
PROC_LABEL 0
	PROC_CALL PlayRank_End1
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_CALL PlayRank_End2
	PROC_CALL PlayRank_End3
	PROC_CALL func_fe6_08083930
PROC_LABEL 1
	PROC_CALL StartFastFadeFromBlack
	PROC_REPEAT WhileFadeExists
	PROC_CALL UnlockGame
	PROC_END

	.global ProcScr_0868B99C
ProcScr_0868B99C: @ 0868B99C
	PROC_19
	PROC_CALL_ARG _StartBgm, 53
	PROC_CALL LockGame
	PROC_CALL PlayRank_InitBgConf
	PROC_CALL func_fe6_0808FA14
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_CALL StartGreenText
	PROC_REPEAT func_fe6_0808FD14
	PROC_CALL PlayRank_End1
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_CALL PlayRank_End2
	PROC_CALL StartFastFadeFromBlack
	PROC_REPEAT WhileFadeExists
	PROC_CALL UnlockGame
	PROC_END

	.global BgConf_0868BA24
BgConf_0868BA24: @ 0868BA24
	.incbin "fe6-base.gba", 0x68BA24, (0x68BA3C - 0x68BA24) @ length: 0018

	.global gUnk_0868BA3C
gUnk_0868BA3C: @ 0868BA3C
	.incbin "fe6-base.gba", 0x68BA3C, (0x68BB1C - 0x68BA3C) @ length: 00E0

	.global gUnk_0868BB1C
gUnk_0868BB1C: @ 0868BB1C
	.incbin "fe6-base.gba", 0x68BB1C, (0x68BB3C - 0x68BB1C) @ length: 0020

	.global ProcScr_0868BB3C
ProcScr_0868BB3C: @ 0868BB3C
	PROC_19
	PROC_CALL func_fe6_080904F0
	PROC_REPEAT func_fe6_08090508
	PROC_END

	.global ProcScr_0868BB5C
ProcScr_0868BB5C: @ 0868BB5C
	PROC_19
	PROC_CALL func_fe6_080904F0
	PROC_REPEAT func_fe6_080905A0
	PROC_END

	.global ProcScr_0868BB7C
ProcScr_0868BB7C: @ 0868BB7C
	PROC_19
	PROC_CALL func_fe6_08090644
	PROC_REPEAT func_fe6_08090660
	PROC_END

	.global ProcScr_EndingCredit
ProcScr_EndingCredit: @ 0868BB9C
	PROC_19
	PROC_CALL EndingCredit_Init
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_REPEAT EndingCredit_WaitingDisp
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_SLEEP 60
	PROC_CALL EndingCredit_Ending
	PROC_END

	.global ProcScr_EndingCopyRight
ProcScr_EndingCopyRight: @ 0868BBEC
	PROC_19
	PROC_SLEEP 60
	PROC_CALL EndingCopyRight_Init
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_REPEAT EndingCopyRight_Loop
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_CALL_ARG _FadeBgmOut, 6
	PROC_SLEEP 90
	PROC_END

	.global ProcScr_EndingStep1_PutaMonologue
ProcScr_EndingStep1_PutaMonologue: @ 0868BC44
	PROC_19
	PROC_CALL EndingStep1_Init
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_REPEAT EndingStep1_Loop
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_CALL EndingStep1_End
	PROC_END

	.global ProcScr_Fin
ProcScr_Fin: @ 0868BC8C
	PROC_19
	PROC_SLEEP 60
	PROC_CALL Fin_Init
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_REPEAT Fin_Loop
	PROC_CALL_ARG _FadeBgmOut, 8
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_SLEEP 180
	PROC_END

	.global gUnk_0868BCE4
gUnk_0868BCE4: @ 0868BCE4
	.incbin "fe6-base.gba", 0x68BCE4, (0x68BDB4 - 0x68BCE4) @ length: 00D0

	.global ProcScr_0868BDB4
ProcScr_0868BDB4: @ 0868BDB4
	PROC_19
	PROC_CALL func_fe6_08090BC8
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_REPEAT func_fe6_08090D34
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_END

	.global ProcScr_Ending
ProcScr_Ending: @ 0868BDF4
	PROC_19
	PROC_CALL LockGame
	PROC_CALL LockBmDisplay
	PROC_CALL Ending_Init
	PROC_REPEAT Ending_Loop
	PROC_CALL UnlockGame
	PROC_END

	.global ProcScr_GameCredit
ProcScr_GameCredit: @ 0868BE2C
	PROC_19
	PROC_CALL func_fe6_0808FEC0
	PROC_REPEAT func_fe6_08090F48
	PROC_END

	.global ProcScr_EndingPInfo1Detail
ProcScr_EndingPInfo1Detail: @ 0868BE4C
	PROC_19
	PROC_CALL EndingPInfo1Detail_PutText
	PROC_SLEEP 1
	PROC_REPEAT EndingPInfo1Detail_WaitingTypewritter
	PROC_END

	.global ProcScr_EndingPInfo1
ProcScr_EndingPInfo1: @ 0868BE74
	PROC_19
	PROC_CALL FadeInBlackWithCallBack_Speed40
	PROC_SLEEP 1
	PROC_CALL CharacterEnding2_InitDisp
	PROC_CALL EndingPInfo1_StartMerge
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_CALL EndingPInfo1_DrawDetails
	PROC_REPEAT EndingPInfo1_Idle
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_CALL func_fe6_08091A24
	PROC_SLEEP 32
PROC_LABEL 99
	PROC_END

	.global ProcScr_0868BEEC
ProcScr_0868BEEC: @ 0868BEEC
	PROC_19
	PROC_CALL func_fe6_08091A64
	PROC_SLEEP 1
	PROC_REPEAT func_fe6_08091B94
	PROC_END

	.global ProcScr_0868BF14
ProcScr_0868BF14: @ 0868BF14
	PROC_19
	PROC_CALL func_fe6_08091C40
	PROC_SLEEP 1
	PROC_REPEAT func_fe6_08091D70
	PROC_END

	.global ProcScr_EndingPInfo2
ProcScr_EndingPInfo2: @ 0868BF3C
	PROC_19
	PROC_CALL FadeInBlackWithCallBack_Speed40
	PROC_SLEEP 1
	PROC_CALL CharacterEnding2_InitDisp
	PROC_CALL Ending_DrawDyadPInfo
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_REPEAT CharacterEnding2_Loop
	PROC_CALL FadeInBlackWithCallBack_Speed08
	PROC_SLEEP 1
	PROC_CALL CharacterEnding2_End
	PROC_SLEEP 32
PROC_LABEL 99
	PROC_END

	.global ProcScr_EndingPInfoFadeOut
ProcScr_EndingPInfoFadeOut: @ 0868BFAC
	PROC_19
	PROC_CALL PersonEndingInfo_Init
	PROC_REPEAT PersonEndingInfo_Loop
	PROC_END

	.global gPersonEndingInfo
gPersonEndingInfo: @ 0868BFCC
	.incbin "fe6-base.gba", 0x68BFCC, (0x68C2CC - 0x68BFCC) @ length: 0300
