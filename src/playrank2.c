#include "prelude.h"
#include "proc.h"
#include "unit.h"
#include "faction.h"
#include "item.h"
#include "util.h"
#include "hardware.h"
#include "augury.h"
#include "oam.h"
#include "msg.h"
#include "text.h"
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

// https://decomp.me/scratch/5Pw82
#if 0
void Ending_DrawPInfoTitle(u8 x, u8 y, struct Unit *unit, u8 type)
{
	struct Text text;
	int off;
	struct PidStats *pid_status = GetPidStats(UNIT_PID(unit));
	int pid = UNIT_PID(unit);

	if (type == 0) {
		TmApplyTsa(gBg1Tm + TM_OFFSET(0, 0),  Tsa_GameRank_083461C4, 0x4300);
		TmApplyTsa(gBg1Tm + TM_OFFSET(17, 6), Tsa_GameRank_08346330, 0x4300);
		TmApplyTsa(gBg1Tm + TM_OFFSET(0, 19), Tsa_GameRank_083463B4, 0x4300);
	} else {
		TmApplyTsa(gBg1Tm + TM_OFFSET(x, y), Tsa_GameRank_083463F4, 0x4300);
	}

	PutDrawText(
		NULL,
		gBg0Tm + TM_OFFSET(x + 2, y + 1),
		TEXT_COLOR_SYSTEM_WHITE,
		(0x48 - GetStringTextLen(DecodeMsg(gPersonEndingInfo[pid].msg_06))) / 2,
		9,
		DecodeMsg(gPersonEndingInfo[pid].msg_06)
	);

	PutDrawText(
		NULL,
		gBg0Tm + TM_OFFSET(x + 0xB, y + 1),
		TEXT_COLOR_SYSTEM_WHITE,
		(0x28 - GetStringTextLen(DecodeMsg(unit->pinfo->msg_name))) / 2,
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
#endif
