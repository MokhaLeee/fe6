
	.include "animscr.inc"
	.include "gba_sprites.inc"
	.section .data

	.global ProcScr_EfxFimbulvetrBGTR
ProcScr_EfxFimbulvetrBGTR: @ 085D14EC
	.incbin "fe6-base.gba", 0x5D14EC, (0x5D1504 - 0x5D14EC) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D1534, (0x5D154C - 0x5D1534) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D15A4, (0x5D15BC - 0x5D15A4) @ length: 0018

	.global ProcScr_EfxFimbulvetrOBJ2
ProcScr_EfxFimbulvetrOBJ2: @ 085D15BC
	.incbin "fe6-base.gba", 0x5D15BC, (0x5D15D4 - 0x5D15BC) @ length: 0018

	.global ProcScr_EfxFimbulvetrOBJ2Fall
ProcScr_EfxFimbulvetrOBJ2Fall: @ 085D15D4
	.incbin "fe6-base.gba", 0x5D15D4, (0x5D15EC - 0x5D15D4) @ length: 0018

	.global ProcScr_EfxThunderstorm
ProcScr_EfxThunderstorm: @ 085D15EC
	.incbin "fe6-base.gba", 0x5D15EC, (0x5D1604 - 0x5D15EC) @ length: 0018

	.global ProcScr_EfxThunderstormBG
ProcScr_EfxThunderstormBG: @ 085D1604
	.incbin "fe6-base.gba", 0x5D1604, (0x5D161C - 0x5D1604) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D1674, (0x5D169C - 0x5D1674) @ length: 0028

	.global ProcScr_EfxThunderstormCOLOR
ProcScr_EfxThunderstormCOLOR: @ 085D169C
	.incbin "fe6-base.gba", 0x5D169C, (0x5D16DC - 0x5D169C) @ length: 0040

	.global ProcScr_EfxThunderstormDARK
ProcScr_EfxThunderstormDARK: @ 085D16DC
	.incbin "fe6-base.gba", 0x5D16DC, (0x5D16FC - 0x5D16DC) @ length: 0020

	.global ProcScr_EfxAlacalibur
ProcScr_EfxAlacalibur: @ 085D16FC
	.incbin "fe6-base.gba", 0x5D16FC, (0x5D1714 - 0x5D16FC) @ length: 0018

	.global ProcScr_EfxAlacaliburBG
ProcScr_EfxAlacaliburBG: @ 085D1714
	.incbin "fe6-base.gba", 0x5D1714, (0x5D172C - 0x5D1714) @ length: 0018

	.global TsaArray_EfxAlacaliburBG
TsaArray_EfxAlacaliburBG: @ 085D172C
	.4byte Tsa_EfxAlacaliburBG_0815B424
	.4byte Tsa_EfxAlacaliburBG_0815B5AC

	.global ProcScr_EfxAlacaliburBGCOL
ProcScr_EfxAlacaliburBGCOL: @ 085D1734
	.incbin "fe6-base.gba", 0x5D1734, (0x5D1754 - 0x5D1734) @ length: 0020

	.global ProcScr_EfxAlacaliburOBJ
ProcScr_EfxAlacaliburOBJ: @ 085D1754
	.incbin "fe6-base.gba", 0x5D1754, (0x5D176C - 0x5D1754) @ length: 0018

	.global ProcScr_EfxMistyrain
ProcScr_EfxMistyrain: @ 085D176C
	.incbin "fe6-base.gba", 0x5D176C, (0x5D1784 - 0x5D176C) @ length: 0018

	.global ProcScr_EfxMistyrainBG
ProcScr_EfxMistyrainBG: @ 085D1784
	.incbin "fe6-base.gba", 0x5D1784, (0x5D179C - 0x5D1784) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D18E4, (0x5D192C - 0x5D18E4) @ length: 0048

	.global ProcScr_EfxMistyrainOBJ2
ProcScr_EfxMistyrainOBJ2: @ 085D192C
	.incbin "fe6-base.gba", 0x5D192C, (0x5D195C - 0x5D192C) @ length: 0030

	.global ProcScr_EfxResire
ProcScr_EfxResire: @ 085D195C
	.incbin "fe6-base.gba", 0x5D195C, (0x5D1974 - 0x5D195C) @ length: 0018

	.global ProcScr_EfxResireBG
