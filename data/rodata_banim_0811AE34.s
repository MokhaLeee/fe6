	.section .rodata


	.global FrameArray_EfxopFireBG
FrameArray_EfxopFireBG: @ 0811AF20
	.incbin "fe6-base.gba", 0x11AF20, (0x11AF52 - 0x11AF20) @ length: 0032

	.global FrameArray_EfxopThunderBG
FrameArray_EfxopThunderBG: @ 0811AF52
	.incbin "fe6-base.gba", 0x11AF52, (0x11AF5C - 0x11AF52) @ length: 000A

	.global FrameArray_EfxopThunderBGCOL
FrameArray_EfxopThunderBGCOL: @ 0811AF5C
	.incbin "fe6-base.gba", 0x11AF5C, (0x11AF9E - 0x11AF5C) @ length: 0042

	.global gUnk_0811AF9E
gUnk_0811AF9E: @ 0811AF9E
	.incbin "fe6-base.gba", 0x11AF9E, (0x11AFA4 - 0x11AF9E) @ length: 0006

	.global gUnk_0811AFA4
gUnk_0811AFA4: @ 0811AFA4
	.incbin "fe6-base.gba", 0x11AFA4, (0x11AFE8 - 0x11AFA4) @ length: 0044

	.global Img_TeonoOBJ
Img_TeonoOBJ: @ 0811AFE8
	.incbin "fe6-base.gba", 0x11AFE8, (0x11B3E8 - 0x11AFE8) @ length: 0400

	.global Pal_TeonoOBJ
Pal_TeonoOBJ: @ 0811B3E8
	.incbin "fe6-base.gba", 0x11B3E8, (0x11B408 - 0x11B3E8) @ length: 0020

	.global Img_EfxArrowOBJ
Img_EfxArrowOBJ: @ 0811B408
	.incbin "fe6-base.gba", 0x11B408, (0x11B444 - 0x11B408) @ length: 003C

	.global Img_SpellJavelin
Img_SpellJavelin: @ 0811B444
	.incbin "fe6-base.gba", 0x11B444, (0x11B674 - 0x11B444) @ length: 0230

	.global Pal_SpellJavelin
Pal_SpellJavelin: @ 0811B674
	.incbin "fe6-base.gba", 0x11B674, (0x11B694 - 0x11B674) @ length: 0020

	.global Img_SpellJavelinCavalier
Img_SpellJavelinCavalier: @ 0811B694
	.incbin "fe6-base.gba", 0x11B694, (0x11B8B0 - 0x11B694) @ length: 021C

	.global Pal_SpellJavelinCavalier
Pal_SpellJavelinCavalier: @ 0811B8B0
	.incbin "fe6-base.gba", 0x11B8B0, (0x11B8D0 - 0x11B8B0) @ length: 0020

	.global Img_SpellJavelinSoldier
Img_SpellJavelinSoldier: @ 0811B8D0
	.incbin "fe6-base.gba", 0x11B8D0, (0x11BAE8 - 0x11B8D0) @ length: 0218

	.global Pal_SpellJavelinSoldier
Pal_SpellJavelinSoldier: @ 0811BAE8
	.incbin "fe6-base.gba", 0x11BAE8, (0x11BB08 - 0x11BAE8) @ length: 0020

	.global Img_SpellJavelinPaladin
Img_SpellJavelinPaladin: @ 0811BB08
	.incbin "fe6-base.gba", 0x11BB08, (0x11BD24 - 0x11BB08) @ length: 021C

	.global Pal_SpellJavelinPaladin
Pal_SpellJavelinPaladin: @ 0811BD24
	.incbin "fe6-base.gba", 0x11BD24, (0x11BD44 - 0x11BD24) @ length: 0020

	.global Img_SpellJavelinPrgasusKnight
Img_SpellJavelinPrgasusKnight: @ 0811BD44
	.incbin "fe6-base.gba", 0x11BD44, (0x11BF70 - 0x11BD44) @ length: 022C

	.global Pal_SpellJavelinPrgasusKnight
Pal_SpellJavelinPrgasusKnight: @ 0811BF70
	.incbin "fe6-base.gba", 0x11BF70, (0x11BF90 - 0x11BF70) @ length: 0020

	.global Img_SpellJavelinFalcon
Img_SpellJavelinFalcon: @ 0811BF90
	.incbin "fe6-base.gba", 0x11BF90, (0x11C1D8 - 0x11BF90) @ length: 0248

	.global Pal_SpellJavelinFalcon
Pal_SpellJavelinFalcon: @ 0811C1D8
	.incbin "fe6-base.gba", 0x11C1D8, (0x11C1F8 - 0x11C1D8) @ length: 0020

	.global Img_SpellJavelinWyvernRider
Img_SpellJavelinWyvernRider: @ 0811C1F8
	.incbin "fe6-base.gba", 0x11C1F8, (0x11C430 - 0x11C1F8) @ length: 0238

	.global Pal_SpellJavelinWyvernRider
Pal_SpellJavelinWyvernRider: @ 0811C430
	.incbin "fe6-base.gba", 0x11C430, (0x11C450 - 0x11C430) @ length: 0020

	.global Img_SpellJavelinWyvernLord
Img_SpellJavelinWyvernLord: @ 0811C450
	.incbin "fe6-base.gba", 0x11C450, (0x11C6B4 - 0x11C450) @ length: 0264

	.global Pal_SpellJavelinWyvernLord
Pal_SpellJavelinWyvernLord: @ 0811C6B4
	.incbin "fe6-base.gba", 0x11C6B4, (0x11C6D4 - 0x11C6B4) @ length: 0020

	.global Img_SpellJavelinGenerial
Img_SpellJavelinGenerial: @ 0811C6D4
	.incbin "fe6-base.gba", 0x11C6D4, (0x11C944 - 0x11C6D4) @ length: 0270

	.global Pal_SpellJavelinGenerial
Pal_SpellJavelinGenerial: @ 0811C944
	.incbin "fe6-base.gba", 0x11C944, (0x11C964 - 0x11C944) @ length: 0020

	.global Img_EfxSongFE6
Img_EfxSongFE6: @ 0811C964
	.incbin "fe6-base.gba", 0x11C964, (0x11CAD8 - 0x11C964) @ length: 0174

	.global Pal_EfxSongFE6
Pal_EfxSongFE6: @ 0811CAD8
	.incbin "fe6-base.gba", 0x11CAD8, (0x11CAF8 - 0x11CAD8) @ length: 0020

	.global Img_EfxSongBG
Img_EfxSongBG: @ 0811CAF8
	.incbin "fe6-base.gba", 0x11CAF8, (0x11CD14 - 0x11CAF8) @ length: 021C

	.global Pal_EfxSongBG
Pal_EfxSongBG: @ 0811CD14
	.incbin "fe6-base.gba", 0x11CD14, (0x11D0D4 - 0x11CD14) @ length: 03C0

	.global Tsa_EfxSongBG
Tsa_EfxSongBG: @ 0811D0D4
	.incbin "fe6-base.gba", 0x11D0D4, (0x11E36C - 0x11D0D4) @ length: 1298

	.global Img_EfxEckesachsBG
Img_EfxEckesachsBG: @ 0811E36C
	.incbin "fe6-base.gba", 0x11E36C, (0x11F22C - 0x11E36C) @ length: 0EC0

	.global Pal_EfxEckesachsBG
Pal_EfxEckesachsBG: @ 0811F22C
	.incbin "fe6-base.gba", 0x11F22C, (0x11F32C - 0x11F22C) @ length: 0100

	.global Tsa_EfxEckesachsBG
Tsa_EfxEckesachsBG: @ 0811F32C
	.incbin "fe6-base.gba", 0x11F32C, (0x11F6F4 - 0x11F32C) @ length: 03C8

	.global Img_BreathSprites
Img_BreathSprites: @ 0811F6F4
	.incbin "fe6-base.gba", 0x11F6F4, (0x1203F4 - 0x11F6F4) @ length: 0D00

	.global Pal_EfxBindingBlade
Pal_EfxBindingBlade: @ 081203F4
	.incbin "fe6-base.gba", 0x1203F4, (0x120414 - 0x1203F4) @ length: 0020

	.global Img_EfxHurtmutEff00OBJ1
Img_EfxHurtmutEff00OBJ1: @ 08120414
	.incbin "fe6-base.gba", 0x120414, (0x120CB4 - 0x120414) @ length: 08A0

	.global Img_EfxHurtmutEff00OBJ2
Img_EfxHurtmutEff00OBJ2: @ 08120CB4
	.incbin "fe6-base.gba", 0x120CB4, (0x121498 - 0x120CB4) @ length: 07E4

	.global Pal_EfxHurtmutEff00OBJ
Pal_EfxHurtmutEff00OBJ: @ 08121498
	.incbin "fe6-base.gba", 0x121498, (0x1214B8 - 0x121498) @ length: 0020

	.global Pal_IceBreathSprites
Pal_IceBreathSprites: @ 081214B8
	.incbin "fe6-base.gba", 0x1214B8, (0x1214D8 - 0x1214B8) @ length: 0020

	.global Pal_DarkBreathSprites
Pal_DarkBreathSprites: @ 081214D8
	.incbin "fe6-base.gba", 0x1214D8, (0x1214F8 - 0x1214D8) @ length: 0020

	.global Img_EfxDarkbreathBG
Img_EfxDarkbreathBG: @ 081214F8
	.incbin "fe6-base.gba", 0x1214F8, (0x121EEC - 0x1214F8) @ length: 1544

	.global Tsa_EfxDarkbreathBG1
Tsa_EfxDarkbreathBG1:
	.incbin "fe6-base.gba", 0x121EEC, (0x121FD4 - 0x121EEC)

	.global Tsa_EfxDarkbreathBG2
Tsa_EfxDarkbreathBG2:
	.incbin "fe6-base.gba", 0x121FD4, (0x122090 - 0x121FD4)

	.global Tsa_EfxDarkbreathBG3
Tsa_EfxDarkbreathBG3:
	.incbin "fe6-base.gba", 0x122090, (0x12218C - 0x122090)

	.global Tsa_EfxDarkbreathBG4
Tsa_EfxDarkbreathBG4:
	.incbin "fe6-base.gba", 0x12218C, (0x122274 - 0x12218C)

	.global Tsa_EfxDarkbreathBG5
Tsa_EfxDarkbreathBG5:
	.incbin "fe6-base.gba", 0x122274, (0x12235C - 0x122274)

	.global Tsa_EfxDarkbreathBG6
Tsa_EfxDarkbreathBG6:
	.incbin "fe6-base.gba", 0x12235C, (0x122458 - 0x12235C)

	.global Tsa_EfxDarkbreathBG7
Tsa_EfxDarkbreathBG7:
	.incbin "fe6-base.gba", 0x122458, (0x122584 - 0x122458)

	.global Tsa_EfxDarkbreathBG8
Tsa_EfxDarkbreathBG8:
	.incbin "fe6-base.gba", 0x122584, (0x1226B8 - 0x122584)

	.global Tsa_EfxDarkbreathBG9
Tsa_EfxDarkbreathBG9:
	.incbin "fe6-base.gba", 0x1226B8, (0x12277C - 0x1226B8)

	.global Tsa_EfxDarkbreathBG10
Tsa_EfxDarkbreathBG10:
	.incbin "fe6-base.gba", 0x12277C, (0x1228A8 - 0x12277C)

	.global Tsa_EfxDarkbreathBG11
Tsa_EfxDarkbreathBG11:
	.incbin "fe6-base.gba", 0x1228A8, (0x1229A4 - 0x1228A8)

	.global Tsa_EfxDarkbreathBG12
Tsa_EfxDarkbreathBG12:
	.incbin "fe6-base.gba", 0x1229A4, (0x122A3C - 0x1229A4)

	.global Img_EfxCriricalEffectBG
Img_EfxCriricalEffectBG: @ 08122A3C
	.incbin "fe6-base.gba", 0x122A3C, (0x123B1C - 0x122A3C) @ length: 10E0

	.global Pal_EfxCriricalEffectBG
Pal_EfxCriricalEffectBG: @ 08123B1C
	.incbin "fe6-base.gba", 0x123B1C, (0x123D1C - 0x123B1C) @ length: 0200

	.global Tsa_EfxCriricalEffectBG_L
Tsa_EfxCriricalEffectBG_L: @ 08123D1C
	.incbin "fe6-base.gba", 0x123D1C, (0x1241BC - 0x123D1C) @ length: 04A0

	.global Tsa_EfxCriricalEffectBG_R
Tsa_EfxCriricalEffectBG_R: @ 081241BC
	.incbin "fe6-base.gba", 0x1241BC, (0x124618 - 0x1241BC) @ length: 045C

	.global Img_EfxSRankWeaponEffectBG
Img_EfxSRankWeaponEffectBG: @ 08124618
	.incbin "fe6-base.gba", 0x124618, (0x1246D8 - 0x124618) @ length: 00C0

	.global Pal_EfxSRankWeaponEffectBG
Pal_EfxSRankWeaponEffectBG: @ 081246D8
	.incbin "fe6-base.gba", 0x1246D8, (0x1246F8 - 0x1246D8) @ length: 0020

	.global Tsa_EfxSRankWeaponEffectBG
Tsa_EfxSRankWeaponEffectBG: @ 081246F8
	.incbin "fe6-base.gba", 0x1246F8, (0x12479C - 0x1246F8) @ length: 00A4

	.global Img_EfxNormalEffectBG
Img_EfxNormalEffectBG: @ 0812479C
	.incbin "fe6-base.gba", 0x12479C, (0x124B64 - 0x12479C) @ length: 03C8

	.global Pal_EfxNormalEffectBG
Pal_EfxNormalEffectBG: @ 08124B64
	.incbin "fe6-base.gba", 0x124B64, (0x124B84 - 0x124B64) @ length: 2C14

	.global Tsa1_EfxNormalEffectBG
Tsa1_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x124B84, 0x124C50 - 0x124B84

	.global Tsa2_EfxNormalEffectBG
Tsa2_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x124C50, 0x124D50 - 0x124C50

	.global Tsa3_EfxNormalEffectBG
Tsa3_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x124D50, 0x124E60 - 0x124D50

	.global Tsa4_EfxNormalEffectBG
Tsa4_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x124E60, 0x124F6C - 0x124E60

	.global Tsa5_EfxNormalEffectBG
Tsa5_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x124F6C, 0x125070 - 0x124F6C

	.global Tsa6_EfxNormalEffectBG
Tsa6_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x125070, 0x12515C - 0x125070

	.global Tsa7_EfxNormalEffectBG
Tsa7_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x12515C, 0x125230 - 0x12515C

	.global Tsa8_EfxNormalEffectBG
Tsa8_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x125230, 0x1252EC - 0x125230

	.global Tsa9_EfxNormalEffectBG
Tsa9_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x1252EC, 0x125394 - 0x1252EC

	.global TsaA_EfxNormalEffectBG
TsaA_EfxNormalEffectBG:
    .incbin "fe6-base.gba", 0x125394, 0x127778 - 0x125394

	.global gUnk_08127778
gUnk_08127778: @ 08127778
	.incbin "fe6-base.gba", 0x127778, (0x129504 - 0x127778) @ length: 1D8C

	.global Img_EfxMagfcastBG
Img_EfxMagfcastBG: @ 08129504
	.incbin "fe6-base.gba", 0x129504, (0x12A258 - 0x129504) @ length: 0D54

	.global Pal_EfxMagfcastBG
Pal_EfxMagfcastBG: @ 0812A258
	.incbin "fe6-base.gba", 0x12A258, (0x12A278 - 0x12A258) @ length: 0F44

    .global Tsa1_EfxMagfcastBG
Tsa1_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A278, 0x12A314 - 0x12A278

    .global Tsa2_EfxMagfcastBG
Tsa2_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A314, 0x12A3B0 - 0x12A314

    .global Tsa3_EfxMagfcastBG
Tsa3_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A3B0, 0x12A450 - 0x12A3B0

    .global Tsa4_EfxMagfcastBG
Tsa4_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A450, 0x12A4F4 - 0x12A450

    .global Tsa5_EfxMagfcastBG
Tsa5_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A4F4, 0x12A5A8 - 0x12A4F4

    .global Tsa6_EfxMagfcastBG
Tsa6_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A5A8, 0x12A650 - 0x12A5A8

    .global Tsa7_EfxMagfcastBG
Tsa7_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A650, 0x12A700 - 0x12A650

    .global Tsa8_EfxMagfcastBG
Tsa8_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A700, 0x12A7B0 - 0x12A700

    .global Tsa9_EfxMagfcastBG
Tsa9_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A7B0, 0x12A868 - 0x12A7B0

    .global Tsa10_EfxMagfcastBG
Tsa10_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A868, 0x12A920 - 0x12A868

    .global Tsa11_EfxMagfcastBG
Tsa11_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A920, 0x12A9D4 - 0x12A920

    .global Tsa12_EfxMagfcastBG
Tsa12_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12A9D4, 0x12AA74 - 0x12A9D4

    .global Tsa13_EfxMagfcastBG
Tsa13_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12AA74, 0x12AB28 - 0x12AA74

    .global Tsa14_EfxMagfcastBG
Tsa14_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12AB28, 0x12ABDC - 0x12AB28

    .global Tsa15_EfxMagfcastBG
Tsa15_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12ABDC, 0x12AC90 - 0x12ABDC

    .global Tsa16_EfxMagfcastBG
Tsa16_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12AC90, 0x12AD30 - 0x12AC90

    .global Tsa17_EfxMagfcastBG
Tsa17_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12AD30, 0x12ADEC - 0x12AD30

    .global Tsa18_EfxMagfcastBG
Tsa18_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12ADEC, 0x12AE9C - 0x12ADEC

    .global Tsa19_EfxMagfcastBG
Tsa19_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12AE9C, 0x12AF6C - 0x12AE9C

    .global Tsa20_EfxMagfcastBG
Tsa20_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12AF6C, 0x12B024 - 0x12AF6C

    .global Tsa21_EfxMagfcastBG
Tsa21_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12B024, 0x12B0F4 - 0x12B024

    .global Tsa22_EfxMagfcastBG
Tsa22_EfxMagfcastBG:
    .incbin "fe6-base.gba", 0x12B0F4, 0x12B19C - 0x12B0F4

	.global Img_EfxMagdhisEffectBG
Img_EfxMagdhisEffectBG: @ 0812B19C
	.incbin "fe6-base.gba", 0x12B19C, (0x12BE10 - 0x12B19C) @ length: 0C74

	.global Pal_EfxMagdhisEffectBG
Pal_EfxMagdhisEffectBG: @ 0812BE10
	.incbin "fe6-base.gba", 0x12BE10, (0x12BE30 - 0x12BE10) @ length: 03AC

	.global Tsa1_EfxMagdhisEffectBG
