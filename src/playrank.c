#include "prelude.h"
#include "proc.h"
#include "util.h"
#include "hardware.h"
#include "augury.h"
#include "oam.h"
#include "text.h"
#include "banim.h"
#include "sprite.h"
#include "armfunc.h"
#include "constants/msg.h"

#include "playrank.h"

// 0x868B1B0
CONST_DATA struct HelpBoxInfo HelpInfo_0868B1B0 = {
	.adjacent_down =  &HelpInfo_0868B204,
	.adjacent_right = &HelpInfo_0868B1CC,
	.x = 0x08,
	.y = 0x29,
	.msg = MSG_6A1,
};

// 0x868B1CC
CONST_DATA struct HelpBoxInfo HelpInfo_0868B1CC = {
	.adjacent_down =  &HelpInfo_0868B1E8,
	.adjacent_left =  &HelpInfo_0868B1B0,
	.x = 0x8D,
	.y = 0x20,
	.msg = MSG_69D,
};

// 0x868B1E8
CONST_DATA struct HelpBoxInfo HelpInfo_0868B1E8 = {
	.adjacent_up =    &HelpInfo_0868B1CC,
	.adjacent_down =  &HelpInfo_0868B274,
	.adjacent_left =  &HelpInfo_0868B1B0,
	.x = 0x8D,
	.y = 0x30,
	.msg = MSG_6A2,
};

// 0x868B204
CONST_DATA struct HelpBoxInfo HelpInfo_0868B204 = {
	.adjacent_up =    &HelpInfo_0868B1B0,
	.adjacent_down =  &HelpInfo_0868B220,
	.adjacent_right = &HelpInfo_0868B23C,
	.x = 0x3C,
	.y = 0x48,
	.msg = MSG_69E,
};

// 0x868B220
CONST_DATA struct HelpBoxInfo HelpInfo_0868B220 = {
	.adjacent_up =    &HelpInfo_0868B204,
	.adjacent_down =  &HelpInfo_0868B2AC,
	.adjacent_right = &HelpInfo_0868B258,
	.x = 0x3C,
	.y = 0x68,
	.msg = MSG_69E,
};

// 0x868B23C
CONST_DATA struct HelpBoxInfo HelpInfo_0868B23C = {
	.adjacent_up =    &HelpInfo_0868B1E8,
	.adjacent_down =  &HelpInfo_0868B258,
	.adjacent_left =  &HelpInfo_0868B204,
	.adjacent_right = &HelpInfo_0868B274,
	.x = 0x7A,
	.y = 0x48,
	.msg = MSG_69F,
};

// 0x868B258
CONST_DATA struct HelpBoxInfo HelpInfo_0868B258 = {
	.adjacent_up =    &HelpInfo_0868B23C,
	.adjacent_down =  &HelpInfo_0868B2AC,
	.adjacent_left =  &HelpInfo_0868B220,
	.adjacent_right = &HelpInfo_0868B290,
	.x = 0x7A,
	.y = 0x68,
	.msg = MSG_69F,
};

// 0x868B274
CONST_DATA struct HelpBoxInfo HelpInfo_0868B274 = {
	.adjacent_up =    &HelpInfo_0868B1E8,
	.adjacent_down =  &HelpInfo_0868B290,
	.adjacent_left =  &HelpInfo_0868B23C,
	.x = 0x9C,
	.y = 0x48,
	.msg = MSG_6A0,
};

// 0x868B290
CONST_DATA struct HelpBoxInfo HelpInfo_0868B290 = {
	.adjacent_up =    &HelpInfo_0868B274,
	.adjacent_down =  &HelpInfo_0868B2AC,
	.adjacent_left =  &HelpInfo_0868B258,
	.x = 0x9C,
	.y = 0x68,
	.msg = MSG_6A0,
};

// 0x868B2AC
CONST_DATA struct HelpBoxInfo HelpInfo_0868B2AC = {
	.adjacent_up =    &HelpInfo_0868B290,
	.adjacent_left =  &HelpInfo_0868B258,
	.x = 0x9C,
	.y = 0x88,
	.msg = MSG_69C,
};

// 0x868B2C8
CONST_DATA struct HelpBoxInfo HelpInfo_0868B2C8 = {
	.adjacent_down =  &HelpInfo_0868B300,
	.adjacent_right = &HelpInfo_0868B2E4,
	.x = 0x08,
	.y = 0x31,
	.msg = MSG_6A1,
};

