#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "helpbox.h"
#include "sound.h"
#include "ui.h"
#include "unit.h"
#include "prepscreen.h"
#include "constants/msg.h"

void PrepSubItem_Trade_Loop(struct PrepSubItemProc *proc)
{
	char pre_sel_x;
	int pre_sel_y;

	pre_sel_x = proc->hand_disp_x;
	pre_sel_y = proc->hand_disp_y;

	func_fe6_0807E544(proc);

	if (proc->unk29 == 2 && (gKeySt->pressed & (KEY_BUTTON_B | KEY_BUTTON_R))) {
		CloseHelpBox();
		proc->unk29 = 0;
		return;
	}

	if ((gKeySt->repeated & KEY_DPAD_LEFT) && (proc->hand_disp_x == 1)) {
		if (proc->unk_3B[0] != 0) {
			PlaySe(0x67);

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);

			proc->hand_disp_x--;

			if (proc->hand_disp_y >= proc->unk_3B[proc->hand_disp_x])
				proc->hand_disp_y = proc->unk_3B[proc->hand_disp_x] - 1;

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);
		}
	} else if ((gKeySt->repeated & KEY_DPAD_RIGHT) && (proc->hand_disp_x == 0)) {
		if (proc->unk_3B[1] != 0) {
			PlaySe(0x67);

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);

			proc->hand_disp_x++;

			if (proc->hand_disp_y >= proc->unk_3B[proc->hand_disp_x])
				proc->hand_disp_y = proc->unk_3B[proc->hand_disp_x] - 1;

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

		if (proc->hand_disp_y < (proc->unk_3B[proc->hand_disp_x] - 1)) {
			proc->hand_disp_y++;
			PlaySe(0x66);
		} else if (gKeySt->pressed & KEY_DPAD_DOWN) {
			proc->hand_disp_y = 0;
			PlaySe(0x66);
		}

		PutUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9,
			0xC);
	} else if ((gKeySt->pressed & KEY_BUTTON_A) && (proc->unk29 == 0)) {
		PlaySe(0x6A);

		if (proc->unk30 == 0xFF) {
			proc->unk30 = proc->hand_disp_x;
			proc->sel_action = proc->hand_disp_y;

			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);

			proc->hand_disp_x = (proc->hand_disp_x + 1) & 1;

			if (GetUnitItemCount(proc->units[proc->hand_disp_x]) < 5)
				proc->hand_disp_y = proc->unk_3B[proc->hand_disp_x];

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);
		} else {
			if ((proc->unk_4C != 0) && !CheckValidLinkArenaItemSwap(
					proc->units[proc->unk30], proc->sel_action,
					proc->units[proc->hand_disp_x], proc->hand_disp_y)) {

					proc->hand_disp_y = proc->hand_disp_y;
					StartPrepErrorHelpbox(
						proc->hand_disp_x * 0x70 + 0x10,
						proc->hand_disp_y * 0x10 + 0x48,
						MSG_6C2, proc);
			} else {
				int tmp = proc->units[proc->unk30]->items[proc->sel_action];

				proc->units[proc->unk30]->items[proc->sel_action] =
					proc->units[proc->hand_disp_x]->items[proc->hand_disp_y];

				proc->units[proc->hand_disp_x]->items[(*proc).hand_disp_y] = tmp;

				RemoveUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9,
					0xC);

				UnitRemoveInvalidItems(proc->units[0]);
				UnitRemoveInvalidItems(proc->units[1]);

				func_fe6_0807D6C0(0, proc->units[0]);
				func_fe6_0807D6C0(1, proc->units[1]);

				if (proc->units[proc->unk30]->items[proc->sel_action]) {
					proc->hand_disp_x = proc->unk30;
					proc->hand_disp_y = proc->sel_action;
				} else if (GetUnitItemCount(proc->units[proc->unk30]) > 0) {
					proc->hand_disp_x = proc->unk30;
					proc->hand_disp_y = proc->sel_action - 1;
				} else {
					proc->hand_disp_y = 0;
				}

				proc->unk30 = 0xFF;

				PutUiEntryHover(
					proc->hand_disp_x * 14 + 2,
					proc->hand_disp_y * 2 + 9,
					0xC);
			}
		}
	} else if ((gKeySt->pressed & KEY_BUTTON_B)) {
		PlaySe(0x6B);

		if (proc->unk30 == 0xFF) {
			if (proc->unk2A == 0)
				Proc_Goto(proc, PL_PREP_SUBITEM_7);
			else {
				NewSallyCir2(proc, 1);
				Proc_Goto(proc, PL_PREP_SUBITEM_6);
			}
		} else {
			RemoveUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);

			proc->hand_disp_x = proc->unk30;
			proc->hand_disp_y = proc->sel_action;
			proc->unk30 = 0xFF;

			PutUiEntryHover(
				proc->hand_disp_x * 14 + 2,
				proc->hand_disp_y * 2 + 9,
				0xC);
		}
	} else if ((gKeySt->pressed & KEY_BUTTON_R) && (proc->unk29 == 0)) {
		if (proc->units[proc->hand_disp_x]->items[proc->hand_disp_y]) {
			proc->unk29 = 2;
			StartItemHelpBox(
				proc->hand_disp_x * 0x70 + 0x10,
				proc->hand_disp_y * 0x10 + 0x48,
				proc->units[proc->hand_disp_x]->items[proc->hand_disp_y]);
		}
	}

	if (proc->unk29 == 2)
	{
		if ((pre_sel_x != proc->hand_disp_x) || (pre_sel_y != proc->hand_disp_y))
		{
			StartItemHelpBox(
				proc->hand_disp_x * 0x70 + 0x10,
				proc->hand_disp_y * 0x10 + 0x48,
				proc->units[proc->hand_disp_x]->items[proc->hand_disp_y]);
		}
	}
}
