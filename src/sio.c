#include "prelude.h"
#include "gbaio.h"
#include "proc.h"
#include "hardware.h"
#include "armfunc.h"
#include "text.h"
#include "msg.h"
#include "ui.h"
#include "util.h"
#include "bm.h"
#include "unit.h"
#include "unitsprite.h"
#include "sound.h"
#include "m4a.h"
#include "save_multiarena.h"
#include "unitlistscreen.h"
#include "secretscreen.h"
#include "unknown_objects.h"
#include "sio_core.h"
#include "sio.h"

#include "constants/iids.h"
#include "constants/songs.h"
#include "constants/msg.h"

char const SioText_HideUnits[] = "ユニットを隠す";
char const SioText_VictoryCondition[] = "対戦勝利条件";
char const SioText_Points[] = "ポイント";
char const SioText_Survival[] = "サバイバル";
char const SioText_AutoWeapons[] = "自動武器選択";
char const SioText_On[] = "オン";
char const SioText_Off[] = "オフ";
char const SioText_NowLoading[] = "ＮＯＷ　ＬＯＡＤＩＮＧ";
char const SioText_ConnectionSuccess[] = "接続　成功";
char const SioText_ConnectionError[] = "接続エラー";
char const SioText_Preparing[] = "準　備　中";
char const SioText_NotConnected[] = "未　接　続";
char const SioText_CreateTeam[] = "チーム作成";
char const SioText_VersusTeam[] = "対戦チーム";
char const SioText_UnitList[] = "部隊\x95\x5C"; // \x95\x5C = 表
char const SioText_SwapTeams[] = "チーム入替え";
char const SioText_EraseTeam[] = "チーム削除";
char const SioText_LinkMenu[] = "通信メニュー";

u32 SioStrCpy(void const * src, void * dst)
{
	u8 const * s = src;
	u8 * d = dst;
	u32 ret = 0;

	while (*s != '\0') {
		*d++ = *s++;
		ret++;
	}

	*d = *s;
	return ret;
}

void SIOCON_Init(void)
{
	SioInit_HW();
	SioInit_SW();

	gSioSt->unk_001 = 1;
	gSioSt->unk_004 = 0;
}

void SIOCON_Loop(ProcPtr proc)
{
	u16 magic = 0x2586;

	if (SioPollingMsg() != -1) {
		gSioSt->unk_011 = 0;
		gSioSt->unk_004 = 5;
		gSioSt->self_id = GetSioIndex();
		SioSend16(&magic, -1);
		Proc_Break(proc);
	}
}

void SetBmStLinkArenaFlag(void)
{
	gBmSt.flags |= BM_FLAG_LINKARENA;
}

void UnsetBmStLinkArenaFlag(void)
{
	gBmSt.flags &= ~BM_FLAG_LINKARENA;
}

int CheckInLinkArena(void)
{
	return (gBmSt.flags >> 6) & 1;
}

void func_fe6_08036994(void)
{
	gLinkArenaSt.unk_04 = -1;
}

void func_fe6_080369A0(struct ProcSioBlend * proc)
{
	SetBlendTargetA(0, 0, 1, 0, 0);
	SetBlendTargetB(1, 1, 0, 1, 1);
	SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

	proc->timer = 0;
}

void func_fe6_080369E0(struct ProcSioBlend * proc)
{
	int time = (++proc->timer) % 0x40;

	if (time >= 0x20)
		time = 0x40 - time;

	if (time > 0x10)
		time = 0x10;

	SetBlendTargetA(0, 0, 1, 0, 0);
	SetBlendTargetB(1, 1, 0, 1, 1);
	SetBlendAlpha(time, 0x10 - time);
}

void func_fe6_08036A40(void)
{
	gDispIo.bg_off[BG_1].x++;
	gDispIo.bg_off[BG_2].x--;
}

void func_fe6_08036A54(ProcPtr proc)
{
	gSioSt->unk_030 = 0x9ABC;

	if (gSioSt->unk_1B7E != 0)
		Proc_Break(proc);
}

void func_fe6_08036A80(void)
{
	gSioSt->unk_00A = 1 << gSioSt->self_id;
}