// 0x868B2E4
CONST_DATA struct HelpBoxInfo HelpInfo_0868B2E4 = {
	.adjacent_down =  &HelpInfo_0868B370,
	.adjacent_left =  &HelpInfo_0868B2C8,
	.x = 0xA5,
	.y = 0x30,
	.msg = MSG_69D,
};

// 0x868B300
CONST_DATA struct HelpBoxInfo HelpInfo_0868B300 = {
	.adjacent_up =    &HelpInfo_0868B2C8,
	.adjacent_down =  &HelpInfo_0868B31C,
	.adjacent_right = &HelpInfo_0868B338,
	.x = 0x3C,
	.y = 0x48,
	.msg = MSG_69E,
};

// 0x868B31C
CONST_DATA struct HelpBoxInfo HelpInfo_0868B31C = {
	.adjacent_up =    &HelpInfo_0868B300,
	.adjacent_down =  &HelpInfo_0868B3A8,
	.adjacent_right = &HelpInfo_0868B354,
	.x = 0x3C,
	.y = 0x68,
	.msg = MSG_69E,
};

// 0x868B338
CONST_DATA struct HelpBoxInfo HelpInfo_0868B338 = {
	.adjacent_up =    &HelpInfo_0868B2E4,
	.adjacent_down =  &HelpInfo_0868B354,
	.adjacent_left =  &HelpInfo_0868B300,
	.adjacent_right = &HelpInfo_0868B370,
	.x = 0x7A,
	.y = 0x48,
	.msg = MSG_69F,
};

// 0x868B354
CONST_DATA struct HelpBoxInfo HelpInfo_0868B354 = {
	.adjacent_up =    &HelpInfo_0868B338,
	.adjacent_down =  &HelpInfo_0868B3A8,
	.adjacent_left =  &HelpInfo_0868B31C,
	.adjacent_right = &HelpInfo_0868B38C,
	.x = 0x7A,
	.y = 0x68,
	.msg = MSG_69F,
};

// 0x868B370
CONST_DATA struct HelpBoxInfo HelpInfo_0868B370 = {
	.adjacent_up =    &HelpInfo_0868B2E4,
	.adjacent_down =  &HelpInfo_0868B38C,
	.adjacent_left =  &HelpInfo_0868B338,
	.x = 0x9C,
	.y = 0x48,
	.msg = MSG_6A0,
};

// 0x868B38C
CONST_DATA struct HelpBoxInfo HelpInfo_0868B38C = {
	.adjacent_up =    &HelpInfo_0868B370,
	.adjacent_down =  &HelpInfo_0868B3A8,
	.adjacent_left =  &HelpInfo_0868B354,
	.x = 0x9C,
	.y = 0x68,
	.msg = MSG_6A0,
};

// 0x868B3A8
CONST_DATA struct HelpBoxInfo HelpInfo_0868B3A8 = {
	.adjacent_up =    &HelpInfo_0868B38C,
	.adjacent_left =  &HelpInfo_0868B354,
	.x = 0x9C,
	.y = 0x88,
	.msg = MSG_69C,
};

// 0x868B3C4
CONST_DATA struct HelpBoxInfo HelpInfo_0868B3C4 = {
	.adjacent_right = &HelpInfo_0868B3E0,
	.x = 0x08,
	.y = 0x31,
	.msg = MSG_6A1,
};

// 0x868B3E0
CONST_DATA struct HelpBoxInfo HelpInfo_0868B3E0 = {
	.adjacent_left =  &HelpInfo_0868B3C4,
	.x = 0xA5,
	.y = 0x30,
	.msg = MSG_69D,
};

CONST_DATA struct PlayRankSt *gpPlayRankSt = (void *)gBuf;

u16 CONST_DATA Sprite_0868B400[] =
{
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, 0,
};

u16 CONST_DATA Sprite_0868B408[] =
{
	1,
	OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(504), 0,
};

u16 CONST_DATA Sprite_0868B410[] =
{
	1,
	OAM0_SHAPE_16x32, OAM1_SIZE_16x32, 0,
};

u16 CONST_DATA Sprite_0868B418[] =
{
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, 0,
};

