#include "prelude.h"
#include "proc.h"
#include "text.h"
#include "ui.h"
#include "unit.h"
#include "support.h"
#include "item.h"
#include "statscreen.h"
#include "hardware.h"
#include "secretscreen.h"

EWRAM_DATA u8 SioPidPool[SID_PID_POOL_SIZE] = {};
EWRAM_DATA u8 _pad_0203D499[7] = { 0 };
EWRAM_DATA struct SecretScreenData gSecretScreenData[SID_PID_POOL_SIZE] = {};
EWRAM_DATA u8 Unk_0203D518[10] = {};

EWRAM_OVERLAY(0) int Unk_020168F0 = 0;
EWRAM_OVERLAY(0) int Unk_020168F4 = 0;
EWRAM_OVERLAY(0) struct Text gSecretScreenTexts[5] = {};
EWRAM_OVERLAY(0) int gSecretScreenRN = 0;
EWRAM_OVERLAY(0) u8 Unk_02016924[0xA0] = {};
EWRAM_OVERLAY(0) struct UnkStruct_020169C4 Unk_020169C4 = {};

#if 0
void func_fe6_08083BC4(struct Unit *units[], int count)
{
	int i, j, k;

	for (i = 0; i < count; i++) {
		struct SecretScreenData *data = &gSecretScreenData[i];

		data->numbers[0] = units[i]->pinfo->id;
		data->numbers[1] = !!(UNIT_ATTRIBUTES(units[i]) & UNIT_ATTR_PROMOTED);
		data->numbers[2] = units[i]->level & 0x1F;
		data->numbers[3] = units[i]->max_hp & 0x3F;
		data->numbers[4] = units[i]->pow & 0x3F;
		data->numbers[5] = units[i]->skl & 0x3F;
		data->numbers[6] = units[i]->spd & 0x3F;
		data->numbers[7] = units[i]->def & 0x3F;
		data->numbers[8] = units[i]->res & 0x3F;
		data->numbers[9] = units[i]->lck & 0x3F;
		data->numbers[10] = UNIT_CON(units[i]) & 0x1F;

		for (j = 0; j < 8; j++)
			data->numbers[11 + j] = GetWeaponLevelFromExp(units[i]->wexp[j]) & 7;

		for (j = 0; j < 5; j++)
			data->numbers[j] = GetItemIid(units[i]->items[j]);
	}

	gSecretScreenRN = (u16)GetGameTime() / 8;

	for (; i < SID_PID_POOL_SIZE; i++) {
		struct SecretScreenData *data = &gSecretScreenData[i];

		data->numbers[0] = 0;
		data->numbers[1] = !!GetSecretScreenRN();
		data->numbers[2] = GetSecretScreenRN() & 0x1F;
		data->numbers[3] = GetSecretScreenRN() & 0x3F;
		data->numbers[4] = GetSecretScreenRN() & 0x3F;
		data->numbers[5] = GetSecretScreenRN() & 0x3F;
		data->numbers[6] = GetSecretScreenRN() & 0x3F;
		data->numbers[7] = GetSecretScreenRN() & 0x3F;
		data->numbers[8] = GetSecretScreenRN() & 0x3F;
		data->numbers[9] = GetSecretScreenRN() & 0x3F;
		data->numbers[10] = GetSecretScreenRN() & 0x1F;

		for (j = 0; j < 8; j++)
			data->numbers[11 + j] = GetSecretScreenRN() & 7;

		for (j = 0; j < 5; j++)
			data->numbers[j] = GetSecretScreenRN();
	}

	for (i = 0; i < 10; i++)
		Unk_0203D518[i] = 0;

	for (i = 0; i < count; i++) {
		int supp = (u8)GetUnitSupportCount(units[i]);

		for (j = 0; j < supp; j++) {
			u8 pid = GetUnitSupportPid(units[i], j);

			for (k = (i + 1); k < count; k++) {
				int tmp_r4, supp_lv;
				struct SecretScreenData *data = &gSecretScreenData[k];

				if (data->numbers[0] == pid)
					continue;

				tmp_r4 = func_fe6_08083B8C(j, k);
				supp_lv = GetUnitSupportLevel(units[i], j);

				Unk_0203D518[(u8)tmp_r4] = supp_lv & 3;
			}
		}
	}
}
#endif