void func_fe6_08036A94(ProcPtr proc)
{
	gSioMsgBuf.kind = SIO_MSG_19;
	gSioMsgBuf.sender = gSioSt->self_id;
	gSioMsgBuf.param = 0;

	SioSend(&gSioMsgBuf, 4);

	if ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->unk_009) {
		gSioSt->unk_00A = 1 << gSioSt->self_id;
		Proc_Break(proc);
	}
}

void SioHold_Loop(struct ProcSioHold * proc)
{
	if (proc->y < proc->y_max && proc->y > proc->y_min)
		PutFrozenUiHand(proc->x, proc->y);
}

ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min)
{
	struct ProcSioHold * proc;

	proc = SpawnProc(ProcScr_SioHOLD, parent);
	proc->x = x;
	proc->y = y;
	proc->y_max = y_max;
	proc->y_min = y_min;

	return proc;
}

void EndSioHold(void)
{
	Proc_EndEach(ProcScr_SioHOLD);
}

void func_fe6_08036B38(ProcPtr proc, int num)
{
	((struct ProcSioHold *) proc)->y += num;
}

void ClearSioBG(void)
{
	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, 0, 0);
	SetBgOffset(BG_3, 0, 0);

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void ClearSioAllBGs(void)
{
	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, 0, 0);
	SetBgOffset(BG_3, 0, 0);

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);
	TmFill(gBg3Tm, 0);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void SioPutText(int msg, int text_idx)
{
	struct Text * text = &gSioTexts[text_idx];

	ClearText(text);

	if (msg < 0) {
		PutText(text, gBg2Tm + TM_OFFSET(1, text_idx * 2 + 0x10));
	} else {
		Text_DrawString(text, DecodeMsg(msg));
		PutText(text, gBg2Tm + TM_OFFSET(1, text_idx * 2 + 0x10));
		EnableBgSync(BG2_SYNC_BIT);
	}
}

void func_fe6_08036C60(void)
{
	int i;

	for (i = 0; i < 6; i++)
		InitText(&gSioText_0203C67C[i], 12);

	for (i = 0; i < 11; i++)
		InitText(&gLinkArenaSt.texts[i], 12);

	for (i = 0; i < 2; i++)
		InitText(&gSioTexts[i], 24);
}

void SioSetNormalWeapons(struct Unit * unit)
{
	int i;
	u8 item_list[] = {
		IID_IRONSWORD,
		IID_IRONLANCE,
		IID_IRONAXE,
		IID_IRONBOW,
		IID_NONE,
		IID_FIRE,
		IID_LIGHTNING,
		IID_FLUX,
	};

	for (i = 0; i < ITEMSLOT_INV_COUNT; i++)
		unit->items[i] = 0;

	for (i = 0; i < 8; i++) {
		if (i == 4)
			continue;

		if (unit->wexp[i] == 0)
			continue;

		UnitAddItem(unit, item_list[i] | (0xFF << 8));
	}
}

void SioPlaySe(int idx)
{
	u16 se_list[] = { SONG_6C, SONG_6B, SONG_6A, SONG_66 };

	PlaySe(se_list[idx]);
}

void func_fe6_08036D3C(void)
{
	ReadMultiArenaSaveConfig((u16 *) &gSioSaveConfig);
	gSioSaveConfig.unk_3 = true;
	WriteMultiArenaSaveConfig((u16 *) &gSioSaveConfig);
}

bool SioIsKeyInputSequenceComplete(u16 const * list)
{
	if (gKeySt->pressed == 0) {
		if (++gKeyInputSequenceTimer >= 20)
			gTargetKeyInSeqIndex = gKeyInputSequenceTimer = 0;

		return false;
	}

	gKeyInputSequenceTimer = 0;
	gKeyInputSequenceBuffer[gCurrentKeyInSeqIndex] = gKeySt->pressed;

	if (gKeyInputSequenceBuffer[gCurrentKeyInSeqIndex] == list[gTargetKeyInSeqIndex]) {
		gTargetKeyInSeqIndex = gTargetKeyInSeqIndex + 1;

		if (list[gTargetKeyInSeqIndex] == 0xFFFF)
			return true;
	} else {
		gTargetKeyInSeqIndex = 0;
	}

	gCurrentKeyInSeqIndex = (gCurrentKeyInSeqIndex + 1) & 0xF;
	return false;
}

int CheckDisplayPasswordScreenCombo(void)
{
	return SioIsKeyInputSequenceComplete(gSioKeyList_PasswordScreenEN);
}

