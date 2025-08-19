
	.include "animscr.inc"
	.include "gba_sprites.inc"
	.section .data

	.global ProcScr_EfxFimbulvetrBGTR
ProcScr_EfxFimbulvetrBGTR: @ 085D14EC
	.incbin "fe6-base.gba", 0x5D14EC, (0x5D1504 - 0x5D14EC) @ length: 0018

	.global TsaArray_EfxFimbulvetrBGTR
TsaArray_EfxFimbulvetrBGTR: @ 085D1504
	.incbin "fe6-base.gba", 0x5D1504, (0x5D151C - 0x5D1504) @ length: 0018

	.global ImgArray_EfxFimbulvetrBGTR
ImgArray_EfxFimbulvetrBGTR: @ 085D151C
	.incbin "fe6-base.gba", 0x5D151C, (0x5D1534 - 0x5D151C) @ length: 0018

	.global ProcScr_EfxFimbulvetrBG
ProcScr_EfxFimbulvetrBG: @ 085D1534
	.incbin "fe6-base.gba", 0x5D1534, (0x5D154C - 0x5D1534) @ length: 0018

	.global TsaArray_EfxFimbulvetrBG
TsaArray_EfxFimbulvetrBG: @ 085D154C
	.incbin "fe6-base.gba", 0x5D154C, (0x5D1578 - 0x5D154C) @ length: 002C

	.global ImgArray_EfxFimbulvetrBG
ImgArray_EfxFimbulvetrBG: @ 085D1578
	.incbin "fe6-base.gba", 0x5D1578, (0x5D15A4 - 0x5D1578) @ length: 002C

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
	.incbin "fe6-base.gba", 0x5D161C, (0x5D1648 - 0x5D161C) @ length: 002C

	.global TsaArray_EfxThunderstormBG
TsaArray_EfxThunderstormBG: @ 085D1648
	.incbin "fe6-base.gba", 0x5D1648, (0x5D1674 - 0x5D1648) @ length: 002C

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
	.incbin "fe6-base.gba", 0x5D172C, (0x5D1734 - 0x5D172C) @ length: 0008

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
	.incbin "fe6-base.gba", 0x5D179C, (0x5D1840 - 0x5D179C) @ length: 00A4

	.global ImgArray_EfxMistyrainBG
ImgArray_EfxMistyrainBG: @ 085D1840
	.incbin "fe6-base.gba", 0x5D1840, (0x5D18E4 - 0x5D1840) @ length: 00A4

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
	.incbin "fe6-base.gba", 0x5D19BC, (0x5D1A88 - 0x5D19BC) @ length: 00CC

	.global TsaArray_EfxResireBG
TsaArray_EfxResireBG: @ 085D1A88
	.incbin "fe6-base.gba", 0x5D1A88, (0x5D1B54 - 0x5D1A88) @ length: 00CC

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
	.incbin "fe6-base.gba", 0x5D1B9C, (0x5D1C20 - 0x5D1B9C) @ length: 0084

	.global PalArray_EfxLightningBG
PalArray_EfxLightningBG: @ 085D1C20
	.incbin "fe6-base.gba", 0x5D1C20, (0x5D1CA4 - 0x5D1C20) @ length: 0084

	.global TsaArray_EfxLightningBG
TsaArray_EfxLightningBG: @ 085D1CA4
	.incbin "fe6-base.gba", 0x5D1CA4, (0x5D1D28 - 0x5D1CA4) @ length: 0084

	.global ProcScr_EfxPurge
ProcScr_EfxPurge: @ 085D1D28
	.incbin "fe6-base.gba", 0x5D1D28, (0x5D1D40 - 0x5D1D28) @ length: 0018

	.global ProcScr_EfxPurgeBG
ProcScr_EfxPurgeBG: @ 085D1D40
	.incbin "fe6-base.gba", 0x5D1D40, (0x5D1D58 - 0x5D1D40) @ length: 0018

	.global ImgArray_EfxPurgeBG
ImgArray_EfxPurgeBG: @ 085D1D58
	.incbin "fe6-base.gba", 0x5D1D58, (0x5D1E90 - 0x5D1D58) @ length: 0138

	.global PalArray_EfxPurgeBG
PalArray_EfxPurgeBG: @ 085D1E90
	.incbin "fe6-base.gba", 0x5D1E90, (0x5D1FC8 - 0x5D1E90) @ length: 0138

	.global TsaArray_EfxPurgeBG
