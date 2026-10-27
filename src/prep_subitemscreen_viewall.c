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
#include "unit.h"
#include "armfunc.h"
#include "helpbox.h"
#include "faction.h"
#include "prepscreen.h"

#include "constants/videoalloc_global.h"
#include "constants/msg.h"
#include "constants/songs.h"

void PrepSubItem_StartViewAllScreen(struct PrepSubItemProc *proc)
{
	int iuid, tmp;
	u8 i, i2, count;
	const u16 *supply_items = GetSupplyItems();

	PutUiWindowFrame(15, 4, 15, 16, 0);

	gPrepAllItemsCount = 0;

	// FOR_UNITS_FACTION FACTION_BLUE
	for (iuid = FACTION_BLUE + 1; iuid < (FACTION_BLUE + 0x40); iuid++) {
		struct Unit *iunit = GetUnit(iuid);

		if (!iunit || !iunit->pinfo)
			continue;

		if (iunit->flags & UNIT_FLAG_DEAD)
			continue;

		if (iunit == proc->units[0])
			continue;

		i = GetUnitItemCount(iunit);

		for (i2 = 0; i2 < i; i2++) {
			gPrepItemListData[gPrepAllItemsCount].pid  = UNIT_PID(iunit);
			gPrepItemListData[gPrepAllItemsCount].item = iunit->items[i2];
			gPrepItemListData[gPrepAllItemsCount].slot = i2;
			gPrepAllItemsCount++;
		}
	}

	tmp = gPrepAllItemsCount;
	for (i = 0; i < SUPPLY_ITEM_COUNT && supply_items[i] != 0; i++) {
		gPrepItemListData[i + tmp].item = supply_items[i];
		gPrepItemListData[i + tmp].pid = 0;
		gPrepItemListData[i + tmp].slot = i;
		gPrepAllItemsCount++;
	}

	proc->convoy_page = proc->proc_parent->unk_39;
	func_fe6_0807D834(proc->convoy_page);
	proc->menu_scroll_bar_disp_idx = proc->unk_4E;
	proc->hand_disp_y = proc->unk_47;
	func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
	func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 0);
	func_fe6_0807D358(proc);
	proc->convoy_scrolling_pos = 0;
	proc->hand_disp_x = 1;
	proc->unk30 |= 0xFF;
	proc->sel_action |= 0xFF;

	PrepAllItems_PutPName(
		&gPrepTexts3[1],
		gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid,
		0x18, 0);

	PutUiEntryHover(
		proc->hand_disp_x * 14 + 2,
		proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
		12);

	SetBgOffset(
		BG_2,
		proc->convoy_scrolling_pos,
		(proc->menu_scroll_bar_disp_idx - 0x28) & 0xFF);

	SetPrepMenuScrollBarBaseInfo(
		proc->proc_menuscroll,
		0xE0, 0x34, 0xB,
		proc->menu_scroll_bar_disp_idx,
		gPrepMenuScrollPos, 7);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	proc->menu_scrolling_pos = 0;

	if (proc->unk2D == 0)
		NewSallyCir2(proc, -1);
	else if (proc->unk2D == 1)
		Proc_End(proc->subproc1);

	proc->subproc1 = func_fe6_0807D16C(proc);
	func_fe6_0807E06C(true);
	proc->unk2D = 3;
}