void StartLinkArenaTeamList(ProcPtr parent)
{
	SpawnProcLocking(ProcScr_SioTeamList, parent);
}

void SioTeamList_Init(struct SioTeamListProc * proc)
{
	proc->y_bg1 = 216;
	proc->unk_48 = 0;
	proc->unk_40 = 0;
	proc->option_idx = 0;
	proc->selected_option = MULTIARENA_LIST_NONE;
	proc->unk_54 = 0xFF;
	proc->selected_team = 0xFF;
	proc->unk_4C = 0;
}

bool CanBuildNewLinkArenaTeam(void)
{
	int i;

	if (gLinkArenaSt.unk_0A == 0)
		return FALSE;

	for (i = 0; i < MULTIARENA_MAX_TEAMS; i++) {
		if ((gLinkArenaTeamList[i].unk_0F & 0x80) != 0)
			return TRUE;
	}

	return FALSE;
}

bool CanDirectlyBuildNewLinkArenaTeam(void)
{
	int i;

	for (i = 0; i < MULTIARENA_MAX_TEAMS; i++) {
		if ((gLinkArenaTeamList[i].unk_0F & 0x80) == 0)
			return TRUE;
	}

	return FALSE;
}

int GetSioTeams(int active_option, u8 mode)
{
	int i;
	int count = 0;
	char buf[16];

	struct LATeamListConfig * conf = gSioTeamListConfigLut[mode];

	InitUnits();

	switch (mode) {
	case 0:
		for (i = 0; i < MULTIARENA_MAX_TEAMS; i++) {
			if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[i].name) == 1) {
				gLinkArenaTeamList[i].unk_10 = conf[active_option].unk_04;
				gLinkArenaTeamList[i].unk_0F = i;
			} else {
				SioStrCpy(SioText_NoData, gLinkArenaTeamList[i].name);
				gLinkArenaTeamList[i].unk_10 = conf[active_option].unk_05;
				gLinkArenaTeamList[i].unk_0F = i | 0x80;
			}

			ReadMultiArenaSaveTeam(i, GetUnit(i * 5 + 1), buf);
		}

		count = i;
		break;

	case 1:
	case 2:
		for (i = 0; i < MULTIARENA_MAX_TEAMS; i++) {
			if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[count].name) == 1) {
				gLinkArenaTeamList[count].unk_10 = conf[active_option].unk_04;
				gLinkArenaTeamList[count].unk_0F = i;
				ReadMultiArenaSaveTeam(i, GetUnit(count * 5 + 1), buf);

				count++;
			}
		}

		break;
	}

	return count;
}

void DrawLinkArenaTeamName(int idx)
{
	ClearText(&gLinkArenaSt.texts[idx]);
	Text_SetColor(&gLinkArenaSt.texts[idx], TEXT_COLOR_SYSTEM_WHITE);
	Text_DrawString(&gLinkArenaSt.texts[idx], gLinkArenaTeamList[idx].name);

	gLinkArenaSt.texts[idx].chr_position =
		(gLinkArenaSt.texts[idx].chr_position & 0xFFF) | ((gLinkArenaTeamList[idx].unk_10 & 0xF) << 12);

	PutText(&gLinkArenaSt.texts[idx], gBg1Tm + TM_OFFSET(11, idx * 2));
}

void DrawAllLinkArenaTeams(struct SioTeamListProc * proc)
{
	int i;

	for (i = 0; i < proc->unk_38; i++)
		DrawLinkArenaTeamName(i);
}

void func_fe6_0803703C(struct SioTeamListProc * proc, u8 mode)
{
	int i;

	struct LATeamListConfig * conf = gSioTeamListConfigLut[mode];

	for (i = 0; i < proc->unk_38; i++) {
		if ((gLinkArenaTeamList[i].unk_0F & 0x80) == 0)
			gLinkArenaTeamList[i].unk_10 = conf[proc->option_idx].unk_04;
		else
			gLinkArenaTeamList[i].unk_10 = conf[proc->option_idx].unk_05;

		gLinkArenaSt.texts[i].chr_position =
			(gLinkArenaSt.texts[i].chr_position & 0xFFF) | ((gLinkArenaTeamList[i].unk_10 & 0xF) << 12);

		PutText(&gLinkArenaSt.texts[i], gBg1Tm + TM_OFFSET(11, i * 2));
	}

	EnableBgSync(BG1_SYNC_BIT);
}

