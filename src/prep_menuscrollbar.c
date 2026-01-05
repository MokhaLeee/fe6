#include "prelude.h"
#include "hardware.h"
#include "proc.h"
#include "oam.h"
#include "sprite.h"
#include "prepscreen.h"

u16 CONST_DATA Sprite_MenuScrollContainer[] = {
	1,
	OAM0_SHAPE_8x32, OAM1_SIZE_8x32, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08679590[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x15),
};

u16 CONST_DATA Sprite_08679598[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x16),
};

u16 CONST_DATA Sprite_086795A0[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_086795A8[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xC),
};

u16 CONST_DATA Sprite_086795B0[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xD),
};

u16 CONST_DATA Sprite_086795B8[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xE),
};

u16 CONST_DATA Sprite_086795C0[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xF),
};

u16 CONST_DATA Sprite_086795C8[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x10),
};

u16 CONST_DATA Sprite_086795D0[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x11),
};

u16 CONST_DATA Sprite_086795D8[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x12),
};

u16 CONST_DATA Sprite_086795E0[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x13),
};

u16 CONST_DATA Sprite_086795E8[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, 0,
};

u16 CONST_DATA Sprite_086795F0[] = {
	1,
	OAM0_SHAPE_8x32, OAM1_SIZE_8x32, 0,
};

u16 *CONST_DATA MenuScrollBarSegmentSprites[] = {
	Sprite_086795A0,
	Sprite_086795A8,
	Sprite_086795B0,
	Sprite_086795B8,
	Sprite_086795C0,
	Sprite_086795C8,
	Sprite_086795D0,
	Sprite_086795D8,
	Sprite_086795E0,
	Sprite_086795E8,
	Sprite_086795F0
};

u16 CONST_DATA Sprite_08679624[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x17),
};

u16 CONST_DATA Sprite_0867962C[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x18),
};

u16 CONST_DATA Sprite_08679634[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x19),
};

u16 CONST_DATA Sprite_0867963C[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1A),
};

u16 CONST_DATA Sprite_08679644[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1B),
};

u16 CONST_DATA Sprite_0867964C[] = {
	1,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1C),
};

u16 *CONST_DATA MenuScrollArrowSprites[] = {
	Sprite_08679624,
	Sprite_0867962C,
	Sprite_08679634,
	Sprite_0867963C,
	Sprite_08679644,
	Sprite_0867964C
};


struct ProcScr CONST_DATA ProcScr_menu_scroll[] = {
	PROC_NAME_DEBUG("menu_scroll"),
	PROC_CALL(MenuScroll_Init),
	PROC_REPEAT(MenuScroll_Loop),
	PROC_END,
};

ProcPtr StartMenuScrollBar(ProcPtr parent)
{
	return SpawnProc(ProcScr_menu_scroll, parent);
}
