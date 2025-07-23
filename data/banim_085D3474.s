	.include "animscr.inc"
	.include "gba_sprites.inc"
	.section .data

	.global TSAs_EfxNormalEffectBG
TSAs_EfxNormalEffectBG: @ 085D3524
	.incbin "fe6-base.gba", 0x5D3524, (0x5D354C - 0x5D3524) @ length: 0028

	.global ProcScr_EfxYushaSpinShield
ProcScr_EfxYushaSpinShield: @ 085D354C
	.incbin "fe6-base.gba", 0x5D354C, (0x5D3564 - 0x5D354C) @ length: 0018

	.global ProcScr_EfxYushaSpinShieldOBJ
ProcScr_EfxYushaSpinShieldOBJ: @ 085D3564
	.incbin "fe6-base.gba", 0x5D3564, (0x5D3594 - 0x5D3564) @ length: 0030

	.global gUnk_085D3594
gUnk_085D3594: @ 085D3594
	.incbin "fe6-base.gba", 0x5D3594, (0x5D35AC - 0x5D3594) @ length: 0018

	.global gUnk_085D35AC
gUnk_085D35AC: @ 085D35AC
	.incbin "fe6-base.gba", 0x5D35AC, (0x5D35E4 - 0x5D35AC) @ length: 0038

	.global gUnk_085D35E4
gUnk_085D35E4: @ 085D35E4
	.incbin "fe6-base.gba", 0x5D35E4, (0x5D361C - 0x5D35E4) @ length: 0038

	.global gUnk_085D361C
gUnk_085D361C: @ 085D361C
	.incbin "fe6-base.gba", 0x5D361C, (0x5D3634 - 0x5D361C) @ length: 0018

	.global gUnk_085D3634
gUnk_085D3634: @ 085D3634
	.incbin "fe6-base.gba", 0x5D3634, (0x5D364C - 0x5D3634) @ length: 0018

	.global gUnk_085D364C
gUnk_085D364C: @ 085D364C
	.incbin "fe6-base.gba", 0x5D364C, (0x5D3664 - 0x5D364C) @ length: 0018

	.global gUnk_085D3664
gUnk_085D3664: @ 085D3664
	.incbin "fe6-base.gba", 0x5D3664, (0x5D36A4 - 0x5D3664) @ length: 0040

	.global gUnk_085D36A4
gUnk_085D36A4: @ 085D36A4
	.incbin "fe6-base.gba", 0x5D36A4, (0x5D36BC - 0x5D36A4) @ length: 0018

	.global gUnk_085D36BC
gUnk_085D36BC: @ 085D36BC
	.incbin "fe6-base.gba", 0x5D36BC, (0x5D36D4 - 0x5D36BC) @ length: 0018

	.global gUnk_085D36D4
gUnk_085D36D4: @ 085D36D4
	.incbin "fe6-base.gba", 0x5D36D4, (0x5D36EC - 0x5D36D4) @ length: 0018

	.global gUnk_085D36EC
gUnk_085D36EC: @ 085D36EC
	.incbin "fe6-base.gba", 0x5D36EC, (0x5D3704 - 0x5D36EC) @ length: 0018

	.global gUnk_085D3704
gUnk_085D3704: @ 085D3704
	.incbin "fe6-base.gba", 0x5D3704, (0x5D371C - 0x5D3704) @ length: 0018

	.global gUnk_085D371C
gUnk_085D371C: @ 085D371C
	.incbin "fe6-base.gba", 0x5D371C, (0x5D373C - 0x5D371C) @ length: 0020

	.global gUnk_085D373C
gUnk_085D373C: @ 085D373C
	.incbin "fe6-base.gba", 0x5D373C, (0x5D3754 - 0x5D373C) @ length: 0018

	.global gUnk_085D3754
gUnk_085D3754: @ 085D3754
	.incbin "fe6-base.gba", 0x5D3754, (0x5D376C - 0x5D3754) @ length: 0018

	.global gUnk_085D376C
gUnk_085D376C: @ 085D376C
	.incbin "fe6-base.gba", 0x5D376C, (0x5D3784 - 0x5D376C) @ length: 0018

	.global gUnk_085D3784
gUnk_085D3784: @ 085D3784
	.incbin "fe6-base.gba", 0x5D3784, (0x5D379C - 0x5D3784) @ length: 0018

	.global gUnk_085D379C
gUnk_085D379C: @ 085D379C
	.incbin "fe6-base.gba", 0x5D379C, (0x5D37B4 - 0x5D379C) @ length: 0018

	.global gUnk_085D37B4
gUnk_085D37B4: @ 085D37B4
	.incbin "fe6-base.gba", 0x5D37B4, (0x5D38A4 - 0x5D37B4) @ length: 00F0

	.global gUnk_085D38A4
