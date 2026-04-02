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
#include "item.h"
#include "text.h"
#include "util.h"
#include "talk.h"
#include "armfunc.h"
#include "constants/jids.h"

EWRAM_OVERLAY(opinfo) struct EkrMainMiniDesc OpEkrMiniDesc = {};
EWRAM_OVERLAY(opinfo) u16 OpEkrMini_ImgBuf[0x1000] = {};
EWRAM_OVERLAY(opinfo) u16 OpEkrMini_OamBuf[0x2C00] = {};
EWRAM_OVERLAY(opinfo) u16 OpEkrMini_PalBuf[0x50] = {};
EWRAM_OVERLAY(opinfo) u8  OpEkrMini_ScrBuf[0x2A00] = {};

EWRAM_OVERLAY(opinfo) struct EfxopMagicDesc OpEkrMagiDesc = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrMagi_BgImgBuf[0x2000] = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrMagi_BgTsaBuf[0x800] = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrMagi_ObImgBuf[0x1000] = {};

EWRAM_OVERLAY(opinfo) struct EkrTerrainfxDesc OpEkrTerrainDesc = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrTerrain_ImgBuf[0x2000] = {};

EWRAM_OVERLAY(opinfo) struct Text OpClassDemoTexts[6] = {};

struct Unk_086905F8 {
	u8 unk_00;
	u8 unk_01;
	u16 unk_02;
};

extern struct Unk_086905F8 gUnk_086905F8[];

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

