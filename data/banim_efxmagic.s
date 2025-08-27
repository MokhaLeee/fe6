
	.include "animscr.inc"
	.include "gba_sprites.inc"
	.include "asm_proc.inc"

	.section .data

	.global ProcScr_EfxFimbulvetrBGTR
ProcScr_EfxFimbulvetrBGTR: @ 085D14EC
	PROC_19
	PROC_REPEAT EfxFimbulvetrBGTR_Loop
	PROC_END

	.global TsaArray_EfxFimbulvetrBGTR
TsaArray_EfxFimbulvetrBGTR: @ 085D1504
	.4byte Tsa_EfxFimbulvetrBGTR_081521E0
	.4byte Tsa_EfxFimbulvetrBGTR_081523CC
	.4byte Tsa_EfxFimbulvetrBGTR_081525A4
	.4byte Tsa_EfxFimbulvetrBGTR_0815276C
	.4byte Tsa_EfxFimbulvetrBGTR_081529A0
	.4byte Tsa_EfxFimbulvetrBGTR_08152BE8

	.global ImgArray_EfxFimbulvetrBGTR
ImgArray_EfxFimbulvetrBGTR: @ 085D151C
	.4byte Img_EfxFimbulvetrBGTR_0814B39C
	.4byte Img_EfxFimbulvetrBGTR_0814C5A4
	.4byte Img_EfxFimbulvetrBGTR_0814D700
	.4byte Img_EfxFimbulvetrBGTR_0814E784
	.4byte Img_EfxFimbulvetrBGTR_0814FBC4
	.4byte Img_EfxFimbulvetrBGTR_08150F7C

	.global ProcScr_EfxFimbulvetrBG
ProcScr_EfxFimbulvetrBG: @ 085D1534
	PROC_19
	PROC_REPEAT EfxFimbulvetrBG_Loop
	PROC_END

	.global TsaArray_EfxFimbulvetrBG
TsaArray_EfxFimbulvetrBG: @ 085D154C
	.4byte Tsa_EfxFimbulvetrBG_0814A4B8
	.4byte Tsa_EfxFimbulvetrBG_0814A55C
	.4byte Tsa_EfxFimbulvetrBG_0814A604
	.4byte Tsa_EfxFimbulvetrBG_0814A6C0
	.4byte Tsa_EfxFimbulvetrBG_0814A794
	.4byte Tsa_EfxFimbulvetrBG_0814A890
	.4byte Tsa_EfxFimbulvetrBG_0814A9D0
	.4byte Tsa_EfxFimbulvetrBG_0814AB68
	.4byte Tsa_EfxFimbulvetrBG_0814AD3C
	.4byte Tsa_EfxFimbulvetrBG_0814AF4C
	.4byte Tsa_EfxFimbulvetrBG_0814B16C

	.global ImgArray_EfxFimbulvetrBG
ImgArray_EfxFimbulvetrBG: @ 085D1578
	.4byte Img_EfxFimbulvetrBG_08144A20
	.4byte Img_EfxFimbulvetrBG_08144A20
	.4byte Img_EfxFimbulvetrBG_08144A20
	.4byte Img_EfxFimbulvetrBG_08144A20
	.4byte Img_EfxFimbulvetrBG_08144A20
	.4byte Img_EfxFimbulvetrBG_08144A20
	.4byte Img_EfxFimbulvetrBG_08145CF0
	.4byte Img_EfxFimbulvetrBG_08145CF0
	.4byte Img_EfxFimbulvetrBG_081475A0
	.4byte Img_EfxFimbulvetrBG_081489E4
	.4byte Img_EfxFimbulvetrBG_081489E4

	.global ProcScr_EfxFimbulvetrOBJ
ProcScr_EfxFimbulvetrOBJ: @ 085D15A4
	PROC_19
	PROC_REPEAT EfxFimbulvetrOBJ_Loop
	PROC_END

	.global ProcScr_EfxFimbulvetrOBJ2
ProcScr_EfxFimbulvetrOBJ2: @ 085D15BC
	PROC_19
	PROC_REPEAT EfxFimbulvetrOBJ2_Loop
	PROC_END

	.global ProcScr_EfxFimbulvetrOBJ2Fall
ProcScr_EfxFimbulvetrOBJ2Fall: @ 085D15D4
	PROC_19
	PROC_REPEAT EfxFimbulvetrOBJ2Fall_Loop
	PROC_END

	.global ProcScr_EfxThunderstorm
ProcScr_EfxThunderstorm: @ 085D15EC
	PROC_19
	PROC_REPEAT EfxThunderstorm_Loop
	PROC_END

	.global ProcScr_EfxThunderstormBG
ProcScr_EfxThunderstormBG: @ 085D1604
	PROC_19
	PROC_REPEAT EfxThunderstormBG_Loop
	PROC_END

	.global ImgArray_EfxThunderstormBG
ImgArray_EfxThunderstormBG: @ 085D161C
	.4byte Img_EfxThunderstormBG_0813BD94
	.4byte Img_EfxThunderstormBG_0813BD94
	.4byte Img_EfxThunderstormBG_0813BD94
	.4byte Img_EfxThunderstormBG_0813BD94
	.4byte Img_EfxThunderstormBG_0813C964
	.4byte Img_EfxThunderstormBG_0813C964
	.4byte Img_EfxThunderstormBG_0813C964
	.4byte Img_EfxThunderstormBG_0813C964
	.4byte Img_EfxThunderstormBG_0813C964
	.4byte Img_EfxThunderstormBG_0813C964
	.4byte Img_EfxThunderstormBG_0813D9D0

	.global TsaArray_EfxThunderstormBG
TsaArray_EfxThunderstormBG: @ 085D1648
	.4byte Tsa_EfxThunderstormBG_0813E7BC
	.4byte Tsa_EfxThunderstormBG_0813E950
	.4byte Tsa_EfxThunderstormBG_0813EB58
	.4byte Tsa_EfxThunderstormBG_0813ECBC
	.4byte Tsa_EfxThunderstormBG_0813ED9C
	.4byte Tsa_EfxThunderstormBG_0813EEB4
	.4byte Tsa_EfxThunderstormBG_0813F060
	.4byte Tsa_EfxThunderstormBG_0813F180
	.4byte Tsa_EfxThunderstormBG_0813F26C
	.4byte Tsa_EfxThunderstormBG_0813F354
	.4byte Tsa_EfxThunderstormBG_0813F3EC

	.global ProcScr_EfxThunderstormOBJ
ProcScr_EfxThunderstormOBJ: @ 085D1674
	PROC_19
	PROC_REPEAT EfxThunderstormOBJ_Loop
	PROC_SLEEP 100
	PROC_REPEAT EfxThunderstormOBJ_End
	PROC_END

	.global ProcScr_EfxThunderstormCOLOR
ProcScr_EfxThunderstormCOLOR: @ 085D169C
	PROC_19
	PROC_SLEEP 94
	PROC_REPEAT EfxThunderstormCOLOR_LoopA
	PROC_SLEEP 3
	PROC_REPEAT EfxThunderstormCOLOR_LoopB
	PROC_SLEEP 20
	PROC_REPEAT EfxThunderstormCOLOR_LoopC
	PROC_END

	.global ProcScr_EfxThunderstormDARK
ProcScr_EfxThunderstormDARK: @ 085D16DC
	PROC_19
	PROC_REPEAT EfxThunderstormDARK_LoopA
	PROC_REPEAT EfxThunderstormDARK_LoopB
	PROC_END

	.global ProcScr_EfxAlacalibur
ProcScr_EfxAlacalibur: @ 085D16FC
	PROC_19
	PROC_REPEAT EfxAlacalibur_Loop
	PROC_END

	.global ProcScr_EfxAlacaliburBG