Tsa1_EfxMagdhisEffectBG:
	.incbin "fe6-base.gba", 0x12BE30, 0x12BF30 - 0x12BE30

	.global Tsa2_EfxMagdhisEffectBG
Tsa2_EfxMagdhisEffectBG:
	.incbin "fe6-base.gba", 0x12BF30, 0x12C024 - 0x12BF30

	.global Tsa3_EfxMagdhisEffectBG
Tsa3_EfxMagdhisEffectBG:
	.incbin "fe6-base.gba", 0x12C024, 0x12C0F8 - 0x12C024

	.global Tsa4_EfxMagdhisEffectBG
Tsa4_EfxMagdhisEffectBG:
	.incbin "fe6-base.gba", 0x12C0F8, 0x12C1BC - 0x12C0F8

	.global Img_EfxSunakemuriOBJ
Img_EfxSunakemuriOBJ: @ 0812C1BC
	.incbin "fe6-base.gba", 0x12C1BC, (0x12C62C - 0x12C1BC) @ length: 0470

	.global Pal_EfxSunakemuriOBJ1
Pal_EfxSunakemuriOBJ1: @ 0812C62C
	.incbin "fe6-base.gba", 0x12C62C, (0x12C64C - 0x12C62C) @ length: 0020

	.global Pal_EfxSunakemuriOBJ2
Pal_EfxSunakemuriOBJ2: @ 0812C64C
	.incbin "fe6-base.gba", 0x12C64C, (0x12C66C - 0x12C64C) @ length: 0020

	.global Pal_EfxSunakemuriOBJ3
Pal_EfxSunakemuriOBJ3: @ 0812C66C
	.incbin "fe6-base.gba", 0x12C66C, (0x12C68C - 0x12C66C) @ length: 0020

	.global Img_EfxThunderBG
Img_EfxThunderBG: @ 0812C68C
	.incbin "fe6-base.gba", 0x12C68C, (0x12CF48 - 0x12C68C) @ length: 08BC

	.global Pal_EfxThunderBGCOL
Pal_EfxThunderBGCOL: @ 0812CF48
	.incbin "fe6-base.gba", 0x12CF48, (0x12D148 - 0x12CF48) @ length: 042C

	.global Tsa_EfxThuderBg1
Tsa_EfxThuderBg1:
	.incbin "fe6-base.gba", 0x12D148, (0x12D214 - 0x12D148)

	.global Tsa_EfxThuderBg2
Tsa_EfxThuderBg2:
	.incbin "fe6-base.gba", 0x12D214, (0x12D374 - 0x12D214)

	.global Img_EfxThunderOBJ
Img_EfxThunderOBJ: @ 0812D374
	.incbin "fe6-base.gba", 0x12D374, (0x12D80C - 0x12D374) @ length: 0498

	.global Pal_EfxThunderOBJ
Pal_EfxThunderOBJ: @ 0812D80C
	.incbin "fe6-base.gba", 0x12D80C, (0x12D8AC - 0x12D80C) @ length: 00A0

	.global Img_EfxFireBG
Img_EfxFireBG: @ 0812D8AC
	.incbin "fe6-base.gba", 0x12D8AC, (0x12E4A4 - 0x12D8AC) @ length: 0BF8

	.global Pal_EfxFireBG
Pal_EfxFireBG: @ 0812E4A4
	.incbin "fe6-base.gba", 0x12E4A4, (0x12E4C4 - 0x12E4A4) @ length: 1538

	.global Tsa_EfxFireBG_0812E4C4
Tsa_EfxFireBG_0812E4C4:	@ 0x0812E4C4
	.incbin "fe6-base.gba", 0x12E4C4, 0x12E56C - 0x12E4C4

	.global Tsa_EfxFireBG_0812E56C
Tsa_EfxFireBG_0812E56C:	@ 0x0812E56C
	.incbin "fe6-base.gba", 0x12E56C, 0x12E614 - 0x12E56C

	.global Tsa_EfxFireBG_0812E614
Tsa_EfxFireBG_0812E614:	@ 0x0812E614
	.incbin "fe6-base.gba", 0x12E614, 0x12E6CC - 0x12E614

	.global Tsa_EfxFireBG_0812E6CC
Tsa_EfxFireBG_0812E6CC:	@ 0x0812E6CC
	.incbin "fe6-base.gba", 0x12E6CC, 0x12E794 - 0x12E6CC

	.global Tsa_EfxFireBG_0812E794
Tsa_EfxFireBG_0812E794:	@ 0x0812E794
	.incbin "fe6-base.gba", 0x12E794, 0x12E864 - 0x12E794

	.global Tsa_EfxFireBG_0812E864
Tsa_EfxFireBG_0812E864:	@ 0x0812E864
	.incbin "fe6-base.gba", 0x12E864, 0x12E964 - 0x12E864

	.global Tsa_EfxFireBG_0812E964
Tsa_EfxFireBG_0812E964:	@ 0x0812E964
	.incbin "fe6-base.gba", 0x12E964, 0x12EA6C - 0x12E964

	.global Tsa_EfxFireBG_0812EA6C
Tsa_EfxFireBG_0812EA6C:	@ 0x0812EA6C
	.incbin "fe6-base.gba", 0x12EA6C, 0x12EB80 - 0x12EA6C

	.global Tsa_EfxFireBG_0812EB80
Tsa_EfxFireBG_0812EB80:	@ 0x0812EB80
	.incbin "fe6-base.gba", 0x12EB80, 0x12ECB8 - 0x12EB80

	.global Tsa_EfxFireBG_0812ECB8
Tsa_EfxFireBG_0812ECB8:	@ 0x0812ECB8
	.incbin "fe6-base.gba", 0x12ECB8, 0x12EDBC - 0x12ECB8

	.global Tsa_EfxFireBG_0812EDBC
Tsa_EfxFireBG_0812EDBC:	@ 0x0812EDBC
	.incbin "fe6-base.gba", 0x12EDBC, 0x12EE90 - 0x12EDBC

	.global Tsa_EfxFireBG_0812EE90
Tsa_EfxFireBG_0812EE90:	@ 0x0812EE90
	.incbin "fe6-base.gba", 0x12EE90, 0x12EF50 - 0x12EE90

	.global Tsa_EfxFireBG_0812EF50
Tsa_EfxFireBG_0812EF50:	@ 0x0812EF50
	.incbin "fe6-base.gba", 0x12EF50, 0x12EFF8 - 0x12EF50

	.global Tsa_EfxFireBG_0812EFF8
Tsa_EfxFireBG_0812EFF8:	@ 0x0812EFF8
	.incbin "fe6-base.gba", 0x12EFF8, 0x12F0A0 - 0x12EFF8

	.global Tsa_EfxFireBG_0812F0A0
Tsa_EfxFireBG_0812F0A0:	@ 0x0812F0A0
	.incbin "fe6-base.gba", 0x12F0A0, 0x12F158 - 0x12F0A0

	.global Tsa_EfxFireBG_0812F158
Tsa_EfxFireBG_0812F158:	@ 0x0812F158
	.incbin "fe6-base.gba", 0x12F158, 0x12F220 - 0x12F158

	.global Tsa_EfxFireBG_0812F220
Tsa_EfxFireBG_0812F220:	@ 0x0812F220
	.incbin "fe6-base.gba", 0x12F220, 0x12F2F0 - 0x12F220

	.global Tsa_EfxFireBG_0812F2F0
Tsa_EfxFireBG_0812F2F0:	@ 0x0812F2F0
	.incbin "fe6-base.gba", 0x12F2F0, 0x12F3F0 - 0x12F2F0

	.global Tsa_EfxFireBG_0812F3F0
Tsa_EfxFireBG_0812F3F0:	@ 0x0812F3F0
	.incbin "fe6-base.gba", 0x12F3F0, 0x12F4F8 - 0x12F3F0

	.global Tsa_EfxFireBG_0812F4F8
Tsa_EfxFireBG_0812F4F8:	@ 0x0812F4F8
	.incbin "fe6-base.gba", 0x12F4F8, 0x12F60C - 0x12F4F8

	.global Tsa_EfxFireBG_0812F60C
Tsa_EfxFireBG_0812F60C:	@ 0x0812F60C
	.incbin "fe6-base.gba", 0x12F60C, 0x12F744 - 0x12F60C

	.global Tsa_EfxFireBG_0812F744
Tsa_EfxFireBG_0812F744:	@ 0x0812F744
	.incbin "fe6-base.gba", 0x12F744, 0x12F848 - 0x12F744

	.global Tsa_EfxFireBG_0812F848
Tsa_EfxFireBG_0812F848:	@ 0x0812F848
	.incbin "fe6-base.gba", 0x12F848, 0x12F91C - 0x12F848

	.global Tsa_EfxFireBG_0812F91C
Tsa_EfxFireBG_0812F91C:	@ 0x0812F91C
	.incbin "fe6-base.gba", 0x12F91C, 0x12F9DC - 0x12F91C

	.global Img_EfxFireOBJ
Img_EfxFireOBJ: @ 0812F9DC
	.incbin "fe6-base.gba", 0x12F9DC, (0x12FFD8 - 0x12F9DC) @ length: 05FC

	.global Pal_EfxFireOBJ
Pal_EfxFireOBJ: @ 0812FFD8
	.incbin "fe6-base.gba", 0x12FFD8, (0x12FFF8 - 0x12FFD8) @ length: 8C18

	.global Img_EfxFireHITBG_0812FFF8
Img_EfxFireHITBG_0812FFF8:	@ 0x0812FFF8
	.incbin "fe6-base.gba", 0x12FFF8, 0x130D34 - 0x12FFF8

	.global Img_EfxFireHITBG_08130D34
Img_EfxFireHITBG_08130D34:	@ 0x08130D34
	.incbin "fe6-base.gba", 0x130D34, 0x131A10 - 0x130D34

	.global Img_EfxFireHITBG_08131A10
Img_EfxFireHITBG_08131A10:	@ 0x08131A10
	.incbin "fe6-base.gba", 0x131A10, 0x132838 - 0x131A10

	.global Img_EfxFireHITBG_08132838
Img_EfxFireHITBG_08132838:	@ 0x08132838
	.incbin "fe6-base.gba", 0x132838, 0x13382C - 0x132838

	.global Img_EfxFireHITBG_0813382C
Img_EfxFireHITBG_0813382C:	@ 0x0813382C
	.incbin "fe6-base.gba", 0x13382C, 0x134AC8 - 0x13382C

	.global Img_EfxFireHITBG_08134AC8
Img_EfxFireHITBG_08134AC8:	@ 0x08134AC8
	.incbin "fe6-base.gba", 0x134AC8, 0x135694 - 0x134AC8

	.global Img_EfxFireHITBG_08135694
Img_EfxFireHITBG_08135694:	@ 0x08135694
	.incbin "fe6-base.gba", 0x135694, 0x13628C - 0x135694

	.global Img_EfxFireHITBG_0813628C
Img_EfxFireHITBG_0813628C:	@ 0x0813628C
	.incbin "fe6-base.gba", 0x13628C, 0x136DE4 - 0x13628C

	.global Img_EfxFireHITBG_08136DE4
Img_EfxFireHITBG_08136DE4:	@ 0x08136DE4
	.incbin "fe6-base.gba", 0x136DE4, 0x1378E0 - 0x136DE4

	.global Img_EfxFireHITBG_081378E0
Img_EfxFireHITBG_081378E0:	@ 0x081378E0
	.incbin "fe6-base.gba", 0x1378E0, 0x1382E8 - 0x1378E0

	.global Img_EfxFireHITBG_081382E8
Img_EfxFireHITBG_081382E8:	@ 0x081382E8
	.incbin "fe6-base.gba", 0x1382E8, 0x138BF0 - 0x1382E8

	.global Pal_EfxFireHITBG
Pal_EfxFireHITBG: @ 08138BF0
	.incbin "fe6-base.gba", 0x138BF0, (0x138C10 - 0x138BF0) @ length: 1B08

	.global Tsa_EfxFireHITBG_08138C10
Tsa_EfxFireHITBG_08138C10:	@ 0x08138C10
	.incbin "fe6-base.gba", 0x138C10, 0x138CBC - 0x138C10

	.global Tsa_EfxFireHITBG_08138CBC
Tsa_EfxFireHITBG_08138CBC:	@ 0x08138CBC
	.incbin "fe6-base.gba", 0x138CBC, 0x138D74 - 0x138CBC

	.global Tsa_EfxFireHITBG_08138D74
Tsa_EfxFireHITBG_08138D74:	@ 0x08138D74
	.incbin "fe6-base.gba", 0x138D74, 0x138E40 - 0x138D74

	.global Tsa_EfxFireHITBG_08138E40
Tsa_EfxFireHITBG_08138E40:	@ 0x08138E40
	.incbin "fe6-base.gba", 0x138E40, 0x138F20 - 0x138E40

	.global Tsa_EfxFireHITBG_08138F20
Tsa_EfxFireHITBG_08138F20:	@ 0x08138F20
	.incbin "fe6-base.gba", 0x138F20, 0x139014 - 0x138F20

	.global Tsa_EfxFireHITBG_08139014
Tsa_EfxFireHITBG_08139014:	@ 0x08139014
	.incbin "fe6-base.gba", 0x139014, 0x13912C - 0x139014

	.global Tsa_EfxFireHITBG_0813912C
Tsa_EfxFireHITBG_0813912C:	@ 0x0813912C
	.incbin "fe6-base.gba", 0x13912C, 0x139258 - 0x13912C

	.global Tsa_EfxFireHITBG_08139258
Tsa_EfxFireHITBG_08139258:	@ 0x08139258
	.incbin "fe6-base.gba", 0x139258, 0x139390 - 0x139258

	.global Tsa_EfxFireHITBG_08139390
Tsa_EfxFireHITBG_08139390:	@ 0x08139390
	.incbin "fe6-base.gba", 0x139390, 0x1394D4 - 0x139390

	.global Tsa_EfxFireHITBG_081394D4
Tsa_EfxFireHITBG_081394D4:	@ 0x081394D4
	.incbin "fe6-base.gba", 0x1394D4, 0x139628 - 0x1394D4

	.global Tsa_EfxFireHITBG_08139628
Tsa_EfxFireHITBG_08139628:	@ 0x08139628
	.incbin "fe6-base.gba", 0x139628, 0x139780 - 0x139628

	.global Tsa_EfxFireHITBG_08139780
Tsa_EfxFireHITBG_08139780:	@ 0x08139780
	.incbin "fe6-base.gba", 0x139780, 0x1398E8 - 0x139780

	.global Tsa_EfxFireHITBG_081398E8
Tsa_EfxFireHITBG_081398E8:	@ 0x081398E8
	.incbin "fe6-base.gba", 0x1398E8, 0x139A54 - 0x1398E8

	.global Tsa_EfxFireHITBG_08139A54
Tsa_EfxFireHITBG_08139A54:	@ 0x08139A54
	.incbin "fe6-base.gba", 0x139A54, 0x139BD0 - 0x139A54

	.global Tsa_EfxFireHITBG_08139BD0
Tsa_EfxFireHITBG_08139BD0:	@ 0x08139BD0
	.incbin "fe6-base.gba", 0x139BD0, 0x139D64 - 0x139BD0

	.global Tsa_EfxFireHITBG_08139D64
Tsa_EfxFireHITBG_08139D64:	@ 0x08139D64
	.incbin "fe6-base.gba", 0x139D64, 0x139F04 - 0x139D64

	.global Tsa_EfxFireHITBG_08139F04
Tsa_EfxFireHITBG_08139F04:	@ 0x08139F04
	.incbin "fe6-base.gba", 0x139F04, 0x13A0A4 - 0x139F04

	.global Tsa_EfxFireHITBG_0813A0A4
Tsa_EfxFireHITBG_0813A0A4:	@ 0x0813A0A4
	.incbin "fe6-base.gba", 0x13A0A4, 0x13A244 - 0x13A0A4

	.global Tsa_EfxFireHITBG_0813A244
Tsa_EfxFireHITBG_0813A244:	@ 0x0813A244
	.incbin "fe6-base.gba", 0x13A244, 0x13A3E4 - 0x13A244

	.global Tsa_EfxFireHITBG_0813A3E4
Tsa_EfxFireHITBG_0813A3E4:	@ 0x0813A3E4
	.incbin "fe6-base.gba", 0x13A3E4, 0x13A574 - 0x13A3E4

	.global Tsa_EfxFireHITBG_0813A574
Tsa_EfxFireHITBG_0813A574:	@ 0x0813A574
	.incbin "fe6-base.gba", 0x13A574, 0x13A6F8 - 0x13A574

	.global Img_EfxElfireBG
Img_EfxElfireBG: @ 0813A6F8
	.incbin "fe6-base.gba", 0x13A6F8, (0x13B6B4 - 0x13A6F8) @ length: 0FBC

	.global Pal_EfxElfireBGCOL
Pal_EfxElfireBGCOL: @ 0813B6B4
	.incbin "fe6-base.gba", 0x13B6B4, (0x13B8B4 - 0x13B6B4) @ length: 0200

	.global Tsa_EfxElfireBG
Tsa_EfxElfireBG: @ 0813B8B4
	.incbin "fe6-base.gba", 0x13B8B4, (0x13BA64 - 0x13B8B4) @ length: 01B0

	.global Tsa_FireBreathBg
Tsa_FireBreathBg: @ 0813BA64
	.incbin "fe6-base.gba", 0x13BA64, (0x13BAFC - 0x13BA64) @ length: 0098

	.global Img_EfxElfireOBJ
Img_EfxElfireOBJ: @ 0813BAFC
	.incbin "fe6-base.gba", 0x13BAFC, (0x13BD74 - 0x13BAFC) @ length: 0278

	.global Pal_EfxElfireOBJ
Pal_EfxElfireOBJ: @ 0813BD74
	.incbin "fe6-base.gba", 0x13BD74, 0x20

	.global Img_EfxThunderstormBG_0813BD94
Img_EfxThunderstormBG_0813BD94:	@ 0x13BD94
	.incbin "fe6-base.gba", 0x13BD94, 0x13C964 - 0x13BD94

	.global Img_EfxThunderstormBG_0813C964
Img_EfxThunderstormBG_0813C964:	@ 0x13C964
	.incbin "fe6-base.gba", 0x13C964, 0x13D9D0 - 0x13C964

	.global Img_EfxThunderstormBG_0813D9D0
Img_EfxThunderstormBG_0813D9D0:	@ 0x13D9D0
	.incbin "fe6-base.gba", 0x13D9D0, 0x13E75C - 0x13D9D0

	.global Pal_EfxThunderstormBG
Pal_EfxThunderstormBG: @ 0813E75C
	.incbin "fe6-base.gba", 0x13E75C, 0x60

	.global Tsa_EfxThunderstormBG_0813E7BC
