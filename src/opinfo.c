#include "prelude.h"
#include "proc.h"
#include "banim.h"
#include "sound.h"
#include "oam.h"
#include "sprite.h"
#include "hardware.h"
#include "savemenu.h"
#include "gamecontroller.h"
#include "opinfo.h"

EWRAM_OVERLAY(opinfo) u16 gOpInfoPalettes[0x200] = {};

struct ProcScr CONST_DATA ProcScr_OpInfo[] = {
	PROC_NAME_DEBUG("opinfo"),
	PROC_YIELD,
	PROC_CALL(OpInfo_Init),

PROC_LABEL(PL_OPINFO_BRANMCH),
	PROC_REPEAT(OpInfo_Branch),

PROC_LABEL(PL_OPINFO_IDLE),
	PROC_REPEAT(OpInfo_Idle),
	PROC_CALL(OpInfo_PostAnim),
	PROC_GOTO(PL_OPINFO_BRANMCH),

PROC_LABEL(PL_OPINFO_END_TITLE),
	PROC_CALL(func_fe6_0808958C),
	PROC_YIELD,
	PROC_GOTO(PL_OPINFO_END_EXT),

PROC_LABEL(PL_OPINFO_NAME_INTRO),
	PROC_CALL(OpInfo_FadeBgmOut),
	PROC_REPEAT(OpInfo_Idle),

PROC_LABEL(PL_OPINFO_END_EXT),
	PROC_CALL(OpInfo_EndSubProcs),
	PROC_YIELD,
	PROC_CALL(OpInfo_End),
	PROC_END,
};

void OpInfo_Init(struct ProcOpInfo *proc)
{
	gDispIo.disp_ct.mode = 0;

	InitBgs(NULL);
	NewEfxAnimeDrvProc();
	ResetClassReelSpell();

	proc->unk_2E = 0;
	proc->unk_30 = gUnk_0869056C[proc->class_set][0];
	proc->fade_speed = 0;
	proc->subproc1 = NULL;
	proc->anim_proc = NULL;
	proc->subproc1 = NewOpInfoEnter(proc, proc->unk_30);

	SetDispEnable(0, 0, 0, 0, 1);
	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, 0, 0);
	SetBgOffset(BG_3, 0, 0);

	proc->proc_start_time = GetGameTime();
	proc->proc_run_time = 0;
	proc->mode = OPINFO_STATE_IDLE;
	proc->unk_32 = 0;
}

void OpInfo_Branch(struct ProcOpInfo *proc)
{
	proc->proc_run_time = GetGameTime() - proc->proc_start_time;

	switch (proc->mode) {
	case OPINFO_STATE_IDLE:
		if (gKeySt->held & (KEY_BUTTON_A | KEY_BUTTON_B | KEY_BUTTON_START)) {
			SetNextGameAction(GAME_ACTION_0);
			Proc_Goto(proc, PL_OPINFO_NAME_INTRO);
		}
		break;

	case OPINFO_STATE_2:
		if (proc->unk_30 >= (gUnk_0869056C[proc->class_set][proc->unk_2E] + 4)) {
			proc->unk_2E++;

			if (gUnk_0869056C[proc->class_set][proc->unk_2E] == 0xFF || proc->unk_2E > 3) {
				SetNextGameAction(GAME_ACTION_1);
				Proc_Goto(proc, PL_OPINFO_END_TITLE);
				FadeBgmOut(-1);
			} else {
				proc->unk_30 = gUnk_0869056C[proc->class_set][proc->unk_2E];
				Proc_Goto(proc, PL_OPINFO_IDLE);
			}
		} else {
			proc->unk_30 = proc->unk_30 + 1;
			Proc_Goto(proc, PL_OPINFO_IDLE);
		}
		break;

	case OPINFO_STATE_3:
		proc->anim_proc = StartClassAnimDisplay(proc, proc->unk_30);
		proc->mode = OPINFO_STATE_IDLE;
		break;
	}

	proc->fade_speed = 0;
}

void OpInfo_PostAnim(struct ProcOpInfo *proc)
{
	if (proc->anim_proc != NULL)
		Proc_Goto(proc->anim_proc, 4);

	SetDispEnable(0, 0, 0, 0, 1);

	proc->subproc1 = NewOpInfoEnter(proc, proc->unk_30);
	proc->mode = OPINFO_STATE_IDLE;
}