// https://decomp.me/scratch/zZ7qo
#if 0
void ClassInfoDisp_ExecEkrMainMini(struct ProcClassInfoDisp *proc)
{
	int i;
	struct Unk_086905F8 *u_086905F8;

	int use_mag = false;

	char const *msgs[] = {
		Str_OpInfo_Hp,
		Str_OpInfo_Str,
		Str_OpInfo_Skl,
		Str_OpInfo_Spd,
		Str_OpInfo_Def,
		Str_OpInfo_Res
	};

	for (i = ITEM_KIND_STAFF; i <= ITEM_KIND_ELDER; i++) {
		if (GetJInfo(OpClassDemo_JidConfig[proc->unk_31])->wexp[i] != 0) {
			use_mag = true;
			break;
		}
	}

	proc->unk_2A = 0;
	proc->unk_2C = 0;
	proc->unk_2E = 0;
	proc->unk_3E = 1;
	proc->unk_44 = 0xFA;

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	if (proc->unk_31 == 0) {
		u_086905F8 = gUnk_086905F8;
		proc->unk_2E = 0;
	} else {
		int j = 0;
		int k;

		u_086905F8 = gUnk_086905F8;

		for (k = 0; k < proc->unk_31; k++) {
			while (u_086905F8[++j].unk_01 != 0)
				;
		}
		proc->unk_2E = j + 1;
	}
	proc->unk_30 = u_086905F8[proc->unk_2E].unk_00;

	SetDispEnable(0, 0, 0, 0, 0);
	ResetTextFont();
	ResetText();

	gDispIo.bg0_ct.priority = 2;
	gDispIo.bg1_ct.priority = 2;
	gDispIo.bg2_ct.priority = 2;
	gDispIo.bg3_ct.priority = 3;

	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, 0, 0);
	SetBgOffset(BG_3, 0, 0);

	Decompress(Img_MonologueBG, (u8 *)BG_VRAM + GetBgChrOffset(BG_3));
	ApplyPalette(Pal_Op_0835AB08, 0xA);
	TmApplyTsa(gBg3Tm, Tsa_Op_0835AB28, 0xA000);
	Decompress(Img_Op_0835A3E8, (u8 *)BG_VRAM + GetBgChrOffset(BG_2));
	ApplyPalette(Pal_Op_0835A5D0, 0x9);
	TmApplyTsa(gBg2Tm, Tsa_Op_0835A5F0, 0x9000);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	TmFill(gBg0Tm, 0);

	proc->unit_status[0] = GetJInfo(OpClassDemo_JidConfig[proc->unk_31])->base_hp;
	proc->unit_status[1] = GetJInfo(OpClassDemo_JidConfig[proc->unk_31])->base_pow;
	proc->unit_status[2] = GetJInfo(OpClassDemo_JidConfig[proc->unk_31])->base_skl;
	proc->unit_status[3] = GetJInfo(OpClassDemo_JidConfig[proc->unk_31])->base_spd;
	proc->unit_status[4] = GetJInfo(OpClassDemo_JidConfig[proc->unk_31])->base_def;
	proc->unit_status[5] = GetJInfo(OpClassDemo_JidConfig[proc->unk_31])->base_res;

	for (i = 0; i < 6; i++) {
		struct Text *text = &OpClassDemoTexts[i];

		InitText(text, 3);
		ClearText(text);
		Text_SetColor(text, TEXT_COLOR_SYSTEM_GOLD);
		Text_SetCursor(text, 0);

		if (use_mag && i == 1)
			Text_DrawString(&OpClassDemoTexts[1], Str_OpInfo_Mag);
		else
			Text_DrawString(text, msgs[i]);

		PutText(text, gBg0Tm + TM_OFFSET(1, 1 + i * 2));
		PutNumber(gBg0Tm + TM_OFFSET(5, 1 + i * 2), TEXT_COLOR_SYSTEM_WHITE, proc->unit_status[i]);
	}

	proc->proc40 = func_fe6_08095D2C(proc);

	InitTalk(0x100, 2, 0);
	SetInitTalkTextFont();
	ClearTalkText();
	EndTalk();
	StartTalkMsg(2, 15, OpClassDemo_IntroMsgs[proc->unk_31]);
	SetTalkPrintColor(TEXT_COLOR_SYSTEM_WHITE);
	SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
	SetTalkFlag(TALK_FLAG_NOBUBBLE);
	SetTalkFlag(TALK_FLAG_NOSKIP);
	SetTalkFlag(TALK_FLAG_NOFAST);
	SetTalkFlag(TALK_FLAG_SILENT);
	SetTalkPrintDelay(4);

	OpEkrMiniDesc.x = 0x104;
	OpEkrMiniDesc.y = 0x58;
	OpEkrMiniDesc.bid = OpClassDemo_BIDs[proc->unk_31];
	OpEkrMiniDesc.round_type = ANIM_ROUND_TAKING_HIT_CLOSE;
	OpEkrMiniDesc.faction_pal = BANIMPAL_BLUE;
	OpEkrMiniDesc.pos = POS_R;
	OpEkrMiniDesc.oam2_chr = 0x180;
	OpEkrMiniDesc.oam2_pal = 2;
	OpEkrMiniDesc.img_buf = OpEkrMini_ImgBuf;
	OpEkrMiniDesc.oam_buf = OpEkrMini_OamBuf;
	OpEkrMiniDesc.pal_buf = OpEkrMini_PalBuf;
	OpEkrMiniDesc.scr_buf = OpEkrMini_ScrBuf;
	OpEkrMiniDesc.magicfx_desc = &OpEkrMagiDesc;

	OpEkrMagiDesc.magicFuncIdx = OpClassDemo_MagiConfig[proc->unk_31 * 5 + 0];
	OpEkrMagiDesc.xOffsetBg    = OpClassDemo_MagiConfig[proc->unk_31 * 5 + 1];
	OpEkrMagiDesc.yOffsetBg    = OpClassDemo_MagiConfig[proc->unk_31 * 5 + 2];
	OpEkrMagiDesc.xOffsetObj   = OpClassDemo_MagiConfig[proc->unk_31 * 5 + 3];
	OpEkrMagiDesc.yOffsetObj   = OpClassDemo_MagiConfig[proc->unk_31 * 5 + 4];
	OpEkrMagiDesc.objChr = 0x280;
	OpEkrMagiDesc.objPalId = 0xF;
	OpEkrMagiDesc.bgPalId = 0xF;
	OpEkrMagiDesc.bgChr = 0x200;
	OpEkrMagiDesc.bgPalId = 0xF;
	OpEkrMagiDesc.bg = BG_1;
	OpEkrMagiDesc.bgTmBuf = gBg1Tm;
	OpEkrMagiDesc.bgImgBuf = OpEkrMagi_BgImgBuf;
	OpEkrMagiDesc.bgTsaBuf = OpEkrMagi_BgTsaBuf;
	OpEkrMagiDesc.objImgBuf = OpEkrMagi_ObImgBuf;
	OpEkrMagiDesc.resetCallback = OpInfo_EfxmagicMiniCallBack;

	NewEkrUnitMainMini(&OpEkrMiniDesc);

	OpEkrTerrainDesc.terrain_l = OpClassDemo_TerrainConfig[proc->unk_31 * 2 + POS_L];
	OpEkrTerrainDesc.pal_l = 0xA;
	OpEkrTerrainDesc.chr_l = 0x380;
	OpEkrTerrainDesc.terrain_r = OpClassDemo_TerrainConfig[proc->unk_31 * 2 + POS_R];
	OpEkrTerrainDesc.pal_r = 0xB;
	OpEkrTerrainDesc.chr_r = 0x3C0;
	OpEkrTerrainDesc.distance = EKR_DISTANCE_CLOSE;
	OpEkrTerrainDesc.bg_index = -1;
	OpEkrTerrainDesc.vram_offset = (u32)OBJ_VRAM0;
	OpEkrTerrainDesc.img_buf = OpEkrTerrain_ImgBuf;

	NewEkrTerrainfx(&OpEkrTerrainDesc);
	EkrTerrainfx_SetPosition(&OpEkrTerrainDesc, 0xD0, 0x68, 0x130, 0x68);
	SetOnHBlankA(HBlank_ClassInfoDisp);
}
#endif

const char Str_OpInfo_Mag[] = TEXT("魔力", "Res");
const u8 gUnk_0835C829[0xC] = { 2, 2, 3, 3, 3, 3, 2, 2, 2, 3, 3, 4 };