TsaArray_EfxPurgeBG: @ 085D1FC8
	.incbin "fe6-base.gba", 0x5D1FC8, (0x5D2100 - 0x5D1FC8) @ length: 0138

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

	.global Tsas_EfxForblazeBG1
Tsas_EfxForblazeBG1: @ 085D21A8
	.incbin "fe6-base.gba", 0x5D21A8, (0x5D21DC - 0x5D21A8) @ length: 0034

	.global Img_EfxForblazeBG1
Img_EfxForblazeBG1: @ 085D21DC
	.incbin "fe6-base.gba", 0x5D21DC, (0x5D2210 - 0x5D21DC) @ length: 0034

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
	.incbin "fe6-base.gba", 0x5D2388, (0x5D23D8 - 0x5D2388) @ length: 0050

	.global TsaArray_EfxDivineBG
TsaArray_EfxDivineBG: @ 085D23D8
	.incbin "fe6-base.gba", 0x5D23D8, (0x5D2428 - 0x5D23D8) @ length: 0050

	.global ImgArray_EfxDivineBG2
ImgArray_EfxDivineBG2: @ 085D2428
	.incbin "fe6-base.gba", 0x5D2428, (0x5D2434 - 0x5D2428) @ length: 000C

	.global TsaArray_EfxDivineBG2
TsaArray_EfxDivineBG2: @ 085D2434
	.incbin "fe6-base.gba", 0x5D2434, (0x5D2440 - 0x5D2434) @ length: 000C

	.global ImgArray_EfxDivineBG3
ImgArray_EfxDivineBG3: @ 085D2440
	.incbin "fe6-base.gba", 0x5D2440, (0x5D2494 - 0x5D2440) @ length: 0054

	.global TsaArray_EfxDivineBG3
TsaArray_EfxDivineBG3: @ 085D2494
	.incbin "fe6-base.gba", 0x5D2494, (0x5D24E8 - 0x5D2494) @ length: 0054

	.global ProcScr_EfxDivineOBJ
ProcScr_EfxDivineOBJ: @ 085D24E8
	.incbin "fe6-base.gba", 0x5D24E8, (0x5D2500 - 0x5D24E8) @ length: 0018

	.global ProcScr_EfxAureola
ProcScr_EfxAureola: @ 085D2500
	.incbin "fe6-base.gba", 0x5D2500, (0x5D2518 - 0x5D2500) @ length: 0018

	.global gUnk_085D2518
gUnk_085D2518: @ 085D2518
	.incbin "fe6-base.gba", 0x5D2518, (0x5D2530 - 0x5D2518) @ length: 0018

	.global gUnk_085D2530
gUnk_085D2530: @ 085D2530
	.incbin "fe6-base.gba", 0x5D2530, (0x5D2544 - 0x5D2530) @ length: 0014

	.global gUnk_085D2544
gUnk_085D2544: @ 085D2544
	.incbin "fe6-base.gba", 0x5D2544, (0x5D2558 - 0x5D2544) @ length: 0014

	.global gUnk_085D2558
gUnk_085D2558: @ 085D2558
	.incbin "fe6-base.gba", 0x5D2558, (0x5D2570 - 0x5D2558) @ length: 0018

	.global gUnk_085D2570
gUnk_085D2570: @ 085D2570
	.incbin "fe6-base.gba", 0x5D2570, (0x5D2590 - 0x5D2570) @ length: 0020

	.global gUnk_085D2590
gUnk_085D2590: @ 085D2590
	.incbin "fe6-base.gba", 0x5D2590, (0x5D25A8 - 0x5D2590) @ length: 0018

	.global gUnk_085D25A8
gUnk_085D25A8: @ 085D25A8
	.incbin "fe6-base.gba", 0x5D25A8, (0x5D25C0 - 0x5D25A8) @ length: 0018

	.global gUnk_085D25C0
gUnk_085D25C0: @ 085D25C0
	.incbin "fe6-base.gba", 0x5D25C0, (0x5D25D8 - 0x5D25C0) @ length: 0018

	.global gUnk_085D25D8
gUnk_085D25D8: @ 085D25D8
	.incbin "fe6-base.gba", 0x5D25D8, (0x5D25F0 - 0x5D25D8) @ length: 0018

	.global gUnk_085D25F0
gUnk_085D25F0: @ 085D25F0
	.incbin "fe6-base.gba", 0x5D25F0, (0x5D2608 - 0x5D25F0) @ length: 0018

	.global gUnk_085D2608