ProcScr_EfxResireBG: @ 085D1974
	.incbin "fe6-base.gba", 0x5D1974, (0x5D19A4 - 0x5D1974) @ length: 0030

	.global ProcScr_EfxResireBG2
ProcScr_EfxResireBG2: @ 085D19A4
	.incbin "fe6-base.gba", 0x5D19A4, (0x5D19BC - 0x5D19A4) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D1B54, (0x5D1B6C - 0x5D1B54) @ length: 0018

	.global ProcScr_EfxLightning
ProcScr_EfxLightning: @ 085D1B6C
	.incbin "fe6-base.gba", 0x5D1B6C, (0x5D1B84 - 0x5D1B6C) @ length: 0018

	.global ProcScr_EfxLightningBG
ProcScr_EfxLightningBG: @ 085D1B84
	.incbin "fe6-base.gba", 0x5D1B84, (0x5D1B9C - 0x5D1B84) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D1D28, (0x5D1D40 - 0x5D1D28) @ length: 0018

	.global ProcScr_EfxPurgeBG
ProcScr_EfxPurgeBG: @ 085D1D40
	.incbin "fe6-base.gba", 0x5D1D40, (0x5D1D58 - 0x5D1D40) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D2100, (0x5D2120 - 0x5D2100) @ length: 0020

	.global Vecs_EfxPurgeOBJRND
Vecs_EfxPurgeOBJRND: @ 085D2120
	.incbin "fe6-base.gba", 0x5D2120, (0x5D2158 - 0x5D2120) @ length: 0038

	.global ProcScr_EfxPurgeOBJ
ProcScr_EfxPurgeOBJ: @ 085D2158
	.incbin "fe6-base.gba", 0x5D2158, (0x5D2178 - 0x5D2158) @ length: 0020

	.global ProcScr_EfxForblaze
ProcScr_EfxForblaze: @ 085D2178
	.incbin "fe6-base.gba", 0x5D2178, (0x5D2190 - 0x5D2178) @ length: 0018

	.global ProcScr_EfxForblazeBG1
ProcScr_EfxForblazeBG1: @ 085D2190
	.incbin "fe6-base.gba", 0x5D2190, (0x5D21A8 - 0x5D2190) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D2210, (0x5D2230 - 0x5D2210) @ length: 0020

	.global gUnk_085D2230
gUnk_085D2230: @ 085D2230
	.incbin "fe6-base.gba", 0x5D2230, (0x5D2270 - 0x5D2230) @ length: 0040

	.global ProcScr_EfxForblazeOBJ
ProcScr_EfxForblazeOBJ: @ 085D2270
	.incbin "fe6-base.gba", 0x5D2270, (0x5D2288 - 0x5D2270) @ length: 0018

	.global gUnk_085D2288
gUnk_085D2288: @ 085D2288
	.incbin "fe6-base.gba", 0x5D2288, (0x5D22E0 - 0x5D2288) @ length: 0058

	.global ProcScr_EfxForblazeOBJ2
ProcScr_EfxForblazeOBJ2: @ 085D22E0
	.incbin "fe6-base.gba", 0x5D22E0, (0x5D22F8 - 0x5D22E0) @ length: 0018

	.global ProcScr_EfxForblazeBG2
ProcScr_EfxForblazeBG2: @ 085D22F8
	.incbin "fe6-base.gba", 0x5D22F8, (0x5D2310 - 0x5D22F8) @ length: 0018

	.global ProcScr_EfxForblazeOBJCtrl
ProcScr_EfxForblazeOBJCtrl: @ 085D2310
	.incbin "fe6-base.gba", 0x5D2310, (0x5D2328 - 0x5D2310) @ length: 0018

	.global ProcScr_EfxForblazeOBJFall
ProcScr_EfxForblazeOBJFall: @ 085D2328
	.incbin "fe6-base.gba", 0x5D2328, (0x5D2340 - 0x5D2328) @ length: 0018

	.global ProcScr_EfxForblazeRST
ProcScr_EfxForblazeRST: @ 085D2340
	.incbin "fe6-base.gba", 0x5D2340, (0x5D2358 - 0x5D2340) @ length: 0018

	.global ProcScr_EfxDivine
ProcScr_EfxDivine: @ 085D2358
	.incbin "fe6-base.gba", 0x5D2358, (0x5D2370 - 0x5D2358) @ length: 0018

	.global ProcScr_EfxDivineBG