void SioTeamList_EraseTeam(struct SioTeamListProc * proc)
{
	int team = proc->unk_40;

	struct LATeamListConfig * conf = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

	struct Unit * unit = GetUnit(team * 5 + 1);

	WipeMultiArenaSaveTeam(gLinkArenaTeamList[team].unk_0F & 0x7F);
	ReadMultiArenaSaveTeam(team, unit, gLinkArenaTeamList[team].name);

	SioStrCpy(SioText_NoData, gLinkArenaTeamList[team].name);

	gLinkArenaTeamList[team].unk_10 = conf[proc->option_idx].unk_05;
	gLinkArenaTeamList[team].unk_0F = team | 0x80;
	DrawLinkArenaTeamName(team);

	if (!CanDirectlyBuildNewLinkArenaTeam()) {
		func_fe6_080372B0(gLinkArenaSt.unk_00, proc);
		Proc_Goto(proc, 2);
	} else if (proc->valid_options[0] == 0) {
		func_fe6_080372B0(gLinkArenaSt.unk_00, proc);
	}

	UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->y_bg1 + 40);

	EnableBgSync(BG1_SYNC_BIT);
}

void SioTeamList_SwapTeams(struct SioTeamListProc * proc)
{
	int tmp;

	int team_b = proc->unk_40;
	int team_a = proc->selected_team;

	SwapMultiArenaSaveTeams(gLinkArenaTeamList[team_a].unk_0F & 0x7F, gLinkArenaTeamList[team_b].unk_0F & 0x7F);

	tmp = gLinkArenaTeamList[team_a].unk_10;
	gLinkArenaTeamList[team_a].unk_10 = gLinkArenaTeamList[team_b].unk_10;
	gLinkArenaTeamList[team_b].unk_10 = tmp;

	if (ReadMultiArenaSaveTeam(team_a, GetUnit(team_a * 5 + 1), gLinkArenaTeamList[team_a].name) == 0) {
		SioStrCpy(SioText_NoData, gLinkArenaTeamList[team_a].name);
		gLinkArenaTeamList[team_a].unk_0F = team_a | 0x80;
	} else {
		gLinkArenaTeamList[team_a].unk_0F = team_a;
	}

	if (ReadMultiArenaSaveTeam(team_b, GetUnit(team_b * 5 + 1), gLinkArenaTeamList[team_b].name) == 0) {
		SioStrCpy(SioText_NoData, gLinkArenaTeamList[team_b].name);
		gLinkArenaTeamList[team_b].unk_0F = team_b | 0x80;
	} else {
		gLinkArenaTeamList[team_b].unk_0F = team_b;
	}

	DrawLinkArenaTeamName(team_b);
	DrawLinkArenaTeamName(team_a);

	UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->y_bg1 + 40);

	Proc_End(proc->sio_hold_proc);

	proc->selected_option = MULTIARENA_LIST_SWAP;

	EnableBgSync(BG1_SYNC_BIT);
}

int func_fe6_080372B0(u8 mode, struct SioTeamListProc * proc)
{
	int color;

	int i = 0;
	struct LATeamListConfig * conf = gSioTeamListConfigLut[mode];

	if (mode == 1) {
		for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++) {
			SioStrCpy(gUnk_Sio_0810F170, gUnk_Sio_0203C944[i]);
			ClearText(&gLinkArenaSt.unk_64[i]);
			PutDrawTextCentered(&gLinkArenaSt.unk_64[i], 1, i * 3 + 5, gUnk_Sio_0203C944[i], 10);
		}

		return gLinkArenaSt.unk_05 + 2;
	}

	while (1) {
		if (conf[i].menu_text == NULL)
			return i;

		proc->valid_options[i] = 1;
		color = TEXT_COLOR_SYSTEM_WHITE;

		if (conf[i].is_valid != NULL && !conf[i].is_valid()) {
			proc->valid_options[i] = 0;
			color = TEXT_COLOR_SYSTEM_GRAY;
		}

		ClearText(&gSioText_0203C67C[i]);
		Text_SetColor(&gSioText_0203C67C[i], color);
		PutDrawTextCentered(&gSioText_0203C67C[i], 1, i * 2 + 5, conf[i].menu_text, 7);

		i++;
	}
}