gUnk_085D2608: @ 085D2608
	.incbin "fe6-base.gba", 0x5D2608, (0x5D2620 - 0x5D2608) @ length: 0018

	.global gUnk_085D2620
gUnk_085D2620: @ 085D2620
	.incbin "fe6-base.gba", 0x5D2620, (0x5D2638 - 0x5D2620) @ length: 0018

	.global gUnk_085D2638
gUnk_085D2638: @ 085D2638
	.incbin "fe6-base.gba", 0x5D2638, (0x5D2658 - 0x5D2638) @ length: 0020

	.global gUnk_085D2658
gUnk_085D2658: @ 085D2658
	.incbin "fe6-base.gba", 0x5D2658, (0x5D2678 - 0x5D2658) @ length: 0020

	.global gUnk_085D2678
gUnk_085D2678: @ 085D2678
	.incbin "fe6-base.gba", 0x5D2678, (0x5D26B0 - 0x5D2678) @ length: 0038

	.global gUnk_085D26B0
gUnk_085D26B0: @ 085D26B0
	.incbin "fe6-base.gba", 0x5D26B0, (0x5D26D0 - 0x5D26B0) @ length: 0020

	.global gUnk_085D26D0
gUnk_085D26D0: @ 085D26D0
	.incbin "fe6-base.gba", 0x5D26D0, (0x5D26F0 - 0x5D26D0) @ length: 0020

	.global gUnk_085D26F0
gUnk_085D26F0: @ 085D26F0
	.incbin "fe6-base.gba", 0x5D26F0, (0x5D2708 - 0x5D26F0) @ length: 0018

	.global gUnk_085D2708
gUnk_085D2708: @ 085D2708
	.incbin "fe6-base.gba", 0x5D2708, (0x5D2720 - 0x5D2708) @ length: 0018

	.global gUnk_085D2720
gUnk_085D2720: @ 085D2720
	.incbin "fe6-base.gba", 0x5D2720, (0x5D2740 - 0x5D2720) @ length: 0020

	.global gUnk_085D2740
gUnk_085D2740: @ 085D2740
	.incbin "fe6-base.gba", 0x5D2740, (0x5D2758 - 0x5D2740) @ length: 0018

	.global gUnk_085D2758
gUnk_085D2758: @ 085D2758
	.incbin "fe6-base.gba", 0x5D2758, (0x5D2768 - 0x5D2758) @ length: 0010

	.global gUnk_085D2768
gUnk_085D2768: @ 085D2768
	.incbin "fe6-base.gba", 0x5D2768, (0x5D2778 - 0x5D2768) @ length: 0010

	.global gUnk_085D2778
gUnk_085D2778: @ 085D2778
	.incbin "fe6-base.gba", 0x5D2778, (0x5D2798 - 0x5D2778) @ length: 0020

	.global gUnk_085D2798
gUnk_085D2798: @ 085D2798
	.incbin "fe6-base.gba", 0x5D2798, (0x5D27B0 - 0x5D2798) @ length: 0018

	.global gUnk_085D27B0
gUnk_085D27B0: @ 085D27B0
	.incbin "fe6-base.gba", 0x5D27B0, (0x5D287C - 0x5D27B0) @ length: 00CC

	.global gUnk_085D287C
gUnk_085D287C: @ 085D287C
	.incbin "fe6-base.gba", 0x5D287C, (0x5D2944 - 0x5D287C) @ length: 00C8

	.global gUnk_085D2944
gUnk_085D2944: @ 085D2944
	.incbin "fe6-base.gba", 0x5D2944, (0x5D2A0C - 0x5D2944) @ length: 00C8

	.global gUnk_085D2A0C
gUnk_085D2A0C: @ 085D2A0C
	.incbin "fe6-base.gba", 0x5D2A0C, (0x5D2A24 - 0x5D2A0C) @ length: 0018

	.global gUnk_085D2A24
gUnk_085D2A24: @ 085D2A24
	.incbin "fe6-base.gba", 0x5D2A24, (0x5D2A3C - 0x5D2A24) @ length: 0018

	.global gUnk_085D2A3C
gUnk_085D2A3C: @ 085D2A3C
	.incbin "fe6-base.gba", 0x5D2A3C, (0x5D2A54 - 0x5D2A3C) @ length: 0018

	.global gUnk_085D2A54