ProcScr_EfxDivineBG: @ 085D2370
	.incbin "fe6-base.gba", 0x5D2370, (0x5D2388 - 0x5D2370) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D24E8, (0x5D2500 - 0x5D24E8) @ length: 0018

	.global ProcScr_EfxAureola
ProcScr_EfxAureola: @ 085D2500
	.incbin "fe6-base.gba", 0x5D2500, (0x5D2518 - 0x5D2500) @ length: 0018

	.global ProcScr_EfxAureolaBG
ProcScr_EfxAureolaBG: @ 085D2518
	.incbin "fe6-base.gba", 0x5D2518, (0x5D2530 - 0x5D2518) @ length: 0018

	.global ImgArray_EfxAureolaBG
ImgArray_EfxAureolaBG: @ 085D2530
	.incbin "fe6-base.gba", 0x5D2530, (0x5D2544 - 0x5D2530) @ length: 0014

	.global TsaArray_EfxAureolaBG
TsaArray_EfxAureolaBG: @ 085D2544
	.incbin "fe6-base.gba", 0x5D2544, (0x5D2558 - 0x5D2544) @ length: 0014

	.global ProcScr_EfxAureolaBG2
ProcScr_EfxAureolaBG2: @ 085D2558
	.incbin "fe6-base.gba", 0x5D2558, (0x5D2570 - 0x5D2558) @ length: 0018

	.global ProcScr_EfxAureolaBG2COL
ProcScr_EfxAureolaBG2COL: @ 085D2570
	.incbin "fe6-base.gba", 0x5D2570, (0x5D2590 - 0x5D2570) @ length: 0020

	.global ProcScr_EfxAureolaOBJ
ProcScr_EfxAureolaOBJ: @ 085D2590
	.incbin "fe6-base.gba", 0x5D2590, (0x5D25A8 - 0x5D2590) @ length: 0018

	.global ProcScr_EfxAureolaOBJCtrl
ProcScr_EfxAureolaOBJCtrl: @ 085D25A8
	.incbin "fe6-base.gba", 0x5D25A8, (0x5D25C0 - 0x5D25A8) @ length: 0018

	.global ProcScr_EfxAureolaOBJ2
ProcScr_EfxAureolaOBJ2: @ 085D25C0
	.incbin "fe6-base.gba", 0x5D25C0, (0x5D25D8 - 0x5D25C0) @ length: 0018

	.global ProcScr_EfxAureolaOBJ3
ProcScr_EfxAureolaOBJ3: @ 085D25D8
	.incbin "fe6-base.gba", 0x5D25D8, (0x5D25F0 - 0x5D25D8) @ length: 0018

	.global ProcScr_EfxAureolaOBJ3Ctrl
ProcScr_EfxAureolaOBJ3Ctrl: @ 085D25F0
	.incbin "fe6-base.gba", 0x5D25F0, (0x5D2608 - 0x5D25F0) @ length: 0018

	.global ProcScr_EfxApocalypse
ProcScr_EfxApocalypse: @ 085D2608
	.incbin "fe6-base.gba", 0x5D2608, (0x5D2620 - 0x5D2608) @ length: 0018

	.global ProcScr_EfxApocalypseBG
ProcScr_EfxApocalypseBG: @ 085D2620
	.incbin "fe6-base.gba", 0x5D2620, (0x5D2638 - 0x5D2620) @ length: 0018

	.global ProcScr_EfxApocalypseBGCtrl
ProcScr_EfxApocalypseBGCtrl: @ 085D2638
	.incbin "fe6-base.gba", 0x5D2638, (0x5D2658 - 0x5D2638) @ length: 0020

	.global ProcScr_EfxApocalypseBGCOL
ProcScr_EfxApocalypseBGCOL: @ 085D2658
	.incbin "fe6-base.gba", 0x5D2658, (0x5D2678 - 0x5D2658) @ length: 0020

	.global ProcScr_EfxApocalypseOBJ
ProcScr_EfxApocalypseOBJ: @ 085D2678
	.incbin "fe6-base.gba", 0x5D2678, (0x5D26B0 - 0x5D2678) @ length: 0038

	.global AnimArray_EfxApocalypseOBJ
AnimArray_EfxApocalypseOBJ: @ 085D26B0
	.incbin "fe6-base.gba", 0x5D26B0, (0x5D26D0 - 0x5D26B0) @ length: 0020

	.global ProcScr_EfxApocalypseBGCOL2
