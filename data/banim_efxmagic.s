
	.include "animscr.inc"
	.include "gba_sprites.inc"
	.include "asm_proc.inc"

	.section .data

	.global ProcScr_EfxLive
ProcScr_EfxLive: @ 085D2E3C
	PROC_19
	PROC_REPEAT EfxLive_Loop
	PROC_END

	.global ProcScr_EfxRelive
ProcScr_EfxRelive: @ 085D2E54
	PROC_19
	PROC_REPEAT EfxRelive_Loop
	PROC_END

	.global ProcScr_EfxRecover
ProcScr_EfxRecover: @ 085D2E6C
	PROC_19
	PROC_REPEAT EfxRecover_Loop
	PROC_END

	.global ProcScr_EfxReblow
ProcScr_EfxReblow: @ 085D2E84
	PROC_19
	PROC_REPEAT EfxReblow_Loop
	PROC_END

	.global ProcScr_EfxLiveBG
ProcScr_EfxLiveBG: @ 085D2E9C
	PROC_19
	PROC_REPEAT EfxLiveBG_Loop
	PROC_END

	.global ProcScr_EfxLiveBGCOL
ProcScr_EfxLiveBGCOL: @ 085D2EB4
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxLiveBGCOL_Loop
	PROC_END

	.global ProcScr_EfxLiveALPHA
ProcScr_EfxLiveALPHA: @ 085D2ED4
	PROC_19
	PROC_REPEAT EfxLiveALPHA_Delay
	PROC_REPEAT EfxLiveALPHA_Loop
	PROC_END

	.global ProcScr_EfxLiveOBJ
ProcScr_EfxLiveOBJ: @ 085D2EF4
	PROC_19
	PROC_REPEAT EfxLiveOBJ_Loop
	PROC_END

	.global ProcScr_EfxReserveOBJ
ProcScr_EfxReserveOBJ: @ 085D2F0C
	PROC_19
	PROC_REPEAT EfxReserveOBJ_Loop1
	PROC_REPEAT EfxReserveOBJ_Loop2
	PROC_END

	.global ProcScr_EfxReblowOBJ
ProcScr_EfxReblowOBJ: @ 085D2F2C
	PROC_19
	PROC_REPEAT EfxReblowOBJ_Loop1
	PROC_REPEAT EfxReblowOBJ_Loop2
	PROC_END

	.global ProcScr_EfxReserve
ProcScr_EfxReserve: @ 085D2F4C
	PROC_19
	PROC_REPEAT EfxReserve_Loop
	PROC_END

	.global ProcScr_EfxReserveBG
ProcScr_EfxReserveBG: @ 085D2F64
	PROC_19
	PROC_REPEAT EfxReserveBG_Loop
	PROC_END

	.global TsaArray_EfxReserveBG
TsaArray_EfxReserveBG: @ 085D2F7C
	.4byte Tsa_EfxReserveBG_081ADFEC
	.4byte Tsa_EfxReserveBG_081AE0F8
	.4byte Tsa_EfxReserveBG_081AE1F8
	.4byte Tsa_EfxReserveBG_081AE304

	.global ProcScr_EfxReserveBGCOL
ProcScr_EfxReserveBGCOL: @ 085D2F8C
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxReserveBGCOL_Loop
	PROC_END

	.global ProcScr_EfxReserveBG2
ProcScr_EfxReserveBG2: @ 085D2FAC
	PROC_19
	PROC_REPEAT EfxReserveBG2_Loop
	PROC_END

	.global TsaArray_EfxReserveBG2
TsaArray_EfxReserveBG2: @ 085D2FC4
	.4byte Tsa_EfxReserveBG2_081AE410

	.global ProcScr_EfxReserveBGCOL2
ProcScr_EfxReserveBGCOL2: @ 085D2FC8
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxReserveBGCOL2_Loop
	PROC_END

	.global ProcScr_EfxRest
