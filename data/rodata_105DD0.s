
	.section .rodata

	BEGIN = 0x105DD0
	END   = 0x10D668

	.incbin "fe6-base.gba", BEGIN, (0x1065C8 - BEGIN)

	.global gUnk_081065C8
gUnk_081065C8: @ 081065C8
	.incbin "fe6-base.gba", 0x1065C8, (0x106784 - 0x1065C8) @ length: 01BC

	.global gUnk_08106784
gUnk_08106784: @ 08106784
	.incbin "fe6-base.gba", 0x106784, (0x106CC8 - 0x106784) @ length: 0544

	.global Img_SioMenuBgSlide
Img_SioMenuBgSlide: @ 08106CC8
	.incbin "fe6-base.gba", 0x106CC8, (0x107820 - 0x106CC8) @ length: 0B58

	.global Img_TacticianSelObj
Img_TacticianSelObj: @ 08107820
	.incbin "fe6-base.gba", 0x107820, (0x1080D4 - 0x107820) @ length: 08B4

	.global Img_Sio_081080D4
Img_Sio_081080D4: @ 081080D4
	.incbin "fe6-base.gba", 0x1080D4, (0x108514 - 0x1080D4) @ length: 0440

	.global Img_LinkArenaRankIcons
Img_LinkArenaRankIcons: @ 08108514
	.incbin "fe6-base.gba", 0x108514, (0x1088E8 - 0x108514) @ length: 03D4

	.global Img_LinkArenaPlayerBanners
Img_LinkArenaPlayerBanners: @ 081088E8
	.incbin "fe6-base.gba", 0x1088E8, (0x108B14 - 0x1088E8) @ length: 022C

	.global Img_LinkArenaPlacementRanks
Img_LinkArenaPlacementRanks: @ 08108B14
	.incbin "fe6-base.gba", 0x108B14, (0x109290 - 0x108B14) @ length: 077C

	.global Img_LinkArenaActiveBannerFx
Img_LinkArenaActiveBannerFx: @ 08109290
	.incbin "fe6-base.gba", 0x109290, (0x1094B0 - 0x109290) @ length: 0220

	.global Img_LAPointsBox
Img_LAPointsBox: @ 081094B0
	.incbin "fe6-base.gba", 0x1094B0, (0x109648 - 0x1094B0) @ length: 0198

	.global gUnk_08109648
gUnk_08109648: @ 08109648
	.incbin "fe6-base.gba", 0x109648, (0x109854 - 0x109648) @ length: 020C

	.global gUnk_08109854
gUnk_08109854: @ 08109854
	.incbin "fe6-base.gba", 0x109854, (0x1099A0 - 0x109854) @ length: 014C

	.global Pal_SioMenuBgSlide
Pal_SioMenuBgSlide: @ 081099A0
	.incbin "fe6-base.gba", 0x1099A0, (0x109A00 - 0x1099A0) @ length: 0060

	.global Pal_TacticianSelObj
Pal_TacticianSelObj: @ 08109A00
	.incbin "fe6-base.gba", 0x109A00, (0x109A80 - 0x109A00) @ length: 0080

	.global Pal_LinkArenaRankIcons
Pal_LinkArenaRankIcons: @ 08109A80
	.incbin "fe6-base.gba", 0x109A80, (0x109AC0 - 0x109A80) @ length: 0040

	.global gUnk_08109AC0
gUnk_08109AC0: @ 08109AC0
	.incbin "fe6-base.gba", 0x109AC0, (0x109B00 - 0x109AC0) @ length: 0040

	.global gUnk_08109B00
gUnk_08109B00: @ 08109B00
	.incbin "fe6-base.gba", 0x109B00, (0x109BA0 - 0x109B00) @ length: 00A0

	.global Pal_LinkArenaPlacementRanks
Pal_LinkArenaPlacementRanks: @ 08109BA0
	.incbin "fe6-base.gba", 0x109BA0, (0x109BC0 - 0x109BA0) @ length: 0020

	.global gUnk_08109BC0
gUnk_08109BC0: @ 08109BC0
	.incbin "fe6-base.gba", 0x109BC0, (0x109BE0 - 0x109BC0) @ length: 0020

	.global Pal_LinkArenaActiveBannerFx
Pal_LinkArenaActiveBannerFx: @ 08109BE0
	.incbin "fe6-base.gba", 0x109BE0, (0x109C00 - 0x109BE0) @ length: 0020

	.global gUnk_08109C00
