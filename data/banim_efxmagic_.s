	.include "animscr.inc"
	.section .data

	.global gEkrSpellAnimLut
gEkrSpellAnimLut: @ 0x005D0DA0
	.4byte NewEfxDummyMagic
	.4byte NewEfxTeono
	.4byte NewEfxArrow
	.4byte func_fe6_0804D7C0
	.4byte func_fe6_0804D81C
	.4byte func_fe6_0804D878
	.4byte func_fe6_0804D8D4
	.4byte func_fe6_0804D930
	.4byte func_fe6_0804D98C
	.4byte func_fe6_0804D9E8
	.4byte func_fe6_0804DA44
	.4byte func_fe6_0804DAA0
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte func_fe6_0804DC54
	.4byte func_fe6_0804DE4C
	.4byte func_fe6_0804DF30
	.4byte func_fe6_0804E0E8
	.4byte func_fe6_0804E448
	.4byte func_fe6_0804E5E4
	.4byte func_fe6_0804E8CC
	.4byte func_fe6_0804EA14
	.4byte func_fe6_0804EFB4
	.4byte func_fe6_0804EFF8
	.4byte func_fe6_080513AC
	.4byte func_fe6_0804ECB8
	.4byte func_fe6_0804FC28
	.4byte func_fe6_0804F5C4
	.4byte func_fe6_0805007C
	.4byte func_fe6_080503BC
	.4byte func_fe6_08050860
	.4byte func_fe6_08050DE0
	.4byte func_fe6_0805100C
	.4byte func_fe6_08052090
	.4byte func_fe6_08051CD0
	.4byte func_fe6_080529EC
	.4byte func_fe6_08053764
	.4byte func_fe6_08053DC8
	.4byte func_fe6_08054558
	.4byte func_fe6_080546A8
	.4byte func_fe6_08054848
	.4byte func_fe6_080549E8
	.4byte func_fe6_08055234
	.4byte func_fe6_08055264
	.4byte func_fe6_080556BC
	.4byte func_fe6_0805595C
	.4byte func_fe6_08055BF4
	.4byte func_fe6_08055F24
	.4byte func_fe6_080561A0
	.4byte func_fe6_080567AC
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000

AnimSprite_ManaketeFlame:
    ANIM_SPRITE_END

	.global AnimScr_ManaketeFlame
AnimScr_ManaketeFlame: @ 085D0E8C
    ANIMSCR_FORCE_SPRITE AnimSprite_ManaketeFlame, 1
    ANIMSCR_BLOCKED
