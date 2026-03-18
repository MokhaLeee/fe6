#include "prelude.h"
#include "proc.h"
#include "bm.h"
#include "face.h"
#include "ui.h"
#include "oam.h"
#include "hardware.h"
#include "msg.h"
#include "text.h"
#include "icon.h"
#include "util.h"
#include "sound.h"
#include "armfunc.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "constants/videoalloc_global.h"

void func_fe6_0807E06C(bool act)
{
	int i;

	if (act) {
		for (i = 0; i < 15; i++) {
			gBg0Tm[TM_OFFSET(15 + i, 3)] = OAM2_CHR(BGCHR_PREPMENU_328) + OAM2_PAL(BGPAL_PREPMENU_3) + i;
			gBg0Tm[TM_OFFSET(15 + i, 4)] = OAM2_CHR(BGCHR_PREPMENU_368) + OAM2_PAL(BGPAL_PREPMENU_3) + i;
		}
	} else {
		for (i = 0; i < 15; i++) {
			gBg0Tm[TM_OFFSET(15 + i, 3)] = 0;
			gBg0Tm[TM_OFFSET(15 + i, 4)] = 0;
		}
	}

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PrepSubItemScreen_Init(struct PrepSubItemProc *proc)
{
	u8 i;

	if (proc->unk2D <= PREP_SUB2U2D_3)
		proc->unk4B = 0;

	ResetText();
	ResetTextFont();

	gDispIo.bg0_ct.priority = 0;
	gDispIo.bg1_ct.priority = 1;
	gDispIo.bg2_ct.priority = 0;
	gDispIo.bg3_ct.priority = 2;

	ClearIcons();

	for (i = 0; i < 20; i++)
		gPrepSubMenuIcons[i] = 0xFF;

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	InitIcons();
	ApplyIconPalettes(BGPAL_ICONS);
	UnpackUiWindowFrameGraphics();

	InitText(&gPrepTexts3[0], 6);
	InitTextDb(&gPrepTexts3[1], 5);

	for (i = 0; i < 5; i++)
		InitTextDb(&gPrepTexts1[i], 7);

	for (i = 0; i < 8; i++)
		InitTextDb(&gPrepTexts2[i], 7);

	ApplyPalettes(Pal_SpinningArrow, 0x10 + OBPAL_PREPMENU_2, 3);
	ApplyPalettes( Pal_Sio_0831AABC, 0x10 + OBPAL_PREPMENU_8, 2);
	ApplyPalette( Pal_Prep_0831A248, BGPAL_PREPMENU_3);
	Decompress(Img_Prep_08319EE8, gBg0Tm + BGCHR_PREPMENU_280);
	Decompress(Img_Prep_0831A088, gBg1Tm + BGCHR_PREPMENU_280);

	proc->menu_scroll_bar_disp_idx = 0;
	proc->convoy_scrolling_pos = 0;
	proc->hand_disp_y = 0;
	proc->unk30 |= 0xFF;
	proc->sel_action |= 0xFF;
	proc->unk_48 = 0;
	proc->menu_scrolling_pos = 0;
	proc->timer = 0;
	proc->unk29 = 0;
	proc->unk_4E = 0;
	proc->unk_47 = 0;
	proc->proc_menuscroll = StartMenuScrollBar(proc);

	if (proc->unk2D <= 3) {
		Decompress(Img_Prep_0831AB1C, OBJ_VRAM0 + 0x1000);
		Decompress(Img_Prep_083198CC, OBJ_VRAM0 + OBCHR_PREPMENU_390 * CHR_SIZE);

		proc->unit1 = proc->proc_parent->unit1;
		proc->unit2 = proc->proc_parent->unit2;

		SetPrepMenuScrollBarOam2Info(proc->proc_menuscroll,
			OBCHR_PREPMENU_390 * CHR_SIZE, OBPAL_PREPMENU_2);

		if (proc->proc_parent->link_arena_flag & PREPMENU_FLAG_MULTIARENA)
			proc->unk_4C = 1;
		else
			proc->unk_4C = 0;
	} else {
		Decompress(Img_Prep_083198CC, OBJ_VRAM0 + OBCHR_PREPMENU_280 * CHR_SIZE);
		SetPrepMenuScrollBarOam2Info(proc->proc_menuscroll,
			OBCHR_PREPMENU_280 * CHR_SIZE, OBPAL_PREPMENU_2);

		proc->unk_4C = 0;
	}

	if (proc->unk4B == 0) {
		struct Text *text;

		PutUiWindowFrame(1, 8, 0xE, 0xC, 0);

		text = &gPrepTexts3[0];

		ClearText(text);
		Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
		Text_SetCursor(text, (0x30 - GetStringTextLen(DecodeMsg(proc->unit1->pinfo->msg_name))) / 2);
		Text_DrawString(text, DecodeMsg(proc->unit1->pinfo->msg_name));
		PutText(text, gBg0Tm);
		func_fe6_0807D6C0(0, proc->unit1);
		StartFace(0, GetUnitFid(proc->unit1), 0x40, -4, FACE_DISP_KIND(FACE_96x80_FLIPPED));
	}

	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, proc->convoy_scrolling_pos, (proc->menu_scroll_bar_disp_idx - 0x28) & 0xFF);

	for (i = 0; i < 9; i++) {
		proc->unk_32[i] = 0;
		proc->unk_3B[i] = 0;
	}

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

	if (proc->unk2D <= 3)
		Proc_Goto(proc, proc->unk2A);

	LoadHelpBoxGfx(NULL, -1);
}

