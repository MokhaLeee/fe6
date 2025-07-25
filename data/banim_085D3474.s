	.include "animscr.inc"
	.include "gba_sprites.inc"
	.section .data

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

	.global AnimScr_EfxDanceObj
AnimScr_EfxDanceObj: @ 085D5590
	.incbin "fe6-base.gba", 0x5D5590, (0x5D55C0 - 0x5D5590) @ length: 0030

	.global AnimScr_EfxSongFE6
AnimScr_EfxSongFE6: @ 085D55C0
	.incbin "fe6-base.gba", 0x5D55C0, (0x5D6218 - 0x5D55C0) @ length: 0C58

	.global gUnk_085D6218
gUnk_085D6218: @ 085D6218
	.incbin "fe6-base.gba", 0x5D6218, (0x5D6E78 - 0x5D6218) @ length: 0C60

	.global gUnk_085D6E78
gUnk_085D6E78: @ 085D6E78
	.incbin "fe6-base.gba", 0x5D6E78, (0x5D7190 - 0x5D6E78) @ length: 0318

	.global AnimScr_HurtmutEff00OBJ1_Right
AnimScr_HurtmutEff00OBJ1_Right: @ 085D7190
	.incbin "fe6-base.gba", 0x5D7190, (0x5D71D8 - 0x5D7190) @ length: 0048

	.global AnimScr_HurtmutEff01OBJ1_Right
AnimScr_HurtmutEff01OBJ1_Right: @ 085D71D8
	.incbin "fe6-base.gba", 0x5D71D8, (0x5D74FC - 0x5D71D8) @ length: 0324

	.global AnimScr_HurtmutEff00OBJ1_Left
AnimScr_HurtmutEff00OBJ1_Left: @ 085D74FC
	.incbin "fe6-base.gba", 0x5D74FC, (0x5D7544 - 0x5D74FC) @ length: 0048

	.global AnimScr_HurtmutEff01OBJ1_Left
AnimScr_HurtmutEff01OBJ1_Left: @ 085D7544
	.incbin "fe6-base.gba", 0x5D7544, (0x5D77E4 - 0x5D7544) @ length: 02A0

	.global AnimScr_HurtmutEff00OBJ2_Right
AnimScr_HurtmutEff00OBJ2_Right: @ 085D77E4
	.incbin "fe6-base.gba", 0x5D77E4, (0x5D77F4 - 0x5D77E4) @ length: 0010

	.global AnimScr_HurtmutEff01OBJ2_Right
AnimScr_HurtmutEff01OBJ2_Right: @ 085D77F4
	.incbin "fe6-base.gba", 0x5D77F4, (0x5D7A40 - 0x5D77F4) @ length: 024C

	.global AnimScr_HurtmutEff00OBJ2_Left
AnimScr_HurtmutEff00OBJ2_Left: @ 085D7A40
	.incbin "fe6-base.gba", 0x5D7A40, (0x5D7A50 - 0x5D7A40) @ length: 0010

	.global AnimScr_HurtmutEff01OBJ2_Left
AnimScr_HurtmutEff01OBJ2_Left: @ 085D7A50
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
	.incbin "fe6-base.gba", 0x5DB6A4, (0x5DB710 - 0x5DB6A4)
