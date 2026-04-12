#include "prelude.h"
#include "hardware.h"
#include "oam.h"
#include "util.h"
#include "proc.h"
#include "ui.h"
#include "util.h"
#include "eventinfo.h"
#include "eventfunctions.h"

#include "augury.h"
#include "playrank.h"
#include "ending.h"

#include "constants/flags.h"

CONST_DATA struct EndingCgConf gEndingCgConf[] = {
	[1]  = { EndingCG_08330B4C, EndingCG_08331B9C, NULL, NULL },
	[3]  = { EndingCG_0832EDCC, EndingCG_0832FD70, NULL, NULL },
	[6]  = { EndingCG_0832CCB0, EndingCG_0832DC8C, NULL, NULL },
	[8]  = { EndingCG_08335CE8, EndingCG_08336C40, NULL, NULL },
	[10] = { EndingCG_08332E84, EndingCG_08333DD4, EndingCG_08331BBC, EndingCG_08332E64 },
	[11] = { EndingCG_08333DF4, EndingCG_08335060, EndingCG_08335080, EndingCG_08335CC8 },
	[12] = { EndingCG_0832FD90, EndingCG_08330B2C, EndingCG_0832DCAC, EndingCG_0832EDAC },
};

bool CheckDisplayEndingCG(void)
{
	if (gEndingCgIndex < 13 && gEndingCgConf[gEndingCgIndex].img1)
		return true;

	return false;
}

struct ProcScr CONST_DATA ProcScr_EndingCG[] = {
	PROC_19,
	PROC_CALL(EndingCG_Init),
	PROC_CALL(FadeInBlackSpeed08),
	PROC_SLEEP(1),
	PROC_REPEAT(EndingCG_Loop),
	PROC_CALL(FadeInBlackWithCallBack_Speed08),
	PROC_SLEEP(1),
	PROC_END,
};

void EndingCG_Init(struct ProcGameEnding *proc)
{
	const void *img;
	const void *pal;
	bool ret = false;

	proc->timer = 0;

	InitBgs(BgConf_Ending);
	SetDispEnable(0, 0, 1, 0, 0);
	SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);
	SetBlendTargetA(0, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 0, 0, 0);

	SetBgOffset(BG_2, 0, -4);
	TmFill(gBg2Tm, 0);

	switch (gEndingCgIndex) {
	case 10:
		ret = !CheckFlag(FLAG_107);

		break;

	case 11:
		ret = GetEndingId() == FAKE_ENDING;

		break;

	case 12:
		ret = GetEndingId() != TRUE_ENDING;

		break;

	default:
		break;
	}

	if (ret)
		img = gEndingCgConf[gEndingCgIndex].img2;
	else
		img = gEndingCgConf[gEndingCgIndex].img1;

	Decompress(img, (u8 *)BG_VRAM + BGCHR_ENDING_CG * CHR_SIZE + GetBgChrOffset(BG_2));

	if (ret)
		pal = gEndingCgConf[gEndingCgIndex].pal2;
	else
		pal = gEndingCgConf[gEndingCgIndex].pal1;

	ApplyPalette(pal, BGPAL_ENDING_CG);

	PutEndingCreditTm(gBg2Tm + TM_OFFSET(7, 5), OAM2_PAL(BGPAL_ENDING_CG) + BGCHR_ENDING_CG, 15, 10);
	EnableBgSync(BG2_SYNC_BIT);
}

void EndingCG_Loop(struct ProcGameEnding *proc)
{
	proc->timer++;

	if (proc->timer > 0xF0)
		Proc_Break(proc);
}
