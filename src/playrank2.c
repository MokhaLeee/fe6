#include "prelude.h"
#include "proc.h"
#include "unit.h"
#include "faction.h"
#include "item.h"
#include "util.h"
#include "hardware.h"
#include "face.h"
#include "oam.h"
#include "msg.h"
#include "text.h"
#include "helpbox.h"
#include "ui.h"
#include "util.h"
#include "armfunc.h"
#include "banim.h"
#include "sprite.h"
#include "armfunc.h"
#include "save_stats.h"
#include "save_xmap.h"
#include "gamecontroller.h"
#include "chapterinfo.h"
#include "constants/chapters.h"
#include "constants/msg.h"
#include "constants/videoalloc_global.h"

#include "playrank.h"
#include "augury.h"
#include "ending_credit.h"

void EndingP2InfoText_Loop(struct ProcEndingPinfoText *proc)
{
	i8 uid = gEndingUid2;

	if (GetUnit(uid - 1)->flags & UNIT_FLAG_DEAD) {
		int i;
		struct ProcTypeWritter *type_writter;

		if (FindProc(ProcScr_TypeWritter)) {
			/* waiting for exists typing done */
			return;
		}

		type_writter = SpawnProc(ProcScr_TypeWritter, PROC_TREE_3);

		for (i = 0; i < 2; i++)
			type_writter->text[i] = &Texts_02016B78[i];

		Text_SetCursor(&Texts_02016B78[0], proc->text_x);
		type_writter->str_it = DecodeMsg(MSG_A6E);
		type_writter->line = 0;
		type_writter->font = NULL;
		type_writter->clock_interval = 4;
		type_writter->chars_per_print = 1;
		type_writter->clock = 0;
		EnableBgSync(BG0_SYNC_BIT);
	}
	Proc_Break(proc);
}

void SpawnEndingP2InfoText(void)
{
	if (gEndingDisplaySecondUnit == true)
		SpawnProc(ProcScr_EndingP2InfoText, PROC_TREE_3);
}

