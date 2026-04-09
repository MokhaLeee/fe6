	.include "asm_proc.inc"

	.data

	.global ProcScr_PlayRankTrialOBJ
ProcScr_PlayRankTrialOBJ: @ 0868B8AC
	PROC_19
	PROC_CALL NewPlayRankTrialOBJ_Time
	PROC_SLEEP 30
	PROC_CALL PlayRankTrialOBJ_Init
	PROC_SLEEP 20
	PROC_REPEAT PlayRankTrialOBJ_Loop
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

	.global ProcScr_PlayRankTrail
ProcScr_PlayRankTrail: @ 0868B99C
	PROC_19
	PROC_CALL_ARG _StartBgm, 53
	PROC_CALL LockGame
	PROC_CALL PlayRank_InitBgConf
	PROC_CALL PlayRankTrail_Init
	PROC_CALL FadeInBlackSpeed08
	PROC_SLEEP 1
	PROC_CALL StartGreenText
	PROC_REPEAT PlayRankTrail_Loop
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