CONST_DATA struct TotalPlayRankConf gTotalPlayRankConf1[] = {
	{ MSG_71D, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F33C, 5,  6 },
	{ MSG_71E, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F490, 18, 6 },
	{ MSG_71F, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F524, 5,  8 },
	{ MSG_720, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F5AC, 18, 8 },
	{ MSG_721, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F600, 5,  10 },
	{ MSG_722, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F68C, 18, 10 },
	{ MSG_723, TEXT_COLOR_SYSTEM_GREEN, NULL, 5, 13 }
};

CONST_DATA struct TotalPlayRankConf gTotalPlayRankConf2[] = {
	{ MSG_71D, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F3E8, 5,  10 },
	{ MSG_71F, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F550, 18, 10 },
	{ MSG_71E, TEXT_COLOR_SYSTEM_WHITE, func_fe6_0808F4B8, 5,  13 },
	{ MSG_723, TEXT_COLOR_SYSTEM_GREEN, NULL, 18, 13 }
};

CONST_DATA struct UnkStruct_0868B4D0 Objs_0868B4D0[] = {
	{ Sprite_0868B400, 2 },
	{ Sprite_0868B400, 1 },
	{ Sprite_0868B400, 1 },
	{ Sprite_0868B400, 0 },
	{ Sprite_0868B400, 0 },
	{ Sprite_0868B400, 0 },
	{ Sprite_0868B408, 0 },
};

CONST_DATA struct UnkStruct_0868b508 Unk_0868B508[] = {
	{ 0x00, 0x10, 0x01, 0x00 },
	{ 0x02, 0x14, 0x01, 0x00 },
	{ 0x04, 0x15, 0x01, 0x00 },
	{ 0x06, 0x10, 0x01, 0x00 },
	{ 0x08, 0x11, 0x01, 0x00 },
	{ 0x0A, 0x1A, 0x01, 0x00 },
	{ 0x0A, 0x14, 0x01, 0x00 },
	{ 0x04, 0x17, 0x01, 0x00 },
	{ 0x0C, 0x15, 0x01, 0x00 },
	{ 0x0E, 0x12, 0x01, 0x00 },
	{ 0xFF, 0x00, 0x00, 0x00 },
};

CONST_DATA struct UnkStruct_0868b508 Unk_0868B534[] = {
	{ 0x00, 0x18, 0x01, 0x00 },
	{ 0x06, 0x09, 0x00, 0x00 },
	{ 0x07, 0x0B, 0x00, 0x00 },
	{ 0x07, 0x0D, 0x00, 0x00 },
	{ 0x06, 0x0A, 0x00, 0x00 },
	{ 0x08, 0x0C, 0x00, 0x00 },
	{ 0x09, 0x18, 0x00, 0x00 },
	{ 0x04, 0x12, 0x01, 0x00 },
	{ 0x08, 0x0C, 0x00, 0x00 },
	{ 0x0A, 0x0F, 0x00, 0x00 },
	{ 0x0B, 0x10, 0x00, 0x00 },
	{ 0x0C, 0x08, 0x00, 0x00 },
	{ 0x0D, 0x0B, 0x00, 0x00 },
	{ 0x0E, 0x0B, 0x00, 0x00 },
	{ 0x0D, 0x0B, 0x00, 0x00 },
	{ 0xFF, 0x00, 0x00, 0x00 },
};

CONST_DATA struct UnkStruct_0868b508 Unk_0868B574[] = {
	{ 0x00, 0x18, 0x01, 0x00 },
	{ 0x06, 0x09, 0x00, 0x00 },
	{ 0x07, 0x0B, 0x00, 0x00 },
	{ 0x07, 0x0D, 0x00, 0x00 },
	{ 0x06, 0x0A, 0x00, 0x00 },
	{ 0x08, 0x0C, 0x00, 0x00 },
	{ 0x09, 0x18, 0x00, 0x00 },
	{ 0x02, 0x10, 0x01, 0x00 },
	{ 0x0F, 0x0E, 0x00, 0x00 },
	{ 0x06, 0x0A, 0x00, 0x00 },
	{ 0x0C, 0x09, 0x00, 0x00 },
	{ 0x40, 0x0E, 0x00, 0x00 },
	{ 0x41, 0x0C, 0x00, 0x00 },
	{ 0x0D, 0x0C, 0x00, 0x00 },
	{ 0xFF, 0x00, 0x00, 0x00 },
};

