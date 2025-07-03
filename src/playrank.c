#include "prelude.h"
#include "proc.h"
#include "util.h"
#include "hardware.h"
#include "augury.h"
#include "oam.h"
#include "banim.h"
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

void func_fe6_0808DD40(void)
{
	int i;

	for (i = 0; i < 7; i++) {
		gpPlayRankSt->unk_42[i] = Unk_0868B420[i].unk_0C;
		gpPlayRankSt->unk_50[i] = Unk_0868B420[i].unk_0D;
	}
}

void func_fe6_0808DD78(void)
{
	int i;

	for (i = 0; i < 4; i++) {
		gpPlayRankSt->unk_42[i] = gUnk_0868B490[i].unk_0C;
		gpPlayRankSt->unk_50[i] = gUnk_0868B490[i].unk_0D;
	}

	unk_02016A2E[0] = gpPlayRankSt->unk_6C[0] = func_fe6_0808F3E8();
	unk_02016A2E[1] = gpPlayRankSt->unk_6C[1] = func_fe6_0808F550();
	unk_02016A2E[2] = gpPlayRankSt->unk_6C[2] = func_fe6_0808F4B8();

	gpPlayRankSt->unk_6C[3] = func_fe6_0808F73C();

	for (i = 0; i < 4; i++)
		func_fe6_0808DF78(i, 0);
}

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
	proc->anim_timer = 0;
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
	anim.oam2 = (_tmp = 0xFFFFC000) | (0x100 + proc->anim_timer * 4);

	BasPutOam(&anim);

	proc->anim_duration--;
	if (proc->anim_duration == 0) {
		proc->anim_timer++;
		proc->anim_duration = gUnk_0868B5E0[proc->anim_timer];

		if (proc->anim_duration == 0)
			Proc_Break(proc);
	}
}

void func_fe6_0808DF3C(u16 pal_bank, u16 x, u16 y)
{
	struct Proc_0868B5E8 *proc;

	ApplyPalette(Pal_08342AD8, 0x10 + OBPAL_PLAYRANK_C);

	proc = SpawnProc(ProcScr_0868B5E8, PROC_TREE_3);
	proc->pal_bank = pal_bank;
	proc->x = x;
	proc->y = y;
}

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

#if 0
void func_fe6_0808DFCC(struct Proc_0868B5E8 *proc)
{
	int x_scale = Interpolate(INTERPOLATE_RCUBIC, 2, 0x100, proc->timer1, 8);

	SetObjAffineAuto(0x1F, 0, x_scale, 0x100);

	if (gKeySt->held & KEY_BUTTON_A)
		proc->timer1++;

	if (proc->timer1++ >= 8) {
		int step;

		proc->timer1 = 8;
		step = gpPlayRankSt->step;

		if (gpPlayRankSt->unk_5E[step] >= gpPlayRankSt->unk_6C[step]) {
			Proc_Break(proc);
			return;
		}

		if (step <= 5 && step >= 3)
			func_fe6_0808DF3C(step, proc->x, proc->y);

		Proc_Goto(proc, 1);
	}
}
#endif
