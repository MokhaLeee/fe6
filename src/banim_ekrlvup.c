#include "prelude.h"
#include "proc.h"
#include "face.h"
#include "unit.h"
#include "battle.h"
#include "text.h"
#include "msg.h"
#include "oam.h"
#include "hardware.h"
#include "move.h"
#include "constants/iids.h"
#include "constants/videoalloc_banim.h"
#include "constants/videoalloc_global.h"

#include "banim.h"
#include "banim_ekrdragon.h"

struct FaceVramEnt CONST_DATA FaceConfig_EkrLevelup[] = {
	[0] = { 0, 0xF },
	[1] = {0},
	[2] = {0},
	[3] = {0},
};

struct ProcScr CONST_DATA ProcScr_EkrLevelup[] = {
	PROC_NAME_DEBUG("ekrLevelup"),
	PROC_REPEAT(EkrLvup_Init),
	PROC_SLEEP(1),

	PROC_REPEAT(EkrLvup_InitLevelUpBox),
	PROC_REPEAT(EkrLvup_SetBgs),
	PROC_REPEAT(EkrLvup_InitPalette),
	PROC_REPEAT(EkrLvup_PutWindowOnScreen),
	PROC_REPEAT(EkrLvup_PrepareApGfx),
	PROC_SLEEP(20),

	PROC_REPEAT(EkrLvup_Promo_WindowScroll0),
	PROC_REPEAT(EkrLvup_Promo_DrawPromoNewClassName),
	PROC_REPEAT(EkrLvup_Promo_WindowScroll1),
	PROC_REPEAT(EkrLvup_DrawNewLevel),
	PROC_REPEAT(EkrLvup_InitCounterForMainAnim),
	PROC_REPEAT(EkrLvup_MainAnime),
	PROC_REPEAT(EkrLvup_SetHBlank),
	PROC_REPEAT(EkrLvup_DoNothing),
	PROC_REPEAT(EkrLvup_PutWindowOffScreen),
	PROC_REPEAT(EkrLvup_ResetScreen),
	PROC_REPEAT(EkrLvup_OnEnd),
	PROC_END,
};

bool CheckEkrLvupDone(void)
{
	if (gpProcEkrLevelup->finished == true)
		return true;
	else
		return false;
}

void EndEkrLevelUp(void)
{
	Proc_End(gpProcEkrLevelup);
}

const char EkrLvupMsgsStr[8][5] = {
	TEXT("ＨＰ", "hp"),
	TEXT("力",   "str"),
	TEXT("技",   "skl"),
	TEXT("速さ", "spd"),
	TEXT("幸運", "lck"),
	TEXT("守備", "def"),
	TEXT("魔防", "res"),
	TEXT("体格", "con")
};

const char EkrLvupMsgsMag[8][5] = {
	TEXT("ＨＰ", "hp"),
	TEXT("魔力",  "str"),
	TEXT("技",   "skl"),
	TEXT("速さ", "spd"),
	TEXT("幸運", "lck"),
	TEXT("守備", "def"),
	TEXT("魔防", "res"),
	TEXT("体格", "con")
};

const u16 sEfxLvupPartsPos[] = {
	TM_OFFSET(2, 11),
	TM_OFFSET(2, 13),
	TM_OFFSET(2, 15),
	TM_OFFSET(2, 17),

	TM_OFFSET(10, 11),
	TM_OFFSET(10, 13),
	TM_OFFSET(10, 15),
	TM_OFFSET(10, 17),
};

const char gMsg_Lv[] = TEXT("ＬＶ", "LV");

