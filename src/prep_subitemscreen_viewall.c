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

#if 0
void PrepSubItem_StartViewAllScreen(struct PrepSubItemProc *proc)
{
    int iuid;
    u8 i;
    const u16 *supply_items = GetSupplyItems();

    PutUiWindowFrame(15, 4, 15, 16, 0);

    gPrepAllItemsCount = 0;

    // FOR_UNITS_FACTION FACTION_BLUE
    for (iuid = FACTION_BLUE + 1; iuid < (FACTION_BLUE + 0x40); iuid++) {
        u8 count;
        struct Unit *iunit = GetUnit(iuid);

        if (!iunit || !iunit->pinfo)
            continue;

        if (iunit->flags & UNIT_FLAG_DEAD)
            continue;

        if (iunit == proc->units[0])
            continue;

        count = GetUnitItemCount(iunit);

        for (i = 0; i < count; i++) {
            gPrepItemListData[gPrepAllItemsCount].u.info.pid  = UNIT_PID(iunit);
            gPrepItemListData[gPrepAllItemsCount].u.info.item = iunit->items[i];
            gPrepItemListData[gPrepAllItemsCount].u.info.slot = i;
        }
    }

    for (i = 0; i < SUPPLY_ITEM_COUNT && supply_items[i] != 0; i++) {
        gPrepItemListData[i].u.info.item = supply_items[i];
        gPrepItemListData[i].u.info.pid = 0;
        gPrepItemListData[i].u.info.slot = i;
        gPrepAllItemsCount++;
    }

    proc->convoy_page = proc->proc_parent->unk_39;
    func_fe6_0807D834(proc->convoy_page);
    proc->menu_scroll_bar_disp_idx = proc->unk_4E;
    proc->hand_disp_y = proc->unk_47;
    func_fe6_080823A0(&proc->hand_disp_y, &proc->menu_scroll_bar_disp_idx);
    func_fe6_0807D9E4(&gPrepTexts2[0], 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 0);
    func_fe6_0807D358(proc);
    proc->convoy_scrolling_pos = 0;
    proc->hand_disp_x = 1;
    proc->unk30 |= 0xFF;
    proc->sel_action |= 0xFF;

    PrepAllItems_PutPName(
        &gPrepTexts3[1],
        gPrepItemListData[proc->menu_scroll_bar_disp_idx / 0x10 + proc->hand_disp_y].u.info.pid,
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

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    proc->menu_scrolling_pos = 0;

    if (proc->unk2D == 0)
        NewSallyCir2(proc, -1);
    else if (proc->unk2D == 1)
        Proc_End(proc->subproc1);

    proc->subproc1 = func_fe6_0807D16C(proc);
    func_fe6_0807E06C(true);
    proc->unk2D = 3;
}
#endif