ProcScr_EfxApocalypseBGCOL2: @ 085D26D0
	.incbin "fe6-base.gba", 0x5D26D0, (0x5D26F0 - 0x5D26D0) @ length: 0020

	.global ProcScr_EfxApocalypseDummy
ProcScr_EfxApocalypseDummy: @ 085D26F0
	.incbin "fe6-base.gba", 0x5D26F0, (0x5D2708 - 0x5D26F0) @ length: 0018

	.global ProcScr_EfxApocalypseBgFlash1
ProcScr_EfxApocalypseBgFlash1: @ 085D2708
	.incbin "fe6-base.gba", 0x5D2708, (0x5D2720 - 0x5D2708) @ length: 0018

	.global ProcScr_EfxApocalypseBgFlash2
ProcScr_EfxApocalypseBgFlash2: @ 085D2720
	.incbin "fe6-base.gba", 0x5D2720, (0x5D2740 - 0x5D2720) @ length: 0020

	.global ProcScr_EfxApocalypseBG2
ProcScr_EfxApocalypseBG2: @ 085D2740
	.incbin "fe6-base.gba", 0x5D2740, (0x5D2758 - 0x5D2740) @ length: 0018

	.global ImgArray_EfxApocalypseBG2
ImgArray_EfxApocalypseBG2: @ 085D2758
	.incbin "fe6-base.gba", 0x5D2758, (0x5D2768 - 0x5D2758) @ length: 0010

	.global TsaArray_EfxApocalypseBG2
TsaArray_EfxApocalypseBG2: @ 085D2768
	.incbin "fe6-base.gba", 0x5D2768, (0x5D2778 - 0x5D2768) @ length: 0010

	.global ProcScr_EfxApocalypseOBJ2
ProcScr_EfxApocalypseOBJ2: @ 085D2778
	.incbin "fe6-base.gba", 0x5D2778, (0x5D2798 - 0x5D2778) @ length: 0020

	.global ProcScr_EfxApocalypseOBJ3
ProcScr_EfxApocalypseOBJ3: @ 085D2798
	.incbin "fe6-base.gba", 0x5D2798, (0x5D27B0 - 0x5D2798) @ length: 0018

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
	.incbin "fe6-base.gba", 0x5D2A0C, (0x5D2A24 - 0x5D2A0C) @ length: 0018

	.global ProcScr_EfxHazymoon
ProcScr_EfxHazymoon: @ 085D2A24
	.incbin "fe6-base.gba", 0x5D2A24, (0x5D2A3C - 0x5D2A24) @ length: 0018

	.global ProcScr_EfxHazymoonBG
ProcScr_EfxHazymoonBG: @ 085D2A3C
	.incbin "fe6-base.gba", 0x5D2A3C, (0x5D2A54 - 0x5D2A3C) @ length: 0018

	.global TsaArray_EfxHazymoonBG
TsaArray_EfxHazymoonBG: @ 085D2A54
	.incbin "fe6-base.gba", 0x5D2A54, (0x5D2AC0 - 0x5D2A54) @ length: 006C

	.global ImgArray_EfxHazymoonBG
ImgArray_EfxHazymoonBG: @ 085D2AC0
	.incbin "fe6-base.gba", 0x5D2AC0, (0x5D2B2C - 0x5D2AC0) @ length: 006C

	.global ProcScr_EfxHazymoonOBJ2
ProcScr_EfxHazymoonOBJ2: @ 085D2B2C
	.incbin "fe6-base.gba", 0x5D2B2C, (0x5D2B74 - 0x5D2B2C) @ length: 0048

	.global ProcScr_EfxHazymoonOBJ3
ProcScr_EfxHazymoonOBJ3: @ 085D2B74
	.incbin "fe6-base.gba", 0x5D2B74, (0x5D2B8C - 0x5D2B74) @ length: 0018

	.global gEclipseAnimSpriteCoordinates
gEclipseAnimSpriteCoordinates: @ 085D2B8C
	.incbin "fe6-base.gba", 0x5D2B8C, (0x5D2BA4 - 0x5D2B8C) @ length: 0018

	.global ProcScr_EfxHazymoonOBJ3RND
ProcScr_EfxHazymoonOBJ3RND: @ 085D2BA4
	.incbin "fe6-base.gba", 0x5D2BA4, (0x5D2BC4 - 0x5D2BA4) @ length: 0020

	.global ProcScr_EfxFenrir
