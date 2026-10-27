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
#include "item.h"
#include "action.h"
#include "prepscreen.h"

#include "constants/videoalloc_global.h"
#include "constants/msg.h"
#include "constants/songs.h"

extern const char String_Prep_083272AC[];
extern const char String_Prep_083272B8[];
extern const char String_Prep_083272C4[];
extern const char String_Prep_083272CC[];
extern const char String_Prep_083272D4[];
extern const char String_Prep_Yes[];
extern const char String_Prep_No[];

void func_fe6_0807FBE8(struct PrepSubItemProc *proc)
{
	SetWinEnable(1, 0, 0);
	SetWin0Box(0x80, 0x28, 0xE0, 0x98);
	SetWin0Layers(1, 1, 1, 1, 1);
	SetWOutLayers(1, 1, 0, 1, 1);

	PutUiWindowFrame(15, 4, 15, 16, 0);
	func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 1);
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
			gPrepItemListData[i].item = supply_items[i];
			gPrepItemListData[i].pid = 0;
			gPrepItemListData[i].slot = i;
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
			&gPrepTexts1[1][0],
			gBg2Tm + TM_OFFSET(0x15, 4),
			(GetUnitItemCount(proc->units[0]) != 0) 
				? TEXT_COLOR_SYSTEM_WHITE
				: TEXT_COLOR_SYSTEM_GRAY,
			0,
			String_Prep_083272AC
		);

		PrepPutText(
			&gPrepTexts1[1][1],
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
				&gPrepTexts1[1][2],
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
			PrepItem_PutItemDesc(1, 0xB,
				gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].item,
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

void PrepSubItem_SelLoop1(struct PrepSubItemProc *proc)
{
	u8 prev_sel = proc->sel_action;

	if (proc->unk29 != 0 && (gKeySt->pressed & (KEY_BUTTON_B | KEY_BUTTON_R))) {
		CloseHelpBox();
		proc->unk29 = 0;
		return;
	}

	if (gKeySt->repeated & KEY_DPAD_DOWN) {
		RemoveUiEntryHover(0x13, proc->sel_action * 2 + 9, 7);

		if (proc->sel_action < proc->unk_49 - 1) {
			proc->sel_action++;
			PlaySe(SONG_66);
		} else if (gKeySt->pressed & KEY_DPAD_DOWN) {
			proc->sel_action = 0;
			PlaySe(SONG_66);
		}

		PutUiEntryHover(0x13, proc->sel_action * 2 + 9, 7);
	} else if (gKeySt->repeated & KEY_DPAD_UP) {
		RemoveUiEntryHover(0x13, proc->sel_action * 2 + 9, 7);

		if (proc->sel_action != 0) {
			proc->sel_action--;
			PlaySe(SONG_66);
		} else if (gKeySt->pressed & KEY_DPAD_UP) {
			PlaySe(SONG_66);
			proc->sel_action = proc->unk_49 - 1;
		}

		PutUiEntryHover(0x13, proc->sel_action * 2 + 9, 7);
	} else if (gKeySt->pressed & KEY_BUTTON_B) {
		PlaySe(SONG_6B);

		if (proc->unk2D <= 3)
			NewSallyCir2(proc, 1);

		Proc_Goto(proc, PL_PREP_SUBITEM_6);
	} else if ((gKeySt->pressed & KEY_BUTTON_A) && proc->unk29 == 0) {
		if (proc->sel_action == 0) {
			if (GetUnitItemCount(proc->units[POS_L]) == 0) {
				PlaySe(SONG_6C);
				return;
			}

			PlaySe(SONG_6A);
			proc->hand_disp_y = 0;
			proc->hand_disp_x = 0;
		} else if (proc->sel_action == 1) {
			if (gPrepAllItemsCount == 0) {
				PlaySe(SONG_6C);
				return;
			}

			PlaySe(SONG_6A);
		} else if (proc->sel_action == 2) {
			if (gPrepAllItemsCount == 0) {
				PlaySe(SONG_6C);
				return;
			}

			PlaySe(SONG_6A);
			EndFaceById(0);
			TmFillRect(gBg0Tm, 0xF, 0x13, 0);
			TmFillRect(gBg1Tm, 0xF, 0x13, 0);
			TmFillRect(gBg2Tm, 0xF, 0x1F, 0);
			PrepItem_PutItemDesc(
				1, 0xB,
				gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y].item,
				proc->subproc1);
		}

		func_fe6_0807FBE8(proc);
		Proc_Break(proc);
	} else if ((gKeySt->pressed & KEY_BUTTON_R) && proc->unk29 == 0) {
		proc->unk29 = 2;
		StartHelpBox(0xA0, proc->sel_action * 16 + 0x48, HelpboxMsg_0867929C[proc->sel_action]);
	}

	if (proc->unk29 == 2 && proc->sel_action != prev_sel) {
		StartHelpBox(0xA0, proc->sel_action * 16 + 0x48, HelpboxMsg_0867929C[proc->sel_action]);
	}
}