ProcScr_EfxAlacaliburBG: @ 085D1714
	PROC_19
	PROC_REPEAT EfxAlacaliburBG_Loop
	PROC_END

	.global TsaArray_EfxAlacaliburBG
TsaArray_EfxAlacaliburBG: @ 085D172C
	.4byte Tsa_EfxAlacaliburBG_0815B424
	.4byte Tsa_EfxAlacaliburBG_0815B5AC

	.global ProcScr_EfxAlacaliburBGCOL
ProcScr_EfxAlacaliburBGCOL: @ 085D1734
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxAlacaliburBGCOL_Loop
	PROC_END

	.global ProcScr_EfxAlacaliburOBJ
ProcScr_EfxAlacaliburOBJ: @ 085D1754
	PROC_19
	PROC_REPEAT EfxAlacaliburOBJ_Loop
	PROC_END

	.global ProcScr_EfxMistyrain
ProcScr_EfxMistyrain: @ 085D176C
	PROC_19
	PROC_REPEAT EfxMistyrain_Loop
	PROC_END

	.global ProcScr_EfxMistyrainBG
ProcScr_EfxMistyrainBG: @ 085D1784
	PROC_19
	PROC_REPEAT NewEfxMistyrainBG_Loop
	PROC_END

	.global TsaArray_EfxMistyrainBG
TsaArray_EfxMistyrainBG: @ 085D179C
	.4byte Tsa_EfxMistyrainBG_0815F8C0
	.4byte Tsa_EfxMistyrainBG_0815F9BC
	.4byte Tsa_EfxMistyrainBG_0815FABC
	.4byte Tsa_EfxMistyrainBG_0815FBC0
	.4byte Tsa_EfxMistyrainBG_0815FCB8
	.4byte Tsa_EfxMistyrainBG_0815FDC4
	.4byte Tsa_EfxMistyrainBG_0815FED0
	.4byte Tsa_EfxMistyrainBG_0815FFF0
	.4byte Tsa_EfxMistyrainBG_08160114
	.4byte Tsa_EfxMistyrainBG_081601FC
	.4byte Tsa_EfxMistyrainBG_081602D8
	.4byte Tsa_EfxMistyrainBG_08160398
	.4byte Tsa_EfxMistyrainBG_08160450
	.4byte Tsa_EfxMistyrainBG_081604F8
	.4byte Tsa_EfxMistyrainBG_081605B4
	.4byte Tsa_EfxMistyrainBG_0816068C
	.4byte Tsa_EfxMistyrainBG_0816076C
	.4byte Tsa_EfxMistyrainBG_0816085C
	.4byte Tsa_EfxMistyrainBG_08160958
	.4byte Tsa_EfxMistyrainBG_08160A4C
	.4byte Tsa_EfxMistyrainBG_08160B44
	.4byte Tsa_EfxMistyrainBG_08160C30
	.4byte Tsa_EfxMistyrainBG_08160D14
	.4byte Tsa_EfxMistyrainBG_08160DEC
	.4byte Tsa_EfxMistyrainBG_08160EBC
	.4byte Tsa_EfxMistyrainBG_08160F88
	.4byte Tsa_EfxMistyrainBG_08161050
	.4byte Tsa_EfxMistyrainBG_08161104
	.4byte Tsa_EfxMistyrainBG_081611B8
	.4byte Tsa_EfxMistyrainBG_08161258
	.4byte Tsa_EfxMistyrainBG_0816130C
	.4byte Tsa_EfxMistyrainBG_081613C8
	.4byte Tsa_EfxMistyrainBG_081614A4
	.4byte Tsa_EfxMistyrainBG_0816158C
	.4byte Tsa_EfxMistyrainBG_081616B0
	.4byte Tsa_EfxMistyrainBG_081617D0
	.4byte Tsa_EfxMistyrainBG_081618DC
	.4byte Tsa_EfxMistyrainBG_081619E8
	.4byte Tsa_EfxMistyrainBG_08161AE4
	.4byte Tsa_EfxMistyrainBG_08161BE4
	.4byte Tsa_EfxMistyrainBG_08161CE0

	.global ImgArray_EfxMistyrainBG
ImgArray_EfxMistyrainBG: @ 085D1840
	.4byte Img_EfxMistyrainBG_0815BEF4
	.4byte Img_EfxMistyrainBG_0815BEF4
	.4byte Img_EfxMistyrainBG_0815BEF4
	.4byte Img_EfxMistyrainBG_0815CAC4
	.4byte Img_EfxMistyrainBG_0815CAC4
	.4byte Img_EfxMistyrainBG_0815CAC4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815EA30
	.4byte Img_EfxMistyrainBG_0815EA30
	.4byte Img_EfxMistyrainBG_0815EA30
	.4byte Img_EfxMistyrainBG_0815EA30
	.4byte Img_EfxMistyrainBG_0815EA30
	.4byte Img_EfxMistyrainBG_0815EA30
	.4byte Img_EfxMistyrainBG_0815F0B4
	.4byte Img_EfxMistyrainBG_0815F0B4
	.4byte Img_EfxMistyrainBG_0815F0B4
	.4byte Img_EfxMistyrainBG_0815F0B4
	.4byte Img_EfxMistyrainBG_0815F610
	.4byte Img_EfxMistyrainBG_0815F610
	.4byte Img_EfxMistyrainBG_0815F610
	.4byte Img_EfxMistyrainBG_0815F610
	.4byte Img_EfxMistyrainBG_0815F610
	.4byte Img_EfxMistyrainBG_0815F610
	.4byte Img_EfxMistyrainBG_0815F610
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815D7D4
	.4byte Img_EfxMistyrainBG_0815CAC4
	.4byte Img_EfxMistyrainBG_0815CAC4
	.4byte Img_EfxMistyrainBG_0815CAC4
	.4byte Img_EfxMistyrainBG_0815BEF4
	.4byte Img_EfxMistyrainBG_0815BEF4
	.4byte Img_EfxMistyrainBG_0815BEF4

	.global ProcScr_EfxMistyrainOBJ
ProcScr_EfxMistyrainOBJ: @ 085D18E4
	PROC_19
	PROC_ONEND EfxMistyrainOBJ_OnEnd
	PROC_REPEAT EfxMistyrainOBJ1_Loop1
	PROC_SLEEP 80
	PROC_REPEAT EfxMistyrainOBJ1_Loop2
	PROC_SLEEP 11
	PROC_REPEAT EfxMistyrainOBJ1_Loop3
	PROC_SLEEP 22
	PROC_END

	.global ProcScr_EfxMistyrainOBJ2
ProcScr_EfxMistyrainOBJ2: @ 085D192C
	PROC_19
	PROC_ONEND EfxMistyrainOBJ_OnEnd
	PROC_REPEAT EfxMistyrainOBJ2_Loop1
	PROC_SLEEP 14
	PROC_REPEAT EfxMistyrainOBJ2_Loop2
	PROC_END

	.global ProcScr_EfxResire
ProcScr_EfxResire: @ 085D195C
	PROC_19
	PROC_REPEAT EfxResire_Loop
	PROC_END

	.global ProcScr_EfxResireBG
ProcScr_EfxResireBG: @ 085D1974
	PROC_19
	PROC_REPEAT EfxResireBG_Loop1
	PROC_REPEAT EfxResireBG_Loop2
	PROC_REPEAT EfxResireBG_Loop3
	PROC_REPEAT EfxResireBG_Loop4
	PROC_END

	.global ProcScr_EfxResireBG2