ProcScr_EfxFenrir: @ 085D2BC4
	.incbin "fe6-base.gba", 0x5D2BC4, (0x5D2BDC - 0x5D2BC4) @ length: 0018

	.global ProcScr_EfxFenrirBG
ProcScr_EfxFenrirBG: @ 085D2BDC
	.incbin "fe6-base.gba", 0x5D2BDC, (0x5D2BFC - 0x5D2BDC) @ length: 0020

	.global ProcScr_EfxFenrirBGCOL
ProcScr_EfxFenrirBGCOL: @ 085D2BFC
	.incbin "fe6-base.gba", 0x5D2BFC, (0x5D2C24 - 0x5D2BFC) @ length: 0028

	.global ProcScr_EfxFenrirOBJ
ProcScr_EfxFenrirOBJ: @ 085D2C24
	.incbin "fe6-base.gba", 0x5D2C24, (0x5D2C3C - 0x5D2C24) @ length: 0018

	.global ProcScr_EfxFenrirBG2
ProcScr_EfxFenrirBG2: @ 085D2C3C
	.incbin "fe6-base.gba", 0x5D2C3C, (0x5D2C54 - 0x5D2C3C) @ length: 0018

	.global ImgArray_EfxFenrirBG2_A
ImgArray_EfxFenrirBG2_A: @ 085D2C54
	.incbin "fe6-base.gba", 0x5D2C54, (0x5D2D20 - 0x5D2C54) @ length: 00CC

	.global TsaArray_EfxFenrirBG2_A
TsaArray_EfxFenrirBG2_A: @ 085D2D20
	.incbin "fe6-base.gba", 0x5D2D20, (0x5D2DEC - 0x5D2D20) @ length: 00CC

	.global ProcScr_EfxFenrirOBJ2
ProcScr_EfxFenrirOBJ2: @ 085D2DEC
	.incbin "fe6-base.gba", 0x5D2DEC, (0x5D2E04 - 0x5D2DEC) @ length: 0018

	.global ProcScr_EfxFenrirOBJ2Chiri
ProcScr_EfxFenrirOBJ2Chiri: @ 085D2E04
	.incbin "fe6-base.gba", 0x5D2E04, (0x5D2E1C - 0x5D2E04) @ length: 0018

	.global gFenrirSpriteAngles
gFenrirSpriteAngles: @ 085D2E1C
	.incbin "fe6-base.gba", 0x5D2E1C, (0x5D2E3C - 0x5D2E1C) @ length: 0020

	.global ProcScr_EfxLive
ProcScr_EfxLive: @ 085D2E3C
	.incbin "fe6-base.gba", 0x5D2E3C, (0x5D2E54 - 0x5D2E3C) @ length: 0018

	.global ProcScr_EfxRelive
ProcScr_EfxRelive: @ 085D2E54
	.incbin "fe6-base.gba", 0x5D2E54, (0x5D2E6C - 0x5D2E54) @ length: 0018

	.global ProcScr_EfxRecover
ProcScr_EfxRecover: @ 085D2E6C
	.incbin "fe6-base.gba", 0x5D2E6C, (0x5D2E84 - 0x5D2E6C) @ length: 0018

	.global ProcScr_EfxReblow
ProcScr_EfxReblow: @ 085D2E84
	.incbin "fe6-base.gba", 0x5D2E84, (0x5D2E9C - 0x5D2E84) @ length: 0018

	.global ProcScr_EfxLiveBG
ProcScr_EfxLiveBG: @ 085D2E9C
	.incbin "fe6-base.gba", 0x5D2E9C, (0x5D2EB4 - 0x5D2E9C) @ length: 0018

	.global ProcScr_EfxLiveBGCOL
ProcScr_EfxLiveBGCOL: @ 085D2EB4
	.incbin "fe6-base.gba", 0x5D2EB4, (0x5D2ED4 - 0x5D2EB4) @ length: 0020

	.global ProcScr_EfxLiveALPHA
ProcScr_EfxLiveALPHA: @ 085D2ED4
	.incbin "fe6-base.gba", 0x5D2ED4, (0x5D2EF4 - 0x5D2ED4) @ length: 0020

	.global ProcScr_EfxLiveOBJ
ProcScr_EfxLiveOBJ: @ 085D2EF4
	.incbin "fe6-base.gba", 0x5D2EF4, (0x5D2F0C - 0x5D2EF4) @ length: 0018

	.global ProcScr_EfxReserveOBJ