Tsa_EfxThunderstormBG_0813E7BC:	@ 0x13E7BC
	.incbin "fe6-base.gba", 0x13E7BC, 0x13E950 - 0x13E7BC

	.global Tsa_EfxThunderstormBG_0813E950
Tsa_EfxThunderstormBG_0813E950:	@ 0x13E950
	.incbin "fe6-base.gba", 0x13E950, 0x13EB58 - 0x13E950

	.global Tsa_EfxThunderstormBG_0813EB58
Tsa_EfxThunderstormBG_0813EB58:	@ 0x13EB58
	.incbin "fe6-base.gba", 0x13EB58, 0x13ECBC - 0x13EB58

	.global Tsa_EfxThunderstormBG_0813ECBC
Tsa_EfxThunderstormBG_0813ECBC:	@ 0x13ECBC
	.incbin "fe6-base.gba", 0x13ECBC, 0x13ED9C - 0x13ECBC

	.global Tsa_EfxThunderstormBG_0813ED9C
Tsa_EfxThunderstormBG_0813ED9C:	@ 0x13ED9C
	.incbin "fe6-base.gba", 0x13ED9C, 0x13EEB4 - 0x13ED9C

	.global Tsa_EfxThunderstormBG_0813EEB4
Tsa_EfxThunderstormBG_0813EEB4:	@ 0x13EEB4
	.incbin "fe6-base.gba", 0x13EEB4, 0x13F060 - 0x13EEB4

	.global Tsa_EfxThunderstormBG_0813F060
Tsa_EfxThunderstormBG_0813F060:	@ 0x13F060
	.incbin "fe6-base.gba", 0x13F060, 0x13F180 - 0x13F060

	.global Tsa_EfxThunderstormBG_0813F180
Tsa_EfxThunderstormBG_0813F180:	@ 0x13F180
	.incbin "fe6-base.gba", 0x13F180, 0x13F26C - 0x13F180

	.global Tsa_EfxThunderstormBG_0813F26C
Tsa_EfxThunderstormBG_0813F26C:	@ 0x13F26C
	.incbin "fe6-base.gba", 0x13F26C, 0x13F354 - 0x13F26C

	.global Tsa_EfxThunderstormBG_0813F354
Tsa_EfxThunderstormBG_0813F354:	@ 0x13F354
	.incbin "fe6-base.gba", 0x13F354, 0x13F3EC - 0x13F354

	.global Tsa_EfxThunderstormBG_0813F3EC
Tsa_EfxThunderstormBG_0813F3EC:	@ 0x13F3EC
	.incbin "fe6-base.gba", 0x13F3EC, 0x13F5E0 - 0x13F3EC

	.global Img_EfxForblazeBG1_0813F5E0
Img_EfxForblazeBG1_0813F5E0:	@ 0x13F5E0
	.incbin "fe6-base.gba", 0x13F5E0, 0x13FF7C - 0x13F5E0

	.global Img_EfxForblazeBG1_0813FF7C
Img_EfxForblazeBG1_0813FF7C:	@ 0x13FF7C
	.incbin "fe6-base.gba", 0x13FF7C, 0x1408CC - 0x13FF7C

	.global Pal_EfxForblazeBG1
Pal_EfxForblazeBG1: @ 081408CC
	.incbin "fe6-base.gba", 0x1408CC, (0x14092C - 0x1408CC) @ length: 0A54

	.global Tsa_EfxForblazeBG1_0814092C
Tsa_EfxForblazeBG1_0814092C:	@ 0x14092C
	.incbin "fe6-base.gba", 0x14092C, 0x1409DC - 0x14092C

	.global Tsa_EfxForblazeBG1_081409DC
Tsa_EfxForblazeBG1_081409DC:	@ 0x1409DC
	.incbin "fe6-base.gba", 0x1409DC, 0x140A98 - 0x1409DC

	.global Tsa_EfxForblazeBG1_08140A98
Tsa_EfxForblazeBG1_08140A98:	@ 0x140A98
	.incbin "fe6-base.gba", 0x140A98, 0x140B60 - 0x140A98

	.global Tsa_EfxForblazeBG1_08140B60
Tsa_EfxForblazeBG1_08140B60:	@ 0x140B60
	.incbin "fe6-base.gba", 0x140B60, 0x140C30 - 0x140B60

	.global Tsa_EfxForblazeBG1_08140C30
Tsa_EfxForblazeBG1_08140C30:	@ 0x140C30
	.incbin "fe6-base.gba", 0x140C30, 0x140D00 - 0x140C30

	.global Tsa_EfxForblazeBG1_08140D00
Tsa_EfxForblazeBG1_08140D00:	@ 0x140D00
	.incbin "fe6-base.gba", 0x140D00, 0x140DCC - 0x140D00

	.global Tsa_EfxForblazeBG1_08140DCC
Tsa_EfxForblazeBG1_08140DCC:	@ 0x140DCC
	.incbin "fe6-base.gba", 0x140DCC, 0x140E98 - 0x140DCC

	.global Tsa_EfxForblazeBG1_08140E98
Tsa_EfxForblazeBG1_08140E98:	@ 0x140E98
	.incbin "fe6-base.gba", 0x140E98, 0x140F7C - 0x140E98

	.global Tsa_EfxForblazeBG1_08140F7C
Tsa_EfxForblazeBG1_08140F7C:	@ 0x140F7C
	.incbin "fe6-base.gba", 0x140F7C, 0x141050 - 0x140F7C

	.global Tsa_EfxForblazeBG1_08141050
Tsa_EfxForblazeBG1_08141050:	@ 0x141050
	.incbin "fe6-base.gba", 0x141050, 0x141114 - 0x141050

	.global Tsa_EfxForblazeBG1_08141114
Tsa_EfxForblazeBG1_08141114:	@ 0x141114
	.incbin "fe6-base.gba", 0x141114, 0x1411D4 - 0x141114

	.global Tsa_EfxForblazeBG1_081411D4
Tsa_EfxForblazeBG1_081411D4:	@ 0x1411D4
	.incbin "fe6-base.gba", 0x1411D4, 0x141288 - 0x1411D4

	.global Tsa_EfxForblazeBG1_08141288
Tsa_EfxForblazeBG1_08141288:	@ 0x141288
	.incbin "fe6-base.gba", 0x141288, 0x141320 - 0x141288

	.global Img1_EfxForblazeBG2
Img1_EfxForblazeBG2: @ 08141320
	.incbin "fe6-base.gba", 0x141320, (0x142EAC - 0x141320) @ length: 1B8C

	.global Img2_EfxForblazeBG2
Img2_EfxForblazeBG2: @ 08142EAC
	.incbin "fe6-base.gba", 0x142EAC, (0x143A38 - 0x142EAC) @ length: 0B8C

	.global Pal1_EfxForblazeBG2
Pal1_EfxForblazeBG2: @ 08143A38
	.incbin "fe6-base.gba", 0x143A38, (0x143A58 - 0x143A38) @ length: 0020

	.global Pal2_EfxForblazeBG2
Pal2_EfxForblazeBG2: @ 08143A58
	.incbin "fe6-base.gba", 0x143A58, (0x143A78 - 0x143A58) @ length: 0020

	.global Pal3_EfxForblazeBG2
Pal3_EfxForblazeBG2: @ 08143A78
	.incbin "fe6-base.gba", 0x143A78, (0x143A98 - 0x143A78) @ length: 0020

	.global Pal4_EfxForblazeBG2
Pal4_EfxForblazeBG2: @ 08143A98
	.incbin "fe6-base.gba", 0x143A98, (0x143AB8 - 0x143A98) @ length: 0020

	.global Tsa1_EfxForblazeBG2
Tsa1_EfxForblazeBG2: @ 08143AB8
	.incbin "fe6-base.gba", 0x143AB8, (0x143DA8 - 0x143AB8) @ length: 02F0

	.global Tsa2_EfxForblazeBG2
Tsa2_EfxForblazeBG2: @ 08143DA8
	.incbin "fe6-base.gba", 0x143DA8, (0x143EE4 - 0x143DA8) @ length: 013C

	.global Img_EfxForblazeOBJ
Img_EfxForblazeOBJ: @ 08143EE4
	.incbin "fe6-base.gba", 0x143EE4, (0x144A00 - 0x143EE4) @ length: 0B1C

	.global Pal_EfxForblazeOBJ
Pal_EfxForblazeOBJ: @ 08144A00
	.incbin "fe6-base.gba", 0x144A00, 0x20

	.global Img_EfxFimbulvetrBG_08144A20
Img_EfxFimbulvetrBG_08144A20:	@ 0x144A20
	.incbin "fe6-base.gba", 0x144A20, 0x145CF0 - 0x144A20

	.global Img_EfxFimbulvetrBG_08145CF0
Img_EfxFimbulvetrBG_08145CF0:	@ 0x145CF0
	.incbin "fe6-base.gba", 0x145CF0, 0x1475A0 - 0x145CF0

	.global Img_EfxFimbulvetrBG_081475A0
Img_EfxFimbulvetrBG_081475A0:	@ 0x1475A0
	.incbin "fe6-base.gba", 0x1475A0, 0x1489E4 - 0x1475A0

	.global Img_EfxFimbulvetrBG_081489E4
Img_EfxFimbulvetrBG_081489E4:	@ 0x1489E4
	.incbin "fe6-base.gba", 0x1489E4, 0x14A498 - 0x1489E4

	.global Pal_EfxFimbulvetrBG
Pal_EfxFimbulvetrBG: @ 0814A498
	.incbin "fe6-base.gba", 0x14A498, (0x14A4B8 - 0x14A498) @ length: 7D28

	.global Tsa_EfxFimbulvetrBG_0814A4B8
Tsa_EfxFimbulvetrBG_0814A4B8:	@ 0x14A4B8
	.incbin "fe6-base.gba", 0x14A4B8, 0x14A55C - 0x14A4B8

	.global Tsa_EfxFimbulvetrBG_0814A55C
Tsa_EfxFimbulvetrBG_0814A55C:	@ 0x14A55C
	.incbin "fe6-base.gba", 0x14A55C, 0x14A604 - 0x14A55C

	.global Tsa_EfxFimbulvetrBG_0814A604
Tsa_EfxFimbulvetrBG_0814A604:	@ 0x14A604
	.incbin "fe6-base.gba", 0x14A604, 0x14A6C0 - 0x14A604

	.global Tsa_EfxFimbulvetrBG_0814A6C0
Tsa_EfxFimbulvetrBG_0814A6C0:	@ 0x14A6C0
	.incbin "fe6-base.gba", 0x14A6C0, 0x14A794 - 0x14A6C0

	.global Tsa_EfxFimbulvetrBG_0814A794
Tsa_EfxFimbulvetrBG_0814A794:	@ 0x14A794
	.incbin "fe6-base.gba", 0x14A794, 0x14A890 - 0x14A794

	.global Tsa_EfxFimbulvetrBG_0814A890
Tsa_EfxFimbulvetrBG_0814A890:	@ 0x14A890
	.incbin "fe6-base.gba", 0x14A890, 0x14A9D0 - 0x14A890

	.global Tsa_EfxFimbulvetrBG_0814A9D0
Tsa_EfxFimbulvetrBG_0814A9D0:	@ 0x14A9D0
	.incbin "fe6-base.gba", 0x14A9D0, 0x14AB68 - 0x14A9D0

	.global Tsa_EfxFimbulvetrBG_0814AB68
Tsa_EfxFimbulvetrBG_0814AB68:	@ 0x14AB68
	.incbin "fe6-base.gba", 0x14AB68, 0x14AD3C - 0x14AB68

	.global Tsa_EfxFimbulvetrBG_0814AD3C
Tsa_EfxFimbulvetrBG_0814AD3C:	@ 0x14AD3C
	.incbin "fe6-base.gba", 0x14AD3C, 0x14AF4C - 0x14AD3C

	.global Tsa_EfxFimbulvetrBG_0814AF4C
Tsa_EfxFimbulvetrBG_0814AF4C:	@ 0x14AF4C
	.incbin "fe6-base.gba", 0x14AF4C, 0x14B16C - 0x14AF4C

	.global Tsa_EfxFimbulvetrBG_0814B16C
Tsa_EfxFimbulvetrBG_0814B16C:	@ 0x14B16C
	.incbin "fe6-base.gba", 0x14B16C, 0x14B39C - 0x14B16C

	.global Img_EfxFimbulvetrBGTR_0814B39C
Img_EfxFimbulvetrBGTR_0814B39C:	@ 0x14B39C
	.incbin "fe6-base.gba", 0x14B39C, 0x14C5A4 - 0x14B39C

	.global Img_EfxFimbulvetrBGTR_0814C5A4
Img_EfxFimbulvetrBGTR_0814C5A4:	@ 0x14C5A4
	.incbin "fe6-base.gba", 0x14C5A4, 0x14D700 - 0x14C5A4

	.global Img_EfxFimbulvetrBGTR_0814D700
Img_EfxFimbulvetrBGTR_0814D700:	@ 0x14D700
	.incbin "fe6-base.gba", 0x14D700, 0x14E784 - 0x14D700

	.global Img_EfxFimbulvetrBGTR_0814E784
Img_EfxFimbulvetrBGTR_0814E784:	@ 0x14E784
	.incbin "fe6-base.gba", 0x14E784, 0x14FBC4 - 0x14E784

	.global Img_EfxFimbulvetrBGTR_0814FBC4
Img_EfxFimbulvetrBGTR_0814FBC4:	@ 0x14FBC4
	.incbin "fe6-base.gba", 0x14FBC4, 0x150F7C - 0x14FBC4

	.global Img_EfxFimbulvetrBGTR_08150F7C
Img_EfxFimbulvetrBGTR_08150F7C:	@ 0x150F7C
	.incbin "fe6-base.gba", 0x150F7C, 0x1521C0 - 0x150F7C

	.global Pal_EfxFimbulvetrBGTR
Pal_EfxFimbulvetrBGTR: @ 081521C0
	.incbin "fe6-base.gba", 0x1521C0, (0x1521E0 - 0x1521C0) @ length: 0CB8

	.global Tsa_EfxFimbulvetrBGTR_081521E0
Tsa_EfxFimbulvetrBGTR_081521E0:	@ 0x081521E0
	.incbin "fe6-base.gba", 0x1521E0, 0x1523CC - 0x1521E0

	.global Tsa_EfxFimbulvetrBGTR_081523CC
Tsa_EfxFimbulvetrBGTR_081523CC:	@ 0x081523CC
	.incbin "fe6-base.gba", 0x1523CC, 0x1525A4 - 0x1523CC

	.global Tsa_EfxFimbulvetrBGTR_081525A4
Tsa_EfxFimbulvetrBGTR_081525A4:	@ 0x081525A4
	.incbin "fe6-base.gba", 0x1525A4, 0x15276C - 0x1525A4

	.global Tsa_EfxFimbulvetrBGTR_0815276C
Tsa_EfxFimbulvetrBGTR_0815276C:	@ 0x0815276C
	.incbin "fe6-base.gba", 0x15276C, 0x1529A0 - 0x15276C

	.global Tsa_EfxFimbulvetrBGTR_081529A0
Tsa_EfxFimbulvetrBGTR_081529A0:	@ 0x081529A0
	.incbin "fe6-base.gba", 0x1529A0, 0x152BE8 - 0x1529A0

	.global Tsa_EfxFimbulvetrBGTR_08152BE8
Tsa_EfxFimbulvetrBGTR_08152BE8:	@ 0x08152BE8
	.incbin "fe6-base.gba", 0x152BE8, 0x152E78 - 0x152BE8

	.global Img_EfxFimbulvetrOBJ
Img_EfxFimbulvetrOBJ: @ 08152E78
	.incbin "fe6-base.gba", 0x152E78, (0x1531C8 - 0x152E78) @ length: 6F20

	.global Img_EfxLightningBG_081531C8
Img_EfxLightningBG_081531C8:	@ 0x1531C8
	.incbin "fe6-base.gba", 0x1531C8, 0x153A90 - 0x1531C8

	.global Img_EfxLightningBG_08153A90
Img_EfxLightningBG_08153A90:	@ 0x153A90
	.incbin "fe6-base.gba", 0x153A90, 0x1541E0 - 0x153A90

	.global Img_EfxLightningBG_081541E0
Img_EfxLightningBG_081541E0:	@ 0x1541E0
	.incbin "fe6-base.gba", 0x1541E0, 0x154BA4 - 0x1541E0

	.global Img_EfxLightningBG_08154BA4
Img_EfxLightningBG_08154BA4:	@ 0x154BA4
	.incbin "fe6-base.gba", 0x154BA4, 0x1556F8 - 0x154BA4

	.global Img_EfxLightningBG_081556F8
Img_EfxLightningBG_081556F8:	@ 0x1556F8
	.incbin "fe6-base.gba", 0x1556F8, 0x156200 - 0x1556F8

	.global Img_EfxLightningBG_08156200
Img_EfxLightningBG_08156200:	@ 0x156200
	.incbin "fe6-base.gba", 0x156200, 0x156518 - 0x156200

	.global Img_EfxLightningBG_08156518
Img_EfxLightningBG_08156518:	@ 0x156518
	.incbin "fe6-base.gba", 0x156518, 0x1571C8 - 0x156518

	.global Img_EfxLightningBG_081571C8
Img_EfxLightningBG_081571C8:	@ 0x1571C8
	.incbin "fe6-base.gba", 0x1571C8, 0x157BE8 - 0x1571C8

	.global Pal_EfxLightningBG_08157BE8
Pal_EfxLightningBG_08157BE8:	@ 0x157BE8
	.incbin "fe6-base.gba", 0x157BE8, 0x157C08 - 0x157BE8

	.global Pal_EfxLightningBG_08157C08
Pal_EfxLightningBG_08157C08:	@ 0x157C08
	.incbin "fe6-base.gba", 0x157C08, 0x20

	.global Tsa_EfxLightningBG_08157C28
Tsa_EfxLightningBG_08157C28:	@ 0x157C28
	.incbin "fe6-base.gba", 0x157C28, 0x157D4C - 0x157C28

	.global Tsa_EfxLightningBG_08157D4C
Tsa_EfxLightningBG_08157D4C:	@ 0x157D4C
	.incbin "fe6-base.gba", 0x157D4C, 0x157E6C - 0x157D4C

	.global Tsa_EfxLightningBG_08157E6C
Tsa_EfxLightningBG_08157E6C:	@ 0x157E6C
	.incbin "fe6-base.gba", 0x157E6C, 0x157F78 - 0x157E6C

	.global Tsa_EfxLightningBG_08157F78
Tsa_EfxLightningBG_08157F78:	@ 0x157F78
	.incbin "fe6-base.gba", 0x157F78, 0x158074 - 0x157F78

	.global Tsa_EfxLightningBG_08158074