gUnk_085D2A54: @ 085D2A54
	.incbin "fe6-base.gba", 0x5D2A54, (0x5D2AC0 - 0x5D2A54) @ length: 006C

	.global gUnk_085D2AC0
gUnk_085D2AC0: @ 085D2AC0
	.incbin "fe6-base.gba", 0x5D2AC0, (0x5D2B2C - 0x5D2AC0) @ length: 006C

	.global gUnk_085D2B2C
gUnk_085D2B2C: @ 085D2B2C
	.incbin "fe6-base.gba", 0x5D2B2C, (0x5D2B74 - 0x5D2B2C) @ length: 0048

	.global gUnk_085D2B74
gUnk_085D2B74: @ 085D2B74
	.incbin "fe6-base.gba", 0x5D2B74, (0x5D2B8C - 0x5D2B74) @ length: 0018

	.global gUnk_085D2B8C
gUnk_085D2B8C: @ 085D2B8C
	.incbin "fe6-base.gba", 0x5D2B8C, (0x5D2BA4 - 0x5D2B8C) @ length: 0018

	.global gUnk_085D2BA4
gUnk_085D2BA4: @ 085D2BA4
	.incbin "fe6-base.gba", 0x5D2BA4, (0x5D2BC4 - 0x5D2BA4) @ length: 0020

	.global gUnk_085D2BC4
gUnk_085D2BC4: @ 085D2BC4
	.incbin "fe6-base.gba", 0x5D2BC4, (0x5D2BDC - 0x5D2BC4) @ length: 0018

	.global gUnk_085D2BDC
gUnk_085D2BDC: @ 085D2BDC
	.incbin "fe6-base.gba", 0x5D2BDC, (0x5D2BFC - 0x5D2BDC) @ length: 0020

	.global gUnk_085D2BFC
gUnk_085D2BFC: @ 085D2BFC
	.incbin "fe6-base.gba", 0x5D2BFC, (0x5D2C24 - 0x5D2BFC) @ length: 0028

	.global gUnk_085D2C24
gUnk_085D2C24: @ 085D2C24
	.incbin "fe6-base.gba", 0x5D2C24, (0x5D2C3C - 0x5D2C24) @ length: 0018

	.global gUnk_085D2C3C
gUnk_085D2C3C: @ 085D2C3C
	.incbin "fe6-base.gba", 0x5D2C3C, (0x5D2C54 - 0x5D2C3C) @ length: 0018

	.global gUnk_085D2C54
gUnk_085D2C54: @ 085D2C54
	.incbin "fe6-base.gba", 0x5D2C54, (0x5D2D20 - 0x5D2C54) @ length: 00CC

	.global gUnk_085D2D20
gUnk_085D2D20: @ 085D2D20
	.incbin "fe6-base.gba", 0x5D2D20, (0x5D2DEC - 0x5D2D20) @ length: 00CC

	.global gUnk_085D2DEC
gUnk_085D2DEC: @ 085D2DEC
	.incbin "fe6-base.gba", 0x5D2DEC, (0x5D2E04 - 0x5D2DEC) @ length: 0018

	.global gUnk_085D2E04
gUnk_085D2E04: @ 085D2E04
	.incbin "fe6-base.gba", 0x5D2E04, (0x5D2E1C - 0x5D2E04) @ length: 0018

	.global gUnk_085D2E1C
gUnk_085D2E1C: @ 085D2E1C
	.incbin "fe6-base.gba", 0x5D2E1C, (0x5D2E3C - 0x5D2E1C) @ length: 0020

	.global gUnk_085D2E3C
gUnk_085D2E3C: @ 085D2E3C
	.incbin "fe6-base.gba", 0x5D2E3C, (0x5D2E54 - 0x5D2E3C) @ length: 0018

	.global gUnk_085D2E54
gUnk_085D2E54: @ 085D2E54
	.incbin "fe6-base.gba", 0x5D2E54, (0x5D2E6C - 0x5D2E54) @ length: 0018

	.global gUnk_085D2E6C
gUnk_085D2E6C: @ 085D2E6C
	.incbin "fe6-base.gba", 0x5D2E6C, (0x5D2E84 - 0x5D2E6C) @ length: 0018

	.global gUnk_085D2E84
gUnk_085D2E84: @ 085D2E84
	.incbin "fe6-base.gba", 0x5D2E84, (0x5D2E9C - 0x5D2E84) @ length: 0018

	.global gUnk_085D2E9C
