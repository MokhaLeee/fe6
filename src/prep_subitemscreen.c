#include "prelude.h"
#include "proc.h"
#include "bm.h"
#include "face.h"
#include "ui.h"
#include "hardware.h"
#include "armfunc.h"
#include "prepscreen.h"

void PrepSubItem_HandleAction(struct PrepSubItemProc *proc)
{
	if (proc->unk2D == PREP_SUB2U2D_3) {
		proc->proc_parent->unk_39 = proc->convoy_page;

		SetPrepMenuScrollBarBaseInfo(
			proc->proc_menuscroll,
			0, 0, 13, 0, 0, 0);

		proc->unk_4E = proc->menu_scroll_bar_disp_idx;
		proc->unk_47 = proc->hand_disp_y;

		if (gPrepItemlData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 16].unk_00 == 0) {
			proc->menu_scrolling_pos = 0;
			proc->unk_48 = gPrepItemlData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 16].unk_01;
			return;
		}
	}

	if (proc->hand_disp_x == 0) {
		RemoveUiEntryHover(
			proc->hand_disp_x * 14 + 2,
			proc->hand_disp_y * 2 + 9 - proc->hand_disp_x * 4,
			12);
	}

	TmFillRect(gBg0Tm + TM_OFFSET(0xF, 0), 0xF, 0x13, 0);
	TmFillRect(gBg1Tm + TM_OFFSET(0xF, 0), 0xF, 0x13, 0);
	TmFillRect(gBg2Tm + TM_OFFSET(0xF, 0), 0xF, 0x1F, 0);

	if (proc->unk2D == PREP_SUB2U2D_3) {
		proc->proc_parent->unk_39 = proc->convoy_page;

		if (gPrepItemlData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 16].unk_00 == 0) {
			proc->unk_48 = gPrepItemlData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 16].unk_01;
			Proc_Goto(proc, PL_PREP_SUBITEM_CONVOY);
		} else {
			proc->unit2 = GetUnitByPid(gPrepItemlData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 16].unk_00);
			proc->hand_disp_y = gPrepItemlData[proc->hand_disp_y + proc->menu_scroll_bar_disp_idx / 16].unk_01;
			Proc_Goto(proc, PL_PREP_SUBITEM_TRADE);
		}
	} else {
		EndFaceById(1);
		Proc_Goto(proc, PL_PREP_SUBITEM_VIEWALL);
	}

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void PrepSubItem_OnEnd(struct PrepSubItemProc *proc)
{
	if (proc->unk2D != PL_PREP_SUBITEM_5) {
		if (proc->unk2A == 0)
			proc->proc_parent->unk_39 = proc->convoy_page;

		if (proc->unk2A == 4)
			proc->proc_parent->unk_3A = proc->convoy_page;

		InitBmBgLayers();
	} else {
		Proc_End(proc->subproc1);
	}

	EndFaceById(0);
	EndFaceById(1);

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

struct ProcScr CONST_DATA ProcScr_PrepSubItemScreen[] = {
	PROC_19,
	PROC_YIELD,
	PROC_CALL(PrepSubItemScreen_Init),
PROC_LABEL(PL_PREP_SUBITEM_VIEWALL),
	PROC_CALL(PrepSubItem_StartViewAllScreen),
PROC_LABEL(1),
	PROC_REPEAT(func_fe6_0807EDBC),
PROC_LABEL(PL_PREP_SUBITEM_TRADE),
	PROC_CALL(PrepSubItem_StartTradeScreen),
PROC_LABEL(3),
	PROC_REPEAT(PrepSubItem_0807E5A8),
PROC_LABEL(PL_PREP_SUBITEM_CONVOY),
	PROC_CALL(PrepSubItem_StartSupplyScreen),
PROC_LABEL(5),
	PROC_REPEAT(PrepSubItem_SelLoop1),
	PROC_REPEAT(PrepSubItem_SelLoop2),
PROC_LABEL(7),
	PROC_CALL(PrepSubItem_HandleAction),
PROC_LABEL(6),
	PROC_CALL(PrepSubItem_OnEnd),
	PROC_END,
};

void StartPrepSubItemScreen(struct PrepMenuProc *parent, u8 type)
{
	struct PrepSubItemProc *proc;

	proc = SpawnProcLocking(ProcScr_PrepSubItemScreen, parent);
	proc->unk2A = type;
	proc->unk2D = 0; // TODO: enum
}

struct ProcScr CONST_DATA ProcScr_BmSupplyScreen[] = {
	PROC_19,
	PROC_CALL(LockGame),
	PROC_YIELD,
	PROC_CALL(PrepSubItemScreen_Init),
PROC_LABEL(4),
	PROC_CALL(PrepSubItem_StartSupplyScreen),
	PROC_YIELD,
PROC_LABEL(5),
	PROC_REPEAT(PrepSubItem_SelLoop1),
PROC_LABEL(7),
	PROC_YIELD,
	PROC_REPEAT(PrepSubItem_SelLoop2),
PROC_LABEL(6),
	PROC_CALL(PrepSubItem_OnEnd),
	PROC_YIELD,
	PROC_CALL(UnlockGame),
	PROC_END,
};

void StartBmSupply(struct Unit *unit, ProcPtr parent)
{
	struct PrepSubItemProc *proc;

	if (parent == NULL)
		proc = SpawnProc(ProcScr_BmSupplyScreen, PROC_TREE_3);
	else
		proc = SpawnProcLocking(ProcScr_BmSupplyScreen, parent);

	proc->unk2D = 4; // TODO: enum
	proc->unit1 = unit;
	proc->unk4B = 0;
}

void StartBmSupplyForDrop(struct Unit *unit, ProcPtr parent)
{
	struct PrepSubItemProc *proc;

	if (parent == NULL)
		proc = SpawnProc(ProcScr_BmSupplyScreen, PROC_TREE_3);
	else
		proc = SpawnProcLocking(ProcScr_BmSupplyScreen, parent);

	proc->unk2D = 4; // TODO: enum
	proc->unit1 = unit;
	proc->unk4B = 1;
}