ProcScr_EfxResireBG2: @ 085D19A4
	PROC_19
	PROC_REPEAT EfxResireBG2_Loop
	PROC_END

	.global ImgArray_EfxResireBG
ImgArray_EfxResireBG: @ 085D19BC
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081629F4
	.4byte Img_EfxResireBG_081634C4
	.4byte Img_EfxResireBG_081634C4
	.4byte Img_EfxResireBG_081634C4
	.4byte Img_EfxResireBG_0816406C
	.4byte Img_EfxResireBG_0816406C
	.4byte Img_EfxResireBG_08164BC4
	.4byte Img_EfxResireBG_08164BC4
	.4byte Img_EfxResireBG_08165678
	.4byte Img_EfxResireBG_08165678
	.4byte Img_EfxResireBG_08166148
	.4byte Img_EfxResireBG_08166148
	.4byte Img_EfxResireBG_08166148
	.4byte Img_EfxResireBG_08166E0C
	.4byte Img_EfxResireBG_08166E0C
	.4byte Img_EfxResireBG_08166E0C
	.4byte Img_EfxResireBG_08167710
	.4byte Img_EfxResireBG_08167710
	.4byte Img_EfxResireBG_08167710
	.4byte Img_EfxResireBG_08167710
	.4byte Img_EfxResireBG_08167710
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_08167C64
	.4byte Img_EfxResireBG_0816857C
	.4byte Img_EfxResireBG_0816857C
	.4byte Img_EfxResireBG_0816857C
	.4byte Img_EfxResireBG_0816857C
	.4byte Img_EfxResireBG_081691B0
	.4byte Img_EfxResireBG_081691B0
	.4byte Img_EfxResireBG_081691B0
	.4byte Img_EfxResireBG_08169E54
	.4byte Img_EfxResireBG_08169E54
	.4byte Img_EfxResireBG_08169E54
	.4byte Img_EfxResireBG_0816AA48
	.4byte Img_EfxResireBG_0816AA48
	.4byte Img_EfxResireBG_0816AA48
	.4byte Img_EfxResireBG_0816AA48
	.4byte Img_EfxResireBG_0816AA48

	.global TsaArray_EfxResireBG
TsaArray_EfxResireBG: @ 085D1A88
	.4byte Tsa_EfxResireBG_0816B348
	.4byte Tsa_EfxResireBG_0816B478
	.4byte Tsa_EfxResireBG_0816B524
	.4byte Tsa_EfxResireBG_0816B5D4
	.4byte Tsa_EfxResireBG_0816B68C
	.4byte Tsa_EfxResireBG_0816B74C
	.4byte Tsa_EfxResireBG_0816B818
	.4byte Tsa_EfxResireBG_0816B8F8
	.4byte Tsa_EfxResireBG_0816B9E0
	.4byte Tsa_EfxResireBG_0816BAE8
	.4byte Tsa_EfxResireBG_0816BC04
	.4byte Tsa_EfxResireBG_0816BD40
	.4byte Tsa_EfxResireBG_0816BE90
	.4byte Tsa_EfxResireBG_0816BFE8
	.4byte Tsa_EfxResireBG_0816C140
	.4byte Tsa_EfxResireBG_0816C294
	.4byte Tsa_EfxResireBG_0816C3E4
	.4byte Tsa_EfxResireBG_0816C534
	.4byte Tsa_EfxResireBG_0816C66C
	.4byte Tsa_EfxResireBG_0816C798
	.4byte Tsa_EfxResireBG_0816C8B4
	.4byte Tsa_EfxResireBG_0816C9C0
	.4byte Tsa_EfxResireBG_0816CAB8
	.4byte Tsa_EfxResireBG_0816CBA4
	.4byte Tsa_EfxResireBG_0816CC74
	.4byte Tsa_EfxResireBG_0816CD30
	.4byte Tsa_EfxResireBG_0816CDE4
	.4byte Tsa_EfxResireBG_0816CE94
	.4byte Tsa_EfxResireBG_0816CF40
	.4byte Tsa_EfxResireBG_0816CFE8
	.4byte Tsa_EfxResireBG_0816D09C
	.4byte Tsa_EfxResireBG_0816D15C
	.4byte Tsa_EfxResireBG_0816D228
	.4byte Tsa_EfxResireBG_0816D2F0
	.4byte Tsa_EfxResireBG_0816D3B8
	.4byte Tsa_EfxResireBG_0816D48C
	.4byte Tsa_EfxResireBG_0816D568
	.4byte Tsa_EfxResireBG_0816D650
	.4byte Tsa_EfxResireBG_0816D744
	.4byte Tsa_EfxResireBG_0816D84C
	.4byte Tsa_EfxResireBG_0816D954
	.4byte Tsa_EfxResireBG_0816DA78
	.4byte Tsa_EfxResireBG_0816DB98
	.4byte Tsa_EfxResireBG_0816DCB4
	.4byte Tsa_EfxResireBG_0816DDC4
	.4byte Tsa_EfxResireBG_0816DED0
	.4byte Tsa_EfxResireBG_0816DFD0
	.4byte Tsa_EfxResireBG_0816E0C0
	.4byte Tsa_EfxResireBG_0816E19C
	.4byte Tsa_EfxResireBG_0816E268
	.4byte Tsa_EfxResireBG_0816E320

	.global ProcScr_EfxResireRST
ProcScr_EfxResireRST: @ 085D1B54
	PROC_19
	PROC_REPEAT EfxResireRST_Loop
	PROC_END

	.global ProcScr_EfxLightning
ProcScr_EfxLightning: @ 085D1B6C
	PROC_19
	PROC_REPEAT EfxLightning_Loop
	PROC_END

	.global ProcScr_EfxLightningBG
ProcScr_EfxLightningBG: @ 085D1B84
	PROC_19
	PROC_REPEAT EfxLightningBG_Loop
	PROC_END

	.global ImgArray_EfxLightningBG
ImgArray_EfxLightningBG: @ 085D1B9C
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156200
	.4byte Img_EfxLightningBG_08156518
	.4byte Img_EfxLightningBG_08156518
	.4byte Img_EfxLightningBG_08156518
	.4byte Img_EfxLightningBG_081571C8
	.4byte Img_EfxLightningBG_081571C8
	.4byte Img_EfxLightningBG_081571C8
	.4byte Img_EfxLightningBG_081571C8
	.4byte Img_EfxLightningBG_081571C8

	.global PalArray_EfxLightningBG
PalArray_EfxLightningBG: @ 085D1C20
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157C08
	.4byte Pal_EfxLightningBG_08157C08
	.4byte Pal_EfxLightningBG_08157C08
	.4byte Pal_EfxLightningBG_08157C08
	.4byte Pal_EfxLightningBG_08157C08
	.4byte Pal_EfxLightningBG_08157C08
	.4byte Pal_EfxLightningBG_08157C08
	.4byte Pal_EfxLightningBG_08157C08

	.global TsaArray_EfxLightningBG