CONST_DATA struct UnkStruct_0868B5B0 gUnk_0868B5B0[] = {
	{ Unk_0868B508, 0x000E },
	{ Unk_0868B534, 0x1210 },
	{ Unk_0868B574, 0x121C }
};

void func_fe6_0808DD40(void)
{
	int i;

	for (i = 0; i < 7; i++) {
		gpPlayRankSt->xs[i] = gTotalPlayRankConf1[i].x;
		gpPlayRankSt->ys[i] = gTotalPlayRankConf1[i].y;
	}
}

void func_fe6_0808DD78(void)
{
	int i;

	for (i = 0; i < 4; i++) {
		gpPlayRankSt->xs[i] = gTotalPlayRankConf2[i].x;
		gpPlayRankSt->ys[i] = gTotalPlayRankConf2[i].y;
	}

	unk_02016A2E[0] = gpPlayRankSt->unk_6C[0] = func_fe6_0808F3E8();
	unk_02016A2E[1] = gpPlayRankSt->unk_6C[1] = func_fe6_0808F550();
	unk_02016A2E[2] = gpPlayRankSt->unk_6C[2] = func_fe6_0808F4B8();

	gpPlayRankSt->unk_6C[3] = func_fe6_0808F73C();

	for (i = 0; i < 4; i++)
		func_fe6_0808DF78(i, 0);
}

CONST_DATA struct BaSpriteData BaSprite_0868B5C8[] = {
	// ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
	{ 
		.header = OAM0_SHAPE_32x32 | (OAM1_SIZE_32x32 << 16),
		.as = {.object = {
			.oam2 = 0,
			.x = -0x10,
			.y = -0x10
		}}
	},

	// ANIM_SPRITE_END
	{
		.header = 1
	},
};

CONST_DATA u8 gUnk_0868B5E0[] = {
	1, 2, 3, 3, 3, 2
};

struct ProcScr CONST_DATA ProcScr_0868B5E8[] = {
	PROC_19,
	PROC_CALL(func_fe6_0808DE5C),
	PROC_REPEAT(func_fe6_0808DE70),
	PROC_REPEAT(func_fe6_0808DEA4),
	PROC_END,
};

void func_fe6_0808DE04(int lo, int hi, int x, int pal_bank)
{
	int ret = Interpolate(INTERPOLATE_SQUARE, lo, hi, x, 8);

	CpuFastCopy(Pal_08342AB8, PAL_BG(pal_bank), 0x20);
	EfxPalWhiteInOut(gPal, pal_bank, 1, ret);
	EnablePalSync();
}

void func_fe6_0808DE5C(struct Proc_0868B5E8 *proc)
{
	proc->timer1 = 0;
	proc->step = 0;
	proc->anim_duration = gUnk_0868B5E0[0];
}

void func_fe6_0808DE70(struct Proc_0868B5E8 *proc)
{
	func_fe6_0808DE04(8, 0x10, proc->timer1, proc->pal_bank + 0x10 + OBPAL_PLAYRANK_4);

	proc->timer1++;
	if (proc->timer1 > 8) {
		proc->timer1 = 0;
		Proc_Break(proc);
	}
}

void func_fe6_0808DEA4(struct Proc_0868B5E8 *proc)
{
	struct Anim anim;
	int _tmp;

	if (proc->timer1 <= 8) {
		func_fe6_0808DE04(0x10, 0, proc->timer1, proc->pal_bank + 0x10 + OBPAL_PLAYRANK_4);
		proc->timer1++;
	}

	anim.oam01 = 0;
	anim.sprData = BaSprite_0868B5C8;
	anim.xPosition = (proc->x + 7) * 8;
	anim.yPosition = (proc->y + 1) * 8;
	anim.oam2 = (_tmp = 0xFFFFC000) | (0x100 + proc->step * 4);

	BasPutOam(&anim);

	proc->anim_duration--;
	if (proc->anim_duration == 0) {
		proc->step++;
		proc->anim_duration = gUnk_0868B5E0[proc->step];

		if (proc->anim_duration == 0)
			Proc_Break(proc);
	}
}

void func_fe6_0808DF3C(u16 pal_bank, int _x, int _y)
{
	struct Proc_0868B5E8 *proc;
	u16 x = _x;
	u16 y = _y;

	ApplyPalette(Pal_08342AD8, 0x10 + OBPAL_PLAYRANK_C);

	proc = SpawnProc(ProcScr_0868B5E8, PROC_TREE_3);
	proc->pal_bank = pal_bank;
	proc->x = x;
	proc->y = y;
}