void PrepSubItem_ViewAll_Loop(struct PrepSubItemProc *proc)
{
	u8 invalid_pid = 0xFF;
	int prev_page = proc->convoy_page;
	int prev_idx = proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 0x10;

	if (proc->unk29 != 0 && (gKeySt->pressed & (KEY_BUTTON_B | KEY_BUTTON_R))) {
		if (proc->unk29 != 1) {
			CloseHelpBox();
			proc->unk29 = 0;
			return;
		}

		proc->unk29 = 0;
	}

	switch (proc->menu_scrolling_pos) {
	case 100: {
		u8 count = GetUnitItemCount(proc->units[0]);

		if (proc->unk29 == 0 && count <= 4)
			count++;

		if ((gKeySt->repeated & KEY_DPAD_UP) && count > 1) {
			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			if (proc->hand_disp_y == 0) {
				if (gKeySt->pressed & KEY_DPAD_UP) {
					proc->hand_disp_y = count - 1;
					PlaySe(SONG_66);
				}
			} else {
				proc->hand_disp_y--;
				PlaySe(SONG_66);
			}

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);
		} else if ((gKeySt->repeated & KEY_DPAD_DOWN) && count > 1) {
			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			if (proc->hand_disp_y < count - 1) {
				proc->hand_disp_y++;
				PlaySe(SONG_66);
			} else if (gKeySt->pressed & KEY_DPAD_DOWN) {
				proc->hand_disp_y = 0;
				PlaySe(SONG_66);
			}

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);
		} else if ((gKeySt->pressed & KEY_BUTTON_A) && proc->unk29 == 0) {
			if (proc->unk_4C != 0 && !CheckValidLinkArenaItemSupply(
					proc->units[0], proc->hand_disp_y,
					gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->sel_action].item)) {
				StartPrepErrorHelpbox(
					proc->hand_disp_x * 0x70 + 0x10,
					proc->hand_disp_y * 0x10 + 0x48,
					MSG_6C2, proc);
				break;
			}

			PlaySe(SONG_6A);

			PrepAllItems_SwapItems(proc->units[0], proc->hand_disp_y, proc->menu_scroll_bar_disp_idx / 0x10 + proc->sel_action);

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			proc->hand_disp_y = proc->sel_action;
			proc->hand_disp_x = 1;

			func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
			func_fe6_0807D6C0(0, proc->units[0]);
			func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 0);

			PrepAllItems_PutPName(
				&gPrepTexts3[1],
				gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid,
				0x18, 0);

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			proc->menu_scrolling_pos = 0;
		} else if (gKeySt->pressed & KEY_BUTTON_B) {
			PlaySe(SONG_6B);

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			proc->hand_disp_y = proc->sel_action;
			proc->hand_disp_x = 1;
			proc->menu_scrolling_pos = 0;

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);
		} else if ((gKeySt->pressed & KEY_BUTTON_R) && proc->unk29 == 0) {
			if (proc->units[0]->items[proc->hand_disp_y] != 0) {
				proc->unk29 = 2;
				StartItemHelpBox(
					proc->hand_disp_x * 0x70 + 0x10,
					proc->hand_disp_y * 0x10 + 0x48 - proc->hand_disp_x * 0x20,
					proc->units[0]->items[proc->hand_disp_y]);
			}
		}
		break;
	}

	case 0:
		if (gKeySt->held & KEY_BUTTON_L)
			proc->unk_4A = 2;
		else
			proc->unk_4A = 1;

		if ((gKeySt->pressed & KEY_BUTTON_A) && proc->unk29 == 0) {
			if (gPrepMenuScrollPos == 0) {
				PlaySe(SONG_6C);
			} else if (gPrepItemListData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 0x10].pid == 0) {
				PlaySe(SONG_6A);

				proc->menu_scrolling_pos = 100;
				proc->sel_action = proc->hand_disp_y;

				RemoveUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);

				if (GetUnitItemCount(proc->units[0]) <= 4)
					proc->hand_disp_y = GetUnitItemCount(proc->units[0]);
				else
					proc->hand_disp_y = 0;

				proc->hand_disp_x = 0;

				PutUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);
				break;
			} else {
				PlaySe(SONG_6A);
				Proc_Goto(proc, PL_PREP_SUBITEM_7);
				break;
			}
		}

		if (gKeySt->pressed & KEY_BUTTON_B) {
			PlaySe(SONG_6B);
			NewSallyCir2(proc, 1);
			Proc_Goto(proc, PL_PREP_SUBITEM_6);
			return;
		}

		if ((gKeySt->pressed & KEY_BUTTON_R) && proc->unk29 == 0) {
			if (gPrepMenuScrollPos == 0)
				break;

			proc->unk29 = 2;
			StartItemHelpBox(
				proc->hand_disp_x * 0x70 + 0x10,
				proc->hand_disp_y * 0x10 + 0x48 - proc->hand_disp_x * 0x20,
				gPrepItemListData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 0x10].item);
			break;
		}

		if (((gKeySt->repeated & KEY_DPAD_UP) || ((gKeySt->pressed2 & KEY_DPAD_UP) && proc->unk_4A == 2)) && proc->hand_disp_y != 0) {
			PlaySe(SONG_66);

			if (proc->hand_disp_y == 1 && proc->menu_scroll_bar_disp_idx != 0) {
				func_fe6_0807DB80(&gPrepTexts1[1][0], 1, proc->menu_scroll_bar_disp_idx / 0x10 - 1, proc->units[0], 0);
				func_fe6_0807D358(proc);

				if (invalid_pid != gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y - 1].pid)
					PrepAllItems_PutPName(&gPrepTexts3[1], gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y - 1].pid, 0x18, 0);

				proc->menu_scroll_bar_disp_idx -= proc->unk_4A * 4;
				proc->menu_scrolling_pos = 1;
				break;
			}

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			proc->hand_disp_y--;

			if (invalid_pid != gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid)
				PrepAllItems_PutPName(&gPrepTexts3[1], gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid, 0x18, 0);

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);
			break;
		}

		if (((gKeySt->repeated & KEY_DPAD_DOWN) || ((gKeySt->pressed2 & KEY_DPAD_DOWN) && proc->unk_4A == 2)) && proc->hand_disp_y <= 5) {
			if (proc->hand_disp_y == 5 && proc->menu_scroll_bar_disp_idx / 0x10 + 7 < gPrepMenuScrollPos) {
				func_fe6_0807DB80(&gPrepTexts1[1][0], 1, proc->menu_scroll_bar_disp_idx / 0x10 + 7, proc->units[0], 0);
				func_fe6_0807D358(proc);

				if (invalid_pid != gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y + 1].pid)
					PrepAllItems_PutPName(&gPrepTexts3[1], gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y + 1].pid, 0x18, 0);

				proc->menu_scroll_bar_disp_idx += proc->unk_4A * 4;
				proc->menu_scrolling_pos = 2;
			} else {
				if (proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y + 1 >= gPrepMenuScrollPos)
					break;

				RemoveUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);

				proc->hand_disp_y++;

				if (invalid_pid != gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid)
					PrepAllItems_PutPName(&gPrepTexts3[1], gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid, 0x18, 0);

				PutUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);
			}

			PlaySe(SONG_66);
			break;
		}

		if (gKeySt->repeated & KEY_DPAD_RIGHT) {
			PlaySe(SONG_67);

			proc->unk_32[proc->convoy_page] = proc->menu_scroll_bar_disp_idx / 0x10;
			proc->unk_3B[proc->convoy_page] = proc->hand_disp_y;

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			proc->convoy_scrolling_pos = 0x38;
			proc->menu_scrolling_pos = 5;
		} else if (gKeySt->repeated & KEY_DPAD_LEFT) {
			PlaySe(SONG_67);

			proc->unk_32[proc->convoy_page] = proc->menu_scroll_bar_disp_idx / 0x10;
			proc->unk_3B[proc->convoy_page] = proc->hand_disp_y;

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			proc->convoy_scrolling_pos = 0xC8;
			proc->menu_scrolling_pos = 10;
		}
		break;

	case 1:
		proc->menu_scroll_bar_disp_idx -= proc->unk_4A * 4;

		if ((proc->menu_scroll_bar_disp_idx % 16) == 0) {
			TmFillRect(gBg2Tm + TM_OFFSET(15, ((proc->menu_scroll_bar_disp_idx / 0x10 + 7) * 2) & 0x1F), 15, 1, 0);
			EnableBgSync(BG2_SYNC_BIT);
			proc->menu_scrolling_pos = 0;
		}
		break;

	case 2:
		proc->menu_scroll_bar_disp_idx += proc->unk_4A * 4;

		if ((proc->menu_scroll_bar_disp_idx % 16) == 0) {
			TmFillRect(gBg2Tm + TM_OFFSET(15, ((proc->menu_scroll_bar_disp_idx / 0x10 - 1) * 2) & 0x1F), 15, 1, 0);
			EnableBgSync(BG2_SYNC_BIT);
			proc->menu_scrolling_pos = 0;
		}
		break;

	case 5:
		proc->convoy_scrolling_pos += 0x38;

		if (proc->convoy_scrolling_pos == 0x70)
			proc->menu_scrolling_pos = 6;
		break;

	case 6:
		proc->convoy_scrolling_pos = 0x90;

		if (proc->convoy_page == 8)
			proc->convoy_page = 0;
		else
			proc->convoy_page++;

		proc->menu_scroll_bar_disp_idx = proc->unk_32[proc->convoy_page] * 0x10;
		proc->hand_disp_y = proc->unk_3B[proc->convoy_page];

		func_fe6_0807D834(proc->convoy_page);
		func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
		func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 0);

		PutUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
			12);

		if (invalid_pid != gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid || gPrepMenuScrollPos == 0)
			PrepAllItems_PutPName(&gPrepTexts3[1], gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid, 0x18, 0);

		func_fe6_0807D358(proc);

		proc->convoy_scrolling_pos += 0xE;
		proc->menu_scrolling_pos = 7;
		break;

	case 7:
		proc->convoy_scrolling_pos += 0xE;

		if (proc->convoy_scrolling_pos == 0)
			proc->menu_scrolling_pos = 0;
		break;

	case 10:
		proc->convoy_scrolling_pos -= 0x38;

		if (proc->convoy_scrolling_pos == 0x90)
			proc->menu_scrolling_pos = 11;
		break;

	case 11:
		proc->convoy_scrolling_pos = 0x70;

		if (proc->convoy_page == 0)
			proc->convoy_page = 8;
		else
			proc->convoy_page--;

		RemoveUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
			12);

		proc->menu_scroll_bar_disp_idx = proc->unk_32[proc->convoy_page] * 0x10;
		proc->hand_disp_y = proc->unk_3B[proc->convoy_page];

		func_fe6_0807D834(proc->convoy_page);
		func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
		func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 0);

		PutUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
			12);

		if (invalid_pid != gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid || gPrepMenuScrollPos == 0)
			PrepAllItems_PutPName(&gPrepTexts3[1], gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].pid, 0x18, 0);

		func_fe6_0807D358(proc);

		proc->convoy_scrolling_pos -= 0xE;
		proc->menu_scrolling_pos = 12;
		break;

	case 12:
		proc->convoy_scrolling_pos -= 0xE;

		if (proc->convoy_scrolling_pos == 0)
			proc->menu_scrolling_pos = 0;
		break;
	}

	SetBgOffset(BG_2, proc->convoy_scrolling_pos, (proc->menu_scroll_bar_disp_idx - 0x28) & 0xFF);

	if (proc->unk29 != 0) {
		if (prev_page != proc->convoy_page || prev_idx != proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 0x10) {
			if (proc->hand_disp_x == 0) {
				StartItemHelpBox(
					proc->hand_disp_x * 0x70 + 0x10,
					proc->hand_disp_y * 0x10 + 0x48 - proc->hand_disp_x * 0x20,
					proc->units[0]->items[proc->hand_disp_y]);
			} else if (gPrepMenuScrollPos == 0) {
				if (proc->unk29 != 1)
					CloseHelpBox();

				proc->unk29 = 1;
			} else {
				StartItemHelpBox(
					proc->hand_disp_x * 0x70 + 0x10,
					proc->hand_disp_y * 0x10 + 0x48 - proc->hand_disp_x * 0x20,
					gPrepItemListData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 0x10].item);

				proc->unk29 = 2;
			}
		}
	}

	if (proc->timer == 1) {
		SetWinEnable(1, 0, 0);
		SetWin0Box(0x80, 0x28, 0xE0, 0x98);
		SetWin0Layers(1, 1, 1, 1, 1);
		SetWOutLayers(1, 1, 0, 1, 1);
		proc->timer = 2;
	} else if (proc->timer < 2) {
		proc->timer++;
	}
}