Tsa_EfxLightningBG_08158074:	@ 0x158074
	.incbin "fe6-base.gba", 0x158074, 0x15815C - 0x158074

	.global Tsa_EfxLightningBG_0815815C
Tsa_EfxLightningBG_0815815C:	@ 0x15815C
	.incbin "fe6-base.gba", 0x15815C, 0x158244 - 0x15815C

	.global Tsa_EfxLightningBG_08158244
Tsa_EfxLightningBG_08158244:	@ 0x158244
	.incbin "fe6-base.gba", 0x158244, 0x158328 - 0x158244

	.global Tsa_EfxLightningBG_08158328
Tsa_EfxLightningBG_08158328:	@ 0x158328
	.incbin "fe6-base.gba", 0x158328, 0x158404 - 0x158328

	.global Tsa_EfxLightningBG_08158404
Tsa_EfxLightningBG_08158404:	@ 0x158404
	.incbin "fe6-base.gba", 0x158404, 0x1584E4 - 0x158404

	.global Tsa_EfxLightningBG_081584E4
Tsa_EfxLightningBG_081584E4:	@ 0x1584E4
	.incbin "fe6-base.gba", 0x1584E4, 0x1585D8 - 0x1584E4

	.global Tsa_EfxLightningBG_081585D8
Tsa_EfxLightningBG_081585D8:	@ 0x1585D8
	.incbin "fe6-base.gba", 0x1585D8, 0x1586CC - 0x1585D8

	.global Tsa_EfxLightningBG_081586CC
Tsa_EfxLightningBG_081586CC:	@ 0x1586CC
	.incbin "fe6-base.gba", 0x1586CC, 0x1587D0 - 0x1586CC

	.global Tsa_EfxLightningBG_081587D0
Tsa_EfxLightningBG_081587D0:	@ 0x1587D0
	.incbin "fe6-base.gba", 0x1587D0, 0x1588D8 - 0x1587D0

	.global Tsa_EfxLightningBG_081588D8
Tsa_EfxLightningBG_081588D8:	@ 0x1588D8
	.incbin "fe6-base.gba", 0x1588D8, 0x1589F0 - 0x1588D8

	.global Tsa_EfxLightningBG_081589F0
Tsa_EfxLightningBG_081589F0:	@ 0x1589F0
	.incbin "fe6-base.gba", 0x1589F0, 0x158B14 - 0x1589F0

	.global Tsa_EfxLightningBG_08158B14
Tsa_EfxLightningBG_08158B14:	@ 0x158B14
	.incbin "fe6-base.gba", 0x158B14, 0x158C28 - 0x158B14

	.global Tsa_EfxLightningBG_08158C28
Tsa_EfxLightningBG_08158C28:	@ 0x158C28
	.incbin "fe6-base.gba", 0x158C28, 0x158CD8 - 0x158C28

	.global Tsa_EfxLightningBG_08158CD8
Tsa_EfxLightningBG_08158CD8:	@ 0x158CD8
	.incbin "fe6-base.gba", 0x158CD8, 0x158DE0 - 0x158CD8

	.global Tsa_EfxLightningBG_08158DE0
Tsa_EfxLightningBG_08158DE0:	@ 0x158DE0
	.incbin "fe6-base.gba", 0x158DE0, 0x158F1C - 0x158DE0

	.global Tsa_EfxLightningBG_08158F1C
Tsa_EfxLightningBG_08158F1C:	@ 0x158F1C
	.incbin "fe6-base.gba", 0x158F1C, 0x159090 - 0x158F1C

	.global Tsa_EfxLightningBG_08159090
Tsa_EfxLightningBG_08159090:	@ 0x159090
	.incbin "fe6-base.gba", 0x159090, 0x159228 - 0x159090

	.global Tsa_EfxLightningBG_08159228
Tsa_EfxLightningBG_08159228:	@ 0x159228
	.incbin "fe6-base.gba", 0x159228, 0x15939C - 0x159228

	.global Tsa_EfxLightningBG_0815939C
Tsa_EfxLightningBG_0815939C:	@ 0x15939C
	.incbin "fe6-base.gba", 0x15939C, 0x1594A8 - 0x15939C

	.global Tsa_EfxLightningBG_081594A8
Tsa_EfxLightningBG_081594A8:	@ 0x1594A8
	.incbin "fe6-base.gba", 0x1594A8, 0x15957C - 0x1594A8

	.global Tsa_EfxLightningBG_0815957C
Tsa_EfxLightningBG_0815957C:	@ 0x15957C
	.incbin "fe6-base.gba", 0x15957C, 0x15961C - 0x15957C

	.global Tsa_EfxLightningBG_0815961C
Tsa_EfxLightningBG_0815961C:	@ 0x15961C
	.incbin "fe6-base.gba", 0x15961C, 0x15973C - 0x15961C

	.global Tsa_EfxLightningBG_0815973C
Tsa_EfxLightningBG_0815973C:	@ 0x15973C
	.incbin "fe6-base.gba", 0x15973C, 0x159858 - 0x15973C

	.global Tsa_EfxLightningBG_08159858
Tsa_EfxLightningBG_08159858:	@ 0x159858
	.incbin "fe6-base.gba", 0x159858, 0x15996C - 0x159858

	.global Tsa_EfxLightningBG_0815996C
Tsa_EfxLightningBG_0815996C:	@ 0x15996C
	.incbin "fe6-base.gba", 0x15996C, 0x159A64 - 0x15996C

	.global Tsa_EfxLightningBG_08159A64
Tsa_EfxLightningBG_08159A64:	@ 0x159A64
	.incbin "fe6-base.gba", 0x159A64, 0x159B4C - 0x159A64

	.global Tsa_EfxLightningBG_08159B4C
Tsa_EfxLightningBG_08159B4C:	@ 0x159B4C
	.incbin "fe6-base.gba", 0x159B4C, 0x159C1C - 0x159B4C

	.global Tsa_EfxLightningBG_08159C1C
Tsa_EfxLightningBG_08159C1C:	@ 0x159C1C
	.incbin "fe6-base.gba", 0x159C1C, 0x159CE0 - 0x159C1C

	.global Tsa_EfxLightningBG_08159CE0
Tsa_EfxLightningBG_08159CE0:	@ 0x159CE0
	.incbin "fe6-base.gba", 0x159CE0, 0x159D98 - 0x159CE0

	.global Img_EfxAlacaliburBG
Img_EfxAlacaliburBG: @ 08159D98
	.incbin "fe6-base.gba", 0x159D98, (0x15B364 - 0x159D98) @ length: 15CC

	.global Pal_EfxAlacaliburBGCOL
Pal_EfxAlacaliburBGCOL: @ 0815B364
	.incbin "fe6-base.gba", 0x15B364, 0xC0

	.global Tsa_EfxAlacaliburBG_0815B424
Tsa_EfxAlacaliburBG_0815B424:	@ 0x15B424
	.incbin "fe6-base.gba", 0x15B424, 0x15B5AC - 0x15B424

	.global Tsa_EfxAlacaliburBG_0815B5AC
Tsa_EfxAlacaliburBG_0815B5AC:	@ 0x15B5AC
	.incbin "fe6-base.gba", 0x15B5AC, 0x15B910 - 0x15B5AC

	.global Img_EfxAlacaliburOBJ
Img_EfxAlacaliburOBJ: @ 0815B910
	.incbin "fe6-base.gba", 0x15B910, (0x15BED4 - 0x15B910) @ length: 05C4

	.global Pal_EfxAlacaliburOBJ
Pal_EfxAlacaliburOBJ: @ 0815BED4
	.incbin "fe6-base.gba", 0x15BED4, 0x20

	.global Img_EfxMistyrainBG_0815BEF4
Img_EfxMistyrainBG_0815BEF4:	@ 0x15BEF4
	.incbin "fe6-base.gba", 0x15BEF4, 0x15CAC4 - 0x15BEF4

	.global Img_EfxMistyrainBG_0815CAC4
Img_EfxMistyrainBG_0815CAC4:	@ 0x15CAC4
	.incbin "fe6-base.gba", 0x15CAC4, 0x15D7D4 - 0x15CAC4

	.global Img_EfxMistyrainBG_0815D7D4
Img_EfxMistyrainBG_0815D7D4:	@ 0x15D7D4
	.incbin "fe6-base.gba", 0x15D7D4, 0x15EA30 - 0x15D7D4

	.global Img_EfxMistyrainBG_0815EA30
Img_EfxMistyrainBG_0815EA30:	@ 0x15EA30
	.incbin "fe6-base.gba", 0x15EA30, 0x15F0B4 - 0x15EA30

	.global Img_EfxMistyrainBG_0815F0B4
Img_EfxMistyrainBG_0815F0B4:	@ 0x15F0B4
	.incbin "fe6-base.gba", 0x15F0B4, 0x15F610 - 0x15F0B4

	.global Img_EfxMistyrainBG_0815F610
Img_EfxMistyrainBG_0815F610:	@ 0x15F610
	.incbin "fe6-base.gba", 0x15F610, 0x15F880 - 0x15F610

	.global Pal_EfxMistyrainBG1
Pal_EfxMistyrainBG1: @ 0815F880
	.incbin "fe6-base.gba", 0x15F880, 0x20

	.global Pal_EfxMistyrainBG2
Pal_EfxMistyrainBG2: @ 0815F8A0
	.incbin "fe6-base.gba", 0x15F8A0, 0x20

	.global Tsa_EfxMistyrainBG_0815F8C0
Tsa_EfxMistyrainBG_0815F8C0:	@ 0x15F8C0
	.incbin "fe6-base.gba", 0x15F8C0, 0x15F9BC - 0x15F8C0

	.global Tsa_EfxMistyrainBG_0815F9BC
Tsa_EfxMistyrainBG_0815F9BC:	@ 0x15F9BC
	.incbin "fe6-base.gba", 0x15F9BC, 0x15FABC - 0x15F9BC

	.global Tsa_EfxMistyrainBG_0815FABC
Tsa_EfxMistyrainBG_0815FABC:	@ 0x15FABC
	.incbin "fe6-base.gba", 0x15FABC, 0x15FBC0 - 0x15FABC

	.global Tsa_EfxMistyrainBG_0815FBC0
Tsa_EfxMistyrainBG_0815FBC0:	@ 0x15FBC0
	.incbin "fe6-base.gba", 0x15FBC0, 0x15FCB8 - 0x15FBC0

	.global Tsa_EfxMistyrainBG_0815FCB8
Tsa_EfxMistyrainBG_0815FCB8:	@ 0x15FCB8
	.incbin "fe6-base.gba", 0x15FCB8, 0x15FDC4 - 0x15FCB8

	.global Tsa_EfxMistyrainBG_0815FDC4
Tsa_EfxMistyrainBG_0815FDC4:	@ 0x15FDC4
	.incbin "fe6-base.gba", 0x15FDC4, 0x15FED0 - 0x15FDC4

	.global Tsa_EfxMistyrainBG_0815FED0
Tsa_EfxMistyrainBG_0815FED0:	@ 0x15FED0
	.incbin "fe6-base.gba", 0x15FED0, 0x15FFF0 - 0x15FED0

	.global Tsa_EfxMistyrainBG_0815FFF0
Tsa_EfxMistyrainBG_0815FFF0:	@ 0x15FFF0
	.incbin "fe6-base.gba", 0x15FFF0, 0x160114 - 0x15FFF0

	.global Tsa_EfxMistyrainBG_08160114
Tsa_EfxMistyrainBG_08160114:	@ 0x160114
	.incbin "fe6-base.gba", 0x160114, 0x1601FC - 0x160114

	.global Tsa_EfxMistyrainBG_081601FC
Tsa_EfxMistyrainBG_081601FC:	@ 0x1601FC
	.incbin "fe6-base.gba", 0x1601FC, 0x1602D8 - 0x1601FC

	.global Tsa_EfxMistyrainBG_081602D8
Tsa_EfxMistyrainBG_081602D8:	@ 0x1602D8
	.incbin "fe6-base.gba", 0x1602D8, 0x160398 - 0x1602D8

	.global Tsa_EfxMistyrainBG_08160398
Tsa_EfxMistyrainBG_08160398:	@ 0x160398
	.incbin "fe6-base.gba", 0x160398, 0x160450 - 0x160398

	.global Tsa_EfxMistyrainBG_08160450
Tsa_EfxMistyrainBG_08160450:	@ 0x160450
	.incbin "fe6-base.gba", 0x160450, 0x1604F8 - 0x160450

	.global Tsa_EfxMistyrainBG_081604F8
Tsa_EfxMistyrainBG_081604F8:	@ 0x1604F8
	.incbin "fe6-base.gba", 0x1604F8, 0x1605B4 - 0x1604F8

	.global Tsa_EfxMistyrainBG_081605B4
Tsa_EfxMistyrainBG_081605B4:	@ 0x1605B4
	.incbin "fe6-base.gba", 0x1605B4, 0x16068C - 0x1605B4

	.global Tsa_EfxMistyrainBG_0816068C
Tsa_EfxMistyrainBG_0816068C:	@ 0x16068C
	.incbin "fe6-base.gba", 0x16068C, 0x16076C - 0x16068C

	.global Tsa_EfxMistyrainBG_0816076C
Tsa_EfxMistyrainBG_0816076C:	@ 0x16076C
	.incbin "fe6-base.gba", 0x16076C, 0x16085C - 0x16076C

	.global Tsa_EfxMistyrainBG_0816085C
Tsa_EfxMistyrainBG_0816085C:	@ 0x16085C
	.incbin "fe6-base.gba", 0x16085C, 0x160958 - 0x16085C

	.global Tsa_EfxMistyrainBG_08160958
Tsa_EfxMistyrainBG_08160958:	@ 0x160958
	.incbin "fe6-base.gba", 0x160958, 0x160A4C - 0x160958

	.global Tsa_EfxMistyrainBG_08160A4C
Tsa_EfxMistyrainBG_08160A4C:	@ 0x160A4C
	.incbin "fe6-base.gba", 0x160A4C, 0x160B44 - 0x160A4C

	.global Tsa_EfxMistyrainBG_08160B44
Tsa_EfxMistyrainBG_08160B44:	@ 0x160B44
	.incbin "fe6-base.gba", 0x160B44, 0x160C30 - 0x160B44

	.global Tsa_EfxMistyrainBG_08160C30
Tsa_EfxMistyrainBG_08160C30:	@ 0x160C30
	.incbin "fe6-base.gba", 0x160C30, 0x160D14 - 0x160C30

	.global Tsa_EfxMistyrainBG_08160D14
Tsa_EfxMistyrainBG_08160D14:	@ 0x160D14
	.incbin "fe6-base.gba", 0x160D14, 0x160DEC - 0x160D14

	.global Tsa_EfxMistyrainBG_08160DEC
Tsa_EfxMistyrainBG_08160DEC:	@ 0x160DEC
	.incbin "fe6-base.gba", 0x160DEC, 0x160EBC - 0x160DEC

	.global Tsa_EfxMistyrainBG_08160EBC
Tsa_EfxMistyrainBG_08160EBC:	@ 0x160EBC
	.incbin "fe6-base.gba", 0x160EBC, 0x160F88 - 0x160EBC

	.global Tsa_EfxMistyrainBG_08160F88
Tsa_EfxMistyrainBG_08160F88:	@ 0x160F88
	.incbin "fe6-base.gba", 0x160F88, 0x161050 - 0x160F88

	.global Tsa_EfxMistyrainBG_08161050
Tsa_EfxMistyrainBG_08161050:	@ 0x161050
	.incbin "fe6-base.gba", 0x161050, 0x161104 - 0x161050

	.global Tsa_EfxMistyrainBG_08161104
Tsa_EfxMistyrainBG_08161104:	@ 0x161104
	.incbin "fe6-base.gba", 0x161104, 0x1611B8 - 0x161104

	.global Tsa_EfxMistyrainBG_081611B8
Tsa_EfxMistyrainBG_081611B8:	@ 0x1611B8
	.incbin "fe6-base.gba", 0x1611B8, 0x161258 - 0x1611B8

	.global Tsa_EfxMistyrainBG_08161258
Tsa_EfxMistyrainBG_08161258:	@ 0x161258
	.incbin "fe6-base.gba", 0x161258, 0x16130C - 0x161258

	.global Tsa_EfxMistyrainBG_0816130C
Tsa_EfxMistyrainBG_0816130C:	@ 0x16130C
	.incbin "fe6-base.gba", 0x16130C, 0x1613C8 - 0x16130C

	.global Tsa_EfxMistyrainBG_081613C8
Tsa_EfxMistyrainBG_081613C8:	@ 0x1613C8
	.incbin "fe6-base.gba", 0x1613C8, 0x1614A4 - 0x1613C8

	.global Tsa_EfxMistyrainBG_081614A4
Tsa_EfxMistyrainBG_081614A4:	@ 0x1614A4
	.incbin "fe6-base.gba", 0x1614A4, 0x16158C - 0x1614A4

	.global Tsa_EfxMistyrainBG_0816158C
Tsa_EfxMistyrainBG_0816158C:	@ 0x16158C
	.incbin "fe6-base.gba", 0x16158C, 0x1616B0 - 0x16158C

	.global Tsa_EfxMistyrainBG_081616B0
Tsa_EfxMistyrainBG_081616B0:	@ 0x1616B0
	.incbin "fe6-base.gba", 0x1616B0, 0x1617D0 - 0x1616B0

	.global Tsa_EfxMistyrainBG_081617D0
Tsa_EfxMistyrainBG_081617D0:	@ 0x1617D0
	.incbin "fe6-base.gba", 0x1617D0, 0x1618DC - 0x1617D0

	.global Tsa_EfxMistyrainBG_081618DC
Tsa_EfxMistyrainBG_081618DC:	@ 0x1618DC
	.incbin "fe6-base.gba", 0x1618DC, 0x1619E8 - 0x1618DC

	.global Tsa_EfxMistyrainBG_081619E8
Tsa_EfxMistyrainBG_081619E8:	@ 0x1619E8
	.incbin "fe6-base.gba", 0x1619E8, 0x161AE4 - 0x1619E8

	.global Tsa_EfxMistyrainBG_08161AE4
Tsa_EfxMistyrainBG_08161AE4:	@ 0x161AE4
	.incbin "fe6-base.gba", 0x161AE4, 0x161BE4 - 0x161AE4

	.global Tsa_EfxMistyrainBG_08161BE4
Tsa_EfxMistyrainBG_08161BE4:	@ 0x161BE4
	.incbin "fe6-base.gba", 0x161BE4, 0x161CE0 - 0x161BE4

	.global Tsa_EfxMistyrainBG_08161CE0