struct ProcScr CONST_DATA ProcScr_0868B610[] = {
	PROC_19,
PROC_LABEL(0),
	PROC_CALL(func_fe6_0808DFC4),
	PROC_REPEAT(func_fe6_0808DFCC),
	PROC_REPEAT(func_fe6_0808E0DC),
PROC_LABEL(1),
	PROC_END,
};

void func_fe6_0808DF78(int a, int b)
{
	gpPlayRankSt->unk_5E[a] = b;
	gpPlayRankSt->objs[a] = Objs_0868B4D0[b].obj;
	gpPlayRankSt->unk_98[a] = Objs_0868B4D0[b].unk_04;

	ApplyPalette(Pal_08342AB8, 0x10 + OBPAL_PLAYRANK_4 + a);
}

void func_fe6_0808DFC4(struct Proc_0868B5E8 *proc)
{
	proc->timer1 = 0;
}

void func_fe6_0808DFCC(struct Proc_0868B5E8 *proc)
{
	int x_scale = Interpolate(INTERPOLATE_RCUBIC, 2, 0x100, proc->timer1, 8);

	SetObjAffineAuto(0x1F, 0, x_scale, 0x100);

	if (gKeySt->held & KEY_BUTTON_A)
		proc->timer1++;

	if (proc->timer1++ >= 8) {
		struct PlayRankSt *st;
		struct PlayRankSt *bug_st;

		proc->timer1 = 8;

		st = gpPlayRankSt;
		bug_st = (struct PlayRankSt *)proc; // WTF

		if (st->unk_5E[bug_st->step] < st->unk_6C[bug_st->step]) {
			Proc_Break(proc);
			return;
		}

		if (bug_st->step <= 5 && st->unk_5E[bug_st->step] > 3)
			func_fe6_0808DF3C(bug_st->step, proc->x, proc->y);

		Proc_Goto(proc, 1);
	}
}

void func_fe6_0808E0DC(struct Proc_0868B5E8 *proc)
{
	int x_scale = Interpolate(INTERPOLATE_RCUBIC, 2, 0x100, 0x11 - proc->timer1, 8);

	SetObjAffineAuto(0x1F, 0, x_scale, 0x100);

	if (gKeySt->held & KEY_BUTTON_A)
		proc->timer1++;

	if (proc->timer1++ >= 0x10) {
		struct PlayRankSt *st;
		struct PlayRankSt *bug_st;
		int tmp;

		proc->timer1 = 0x10;

		st = gpPlayRankSt;
		bug_st = (struct PlayRankSt *)proc; // WTF

		tmp = st->unk_5E[bug_st->step];

		if (tmp <= 5) {
			func_fe6_0808DF78(bug_st->step, tmp + 1);
			Proc_Goto(proc, 0);
		}
	}
}

struct ProcScr CONST_DATA ProcScr_0868B648[] = {
	PROC_19,
	PROC_SLEEP(30),

PROC_LABEL(0),
	PROC_CALL(func_fe6_0808E284),
	PROC_SLEEP(1),
	PROC_CALL(func_fe6_0808E2D0),
	PROC_SLEEP(44),
PROC_LABEL(1),
	PROC_CALL(func_fe6_0808E264),
	PROC_SLEEP(20),
PROC_LABEL(2),
	PROC_CALL(func_fe6_0808E1D0),
	PROC_SLEEP(1),
	PROC_CALL(func_fe6_0808E1E4),
	PROC_GOTO(0),

PROC_LABEL(3),
	PROC_REPEAT(func_fe6_0808E2F0),
	PROC_END,
};

void func_fe6_0808E1D0(void)
{
	gpPlayRankSt->step++;
}

void func_fe6_0808E1E4(void)
{
	SetObjAffineAuto(0x1F, 0, 2, 0x100);
}

void func_fe6_0808E264(struct Proc_0868B648 *proc)
{
	if (gpPlayRankSt->step <= 4)
		Proc_Goto(proc, 2);
}

void func_fe6_0808E284(ProcPtr p)
{
	struct Proc_0868B5E8 *proc = SpawnProcLocking(ProcScr_0868B610, p);
	struct PlayRankSt *bug_st = (void *)proc;

	// ?
	bug_st->step = gpPlayRankSt->step;
	bug_st->unk_32 = gpPlayRankSt->xs[gpPlayRankSt->step];
	bug_st->unk_34 = gpPlayRankSt->ys[gpPlayRankSt->step];
}