gUnk_08109C00: @ 08109C00
	.incbin "fe6-base.gba", 0x109C00, (0x109C20 - 0x109C00) @ length: 0020

	.global gUnk_08109C20
gUnk_08109C20: @ 08109C20
	.incbin "fe6-base.gba", 0x109C20, (0x109C40 - 0x109C20) @ length: 0020

	.global gUnk_08109C40
gUnk_08109C40: @ 08109C40
	.incbin "fe6-base.gba", 0x109C40, (0x109C60 - 0x109C40) @ length: 0020

	.global gUnk_08109C60
gUnk_08109C60: @ 08109C60
	.incbin "fe6-base.gba", 0x109C60, (0x109C80 - 0x109C60) @ length: 0020

	.global Pal_LinkArenaMuralBackground
Pal_LinkArenaMuralBackground: @ 08109C80
	.incbin "fe6-base.gba", 0x109C80, (0x109CC0 - 0x109C80) @ length: 0040

	.global gUnk_08109CC0
gUnk_08109CC0: @ 08109CC0
	.incbin "fe6-base.gba", 0x109CC0, (0x109D78 - 0x109CC0) @ length: 00B8

	.global gUnk_08109D78
gUnk_08109D78: @ 08109D78
	.incbin "fe6-base.gba", 0x109D78, (0x109DF4 - 0x109D78) @ length: 007C

	.global Tsa_Sio_08109DF4
Tsa_Sio_08109DF4: @ 08109DF4
	.incbin "fe6-base.gba", 0x109DF4, (0x10A044 - 0x109DF4) @ length: 0250

	.global gUnk_0810A044
gUnk_0810A044: @ 0810A044
	.incbin "fe6-base.gba", 0x10A044, (0x10A318 - 0x10A044) @ length: 02D4

	.global gUnk_0810A318
gUnk_0810A318: @ 0810A318
	.incbin "fe6-base.gba", 0x10A318, (0x10A62C - 0x10A318) @ length: 0314

	.global gUnk_0810A62C
gUnk_0810A62C: @ 0810A62C
	.incbin "fe6-base.gba", 0x10A62C, (0x10AADC - 0x10A62C) @ length: 04B0

	.global gUnk_0810AADC
gUnk_0810AADC: @ 0810AADC
	.incbin "fe6-base.gba", 0x10AADC, (0x10AF9C - 0x10AADC) @ length: 04C0

	.global gUnk_0810AF9C
gUnk_0810AF9C: @ 0810AF9C
	.incbin "fe6-base.gba", 0x10AF9C, (0x10B44C - 0x10AF9C) @ length: 04B0

	.global gUnk_0810B44C
gUnk_0810B44C: @ 0810B44C
	.incbin "fe6-base.gba", 0x10B44C, (0x10B900 - 0x10B44C) @ length: 04B4

	.global gUnk_0810B900
gUnk_0810B900: @ 0810B900
	.incbin "fe6-base.gba", 0x10B900, (0x10BA60 - 0x10B900) @ length: 0160

	.global gUnk_0810BA60
gUnk_0810BA60: @ 0810BA60
	.incbin "fe6-base.gba", 0x10BA60, (0x10BA80 - 0x10BA60) @ length: 0020

	.global gUnk_0810BA80
gUnk_0810BA80: @ 0810BA80
	.incbin "fe6-base.gba", 0x10BA80, (0x10BAA0 - 0x10BA80) @ length: 0020

	.global gUnk_0810BAA0
gUnk_0810BAA0: @ 0810BAA0
	.incbin "fe6-base.gba", 0x10BAA0, (0x10BAC0 - 0x10BAA0) @ length: 0020

	.global gUnk_0810BAC0
gUnk_0810BAC0: @ 0810BAC0
	.incbin "fe6-base.gba", 0x10BAC0, (0x10BAE0 - 0x10BAC0) @ length: 0020

	.global Img_LinkArenaPostBattleBg
Img_LinkArenaPostBattleBg: @ 0810BAE0
	.incbin "fe6-base.gba", 0x10BAE0, (0x10D134 - 0x10BAE0) @ length: 1654

	.global Pal_LinkArenaPostBattleBg
Pal_LinkArenaPostBattleBg: @ 0810D134
	.incbin "fe6-base.gba", 0x10D134, (0x10D1B4 - 0x10D134) @ length: 0080

	.global Tsa_LinkArenaPostBattleBg
Tsa_LinkArenaPostBattleBg: @ 0810D1B4
	.incbin "fe6-base.gba", 0x10D1B4, (END - 0x10D1B4) @ length: 04B4