gUnk_085D38A4: @ 085D38A4
	.incbin "fe6-base.gba", 0x5D38A4, (0x5D38BC - 0x5D38A4) @ length: 0018

	.global gUnk_085D38BC
gUnk_085D38BC: @ 085D38BC
	.incbin "fe6-base.gba", 0x5D38BC, (0x5D38D4 - 0x5D38BC) @ length: 0018

	.global gUnk_085D38D4
gUnk_085D38D4: @ 085D38D4
	.incbin "fe6-base.gba", 0x5D38D4, (0x5D38E4 - 0x5D38D4) @ length: 0010

	.global gUnk_085D38E4
gUnk_085D38E4: @ 085D38E4
	.incbin "fe6-base.gba", 0x5D38E4, (0x5D3904 - 0x5D38E4) @ length: 0020

	.global gUnk_085D3904
gUnk_085D3904: @ 085D3904
	.incbin "fe6-base.gba", 0x5D3904, (0x5D3924 - 0x5D3904) @ length: 0020

	.global gUnk_085D3924
gUnk_085D3924: @ 085D3924
	.incbin "fe6-base.gba", 0x5D3924, (0x5D394C - 0x5D3924) @ length: 0028

	.global gUnk_085D394C
gUnk_085D394C: @ 085D394C
	.incbin "fe6-base.gba", 0x5D394C, (0x5D3964 - 0x5D394C) @ length: 0018

	.global gUnk_085D3964
gUnk_085D3964: @ 085D3964
	.incbin "fe6-base.gba", 0x5D3964, (0x5D3994 - 0x5D3964) @ length: 0030

	.global gUnk_085D3994
gUnk_085D3994: @ 085D3994
	.incbin "fe6-base.gba", 0x5D3994, (0x5D39AC - 0x5D3994) @ length: 0018

	.global gUnk_085D39AC
gUnk_085D39AC: @ 085D39AC
	.incbin "fe6-base.gba", 0x5D39AC, (0x5D39D4 - 0x5D39AC) @ length: 0028

	.global gUnk_085D39D4
gUnk_085D39D4: @ 085D39D4
	.incbin "fe6-base.gba", 0x5D39D4, (0x5D39EC - 0x5D39D4) @ length: 0018

	.global gUnk_085D39EC
gUnk_085D39EC: @ 085D39EC
	.incbin "fe6-base.gba", 0x5D39EC, (0x5D39F4 - 0x5D39EC) @ length: 0008

	.global gUnk_085D39F4
gUnk_085D39F4: @ 085D39F4
	.incbin "fe6-base.gba", 0x5D39F4, (0x5D3A14 - 0x5D39F4) @ length: 0020

	.global gUnk_085D3A14
gUnk_085D3A14: @ 085D3A14
	.incbin "fe6-base.gba", 0x5D3A14, (0x5D3A2C - 0x5D3A14) @ length: 0018

	.global gUnk_085D3A2C
gUnk_085D3A2C: @ 085D3A2C
	.incbin "fe6-base.gba", 0x5D3A2C, (0x5D3A54 - 0x5D3A2C) @ length: 0028

	.global gUnk_085D3A54
gUnk_085D3A54: @ 085D3A54
	.incbin "fe6-base.gba", 0x5D3A54, (0x5D3A6C - 0x5D3A54) @ length: 0018

	.global gUnk_085D3A6C
gUnk_085D3A6C: @ 085D3A6C
	.incbin "fe6-base.gba", 0x5D3A6C, (0x5D3A70 - 0x5D3A6C) @ length: 0004

	.global gUnk_085D3A70
gUnk_085D3A70: @ 085D3A70
	.incbin "fe6-base.gba", 0x5D3A70, (0x5D3A90 - 0x5D3A70) @ length: 0020

	.global gUnk_085D3A90
gUnk_085D3A90: @ 085D3A90
	.incbin "fe6-base.gba", 0x5D3A90, (0x5D3AB0 - 0x5D3A90) @ length: 0020

	.global gUnk_085D3AB0
gUnk_085D3AB0: @ 085D3AB0
	.incbin "fe6-base.gba", 0x5D3AB0, (0x5D3DB0 - 0x5D3AB0) @ length: 0300

	.global AnimScr_TeonoObjCloseRight
AnimScr_TeonoObjCloseRight: @ 085D3DB0
	.incbin "fe6-base.gba", 0x5D3DB0, (0x5D3E0C - 0x5D3DB0) @ length: 005C

	.global AnimScr_TeonoObjFarRight