u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc)
{
	struct LATeamListConfig * conf = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

	if (gLinkArenaSt.unk_00 != 1)
		return conf[proc->option_idx].help_msg;

	if (proc->option_idx == 0)
		return MSG_6D1;
	else
		return MSG_6D2;
}

void SioTeamList_SetupGfx(struct SioTeamListProc * proc)
{
	int i;
	u8 buf[8];

	u16 const * text_pal = Pal_Text;

	ClearSioBG();
	InitSioBG();

	Decompress(Img_TacticianSelObj, OBJ_VRAM0 + 0x240 * CHR_SIZE);
	Sio_RestartBgSlide(0, 2);
	TmApplyTsa(gBg2Tm + TM_OFFSET(9, 4), Tsa_Sio_08109DF4, TILEREF(0, 1));
	ApplyPaletteExt(Pal_TacticianSelObj, 0x13 * 0x20, 0x80);

	Decompress(Img_Sio_081080D4, OBJ_VRAM0 + 0x300 * CHR_SIZE);
	ApplyPaletteExt(Pal_Sio_0831AABC, 0x11 * 0x20, 0x40);

	gPal[0x20] = 0;

	for (i = 0; i < 3; i++)
		gPal[0x21 + i] = text_pal[4 + i];

	EnablePalSync();

	SetTextFont(&gSioFont_0203C758);
	InitSystemTextFont();
	ResetTextFont();

	func_fe6_08036C60();

	ApplyUnitSpritePalettes();
	ResetUnitSprites();
	ForceSyncUnitSpriteSheet();

	proc->unk_38 = GetSioTeams(proc->option_idx, gLinkArenaSt.unk_00);

	for (i = 0; i < 5; i++)
		buf[i] = 0;

	buf[proc->option_idx] = 1;

	proc->num_active_options = func_fe6_080372B0(gLinkArenaSt.unk_00, proc);

	DrawAllLinkArenaTeams(proc);

	proc->unk_2C = func_fe6_080403C0(proc, proc->num_active_options, buf);

	for (i = 0; i < 4; i++)
		gLinkArenaSt.unk_06[i] = 0xFF;

	proc->unk_5C = 0;

	SetBgOffset(BG_1, 0, proc->y_bg1);

	SetWinEnable(1, 1, 0);

	SetWin0Box(0, 40, DISPLAY_WIDTH, 136);
	SetWin1Box(0, 136, DISPLAY_WIDTH, DISPLAY_HEIGHT);

	SetWin0Layers(1, 1, 1, 1, 1);
	SetWin1Layers(1, 0, 1, 1, 0);
	SetWOutLayers(1, 0, 1, 1, 1);

	StartLinkArenaTitleBanner(proc->unk_2C, gUnk_Sio_0810F19C[gLinkArenaSt.unk_00]);
	func_fe6_0803FD40(gUnk_Sio_085C9AD4[gLinkArenaSt.unk_00], gUnk_Sio_0810F190[gLinkArenaSt.unk_00], 0, 8, gLinkArenaSt.unk_00, proc->unk_2C);

	SioPutText(GetLATeamListHelpTextId(proc), 1);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total)
{
	if (gKeySt->repeated & KEY_DPAD_UP) {
		if (*selection > min || gKeySt->repeated == gKeySt->pressed) {
			*selection = *selection - 1;

			if (*selection < 0)
				*selection = total - 1;
		}
	}

	if (gKeySt->repeated & KEY_DPAD_DOWN) {
		if (*selection < max || gKeySt->repeated == gKeySt->pressed) {
			*selection = *selection + 1;
			*selection = *selection % total;
		}
	}
}