void PrepSubItem_StartTradeScreen(struct PrepSubItemProc *proc)
{
	struct Text *text;

	PutUiWindowFrame(0xF, 8, 0xE, 0xC, 0);

	text = &gPrepTexts3[1];

	ClearText(text);
	Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
	Text_SetCursor(text, (0x28 - GetStringTextLen(DecodeMsg(proc->unit2->pinfo->msg_name))) / 2);
	Text_DrawString(text, DecodeMsg(proc->unit2->pinfo->msg_name));
	PutText(text, gBg0Tm + TM_OFFSET(0x18, 0));
	func_fe6_0807D6C0(POS_R, proc->unit2);
	StartFace(1, GetUnitFid(proc->unit2), 0xAC, -4, FACE_DISP_KIND(FACE_96x80));

	if (proc->unk2D != 3) {
		if (GetUnitItemCount(proc->unit1) == 0)
			proc->hand_disp_x = POS_R;
		else
			proc->hand_disp_x = POS_L;

		proc->hand_disp_y = 0;
	}

	proc->unk30 |= 0xFF;
	proc->sel_action |= 0xFF;
	PutUiEntryHover(
		proc->hand_disp_x * 14 + 2,
		proc->hand_disp_y * 2 + 9,
		0xC);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	proc->menu_scrolling_pos = 0;

	if (proc->unk2D == 0)
		NewSallyCir2(proc, -1);
	else if (proc->unk2D == 3)
		Proc_End(proc->subproc1);

	proc->subproc1 = func_fe6_0807D074(proc);
	proc->unk2D = 1;
}

void func_fe6_0807E544(struct PrepSubItemProc *proc)
{
	proc->unk_3B[0] = GetUnitItemCount(proc->unit1);
	proc->unk_3B[1] = GetUnitItemCount(proc->unit2);

	if (proc->unk30 == 1)
		if (proc->unk29 == 0)
			if (proc->unk_3B[0] < 5)
				proc->unk_3B[0]++;

	if (proc->unk30 == 0)
		if (proc->unk29 == 0)
			if (proc->unk_3B[1] < 5)
				proc->unk_3B[1]++;
}

#if 0
void PrepSubItem_0807E5A8(struct PrepSubItemProc *proc)
{
	func_fe6_0807E544(proc);

	if (proc->unk29 == 2 && (gKeySt->pressed & (KEY_BUTTON_A | KEY_BUTTON_R))) {
		CloseHelpBox();
		proc->unk29 = 0;
		return;
	}

	if ((gKeySt->repeated & KEY_DPAD_LEFT) && (proc->hand_disp_x == 1)) {
		if (proc->unk_3B[0] == 0) {
			PlaySe(0x67);

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);

			proc->hand_disp_x--;

			if (proc->hand_disp_y > proc->unk_3B[0])
				proc->hand_disp_y--;

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);
		}
	} else if ((gKeySt->repeated & KEY_DPAD_RIGHT) && (proc->hand_disp_x == 0)) {
		if (proc->unk_3B[1] == 0) {
			PlaySe(0x67);

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);

			proc->hand_disp_x++;

			if (proc->hand_disp_y > proc->unk_3B[0])
				proc->hand_disp_y--;

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);
		}
	} else if ((gKeySt->repeated & KEY_DPAD_UP) && (proc->unk_3B[proc->hand_disp_x] != 0)) {
		RemoveUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9,
			0xC);

		if (proc->hand_disp_y != 0) {
			proc->hand_disp_y--;
			PlaySe(0x66);
		} else if (gKeySt->pressed & KEY_DPAD_UP) {
			// First pressed, report warnning
			proc->hand_disp_y = proc->unk_3B[proc->hand_disp_x] - 1;
			PlaySe(0x66);
		}

		PutUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9,
			0xC);
	} else if ((gKeySt->repeated & KEY_DPAD_DOWN) && (proc->unk_3B[proc->hand_disp_x] != 0)) {
		RemoveUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9,
			0xC);

		if (proc->hand_disp_y != 0) {
			proc->hand_disp_y--;
			PlaySe(0x66);
		} else if (gKeySt->pressed & KEY_DPAD_UP) {
			// First pressed, report warnning
			proc->hand_disp_y = proc->unk_3B[proc->hand_disp_x] - 1;
			PlaySe(0x66);
		}

		PutUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9,
			0xC);
	}
}
#endif