void PrepSubItem_SelLoop2(struct PrepSubItemProc *proc)
{
	u8 prev_sel = proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 16;
	u8 prev_page = proc->convoy_page;
	i16 i;
	int sel;

	if (proc->unk29 != 0 && (gKeySt->pressed & (KEY_BUTTON_B | KEY_BUTTON_R))) {
		if (proc->unk29 != 1) {
			CloseHelpBox();
			proc->unk29 = 0;
			return;
		}

		proc->unk29 = 0;
	}

	switch (proc->menu_scrolling_pos) {
	case 0xFF:
		if (proc->sel_action == 0) {
			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);
		} else {
			proc->unk_3B[proc->convoy_page] = proc->hand_disp_y;
			proc->unk_32[proc->convoy_page] = proc->menu_scroll_bar_disp_idx / 16;
		}

		if (proc->sel_action == 2) {
			StartFace(0, GetUnitFid(proc->units[0]), 0x40, -4, 3);

			TmFillRect(gBg0Tm, 0xF, 0x13, 0);
			TmFillRect(gBg1Tm, 0xF, 0x13, 0);
			TmFillRect(gBg2Tm, 0xF, 0x1F, 0);

			PutUiWindowFrame(1, 8, 14, 12, 0);
			PrepSubItem_ResetIcon();

			PrepPutText(
				&gPrepTexts3[0], gBg0Tm, 0,
				(0x30 - GetStringTextLen(DecodeMsg(proc->units[0]->pinfo->msg_name))) / 2,
				DecodeMsg(proc->units[0]->pinfo->msg_name));

			func_fe6_0807D6C0(0, proc->units[0]);
		}

		if (proc->unk2D <= 3)
			proc->proc_parent->unk_3A = proc->convoy_page;

		Proc_Goto(proc, PL_PREP_SUBITEM_CONVOY);
		break;

	case 0x14:
		if ((gKeySt->repeated & KEY_DPAD_LEFT) && proc->unk30 != 0) {
			proc->unk30 = 0;
			PlaySe(SONG_66);
		}

		if ((gKeySt->repeated & KEY_DPAD_RIGHT) && proc->unk30 != 1) {
			proc->unk30 = 1;
			PlaySe(SONG_66);
		}

		if (gKeySt->pressed & KEY_BUTTON_A) {
			PlaySe(SONG_6A);

			if (proc->unk30 == 0) {
				for (i = proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y; i < gPrepAllItemsCount; i++)
					gPrepItemListData[i].item = gPrepItemListData[i + 1].item;

				gPrepAllItemsCount--;
				gPrepMenuScrollPos--;

				func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
				func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 16, 0);
				PrepAllItems_Update();
				gAction.id = ACTION_TRADED_SUPPLY;

				if (proc->unk4B != 0)
					Proc_Goto(proc, PL_PREP_SUBITEM_6);
			}

			proc->menu_scrolling_pos = 0;
		} else if (gKeySt->pressed & KEY_BUTTON_B) {
			PlaySe(SONG_6B);
			proc->menu_scrolling_pos = 0;
		}

		if (proc->menu_scrolling_pos == 0) {
			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			TmFillRect(gBg0Tm, 0xE, 0x13, 0);
			TmFillRect(gBg1Tm, 0xE, 0x13, 0);

			PrepItem_PutItemDesc(1, 0xB,
				gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y].item,
				proc->subproc1);

			EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);

			if (gPrepAllItemsCount == 0)
				proc->menu_scrolling_pos = 0xFF;
		}
		break;

	case 0:
		if (gKeySt->pressed & KEY_BUTTON_B) {
			if (proc->unk4B != 0) {
				PlaySe(SONG_6C);
				break;
			}

			PlaySe(SONG_6B);
			proc->menu_scrolling_pos = 0xFF;
		} else if ((gKeySt->pressed & KEY_BUTTON_A) && proc->unk29 == 0) {
			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);

			if (proc->sel_action == 0) {
				if (GetTotalSupplyItemCount() == 100) {
					PlaySe(SONG_6C);
				} else if (proc->unk_4C != 0 && !PrepCanUnitPutItemToSupply(proc->units[0], proc->hand_disp_y)) {
					StartPrepErrorHelpbox(0x10, proc->hand_disp_y * 0x10 + 0x48, MSG_6C2, proc);
				} else {
					PlaySe(SONG_6A);

					func_fe6_0807DEC8(proc, proc->units[0]->items[proc->hand_disp_y]);

					for (i = gPrepAllItemsCount; i >= proc->menu_scroll_bar_disp_idx / 16; i--) {
						gPrepItemListData[i + 1].item = gPrepItemListData[i].item;
						gPrepItemListData[i + 1].pid = 0;
					}

					gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16].item = proc->units[0]->items[proc->hand_disp_y];
					gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16].pid = 0;

					gPrepAllItemsCount++;
					gPrepMenuScrollPos++;

					UnitRemoveItem(proc->units[0], proc->hand_disp_y);
					func_fe6_0807D6C0(0, proc->units[0]);
					PrepAllItems_Update();
					gAction.id = ACTION_TRADED_SUPPLY;

					if (GetUnitItemCount(proc->units[0]) == 0) {
						func_fe6_0807D358(proc);

						if (proc->unk2D <= 3)
							proc->proc_parent->unk_3A = proc->convoy_page;

						Proc_Goto(proc, PL_PREP_SUBITEM_CONVOY);
						return;
					}

					func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 16, 0);

					if (GetUnitItemCount(proc->units[0]) < proc->hand_disp_y + 1)
						proc->hand_disp_y--;
				}
			} else if (proc->sel_action == 1) {
				if (gPrepMenuScrollPos != 0 && GetUnitItemCount(proc->units[0]) <= 4) {
					PlaySe(SONG_6A);

					proc->units[0]->items[GetUnitItemCount(proc->units[0])] =
						gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y].item;

					UnitRemoveInvalidItems(proc->units[0]);

					for (i = proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y; i < gPrepAllItemsCount; i++)
						gPrepItemListData[i].item = gPrepItemListData[i + 1].item;

					gPrepAllItemsCount--;
					gPrepMenuScrollPos--;

					func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
					func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 16, 0);
					func_fe6_0807D6C0(0, proc->units[0]);
					PrepAllItems_Update();
					gAction.id = ACTION_TRADED_SUPPLY;

					if (GetUnitItemCount(proc->units[0]) == 5 || gPrepAllItemsCount == 0)
						proc->menu_scrolling_pos = 0xFF;
				} else {
					PlaySe(SONG_6C);
				}
			}

			if (proc->sel_action == 2) {
				if (gPrepMenuScrollPos != 0) {
					if (GetItemAttributes(gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y].item) & ITEM_ATTR_IMPORTANT) {
						StartPrepErrorHelpbox(
							proc->hand_disp_x * 0x70 + 0x10,
							proc->hand_disp_y * 0x10 + 0x48 - proc->hand_disp_x * 0x20,
							MSG_C33, proc);
					} else {
						PlaySe(SONG_6A);

						proc->unk30 = 1;
						proc->menu_scrolling_pos = 0x14;

						PutUiWindowFrame(2, 4, 12, 7, 0);
						PrepPutText(&gPrepTexts1[0][0], gBg0Tm + TM_OFFSET(4, 5), 0, 0, String_Prep_083272CC);
						PrepPutText(&gPrepTexts1[0][1], gBg0Tm + TM_OFFSET(7, 5), 0, 0, String_Prep_083272D4);
						PrepPutText(&gPrepTexts1[0][2], gBg0Tm + TM_OFFSET(5, 8), 0, 0, String_Prep_Yes);
						PrepPutText(&gPrepTexts1[0][3], gBg0Tm + TM_OFFSET(9, 8), 0, 0, String_Prep_No);
						break;
					}
				} else {
					PlaySe(SONG_6C);
					PutUiEntryHover(
						proc->hand_disp_x * 14 + 2,
						proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
						12);
					break;
				}
			} else
				func_fe6_0807D358(proc);

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
				12);
		} else if ((gKeySt->pressed & KEY_BUTTON_R) && proc->unk29 == 0) {
			if (proc->sel_action == 0) {
				proc->unk29 = 2;
				StartItemHelpBox(
					proc->hand_disp_x * 0x70 + 0x10,
					proc->hand_disp_y * 0x10 + 0x48 - proc->hand_disp_x * 0x20,
					proc->units[0]->items[proc->hand_disp_y]);
			} else if (gPrepMenuScrollPos != 0 && (proc->sel_action == 1 || proc->sel_action == 2)) {
				proc->unk29 = 2;
				StartItemHelpBox(
					proc->hand_disp_x * 0x70 + 0x10,
					proc->hand_disp_y * 0x10 + 0x48 - proc->hand_disp_x * 0x20,
					gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y].item);
			}
		} else {
			if (proc->hand_disp_x == 1) {
				if (gKeySt->held & KEY_BUTTON_L)
					proc->unk_4A = 2;
				else
					proc->unk_4A = 1;

				if ((gKeySt->repeated & KEY_DPAD_UP) || ((gKeySt->pressed2 & KEY_DPAD_UP) && proc->unk_4A == 2)) {
					if (proc->hand_disp_y == 1 && proc->menu_scroll_bar_disp_idx != 0) {
						PlaySe(SONG_66);
						func_fe6_0807DB80(&gPrepTexts1[1][0], 1, proc->menu_scroll_bar_disp_idx / 16 - 1, proc->units[0], 0);
						func_fe6_0807D358(proc);
						proc->menu_scroll_bar_disp_idx -= proc->unk_4A * 4;
						proc->menu_scrolling_pos = 1;
						break;
					}

					if (proc->hand_disp_y == 0)
						break;

					PlaySe(SONG_66);
					RemoveUiEntryHover(
						proc->hand_disp_x * 14 + 2,
						proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
						12);
					proc->hand_disp_y--;
					PutUiEntryHover(
						proc->hand_disp_x * 14 + 2,
						proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
						12);
					break;
				}

				if (((gKeySt->repeated & KEY_DPAD_DOWN) || ((gKeySt->pressed2 & KEY_DPAD_DOWN) && proc->unk_4A == 2)) && proc->hand_disp_y <= 5) {
					if (proc->hand_disp_y == 5 && proc->menu_scroll_bar_disp_idx / 16 + 7 < gPrepMenuScrollPos) {
						PlaySe(SONG_66);
						func_fe6_0807DB80(&gPrepTexts1[1][0], 1, proc->menu_scroll_bar_disp_idx / 16 + 7, proc->units[0], 0);
						func_fe6_0807D358(proc);
						proc->menu_scroll_bar_disp_idx += proc->unk_4A * 4;
						proc->menu_scrolling_pos = 2;
						break;
					}

					if (proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y + 1 >= gPrepMenuScrollPos)
						break;

					PlaySe(SONG_66);
					RemoveUiEntryHover(
						proc->hand_disp_x * 14 + 2,
						proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
						12);
					proc->hand_disp_y++;
					PutUiEntryHover(
						proc->hand_disp_x * 14 + 2,
						proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
						12);
					break;
				}
			} else if (gKeySt->repeated & KEY_DPAD_UP) {
				RemoveUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);

				if (proc->hand_disp_y != 0) {
					PlaySe(SONG_66);
					proc->hand_disp_y--;
				} else if (gKeySt->pressed & KEY_DPAD_UP) {
					PlaySe(SONG_66);
					proc->hand_disp_y = GetUnitItemCount(proc->units[proc->hand_disp_x]) - 1;
				}

				PutUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);
			} else if (gKeySt->repeated & KEY_DPAD_DOWN) {
				RemoveUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);

				if (proc->hand_disp_y < GetUnitItemCount(proc->units[0]) - 1 && proc->hand_disp_y < 4) {
					PlaySe(SONG_66);
					proc->hand_disp_y++;
				} else if (gKeySt->pressed & KEY_DPAD_DOWN) {
					PlaySe(SONG_66);
					proc->hand_disp_y = 0;
				}

				PutUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
					12);
			}

			if (proc->hand_disp_x == 1) {
				if (gKeySt->repeated & KEY_DPAD_RIGHT) {
					PlaySe(SONG_67);
					RemoveUiEntryHover(
						proc->hand_disp_x * 14 + 2,
						proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
						12);
					proc->unk_32[proc->convoy_page] = proc->menu_scroll_bar_disp_idx / 16;
					proc->unk_3B[proc->convoy_page] = proc->hand_disp_y;
					proc->convoy_scrolling_pos = 0x38;
					proc->menu_scrolling_pos = 5;
				} else if (gKeySt->repeated & KEY_DPAD_LEFT) {
					PlaySe(SONG_67);
					RemoveUiEntryHover(
						proc->hand_disp_x * 14 + 2,
						proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
						12);
					proc->unk_32[proc->convoy_page] = proc->menu_scroll_bar_disp_idx / 16;
					proc->unk_3B[proc->convoy_page] = proc->hand_disp_y;
					proc->convoy_scrolling_pos = 0xC8;
					proc->menu_scrolling_pos = 10;
				}
			}
		}
		break;

	case 1:
		proc->menu_scroll_bar_disp_idx -= proc->unk_4A * 4;

		if ((proc->menu_scroll_bar_disp_idx % 16) == 0) {
			TmFillRect(gBg2Tm + TM_OFFSET(0xF, ((proc->menu_scroll_bar_disp_idx / 16 + 7) * 2) & 0x1F), 0xF, 1, 0);
			EnableBgSync(BG2_SYNC_BIT);
			proc->menu_scrolling_pos = 0;
		}
		break;

	case 2:
		proc->menu_scroll_bar_disp_idx += proc->unk_4A * 4;

		if ((proc->menu_scroll_bar_disp_idx % 16) == 0) {
			TmFillRect(gBg2Tm + TM_OFFSET(0xF, ((proc->menu_scroll_bar_disp_idx / 16 - 1) * 2) & 0x1F), 0xF, 1, 0);
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

		proc->menu_scroll_bar_disp_idx = proc->unk_32[proc->convoy_page] * 16;
		proc->hand_disp_y = proc->unk_3B[proc->convoy_page];

		func_fe6_0807D834(proc->convoy_page);
		func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
		func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 16, 1);

		PutUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
			12);

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

		proc->menu_scroll_bar_disp_idx = proc->unk_32[proc->convoy_page] * 16;
		proc->hand_disp_y = proc->unk_3B[proc->convoy_page];

		func_fe6_0807D834(proc->convoy_page);
		func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
		func_fe6_0807D9E4(&gPrepTexts1[1][0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 16, 1);

		PutUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
			12);

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

	sel = proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y;

	if (prev_sel != sel || prev_page != proc->convoy_page) {
		if (proc->unk29 != 0) {
			if (proc->sel_action == 0) {
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
					gPrepItemListData[sel].item);

				proc->unk29 = 2;
			}
		}

		if (proc->sel_action == 2)
			PrepItem_PutItemDesc(1, 0xB,
				gPrepItemListData[proc->menu_scroll_bar_disp_idx / 16 + proc->hand_disp_y].item,
				proc->subproc1);
	}

	SetBgOffset(BG_2, proc->convoy_scrolling_pos, (proc->menu_scroll_bar_disp_idx - 0x28) & 0xFF);
	proc->timer++;
}