void EkrLvup_InitStatusText(struct ProcEkrlvup *proc)
{
	int i;
	struct BattleUnit *bunit, *bunit2;
	struct Unit *unit;
	struct Text *th;
	const char *str;

	if (proc->anim_this == NULL) {
		struct BattleUnit ** test;
		bunit2 = gpEkrBattleUnitLeft;
		gpEkrLvupUnit = unit = &bunit2->unit;
		test = &gpEkrBattleUnitRight;
		gpEkrLvupBattleUnit = (bunit = *test);
	} else {
		struct BattleUnit ** test;
		bunit2 = gpEkrBattleUnitRight;
		gpEkrLvupUnit = unit = &bunit2->unit;
		test = &gpEkrBattleUnitLeft;
		gpEkrLvupBattleUnit = (bunit = *test);
	}

	if (proc->is_promotion == false) {
		unit = GetUnit(unit->id);

		gEkrLvupPreLevel = bunit2->previous_level;
		gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->max_hp;
		gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
		gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
		gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
		gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
		gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
		gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
		gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->jinfo->base_con + unit->pinfo->bonus_con;
		gEkrLvupPostLevel = bunit2->previous_level + 1;

		gEkrLvupPostStatus[EKRLVUP_STAT_HP] = unit->max_hp + bunit2->change_hp;
		gEkrLvupPostStatus[EKRLVUP_STAT_POW] = unit->pow + bunit2->change_pow;
		gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = unit->skl + bunit2->change_skl;
		gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = unit->lck + bunit2->change_lck;
		gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = unit->spd + bunit2->change_spd;
		gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = unit->def + bunit2->change_def;
		gEkrLvupPostStatus[EKRLVUP_STAT_RES] = unit->res + bunit2->change_res;
		gEkrLvupPostStatus[EKRLVUP_STAT_CON] = unit->jinfo->base_con + unit->pinfo->bonus_con + bunit2->change_con;
	} else {
		gEkrLvupPreLevel = unit->level;
		gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->max_hp;
		gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
		gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
		gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
		gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
		gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
		gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
		gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->jinfo->base_con + unit->pinfo->bonus_con;
		gEkrLvupPostLevel = 1;

		gEkrLvupPostStatus[EKRLVUP_STAT_HP] = bunit->unit.max_hp;
		gEkrLvupPostStatus[EKRLVUP_STAT_POW] = bunit->unit.pow;
		gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = bunit->unit.skl;
		gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = bunit->unit.lck;
		gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = bunit->unit.spd;
		gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = bunit->unit.def;
		gEkrLvupPostStatus[EKRLVUP_STAT_RES] = bunit->unit.res;
		gEkrLvupPostStatus[EKRLVUP_STAT_CON] = bunit->unit.jinfo->base_con + bunit->unit.pinfo->bonus_con;
	}

	InitTextFont(&gBanimFont, (u8 *)BG_VRAM + VRAMOFF_BG_EKRLVUP_FONT, VRAMOFF_BG_EKRLVUP_FONT / 0x20, 0);

	for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
		int text_x;

		if (!UnitKnowsMagic(unit))
			str = EkrLvupMsgsStr[i];
		else
			str = EkrLvupMsgsMag[i];

		InitText(&gBanimText[i], 3);
		text_x = GetStringTextLen(str);
		text_x = (0x10 - text_x) >> 1;
		if (text_x < 0)
			text_x = 0;

		Text_SetCursor(&gBanimText[i], text_x);
		Text_SetColor(&gBanimText[i], TEXT_COLOR_SYSTEM_GOLD);
		Text_DrawString(&gBanimText[i], str);
		PutText(&gBanimText[i], gBg2Tm + sEfxLvupPartsPos[i]);
	}

	for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
		InitText(&gBanimText[EKRLVUP_STAT_MAX + i], 2);
		Text_SetCursor(&gBanimText[EKRLVUP_STAT_MAX + i], 8);
		Text_SetColor(&gBanimText[EKRLVUP_STAT_MAX + i], TEXT_COLOR_SYSTEM_BLUE);
		Text_DrawNumber(&gBanimText[EKRLVUP_STAT_MAX + i], gEkrLvupBaseStatus[i]);
		PutText(&gBanimText[EKRLVUP_STAT_MAX + i], gBg2Tm + 3 + sEfxLvupPartsPos[i]);
	}

	/* class */
	th = &gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_CLASS];
	InitText(th, 8);
	Text_DrawString(th,
		DecodeMsg(gpEkrLvupUnit->jinfo->msg_name));
	PutText(th, gBg2Tm + TM_OFFSET(2, 7));

	/* level msg */
	th = &gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LV_MSG];
	InitText(th, 3);
	Text_SetColor(th, TEXT_COLOR_SYSTEM_GOLD);
	Text_DrawString(th, gMsg_Lv);
	PutText(th, gBg2Tm + TM_OFFSET(10, 7));

	/* level value */
	th = &gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LV_VAL];
	InitText(th, 2);
	Text_SetCursor(th, 8);
	Text_SetColor(th, TEXT_COLOR_SYSTEM_BLUE);
	Text_DrawNumber(th, gEkrLvupPreLevel);
	PutText(th, gBg2Tm + TM_OFFSET(13, 7));
}

void Ekrlvup_PutBaseStatus(struct ProcEkrlvup *proc, int index)
{
	struct Text *text = &gBanimText[EKRLVUP_STAT_CLASS + index];

	ClearText(text);
	Text_SetCursor(text, 8);
	Text_SetColor(text, TEXT_COLOR_SYSTEM_BLUE);
	Text_DrawNumber(text, gEkrLvupBaseStatus[index]);
	PutText(text, gBg2Tm + TM_OFFSET(3, 0) + sEfxLvupPartsPos[index]);
}

void Ekrlvup_PutJobname(struct ProcEkrlvup *proc)
{
	struct Text *text = &gBanimText[EKRLVUP_TEXT_16];

	ClearText(text);
	Text_DrawString(text, DecodeMsg(gpEkrLvupUnit->jinfo->msg_name));
	PutText(text, gBg2Tm + TM_OFFSET(2, 7));
}

void Ekrlvup_PutPreLevel(struct ProcEkrlvup *proc)
{
	struct Text *text = &gBanimText[EKRLVUP_TEXT_18];

	ClearText(text);
	Text_SetCursor(text, 8);
	Text_SetColor(text, TEXT_COLOR_SYSTEM_BLUE);
	Text_DrawNumber(text, gEkrLvupPreLevel);
	PutText(text, gBg2Tm + TM_OFFSET(13, 7));
}