Tsa_EfxMistyrainBG_08161CE0:	@ 0x161CE0
	.incbin "fe6-base.gba", 0x161CE0, 0x161DDC - 0x161CE0

	.global Img_EfxMistyrainOBJ1_1
Img_EfxMistyrainOBJ1_1: @ 08161DDC
	.incbin "fe6-base.gba", 0x161DDC, (0x1621DC - 0x161DDC) @ length: 0400

	.global Img_EfxMistyrainOBJ1_2
Img_EfxMistyrainOBJ1_2: @ 081621DC
	.incbin "fe6-base.gba", 0x1621DC, (0x16261C - 0x1621DC) @ length: 0440

	.global Img_EfxMistyrainOBJ1_3
Img_EfxMistyrainOBJ1_3: @ 0816261C
	.incbin "fe6-base.gba", 0x16261C, (0x1629D4 - 0x16261C) @ length: 03B8

	.global Pal_EfxMistyrainOBJ1
Pal_EfxMistyrainOBJ1: @ 081629D4
	.incbin "fe6-base.gba", 0x1629D4, 0x20

	.global Img_EfxResireBG_081629F4
Img_EfxResireBG_081629F4:	@ 0x1629F4
	.incbin "fe6-base.gba", 0x1629F4, 0x1634C4 - 0x1629F4

	.global Img_EfxResireBG_081634C4
Img_EfxResireBG_081634C4:	@ 0x1634C4
	.incbin "fe6-base.gba", 0x1634C4, 0x16406C - 0x1634C4

	.global Img_EfxResireBG_0816406C
Img_EfxResireBG_0816406C:	@ 0x16406C
	.incbin "fe6-base.gba", 0x16406C, 0x164BC4 - 0x16406C

	.global Img_EfxResireBG_08164BC4
Img_EfxResireBG_08164BC4:	@ 0x164BC4
	.incbin "fe6-base.gba", 0x164BC4, 0x165678 - 0x164BC4

	.global Img_EfxResireBG_08165678
Img_EfxResireBG_08165678:	@ 0x165678
	.incbin "fe6-base.gba", 0x165678, 0x166148 - 0x165678

	.global Img_EfxResireBG_08166148
Img_EfxResireBG_08166148:	@ 0x166148
	.incbin "fe6-base.gba", 0x166148, 0x166E0C - 0x166148

	.global Img_EfxResireBG_08166E0C
Img_EfxResireBG_08166E0C:	@ 0x166E0C
	.incbin "fe6-base.gba", 0x166E0C, 0x167710 - 0x166E0C

	.global Img_EfxResireBG_08167710
Img_EfxResireBG_08167710:	@ 0x167710
	.incbin "fe6-base.gba", 0x167710, 0x167C64 - 0x167710

	.global Img_EfxResireBG_08167C64
Img_EfxResireBG_08167C64:	@ 0x167C64
	.incbin "fe6-base.gba", 0x167C64, 0x16857C - 0x167C64

	.global Img_EfxResireBG_0816857C
Img_EfxResireBG_0816857C:	@ 0x16857C
	.incbin "fe6-base.gba", 0x16857C, 0x1691B0 - 0x16857C

	.global Img_EfxResireBG_081691B0
Img_EfxResireBG_081691B0:	@ 0x1691B0
	.incbin "fe6-base.gba", 0x1691B0, 0x169E54 - 0x1691B0

	.global Img_EfxResireBG_08169E54
Img_EfxResireBG_08169E54:	@ 0x169E54
	.incbin "fe6-base.gba", 0x169E54, 0x16AA48 - 0x169E54

	.global Img_EfxResireBG_0816AA48
Img_EfxResireBG_0816AA48:	@ 0x16AA48
	.incbin "fe6-base.gba", 0x16AA48, 0x16B328 - 0x16AA48

	.global Pal_EfxResireBG
Pal_EfxResireBG: @ 0816B328
	.incbin "fe6-base.gba", 0x16B328, 0x20

	.global Tsa_EfxResireBG_0816B348
Tsa_EfxResireBG_0816B348:	@ 0x16B348
	.incbin "fe6-base.gba", 0x16B348, 0x16B478 - 0x16B348

	.global Tsa_EfxResireBG_0816B478
Tsa_EfxResireBG_0816B478:	@ 0x16B478
	.incbin "fe6-base.gba", 0x16B478, 0x16B524 - 0x16B478

	.global Tsa_EfxResireBG_0816B524
Tsa_EfxResireBG_0816B524:	@ 0x16B524
	.incbin "fe6-base.gba", 0x16B524, 0x16B5D4 - 0x16B524

	.global Tsa_EfxResireBG_0816B5D4
Tsa_EfxResireBG_0816B5D4:	@ 0x16B5D4
	.incbin "fe6-base.gba", 0x16B5D4, 0x16B68C - 0x16B5D4

	.global Tsa_EfxResireBG_0816B68C
Tsa_EfxResireBG_0816B68C:	@ 0x16B68C
	.incbin "fe6-base.gba", 0x16B68C, 0x16B74C - 0x16B68C

	.global Tsa_EfxResireBG_0816B74C
Tsa_EfxResireBG_0816B74C:	@ 0x16B74C
	.incbin "fe6-base.gba", 0x16B74C, 0x16B818 - 0x16B74C

	.global Tsa_EfxResireBG_0816B818
Tsa_EfxResireBG_0816B818:	@ 0x16B818
	.incbin "fe6-base.gba", 0x16B818, 0x16B8F8 - 0x16B818

	.global Tsa_EfxResireBG_0816B8F8
Tsa_EfxResireBG_0816B8F8:	@ 0x16B8F8
	.incbin "fe6-base.gba", 0x16B8F8, 0x16B9E0 - 0x16B8F8

	.global Tsa_EfxResireBG_0816B9E0
Tsa_EfxResireBG_0816B9E0:	@ 0x16B9E0
	.incbin "fe6-base.gba", 0x16B9E0, 0x16BAE8 - 0x16B9E0

	.global Tsa_EfxResireBG_0816BAE8
Tsa_EfxResireBG_0816BAE8:	@ 0x16BAE8
	.incbin "fe6-base.gba", 0x16BAE8, 0x16BC04 - 0x16BAE8

	.global Tsa_EfxResireBG_0816BC04
Tsa_EfxResireBG_0816BC04:	@ 0x16BC04
	.incbin "fe6-base.gba", 0x16BC04, 0x16BD40 - 0x16BC04

	.global Tsa_EfxResireBG_0816BD40
Tsa_EfxResireBG_0816BD40:	@ 0x16BD40
	.incbin "fe6-base.gba", 0x16BD40, 0x16BE90 - 0x16BD40

	.global Tsa_EfxResireBG_0816BE90
Tsa_EfxResireBG_0816BE90:	@ 0x16BE90
	.incbin "fe6-base.gba", 0x16BE90, 0x16BFE8 - 0x16BE90

	.global Tsa_EfxResireBG_0816BFE8
Tsa_EfxResireBG_0816BFE8:	@ 0x16BFE8
	.incbin "fe6-base.gba", 0x16BFE8, 0x16C140 - 0x16BFE8

	.global Tsa_EfxResireBG_0816C140
Tsa_EfxResireBG_0816C140:	@ 0x16C140
	.incbin "fe6-base.gba", 0x16C140, 0x16C294 - 0x16C140

	.global Tsa_EfxResireBG_0816C294
Tsa_EfxResireBG_0816C294:	@ 0x16C294
	.incbin "fe6-base.gba", 0x16C294, 0x16C3E4 - 0x16C294

	.global Tsa_EfxResireBG_0816C3E4
Tsa_EfxResireBG_0816C3E4:	@ 0x16C3E4
	.incbin "fe6-base.gba", 0x16C3E4, 0x16C534 - 0x16C3E4

	.global Tsa_EfxResireBG_0816C534
Tsa_EfxResireBG_0816C534:	@ 0x16C534
	.incbin "fe6-base.gba", 0x16C534, 0x16C66C - 0x16C534

	.global Tsa_EfxResireBG_0816C66C
Tsa_EfxResireBG_0816C66C:	@ 0x16C66C
	.incbin "fe6-base.gba", 0x16C66C, 0x16C798 - 0x16C66C

	.global Tsa_EfxResireBG_0816C798
Tsa_EfxResireBG_0816C798:	@ 0x16C798
	.incbin "fe6-base.gba", 0x16C798, 0x16C8B4 - 0x16C798

	.global Tsa_EfxResireBG_0816C8B4
Tsa_EfxResireBG_0816C8B4:	@ 0x16C8B4
	.incbin "fe6-base.gba", 0x16C8B4, 0x16C9C0 - 0x16C8B4

	.global Tsa_EfxResireBG_0816C9C0
Tsa_EfxResireBG_0816C9C0:	@ 0x16C9C0
	.incbin "fe6-base.gba", 0x16C9C0, 0x16CAB8 - 0x16C9C0

	.global Tsa_EfxResireBG_0816CAB8
Tsa_EfxResireBG_0816CAB8:	@ 0x16CAB8
	.incbin "fe6-base.gba", 0x16CAB8, 0x16CBA4 - 0x16CAB8

	.global Tsa_EfxResireBG_0816CBA4
Tsa_EfxResireBG_0816CBA4:	@ 0x16CBA4
	.incbin "fe6-base.gba", 0x16CBA4, 0x16CC74 - 0x16CBA4

	.global Tsa_EfxResireBG_0816CC74
Tsa_EfxResireBG_0816CC74:	@ 0x16CC74
	.incbin "fe6-base.gba", 0x16CC74, 0x16CD30 - 0x16CC74

	.global Tsa_EfxResireBG_0816CD30
Tsa_EfxResireBG_0816CD30:	@ 0x16CD30
	.incbin "fe6-base.gba", 0x16CD30, 0x16CDE4 - 0x16CD30

	.global Tsa_EfxResireBG_0816CDE4
Tsa_EfxResireBG_0816CDE4:	@ 0x16CDE4
	.incbin "fe6-base.gba", 0x16CDE4, 0x16CE94 - 0x16CDE4

	.global Tsa_EfxResireBG_0816CE94
Tsa_EfxResireBG_0816CE94:	@ 0x16CE94
	.incbin "fe6-base.gba", 0x16CE94, 0x16CF40 - 0x16CE94

	.global Tsa_EfxResireBG_0816CF40
Tsa_EfxResireBG_0816CF40:	@ 0x16CF40
	.incbin "fe6-base.gba", 0x16CF40, 0x16CFE8 - 0x16CF40

	.global Tsa_EfxResireBG_0816CFE8
Tsa_EfxResireBG_0816CFE8:	@ 0x16CFE8
	.incbin "fe6-base.gba", 0x16CFE8, 0x16D09C - 0x16CFE8

	.global Tsa_EfxResireBG_0816D09C
Tsa_EfxResireBG_0816D09C:	@ 0x16D09C
	.incbin "fe6-base.gba", 0x16D09C, 0x16D15C - 0x16D09C

	.global Tsa_EfxResireBG_0816D15C
Tsa_EfxResireBG_0816D15C:	@ 0x16D15C
	.incbin "fe6-base.gba", 0x16D15C, 0x16D228 - 0x16D15C

	.global Tsa_EfxResireBG_0816D228
Tsa_EfxResireBG_0816D228:	@ 0x16D228
	.incbin "fe6-base.gba", 0x16D228, 0x16D2F0 - 0x16D228

	.global Tsa_EfxResireBG_0816D2F0
Tsa_EfxResireBG_0816D2F0:	@ 0x16D2F0
	.incbin "fe6-base.gba", 0x16D2F0, 0x16D3B8 - 0x16D2F0

	.global Tsa_EfxResireBG_0816D3B8
Tsa_EfxResireBG_0816D3B8:	@ 0x16D3B8
	.incbin "fe6-base.gba", 0x16D3B8, 0x16D48C - 0x16D3B8

	.global Tsa_EfxResireBG_0816D48C
Tsa_EfxResireBG_0816D48C:	@ 0x16D48C
	.incbin "fe6-base.gba", 0x16D48C, 0x16D568 - 0x16D48C

	.global Tsa_EfxResireBG_0816D568
Tsa_EfxResireBG_0816D568:	@ 0x16D568
	.incbin "fe6-base.gba", 0x16D568, 0x16D650 - 0x16D568

	.global Tsa_EfxResireBG_0816D650
Tsa_EfxResireBG_0816D650:	@ 0x16D650
	.incbin "fe6-base.gba", 0x16D650, 0x16D744 - 0x16D650

	.global Tsa_EfxResireBG_0816D744
Tsa_EfxResireBG_0816D744:	@ 0x16D744
	.incbin "fe6-base.gba", 0x16D744, 0x16D84C - 0x16D744

	.global Tsa_EfxResireBG_0816D84C
Tsa_EfxResireBG_0816D84C:	@ 0x16D84C
	.incbin "fe6-base.gba", 0x16D84C, 0x16D954 - 0x16D84C

	.global Tsa_EfxResireBG_0816D954
Tsa_EfxResireBG_0816D954:	@ 0x16D954
	.incbin "fe6-base.gba", 0x16D954, 0x16DA78 - 0x16D954

	.global Tsa_EfxResireBG_0816DA78
Tsa_EfxResireBG_0816DA78:	@ 0x16DA78
	.incbin "fe6-base.gba", 0x16DA78, 0x16DB98 - 0x16DA78

	.global Tsa_EfxResireBG_0816DB98
Tsa_EfxResireBG_0816DB98:	@ 0x16DB98
	.incbin "fe6-base.gba", 0x16DB98, 0x16DCB4 - 0x16DB98

	.global Tsa_EfxResireBG_0816DCB4
Tsa_EfxResireBG_0816DCB4:	@ 0x16DCB4
	.incbin "fe6-base.gba", 0x16DCB4, 0x16DDC4 - 0x16DCB4

	.global Tsa_EfxResireBG_0816DDC4
Tsa_EfxResireBG_0816DDC4:	@ 0x16DDC4
	.incbin "fe6-base.gba", 0x16DDC4, 0x16DED0 - 0x16DDC4

	.global Tsa_EfxResireBG_0816DED0
Tsa_EfxResireBG_0816DED0:	@ 0x16DED0
	.incbin "fe6-base.gba", 0x16DED0, 0x16DFD0 - 0x16DED0

	.global Tsa_EfxResireBG_0816DFD0
Tsa_EfxResireBG_0816DFD0:	@ 0x16DFD0
	.incbin "fe6-base.gba", 0x16DFD0, 0x16E0C0 - 0x16DFD0

	.global Tsa_EfxResireBG_0816E0C0
Tsa_EfxResireBG_0816E0C0:	@ 0x16E0C0
	.incbin "fe6-base.gba", 0x16E0C0, 0x16E19C - 0x16E0C0

	.global Tsa_EfxResireBG_0816E19C
Tsa_EfxResireBG_0816E19C:	@ 0x16E19C
	.incbin "fe6-base.gba", 0x16E19C, 0x16E268 - 0x16E19C

	.global Tsa_EfxResireBG_0816E268
Tsa_EfxResireBG_0816E268:	@ 0x16E268
	.incbin "fe6-base.gba", 0x16E268, 0x16E320 - 0x16E268

	.global Tsa_EfxResireBG_0816E320
Tsa_EfxResireBG_0816E320:	@ 0x16E320
	.incbin "fe6-base.gba", 0x16E320, 0x16E3CC - 0x16E320

	.global Img_EfxDivineBG3_0816E3CC
Img_EfxDivineBG3_0816E3CC:	@ 0x16E3CC
	.incbin "fe6-base.gba", 0x16E3CC, 0x16E980 - 0x16E3CC

	.global Img_EfxDivineBG3_0816E980
Img_EfxDivineBG3_0816E980:	@ 0x16E980
	.incbin "fe6-base.gba", 0x16E980, 0x16F048 - 0x16E980

	.global Img_EfxDivineBG3_0816F048
Img_EfxDivineBG3_0816F048:	@ 0x16F048
	.incbin "fe6-base.gba", 0x16F048, 0x16F688 - 0x16F048

	.global Img_EfxDivineBG3_0816F688
Img_EfxDivineBG3_0816F688:	@ 0x16F688
	.incbin "fe6-base.gba", 0x16F688, 0x16FC90 - 0x16F688

	.global Img_EfxDivineBG3_0816FC90
Img_EfxDivineBG3_0816FC90:	@ 0x16FC90
	.incbin "fe6-base.gba", 0x16FC90, 0x1702F0 - 0x16FC90

	.global Img_EfxDivineBG3_081702F0
Img_EfxDivineBG3_081702F0:	@ 0x1702F0
	.incbin "fe6-base.gba", 0x1702F0, 0x170960 - 0x1702F0

	.global Img_EfxDivineBG3_08170960
Img_EfxDivineBG3_08170960:	@ 0x170960
	.incbin "fe6-base.gba", 0x170960, 0x170F9C - 0x170960

	.global Img_EfxDivineBG3_08170F9C
Img_EfxDivineBG3_08170F9C:	@ 0x170F9C
	.incbin "fe6-base.gba", 0x170F9C, 0x1715E4 - 0x170F9C

	.global Img_EfxDivineBG3_081715E4
Img_EfxDivineBG3_081715E4:	@ 0x1715E4
	.incbin "fe6-base.gba", 0x1715E4, 0x171CE8 - 0x1715E4

	.global Img_EfxDivineBG3_08171CE8
Img_EfxDivineBG3_08171CE8:	@ 0x171CE8
	.incbin "fe6-base.gba", 0x171CE8, 0x1724A0 - 0x171CE8

	.global Img_EfxDivineBG3_081724A0
Img_EfxDivineBG3_081724A0:	@ 0x1724A0
	.incbin "fe6-base.gba", 0x1724A0, 0x172C94 - 0x1724A0

	.global Img_EfxDivineBG3_08172C94
Img_EfxDivineBG3_08172C94:	@ 0x172C94
	.incbin "fe6-base.gba", 0x172C94, 0x17346C - 0x172C94

	.global Img_EfxDivineBG3_0817346C
Img_EfxDivineBG3_0817346C:	@ 0x17346C
	.incbin "fe6-base.gba", 0x17346C, 0x173C88 - 0x17346C

	.global Img_EfxDivineBG3_08173C88
Img_EfxDivineBG3_08173C88:	@ 0x173C88
	.incbin "fe6-base.gba", 0x173C88, 0x174408 - 0x173C88

	.global Img_EfxDivineBG3_08174408
Img_EfxDivineBG3_08174408:	@ 0x174408
	.incbin "fe6-base.gba", 0x174408, 0x174B9C - 0x174408

	.global Img_EfxDivineBG3_08174B9C
Img_EfxDivineBG3_08174B9C:	@ 0x174B9C
	.incbin "fe6-base.gba", 0x174B9C, 0x1752D0 - 0x174B9C

	.global Img_EfxDivineBG3_081752D0