void func_fe6_0808E2D0(struct Proc_0868B648 *proc)
{
	if (gpPlayRankSt->step > 5)
		Proc_Goto(proc, 3);
}

void func_fe6_0808E2F0(struct Proc_0868B648 *proc) {}

struct ProcScr CONST_DATA ProcScr_0868B6D8[] = {
	PROC_19,
	PROC_CALL(func_fe6_0808E2F4),
	PROC_SLEEP(20),
	PROC_REPEAT(func_fe6_0808E390),
	PROC_END,
};

void func_fe6_0808E2F4(void)
{
	SetObjAffine(0xA, 0x100, 0, 0, 0x100);
	SetObjAffineAuto(0x1F, 0, 2, 0x100);
	SpawnProc(ProcScr_0868B648, PROC_TREE_3);
}

void func_fe6_0808E390(void)
{
	int i;

	for (i = 0; i < (gpPlayRankSt->step + 1); i++) {
		int oam0, oam1, oam2;

		oam1 = (gpPlayRankSt->xs[i] + 6) << 3;
		oam0 = gpPlayRankSt->ys[i] << 3;

		if (i == gpPlayRankSt->step) {
			oam1 |= 0x3E00;
			oam0 |= 0x100;
		}

		oam2 = gpPlayRankSt->unk_5E[i] * 2 + 0xC0;

		PutSpriteExt(
			4,
			oam1,
			oam0,
			gpPlayRankSt->objs[i],
			(((i + 4) & 0xF) << 0xC) | oam2
		);
	}
}

struct ProcScr CONST_DATA ProcScr_0868B700[] = {
	PROC_19,
	PROC_CALL(func_fe6_0808E420),
	PROC_REPEAT(func_fe6_0808E434),
	PROC_END,
};

void func_fe6_0808E420(struct Proc_0868B700 *proc)
{
	proc->timer = 0;
	proc->layer = gPlayRankLayer - 1;
}

void func_fe6_0808E434(struct Proc_0868B700 *proc)
{
	int x_scale, time = proc->timer++;

	if (time > 7)
		Proc_Break(proc);

	x_scale = Interpolate(INTERPOLATE_RCUBIC, 2, 0x100, proc->timer, 8);
	SetObjAffineAuto(proc->layer, 0, 0x100, x_scale);
}

u16 CONST_DATA Sprite_0868B720[] = {
	2,
	OAM0_SHAPE_32x8, OAM1_SIZE_32x8, 0,
	OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x4),
};

struct ProcScr CONST_DATA ProcScr_0868B730[] = {
	PROC_19,
	PROC_CALL(func_fe6_0808E4E8),
	PROC_REPEAT(func_fe6_0808E5F0),
	PROC_END,
};

void func_fe6_0808E4E8(struct Proc_0868B730 *proc)
{
	int i;
	struct UnkStruct_0868b508 *ref;

	gPlayRankLayer = 0;
	proc->timer = 0;
	proc->total_sprites = 0;

	ref = gUnk_0868B5B0[unk_02016A2A].unk_00;

	while (ref[proc->total_sprites].chr != -1)
		proc->total_sprites++;

	for (i = 0; i < proc->total_sprites; i++) {
		SetObjAffine(i, 0x100, 0, 0, 0x100);
		SetObjAffineAuto(i, 0, 0x100, 2);
	}
}

#if 0
void func_fe6_0808E5F0(struct Proc_0868B730 *proc)
{
	int i, time, y;
	struct UnkStruct_0868b508 *ref;

	y= 0x100 - unk_02016A1E;
	if (unk_02016A2A == 0) {
		y = OAM1_X(y + 0x80); // ?

		PutOamHi(0xA2, y, Sprite_0868B720, OAM2_PAL(OBPAL_PLAYRANK_2) + OBCHR_PLAYRANK_84);
	}

	time = ++proc->timer;
	if (time < 0xF) {
		proc->timer = 0;

		if (gPlayRankLayer < proc->total_sprites) {
			gPlayRankLayer++;
			SpawnProc(ProcScr_0868B700, PROC_TREE_3);
		}
	}

	ref = gUnk_0868B5B0[unk_02016A2A].unk_00;

}
#endif