TsaArray_EfxLightningBG: @ 085D1CA4
	.4byte Tsa_EfxLightningBG_08157C28
	.4byte Tsa_EfxLightningBG_08157D4C
	.4byte Tsa_EfxLightningBG_08157E6C
	.4byte Tsa_EfxLightningBG_08157F78
	.4byte Tsa_EfxLightningBG_08158074
	.4byte Tsa_EfxLightningBG_0815815C
	.4byte Tsa_EfxLightningBG_08158244
	.4byte Tsa_EfxLightningBG_08158328
	.4byte Tsa_EfxLightningBG_08158404
	.4byte Tsa_EfxLightningBG_081584E4
	.4byte Tsa_EfxLightningBG_081585D8
	.4byte Tsa_EfxLightningBG_081586CC
	.4byte Tsa_EfxLightningBG_081587D0
	.4byte Tsa_EfxLightningBG_081588D8
	.4byte Tsa_EfxLightningBG_081589F0
	.4byte Tsa_EfxLightningBG_08158B14
	.4byte Tsa_EfxLightningBG_08158C28
	.4byte Tsa_EfxLightningBG_08158CD8
	.4byte Tsa_EfxLightningBG_08158DE0
	.4byte Tsa_EfxLightningBG_08158F1C
	.4byte Tsa_EfxLightningBG_08159090
	.4byte Tsa_EfxLightningBG_08159228
	.4byte Tsa_EfxLightningBG_0815939C
	.4byte Tsa_EfxLightningBG_081594A8
	.4byte Tsa_EfxLightningBG_0815957C
	.4byte Tsa_EfxLightningBG_0815961C
	.4byte Tsa_EfxLightningBG_0815973C
	.4byte Tsa_EfxLightningBG_08159858
	.4byte Tsa_EfxLightningBG_0815996C
	.4byte Tsa_EfxLightningBG_08159A64
	.4byte Tsa_EfxLightningBG_08159B4C
	.4byte Tsa_EfxLightningBG_08159C1C
	.4byte Tsa_EfxLightningBG_08159CE0

	.global ProcScr_EfxPurge
ProcScr_EfxPurge: @ 085D1D28
	PROC_19
	PROC_REPEAT EfxPurge_Loop
	PROC_END

	.global ProcScr_EfxPurgeBG
ProcScr_EfxPurgeBG: @ 085D1D40
	PROC_19
	PROC_REPEAT EfxPurgeBG_Loop
	PROC_END

	.global ImgArray_EfxPurgeBG
ImgArray_EfxPurgeBG: @ 085D1D58
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_081531C8
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_08153A90
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_081541E0
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_08154BA4
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxLightningBG_081556F8
	.4byte Img_EfxPurgeBG_0819879C
	.4byte Img_EfxPurgeBG_0819879C
	.4byte Img_EfxPurgeBG_08198CF8
	.4byte Img_EfxPurgeBG_08198CF8
	.4byte Img_EfxPurgeBG_08199374
	.4byte Img_EfxPurgeBG_08199374
	.4byte Img_EfxPurgeBG_081999C0
	.4byte Img_EfxPurgeBG_081999C0
	.4byte Img_EfxPurgeBG_0819A174
	.4byte Img_EfxPurgeBG_0819A174
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte Img_EfxPurgeBG_0819A87C
	.4byte Img_EfxPurgeBG_0819AD98
	.4byte Img_EfxPurgeBG_0819B698
	.4byte Img_EfxPurgeBG_0819C04C
	.4byte Img_EfxPurgeBG_0819C9C0
	.4byte Img_EfxPurgeBG_0819D394
	.4byte Img_EfxPurgeBG_0819D394
	.4byte Img_EfxPurgeBG_0819E398
	.4byte Img_EfxPurgeBG_0819E398
	.4byte Img_EfxPurgeBG_0819F1E8
	.4byte Img_EfxPurgeBG_0819FCCC
	.4byte Img_EfxPurgeBG_081A0874
	.4byte Img_EfxPurgeBG_081A1410
	.4byte Img_EfxPurgeBG_081A1ED0
	.4byte Img_EfxPurgeBG_081A2948

	.global PalArray_EfxPurgeBG
PalArray_EfxPurgeBG: @ 085D1E90
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxLightningBG_08157BE8
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte Pal_EfxPurgeBG_081A3C4C
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C
	.4byte Pal_EfxPurgeBG_081A3C6C

	.global TsaArray_EfxPurgeBG
TsaArray_EfxPurgeBG: @ 085D1FC8
	.4byte Tsa_EfxPurgeBG_081A3C8C
	.4byte Tsa_EfxPurgeBG_081A3DB0
	.4byte Tsa_EfxPurgeBG_081A3ED0
	.4byte Tsa_EfxPurgeBG_081A3FDC
	.4byte Tsa_EfxPurgeBG_081A40D8
	.4byte Tsa_EfxPurgeBG_081A41C0
	.4byte Tsa_EfxPurgeBG_081A42A8
	.4byte Tsa_EfxPurgeBG_081A4388
	.4byte Tsa_EfxPurgeBG_081A4464
	.4byte Tsa_EfxPurgeBG_081A4544
	.4byte Tsa_EfxPurgeBG_081A4638
	.4byte Tsa_EfxPurgeBG_081A472C
	.4byte Tsa_EfxPurgeBG_081A4830
	.4byte Tsa_EfxPurgeBG_081A4938
	.4byte Tsa_EfxPurgeBG_081A4A50
	.4byte Tsa_EfxPurgeBG_081A4B74
	.4byte Tsa_EfxPurgeBG_081A4C88
	.4byte Tsa_EfxPurgeBG_081A4DAC
	.4byte Tsa_EfxPurgeBG_081A4ED0
	.4byte Tsa_EfxPurgeBG_081A4FE0
	.4byte Tsa_EfxPurgeBG_081A50E0
	.4byte Tsa_EfxPurgeBG_081A51C8
	.4byte Tsa_EfxPurgeBG_081A52A8
	.4byte Tsa_EfxPurgeBG_081A5384
	.4byte Tsa_EfxPurgeBG_081A5460
	.4byte Tsa_EfxPurgeBG_081A5544
	.4byte Tsa_EfxPurgeBG_081A5638
	.4byte Tsa_EfxPurgeBG_081A5728
	.4byte Tsa_EfxPurgeBG_081A582C
	.4byte Tsa_EfxPurgeBG_081A5934
	.4byte Tsa_EfxPurgeBG_081A5A48
	.4byte Tsa_EfxPurgeBG_081A5B6C
	.4byte Tsa_EfxPurgeBG_081A5C80
	.4byte Tsa_EfxPurgeBG_081A5DA4
	.4byte Tsa_EfxPurgeBG_081A5EC4
	.4byte Tsa_EfxPurgeBG_081A5FD0
	.4byte Tsa_EfxPurgeBG_081A60CC
	.4byte Tsa_EfxPurgeBG_081A61B4
	.4byte Tsa_EfxPurgeBG_081A629C
	.4byte Tsa_EfxPurgeBG_081A637C
	.4byte Tsa_EfxPurgeBG_081A6458
	.4byte Tsa_EfxPurgeBG_081A6538
	.4byte Tsa_EfxPurgeBG_081A662C
	.4byte Tsa_EfxPurgeBG_081A6720
	.4byte Tsa_EfxPurgeBG_081A6824
	.4byte Tsa_EfxPurgeBG_081A692C
	.4byte Tsa_EfxPurgeBG_081A6A44
	.4byte Tsa_EfxPurgeBG_081A6B68
	.4byte Tsa_EfxPurgeBG_081A6C78
	.4byte Tsa_EfxPurgeBG_081A6E8C
	.4byte Tsa_EfxPurgeBG_081A7048
	.4byte Tsa_EfxPurgeBG_081A7224
	.4byte Tsa_EfxPurgeBG_081A7428
	.4byte Tsa_EfxPurgeBG_081A7630
	.4byte Tsa_EfxPurgeBG_081A7844
	.4byte Tsa_EfxPurgeBG_081A7AA4
	.4byte Tsa_EfxPurgeBG_081A7CD8
	.4byte Tsa_EfxPurgeBG_081A7F4C
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte Tsa_EfxPurgeBG_081A8194
	.4byte Tsa_EfxPurgeBG_081A84F4
	.4byte Tsa_EfxPurgeBG_081A8848
	.4byte Tsa_EfxPurgeBG_081A8B58
	.4byte Tsa_EfxPurgeBG_081A8E3C
	.4byte Tsa_EfxPurgeBG_081A910C
	.4byte Tsa_EfxPurgeBG_081A93A4
	.4byte Tsa_EfxPurgeBG_081A963C
	.4byte Tsa_EfxPurgeBG_081A9868
	.4byte Tsa_EfxPurgeBG_081A9B1C
	.4byte Tsa_EfxPurgeBG_081A9DDC
	.4byte Tsa_EfxPurgeBG_081AA10C
	.4byte Tsa_EfxPurgeBG_081AA45C
	.4byte Tsa_EfxPurgeBG_081AA7D4
	.4byte Tsa_EfxPurgeBG_081AAB5C

	.global ProcScr_EfxPurgeOBJRND