AnimScr_TeonoObjFarRight: @ 085D3E0C
	.incbin "fe6-base.gba", 0x5D3E0C, (0x5D3E2C - 0x5D3E0C) @ length: 0020

	.global AnimScr_TeonoObj2Right
AnimScr_TeonoObj2Right: @ 085D3E2C
	.incbin "fe6-base.gba", 0x5D3E2C, (0x5D4148 - 0x5D3E2C) @ length: 031C

	.global AnimScr_TeonoObjCloseLeft
AnimScr_TeonoObjCloseLeft: @ 085D4148
	.incbin "fe6-base.gba", 0x5D4148, (0x5D41A4 - 0x5D4148) @ length: 005C

	.global AnimScr_TeonoObjFarLeft
AnimScr_TeonoObjFarLeft: @ 085D41A4
	.incbin "fe6-base.gba", 0x5D41A4, (0x5D41C4 - 0x5D41A4) @ length: 0020

	.global AnimScr_TeonoObj2Left
AnimScr_TeonoObj2Left: @ 085D41C4
	.incbin "fe6-base.gba", 0x5D41C4, (0x5D4264 - 0x5D41C4) @ length: 00A0

	.global AnimScr_ArrowCloseRight
AnimScr_ArrowCloseRight: @ 085D4264
	.incbin "fe6-base.gba", 0x5D4264, (0x5D4274 - 0x5D4264) @ length: 0010

	.global AnimScr_ArrowFarRight
AnimScr_ArrowFarRight: @ 085D4274
	.incbin "fe6-base.gba", 0x5D4274, 0x10

.global AnimSprite_ArrowLeft1
AnimSprite_ArrowLeft1:
        ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0000, 45, -14
        ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0002, 37, -14
        ANIM_SPRITE_END
.global AnimSprite_ArrowLeft2
AnimSprite_ArrowLeft2:
        ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0000, 77, -14
        ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0002, 69, -14
        ANIM_SPRITE_END
.global AnimSprite_ArrowLeft3
AnimSprite_ArrowLeft3:
        ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0000, 109, -14
        ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0002, 101, -14
        ANIM_SPRITE_END

	.global AnimScr_ArrowCloseLeft
AnimScr_ArrowCloseLeft: @ 085D42F0
    ANIMSCR_FORCE_SPRITE AnimSprite_ArrowLeft1, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_ArrowLeft2, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_ArrowLeft3, 1
    ANIMSCR_BLOCKED

	.global AnimScr_ArrowFarLeft
AnimScr_ArrowFarLeft: @ 085D4300
    ANIMSCR_FORCE_SPRITE AnimSprite_ArrowLeft1, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_ArrowLeft2, 1
    ANIMSCR_FORCE_SPRITE AnimSprite_ArrowLeft3, 1
    ANIMSCR_BLOCKED

	.incbin "fe6-base.gba", 0x5D4310, (0x5D44E4 - 0x5D4310)

	.global AnimScr_EfxTeyariObjType0Right
AnimScr_EfxTeyariObjType0Right: @ 085D44E4
	.incbin "fe6-base.gba", 0x5D44E4, (0x5D4738 - 0x5D44E4) @ length: 0254

	.global AnimScr_EfxTeyariObjType0Left
AnimScr_EfxTeyariObjType0Left: @ 085D4738
	.incbin "fe6-base.gba", 0x5D4738, (0x5D4998 - 0x5D4738) @ length: 0260

	.global AnimScr_EfxTeyariObjType1Right
AnimScr_EfxTeyariObjType1Right: @ 085D4998
	.incbin "fe6-base.gba", 0x5D4998, (0x5D4BF8 - 0x5D4998) @ length: 0260

	.global AnimScr_EfxTeyariObjType1Left
AnimScr_EfxTeyariObjType1Left: @ 085D4BF8
	.incbin "fe6-base.gba", 0x5D4BF8, (0x5D4CFC - 0x5D4BF8) @ length: 0104

	.global gUnk_085D4CFC
gUnk_085D4CFC: @ 085D4CFC
	.incbin "fe6-base.gba", 0x5D4CFC, (0x5D4D98 - 0x5D4CFC) @ length: 009C

	.global gUnk_085D4D98
gUnk_085D4D98: @ 085D4D98
	.incbin "fe6-base.gba", 0x5D4D98, (0x5D5590 - 0x5D4D98) @ length: 07F8

	.global gUnk_085D5590
gUnk_085D5590: @ 085D5590
	.incbin "fe6-base.gba", 0x5D5590, (0x5D55C0 - 0x5D5590) @ length: 0030

	.global gUnk_085D55C0
gUnk_085D55C0: @ 085D55C0
	.incbin "fe6-base.gba", 0x5D55C0, (0x5D6218 - 0x5D55C0) @ length: 0C58

	.global gUnk_085D6218