ProcScr_EfxRest: @ 085D2FE8
	PROC_19
	PROC_REPEAT EfxRest_Loop
	PROC_END

	.global ProcScr_EfxRestBG
ProcScr_EfxRestBG: @ 085D3000
	PROC_19
	PROC_REPEAT EfxRestBG_Loop
	PROC_END

	.global TsaArray_EfxRestBG
TsaArray_EfxRestBG: @ 085D3018
	.4byte Tsa_EfxRestBG_081B1730
	.4byte Tsa_EfxRestBG_081B17DC
	.4byte Tsa_EfxRestBG_081B1890
	.4byte Tsa_EfxRestBG_081B1950
	.4byte Tsa_EfxRestBG_081B1A18
	.4byte Tsa_EfxRestBG_081B1AF4
	.4byte Tsa_EfxRestBG_081B1BD4
	.4byte Tsa_EfxRestBG_081B1CBC
	.4byte Tsa_EfxRestBG_081B1DAC
	.4byte Tsa_EfxRestBG_081B1EAC
	.4byte Tsa_EfxRestBG_081B1FB8
	.4byte Tsa_EfxRestBG_081B20D8
	.4byte Tsa_EfxRestBG_081B2208

	.global ImgArray_EfxRestBG
ImgArray_EfxRestBG: @ 085D304C
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081B029C
	.4byte Img_EfxRestBG_081B029C
	.4byte Img_EfxRestBG_081B029C
	.4byte Img_EfxRestBG_081B0994
	.4byte Img_EfxRestBG_081B0994
	.4byte Img_EfxRestBG_081B0FB4
	.4byte Img_EfxRestBG_081B0FB4

	.global ProcScr_EfxRestOBJ
ProcScr_EfxRestOBJ: @ 085D3080
	PROC_19
	PROC_ONEND EfxRestOBJ_Loop
	PROC_SLEEP 80
	PROC_END

	.global ProcScr_EfxSilence
ProcScr_EfxSilence: @ 085D30A0
	PROC_19
	PROC_REPEAT EfxSilence_Loop
	PROC_END

	.global ProcScr_EfxSilenceBG
ProcScr_EfxSilenceBG: @ 085D30B8
	PROC_19
	PROC_REPEAT EfxSilenceBG_Loop
	PROC_END

	.global TsaArray_EfxSilenceBG
TsaArray_EfxSilenceBG: @ 085D30D0
	.4byte Tsa_EfxSilenceBG_081B2E10
	.4byte Tsa_EfxSilenceBG_081B2F0C
	.4byte Tsa_EfxSilenceBG_081B2FF4
	.4byte Tsa_EfxSilenceBG_081B30DC
	.4byte Tsa_EfxSilenceBG_081B31C4
	.4byte Tsa_EfxSilenceBG_081B32C0
	.4byte Tsa_EfxSilenceBG_081B33A8
	.4byte Tsa_EfxSilenceBG_081B3440
	.4byte Tsa_EfxSilenceBG_081B3528
	.4byte Tsa_EfxSilenceBG_081B35C0
	.4byte Tsa_EfxSilenceBG_081B36A8
	.4byte Tsa_EfxSilenceBG_081B37A4
	.4byte Tsa_EfxSilenceBG_081B383C
	.4byte Tsa_EfxSilenceBG_081B3924
	.4byte Tsa_EfxSilenceBG_081B39BC
	.4byte Tsa_EfxSilenceBG_081B3AB8
	.4byte Tsa_EfxSilenceBG_081B3B50
	.4byte Tsa_EfxSilenceBG_081B3C60

	.global ProcScr_EfxSilenceOBJ
ProcScr_EfxSilenceOBJ: @ 085D3118
	PROC_19
	PROC_ONEND EfxSilenceOBJ_OnEnd
	PROC_SLEEP 40
	PROC_END

	.global ProcScr_EfxSleep