gUnk_085D2E9C: @ 085D2E9C
	.incbin "fe6-base.gba", 0x5D2E9C, (0x5D2EB4 - 0x5D2E9C) @ length: 0018

	.global gUnk_085D2EB4
gUnk_085D2EB4: @ 085D2EB4
	.incbin "fe6-base.gba", 0x5D2EB4, (0x5D2ED4 - 0x5D2EB4) @ length: 0020

	.global gUnk_085D2ED4
gUnk_085D2ED4: @ 085D2ED4
	.incbin "fe6-base.gba", 0x5D2ED4, (0x5D2EF4 - 0x5D2ED4) @ length: 0020

	.global gUnk_085D2EF4
gUnk_085D2EF4: @ 085D2EF4
	.incbin "fe6-base.gba", 0x5D2EF4, (0x5D2F0C - 0x5D2EF4) @ length: 0018

	.global gUnk_085D2F0C
gUnk_085D2F0C: @ 085D2F0C
	.incbin "fe6-base.gba", 0x5D2F0C, (0x5D2F2C - 0x5D2F0C) @ length: 0020

	.global gUnk_085D2F2C
gUnk_085D2F2C: @ 085D2F2C
	.incbin "fe6-base.gba", 0x5D2F2C, (0x5D2F4C - 0x5D2F2C) @ length: 0020

	.global gUnk_085D2F4C
gUnk_085D2F4C: @ 085D2F4C
	.incbin "fe6-base.gba", 0x5D2F4C, (0x5D2F64 - 0x5D2F4C) @ length: 0018

	.global gUnk_085D2F64
gUnk_085D2F64: @ 085D2F64
	.incbin "fe6-base.gba", 0x5D2F64, (0x5D2F7C - 0x5D2F64) @ length: 0018

	.global gUnk_085D2F7C
gUnk_085D2F7C: @ 085D2F7C
	.incbin "fe6-base.gba", 0x5D2F7C, (0x5D2F8C - 0x5D2F7C) @ length: 0010

	.global gUnk_085D2F8C
gUnk_085D2F8C: @ 085D2F8C
	.incbin "fe6-base.gba", 0x5D2F8C, (0x5D2FAC - 0x5D2F8C) @ length: 0020

	.global gUnk_085D2FAC
gUnk_085D2FAC: @ 085D2FAC
	.incbin "fe6-base.gba", 0x5D2FAC, (0x5D2FC4 - 0x5D2FAC) @ length: 0018

	.global gUnk_085D2FC4
gUnk_085D2FC4: @ 085D2FC4
	.incbin "fe6-base.gba", 0x5D2FC4, (0x5D2FC8 - 0x5D2FC4) @ length: 0004

	.global gUnk_085D2FC8
gUnk_085D2FC8: @ 085D2FC8
	.incbin "fe6-base.gba", 0x5D2FC8, (0x5D2FE8 - 0x5D2FC8) @ length: 0020

	.global gUnk_085D2FE8
gUnk_085D2FE8: @ 085D2FE8
	.incbin "fe6-base.gba", 0x5D2FE8, (0x5D3000 - 0x5D2FE8) @ length: 0018

	.global gUnk_085D3000
gUnk_085D3000: @ 085D3000
	.incbin "fe6-base.gba", 0x5D3000, (0x5D3018 - 0x5D3000) @ length: 0018

	.global gUnk_085D3018
gUnk_085D3018: @ 085D3018
	.incbin "fe6-base.gba", 0x5D3018, (0x5D304C - 0x5D3018) @ length: 0034

	.global gUnk_085D304C
gUnk_085D304C: @ 085D304C
	.incbin "fe6-base.gba", 0x5D304C, (0x5D3080 - 0x5D304C) @ length: 0034

	.global gUnk_085D3080
gUnk_085D3080: @ 085D3080
	.incbin "fe6-base.gba", 0x5D3080, (0x5D30A0 - 0x5D3080) @ length: 0020

	.global gUnk_085D30A0
gUnk_085D30A0: @ 085D30A0
	.incbin "fe6-base.gba", 0x5D30A0, (0x5D30B8 - 0x5D30A0) @ length: 0018

	.global gUnk_085D30B8
gUnk_085D30B8: @ 085D30B8
	.incbin "fe6-base.gba", 0x5D30B8, (0x5D30D0 - 0x5D30B8) @ length: 0018

	.global gUnk_085D30D0