Img_EfxDivineBG3_081752D0:	@ 0x1752D0
	.incbin "fe6-base.gba", 0x1752D0, 0x175D7C - 0x1752D0

	.global Img_EfxDivineBG3_08175D7C
Img_EfxDivineBG3_08175D7C:	@ 0x175D7C
	.incbin "fe6-base.gba", 0x175D7C, 0x1762DC - 0x175D7C

	.global Img_EfxDivineBG1_081762DC
Img_EfxDivineBG1_081762DC:	@ 0x1762DC
	.incbin "fe6-base.gba", 0x1762DC, 0x176A4C - 0x1762DC

	.global Pal_EfxDivineBG3
Pal_EfxDivineBG3: @ 08176A4C
	.incbin "fe6-base.gba", 0x176A4C, (0x176A6C - 0x176A4C) @ length: 0020

	.global Pal_EfxDivineBG
Pal_EfxDivineBG: @ 08176A6C
	.incbin "fe6-base.gba", 0x176A6C, 0x20

	.global Tsa_EfxDivineBG3_08176A8C
Tsa_EfxDivineBG3_08176A8C:	@ 0x176A8C
	.incbin "fe6-base.gba", 0x176A8C, 0x176C20 - 0x176A8C

	.global Tsa_EfxDivineBG3_08176C20
Tsa_EfxDivineBG3_08176C20:	@ 0x176C20
	.incbin "fe6-base.gba", 0x176C20, 0x176E24 - 0x176C20

	.global Tsa_EfxDivineBG3_08176E24
Tsa_EfxDivineBG3_08176E24:	@ 0x176E24
	.incbin "fe6-base.gba", 0x176E24, 0x1770F4 - 0x176E24

	.global Tsa_EfxDivineBG3_081770F4
Tsa_EfxDivineBG3_081770F4:	@ 0x1770F4
	.incbin "fe6-base.gba", 0x1770F4, 0x1773C4 - 0x1770F4

	.global Tsa_EfxDivineBG3_081773C4
Tsa_EfxDivineBG3_081773C4:	@ 0x1773C4
	.incbin "fe6-base.gba", 0x1773C4, 0x177674 - 0x1773C4

	.global Tsa_EfxDivineBG3_08177674
Tsa_EfxDivineBG3_08177674:	@ 0x177674
	.incbin "fe6-base.gba", 0x177674, 0x177928 - 0x177674

	.global Tsa_EfxDivineBG3_08177928
Tsa_EfxDivineBG3_08177928:	@ 0x177928
	.incbin "fe6-base.gba", 0x177928, 0x177BB4 - 0x177928

	.global Tsa_EfxDivineBG3_08177BB4
Tsa_EfxDivineBG3_08177BB4:	@ 0x177BB4
	.incbin "fe6-base.gba", 0x177BB4, 0x177E38 - 0x177BB4

	.global Tsa_EfxDivineBG3_08177E38
Tsa_EfxDivineBG3_08177E38:	@ 0x177E38
	.incbin "fe6-base.gba", 0x177E38, 0x1780AC - 0x177E38

	.global Tsa_EfxDivineBG3_081780AC
Tsa_EfxDivineBG3_081780AC:	@ 0x1780AC
	.incbin "fe6-base.gba", 0x1780AC, 0x178340 - 0x1780AC

	.global Tsa_EfxDivineBG3_08178340
Tsa_EfxDivineBG3_08178340:	@ 0x178340
	.incbin "fe6-base.gba", 0x178340, 0x1785C8 - 0x178340

	.global Tsa_EfxDivineBG3_081785C8
Tsa_EfxDivineBG3_081785C8:	@ 0x1785C8
	.incbin "fe6-base.gba", 0x1785C8, 0x178864 - 0x1785C8

	.global Tsa_EfxDivineBG3_08178864
Tsa_EfxDivineBG3_08178864:	@ 0x178864
	.incbin "fe6-base.gba", 0x178864, 0x178AEC - 0x178864

	.global Tsa_EfxDivineBG3_08178AEC
Tsa_EfxDivineBG3_08178AEC:	@ 0x178AEC
	.incbin "fe6-base.gba", 0x178AEC, 0x178D68 - 0x178AEC

	.global Tsa_EfxDivineBG3_08178D68
Tsa_EfxDivineBG3_08178D68:	@ 0x178D68
	.incbin "fe6-base.gba", 0x178D68, 0x178F98 - 0x178D68

	.global Tsa_EfxDivineBG3_08178F98
Tsa_EfxDivineBG3_08178F98:	@ 0x178F98
	.incbin "fe6-base.gba", 0x178F98, 0x1791E8 - 0x178F98

	.global Tsa_EfxDivineBG3_081791E8
Tsa_EfxDivineBG3_081791E8:	@ 0x1791E8
	.incbin "fe6-base.gba", 0x1791E8, 0x179418 - 0x1791E8

	.global Tsa_EfxDivineBG3_08179418
Tsa_EfxDivineBG3_08179418:	@ 0x179418
	.incbin "fe6-base.gba", 0x179418, 0x179610 - 0x179418

	.global Tsa_EfxDivineBG3_08179610
Tsa_EfxDivineBG3_08179610:	@ 0x179610
	.incbin "fe6-base.gba", 0x179610, 0x1797F4 - 0x179610

	.global Tsa_EfxDivineBG3_081797F4
Tsa_EfxDivineBG3_081797F4:	@ 0x1797F4
	.incbin "fe6-base.gba", 0x1797F4, 0x179990 - 0x1797F4

	.global Tsa_EfxDivineBG3_08179990
Tsa_EfxDivineBG3_08179990:	@ 0x179990
	.incbin "fe6-base.gba", 0x179990, 0x179AB8 - 0x179990

	.global Tsa_EfxDivineBG1_08179AB8
Tsa_EfxDivineBG1_08179AB8:	@ 0x179AB8
	.incbin "fe6-base.gba", 0x179AB8, 0x179B58 - 0x179AB8

	.global Tsa_EfxDivineBG1_08179B58
Tsa_EfxDivineBG1_08179B58:	@ 0x179B58
	.incbin "fe6-base.gba", 0x179B58, 0x179C00 - 0x179B58

	.global Tsa_EfxDivineBG1_08179C00
Tsa_EfxDivineBG1_08179C00:	@ 0x179C00
	.incbin "fe6-base.gba", 0x179C00, 0x179CA8 - 0x179C00

	.global Tsa_EfxDivineBG1_08179CA8
Tsa_EfxDivineBG1_08179CA8:	@ 0x179CA8
	.incbin "fe6-base.gba", 0x179CA8, 0x179D58 - 0x179CA8

	.global Tsa_EfxDivineBG1_08179D58
Tsa_EfxDivineBG1_08179D58:	@ 0x179D58
	.incbin "fe6-base.gba", 0x179D58, 0x179E10 - 0x179D58

	.global Tsa_EfxDivineBG1_08179E10
Tsa_EfxDivineBG1_08179E10:	@ 0x179E10
	.incbin "fe6-base.gba", 0x179E10, 0x179EDC - 0x179E10

	.global Tsa_EfxDivineBG1_08179EDC
Tsa_EfxDivineBG1_08179EDC:	@ 0x179EDC
	.incbin "fe6-base.gba", 0x179EDC, 0x179FA8 - 0x179EDC

	.global Tsa_EfxDivineBG1_08179FA8
Tsa_EfxDivineBG1_08179FA8:	@ 0x179FA8
	.incbin "fe6-base.gba", 0x179FA8, 0x17A07C - 0x179FA8

	.global Tsa_EfxDivineBG1_0817A07C
Tsa_EfxDivineBG1_0817A07C:	@ 0x17A07C
	.incbin "fe6-base.gba", 0x17A07C, 0x17A154 - 0x17A07C

	.global Tsa_EfxDivineBG1_0817A154
Tsa_EfxDivineBG1_0817A154:	@ 0x17A154
	.incbin "fe6-base.gba", 0x17A154, 0x17A230 - 0x17A154

	.global Tsa_EfxDivineBG1_0817A230
Tsa_EfxDivineBG1_0817A230:	@ 0x17A230
	.incbin "fe6-base.gba", 0x17A230, 0x17A30C - 0x17A230

	.global Tsa_EfxDivineBG1_0817A30C
Tsa_EfxDivineBG1_0817A30C:	@ 0x17A30C
	.incbin "fe6-base.gba", 0x17A30C, 0x17A3F0 - 0x17A30C

	.global Tsa_EfxDivineBG1_0817A3F0
Tsa_EfxDivineBG1_0817A3F0:	@ 0x17A3F0
	.incbin "fe6-base.gba", 0x17A3F0, 0x17A4A4 - 0x17A3F0

	.global Tsa_EfxDivineBG1_0817A4A4
Tsa_EfxDivineBG1_0817A4A4:	@ 0x17A4A4
	.incbin "fe6-base.gba", 0x17A4A4, 0x17A540 - 0x17A4A4

	.global Tsa_EfxDivineBG1_0817A540
Tsa_EfxDivineBG1_0817A540:	@ 0x17A540
	.incbin "fe6-base.gba", 0x17A540, 0x17A5DC - 0x17A540

	.global Tsa_EfxDivineBG1_0817A5DC
Tsa_EfxDivineBG1_0817A5DC:	@ 0x17A5DC
	.incbin "fe6-base.gba", 0x17A5DC, 0x17A678 - 0x17A5DC

	.global Tsa_EfxDivineBG1_0817A678
Tsa_EfxDivineBG1_0817A678:	@ 0x17A678
	.incbin "fe6-base.gba", 0x17A678, 0x17A714 - 0x17A678

	.global Tsa_EfxDivineBG1_0817A714
Tsa_EfxDivineBG1_0817A714:	@ 0x17A714
	.incbin "fe6-base.gba", 0x17A714, 0x17A7B0 - 0x17A714

	.global Tsa_EfxDivineBG1_0817A7B0
Tsa_EfxDivineBG1_0817A7B0:	@ 0x17A7B0
	.incbin "fe6-base.gba", 0x17A7B0, 0x17A84C - 0x17A7B0

	.global Tsa_EfxDivineBG1_0817A84C
Tsa_EfxDivineBG1_0817A84C:	@ 0x17A84C
	.incbin "fe6-base.gba", 0x17A84C, 0x17A8E8 - 0x17A84C

	.global Tsa_EfxDivineBG2_0817A8E8
Tsa_EfxDivineBG2_0817A8E8:	@ 0x17A8E8
	.incbin "fe6-base.gba", 0x17A8E8, 0x17A984 - 0x17A8E8

	.global Tsa_EfxDivineBG2_0817A984
Tsa_EfxDivineBG2_0817A984:	@ 0x17A984
	.incbin "fe6-base.gba", 0x17A984, 0x17AA20 - 0x17A984

	.global Tsa_EfxDivineBG2_0817AA20
Tsa_EfxDivineBG2_0817AA20:	@ 0x17AA20
	.incbin "fe6-base.gba", 0x17AA20, 0x17AAC0 - 0x17AA20

	.global Img_EfxDivineOBJ
Img_EfxDivineOBJ: @ 0817AAC0
	.incbin "fe6-base.gba", 0x17AAC0, (0x17AC2C - 0x17AAC0) @ length: 016C

	.global Pal_EfxDivineOBJ
Pal_EfxDivineOBJ: @ 0817AC2C
	.incbin "fe6-base.gba", 0x17AC2C, (0x17AC4C - 0x17AC2C) @ length: 0020

	.global gUnk_0817AC4C
gUnk_0817AC4C: @ 0817AC4C
	.incbin "fe6-base.gba", 0x17AC4C, (0x17B418 - 0x17AC4C) @ length: 07CC

	.global Pal_EfxApocalypse_0817B418
Pal_EfxApocalypse_0817B418: @ 0817B418
	.incbin "fe6-base.gba", 0x17B418, (0x17B438 - 0x17B418) @ length: 0020

	.global gUnk_0817B438
gUnk_0817B438: @ 0817B438
	.incbin "fe6-base.gba", 0x17B438, (0x17B8D0 - 0x17B438) @ length: 0498

	.global Img_EfxApocalypseOBJ
Img_EfxApocalypseOBJ: @ 0817B8D0
	.incbin "fe6-base.gba", 0x17B8D0, (0x17BBB4 - 0x17B8D0) @ length: 02E4

	.global Pal_EfxApocalypseOBJ
Pal_EfxApocalypseOBJ: @ 0817BBB4
	.incbin "fe6-base.gba", 0x17BBB4, (0x17BBB6 - 0x17BBB4) @ length: 0002

	.global Pals_EfxApocalypseBGCOL2
Pals_EfxApocalypseBGCOL2: @ 0817BBB6
	.incbin "fe6-base.gba", 0x17BBB6, (0x181E60 - 0x17BBB6) @ length: 62AA

	.global Pal_EfxApocalypseBG2
Pal_EfxApocalypseBG2: @ 08181E60
	.incbin "fe6-base.gba", 0x181E60, (0x1830F4 - 0x181E60) @ length: 1294

	.global Img_EfxApocalypseOBJ2_1
Img_EfxApocalypseOBJ2_1: @ 081830F4
	.incbin "fe6-base.gba", 0x1830F4, (0x18360C - 0x1830F4) @ length: 0518

	.global Img_EfxApocalypseOBJ2_2
Img_EfxApocalypseOBJ2_2: @ 0818360C
	.incbin "fe6-base.gba", 0x18360C, (0x18BBCC - 0x18360C) @ length: 85C0

	.global Pal_EfxHazymoonBG2
Pal_EfxHazymoonBG2: @ 0818BBCC
	.incbin "fe6-base.gba", 0x18BBCC, (0x18BBEC - 0x18BBCC) @ length: 0020

	.global Pal_EfxHazymoonBG3
Pal_EfxHazymoonBG3: @ 0818BBEC
	.incbin "fe6-base.gba", 0x18BBEC, (0x18DD18 - 0x18BBEC) @ length: 212C

	.global Img_EfxHazymoonOBJ2_1
Img_EfxHazymoonOBJ2_1: @ 0818DD18
	.incbin "fe6-base.gba", 0x18DD18, (0x18E1E4 - 0x18DD18) @ length: 04CC

	.global Img_EfxHazymoonOBJ2_2
Img_EfxHazymoonOBJ2_2: @ 0818E1E4
	.incbin "fe6-base.gba", 0x18E1E4, (0x18E67C - 0x18E1E4) @ length: 0498

	.global Img_EfxHazymoonOBJ2_3
Img_EfxHazymoonOBJ2_3: @ 0818E67C
	.incbin "fe6-base.gba", 0x18E67C, (0x18EA78 - 0x18E67C) @ length: 03FC

	.global Pal_EfxHazymoonOBJ2
Pal_EfxHazymoonOBJ2: @ 0818EA78
	.incbin "fe6-base.gba", 0x18EA78, (0x18EA98 - 0x18EA78) @ length: 0020

	.global Img_EfxFenrirBG
Img_EfxFenrirBG: @ 0818EA98
	.incbin "fe6-base.gba", 0x18EA98, (0x18F1F8 - 0x18EA98) @ length: 0760

	.global PalArray_EfxFenrirBGCOL
PalArray_EfxFenrirBGCOL: @ 0818F1F8
	.incbin "fe6-base.gba", 0x18F1F8, (0x18F3D8 - 0x18F1F8) @ length: 01E0

	.global Tsa_EfxFenrirBG
Tsa_EfxFenrirBG: @ 0818F3D8
	.incbin "fe6-base.gba", 0x18F3D8, (0x193598 - 0x18F3D8) @ length: 41C0

	.global Pal_EfxFenrirBG2_A
Pal_EfxFenrirBG2_A: @ 08193598
	.incbin "fe6-base.gba", 0x193598, (0x1935B8 - 0x193598) @ length: 0020

	.global Pal_EfxFenrirBG2_B
Pal_EfxFenrirBG2_B: @ 081935B8
	.incbin "fe6-base.gba", 0x1935B8, (0x197BE0 - 0x1935B8) @ length: 4628

	.global Img_EfxFenrirOBJ
Img_EfxFenrirOBJ: @ 08197BE0
	.incbin "fe6-base.gba", 0x197BE0, (0x19875C - 0x197BE0) @ length: 0B7C

	.global Pal_EfxFenrirOBJ
Pal_EfxFenrirOBJ: @ 0819875C
	.incbin "fe6-base.gba", 0x19875C, (0x19877C - 0x19875C) @ length: 0020

	.global Pal_EfxFenrirOBJ2
Pal_EfxFenrirOBJ2: @ 0819877C
	.incbin "fe6-base.gba", 0x19877C, 0x20

	.global Img_EfxPurgeBG_0819879C
Img_EfxPurgeBG_0819879C:	@ 0x19879C
	.incbin "fe6-base.gba", 0x19879C, 0x198CF8 - 0x19879C

	.global Img_EfxPurgeBG_08198CF8
Img_EfxPurgeBG_08198CF8:	@ 0x198CF8
	.incbin "fe6-base.gba", 0x198CF8, 0x199374 - 0x198CF8

	.global Img_EfxPurgeBG_08199374
Img_EfxPurgeBG_08199374:	@ 0x199374
	.incbin "fe6-base.gba", 0x199374, 0x1999C0 - 0x199374

	.global Img_EfxPurgeBG_081999C0
Img_EfxPurgeBG_081999C0:	@ 0x1999C0
	.incbin "fe6-base.gba", 0x1999C0, 0x19A174 - 0x1999C0

	.global Img_EfxPurgeBG_0819A174
Img_EfxPurgeBG_0819A174:	@ 0x19A174
	.incbin "fe6-base.gba", 0x19A174, 0x19A87C - 0x19A174

	.global Img_EfxPurgeBG_0819A87C
Img_EfxPurgeBG_0819A87C:	@ 0x19A87C
	.incbin "fe6-base.gba", 0x19A87C, 0x19AD98 - 0x19A87C

	.global Img_EfxPurgeBG_0819AD98
Img_EfxPurgeBG_0819AD98:	@ 0x19AD98
	.incbin "fe6-base.gba", 0x19AD98, 0x19B698 - 0x19AD98

	.global Img_EfxPurgeBG_0819B698
Img_EfxPurgeBG_0819B698:	@ 0x19B698
	.incbin "fe6-base.gba", 0x19B698, 0x19C04C - 0x19B698

	.global Img_EfxPurgeBG_0819C04C
Img_EfxPurgeBG_0819C04C:	@ 0x19C04C
	.incbin "fe6-base.gba", 0x19C04C, 0x19C9C0 - 0x19C04C

	.global Img_EfxPurgeBG_0819C9C0
Img_EfxPurgeBG_0819C9C0:	@ 0x19C9C0
	.incbin "fe6-base.gba", 0x19C9C0, 0x19D394 - 0x19C9C0

	.global Img_EfxPurgeBG_0819D394