void NewEkrLevelup(struct Anim *anim)
{
	struct ProcEkrlvup *proc;

	gpProcEkrLevelup = proc = SpawnProc(ProcScr_EkrLevelup, PROC_TREE_3);
	proc->anim_this = anim;
	proc->anim_other = GetAnimAnotherSide(anim);
	proc->timer = 0;
	proc->finished = false;

	if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
		proc->is_promotion = false;
	else
		proc->is_promotion = true;
}

void EkrLvup_Init(struct ProcEkrlvup *proc)
{
	struct EkrTerrainfxDesc *desc = &gEkrLvupTerrainfxDesc;

	CpuFastFill(0, gBg1Tm, 0x800);
	CpuFastFill(0, gBg2Tm, 0x800);

	RegisterDataMove(gBg1Tm, (u8 *)BG_VRAM + VRAMOFF_BANIM_6800, 0x800);
	RegisterDataMove(gBg1Tm, (u8 *)BG_VRAM + VRAMOFF_BANIM_7000, 0x800);
	RegisterDataMove(gBg2Tm, (u8 *)BG_VRAM + VRAMOFF_BANIM_5000, 0x800);
	RegisterDataMove(gBg2Tm, (u8 *)BG_VRAM + VRAMOFF_BANIM_5800, 0x800);

	desc->terrain_l = gBanimFloorfx[POS_L];
	desc->pal_l = OBPAL_EFX_FACE;
	desc->chr_l = VRAMOFF_OBJ_2000 / CHR_SIZE;
	desc->terrain_r = gBanimFloorfx[POS_R];
	desc->pal_r = OBPAL_EFX_4;
	desc->chr_r = VRAMOFF_OBJ_2800 / CHR_SIZE;
	desc->distance = gEkrDistanceType;
	desc->bg_index = -1;
	desc->vram_offset = (int)OBJ_VRAM0; // bug?
	desc->img_buf = (u8 *)gBanimBuf_20145C0;
	desc->unk_10 = (u16)gEkrSnowWeather;

	if (gEkrDistanceType == EKR_DISTANCE_FARFAR) {
		if (gEkrInitPosReal == POS_L)
			desc->terrain_r = -1;
		else
			desc->terrain_l = -1;
	}

	if (GetBattleAnimArenaFlag() == false) {
		struct ProcEkrSubAnimeEmulator *emu;

		NewEkrTerrainfx(desc);

		emu = desc->proc1;
		emu->oam2Base &= (u16)~OAM2_LAYER(0x3);
		emu->oam2Base |=       OAM2_LAYER(0x3);

		emu = desc->proc2;
		emu->oam2Base &= (u16)~OAM2_LAYER(0x3);
		emu->oam2Base |=       OAM2_LAYER(0x3);
	}

	proc->anim_this->oam2  &= ~OAM2_LAYER(0x3);
	proc->anim_this->oam2  |=  OAM2_LAYER(0x3);
	proc->anim_other->oam2 &= ~OAM2_LAYER(0x3);
	proc->anim_other->oam2 |=  OAM2_LAYER(0x3);

	gDispIo.bg2_ct.priority = 0;
	gDispIo.bg1_ct.priority = 1;
	gDispIo.bg0_ct.priority = 2;
	gDispIo.bg3_ct.priority = 3;

	if (*GetEkrDragonWeapon(POS_L) == IID_FIRESTONE) {
		proc->anim_other->oam2 &= ~OAM2_LAYER(0x3);
		proc->anim_other->oam2 |=  OAM2_LAYER(0x2);

		gDispIo.bg0_ct.priority = 2;
		gDispIo.bg1_ct.priority = 1;
		gDispIo.bg2_ct.priority = 0;
		gDispIo.bg3_ct.priority = 2;
	}

	gEkrLvupScrollPos1 = 0x90;
	gEkrLvupScrollPos2 = 0x90;

	SetBgOffset(BG_2, 0, 8);
	SetBgOffset(BG_1, 0, 8);

	SetBgTilemapOffset(BG_0, 0x6000);
	SetBgTilemapOffset(BG_1, 0x6800);
	SetBgTilemapOffset(BG_2, 0x5000);

	SetBgScreenSize(BG_1, 1);
	SetBgScreenSize(BG_2, 1);

	gpProcEfxPartsofScroll = NewEfxPartsofScroll();
	gpProcEfxleveluphb = NewEfxleveluphb();

	EfxUpdatePartsofScroll();
	EkrGauge_Setup44(2);
	DisableEfxStatusUnits(proc->anim_this);
	DisableEfxStatusUnits(proc->anim_other);
	DisableEfxWeaponIcon();
	DisableEfxHpBarColorChange();

    SetWinEnable(0, 0, 0);
    SetBlendNone();
    Proc_Break(proc);
}
