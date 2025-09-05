#include "prelude.h"
#include "proc.h"
#include "banim.h"
#include "sound.h"
#include "oam.h"
#include "sprite.h"
#include "hardware.h"
#include "savemenu.h"
#include "opinfo.h"
#include "unit.h"
#include "constants/jids.h"

void HBlank_ClassInfoDisp(void)
{
	u16 vcount = (REG_VCOUNT + 1);

	if (vcount < 110) {
		REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 2;
		REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 2;
	} else {
		REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 1;
		REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 1;
	}
}

void OpInfo_EfxmagicMiniCallBack(void)
{
	SetBlendConfig(1, 0x10, 0x10, 0);

	SetBlendTargetA(0, 1, 0, 0, 0);
	SetBlendTargetB(0, 0, 1, 1, 1);

	SetWinEnable(1, 0, 0);
	SetWin0Box(0, 0, 240, 160);

	SetWin0Layers(1, 1, 1, 1, 1);
	SetWOutLayers(1, 0, 1, 1, 1);

	gDispIo.win_ct.win0_enable_blend = 1;

#if FE6
	gDispIo.win_ct.wout_enable_blend = 0;
#elif FE8
	gDispIo.win_ct.win1_enable_blend = 0;
#endif

	gDispIo.blend_ct.target2_enable_bd = 1;
}

const char Str_OpInfo_Hp[]  = TEXT("ＨＰ", "HP");
const char Str_OpInfo_Str[] = TEXT("力",   "Str");
const char Str_OpInfo_Skl[] = TEXT("技",   "Skl");
const char Str_OpInfo_Spd[] = TEXT("速さ", "Spd");
const char Str_OpInfo_Def[] = TEXT("守備", "Def");
const char Str_OpInfo_Res[] = TEXT("魔防", "Res");

char const *const OpInfoClassIntroMsgs[] = {
	Str_OpInfo_Hp,
	Str_OpInfo_Str,
	Str_OpInfo_Skl,
	Str_OpInfo_Spd,
	Str_OpInfo_Def,
	Str_OpInfo_Res
};

#if 0
void ClassInfoDisp_ExecEkrMainMini(struct ProcClassInfoDisp *proc)
{
	int i;

	char const *msgs[] = {
		Str_OpInfo_Hp,
		Str_OpInfo_Str,
		Str_OpInfo_Skl,
		Str_OpInfo_Spd,
		Str_OpInfo_Def,
		Str_OpInfo_Res
	};

	for (i = 4; i < 8; i++) {

	}
}
#endif

const char Str_OpInfo_Mag[] = TEXT("魔力", "Res");
const u8 gUnk_0835C829[0xC] = { 2, 2, 3, 3, 3, 3, 2, 2, 2, 3, 3, 4 };