Img_EfxPurgeBG_0819D394:	@ 0x19D394
	.incbin "fe6-base.gba", 0x19D394, 0x19E398 - 0x19D394

	.global Img_EfxPurgeBG_0819E398
Img_EfxPurgeBG_0819E398:	@ 0x19E398
	.incbin "fe6-base.gba", 0x19E398, 0x19F1E8 - 0x19E398

	.global Img_EfxPurgeBG_0819F1E8
Img_EfxPurgeBG_0819F1E8:	@ 0x19F1E8
	.incbin "fe6-base.gba", 0x19F1E8, 0x19FCCC - 0x19F1E8

	.global Img_EfxPurgeBG_0819FCCC
Img_EfxPurgeBG_0819FCCC:	@ 0x19FCCC
	.incbin "fe6-base.gba", 0x19FCCC, 0x1A0874 - 0x19FCCC

	.global Img_EfxPurgeBG_081A0874
Img_EfxPurgeBG_081A0874:	@ 0x1A0874
	.incbin "fe6-base.gba", 0x1A0874, 0x1A1410 - 0x1A0874

	.global Img_EfxPurgeBG_081A1410
Img_EfxPurgeBG_081A1410:	@ 0x1A1410
	.incbin "fe6-base.gba", 0x1A1410, 0x1A1ED0 - 0x1A1410

	.global Img_EfxPurgeBG_081A1ED0
Img_EfxPurgeBG_081A1ED0:	@ 0x1A1ED0
	.incbin "fe6-base.gba", 0x1A1ED0, 0x1A2948 - 0x1A1ED0

	.global Img_EfxPurgeBG_081A2948
Img_EfxPurgeBG_081A2948:	@ 0x1A2948
	.incbin "fe6-base.gba", 0x1A2948, 0x1A3C4C - 0x1A2948

	.global Pal_EfxPurgeBG_081A3C4C
Pal_EfxPurgeBG_081A3C4C:	@ 0x1A3C4C
	.incbin "fe6-base.gba", 0x1A3C4C, 0x1A3C6C - 0x1A3C4C

	.global Pal_EfxPurgeBG_081A3C6C
Pal_EfxPurgeBG_081A3C6C:	@ 0x1A3C6C
	.incbin "fe6-base.gba", 0x1A3C6C, 0x20

	.global Tsa_EfxPurgeBG_081A3C8C
Tsa_EfxPurgeBG_081A3C8C:	@ 0x1A3C8C
	.incbin "fe6-base.gba", 0x1A3C8C, 0x1A3DB0 - 0x1A3C8C

	.global Tsa_EfxPurgeBG_081A3DB0
Tsa_EfxPurgeBG_081A3DB0:	@ 0x1A3DB0
	.incbin "fe6-base.gba", 0x1A3DB0, 0x1A3ED0 - 0x1A3DB0

	.global Tsa_EfxPurgeBG_081A3ED0
Tsa_EfxPurgeBG_081A3ED0:	@ 0x1A3ED0
	.incbin "fe6-base.gba", 0x1A3ED0, 0x1A3FDC - 0x1A3ED0

	.global Tsa_EfxPurgeBG_081A3FDC
Tsa_EfxPurgeBG_081A3FDC:	@ 0x1A3FDC
	.incbin "fe6-base.gba", 0x1A3FDC, 0x1A40D8 - 0x1A3FDC

	.global Tsa_EfxPurgeBG_081A40D8
Tsa_EfxPurgeBG_081A40D8:	@ 0x1A40D8
	.incbin "fe6-base.gba", 0x1A40D8, 0x1A41C0 - 0x1A40D8

	.global Tsa_EfxPurgeBG_081A41C0
Tsa_EfxPurgeBG_081A41C0:	@ 0x1A41C0
	.incbin "fe6-base.gba", 0x1A41C0, 0x1A42A8 - 0x1A41C0

	.global Tsa_EfxPurgeBG_081A42A8
Tsa_EfxPurgeBG_081A42A8:	@ 0x1A42A8
	.incbin "fe6-base.gba", 0x1A42A8, 0x1A4388 - 0x1A42A8

	.global Tsa_EfxPurgeBG_081A4388
Tsa_EfxPurgeBG_081A4388:	@ 0x1A4388
	.incbin "fe6-base.gba", 0x1A4388, 0x1A4464 - 0x1A4388

	.global Tsa_EfxPurgeBG_081A4464
Tsa_EfxPurgeBG_081A4464:	@ 0x1A4464
	.incbin "fe6-base.gba", 0x1A4464, 0x1A4544 - 0x1A4464

	.global Tsa_EfxPurgeBG_081A4544
Tsa_EfxPurgeBG_081A4544:	@ 0x1A4544
	.incbin "fe6-base.gba", 0x1A4544, 0x1A4638 - 0x1A4544

	.global Tsa_EfxPurgeBG_081A4638
Tsa_EfxPurgeBG_081A4638:	@ 0x1A4638
	.incbin "fe6-base.gba", 0x1A4638, 0x1A472C - 0x1A4638

	.global Tsa_EfxPurgeBG_081A472C
Tsa_EfxPurgeBG_081A472C:	@ 0x1A472C
	.incbin "fe6-base.gba", 0x1A472C, 0x1A4830 - 0x1A472C

	.global Tsa_EfxPurgeBG_081A4830
Tsa_EfxPurgeBG_081A4830:	@ 0x1A4830
	.incbin "fe6-base.gba", 0x1A4830, 0x1A4938 - 0x1A4830

	.global Tsa_EfxPurgeBG_081A4938
Tsa_EfxPurgeBG_081A4938:	@ 0x1A4938
	.incbin "fe6-base.gba", 0x1A4938, 0x1A4A50 - 0x1A4938

	.global Tsa_EfxPurgeBG_081A4A50
Tsa_EfxPurgeBG_081A4A50:	@ 0x1A4A50
	.incbin "fe6-base.gba", 0x1A4A50, 0x1A4B74 - 0x1A4A50

	.global Tsa_EfxPurgeBG_081A4B74
Tsa_EfxPurgeBG_081A4B74:	@ 0x1A4B74
	.incbin "fe6-base.gba", 0x1A4B74, 0x1A4C88 - 0x1A4B74

	.global Tsa_EfxPurgeBG_081A4C88
Tsa_EfxPurgeBG_081A4C88:	@ 0x1A4C88
	.incbin "fe6-base.gba", 0x1A4C88, 0x1A4DAC - 0x1A4C88

	.global Tsa_EfxPurgeBG_081A4DAC
Tsa_EfxPurgeBG_081A4DAC:	@ 0x1A4DAC
	.incbin "fe6-base.gba", 0x1A4DAC, 0x1A4ED0 - 0x1A4DAC

	.global Tsa_EfxPurgeBG_081A4ED0
Tsa_EfxPurgeBG_081A4ED0:	@ 0x1A4ED0
	.incbin "fe6-base.gba", 0x1A4ED0, 0x1A4FE0 - 0x1A4ED0

	.global Tsa_EfxPurgeBG_081A4FE0
Tsa_EfxPurgeBG_081A4FE0:	@ 0x1A4FE0
	.incbin "fe6-base.gba", 0x1A4FE0, 0x1A50E0 - 0x1A4FE0

	.global Tsa_EfxPurgeBG_081A50E0
Tsa_EfxPurgeBG_081A50E0:	@ 0x1A50E0
	.incbin "fe6-base.gba", 0x1A50E0, 0x1A51C8 - 0x1A50E0

	.global Tsa_EfxPurgeBG_081A51C8
Tsa_EfxPurgeBG_081A51C8:	@ 0x1A51C8
	.incbin "fe6-base.gba", 0x1A51C8, 0x1A52A8 - 0x1A51C8

	.global Tsa_EfxPurgeBG_081A52A8
Tsa_EfxPurgeBG_081A52A8:	@ 0x1A52A8
	.incbin "fe6-base.gba", 0x1A52A8, 0x1A5384 - 0x1A52A8

	.global Tsa_EfxPurgeBG_081A5384
Tsa_EfxPurgeBG_081A5384:	@ 0x1A5384
	.incbin "fe6-base.gba", 0x1A5384, 0x1A5460 - 0x1A5384

	.global Tsa_EfxPurgeBG_081A5460
Tsa_EfxPurgeBG_081A5460:	@ 0x1A5460
	.incbin "fe6-base.gba", 0x1A5460, 0x1A5544 - 0x1A5460

	.global Tsa_EfxPurgeBG_081A5544
Tsa_EfxPurgeBG_081A5544:	@ 0x1A5544
	.incbin "fe6-base.gba", 0x1A5544, 0x1A5638 - 0x1A5544

	.global Tsa_EfxPurgeBG_081A5638
Tsa_EfxPurgeBG_081A5638:	@ 0x1A5638
	.incbin "fe6-base.gba", 0x1A5638, 0x1A5728 - 0x1A5638

	.global Tsa_EfxPurgeBG_081A5728
Tsa_EfxPurgeBG_081A5728:	@ 0x1A5728
	.incbin "fe6-base.gba", 0x1A5728, 0x1A582C - 0x1A5728

	.global Tsa_EfxPurgeBG_081A582C
Tsa_EfxPurgeBG_081A582C:	@ 0x1A582C
	.incbin "fe6-base.gba", 0x1A582C, 0x1A5934 - 0x1A582C

	.global Tsa_EfxPurgeBG_081A5934
Tsa_EfxPurgeBG_081A5934:	@ 0x1A5934
	.incbin "fe6-base.gba", 0x1A5934, 0x1A5A48 - 0x1A5934

	.global Tsa_EfxPurgeBG_081A5A48
Tsa_EfxPurgeBG_081A5A48:	@ 0x1A5A48
	.incbin "fe6-base.gba", 0x1A5A48, 0x1A5B6C - 0x1A5A48

	.global Tsa_EfxPurgeBG_081A5B6C
Tsa_EfxPurgeBG_081A5B6C:	@ 0x1A5B6C
	.incbin "fe6-base.gba", 0x1A5B6C, 0x1A5C80 - 0x1A5B6C

	.global Tsa_EfxPurgeBG_081A5C80
Tsa_EfxPurgeBG_081A5C80:	@ 0x1A5C80
	.incbin "fe6-base.gba", 0x1A5C80, 0x1A5DA4 - 0x1A5C80

	.global Tsa_EfxPurgeBG_081A5DA4
Tsa_EfxPurgeBG_081A5DA4:	@ 0x1A5DA4
	.incbin "fe6-base.gba", 0x1A5DA4, 0x1A5EC4 - 0x1A5DA4

	.global Tsa_EfxPurgeBG_081A5EC4
Tsa_EfxPurgeBG_081A5EC4:	@ 0x1A5EC4
	.incbin "fe6-base.gba", 0x1A5EC4, 0x1A5FD0 - 0x1A5EC4

	.global Tsa_EfxPurgeBG_081A5FD0
Tsa_EfxPurgeBG_081A5FD0:	@ 0x1A5FD0
	.incbin "fe6-base.gba", 0x1A5FD0, 0x1A60CC - 0x1A5FD0

	.global Tsa_EfxPurgeBG_081A60CC
Tsa_EfxPurgeBG_081A60CC:	@ 0x1A60CC
	.incbin "fe6-base.gba", 0x1A60CC, 0x1A61B4 - 0x1A60CC

	.global Tsa_EfxPurgeBG_081A61B4
Tsa_EfxPurgeBG_081A61B4:	@ 0x1A61B4
	.incbin "fe6-base.gba", 0x1A61B4, 0x1A629C - 0x1A61B4

	.global Tsa_EfxPurgeBG_081A629C
Tsa_EfxPurgeBG_081A629C:	@ 0x1A629C
	.incbin "fe6-base.gba", 0x1A629C, 0x1A637C - 0x1A629C

	.global Tsa_EfxPurgeBG_081A637C
Tsa_EfxPurgeBG_081A637C:	@ 0x1A637C
	.incbin "fe6-base.gba", 0x1A637C, 0x1A6458 - 0x1A637C

	.global Tsa_EfxPurgeBG_081A6458
Tsa_EfxPurgeBG_081A6458:	@ 0x1A6458
	.incbin "fe6-base.gba", 0x1A6458, 0x1A6538 - 0x1A6458

	.global Tsa_EfxPurgeBG_081A6538
Tsa_EfxPurgeBG_081A6538:	@ 0x1A6538
	.incbin "fe6-base.gba", 0x1A6538, 0x1A662C - 0x1A6538

	.global Tsa_EfxPurgeBG_081A662C
Tsa_EfxPurgeBG_081A662C:	@ 0x1A662C
	.incbin "fe6-base.gba", 0x1A662C, 0x1A6720 - 0x1A662C

	.global Tsa_EfxPurgeBG_081A6720
Tsa_EfxPurgeBG_081A6720:	@ 0x1A6720
	.incbin "fe6-base.gba", 0x1A6720, 0x1A6824 - 0x1A6720

	.global Tsa_EfxPurgeBG_081A6824
Tsa_EfxPurgeBG_081A6824:	@ 0x1A6824
	.incbin "fe6-base.gba", 0x1A6824, 0x1A692C - 0x1A6824

	.global Tsa_EfxPurgeBG_081A692C
Tsa_EfxPurgeBG_081A692C:	@ 0x1A692C
	.incbin "fe6-base.gba", 0x1A692C, 0x1A6A44 - 0x1A692C

	.global Tsa_EfxPurgeBG_081A6A44
Tsa_EfxPurgeBG_081A6A44:	@ 0x1A6A44
	.incbin "fe6-base.gba", 0x1A6A44, 0x1A6B68 - 0x1A6A44

	.global Tsa_EfxPurgeBG_081A6B68
Tsa_EfxPurgeBG_081A6B68:	@ 0x1A6B68
	.incbin "fe6-base.gba", 0x1A6B68, 0x1A6C78 - 0x1A6B68

	.global Tsa_EfxPurgeBG_081A6C78
Tsa_EfxPurgeBG_081A6C78:	@ 0x1A6C78
	.incbin "fe6-base.gba", 0x1A6C78, 0x1A6E8C - 0x1A6C78

	.global Tsa_EfxPurgeBG_081A6E8C
Tsa_EfxPurgeBG_081A6E8C:	@ 0x1A6E8C
	.incbin "fe6-base.gba", 0x1A6E8C, 0x1A7048 - 0x1A6E8C

	.global Tsa_EfxPurgeBG_081A7048
Tsa_EfxPurgeBG_081A7048:	@ 0x1A7048
	.incbin "fe6-base.gba", 0x1A7048, 0x1A7224 - 0x1A7048

	.global Tsa_EfxPurgeBG_081A7224
Tsa_EfxPurgeBG_081A7224:	@ 0x1A7224
	.incbin "fe6-base.gba", 0x1A7224, 0x1A7428 - 0x1A7224

	.global Tsa_EfxPurgeBG_081A7428
Tsa_EfxPurgeBG_081A7428:	@ 0x1A7428
	.incbin "fe6-base.gba", 0x1A7428, 0x1A7630 - 0x1A7428

	.global Tsa_EfxPurgeBG_081A7630
Tsa_EfxPurgeBG_081A7630:	@ 0x1A7630
	.incbin "fe6-base.gba", 0x1A7630, 0x1A7844 - 0x1A7630

	.global Tsa_EfxPurgeBG_081A7844
Tsa_EfxPurgeBG_081A7844:	@ 0x1A7844
	.incbin "fe6-base.gba", 0x1A7844, 0x1A7AA4 - 0x1A7844

	.global Tsa_EfxPurgeBG_081A7AA4
Tsa_EfxPurgeBG_081A7AA4:	@ 0x1A7AA4
	.incbin "fe6-base.gba", 0x1A7AA4, 0x1A7CD8 - 0x1A7AA4

	.global Tsa_EfxPurgeBG_081A7CD8
Tsa_EfxPurgeBG_081A7CD8:	@ 0x1A7CD8
	.incbin "fe6-base.gba", 0x1A7CD8, 0x1A7F4C - 0x1A7CD8

	.global Tsa_EfxPurgeBG_081A7F4C
Tsa_EfxPurgeBG_081A7F4C:	@ 0x1A7F4C
	.incbin "fe6-base.gba", 0x1A7F4C, 0x1A8194 - 0x1A7F4C

	.global Tsa_EfxPurgeBG_081A8194
Tsa_EfxPurgeBG_081A8194:	@ 0x1A8194
	.incbin "fe6-base.gba", 0x1A8194, 0x1A84F4 - 0x1A8194

	.global Tsa_EfxPurgeBG_081A84F4
Tsa_EfxPurgeBG_081A84F4:	@ 0x1A84F4
	.incbin "fe6-base.gba", 0x1A84F4, 0x1A8848 - 0x1A84F4

	.global Tsa_EfxPurgeBG_081A8848
Tsa_EfxPurgeBG_081A8848:	@ 0x1A8848
	.incbin "fe6-base.gba", 0x1A8848, 0x1A8B58 - 0x1A8848

	.global Tsa_EfxPurgeBG_081A8B58
Tsa_EfxPurgeBG_081A8B58:	@ 0x1A8B58
	.incbin "fe6-base.gba", 0x1A8B58, 0x1A8E3C - 0x1A8B58

	.global Tsa_EfxPurgeBG_081A8E3C
Tsa_EfxPurgeBG_081A8E3C:	@ 0x1A8E3C
	.incbin "fe6-base.gba", 0x1A8E3C, 0x1A910C - 0x1A8E3C

	.global Tsa_EfxPurgeBG_081A910C
Tsa_EfxPurgeBG_081A910C:	@ 0x1A910C
	.incbin "fe6-base.gba", 0x1A910C, 0x1A93A4 - 0x1A910C

	.global Tsa_EfxPurgeBG_081A93A4
Tsa_EfxPurgeBG_081A93A4:	@ 0x1A93A4
	.incbin "fe6-base.gba", 0x1A93A4, 0x1A963C - 0x1A93A4

	.global Tsa_EfxPurgeBG_081A963C
Tsa_EfxPurgeBG_081A963C:	@ 0x1A963C
	.incbin "fe6-base.gba", 0x1A963C, 0x1A9868 - 0x1A963C

	.global Tsa_EfxPurgeBG_081A9868
Tsa_EfxPurgeBG_081A9868:	@ 0x1A9868
	.incbin "fe6-base.gba", 0x1A9868, 0x1A9B1C - 0x1A9868

	.global Tsa_EfxPurgeBG_081A9B1C
Tsa_EfxPurgeBG_081A9B1C:	@ 0x1A9B1C
	.incbin "fe6-base.gba", 0x1A9B1C, 0x1A9DDC - 0x1A9B1C

	.global Tsa_EfxPurgeBG_081A9DDC