ProcScr_EfxReserveOBJ: @ 085D2F0C
	.incbin "fe6-base.gba", 0x5D2F0C, (0x5D2F2C - 0x5D2F0C) @ length: 0020

	.global ProcScr_EfxReblowOBJ
ProcScr_EfxReblowOBJ: @ 085D2F2C
	.incbin "fe6-base.gba", 0x5D2F2C, (0x5D2F4C - 0x5D2F2C) @ length: 0020

	.global ProcScr_EfxReserve
ProcScr_EfxReserve: @ 085D2F4C
	.incbin "fe6-base.gba", 0x5D2F4C, (0x5D2F64 - 0x5D2F4C) @ length: 0018

	.global ProcScr_EfxReserveBG
ProcScr_EfxReserveBG: @ 085D2F64
	.incbin "fe6-base.gba", 0x5D2F64, (0x5D2F7C - 0x5D2F64) @ length: 0018

	.global TsaArray_EfxReserveBG
TsaArray_EfxReserveBG: @ 085D2F7C
	.incbin "fe6-base.gba", 0x5D2F7C, (0x5D2F8C - 0x5D2F7C) @ length: 0010

	.global ProcScr_EfxReserveBGCOL
ProcScr_EfxReserveBGCOL: @ 085D2F8C
	.incbin "fe6-base.gba", 0x5D2F8C, (0x5D2FAC - 0x5D2F8C) @ length: 0020

	.global ProcScr_EfxReserveBG2
ProcScr_EfxReserveBG2: @ 085D2FAC
	.incbin "fe6-base.gba", 0x5D2FAC, (0x5D2FC4 - 0x5D2FAC) @ length: 0018

	.global TsaArray_EfxReserveBG2
TsaArray_EfxReserveBG2: @ 085D2FC4
	.incbin "fe6-base.gba", 0x5D2FC4, (0x5D2FC8 - 0x5D2FC4) @ length: 0004

	.global ProcScr_EfxReserveBGCOL2
ProcScr_EfxReserveBGCOL2: @ 085D2FC8
	.incbin "fe6-base.gba", 0x5D2FC8, (0x5D2FE8 - 0x5D2FC8) @ length: 0020

	.global ProcScr_EfxRest
ProcScr_EfxRest: @ 085D2FE8
	.incbin "fe6-base.gba", 0x5D2FE8, (0x5D3000 - 0x5D2FE8) @ length: 0018

	.global ProcScr_EfxRestBG
ProcScr_EfxRestBG: @ 085D3000
	.incbin "fe6-base.gba", 0x5D3000, (0x5D3018 - 0x5D3000) @ length: 0018

	.global TsaArray_EfxRestBG
TsaArray_EfxRestBG: @ 085D3018
	.incbin "fe6-base.gba", 0x5D3018, (0x5D304C - 0x5D3018) @ length: 0034

	.global ImgArray_EfxRestBG
ImgArray_EfxRestBG: @ 085D304C
	.incbin "fe6-base.gba", 0x5D304C, (0x5D3080 - 0x5D304C) @ length: 0034

	.global ProcScr_EfxRestOBJ
ProcScr_EfxRestOBJ: @ 085D3080
	.incbin "fe6-base.gba", 0x5D3080, (0x5D30A0 - 0x5D3080) @ length: 0020

	.global ProcScr_EfxSilence
ProcScr_EfxSilence: @ 085D30A0
	.incbin "fe6-base.gba", 0x5D30A0, (0x5D30B8 - 0x5D30A0) @ length: 0018

	.global ProcScr_EfxSilenceBG
ProcScr_EfxSilenceBG: @ 085D30B8
	.incbin "fe6-base.gba", 0x5D30B8, (0x5D30D0 - 0x5D30B8) @ length: 0018

	.global TsaArray_EfxSilenceBG
TsaArray_EfxSilenceBG: @ 085D30D0
	.incbin "fe6-base.gba", 0x5D30D0, (0x5D3118 - 0x5D30D0) @ length: 0048

	.global ProcScr_EfxSilenceOBJ
ProcScr_EfxSilenceOBJ: @ 085D3118
	.incbin "fe6-base.gba", 0x5D3118, (0x5D3138 - 0x5D3118) @ length: 0020

	.global ProcScr_EfxSleep
ProcScr_EfxSleep: @ 085D3138
	.incbin "fe6-base.gba", 0x5D3138, (0x5D3150 - 0x5D3138) @ length: 0018

	.global ProcScr_EfxSleepBG