ProcScr_EfxSleep: @ 085D3138
	PROC_19
	PROC_REPEAT EfxSleep_Loop
	PROC_END

	.global ProcScr_EfxSleepBG
ProcScr_EfxSleepBG: @ 085D3150
	PROC_19
	PROC_REPEAT EfxSleepBG_Loop
	PROC_END

	.global TsaArray_EfxSleepBG
TsaArray_EfxSleepBG: @ 085D3168
	.4byte Tsa_EfxSleepBG_081B66A8
	.4byte Tsa_EfxSleepBG_081B6784
	.4byte Tsa_EfxSleepBG_081B6860
	.4byte Tsa_EfxSleepBG_081B693C
	.4byte Tsa_EfxSleepBG_081B6A18
	.4byte Tsa_EfxSleepBG_081B6AF4
	.4byte Tsa_EfxSleepBG_081B6BD0
	.4byte Tsa_EfxSleepBG_081B6CAC
	.4byte Tsa_EfxSleepBG_081B6D88
	.4byte Tsa_EfxSleepBG_081B6E64
	.4byte Tsa_EfxSleepBG_081B6F40
	.4byte Tsa_EfxSleepBG_081B701C
	.4byte Tsa_EfxSleepBG_081B70F8
	.4byte Tsa_EfxSleepBG_081B71D4
	.4byte Tsa_EfxSleepBG_081B72B0
	.4byte Tsa_EfxSleepBG_081B738C

	.global ProcScr_EfxSleepOBJ
ProcScr_EfxSleepOBJ: @ 085D31A8
	PROC_19
	PROC_ONEND EfxSleepOBJ_OnEnd
	PROC_SLEEP 80
	PROC_END

	.global ProcScr_EfxSleepOBJ2
ProcScr_EfxSleepOBJ2: @ 085D31C8
	PROC_19
	PROC_ONEND EfxSleepOBJ_OnEnd
	PROC_SLEEP 200
	PROC_END

	.global ProcScr_EfxSleepSE
ProcScr_EfxSleepSE: @ 085D31E8
	PROC_19
	PROC_ONEND EfxSleepSE_OnEnd
	PROC_SLEEP 1
	PROC_CALL EfxSleepSE_PlaySE
	PROC_SLEEP 54
	PROC_CALL EfxSleepSE_PlaySE
	PROC_SLEEP 65
	PROC_CALL EfxSleepSE_PlaySE
	PROC_END

	.global ProcScr_EfxHammarne
ProcScr_EfxHammarne: @ 085D3230
	PROC_19
	PROC_REPEAT EfxHammarne_Loop
	PROC_END

	.global ProcScr_EfxHammarneBG
ProcScr_EfxHammarneBG: @ 085D3248
	PROC_19
	PROC_REPEAT EfxHammarneBG_Loop
	PROC_END

	.global TsaArray_EfxHammarneBG
TsaArray_EfxHammarneBG: @ 085D3260
	.4byte Tsa_EfxHammarneBG_081B4294
	.4byte Tsa_EfxHammarneBG_081B4340
	.4byte Tsa_EfxHammarneBG_081B43F0
	.4byte Tsa_EfxHammarneBG_081B44B0
	.4byte Tsa_EfxHammarneBG_081B4578
	.4byte Tsa_EfxHammarneBG_081B4650
	.4byte Tsa_EfxHammarneBG_081B472C
	.4byte Tsa_EfxHammarneBG_081B4814
	.4byte Tsa_EfxHammarneBG_081B4904
	.4byte Tsa_EfxHammarneBG_081B4A04
	.4byte Tsa_EfxHammarneBG_081B4B10
	.4byte Tsa_EfxHammarneBG_081B4C30
	.4byte Tsa_EfxHammarneBG_081B4D60

	.global ImgArray_EfxHammarneBG