ProcScr_EfxPurgeOBJRND: @ 085D2100
	PROC_19
	PROC_REPEAT EfxPurgeOBJRND_Loop
	PROC_SLEEP 69
	PROC_END

	.global Vecs_EfxPurgeOBJRND
Vecs_EfxPurgeOBJRND: @ 085D2120
	.4byte 0xD0, 0x30
	.4byte 0xA0, 0x90
	.4byte 0x40, 0x40
	.4byte 0xC0, 0x60
	.4byte 0x80, 0x30
	.4byte 0x20, 0x60
	.4byte 0x50, 0x80

	.global ProcScr_EfxPurgeOBJ
ProcScr_EfxPurgeOBJ: @ 085D2158
	PROC_19
	PROC_ONEND EfxPurgeOBJ_OnEnd
	PROC_SLEEP 69
	PROC_END

	.global ProcScr_EfxForblaze
ProcScr_EfxForblaze: @ 085D2178
	PROC_19
	PROC_REPEAT EfxForblaze_Loop
	PROC_END

	.global ProcScr_EfxForblazeBG1
ProcScr_EfxForblazeBG1: @ 085D2190
	PROC_19
	PROC_REPEAT EfxForblazeBG1_Loop
	PROC_END


	.global TsaArray_EfxForblazeBG1
TsaArray_EfxForblazeBG1: @ 085D21A8
	.4byte Tsa_EfxForblazeBG1_0814092C
	.4byte Tsa_EfxForblazeBG1_081409DC
	.4byte Tsa_EfxForblazeBG1_08140A98
	.4byte Tsa_EfxForblazeBG1_08140B60
	.4byte Tsa_EfxForblazeBG1_08140C30
	.4byte Tsa_EfxForblazeBG1_08140D00
	.4byte Tsa_EfxForblazeBG1_08140DCC
	.4byte Tsa_EfxForblazeBG1_08140E98
	.4byte Tsa_EfxForblazeBG1_08140F7C
	.4byte Tsa_EfxForblazeBG1_08141050
	.4byte Tsa_EfxForblazeBG1_08141114
	.4byte Tsa_EfxForblazeBG1_081411D4
	.4byte Tsa_EfxForblazeBG1_08141288

	.global ImgArray_EfxForblazeBG1
ImgArray_EfxForblazeBG1: @ 085D21DC
	.4byte Img_EfxForblazeBG1_0813F5E0
	.4byte Img_EfxForblazeBG1_0813F5E0
	.4byte Img_EfxForblazeBG1_0813F5E0
	.4byte Img_EfxForblazeBG1_0813F5E0
	.4byte Img_EfxForblazeBG1_0813F5E0
	.4byte Img_EfxForblazeBG1_0813F5E0
	.4byte Img_EfxForblazeBG1_0813FF7C
	.4byte Img_EfxForblazeBG1_0813FF7C
	.4byte Img_EfxForblazeBG1_0813FF7C
	.4byte Img_EfxForblazeBG1_0813FF7C
	.4byte Img_EfxForblazeBG1_0813FF7C
	.4byte Img_EfxForblazeBG1_0813FF7C
	.4byte Img_EfxForblazeBG1_0813FF7C

	.global ProcScr_EfxForblazeBGCOL1
ProcScr_EfxForblazeBGCOL1: @ 085D2210
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxForblazeBGCOL1_Loop
	PROC_END

	.global ProcScr_EfxForblazeBGCtrl1
ProcScr_EfxForblazeBGCtrl1: @ 085D2230
	PROC_19
	PROC_SLEEP 35
	PROC_REPEAT EfxForblazeBGCtrl1_Loop1
	PROC_SLEEP 35
	PROC_REPEAT EfxForblazeBGCtrl1_Loop2
	PROC_SLEEP 35
	PROC_REPEAT EfxForblazeBGCtrl1_Loop3
	PROC_END

	.global ProcScr_EfxForblazeOBJ
ProcScr_EfxForblazeOBJ: @ 085D2270
	PROC_19
	PROC_REPEAT EfxForblazeOBJ_Loop
	PROC_END

	.global gUnk_085D2288
gUnk_085D2288: @ 085D2288
	.4byte 0x14
	.4byte 0x6B
	.4byte 0xE4
	.4byte 0x2C
	.4byte 0xC3
	.4byte 0x54
	.4byte 0x85
	.4byte 0x1B
	.4byte 0xAC
	.4byte 0xDA
	.4byte 0x40
	.4byte 0x6C
	.4byte 0x94
	.4byte 0xE5
	.4byte 0xBF
	.4byte 0x56
	.4byte 0x20
	.4byte 0x81
	.4byte 0x0D
	.4byte 0x88
	.4byte 0xAC
	.4byte -1

	.global ProcScr_EfxForblazeOBJ2
ProcScr_EfxForblazeOBJ2: @ 085D22E0
	PROC_19
	PROC_REPEAT EfxForblazeOBJ2_Loop
	PROC_END

	.global ProcScr_EfxForblazeBG2
ProcScr_EfxForblazeBG2: @ 085D22F8
	PROC_19
	PROC_REPEAT EfxForblazeBG2_Loop
	PROC_END

	.global ProcScr_EfxForblazeOBJCtrl
ProcScr_EfxForblazeOBJCtrl: @ 085D2310
	PROC_19
	PROC_REPEAT EfxForblazeOBJCtrl_Loop
	PROC_END

	.global ProcScr_EfxForblazeOBJFall
ProcScr_EfxForblazeOBJFall: @ 085D2328
	PROC_19
	PROC_REPEAT EfxForblazeOBJFall_Loop
	PROC_END

	.global ProcScr_EfxForblazeRST
ProcScr_EfxForblazeRST: @ 085D2340
	PROC_19
	PROC_REPEAT EfxForblazeRST_Loop
	PROC_END

	.global ProcScr_EfxDivine
ProcScr_EfxDivine: @ 085D2358
	PROC_19
	PROC_REPEAT EfxDivine_Loop
	PROC_END

	.global ProcScr_EfxDivineBG
ProcScr_EfxDivineBG: @ 085D2370
	PROC_19
	PROC_REPEAT EfxDivineBG_Loop
	PROC_END

	.global ImgArray_EfxDivineBG
ImgArray_EfxDivineBG: @ 085D2388
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC

	.global TsaArray_EfxDivineBG