ProcScr_EfxSleepBG: @ 085D3150
	.incbin "fe6-base.gba", 0x5D3150, (0x5D3168 - 0x5D3150) @ length: 0018

	.global TsaArray_EfxSleepBG
TsaArray_EfxSleepBG: @ 085D3168
	.incbin "fe6-base.gba", 0x5D3168, (0x5D31A8 - 0x5D3168) @ length: 0040

	.global ProcScr_EfxSleepOBJ
ProcScr_EfxSleepOBJ: @ 085D31A8
	.incbin "fe6-base.gba", 0x5D31A8, (0x5D31C8 - 0x5D31A8) @ length: 0020

	.global ProcScr_EfxSleepOBJ2
ProcScr_EfxSleepOBJ2: @ 085D31C8
	.incbin "fe6-base.gba", 0x5D31C8, (0x5D31E8 - 0x5D31C8) @ length: 0020

	.global ProcScr_EfxSleepSE
ProcScr_EfxSleepSE: @ 085D31E8
	.incbin "fe6-base.gba", 0x5D31E8, (0x5D3230 - 0x5D31E8) @ length: 0048

	.global ProcScr_EfxHammarne
ProcScr_EfxHammarne: @ 085D3230
	.incbin "fe6-base.gba", 0x5D3230, (0x5D3248 - 0x5D3230) @ length: 0018

	.global ProcScr_EfxHammarneBG
ProcScr_EfxHammarneBG: @ 085D3248
	.incbin "fe6-base.gba", 0x5D3248, (0x5D3260 - 0x5D3248) @ length: 0018

	.global TsaArray_EfxHammarneBG
TsaArray_EfxHammarneBG: @ 085D3260
	.incbin "fe6-base.gba", 0x5D3260, (0x5D3294 - 0x5D3260) @ length: 0034

	.global ImgArray_EfxHammarneBG
ImgArray_EfxHammarneBG: @ 085D3294
	.incbin "fe6-base.gba", 0x5D3294, (0x5D32C8 - 0x5D3294) @ length: 0034

	.global ProcScr_EfxHammarneOBJ
ProcScr_EfxHammarneOBJ: @ 085D32C8
	.incbin "fe6-base.gba", 0x5D32C8, (0x5D32E8 - 0x5D32C8) @ length: 0020

	.global ProcScr_EfxBerserk
ProcScr_EfxBerserk: @ 085D32E8
	.incbin "fe6-base.gba", 0x5D32E8, (0x5D3300 - 0x5D32E8) @ length: 0018

	.global ProcScr_EfxBerserkBG
ProcScr_EfxBerserkBG: @ 085D3300
	.incbin "fe6-base.gba", 0x5D3300, (0x5D3318 - 0x5D3300) @ length: 0018

	.global ProcScr_EfxBerserkCLONE
ProcScr_EfxBerserkCLONE: @ 085D3318
	.incbin "fe6-base.gba", 0x5D3318, (0x5D3338 - 0x5D3318) @ length: 0020

	.global ProcScr_EfxBerserkOBJ
ProcScr_EfxBerserkOBJ: @ 085D3338
	.incbin "fe6-base.gba", 0x5D3338, (0x5D33F0 - 0x5D3338) @ length: 00B8

	.global ProcScr_EfxMshield
ProcScr_EfxMshield: @ 085D33F0
	.incbin "fe6-base.gba", 0x5D33F0, (0x5D3408 - 0x5D33F0) @ length: 0018

	.global ProcScr_EfxMshieldBG
ProcScr_EfxMshieldBG: @ 085D3408
	.incbin "fe6-base.gba", 0x5D3408, (0x5D3420 - 0x5D3408) @ length: 0018

	.global TsaArray_EfxMshieldBG
TsaArray_EfxMshieldBG: @ 085D3420
	.incbin "fe6-base.gba", 0x5D3420, (0x5D3434 - 0x5D3420) @ length: 0014

	.global ProcScr_EfxMshieldOBJ
ProcScr_EfxMshieldOBJ: @ 085D3434
	.incbin "fe6-base.gba", 0x5D3434, (0x5D3454 - 0x5D3434) @ length: 0020

	.global ProcScr_EfxMshieldOBJ2
ProcScr_EfxMshieldOBJ2: @ 085D3454
	.incbin "fe6-base.gba", 0x5D3454, (0x5D3474 - 0x5D3454) @ length: 0020
