	.include "asm_proc.inc"

	.section .rodata

	.global SioText_NoData
SioText_NoData: @ 0810F164
	.incbin "fe6-base.gba", 0x10F164, (0x10F170 - 0x10F164) @ length: 000C

	.global gUnk_Sio_0810F170
gUnk_Sio_0810F170: @ 0810F170
	.incbin "fe6-base.gba", 0x10F170, (0x10F190 - 0x10F170) @ length: 0020

	.global gUnk_Sio_0810F190
gUnk_Sio_0810F190: @ 0810F190
	.incbin "fe6-base.gba", 0x10F190, (0x10F19C - 0x10F190) @ length: 000C

	.global gUnk_Sio_0810F19C
gUnk_Sio_0810F19C: @ 0810F19C
	.incbin "fe6-base.gba", 0x10F19C, (0x10F19F - 0x10F19C) @ length: 0003

	.global gXposArray_SioTeamListSwicthing
gXposArray_SioTeamListSwicthing: @ 0810F19F
	.incbin "fe6-base.gba", 0x10F19F, (0x10F1AC - 0x10F19F) @ length: 000D

	.global gUnk_Sio_0810F1AC
gUnk_Sio_0810F1AC: @ 0810F1AC
	.incbin "fe6-base.gba", 0x10F1AC, (0x10F1BD - 0x10F1AC) @ length: 0011

	.global gUnk_Sio_0810F1BD
gUnk_Sio_0810F1BD: @ 0810F1BD
	.incbin "fe6-base.gba", 0x10F1BD, (0x10F1C8 - 0x10F1BD) @ length: 000B

	.global gUnk_Sio_0810F1C8
gUnk_Sio_0810F1C8: @ 0810F1C8
	.incbin "fe6-base.gba", 0x10F1C8, (0x10F220 - 0x10F1C8) @ length: 0058

	.global Sprite_Sio_0810F220
Sprite_Sio_0810F220: @ 0810F220
	.incbin "fe6-base.gba", 0x10F220, (0x10F228 - 0x10F220) @ length: 0008

	.global Sprite_Sio_0810F228
Sprite_Sio_0810F228: @ 0810F228
	.incbin "fe6-base.gba", 0x10F228, (0x10F242 - 0x10F228) @ length: 001A

	.global Sprite_Sio_0810F242
Sprite_Sio_0810F242: @ 0810F242
	.incbin "fe6-base.gba", 0x10F242, (0x10F256 - 0x10F242) @ length: 0014

	.global Sprite_Sio_0810F256
Sprite_Sio_0810F256: @ 0810F256
	.incbin "fe6-base.gba", 0x10F256, (0x10F25E - 0x10F256) @ length: 0008

	.global Sprite_Sio_0810F25E
Sprite_Sio_0810F25E: @ 0810F25E
	.incbin "fe6-base.gba", 0x10F25E, (0x10F26C - 0x10F25E) @ length: 000E

	.global gUnk_Sio_0810F26C
gUnk_Sio_0810F26C: @ 0810F26C
	.incbin "fe6-base.gba", 0x10F26C, (0x10F294 - 0x10F26C) @ length: 0028

	.global gUnk_Sio_0810F294
gUnk_Sio_0810F294: @ 0810F294
	.incbin "fe6-base.gba", 0x10F294, (0x10F298 - 0x10F294) @ length: 0004

	.global gLinkArenaRuleData
gLinkArenaRuleData: @ 0810F298
	.incbin "fe6-base.gba", 0x10F298, (0x10F2D4 - 0x10F298) @ length: 003C

	.global gUnk_Sio_0810F2D4
gUnk_Sio_0810F2D4: @ 0810F2D4
	.incbin "fe6-base.gba", 0x10F2D4, (0x10F2DC - 0x10F2D4) @ length: 0008

	.global gUnk_Sio_0810F2DC
gUnk_Sio_0810F2DC: @ 0810F2DC
	.incbin "fe6-base.gba", 0x10F2DC, (0x10F2E0 - 0x10F2DC) @ length: 0004

	.global gUnk_Sio_0810F2E0
gUnk_Sio_0810F2E0: @ 0810F2E0
	.incbin "fe6-base.gba", 0x10F2E0, (0x10F2E3 - 0x10F2E0) @ length: 0003

	.global gUnk_Sio_0810F2E3
gUnk_Sio_0810F2E3: @ 0810F2E3
	.incbin "fe6-base.gba", 0x10F2E3, (0x10F2EC - 0x10F2E3) @ length: 0009

	.global gUnk_Sio_0810F2EC
gUnk_Sio_0810F2EC: @ 0810F2EC
	.incbin "fe6-base.gba", 0x10F2EC, (0x10F2F8 - 0x10F2EC) @ length: 000C

	.global gUnk_Sio_0810F2F8