ImgArray_EfxHammarneBG: @ 085D3294
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081AFC70
	.4byte Img_EfxRestBG_081B029C
	.4byte Img_EfxRestBG_081B029C
	.4byte Img_EfxRestBG_081B029C
	.4byte Img_EfxRestBG_081B0994
	.4byte Img_EfxRestBG_081B0994
	.4byte Img_EfxRestBG_081B0FB4
	.4byte Img_EfxRestBG_081B0FB4

	.global ProcScr_EfxHammarneOBJ
ProcScr_EfxHammarneOBJ: @ 085D32C8
	PROC_19
	PROC_ONEND EfxHammarneOBJ_OnEnd
	PROC_SLEEP 80
	PROC_END

	.global ProcScr_EfxBerserk
ProcScr_EfxBerserk: @ 085D32E8
	PROC_19
	PROC_REPEAT EfxBerserk_Loop
	PROC_END

	.global ProcScr_EfxBerserkBG
ProcScr_EfxBerserkBG: @ 085D3300
	PROC_19
	PROC_REPEAT EfxBerserkBG_Loop
	PROC_END

	.global ProcScr_EfxBerserkCLONE
ProcScr_EfxBerserkCLONE: @ 085D3318
	PROC_19
	PROC_ONEND EfxBerserkCLONE_OnEnd
	PROC_REPEAT EfxBerserkCLONE_Loop
	PROC_END

	.global ProcScr_EfxBerserkOBJ
ProcScr_EfxBerserkOBJ: @ 085D3338
	PROC_19
	PROC_ONEND EfxBerserkOBJ_OnEnd
	PROC_REPEAT EfxBerserkOBJ_Loop1
	PROC_SLEEP 7
	PROC_REPEAT EfxBerserkOBJ_Loop2
	PROC_SLEEP 3
	PROC_REPEAT EfxBerserkOBJ_Loop3
	PROC_SLEEP 7
	PROC_REPEAT EfxBerserkOBJ_Loop4
	PROC_SLEEP 3
	PROC_REPEAT EfxBerserkOBJ_Loop5
	PROC_SLEEP 7
	PROC_REPEAT EfxBerserkOBJ_Loop6
	PROC_SLEEP 3
	PROC_REPEAT EfxBerserkOBJ_Loop7
	PROC_SLEEP 7
	PROC_REPEAT EfxBerserkOBJ_Loop8
	PROC_SLEEP 3
	PROC_REPEAT EfxBerserkOBJ_Loop9
	PROC_SLEEP 7
	PROC_REPEAT EfxBerserkOBJ_Loop10
	PROC_SLEEP 17
	PROC_END

	.global ProcScr_EfxMshield
ProcScr_EfxMshield: @ 085D33F0
	PROC_19
	PROC_REPEAT EfxMshield_Loop
	PROC_END

	.global ProcScr_EfxMshieldBG
ProcScr_EfxMshieldBG: @ 085D3408
	PROC_19
	PROC_REPEAT EfxMshieldBG_Loop
	PROC_END

	.global TsaArray_EfxMshieldBG
TsaArray_EfxMshieldBG: @ 085D3420
	.4byte Tsa_EfxMshieldBG_081B8974
	.4byte Tsa_EfxMshieldBG_081B8A2C
	.4byte Tsa_EfxMshieldBG_081B8AF0
	.4byte Tsa_EfxMshieldBG_081B8BE0
	.4byte Tsa_EfxMshieldBG_081B8D10

	.global ProcScr_EfxMshieldOBJ
ProcScr_EfxMshieldOBJ: @ 085D3434
	PROC_19
	PROC_ONEND EfxMshieldOBJ_OnEnd
	PROC_SLEEP 220
	PROC_END

	.global ProcScr_EfxMshieldOBJ2
ProcScr_EfxMshieldOBJ2: @ 085D3454
	PROC_19
	PROC_ONEND EfxMshieldOBJ_OnEnd
	PROC_SLEEP 110
	PROC_END