gUnk_085D6218: @ 085D6218
	.incbin "fe6-base.gba", 0x5D6218, (0x5D6E78 - 0x5D6218) @ length: 0C60

	.global gUnk_085D6E78
gUnk_085D6E78: @ 085D6E78
	.incbin "fe6-base.gba", 0x5D6E78, (0x5D7190 - 0x5D6E78) @ length: 0318

	.global gUnk_085D7190
gUnk_085D7190: @ 085D7190
	.incbin "fe6-base.gba", 0x5D7190, (0x5D71D8 - 0x5D7190) @ length: 0048

	.global gUnk_085D71D8
gUnk_085D71D8: @ 085D71D8
	.incbin "fe6-base.gba", 0x5D71D8, (0x5D74FC - 0x5D71D8) @ length: 0324

	.global gUnk_085D74FC
gUnk_085D74FC: @ 085D74FC
	.incbin "fe6-base.gba", 0x5D74FC, (0x5D7544 - 0x5D74FC) @ length: 0048

	.global gUnk_085D7544
gUnk_085D7544: @ 085D7544
	.incbin "fe6-base.gba", 0x5D7544, (0x5D77E4 - 0x5D7544) @ length: 02A0

	.global gUnk_085D77E4
gUnk_085D77E4: @ 085D77E4
	.incbin "fe6-base.gba", 0x5D77E4, (0x5D77F4 - 0x5D77E4) @ length: 0010

	.global gUnk_085D77F4
gUnk_085D77F4: @ 085D77F4
	.incbin "fe6-base.gba", 0x5D77F4, (0x5D7A40 - 0x5D77F4) @ length: 024C

	.global gUnk_085D7A40
gUnk_085D7A40: @ 085D7A40
	.incbin "fe6-base.gba", 0x5D7A40, (0x5D7A50 - 0x5D7A40) @ length: 0010

	.global gUnk_085D7A50
gUnk_085D7A50: @ 085D7A50
	.incbin "fe6-base.gba", 0x5D7A50, (0x5D8608 - 0x5D7A50) @ length: 0BB8

	.global gUnk_085D8608
gUnk_085D8608: @ 085D8608
	.incbin "fe6-base.gba", 0x5D8608, (0x5D9208 - 0x5D8608) @ length: 0C00

	.global gUnk_085D9208
gUnk_085D9208: @ 085D9208
	.incbin "fe6-base.gba", 0x5D9208, (0x5D9E38 - 0x5D9208) @ length: 0C30

	.global gUnk_085D9E38
gUnk_085D9E38: @ 085D9E38
	.incbin "fe6-base.gba", 0x5D9E38, (0x5DAA68 - 0x5D9E38) @ length: 0C30

	.global gUnk_085DAA68
gUnk_085DAA68: @ 085DAA68
	.incbin "fe6-base.gba", 0x5DAA68, (0x5DB6A4 - 0x5DAA68) @ length: 0C3C

	.global gUnk_085DB6A4
gUnk_085DB6A4: @ 085DB6A4
	.incbin "fe6-base.gba", 0x5DB6A4, (0x5DC850 - 0x5DB6A4) @ length: 11AC

	.global gUnk_085DC850
gUnk_085DC850: @ 085DC850
	.incbin "fe6-base.gba", 0x5DC850, (0x5DC954 - 0x5DC850) @ length: 0104

	.global gUnk_085DC954
gUnk_085DC954: @ 085DC954
	.incbin "fe6-base.gba", 0x5DC954, (0x5DC97C - 0x5DC954) @ length: 0028

	.global gUnk_085DC97C
gUnk_085DC97C: @ 085DC97C
	.incbin "fe6-base.gba", 0x5DC97C, (0x5DDAF0 - 0x5DC97C) @ length: 1174

	.global gUnk_085DDAF0
gUnk_085DDAF0: @ 085DDAF0
	.incbin "fe6-base.gba", 0x5DDAF0, (0x5DDBF4 - 0x5DDAF0) @ length: 0104

	.global gUnk_085DDBF4
gUnk_085DDBF4: @ 085DDBF4
	.incbin "fe6-base.gba", 0x5DDBF4, (0x5DDC1C - 0x5DDBF4) @ length: 0028

	.global gUnk_085DDC1C
gUnk_085DDC1C: @ 085DDC1C
	.incbin "fe6-base.gba", 0x5DDC1C, (0x5DEDC0 - 0x5DDC1C) @ length: 11A4

	.global gUnk_085DEDC0
gUnk_085DEDC0: @ 085DEDC0
	.incbin "fe6-base.gba", 0x5DEDC0, (0x5DEEC4 - 0x5DEDC0) @ length: 0104

	.global gUnk_085DEEC4
