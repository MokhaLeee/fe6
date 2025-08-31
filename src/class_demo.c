#include "prelude.h"
#include "proc.h"
#include "banim.h"
#include "sound.h"
#include "hardware.h"
#include "savemenu.h"
#include "gamecontroller.h"
#include "class_demo.h"

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

void OpInfo_Init(struct ProcClassDemo *proc)
{
	gDispIo.disp_ct.mode = 0;

	InitBgs(NULL);
	NewEfxAnimeDrvProc();
	ResetClassReelSpell();

	proc->unk_2E = 0;
	proc->unk_30 = gUnk_0869056C[proc->class_set][0];
	proc->timer = 0;
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

void OpInfo_Branch(struct ProcClassDemo *proc)
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

	proc->timer = 0;
}

void OpInfo_PostAnim(struct ProcClassDemo *proc)
{
	if (proc->anim_proc != NULL)
		Proc_Goto(proc->anim_proc, 4);

	SetDispEnable(0, 0, 0, 0, 1);

	proc->subproc1 = NewOpInfoEnter(proc, proc->unk_30);
	proc->mode = OPINFO_STATE_IDLE;
}

void OpInfo_Idle(struct ProcClassDemo *proc)
{
	if (gKeySt->held & (KEY_BUTTON_A | KEY_BUTTON_B | KEY_BUTTON_START) && proc->unk_32 == 0) {
		SetNextGameAction(GAME_ACTION_0);
		proc->unk_32 = 1;
		Proc_Goto(proc, PL_OPINFO_NAME_INTRO);
	}

	if (proc->timer == 0)
		EndActiveClassReelBgColorProc();

	if ((++proc->timer / 2) > 0xD) {
		SetDispEnable(0, 0, 0, 0, 0);
		Proc_Break(proc);
	} else
		func_fe6_0809485C(proc->timer);
}

void OpInfo_FadeBgmOut(struct ProcClassDemo *proc)
{
	FadeBgmOut(1);
}

void OpInfo_EndSubProcs(struct ProcClassDemo *proc)
{
	if (proc->subproc1 != NULL)
		Proc_Goto(proc->subproc1, 4);

	if (proc->anim_proc != NULL)
		Proc_Goto(proc->anim_proc, 4);
}

void OpInfo_End(struct ProcClassDemo *proc)
{
	EndEfxAnimeDrvProc();
	CleanupGame(proc);
}

void StartClassDemo(u8 class_set, ProcPtr parent)
{
	struct ProcClassDemo *proc;

	proc = SpawnProcLocking(ProcScr_OpInfo, parent);
	proc->class_set = class_set;
}