void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc)
{
	int previous = proc->option_idx;

	struct LATeamListConfig * conf = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

	struct SioProc85AAA78 * unk_2C = proc->unk_2C;
	unk_2C->unk_44 = 1;
	unk_2C->unk_48 = -1;

	SioTeamList_Main_HandleDPadInput(&proc->option_idx, proc->num_active_options - 1, 0, proc->num_active_options);

	if (previous != proc->option_idx) {
		SioPlaySe(3);

		unk_2C->unk_3A[previous] = 0;
		unk_2C->unk_3A[proc->option_idx] = 1;

		func_fe6_0803703C(proc, gLinkArenaSt.unk_00);
		SioPutText(GetLATeamListHelpTextId(proc), 1);
	}

	if (gKeySt->pressed & KEY_BUTTON_A) {
		if (gLinkArenaSt.unk_00 != 1) {
			if (proc->valid_options[proc->option_idx] != 0) {
				proc->selected_option = conf[proc->option_idx].kind;

				if (proc->selected_option == MULTIARENA_LIST_LINKMENU) {
					SioPlaySe(1);
					Proc_Goto(proc, 9);
					gLinkArenaSt.unk_03 = 0xFF;
					return;
				}

				SioPlaySe(2);

				Proc_Break(proc);
			} else {
				SioPlaySe(0);
			}
		} else {
			SioPlaySe(2);

			proc->selected_option = MULTIARENA_LIST_8;
			proc->selected_team = proc->option_idx;
			proc->unk_44 = 0;

			Proc_Goto(proc, 5);

			return;
		}
	}

	if (gKeySt->pressed & KEY_BUTTON_B) {
		SioPlaySe(1);
		Proc_Goto(proc, 9);
		gLinkArenaSt.unk_03 = 0xFF;
	}

	if ((gKeySt->pressed & KEY_BUTTON_START) && proc->unk_5C != 0) {
		PlaySe(SONG_6A);
		gLinkArenaSt.unk_03 = 0;
		Proc_Goto(proc, 9);
	}
}

void SioTeamList_StartUnitList(struct SioTeamListProc * proc)
{
	char buf[16];
	struct Unit * unit;

	Proc_End(proc->unk_2C);
	Sio_EndBackgroundSlide();

	InitUnits();

	unit = GetUnit(1);
	ReadMultiArenaSaveTeam(gLinkArenaTeamList[proc->unk_40].unk_0F, unit, buf);

	StartUnitListScreenUnk(proc);
}

void SioTeamList_WaitForUnitListScreen(ProcPtr proc)
{
	if (FindProc(ProcScr_UnitListScreen_PrepMenu) == NULL)
		Proc_Break(proc);
}

int func_fe6_0803784C(void)
{
	int i;

	for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++) {
		if (gLinkArenaSt.unk_06[i] == 0xFF)
			return 0;
	}

	return 1;
}