gUnk_Sio_0810F2F8: @ 0810F2F8
	.incbin "fe6-base.gba", 0x10F2F8, (0x10F300 - 0x10F2F8) @ length: 0008

	.global gUnk_Sio_0810F300
gUnk_Sio_0810F300: @ 0810F300
	.incbin "fe6-base.gba", 0x10F300, (0x10F308 - 0x10F300) @ length: 0008

	.global gUnk_Sio_0810F308
gUnk_Sio_0810F308: @ 0810F308
	.incbin "fe6-base.gba", 0x10F308, (0x10F30D - 0x10F308) @ length: 0005

	.global gUnk_Sio_0810F30D
gUnk_Sio_0810F30D: @ 0810F30D
	.incbin "fe6-base.gba", 0x10F30D, (0x10F314 - 0x10F30D) @ length: 0007

	.global gUnk_Sio_0810F314
gUnk_Sio_0810F314: @ 0810F314
	.incbin "fe6-base.gba", 0x10F314, (0x10F31C - 0x10F314) @ length: 0008

	.global gUnk_Sio_0810F31C
gUnk_Sio_0810F31C: @ 0810F31C
	.incbin "fe6-base.gba", 0x10F31C, (0x10F328 - 0x10F31C) @ length: 000C

	.global gUnk_Sio_0810F328
gUnk_Sio_0810F328: @ 0810F328
	.incbin "fe6-base.gba", 0x10F328, (0x10F350 - 0x10F328) @ length: 0028

	.global gUnk_Sio_0810F350
gUnk_Sio_0810F350: @ 0810F350
	.incbin "fe6-base.gba", 0x10F350, (0x10F35A - 0x10F350) @ length: 000A

	.global gUnk_Sio_0810F35A
gUnk_Sio_0810F35A: @ 0810F35A
	.incbin "fe6-base.gba", 0x10F35A, (0x10F360 - 0x10F35A) @ length: 0006

	.global gSioMenuProcArray
gSioMenuProcArray: @ 0810F360
	.4byte ProcScr_SIOTERM
	.4byte ProcScr_SIOPRA
	.4byte ProcScr_SIOBAT
	.4byte ProcScr_SIORESULT
	.4byte ProcScr_SIO_RuleSettings

	.global gUnk_Sio_0810F374
gUnk_Sio_0810F374: @ 0810F374
	.incbin "fe6-base.gba", 0x10F374, (0x10F378 - 0x10F374) @ length: 0004

	.global gUnk_Sio_0810F378
gUnk_Sio_0810F378: @ 0810F378
	.incbin "fe6-base.gba", 0x10F378, (0x10F380 - 0x10F378) @ length: 0008

	.global gUnk_Sio_0810F380
gUnk_Sio_0810F380: @ 0810F380
	.incbin "fe6-base.gba", 0x10F380, (0x10F388 - 0x10F380) @ length: 0008

	.global gUnk_Sio_0810F388
gUnk_Sio_0810F388: @ 0810F388
	.incbin "fe6-base.gba", 0x10F388, (0x10F390 - 0x10F388) @ length: 0008

	.global gUnk_Sio_0810F390
gUnk_Sio_0810F390: @ 0810F390
	.incbin "fe6-base.gba", 0x10F390, (0x10F3A0 - 0x10F390) @ length: 0010

	.global gUnk_Sio_0810F3A0
gUnk_Sio_0810F3A0: @ 0810F3A0
	.incbin "fe6-base.gba", 0x10F3A0, (0x10F3B0 - 0x10F3A0) @ length: 0010

	.global gUnk_Sio_0810F3B0
gUnk_Sio_0810F3B0: @ 0810F3B0
	.incbin "fe6-base.gba", 0x10F3B0, (0x10F400 - 0x10F3B0) @ length: 0050

	.global gUnk_Sio_0810F400
gUnk_Sio_0810F400: @ 0810F400
	.incbin "fe6-base.gba", 0x10F400, (0x10F408 - 0x10F400) @ length: 0008

	.global gUnk_Sio_0810F408
gUnk_Sio_0810F408: @ 0810F408
	.incbin "fe6-base.gba", 0x10F408, (0x10F41B - 0x10F408) @ length: 0013

	.global gUnk_Sio_0810F41B
gUnk_Sio_0810F41B: @ 0810F41B
	.incbin "fe6-base.gba", 0x10F41B, (0x10F423 - 0x10F41B) @ length: 0008

	.global gUnk_Sio_0810F423
gUnk_Sio_0810F423: @ 0810F423
	.incbin "fe6-base.gba", 0x10F423, (0x10F42B - 0x10F423) @ length: 0008

	.global gUnk_Sio_0810F42B