void Ending_DrawDyadPInfo(struct ProcEndingPInfoDisp *proc)
{
	int uid1, uid2;
	u8 fid;
	struct Unit *unit;
	ProcPtr faceproc1;
	ProcPtr faceproc2;

	gEndingDisplaySecondUnit = true;
	uid1 = PopNextEnding2Person(POS_L);
	gEndingUid1 = uid1 + 1;

	uid2 = PopNextEnding2Person(POS_R);
	if (uid2 >= FACTION_GREEN)
		gEndingDisplaySecondUnit = false;

	gEndingUid2 = uid2 + 1;

	ResetText();
	TmApplyTsa(gBg3Tm, Tsa_EndingPInfoBG, 0x2000);
	CpuFastFill16(0, (u8 *)BG_VRAM + 0xD800, 0x2000);

	unit = GetUnit(uid1);
	fid = GetUnitFid(unit);
	SetBgOffset(BG_0, 0xFF00, 0);
	faceproc1 = StartFace(0, fid, 0x1BE, 0, 0x42);
	gEndingFace1 = faceproc1;
	Ending_DrawPInfoTitle(0, 0, unit, 1);

	if (gEndingDisplaySecondUnit == true) {
		unit = GetUnit(uid2);
		fid = GetUnitFid(unit);
		SetBgOffset(BG_1, 0x100, 0);
		faceproc2 = StartFace(1, fid, -0xCE, 0x50, 0x43);
		gEndingFace2 = faceproc2;
		Ending_DrawPInfoTitle(0xB, 0xA, unit, 1);
	}

	proc->timer = 0;
	unk_02016B44 = true;
	SpawnProc(ProcScr_EndingFacePosCtrl, PROC_TREE_VSYNC);
	SetOnHBlankA(HBlank_Ending_DyadPInfo);
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void EndingPInfoDisp_Loop(struct ProcEndingPInfoDisp *proc)
{
	switch (proc->timer) {
	default:
		if (proc->timer <= 0x2C){
			struct FaceProc *faceproc;
			
			faceproc = gEndingFace1;
			faceproc->x_disp = 0xBE - EndingFaceXPos[0];

			if (gEndingDisplaySecondUnit == true) {
				faceproc = gEndingFace2;
				faceproc->x_disp = 0x32 - EndingFaceXPos[1];
			}
		}
		break;

	case 0x2D:
		SetBgOffset(BG_0, 0, 0);
		SetBgOffset(BG_1, 0, 0);
		break;

	case 0x3C:
		SpawnEndingP1InfoText();
		break;

	case 0xC8:
		SpawnEndingP2InfoText();
		break;

	case 0x1E0:
		Proc_Break(proc);
		break;
	}
	proc->timer++;
}

void EndingPInfoDisp_End(struct ProcEndingPInfoDisp *proc)
{
	EndFaceById(0);
	EndFaceById(1);
	Proc_EndEach(ProcScr_TypeWritter);
	Proc_EndEach(ProcScr_EndingFacePosCtrl);
	SetOnHBlankA(NULL);
}

bool EndingFacePosCtrlExists(void)
{
	return Proc_Exists(ProcScr_EndingPInfoDisp);
}

void EndingFacePosCtrl_Init(ProcPtr proc)
{
	EndingFaceXPos[0] = 0xFF00;
	EndingFaceXPos[1] = 0x100;
}

void EndingFacePosCtrl_Loop(ProcPtr proc)
{
	if (unk_02016B44 != false && EndingFaceXPos[1] != 0) {
		struct ProcEndingPInfoDisp *procfx = FindProc(ProcScr_EndingPInfoDisp);

		EndingFaceXPos[0] = Interpolate(INTERPOLATE_RSQUARE, 0xFFFFFF00, 0, procfx->timer, 0x2D);
		EndingFaceXPos[1] = Interpolate(INTERPOLATE_RSQUARE, 0x100, 0, procfx->timer, 0x2D);
	}
	EndingFacePosCtrlExt();
}

void Ending_DrawPInfoTitle(u8 x, u8 y, struct Unit *unit, u8 type)
{
	struct Text text;
	int off;
	struct PidStats *pid_status = GetPidStats(UNIT_PID(unit));
	int pid = UNIT_PID(unit);
	int var;

	if (type == 0) {
		TmApplyTsa(gBg1Tm + TM_OFFSET(0, 0),  Tsa_GameRank_083461C4, 0x4300);
		TmApplyTsa(gBg1Tm + TM_OFFSET(17, 6), Tsa_GameRank_08346330, 0x4300);
		TmApplyTsa(gBg1Tm + TM_OFFSET(0, 19), Tsa_GameRank_083463B4, 0x4300);
	} else {
		TmApplyTsa(gBg1Tm + TM_OFFSET(x, y), Tsa_GameRank_083463F4, 0x4300);
	}

	var = (0x48 - GetStringTextLen(DecodeMsg(gPersonEndingInfo[pid].msg_06))) / 2;
	PutDrawText(
		NULL,
		gBg0Tm + TM_OFFSET(x + 2, y + 1),
		TEXT_COLOR_SYSTEM_WHITE,
		var,
		9,
		DecodeMsg(gPersonEndingInfo[pid].msg_06)
	);

	var = (0x28 - GetStringTextLen(DecodeMsg(unit->pinfo->msg_name))) / 2;
	PutDrawText(
		NULL,
		gBg0Tm + TM_OFFSET(x + 0xB, y + 1),
		TEXT_COLOR_SYSTEM_WHITE,
		var,
		5,
		DecodeMsg(unit->pinfo->msg_name)
	);

	InitText(&text, 0xF);
	PutText(&text, gBg0Tm + TM_OFFSET(x + 2, y + 4));

	Text_InsertDrawNumberOrBlank(&text, 0x1E, TEXT_COLOR_SYSTEM_WHITE, pid_status->battle_count);
	Text_InsertDrawString(&text, 0x26, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(MSG_9C6)); // 戦
	off = pid_status->loss_count >= 100 ? 0 : 6;
	Text_InsertDrawNumberOrBlank(&text, off + 0x3F, TEXT_COLOR_SYSTEM_WHITE, pid_status->win_count);
	Text_InsertDrawString(&text, off + 0x47, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(MSG_9C7)); // 勝
	Text_InsertDrawNumberOrBlank(&text, 0x5F, TEXT_COLOR_SYSTEM_WHITE, pid_status->loss_count);
	Text_InsertDrawString(&text, 0x67, TEXT_COLOR_SYSTEM_WHITE, DecodeMsg(MSG_9C8)); // 敗
}