gUnk_085DEEC4: @ 085DEEC4
	.incbin "fe6-base.gba", 0x5DEEC4, (0x5DEEEC - 0x5DEEC4) @ length: 0028

	.global gUnk_085DEEEC
gUnk_085DEEEC: @ 085DEEEC
	.incbin "fe6-base.gba", 0x5DEEEC, (0x5E0090 - 0x5DEEEC) @ length: 11A4

	.global gUnk_085E0090
gUnk_085E0090: @ 085E0090
	.incbin "fe6-base.gba", 0x5E0090, (0x5E0194 - 0x5E0090) @ length: 0104

	.global gUnk_085E0194
gUnk_085E0194: @ 085E0194
	.incbin "fe6-base.gba", 0x5E0194, (0x5E01BC - 0x5E0194) @ length: 0028

	.global gUnk_085E01BC
gUnk_085E01BC: @ 085E01BC
	.incbin "fe6-base.gba", 0x5E01BC, (0x5E0280 - 0x5E01BC) @ length: 00C4

	.global gUnk_085E0280
gUnk_085E0280: @ 085E0280
	.incbin "fe6-base.gba", 0x5E0280, (0x5E0324 - 0x5E0280) @ length: 00A4

	.global gUnk_085E0324
gUnk_085E0324: @ 085E0324
	.incbin "fe6-base.gba", 0x5E0324, (0x5E03C8 - 0x5E0324) @ length: 00A4

	.global gUnk_085E03C8
gUnk_085E03C8: @ 085E03C8
	.incbin "fe6-base.gba", 0x5E03C8, (0x5E046C - 0x5E03C8) @ length: 00A4

	.global gUnk_085E046C
gUnk_085E046C: @ 085E046C
	.incbin "fe6-base.gba", 0x5E046C, (0x5E0510 - 0x5E046C) @ length: 00A4

	.global gUnk_085E0510
gUnk_085E0510: @ 085E0510
	.incbin "fe6-base.gba", 0x5E0510, (0x5E05B4 - 0x5E0510) @ length: 00A4

	.global gUnk_085E05B4
gUnk_085E05B4: @ 085E05B4
	.incbin "fe6-base.gba", 0x5E05B4, (0x5E0748 - 0x5E05B4) @ length: 0194

	.global gUnk_085E0748
gUnk_085E0748: @ 085E0748
	.incbin "fe6-base.gba", 0x5E0748, (0x5E08DC - 0x5E0748) @ length: 0194

	.global gUnk_085E08DC
gUnk_085E08DC: @ 085E08DC
	.incbin "fe6-base.gba", 0x5E08DC, (0x5E0A88 - 0x5E08DC) @ length: 01AC

	.global gUnk_085E0A88
gUnk_085E0A88: @ 085E0A88
	.incbin "fe6-base.gba", 0x5E0A88, (0x5E0C34 - 0x5E0A88) @ length: 01AC

	.global gUnk_085E0C34
gUnk_085E0C34: @ 085E0C34
	.incbin "fe6-base.gba", 0x5E0C34, (0x5E0DE0 - 0x5E0C34) @ length: 01AC

	.global gUnk_085E0DE0
gUnk_085E0DE0: @ 085E0DE0
	.incbin "fe6-base.gba", 0x5E0DE0, (0x5E0F88 - 0x5E0DE0) @ length: 01A8

	.global gUnk_085E0F88
gUnk_085E0F88: @ 085E0F88
	.incbin "fe6-base.gba", 0x5E0F88, (0x5E19DC - 0x5E0F88) @ length: 0A54

	.global gUnk_085E19DC
gUnk_085E19DC: @ 085E19DC
	.incbin "fe6-base.gba", 0x5E19DC, (0x5E2508 - 0x5E19DC) @ length: 0B2C

	.global gUnk_085E2508
gUnk_085E2508: @ 085E2508
	.incbin "fe6-base.gba", 0x5E2508, (0x5E2920 - 0x5E2508) @ length: 0418

	.global gUnk_085E2920
gUnk_085E2920: @ 085E2920
	.incbin "fe6-base.gba", 0x5E2920, (0x5E294C - 0x5E2920) @ length: 002C

	.global gUnk_085E294C
gUnk_085E294C: @ 085E294C
	.incbin "fe6-base.gba", 0x5E294C, (0x5E2CA8 - 0x5E294C) @ length: 035C

	.global gUnk_085E2CA8
gUnk_085E2CA8: @ 085E2CA8
	.incbin "fe6-base.gba", 0x5E2CA8, (0x5E2CD4 - 0x5E2CA8) @ length: 002C

	.global gUnk_085E2CD4