void SioTeamList_Loop_SubSel(struct SioTeamListProc * proc)
{
	int unk_40 = proc->unk_40;
	struct SioProc85AAA78 * unk_2C = proc->unk_2C;

	if (SioIsKeyInputSequenceComplete(KeyList_SioSecretTeam) && (gLinkArenaTeamList[unk_40].unk_0F & 0x80) == 0) {
		Proc_Goto(proc, 8);
		return;
	}

	unk_2C->unk_44 = 0;
	unk_2C->unk_48 = (proc->unk_40 - proc->unk_48) * 16 + 40;

	if (proc->unk_4C > 0) {
		proc->y_bg1 -= 4;
		proc->unk_4C--;

		SetBgOffset(BG_1, 0, proc->y_bg1);

		if (proc->sio_hold_proc != NULL)
			func_fe6_08036B38(proc->sio_hold_proc, +4);

		ScrollMultiArenaTeamSprites(+4);

		PutUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
		UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->y_bg1 + 40);

		return;
	} else if (proc->unk_4C < 0) {
		proc->y_bg1 += 4;
		proc->unk_4C++;

		SetBgOffset(BG_1, 0, proc->y_bg1);

		if (proc->sio_hold_proc != NULL)
			func_fe6_08036B38(proc->sio_hold_proc, -4);

		ScrollMultiArenaTeamSprites(-4);

		PutUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
		UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->y_bg1 + 40);

		return;
	}

	PutUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);

	if (gKeySt->pressed & KEY_BUTTON_A) {
		switch (proc->selected_option) {
		case MULTIARENA_LIST_BUILDTEAM:
			if (gLinkArenaTeamList[unk_40].unk_0F & 0x80) {
				SioPlaySe(2);
				gLinkArenaSt.unk_03 = proc->unk_40;
				Proc_Break(proc);
				return;
			}

			SioPlaySe(0);
			break;

		case MULTIARENA_LIST_SELECTTEAM:
			SioPlaySe(2);
			gLinkArenaSt.unk_03 = gLinkArenaTeamList[unk_40].unk_0F;
			Proc_Break(proc);
			return;

		case MULTIARENA_LIST_UNITLIST:
			if ((gLinkArenaTeamList[unk_40].unk_0F & 0x80) == 0) {
				SioPlaySe(2);
				Proc_Goto(proc, 4);
				return;
			}

			SioPlaySe(0);
			break;

		case MULTIARENA_LIST_SWAP:
			if (proc->unk_38 > 1) {
				SioPlaySe(2);

				proc->selected_team = unk_40;
				proc->sio_hold_proc = StartSioHold(proc, 80, (proc->selected_team - proc->unk_48) * 16 + 40, 0x88, 0x27);

				if (unk_40 + 1 < proc->unk_38)
					gKeySt->repeated |= KEY_DPAD_DOWN;
				else
					gKeySt->repeated |= KEY_DPAD_UP;

				proc->selected_option = MULTIARENA_LIST_CONFIRMSWAP;
			}
			break;

		case MULTIARENA_LIST_LINKMENU:
			break;

		case MULTIARENA_LIST_CONFIRMSWAP:
			SioPlaySe(2);
			SioTeamList_SwapTeams(proc);
			break;

		case MULTIARENA_LIST_DISBAND:
			if ((gLinkArenaTeamList[unk_40].unk_0F & 0x80) == 0) {
				SioPlaySe(2);
				proc->sio_hold_proc = StartSioHold(proc, 80, (unk_40 - proc->unk_48) * 16 + 40, 0x88, 0x27);
				Proc_Goto(proc, 7);
			} else {
				SioPlaySe(0);
			}
			break;

		case MULTIARENA_LIST_8:
			SioPlaySe(2);

			SioStrCpy(gLinkArenaTeamList[unk_40].name, gUnk_Sio_0203C944[proc->selected_team]);

			gLinkArenaSt.unk_06[proc->selected_team] = gLinkArenaTeamList[unk_40].unk_0F;

			ClearText(&gLinkArenaSt.unk_64[proc->selected_team]);
			PutDrawTextCentered(
				&gLinkArenaSt.unk_64[proc->selected_team], 1, proc->selected_team * 3 + 5,
				gUnk_Sio_0203C944[proc->selected_team], 10);

			proc->unk_5C = func_fe6_0803784C();

			if (proc->unk_5C != 0 && unk_2C->unk_40 == 0)
				unk_2C->unk_40 = 8;

			proc->unk_44 = 0;
			Proc_Goto(proc, 6);
			break;
		}
	}

	if (gKeySt->pressed & KEY_BUTTON_B) {
		SioPlaySe(1);

		if (proc->selected_option == MULTIARENA_LIST_CONFIRMSWAP) {
			proc->selected_option = MULTIARENA_LIST_SWAP;
			Proc_End(proc->sio_hold_proc);
			return;
		}

		if (proc->selected_option != MULTIARENA_LIST_8) {
			Proc_Goto(proc, 2);
		} else {
			proc->unk_44 = 0;
			Proc_Goto(proc, 6);
		}
	}

	if ((gKeySt->pressed & KEY_BUTTON_START) && proc->unk_5C != 0) {
		PlaySe(SONG_6A);
		gLinkArenaSt.unk_03 = 0;
		Proc_Goto(proc, 9);
	}

	if (gKeySt->repeated & KEY_DPAD_UP) {
		if (proc->unk_48 != 0 && (proc->unk_40 - proc->unk_48) < 2) {
			proc->y_bg1 -= 4;

			if (proc->sio_hold_proc != NULL)
				func_fe6_08036B38(proc->sio_hold_proc, +4);

			ScrollMultiArenaTeamSprites(+4);

			proc->unk_48--;
			proc->unk_4C = +3;
			proc->unk_40--;

			SetBgOffset(BG_1, 0, proc->y_bg1);

			UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->y_bg1 + 40);
		} else if (proc->unk_40 > 0) {
			proc->unk_40--;
		}
	}

	if (gKeySt->repeated & KEY_DPAD_DOWN) {
		if (proc->unk_38 > 6 && proc->unk_48 + 6 < proc->unk_38 && (proc->unk_40 - proc->unk_48) > 3) {
			proc->y_bg1 += 4;

			if (proc->sio_hold_proc != NULL)
				func_fe6_08036B38(proc->sio_hold_proc, -4);

			ScrollMultiArenaTeamSprites(-4);

			proc->unk_48++;
			proc->unk_4C = -3;
			proc->unk_40++;

			SetBgOffset(BG_1, 0, proc->y_bg1);

			UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->y_bg1 + 40);
		} else if (proc->unk_40 < proc->unk_38 - 1) {
			proc->unk_40++;
		}
	}

	if (unk_40 != proc->unk_40)
		SioPlaySe(3);
}