Tsa_EfxPurgeBG_081A9DDC:	@ 0x1A9DDC
	.incbin "fe6-base.gba", 0x1A9DDC, 0x1AA10C - 0x1A9DDC

	.global Tsa_EfxPurgeBG_081AA10C
Tsa_EfxPurgeBG_081AA10C:	@ 0x1AA10C
	.incbin "fe6-base.gba", 0x1AA10C, 0x1AA45C - 0x1AA10C

	.global Tsa_EfxPurgeBG_081AA45C
Tsa_EfxPurgeBG_081AA45C:	@ 0x1AA45C
	.incbin "fe6-base.gba", 0x1AA45C, 0x1AA7D4 - 0x1AA45C

	.global Tsa_EfxPurgeBG_081AA7D4
Tsa_EfxPurgeBG_081AA7D4:	@ 0x1AA7D4
	.incbin "fe6-base.gba", 0x1AA7D4, 0x1AAB5C - 0x1AA7D4

	.global Tsa_EfxPurgeBG_081AAB5C
Tsa_EfxPurgeBG_081AAB5C:	@ 0x1AAB5C
	.incbin "fe6-base.gba", 0x1AAB5C, 0x1AAECC - 0x1AAB5C

	.global Img_EfxPurgeOBJ
Img_EfxPurgeOBJ: @ 081AAECC
	.incbin "fe6-base.gba", 0x1AAECC, (0x1AB190 - 0x1AAECC) @ length: 02C4

	.global Pal_EfxPurgeOBJ
Pal_EfxPurgeOBJ: @ 081AB190
	.incbin "fe6-base.gba", 0x1AB190, (0x1AB1B0 - 0x1AB190) @ length: 0020

	.global TsaArray_EfxLiveBG_B_R
TsaArray_EfxLiveBG_B_R: @ 081AB1B0
	.incbin "fe6-base.gba", 0x1AB1B0, (0x1AB340 - 0x1AB1B0) @ length: 0190

	.global TsaArray_EfxLiveBG_B_L
TsaArray_EfxLiveBG_B_L: @ 081AB340
	.incbin "fe6-base.gba", 0x1AB340, (0x1ABCA0 - 0x1AB340) @ length: 0960

	.global PalArray1_EfxLiveBGCOL
PalArray1_EfxLiveBGCOL: @ 081ABCA0
	.incbin "fe6-base.gba", 0x1ABCA0, (0x1ABEA0 - 0x1ABCA0) @ length: 0200

	.global Img_EfxLiveOBJ
Img_EfxLiveOBJ: @ 081ABEA0
	.incbin "fe6-base.gba", 0x1ABEA0, (0x1AC0F4 - 0x1ABEA0) @ length: 0254

	.global Pal_EfxFimbulvetrOBJ
Pal_EfxFimbulvetrOBJ: @ 081AC0F4
	.incbin "fe6-base.gba", 0x1AC0F4, (0x1AC114 - 0x1AC0F4) @ length: 0020

	.global Img_EfxLiveBG
Img_EfxLiveBG: @ 081AC114
	.incbin "fe6-base.gba", 0x1AC114, (0x1AC90C - 0x1AC114) @ length: 07F8

	.global TsaArray_EfxLiveBG_A_L
TsaArray_EfxLiveBG_A_L: @ 081AC90C
	.incbin "fe6-base.gba", 0x1AC90C, (0x1AD26C - 0x1AC90C) @ length: 0960

	.global TsaArray_EfxLiveBG_A_R
TsaArray_EfxLiveBG_A_R: @ 081AD26C
	.incbin "fe6-base.gba", 0x1AD26C, (0x1ADBCC - 0x1AD26C) @ length: 0960

	.global PalArray3_EfxLiveBGCOL
PalArray3_EfxLiveBGCOL: @ 081ADBCC
	.incbin "fe6-base.gba", 0x1ADBCC, (0x1ADDEC - 0x1ADBCC) @ length: 0220

	.global PalArray2_EfxLiveBGCOL
PalArray2_EfxLiveBGCOL: @ 081ADDEC
	.incbin "fe6-base.gba", 0x1ADDEC, (0x1AE88C - 0x1ADDEC) @ length: 0AA0

	.global gUnk_081AE88C
gUnk_081AE88C: @ 081AE88C
	.incbin "fe6-base.gba", 0x1AE88C, (0x1AEA8C - 0x1AE88C) @ length: 0200

	.global gUnk_081AEA8C
gUnk_081AEA8C: @ 081AEA8C
	.incbin "fe6-base.gba", 0x1AEA8C, (0x1AEC8C - 0x1AEA8C) @ length: 0200

	.global gUnk_081AEC8C
gUnk_081AEC8C: @ 081AEC8C
	.incbin "fe6-base.gba", 0x1AEC8C, (0x1B1710 - 0x1AEC8C) @ length: 2A84

	.global Pal_Unk_081B1710
Pal_Unk_081B1710: @ 081B1710
	.incbin "fe6-base.gba", 0x1B1710, (0x1B2348 - 0x1B1710) @ length: 0C38

	.global gUnk_081B2348
gUnk_081B2348: @ 081B2348
	.incbin "fe6-base.gba", 0x1B2348, (0x1B3D34 - 0x1B2348) @ length: 19EC

	.global gUnk_081B3D34
gUnk_081B3D34: @ 081B3D34
	.incbin "fe6-base.gba", 0x1B3D34, (0x1B4254 - 0x1B3D34) @ length: 0520

	.global gUnk_081B4254
gUnk_081B4254: @ 081B4254
	.incbin "fe6-base.gba", 0x1B4254, (0x1B4274 - 0x1B4254) @ length: 0020

	.global gUnk_081B4274
gUnk_081B4274: @ 081B4274
	.incbin "fe6-base.gba", 0x1B4274, (0x1B4E9C - 0x1B4274) @ length: 0C28

	.global gUnk_081B4E9C
gUnk_081B4E9C: @ 081B4E9C
	.incbin "fe6-base.gba", 0x1B4E9C, (0x1B4F9C - 0x1B4E9C) @ length: 0100

	.global gUnk_081B4F9C
gUnk_081B4F9C: @ 081B4F9C
	.incbin "fe6-base.gba", 0x1B4F9C, (0x1B57BC - 0x1B4F9C) @ length: 0820

	.global gUnk_081B57BC
gUnk_081B57BC: @ 081B57BC
	.incbin "fe6-base.gba", 0x1B57BC, (0x1B6688 - 0x1B57BC) @ length: 0ECC

	.global gUnk_081B6688
gUnk_081B6688: @ 081B6688
	.incbin "fe6-base.gba", 0x1B6688, (0x1B7468 - 0x1B6688) @ length: 0DE0

	.global gUnk_081B7468
gUnk_081B7468: @ 081B7468
	.incbin "fe6-base.gba", 0x1B7468, (0x1B7650 - 0x1B7468) @ length: 01E8

	.global gUnk_081B7650
gUnk_081B7650: @ 081B7650
	.incbin "fe6-base.gba", 0x1B7650, (0x1B7670 - 0x1B7650) @ length: 0020

	.global gUnk_081B7670
gUnk_081B7670: @ 081B7670
	.incbin "fe6-base.gba", 0x1B7670, (0x1B7690 - 0x1B7670) @ length: 0020

	.global gUnk_081B7690
gUnk_081B7690: @ 081B7690
	.incbin "fe6-base.gba", 0x1B7690, (0x1B76B0 - 0x1B7690) @ length: 0020

	.global gUnk_081B76B0
gUnk_081B76B0: @ 081B76B0
	.incbin "fe6-base.gba", 0x1B76B0, (0x1B7B48 - 0x1B76B0) @ length: 0498

	.global gUnk_081B7B48
gUnk_081B7B48: @ 081B7B48
	.incbin "fe6-base.gba", 0x1B7B48, (0x1B7F68 - 0x1B7B48) @ length: 0420

	.global gUnk_081B7F68
gUnk_081B7F68: @ 081B7F68
	.incbin "fe6-base.gba", 0x1B7F68, (0x1B80A8 - 0x1B7F68) @ length: 0140

	.global gUnk_081B80A8
gUnk_081B80A8: @ 081B80A8
	.incbin "fe6-base.gba", 0x1B80A8, (0x1B8934 - 0x1B80A8) @ length: 088C

	.global gUnk_081B8934
gUnk_081B8934: @ 081B8934
	.incbin "fe6-base.gba", 0x1B8934, (0x1B8E44 - 0x1B8934) @ length: 0510

	.global gUnk_081B8E44
gUnk_081B8E44: @ 081B8E44
	.incbin "fe6-base.gba", 0x1B8E44, (0x1B8E64 - 0x1B8E44) @ length: 0020

	.global Img_EfxAureolaBG2
Img_EfxAureolaBG2: @ 081B8E64
	.incbin "fe6-base.gba", 0x1B8E64, (0x1BB35C - 0x1B8E64) @ length: 24F8

	.global Pal_EfxAureolaBG
Pal_EfxAureolaBG: @ 081BB35C
	.incbin "fe6-base.gba", 0x1BB35C, (0x1BB37C - 0x1BB35C) @ length: 0020

	.global Pal_EfxAureolaBG2
Pal_EfxAureolaBG2: @ 081BB37C
	.incbin "fe6-base.gba", 0x1BB37C, (0x1BB5E4 - 0x1BB37C) @ length: 0268

	.global Tsa_EfxAureolaBG2
Tsa_EfxAureolaBG2: @ 081BB5E4
	.incbin "fe6-base.gba", 0x1BB5E4, (0x1BBBB4 - 0x1BB5E4) @ length: 05D0

	.global Img_EfxAureolaOBJ
Img_EfxAureolaOBJ: @ 081BBBB4
	.incbin "fe6-base.gba", 0x1BBBB4, (0x1BC0A8 - 0x1BBBB4) @ length: 04F4

	.global Pal_EfxAureolaOBJ
Pal_EfxAureolaOBJ: @ 081BC0A8
	.incbin "fe6-base.gba", 0x1BC0A8, (0x1BC0C8 - 0x1BC0A8) @ length: 0020

	.global FrameArray_EkrManaketefxNormalAttack
FrameArray_EkrManaketefxNormalAttack: @ 081BC0C8
	.short 0, 3
	.short 1, 3
	.short 2, 3
	.short 3, 3
	.short 4, 3
	.short 5, 3
	.short 6, 3
	.short 7, 3
	.short 8, 3
	.short -2

	.global FrameArray_EkrManaketefxCriticalAttack
FrameArray_EkrManaketefxCriticalAttack: @ 081BC0EE
	.short 9, 2
	.short 10, 2
	.short 11, 10
	.short -1

	.global FrameArray_EkrFaefx
FrameArray_EkrFaefx: @ 081BC0FC
	.incbin "fe6-base.gba", 0x1BC0FC, (0x1BC132 - 0x1BC0FC) @ length: 0036

	.global gUnk_081BC132
gUnk_081BC132: @ 081BC132
	.incbin "fe6-base.gba", 0x1BC132, (0x1BC140 - 0x1BC132) @ length: 000E

	.global gUnk_081BC140
gUnk_081BC140: @ 081BC140
	.incbin "fe6-base.gba", 0x1BC140, (0x1BC15E - 0x1BC140) @ length: 001E

	.global gUnk_081BC15E
gUnk_081BC15E: @ 081BC15E
	.incbin "fe6-base.gba", 0x1BC15E, (0x1BC17C - 0x1BC15E) @ length: 001E

	.global gUnk_081BC17C
gUnk_081BC17C: @ 081BC17C
	.incbin "fe6-base.gba", 0x1BC17C, (0x1BC19A - 0x1BC17C) @ length: 001E

	.global gUnk_081BC19A
gUnk_081BC19A: @ 081BC19A
	.incbin "fe6-base.gba", 0x1BC19A, (0x1BC268 - 0x1BC19A) @ length: 00CE

	.global Img_ManaketeBodyIntro2
Img_ManaketeBodyIntro2: @ 081BC268
	.incbin "fe6-base.gba", 0x1BC268, (0x1BCBDC - 0x1BC268) @ length: 0974

	.global Img_ManaketeBodyIntro1
Img_ManaketeBodyIntro1: @ 081BCBDC
	.incbin "fe6-base.gba", 0x1BCBDC, (0x1BD5E8 - 0x1BCBDC) @ length: 0A0C

	.global Img_ManaketeBodyStd
Img_ManaketeBodyStd: @ 081BD5E8
	.incbin "fe6-base.gba", 0x1BD5E8, (0x1BE490 - 0x1BD5E8) @ length: 0EA8

	.global Img_081BE490
Img_081BE490: @ 081BE490
	.incbin "fe6-base.gba", 0x1BE490, (0x1BF434 - 0x1BE490) @ length: 0FA4

	.global Pal_EkrManaketefx
Pal_EkrManaketefx: @ 081BF434
	.incbin "fe6-base.gba", 0x1BF434, (0x1BF5B4 - 0x1BF434) @ length: 0180

	.global Tsa_ManaketeBodyIntro2
Tsa_ManaketeBodyIntro2: @ 081BF5B4
	.incbin "fe6-base.gba", 0x1BF5B4, (0x1BF6F4 - 0x1BF5B4) @ length: 0140

	.global Tsa_ManaketeBodyIntro1
Tsa_ManaketeBodyIntro1: @ 081BF6F4
	.incbin "fe6-base.gba", 0x1BF6F4, (0x1BF848 - 0x1BF6F4) @ length: 0154

	.global Tsa_ManaketeBodyStd
Tsa_ManaketeBodyStd: @ 081BF848
	.incbin "fe6-base.gba", 0x1BF848, (0x1BFA34 - 0x1BF848) @ length: 01EC

	.global Tsa_081BFA34
Tsa_081BFA34: @ 081BFA34
	.incbin "fe6-base.gba", 0x1BFA34, (0x1BFC74 - 0x1BFA34) @ length: 0240

	.global Img_ManaketeObjfx1
Img_ManaketeObjfx1: @ 081BFC74
	.incbin "fe6-base.gba", 0x1BFC74, (0x1C079C - 0x1BFC74) @ length: 0B28

	.global Img_ManaketeObjfx2
Img_ManaketeObjfx2: @ 081C079C
	.incbin "fe6-base.gba", 0x1C079C, (0x1C14D0 - 0x1C079C) @ length: 0D34

	.global Img_ManaketeObjfx3
Img_ManaketeObjfx3: @ 081C14D0
	.incbin "fe6-base.gba", 0x1C14D0, (0x1C1C74 - 0x1C14D0) @ length: 07A4

	.global Pal_ManaketeBodyStd
Pal_ManaketeBodyStd: @ 081C1C74
	.incbin "fe6-base.gba", 0x1C1C74, (0x1C1C94 - 0x1C1C74) @ length: 0020

	.global Img_EkrIdunn_081C1C94
Img_EkrIdunn_081C1C94: @ 081C1C94
	.incbin "fe6-base.gba", 0x1C1C94, (0x1C4DE8 - 0x1C1C94) @ length: 3154

	.global Pal_081C4DE8
Pal_081C4DE8: @ 081C4DE8
	.incbin "fe6-base.gba", 0x1C4DE8, (0x1C4E28 - 0x1C4DE8) @ length: 0040

	.global Tsa_EkrIdunn_081C4E28
Tsa_EkrIdunn_081C4E28: @ 081C4E28
	.incbin "fe6-base.gba", 0x1C4E28, (0x1C5264 - 0x1C4E28) @ length: 043C

	.global Tsa_EkrIdunn_081C5264
Tsa_EkrIdunn_081C5264: @ 081C5264
	.incbin "fe6-base.gba", 0x1C5264, (0x1C5688 - 0x1C5264) @ length: 0424

	.global Tsa_EkrIdunn_081C5688
Tsa_EkrIdunn_081C5688: @ 081C5688
	.incbin "fe6-base.gba", 0x1C5688, (0x1C5AAC - 0x1C5688) @ length: 0424

	.global Tsa_EkrIdunn_081C5AAC
Tsa_EkrIdunn_081C5AAC: @ 081C5AAC
	.incbin "fe6-base.gba", 0x1C5AAC, (0x1C864C - 0x1C5AAC) @ length: 2BA0

	.global Img_EkrFaefx
Img_EkrFaefx: @ 081C864C
	.incbin "fe6-base.gba", 0x1C864C, (0x1C8F38 - 0x1C864C) @ length: 08EC

	.global Pal_EkrFaefx
Pal_EkrFaefx: @ 081C8F38
	.incbin "fe6-base.gba", 0x1C8F38, (0x1C8F58 - 0x1C8F38) @ length: 0F90

	.global Tsa_EkrFaefx1
Tsa_EkrFaefx1:
	.incbin "fe6-base.gba", 0x1C8F58, (0x1C9084 - 0x1C8F58)

	.global Tsa_EkrFaefx2
Tsa_EkrFaefx2:
	.incbin "fe6-base.gba", 0x1C9084, (0x1C91CC - 0x1C9084)

	.global Tsa_EkrFaefx3
Tsa_EkrFaefx3:
	.incbin "fe6-base.gba", 0x1C91CC, (0x1C92F8 - 0x1C91CC)

	.global Tsa_EkrFaefx4
Tsa_EkrFaefx4:
	.incbin "fe6-base.gba", 0x1C92F8, (0x1C946C - 0x1C92F8)

	.global Tsa_EkrFaefx5
Tsa_EkrFaefx5:
	.incbin "fe6-base.gba", 0x1C946C, (0x1C9618 - 0x1C946C)

	.global Tsa_EkrFaefx6
Tsa_EkrFaefx6:
	.incbin "fe6-base.gba", 0x1C9618, (0x1C9794 - 0x1C9618)

	.global Tsa_EkrFaefx7
Tsa_EkrFaefx7:
	.incbin "fe6-base.gba", 0x1C9794, (0x1C9940 - 0x1C9794)

	.global Tsa_EkrFaefx8
Tsa_EkrFaefx8:
	.incbin "fe6-base.gba", 0x1C9940, (0x1C9A9C - 0x1C9940)

	.global Tsa_EkrFaefx9
Tsa_EkrFaefx9:
	.incbin "fe6-base.gba", 0x1C9A9C, (0x1C9BB8 - 0x1C9A9C)

	.global Tsa_EkrFaefx10
Tsa_EkrFaefx10:
	.incbin "fe6-base.gba", 0x1C9BB8, (0x1C9CE4 - 0x1C9BB8)

	.global Tsa_EkrFaefx11
Tsa_EkrFaefx11:
	.incbin "fe6-base.gba", 0x1C9CE4, (0x1C9DEC - 0x1C9CE4)

	.global Tsa_EkrFaefx12
Tsa_EkrFaefx12:
	.incbin "fe6-base.gba", 0x1C9DEC, (0x1C9EC8 - 0x1C9DEC)