gUnk_085E2CD4: @ 085E2CD4
	.incbin "fe6-base.gba", 0x5E2CD4, (0x5E3AA4 - 0x5E2CD4) @ length: 0DD0

	.global gUnk_085E3AA4
gUnk_085E3AA4: @ 085E3AA4
	.incbin "fe6-base.gba", 0x5E3AA4, (0x5E48C4 - 0x5E3AA4) @ length: 0E20

	.global gUnk_085E48C4
gUnk_085E48C4: @ 085E48C4
	.incbin "fe6-base.gba", 0x5E48C4, (0x5E5858 - 0x5E48C4) @ length: 0F94

	.global gUnk_085E5858
gUnk_085E5858: @ 085E5858
	.incbin "fe6-base.gba", 0x5E5858, (0x5E5C10 - 0x5E5858) @ length: 03B8

	.global gUnk_085E5C10
gUnk_085E5C10: @ 085E5C10
	.incbin "fe6-base.gba", 0x5E5C10, (0x5E5C2C - 0x5E5C10) @ length: 001C

	.global gUnk_085E5C2C
gUnk_085E5C2C: @ 085E5C2C
	.incbin "fe6-base.gba", 0x5E5C2C, (0x5E5C34 - 0x5E5C2C) @ length: 0008

	.global gUnk_085E5C34
gUnk_085E5C34: @ 085E5C34
	.incbin "fe6-base.gba", 0x5E5C34, (0x5E5C3C - 0x5E5C34) @ length: 0008

	.global gUnk_085E5C3C
gUnk_085E5C3C: @ 085E5C3C
	.incbin "fe6-base.gba", 0x5E5C3C, (0x5E5C44 - 0x5E5C3C) @ length: 0008

	.global gUnk_085E5C44
gUnk_085E5C44: @ 085E5C44
	.incbin "fe6-base.gba", 0x5E5C44, (0x5E79F8 - 0x5E5C44) @ length: 1DB4

	.global gUnk_085E79F8
gUnk_085E79F8: @ 085E79F8
	.incbin "fe6-base.gba", 0x5E79F8, (0x5E7A64 - 0x5E79F8) @ length: 006C

	.global gUnk_085E7A64
gUnk_085E7A64: @ 085E7A64
	.incbin "fe6-base.gba", 0x5E7A64, (0x5E7AC4 - 0x5E7A64) @ length: 0060

	.global gUnk_085E7AC4
gUnk_085E7AC4: @ 085E7AC4
	.incbin "fe6-base.gba", 0x5E7AC4, (0x5E7ACC - 0x5E7AC4) @ length: 0008

	.global gUnk_085E7ACC
gUnk_085E7ACC: @ 085E7ACC
	.incbin "fe6-base.gba", 0x5E7ACC, (0x5E90AC - 0x5E7ACC) @ length: 15E0

	.global gUnk_085E90AC
gUnk_085E90AC: @ 085E90AC
	.incbin "fe6-base.gba", 0x5E90AC, (0x5E9160 - 0x5E90AC) @ length: 00B4

	.global gUnk_085E9160
gUnk_085E9160: @ 085E9160
	.incbin "fe6-base.gba", 0x5E9160, (0x5EA7F0 - 0x5E9160) @ length: 1690

	.global gUnk_085EA7F0
gUnk_085EA7F0: @ 085EA7F0
	.incbin "fe6-base.gba", 0x5EA7F0, (0x5EA8A4 - 0x5EA7F0) @ length: 00B4

	.global gUnk_085EA8A4
gUnk_085EA8A4: @ 085EA8A4
	.incbin "fe6-base.gba", 0x5EA8A4, (0x5EABC0 - 0x5EA8A4) @ length: 031C

	.global gUnk_085EABC0
gUnk_085EABC0: @ 085EABC0
	.incbin "fe6-base.gba", 0x5EABC0, (0x5EAC34 - 0x5EABC0) @ length: 0074

	.global gUnk_085EAC34
gUnk_085EAC34: @ 085EAC34
	.incbin "fe6-base.gba", 0x5EAC34, (0x5EADB0 - 0x5EAC34) @ length: 017C

	.global gUnk_085EADB0
gUnk_085EADB0: @ 085EADB0
	.incbin "fe6-base.gba", 0x5EADB0, (0x5EB1A8 - 0x5EADB0) @ length: 03F8

	.global gUnk_085EB1A8
gUnk_085EB1A8: @ 085EB1A8
	.incbin "fe6-base.gba", 0x5EB1A8, (0x5EB1DC - 0x5EB1A8) @ length: 0034

	.global gUnk_085EB1DC
gUnk_085EB1DC: @ 085EB1DC
	.incbin "fe6-base.gba", 0x5EB1DC, (0x5EB264 - 0x5EB1DC) @ length: 0088

	.global gUnk_085EB264