void func_fe6_08037D74(struct SioProc85AAA78 * proc, i8 x)
{
	int i;

	for (i = 0; i < 5; i++)
		proc->unk_30[i] = -x - 8;
}

void SioTeamList_SubSel_Switching(struct SioTeamListProc * proc)
{
	struct SioProc85AAA78 * unk_2C = proc->unk_2C;
	i8 x = gXposArray_SioTeamListSwicthing[proc->unk_44];

	if (x == -1)
		Proc_Goto(proc, 3);

	proc->unk_44++;

	if (x == -2) {
		gDispIo.bg1_ct.priority = 0;
		gDispIo.bg2_ct.priority = 1;
		gDispIo.bg0_ct.priority = 2;
		gDispIo.bg3_ct.priority = 3;

		unk_2C->unk_44 = 0;
	} else {
		SetBgOffset(BG_0, x, 0);
		func_fe6_08037D74(unk_2C, x);
	}
}

void func_fe6_08037E14(struct SioTeamListProc * proc)
{
	struct SioProc85AAA78 * unk_2C = proc->unk_2C;
	i8 x = gXposArray_SioTeamListSwicthing[proc->unk_44];

	if (x == -1)
		Proc_Goto(proc, 2);

	proc->unk_44++;

	if (x == -2) {
		gDispIo.bg0_ct.priority = 0;
		gDispIo.bg1_ct.priority = 1;
		gDispIo.bg2_ct.priority = 2;
		gDispIo.bg3_ct.priority = 3;

		unk_2C->unk_44 = 1;
		unk_2C->unk_48 = -1;
	} else {
		SetBgOffset(BG_0, x, 0);
		func_fe6_08037D74(unk_2C, x);
	}
}

void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc)
{
	int var;

	proc->unk_55 = 1;

	SioPutSupportMenuImage();

	var = proc->unk_40 - proc->unk_48;

	if (var > 2)
		proc->unk_58 = var * 2 - 2;
	else
		proc->unk_58 = var * 2 + 5;

	ClearText(&gSioText_0203C6A4);
	Text_DrawString(&gSioText_0203C6A4, gUnk_Sio_0810F1AC);
	PutText(&gSioText_0203C6A4, gBg0Tm + TM_OFFSET(15, proc->unk_58 + 4));

	EnableBgSync(BG0_SYNC_BIT);
}

void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc)
{
	PutLinkArenaChoiceBannerSprite(96, proc->unk_58 * 8 + 24);

	if ((gKeySt->pressed & KEY_DPAD_LEFT) && proc->unk_55 == 1) {
		proc->unk_55 = 0;
		SioPlaySe(3);
	}

	if ((gKeySt->pressed & KEY_DPAD_RIGHT) && proc->unk_55 == 0) {
		proc->unk_55 = 1;
		SioPlaySe(3);
	}

	PutUiHand(proc->unk_55 * 40 + 112, proc->unk_58 * 8 + 32);

	if (gKeySt->pressed & KEY_BUTTON_B) {
		SioPlaySe(1);

		Proc_End(proc->sio_hold_proc);

		TmFillRect(gBg0Tm + TM_OFFSET(15, proc->unk_58 + 4), 12, 2, 0);
		EnableBgSync(BG0_SYNC_BIT);

		Proc_Break(proc);
	} else if (gKeySt->pressed & KEY_BUTTON_A) {
		Proc_End(proc->sio_hold_proc);

		if (proc->unk_55 == 0) {
			SioTeamList_EraseTeam(proc);
			SioPlaySe(2);
		} else {
			SioPlaySe(1);
		}

		TmFillRect(gBg0Tm + TM_OFFSET(15, proc->unk_58 + 4), 12, 2, 0);
		EnableBgSync(BG0_SYNC_BIT);

		Proc_Break(proc);
	}
}

void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc)
{
	char buf[16];

	ReadMultiArenaSaveTeam(proc->unk_40, GetUnit(1), buf);
	NewGeneralSecretScreen(proc);
}