void OpInfo_Idle(struct ProcOpInfo *proc)
{
	if (gKeySt->held & (KEY_BUTTON_A | KEY_BUTTON_B | KEY_BUTTON_START) && proc->unk_32 == 0) {
		SetNextGameAction(GAME_ACTION_0);
		proc->unk_32 = 1;
		Proc_Goto(proc, PL_OPINFO_NAME_INTRO);
	}

	if (proc->fade_speed == 0)
		EndActiveClassReelBgColorProc();

	if ((++proc->fade_speed / 2) > 0xD) {
		SetDispEnable(0, 0, 0, 0, 0);
		Proc_Break(proc);
	} else
		OpInfo_FadeOut(proc->fade_speed);
}

void OpInfo_FadeBgmOut(struct ProcOpInfo *proc)
{
	FadeBgmOut(1);
}

void OpInfo_EndSubProcs(struct ProcOpInfo *proc)
{
	if (proc->subproc1 != NULL)
		Proc_Goto(proc->subproc1, 4);

	if (proc->anim_proc != NULL)
		Proc_Goto(proc->anim_proc, 4);
}

void OpInfo_End(struct ProcOpInfo *proc)
{
	EndEfxAnimeDrvProc();
	CleanupGame(proc);
}

void StartClassDemo(u8 class_set, ProcPtr parent)
{
	struct ProcOpInfo *proc;

	proc = SpawnProcLocking(ProcScr_OpInfo, parent);
	proc->class_set = class_set;
}

struct ProcScr CONST_DATA ProcScr_OpInfoFadeOut[] = {
	PROC_19,
	PROC_SLEEP(0),
	PROC_CALL(OpInfoFadeOut_Sync),
	PROC_END,
};

void OpInfoFadeOut_Sync(struct ProcOpInfoFadeOut *proc)
{
	int i;

	for (i = 0; i < 0x200; i++)
		gOpInfoPalettes[i] = gPal[i];

	EfxPalBlackInOut(gOpInfoPalettes, 0, 0x20, proc->speed / 2);

	for (i = 0; i < 0x200; i++)
		gPal[i] = gOpInfoPalettes[i];

	EnablePalSync();
}

void OpInfo_FadeOut(u8 speed)
{
	struct ProcOpInfoFadeOut *proc;

	proc = SpawnProc(ProcScr_OpInfoFadeOut, PROC_TREE_4);
	proc->speed = speed;
}

void PutOpInfoViewLetter(u16 char_base, u8 char_index, int x, int y, u16 x_scale, u16 y_scale, u8 pal_off)
{
	int i, pal;

	/**
	 * Copy palette
	 */
	for (i = 1; i < 0x10; i++) {
		if ((i + pal_off) >= 0x10) {
			int tmp = 0xF;

			gPal[0x100 + OBPAL_OFINFOVIEW_LETTER0 * 0x10 + char_index * 0x10 + i]
				= gPal[0x100 + OBPAL_OFINFOVIEW_LETTER_REF * 0x10 + tmp];

			pal = char_index + 1;
		} else {
			gPal[0x100 + OBPAL_OFINFOVIEW_LETTER0 * 0x10 + char_index * 0x10 + i]
				= gPal[0x100 + OBPAL_OFINFOVIEW_LETTER_REF * 0x10 + i + pal_off];

			pal = char_index + 1;
		}
	}
	EnablePalSync();

	if (x_scale < 8)
		x_scale = 8;

	if (y_scale < 8)
		y_scale = 8;

	SetObjAffineAuto(char_index, 0, x_scale, y_scale);


	PutSpriteExt(
		4,
		OAM1_X(x) + (char_index << 9),
		OAM1_X(y),
		Sprites_OpInfo_08690288[char_base + char_index],
		OAM2_PAL(pal)
	);
}

#if 0
void OpInfoEnter_Init(struct ProcOpInfoEnter *proc)
{
	int i;
	const u16 *pr_sprites;

	SetWinEnable(0, 0, 0);

	proc->timer = 0;

	if (proc->type == 0) {
		proc->unk_2F = 0;
		pr_sprites = Sprites_OpInfo_08690288;
	}
}
#endif