gUnk_085EB264: @ 085EB264
	.incbin "fe6-base.gba", 0x5EB264, (0x5EB83C - 0x5EB264) @ length: 05D8

	.global gUnk_085EB83C
gUnk_085EB83C: @ 085EB83C
	.incbin "fe6-base.gba", 0x5EB83C, (0x5EBF40 - 0x5EB83C) @ length: 0704

	.global gUnk_085EBF40
gUnk_085EBF40: @ 085EBF40
	.incbin "fe6-base.gba", 0x5EBF40, (0x5EBF50 - 0x5EBF40) @ length: 0010

	.global gUnk_085EBF50
gUnk_085EBF50: @ 085EBF50
	.incbin "fe6-base.gba", 0x5EBF50, (0x5EBF58 - 0x5EBF50) @ length: 0008

	.global gUnk_085EBF58
gUnk_085EBF58: @ 085EBF58
	.incbin "fe6-base.gba", 0x5EBF58, (0x5EBF60 - 0x5EBF58) @ length: 0008

	.global gUnk_085EBF60
gUnk_085EBF60: @ 085EBF60
	.incbin "fe6-base.gba", 0x5EBF60, (0x5EC478 - 0x5EBF60) @ length: 0518

	.global gUnk_085EC478
gUnk_085EC478: @ 085EC478
	.incbin "fe6-base.gba", 0x5EC478, (0x5EC630 - 0x5EC478) @ length: 01B8

	.global gUnk_085EC630
gUnk_085EC630: @ 085EC630
	.incbin "fe6-base.gba", 0x5EC630, (0x5EC938 - 0x5EC630) @ length: 0308

	.global gUnk_085EC938
gUnk_085EC938: @ 085EC938
	.incbin "fe6-base.gba", 0x5EC938, (0x5ECC34 - 0x5EC938) @ length: 02FC

	.global gUnk_085ECC34
gUnk_085ECC34: @ 085ECC34
	.incbin "fe6-base.gba", 0x5ECC34, (0x5ED8CC - 0x5ECC34) @ length: 0C98

	.global gUnk_085ED8CC
gUnk_085ED8CC: @ 085ED8CC
	.incbin "fe6-base.gba", 0x5ED8CC, (0x5ED8F8 - 0x5ED8CC) @ length: 002C

	.global gUnk_085ED8F8
gUnk_085ED8F8: @ 085ED8F8
	.incbin "fe6-base.gba", 0x5ED8F8, (0x5ED924 - 0x5ED8F8) @ length: 002C

	.global gUnk_085ED924
gUnk_085ED924: @ 085ED924
	.incbin "fe6-base.gba", 0x5ED924, (0x5EDCC8 - 0x5ED924) @ length: 03A4

	.global gUnk_085EDCC8
gUnk_085EDCC8: @ 085EDCC8
	.incbin "fe6-base.gba", 0x5EDCC8, (0x5F0A14 - 0x5EDCC8) @ length: 2D4C

	.global gUnk_085F0A14
gUnk_085F0A14: @ 085F0A14
	.incbin "fe6-base.gba", 0x5F0A14, (0x5F0AA4 - 0x5F0A14) @ length: 0090

	.global gUnk_085F0AA4
gUnk_085F0AA4: @ 085F0AA4
	.incbin "fe6-base.gba", 0x5F0AA4, (0x5F1FC0 - 0x5F0AA4) @ length: 151C

	.global gUnk_085F1FC0
gUnk_085F1FC0: @ 085F1FC0
	.incbin "fe6-base.gba", 0x5F1FC0, (0x5F2034 - 0x5F1FC0) @ length: 0074

	.global gUnk_085F2034
gUnk_085F2034: @ 085F2034
	.incbin "fe6-base.gba", 0x5F2034, (0x5F35C0 - 0x5F2034) @ length: 158C

	.global gUnk_085F35C0
gUnk_085F35C0: @ 085F35C0
	.incbin "fe6-base.gba", 0x5F35C0, (0x5F3634 - 0x5F35C0) @ length: 0074

	.global gUnk_085F3634
gUnk_085F3634: @ 085F3634
	.incbin "fe6-base.gba", 0x5F3634, (0x5F63A8 - 0x5F3634) @ length: 2D74

	.global gUnk_085F63A8
gUnk_085F63A8: @ 085F63A8
	.incbin "fe6-base.gba", 0x5F63A8, (0x5F6674 - 0x5F63A8) @ length: 02CC

	.global gUnk_085F6674
gUnk_085F6674: @ 085F6674
	.incbin "fe6-base.gba", 0x5F6674, (0x5F9358 - 0x5F6674) @ length: 2CE4

	.global gUnk_085F9358