gUnk_Sio_0810F42B: @ 0810F42B
	.incbin "fe6-base.gba", 0x10F42B, (0x10F430 - 0x10F42B) @ length: 0005

	.global gUnk_Sio_0810F430
gUnk_Sio_0810F430: @ 0810F430
	.incbin "fe6-base.gba", 0x10F430, (0x10F432 - 0x10F430) @ length: 0002

	.global gUnk_Sio_0810F432
gUnk_Sio_0810F432: @ 0810F432
	.incbin "fe6-base.gba", 0x10F432, (0x10F434 - 0x10F432) @ length: 0002

	.global Sprite_LinkArenaBButton
Sprite_LinkArenaBButton: @ 0810F434
	.incbin "fe6-base.gba", 0x10F434, (0x10F442 - 0x10F434) @ length: 000E

	.global gUnk_Sio_0810F442
gUnk_Sio_0810F442: @ 0810F442
	.incbin "fe6-base.gba", 0x10F442, (0x10F45A - 0x10F442) @ length: 0018

	.global gUnk_Sio_0810F45A
gUnk_Sio_0810F45A: @ 0810F45A
	.incbin "fe6-base.gba", 0x10F45A, (0x10F4C8 - 0x10F45A) @ length: 006E

	.global gUnk_Sio_0810F4C8
gUnk_Sio_0810F4C8: @ 0810F4C8
	.incbin "fe6-base.gba", 0x10F4C8, (0x10F50A - 0x10F4C8) @ length: 0042

	.global gUnk_Sio_0810F50A
gUnk_Sio_0810F50A: @ 0810F50A
	.incbin "fe6-base.gba", 0x10F50A, (0x10F52A - 0x10F50A) @ length: 0020

	.global Sprite_LinkArena_NAMEBANNER
Sprite_LinkArena_NAMEBANNER: @ 0810F52A
	.incbin "fe6-base.gba", 0x10F52A, (0x10F544 - 0x10F52A) @ length: 001A

	.global gUnk_Sio_0810F544
gUnk_Sio_0810F544: @ 0810F544
	.incbin "fe6-base.gba", 0x10F544, (0x10F55E - 0x10F544) @ length: 001A

	.global gUnk_Sio_0810F55E
gUnk_Sio_0810F55E: @ 0810F55E
	.incbin "fe6-base.gba", 0x10F55E, (0x10F57C - 0x10F55E) @ length: 001E

	.global gUnk_Sio_0810F57C
gUnk_Sio_0810F57C: @ 0810F57C
	.incbin "fe6-base.gba", 0x10F57C, (0x10F5C4 - 0x10F57C) @ length: 0048

	.global gUnk_Sio_0810F5C4
gUnk_Sio_0810F5C4: @ 0810F5C4
	.incbin "fe6-base.gba", 0x10F5C4, (0x10F5D2 - 0x10F5C4) @ length: 000E

	.global gUnk_Sio_0810F5D2
gUnk_Sio_0810F5D2: @ 0810F5D2
	.incbin "fe6-base.gba", 0x10F5D2, (0x10F5E0 - 0x10F5D2) @ length: 000E

	.global gUnk_Sio_0810F5E0
gUnk_Sio_0810F5E0: @ 0810F5E0
	.incbin "fe6-base.gba", 0x10F5E0, (0x10F5EE - 0x10F5E0) @ length: 000E

	.global gUnk_Sio_0810F5EE
gUnk_Sio_0810F5EE: @ 0810F5EE
	.incbin "fe6-base.gba", 0x10F5EE, (0x10F5FC - 0x10F5EE) @ length: 000E

	.global gUnk_Sio_0810F5FC
gUnk_Sio_0810F5FC: @ 0810F5FC
	.incbin "fe6-base.gba", 0x10F5FC, (0x10F65C - 0x10F5FC) @ length: 0060

	.global gUnk_Sio_0810F65C
gUnk_Sio_0810F65C: @ 0810F65C
	.incbin "fe6-base.gba", 0x10F65C, (0x10F664 - 0x10F65C) @ length: 0008

	.global Sprite_Sio_0810F664
Sprite_Sio_0810F664: @ 0810F664
	.incbin "fe6-base.gba", 0x10F664, (0x10F672 - 0x10F664) @ length: 000E

	.global Sprite_Sio_0810F672
Sprite_Sio_0810F672: @ 0810F672
	.incbin "fe6-base.gba", 0x10F672, (0x10F6A4 - 0x10F672) @ length: 0032

	.global Sprite_LinkArena_ChoiceBanner
Sprite_LinkArena_ChoiceBanner: @ 0810F6A4
	.incbin "fe6-base.gba", 0x10F6A4, (0x10F6D4 - 0x10F6A4) @ length: 0030