void PrintSecretScreenTexts(struct Text *text, const u8 *table)
{
	char str[4];
	int line;

	str[2] = '\0';

	EnableBgSync(BG2_SYNC_BIT);
	InitTalkTextFont();

	for (line = 0; line < SID_PID_POOL_SIZE; line++) {
		int i, x_offset;

		ClearText(&text[line]);

		x_offset = 0;

		for (i = 0; i < 0x13;) {
			const u8 *cur;
			int loc = line * 0x13 + i;

			if (loc == (Unk_020169C4.unk_06 + Unk_020168F0))
				return;

			cur = table + Unk_02016924[loc] * 2;

			/* This JP character! */
			str[0] = cur[0];
			str[1] = cur[1];

			PutDrawText(&text[line], gBg2Tm + TM_OFFSET(2, 3 * line + 3), TEXT_COLOR_SYSTEM_GRAY, x_offset, 0, str);
			x_offset += 10;
			i++;

			if ((i % 6) == 0) {
				if ((i / 6) < 3)
					x_offset += 10;
			}
		}
	}
}

void PutSecretScreenLineNumber(int y)
{
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x02, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[0]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x04, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[1]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x07, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[2]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x0A, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[3]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x0D, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[4]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x10, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[5]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x13, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[6]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x16, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[7]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x19, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[8]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x1C, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[9]);
	PutNumberOrBlank(gBg2Tm + TM_OFFSET(0x1F, y), TEXT_COLOR_SYSTEM_BLUE, gSecretScreenData->numbers[10]);
}

void SecretScreen_Init(struct ProcSecretScreen *proc)
{
	int i;

	InitBgs(NULL);
	ResetTextFont();
	ResetText();

	proc->unk_2A = 0;

	SetDispEnable(1, 1, 1, 1, 0);

	gDispIo.bg0_ct.priority = 1;
	gDispIo.bg1_ct.priority = 2;
	gDispIo.bg2_ct.priority = 0;
	gDispIo.bg3_ct.priority = 3;

	UnpackUiWindowFrameGraphics();
	EnablePalSync();

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);
	TmFill(gBg3Tm, 0);

	SetBgOffset(0, 0, 0);
	SetBgOffset(1, 8, -8);
	SetBgOffset(2, 0, 0);
	SetBgOffset(3, 0, 0);

	SetWinEnable(0, 0, 0);

	PutUiWindowFrame(0, 2, 0x1E, 0x10, UI_WINDOW_SABLE);
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	for (i = 0; i < SID_PID_POOL_SIZE; i++)
		InitText(&gSecretScreenTexts[i], 0x1C);

	func_fe6_08083BC4(proc->units, proc->count);
	func_fe6_08082E74(7, 11);
	ModifyPassword(func_fe6_08083944);
	PrintSecretScreenTexts(gSecretScreenTexts, gUnk_08679820);
	proc->subproc = StartMuralBackground(PROC_TREE_VSYNC, NULL, BGPAL_SECRETSCREEN_MURALBG);
}

void SecretScreen_Loop_Dummy(struct ProcSecretScreen *proc) {}

void SecretScreen_End(struct ProcSecretScreen *proc)
{
	Proc_End(proc->subproc);
	SetDispEnable(0, 0, 0, 0, 0);
}

ProcPtr NewGeneralSecretScreen(ProcPtr parent)
{
	int i;
	struct ProcSecretScreen *proc;

	proc = SpawnProcLocking(ProcScr_SecretScreen, parent);
	proc->count = 0;

	for (i = 0; i < SID_PID_POOL_SIZE; i++) {
		struct Unit *unit = GetUnit(i + 1);

		proc->units[i] = unit;

		if (!unit->pinfo)
			break;

		proc->count++;
	}
	return proc;
}

ProcPtr NewUniqueSecretScreen(struct Unit *unit, ProcPtr parent)
{
	int i;
	struct ProcSecretScreen *proc;

	proc = SpawnProcLocking(ProcScr_SecretScreen, parent);
	proc->count = 0;

	for (i = 0; i < SID_PID_POOL_SIZE; i++)
		proc->units[i] = unit;

	proc->count = SID_PID_POOL_SIZE;
	return proc;
}