gUnk_085F9358: @ 085F9358
	.incbin "fe6-base.gba", 0x5F9358, (0x5FE3C4 - 0x5F9358) @ length: 506C

	.global gUnk_085FE3C4
gUnk_085FE3C4: @ 085FE3C4
	.incbin "fe6-base.gba", 0x5FE3C4, (0x5FE544 - 0x5FE3C4) @ length: 0180

	.global gUnk_085FE544
gUnk_085FE544: @ 085FE544
	.incbin "fe6-base.gba", 0x5FE544, (0x5FEAF8 - 0x5FE544) @ length: 05B4

	.global gUnk_085FEAF8
gUnk_085FEAF8: @ 085FEAF8
	.incbin "fe6-base.gba", 0x5FEAF8, (0x5FEB0C - 0x5FEAF8) @ length: 0014

	.global gUnk_085FEB0C
gUnk_085FEB0C: @ 085FEB0C
	.incbin "fe6-base.gba", 0x5FEB0C, (0x5FEB20 - 0x5FEB0C) @ length: 0014

	.global gUnk_085FEB20
gUnk_085FEB20: @ 085FEB20
	.incbin "fe6-base.gba", 0x5FEB20, (0x5FEB34 - 0x5FEB20) @ length: 0014

	.global gUnk_085FEB34
gUnk_085FEB34: @ 085FEB34
	.incbin "fe6-base.gba", 0x5FEB34, (0x5FEB48 - 0x5FEB34) @ length: 0014

	.global gUnk_085FEB48
gUnk_085FEB48: @ 085FEB48
	.incbin "fe6-base.gba", 0x5FEB48, (0x5FEEBC - 0x5FEB48) @ length: 0374

	.global gUnk_085FEEBC
gUnk_085FEEBC: @ 085FEEBC
	.incbin "fe6-base.gba", 0x5FEEBC, (0x5FEEC8 - 0x5FEEBC) @ length: 000C

	.global gUnk_085FEEC8
gUnk_085FEEC8: @ 085FEEC8
	.incbin "fe6-base.gba", 0x5FEEC8, (0x5FEED4 - 0x5FEEC8) @ length: 000C

	.global gUnk_085FEED4
gUnk_085FEED4: @ 085FEED4
	.incbin "fe6-base.gba", 0x5FEED4, (0x5FEEE0 - 0x5FEED4) @ length: 000C

	.global gUnk_085FEEE0
gUnk_085FEEE0: @ 085FEEE0
	.incbin "fe6-base.gba", 0x5FEEE0, (0x5FEEEC - 0x5FEEE0) @ length: 000C

	.global gUnk_085FEEEC
gUnk_085FEEEC: @ 085FEEEC
	.incbin "fe6-base.gba", 0x5FEEEC, (0x602FAC - 0x5FEEEC) @ length: 40C0

	.global gUnk_08602FAC
gUnk_08602FAC: @ 08602FAC
	.incbin "fe6-base.gba", 0x602FAC, (0x6030FC - 0x602FAC) @ length: 0150

	.global gUnk_086030FC
gUnk_086030FC: @ 086030FC
	.incbin "fe6-base.gba", 0x6030FC, (0x603B1C - 0x6030FC) @ length: 0A20

	.global gUnk_08603B1C
gUnk_08603B1C: @ 08603B1C
	.incbin "fe6-base.gba", 0x603B1C, (0x603B24 - 0x603B1C) @ length: 0008

	.global gUnk_08603B24
gUnk_08603B24: @ 08603B24
	.incbin "fe6-base.gba", 0x603B24, (0x603B2C - 0x603B24) @ length: 0008

	.global gUnk_08603B2C
gUnk_08603B2C: @ 08603B2C
	.incbin "fe6-base.gba", 0x603B2C, (0x603B34 - 0x603B2C) @ length: 0008

	.global gUnk_08603B34
gUnk_08603B34: @ 08603B34
	.incbin "fe6-base.gba", 0x603B34, (0x603B58 - 0x603B34) @ length: 0024

	.global gUnk_08603B58
gUnk_08603B58: @ 08603B58
	.incbin "fe6-base.gba", 0x603B58, (0x603BA4 - 0x603B58) @ length: 004C

	.global gUnk_08603BA4
gUnk_08603BA4: @ 08603BA4
	.incbin "fe6-base.gba", 0x603BA4, (0x603BC0 - 0x603BA4) @ length: 001C

	.global gUnk_08603BC0
gUnk_08603BC0: @ 08603BC0
	.incbin "fe6-base.gba", 0x603BC0, (0x6046D8 - 0x603BC0) @ length: 0B18