TsaArray_EfxDivineBG: @ 085D23D8
	.4byte Tsa_EfxDivineBG1_08179AB8
	.4byte Tsa_EfxDivineBG1_08179B58
	.4byte Tsa_EfxDivineBG1_08179C00
	.4byte Tsa_EfxDivineBG1_08179CA8
	.4byte Tsa_EfxDivineBG1_08179D58
	.4byte Tsa_EfxDivineBG1_08179E10
	.4byte Tsa_EfxDivineBG1_08179EDC
	.4byte Tsa_EfxDivineBG1_08179FA8
	.4byte Tsa_EfxDivineBG1_0817A07C
	.4byte Tsa_EfxDivineBG1_0817A154
	.4byte Tsa_EfxDivineBG1_0817A230
	.4byte Tsa_EfxDivineBG1_0817A30C
	.4byte Tsa_EfxDivineBG1_0817A3F0
	.4byte Tsa_EfxDivineBG1_0817A4A4
	.4byte Tsa_EfxDivineBG1_0817A540
	.4byte Tsa_EfxDivineBG1_0817A5DC
	.4byte Tsa_EfxDivineBG1_0817A678
	.4byte Tsa_EfxDivineBG1_0817A714
	.4byte Tsa_EfxDivineBG1_0817A7B0
	.4byte Tsa_EfxDivineBG1_0817A84C

	.global ImgArray_EfxDivineBG2
ImgArray_EfxDivineBG2: @ 085D2428
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC
	.4byte Img_EfxDivineBG1_081762DC

	.global TsaArray_EfxDivineBG2
TsaArray_EfxDivineBG2: @ 085D2434
	.4byte Tsa_EfxDivineBG2_0817A8E8
	.4byte Tsa_EfxDivineBG2_0817A984
	.4byte Tsa_EfxDivineBG2_0817AA20

	.global ImgArray_EfxDivineBG3
ImgArray_EfxDivineBG3: @ 085D2440
	.4byte Img_EfxDivineBG3_0816E3CC
	.4byte Img_EfxDivineBG3_0816E3CC
	.4byte Img_EfxDivineBG3_0816E980
	.4byte Img_EfxDivineBG3_0816F048
	.4byte Img_EfxDivineBG3_0816F688
	.4byte Img_EfxDivineBG3_0816FC90
	.4byte Img_EfxDivineBG3_081702F0
	.4byte Img_EfxDivineBG3_08170960
	.4byte Img_EfxDivineBG3_08170F9C
	.4byte Img_EfxDivineBG3_081715E4
	.4byte Img_EfxDivineBG3_08171CE8
	.4byte Img_EfxDivineBG3_081724A0
	.4byte Img_EfxDivineBG3_08172C94
	.4byte Img_EfxDivineBG3_0817346C
	.4byte Img_EfxDivineBG3_08173C88
	.4byte Img_EfxDivineBG3_08174408
	.4byte Img_EfxDivineBG3_08174B9C
	.4byte Img_EfxDivineBG3_081752D0
	.4byte Img_EfxDivineBG3_081752D0
	.4byte Img_EfxDivineBG3_08175D7C
	.4byte Img_EfxDivineBG3_08175D7C

	.global TsaArray_EfxDivineBG3
TsaArray_EfxDivineBG3: @ 085D2494
	.4byte Tsa_EfxDivineBG3_08176A8C
	.4byte Tsa_EfxDivineBG3_08176C20
	.4byte Tsa_EfxDivineBG3_08176E24
	.4byte Tsa_EfxDivineBG3_081770F4
	.4byte Tsa_EfxDivineBG3_081773C4
	.4byte Tsa_EfxDivineBG3_08177674
	.4byte Tsa_EfxDivineBG3_08177928
	.4byte Tsa_EfxDivineBG3_08177BB4
	.4byte Tsa_EfxDivineBG3_08177E38
	.4byte Tsa_EfxDivineBG3_081780AC
	.4byte Tsa_EfxDivineBG3_08178340
	.4byte Tsa_EfxDivineBG3_081785C8
	.4byte Tsa_EfxDivineBG3_08178864
	.4byte Tsa_EfxDivineBG3_08178AEC
	.4byte Tsa_EfxDivineBG3_08178D68
	.4byte Tsa_EfxDivineBG3_08178F98
	.4byte Tsa_EfxDivineBG3_081791E8
	.4byte Tsa_EfxDivineBG3_08179418
	.4byte Tsa_EfxDivineBG3_08179610
	.4byte Tsa_EfxDivineBG3_081797F4
	.4byte Tsa_EfxDivineBG3_08179990

	.global ProcScr_EfxDivineOBJ
ProcScr_EfxDivineOBJ: @ 085D24E8
	PROC_19
	PROC_REPEAT EfxDivineOBJ_Loop
	PROC_END

	.global ProcScr_EfxAureola
ProcScr_EfxAureola: @ 085D2500
	PROC_19
	PROC_REPEAT EfxAureola_Loop
	PROC_END

	.global ProcScr_EfxAureolaBG
ProcScr_EfxAureolaBG: @ 085D2518
	PROC_19
	PROC_REPEAT EfxAureolaBG_Loop
	PROC_END

	.global ImgArray_EfxAureolaBG
ImgArray_EfxAureolaBG: @ 085D2530
	.4byte Img_EfxAureolaBG2
	.4byte Img_EfxAureolaBG_081BA374
	.4byte Img_EfxAureolaBG_081BA374
	.4byte Img_EfxAureolaBG_081BA374
	.4byte Img_EfxAureolaBG_081BA374

	.global TsaArray_EfxAureolaBG
TsaArray_EfxAureolaBG: @ 085D2544
	.4byte Tsa_EfxAureolaBG_081BB3DC
	.4byte Tsa_EfxAureolaBG_081BB75C
	.4byte Tsa_EfxAureolaBG_081BB8E0
	.4byte Tsa_EfxAureolaBG_081BBA04
	.4byte Tsa_EfxAureolaBG_081BBB00

	.global ProcScr_EfxAureolaBG2
ProcScr_EfxAureolaBG2: @ 085D2558
	PROC_19
	PROC_REPEAT EfxAureolaBG2_Loop
	PROC_END

	.global ProcScr_EfxAureolaBG2COL
ProcScr_EfxAureolaBG2COL: @ 085D2570
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxAureolaBG2COL_Loop
	PROC_END

	.global ProcScr_EfxAureolaOBJ
ProcScr_EfxAureolaOBJ: @ 085D2590
	PROC_19
	PROC_REPEAT EfxAureolaOBJ_Loop
	PROC_END

	.global ProcScr_EfxAureolaOBJCtrl
ProcScr_EfxAureolaOBJCtrl: @ 085D25A8
	PROC_19
	PROC_REPEAT EfxAureolaOBJCtrl_Loop
	PROC_END

	.global ProcScr_EfxAureolaOBJ2
ProcScr_EfxAureolaOBJ2: @ 085D25C0
	PROC_19
	PROC_REPEAT EfxAureolaOBJ2_Loop
	PROC_END

	.global ProcScr_EfxAureolaOBJ3
ProcScr_EfxAureolaOBJ3: @ 085D25D8
	PROC_19
	PROC_REPEAT EfxAureolaOBJ3_Loop
	PROC_END

	.global ProcScr_EfxAureolaOBJ3Ctrl
ProcScr_EfxAureolaOBJ3Ctrl: @ 085D25F0
	PROC_19
	PROC_REPEAT EfxAureolaOBJ3Ctrl_Loop
	PROC_END

	.global ProcScr_EfxApocalypse
ProcScr_EfxApocalypse: @ 085D2608
	PROC_19
	PROC_REPEAT EfxApocalypse_Loop
	PROC_END

	.global ProcScr_EfxApocalypseBG
ProcScr_EfxApocalypseBG: @ 085D2620
	PROC_19
	PROC_REPEAT EfxApocalypseBG_Loop
	PROC_END

	.global ProcScr_EfxApocalypseBGCtrl
ProcScr_EfxApocalypseBGCtrl: @ 085D2638
	PROC_19
	PROC_SLEEP 145
	PROC_REPEAT EfxApocalypseBGCtrl_Loop
	PROC_END

	.global ProcScr_EfxApocalypseBGCOL