gUnk_085D30D0: @ 085D30D0
	.incbin "fe6-base.gba", 0x5D30D0, (0x5D3118 - 0x5D30D0) @ length: 0048

	.global gUnk_085D3118
gUnk_085D3118: @ 085D3118
	.incbin "fe6-base.gba", 0x5D3118, (0x5D3138 - 0x5D3118) @ length: 0020

	.global gUnk_085D3138
gUnk_085D3138: @ 085D3138
	.incbin "fe6-base.gba", 0x5D3138, (0x5D3150 - 0x5D3138) @ length: 0018

	.global gUnk_085D3150
gUnk_085D3150: @ 085D3150
	.incbin "fe6-base.gba", 0x5D3150, (0x5D3168 - 0x5D3150) @ length: 0018

	.global gUnk_085D3168
gUnk_085D3168: @ 085D3168
	.incbin "fe6-base.gba", 0x5D3168, (0x5D31A8 - 0x5D3168) @ length: 0040

	.global gUnk_085D31A8
gUnk_085D31A8: @ 085D31A8
	.incbin "fe6-base.gba", 0x5D31A8, (0x5D31C8 - 0x5D31A8) @ length: 0020

	.global gUnk_085D31C8
gUnk_085D31C8: @ 085D31C8
	.incbin "fe6-base.gba", 0x5D31C8, (0x5D31E8 - 0x5D31C8) @ length: 0020

	.global gUnk_085D31E8
gUnk_085D31E8: @ 085D31E8
	.incbin "fe6-base.gba", 0x5D31E8, (0x5D3230 - 0x5D31E8) @ length: 0048

	.global gUnk_085D3230
gUnk_085D3230: @ 085D3230
	.incbin "fe6-base.gba", 0x5D3230, (0x5D3248 - 0x5D3230) @ length: 0018

	.global gUnk_085D3248
gUnk_085D3248: @ 085D3248
	.incbin "fe6-base.gba", 0x5D3248, (0x5D3260 - 0x5D3248) @ length: 0018

	.global gUnk_085D3260
gUnk_085D3260: @ 085D3260
	.incbin "fe6-base.gba", 0x5D3260, (0x5D3294 - 0x5D3260) @ length: 0034

	.global gUnk_085D3294
gUnk_085D3294: @ 085D3294
	.incbin "fe6-base.gba", 0x5D3294, (0x5D32C8 - 0x5D3294) @ length: 0034

	.global gUnk_085D32C8
gUnk_085D32C8: @ 085D32C8
	.incbin "fe6-base.gba", 0x5D32C8, (0x5D32E8 - 0x5D32C8) @ length: 0020

	.global gUnk_085D32E8
gUnk_085D32E8: @ 085D32E8
	.incbin "fe6-base.gba", 0x5D32E8, (0x5D3300 - 0x5D32E8) @ length: 0018

	.global gUnk_085D3300
gUnk_085D3300: @ 085D3300
	.incbin "fe6-base.gba", 0x5D3300, (0x5D3318 - 0x5D3300) @ length: 0018

	.global gUnk_085D3318
gUnk_085D3318: @ 085D3318
	.incbin "fe6-base.gba", 0x5D3318, (0x5D3338 - 0x5D3318) @ length: 0020

	.global gUnk_085D3338
gUnk_085D3338: @ 085D3338
	.incbin "fe6-base.gba", 0x5D3338, (0x5D33F0 - 0x5D3338) @ length: 00B8

	.global gUnk_085D33F0
gUnk_085D33F0: @ 085D33F0
	.incbin "fe6-base.gba", 0x5D33F0, (0x5D3408 - 0x5D33F0) @ length: 0018

	.global gUnk_085D3408
gUnk_085D3408: @ 085D3408
	.incbin "fe6-base.gba", 0x5D3408, (0x5D3420 - 0x5D3408) @ length: 0018

	.global gUnk_085D3420
gUnk_085D3420: @ 085D3420
	.incbin "fe6-base.gba", 0x5D3420, (0x5D3434 - 0x5D3420) @ length: 0014

	.global gUnk_085D3434
gUnk_085D3434: @ 085D3434
	.incbin "fe6-base.gba", 0x5D3434, (0x5D3454 - 0x5D3434) @ length: 0020

	.global gUnk_085D3454
gUnk_085D3454: @ 085D3454
	.incbin "fe6-base.gba", 0x5D3454, (0x5D3474 - 0x5D3454) @ length: 0020
