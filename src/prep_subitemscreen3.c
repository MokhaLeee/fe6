#include "prelude.h"
#include "proc.h"
#include "bm.h"
#include "face.h"
#include "ui.h"
#include "oam.h"
#include "hardware.h"
#include "msg.h"
#include "text.h"
#include "supply.h"
#include "icon.h"
#include "util.h"
#include "sound.h"
#include "armfunc.h"
#include "helpbox.h"
#include "prepscreen.h"

#include "constants/videoalloc_global.h"
#include "constants/msg.h"

extern const char String_Prep_083272AC[];
extern const char String_Prep_083272B8[];
extern const char String_Prep_083272C4[];

void func_fe6_0807FBE8(struct PrepSubItemProc *proc)
{
	SetWinEnable(1, 0, 0);
	SetWin0Box(0x80, 0x28, 0xE0, 0x98);
	SetWin0Layers(1, 1, 1, 1, 1);
	SetWOutLayers(1, 1, 0, 1, 1);

	PutUiWindowFrame(15, 4, 15, 16, 0);
	func_fe6_0807D9E4(&gPrepTexts2[0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 1);
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

	SetBgOffset(
		BG_2,
		proc->convoy_scrolling_pos,
		(proc->menu_scroll_bar_disp_idx - 0x28) & 0xFF);

	SetPrepMenuScrollBarBaseInfo(
		proc->proc_menuscroll,
		0xE0, 0x30, 0xC,
		proc->menu_scroll_bar_disp_idx,
		gPrepMenuScrollPos, 7);

	PutUiEntryHover(
		proc->hand_disp_x * 14 + 2,
		proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
		12);

	func_fe6_0807E06C(true);
	proc->in_sel_action_menu = true;
}

void PrepSubItem_StartSupplyScreen(struct PrepSubItemProc *proc)
{
	TmFillRect(gBg0Tm + TM_OFFSET(0xF, 0), 0xF, 0x13, 0);
	TmFillRect(gBg1Tm + TM_OFFSET(0xF, 0), 0xF, 0x13, 0);
	TmFillRect(gBg2Tm + TM_OFFSET(0xF, 0), 0xF, 0x1F, 0);

	SetPrepMenuScrollBarBaseInfo(
		proc->proc_menuscroll,
		0, 0, 0xD, 0, 0, 0);

	if (proc->unk30 == 0xFF) {
		const u16 *supply_items = GetSupplyItems();
		u16 i, j;

		proc->unk30 = 0;
		proc->sel_action = 0;
		gPrepAllItemsCount = 0;

		for (i = 0; i < SUPPLY_ITEM_COUNT && supply_items[i] != 0; i++) {
			gPrepItemListData[i].u.info.item = supply_items[i];
			gPrepItemListData[i].u.info.pid = 0;
			gPrepItemListData[i].u.info.slot = i;
			gPrepAllItemsCount++;
		}

		if (proc->unk2D < 4)
			proc->convoy_page = proc->proc_parent->unk_3A;
		else
			proc->convoy_page = 0;

		func_fe6_0807D834(proc->convoy_page);
	}

	proc->menu_scroll_bar_disp_idx = proc->unk_32[proc->convoy_page] * 0x10;
	proc->hand_disp_x = 1;
	proc->hand_disp_y = proc->unk_3B[proc->convoy_page];

	func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);

	if (proc->unk4B == 0) {
		PrepPutText(
			&gPrepTexts2[0],
			gBg2Tm + TM_OFFSET(0x15, 4),
			(GetUnitItemCount(proc->units[0]) != 0) 
				? TEXT_COLOR_SYSTEM_WHITE
				: TEXT_COLOR_SYSTEM_GRAY,
			0,
			String_Prep_083272AC
		);

		PrepPutText(
			&gPrepTexts2[1],
			gBg2Tm + TM_OFFSET(0x15, 6),
			(gPrepAllItemsCount != 0) 
				? TEXT_COLOR_SYSTEM_WHITE
				: TEXT_COLOR_SYSTEM_GRAY,
			0,
			String_Prep_083272B8
		);

		if (proc->unk_4C != 0)
			proc->unk_49 = 2;
		else {
			PrepPutText(
				&gPrepTexts2[2],
				gBg2Tm + TM_OFFSET(0x15, 8),
				(gPrepAllItemsCount != 0) 
					? TEXT_COLOR_SYSTEM_WHITE
					: TEXT_COLOR_SYSTEM_GRAY,
				0,
				String_Prep_083272C4
			);
			proc->unk_49 = 3;
		}
	}

	SetBgOffset(BG_2, 0, 0xD8);

	proc->menu_scrolling_pos = 0;
	proc->in_sel_action_menu = 0;
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

	if (proc->unk2D == 0) {
		NewSallyCir2(proc, -1);
		proc->subproc1 = func_fe6_0807D2E0(proc);
	}

	PrepAllItems_PutTotalNum(0x18, 0);

	if (proc->unk2D == 4) {
		proc->subproc1 = func_fe6_0807D2E0(proc);
		proc->unk2D = 5;

		if (proc->unk4B != 0) {
			proc->sel_action = 2;
			func_fe6_0807FBE8(proc);
			Proc_Goto(proc, PL_PREP_SUBITEM_7);
			func_fe6_0807D4A8(1, 0xB,
				gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].u.info.item,
				proc->subproc1);
			func_fe6_08071B80(0x10, 0x10, MSG_C47, proc);
			return;
		}
	} else if (proc->unk2D < 4) {
		proc->unk2D = 2;
		proc->unk4B = 0;
	}

	PutUiWindowFrame(18, 8, 10, proc->unk_49 * 2 + 2, 0);
	PutUiEntryHover(0x13, proc->sel_action * 2 + 9, 7);
}