ProcScr_EfxApocalypseBGCOL: @ 085D2658
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxApocalypseBGCOL_Loop
	PROC_END

	.global ProcScr_EfxApocalypseOBJ
ProcScr_EfxApocalypseOBJ: @ 085D2678
	PROC_19
	PROC_SLEEP 195
	PROC_REPEAT EfxApocalypseOBJ_Loop1
	PROC_REPEAT EfxApocalypseOBJ_Loop2
	PROC_REPEAT EfxApocalypseOBJ_Loop3
	PROC_REPEAT EfxApocalypseOBJ_Loop4
	PROC_END

	.global AnimArray_EfxApocalypseOBJ
AnimArray_EfxApocalypseOBJ: @ 085D26B0
	.4byte AnimScr_085EB93C
	.4byte AnimScr_085EB944
	.4byte AnimScr_085EB94C
	.4byte AnimScr_085EB954
	.4byte AnimScr_085EB95C
	.4byte AnimScr_085EB964
	.4byte AnimScr_085EB96C
	.4byte AnimScr_085EB974

	.global ProcScr_EfxApocalypseBGCOL2
ProcScr_EfxApocalypseBGCOL2: @ 085D26D0
	PROC_19
	PROC_MARK 10
	PROC_REPEAT EfxApocalypseBGCOL2_Loop
	PROC_END

	.global ProcScr_EfxApocalypseDummy
ProcScr_EfxApocalypseDummy: @ 085D26F0
	PROC_19
	PROC_REPEAT EfxApocalypseDummy_Loop
	PROC_END

	.global ProcScr_EfxApocalypseBgFlash1
ProcScr_EfxApocalypseBgFlash1: @ 085D2708
	PROC_19
	PROC_REPEAT EfxApocalypseBgFlash1_Loop
	PROC_END

	.global ProcScr_EfxApocalypseBgFlash2
ProcScr_EfxApocalypseBgFlash2: @ 085D2720
	PROC_19
	PROC_REPEAT EfxApocalypseBgFlash2_Loop1
	PROC_REPEAT EfxApocalypseBgFlash2_Loop2
	PROC_END

	.global ProcScr_EfxApocalypseBG2
ProcScr_EfxApocalypseBG2: @ 085D2740
	PROC_19
	PROC_REPEAT EfxApocalypseBG2_Loop
	PROC_END

	.global ImgArray_EfxApocalypseBG2
ImgArray_EfxApocalypseBG2: @ 085D2758
	.4byte Img_EfxApocalypseBG2_0817BBD4
	.4byte Img_EfxApocalypseBG2_0817D4E0
	.4byte Img_EfxApocalypseBG2_0817ED8C
	.4byte Img_EfxApocalypseBG2_081804F4

	.global TsaArray_EfxApocalypseBG2
TsaArray_EfxApocalypseBG2: @ 085D2768
	.4byte Tsa_EfxApocalypseBG2_08181E80
	.4byte Tsa_EfxApocalypseBG2_08182320
	.4byte Tsa_EfxApocalypseBG2_081827B0
	.4byte Tsa_EfxApocalypseBG2_08182C4C

	.global ProcScr_EfxApocalypseOBJ2
ProcScr_EfxApocalypseOBJ2: @ 085D2778
	PROC_19
	PROC_REPEAT EfxApocalypseOBJ2_Loop1
	PROC_REPEAT EfxApocalypseOBJ2_Loop2
	PROC_END

	.global ProcScr_EfxApocalypseOBJ3
ProcScr_EfxApocalypseOBJ3: @ 085D2798
	PROC_19
	PROC_REPEAT EfxApocalypseOBJ3_Loop
	PROC_END

	.global DuraArray_EfxApocalypseOBJ3RND
DuraArray_EfxApocalypseOBJ3RND: @ 085D27B0
	.incbin "fe6-base.gba", 0x5D27B0, (0x5D287C - 0x5D27B0) @ length: 00CC

	.global LoArray_EfxApocalypseOBJ3RND
LoArray_EfxApocalypseOBJ3RND: @ 085D287C
	.incbin "fe6-base.gba", 0x5D287C, (0x5D2944 - 0x5D287C) @ length: 00C8

	.global StateArray_EfxApocalypseOBJ3RND
StateArray_EfxApocalypseOBJ3RND: @ 085D2944
	.incbin "fe6-base.gba", 0x5D2944, (0x5D2A0C - 0x5D2944) @ length: 00C8

	.global ProcScr_EfxApocalypseOBJ3RND
ProcScr_EfxApocalypseOBJ3RND: @ 085D2A0C
	PROC_19
	PROC_REPEAT EfxApocalypseOBJ3RND_Loop
	PROC_END

	.global ProcScr_EfxHazymoon
ProcScr_EfxHazymoon: @ 085D2A24
	PROC_19
	PROC_REPEAT EfxHazymoon_Loop
	PROC_END

	.global ProcScr_EfxHazymoonBG
ProcScr_EfxHazymoonBG: @ 085D2A3C
	PROC_19
	PROC_REPEAT EfxHazymoonBG_Loop
	PROC_END

	.global TsaArray_EfxHazymoonBG
TsaArray_EfxHazymoonBG: @ 085D2A54
	.4byte Tsa_EfxHazymoonBG_0818BC0C
	.4byte Tsa_EfxHazymoonBG_0818BDB0
	.4byte Tsa_EfxHazymoonBG_0818BE50
	.4byte Tsa_EfxHazymoonBG_0818BEF0
	.4byte Tsa_EfxHazymoonBG_0818BFA4
	.4byte Tsa_EfxHazymoonBG_0818C058
	.4byte Tsa_EfxHazymoonBG_0818C10C
	.4byte Tsa_EfxHazymoonBG_0818C1E8
	.4byte Tsa_EfxHazymoonBG_0818C2C4
	.4byte Tsa_EfxHazymoonBG_0818C3D8
	.4byte Tsa_EfxHazymoonBG_0818C4EC
	.4byte Tsa_EfxHazymoonBG_0818C600
	.4byte Tsa_EfxHazymoonBG_0818C714
	.4byte Tsa_EfxHazymoonBG_0818C828
	.4byte Tsa_EfxHazymoonBG_0818C934
	.4byte Tsa_EfxHazymoonBG_0818CA0C
	.4byte Tsa_EfxHazymoonBG_0818CB1C
	.4byte Tsa_EfxHazymoonBG_0818CC84
	.4byte Tsa_EfxHazymoonBG_0818CE48
	.4byte Tsa_EfxHazymoonBG_0818D00C
	.4byte Tsa_EfxHazymoonBG_0818D1C8
	.4byte Tsa_EfxHazymoonBG_0818D378
	.4byte Tsa_EfxHazymoonBG_0818D528
	.4byte Tsa_EfxHazymoonBG_0818D6D8
	.4byte Tsa_EfxHazymoonBG_0818D87C
	.4byte Tsa_EfxHazymoonBG_0818DA14
	.4byte Tsa_EfxHazymoonBG_0818DBA4

	.global ImgArray_EfxHazymoonBG
ImgArray_EfxHazymoonBG: @ 085D2AC0
	.4byte Img_EfxHazymoonBG_0818398C
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_08183CD4
	.4byte Img_EfxHazymoonBG_081845A8
	.4byte Img_EfxHazymoonBG_081845A8
	.4byte Img_EfxHazymoonBG_081845A8
	.4byte Img_EfxHazymoonBG_081855E4
	.4byte Img_EfxHazymoonBG_08186250
	.4byte Img_EfxHazymoonBG_08186E6C
	.4byte Img_EfxHazymoonBG_081879C4
	.4byte Img_EfxHazymoonBG_08188518
	.4byte Img_EfxHazymoonBG_08188FC8
	.4byte Img_EfxHazymoonBG_081899F0
	.4byte Img_EfxHazymoonBG_0818A2EC
	.4byte Img_EfxHazymoonBG_0818ABB8
	.4byte Img_EfxHazymoonBG_0818B438

	.global ProcScr_EfxHazymoonOBJ2
ProcScr_EfxHazymoonOBJ2: @ 085D2B2C
	PROC_19
	PROC_ONEND EfxHazymoonOBJ2_OnEnd
	PROC_REPEAT EfxHazymoonOBJ2_Loop1
	PROC_REPEAT EfxHazymoonOBJ2_Loop2
	PROC_REPEAT EfxHazymoonOBJ2_Loop3
	PROC_REPEAT EfxHazymoonOBJ2_Loop1
	PROC_REPEAT EfxHazymoonOBJ2_Loop2
	PROC_REPEAT EfxHazymoonOBJ2_Loop3
	PROC_END

	.global ProcScr_EfxHazymoonOBJ3
ProcScr_EfxHazymoonOBJ3: @ 085D2B74
	PROC_19
	PROC_REPEAT EfxHazymoonOBJ3_Loop
	PROC_END

	.global gEclipseAnimSpriteCoordinates
gEclipseAnimSpriteCoordinates: @ 085D2B8C
	.short 0x60, 0x38
	.short 0x30, 0x68
	.short 0xA0, 0x40
	.short 0x58, 0x88
	.short 0xA0, 0x88
	.short 0xC0, 0x60

	.global ProcScr_EfxHazymoonOBJ3RND
ProcScr_EfxHazymoonOBJ3RND: @ 085D2BA4
	PROC_19
	PROC_ONEND EfxHazymoonOBJ3RND_Loop
	PROC_SLEEP 100
	PROC_END

	.global ProcScr_EfxFenrir
ProcScr_EfxFenrir: @ 085D2BC4
	PROC_19
	PROC_REPEAT EfxFenrir_Loop
	PROC_END

	.global ProcScr_EfxFenrirBG
ProcScr_EfxFenrirBG: @ 085D2BDC
	PROC_19
	PROC_ONEND EfxFenrirBG_OnEnd
	PROC_REPEAT EfxFenrirBG_Loop
	PROC_END

	.global ProcScr_EfxFenrirBGCOL
ProcScr_EfxFenrirBGCOL: @ 085D2BFC
	PROC_19
	PROC_MARK 10
	PROC_ONEND EfxFenrirBGCOL_OnEnd
	PROC_REPEAT EfxFenrirBGCOL_Loop
	PROC_END

	.global ProcScr_EfxFenrirOBJ
ProcScr_EfxFenrirOBJ: @ 085D2C24
	PROC_19
	PROC_REPEAT EfxFenrirOBJ_Loop
	PROC_END

	.global ProcScr_EfxFenrirBG2
ProcScr_EfxFenrirBG2: @ 085D2C3C
	PROC_19
	PROC_REPEAT EfxFenrirBG2_Loop
	PROC_END

	.global ImgArray_EfxFenrirBG2_A
ImgArray_EfxFenrirBG2_A: @ 085D2C54
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_0818F5EC
	.4byte Img_EfxFenrirBG2_A_08190804
	.4byte Img_EfxFenrirBG2_A_08191B54
	.4byte Img_EfxFenrirBG2_A_081929D0

	.global TsaArray_EfxFenrirBG2_A
TsaArray_EfxFenrirBG2_A: @ 085D2D20
	.4byte Tsa_EfxFenrirBG2_A_081935D8
	.4byte Tsa_EfxFenrirBG2_A_08193694
	.4byte Tsa_EfxFenrirBG2_A_08193750
	.4byte Tsa_EfxFenrirBG2_A_0819380C
	.4byte Tsa_EfxFenrirBG2_A_081938C8
	.4byte Tsa_EfxFenrirBG2_A_08193984
	.4byte Tsa_EfxFenrirBG2_A_08193A40
	.4byte Tsa_EfxFenrirBG2_A_08193B44
	.4byte Tsa_EfxFenrirBG2_A_08193C48
	.4byte Tsa_EfxFenrirBG2_A_08193D4C
	.4byte Tsa_EfxFenrirBG2_A_08193E50
	.4byte Tsa_EfxFenrirBG2_A_08193F54
	.4byte Tsa_EfxFenrirBG2_A_08194058
	.4byte Tsa_EfxFenrirBG2_A_08194198
	.4byte Tsa_EfxFenrirBG2_A_081942DC
	.4byte Tsa_EfxFenrirBG2_A_08194420
	.4byte Tsa_EfxFenrirBG2_A_08194564
	.4byte Tsa_EfxFenrirBG2_A_081946A8
	.4byte Tsa_EfxFenrirBG2_A_081947EC
	.4byte Tsa_EfxFenrirBG2_A_0819496C
	.4byte Tsa_EfxFenrirBG2_A_08194AF0
	.4byte Tsa_EfxFenrirBG2_A_08194C74
	.4byte Tsa_EfxFenrirBG2_A_08194DD4
	.4byte Tsa_EfxFenrirBG2_A_08194F34
	.4byte Tsa_EfxFenrirBG2_A_08195094
	.4byte Tsa_EfxFenrirBG2_A_08195238
	.4byte Tsa_EfxFenrirBG2_A_081953DC
	.4byte Tsa_EfxFenrirBG2_A_08195580
	.4byte Tsa_EfxFenrirBG2_A_081956F0
	.4byte Tsa_EfxFenrirBG2_A_08195860
	.4byte Tsa_EfxFenrirBG2_A_081959D0
	.4byte Tsa_EfxFenrirBG2_A_08195B74
	.4byte Tsa_EfxFenrirBG2_A_08195D18
	.4byte Tsa_EfxFenrirBG2_A_08195EBC
	.4byte Tsa_EfxFenrirBG2_A_08196030
	.4byte Tsa_EfxFenrirBG2_A_081961A4
	.4byte Tsa_EfxFenrirBG2_A_08196318
	.4byte Tsa_EfxFenrirBG2_A_081964C8
	.4byte Tsa_EfxFenrirBG2_A_08196678
	.4byte Tsa_EfxFenrirBG2_A_08196828
	.4byte Tsa_EfxFenrirBG2_A_0819699C
	.4byte Tsa_EfxFenrirBG2_A_08196B10
	.4byte Tsa_EfxFenrirBG2_A_08196C84
	.4byte Tsa_EfxFenrirBG2_A_08196E38
	.4byte Tsa_EfxFenrirBG2_A_08196FEC
	.4byte Tsa_EfxFenrirBG2_A_081971A0
	.4byte Tsa_EfxFenrirBG2_A_08197318
	.4byte Tsa_EfxFenrirBG2_A_08197490
	.4byte Tsa_EfxFenrirBG2_A_08197608
	.4byte Tsa_EfxFenrirBG2_A_08197860
	.4byte Tsa_EfxFenrirBG2_A_08197A68

	.global ProcScr_EfxFenrirOBJ2
ProcScr_EfxFenrirOBJ2: @ 085D2DEC
	PROC_19
	PROC_REPEAT EfxFenrirOBJ2_Loop
	PROC_END

	.global ProcScr_EfxFenrirOBJ2Chiri
ProcScr_EfxFenrirOBJ2Chiri: @ 085D2E04
	PROC_19
	PROC_REPEAT EfxFenrirOBJ2Chiri_Loop
	PROC_END

	.global gFenrirSpriteAngles
gFenrirSpriteAngles: @ 085D2E1C
	.4byte 184, 85, 66, 119, 158, 39, 135, 210

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
