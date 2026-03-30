#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "bm.h"
#include "oam.h"
#include "sound.h"
#include "sprite.h"
#include "text.h"
#include "msg.h"
#include "icon.h"
#include "unit.h"
#include "item.h"
#include "supply.h"
#include "ui.h"
#include "armfunc.h"
#include "prepscreen.h"
#include "constants/msg.h"

extern const char Msg_Prep_Supply[]; // 輸送隊

#if 0
void func_fe6_0807DB80(struct Text *texts, u8 x, u16 y, struct Unit *unit)
{
	int tmp;
	struct Text *text;

	TmFillRect(gBg2Tm + TM_OFFSET(x * 7, y & 0xF), 0x10, 1, 0);
	ClearText(&texts[y & 0x7]);
	PutIcon(
		gBg2Tm + TM_OFFSET(x * 7 + 1, y & 0xF),
		GetItemIcon(gPrepConvoyData[y].u.info.item),
		y);
	func_fe6_0807D2F4(GetItemIcon(gPrepConvoyData[y].u.info.item));

	if (unit == NULL || IsItemDisplayUseable(unit, gPrepConvoyData[y].u.info.item) != false)
		tmp = 1;
	else
		tmp = 0;

	text = &texts[y & 0x7];

	Text_SetColor(text, (tmp == 0) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);
	Text_SetCursor(text, 0);
	Text_DrawString(text, GetItemName(gPrepConvoyData[y].u.info.item));
	PutText(text, gBg2Tm + TM_OFFSET(x * 7 + 2, y & 0xF));
	PutNumberOrBlank(
		gBg2Tm + TM_OFFSET(x * 7 + 15, y & 0xF),
		(tmp == 0) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
		GetItemUses(gPrepConvoyData[y].u.info.item));

	EnableBgSync(BG2_SYNC_BIT);
}
#endif

void PrepAllItems_PutPName(struct Text *text, u8 pid, u8 x, u8 y)
{
	TmFillRect(gBg0Tm + TM_OFFSET(0xF, 0), 0xF, 1, 0);

	if (gPrep_Unk_0201636A == 0)
		TmFillRect(gBg0Tm + TM_OFFSET(20, 0), 9, 1, 0);
	else if (pid == 0) {
		ClearText(text);
		Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
		Text_SetCursor(text, (0x28 - GetStringTextLen(Msg_Prep_Supply)) / 2);
		Text_DrawString(text, Msg_Prep_Supply);
		PutText(text, gBg0Tm + TM_OFFSET(x, y));
	} else {
		struct Unit *unit = GetUnitByPid(pid);

		ClearText(text);
		Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
		Text_SetCursor(text, (0x28 - GetStringTextLen(DecodeMsg(unit->pinfo->msg_name))) / 2);
		Text_DrawString(text, DecodeMsg(unit->pinfo->msg_name));
		PutText(text, gBg0Tm + TM_OFFSET(x, y));
	}

	EnableBgSync(BG0_SYNC_BIT);
}

void PrepAllItems_PutTotalNum(u8 x, u8 y)
{
	u8 total_num = GetTotalSupplyItemCount();

	TmFillRect(gBg0Tm + TM_OFFSET(x - 3, y), 6, 1, 0);
	PrepPutText(&gPrepTexts3[1], gBg0Tm + TM_OFFSET(0x12, 0), TEXT_COLOR_SYSTEM_WHITE, 4, Msg_Prep_Supply);

	PutNumber(gBg0Tm + TM_OFFSET(x, y), TEXT_COLOR_SYSTEM_BLUE, total_num);
	PutNumber(gBg0Tm + TM_OFFSET(x + 4, y), TEXT_COLOR_SYSTEM_BLUE, 100);
	PutSpecialChar(gBg0Tm + TM_OFFSET(x + 1, y), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_SLASH);

	EnableBgSync(BG0_SYNC_BIT);
}

void PrepAllItems_Update(void)
{
	u16 *supply_items = GetSupplyItems();
	u16 i, j = 0;

	for (i = 0; i < gPrepAllItemsCount; i++) {
		if (gPrepConvoyData[i].u.info.unk_00 == 0) {
			supply_items[j] = gPrepConvoyData[i].u.info.item;
			j++;
		}
	}

	for (; j < 100; j++)
		supply_items[j] = 0;

	PrepAllItems_PutTotalNum(0x18, 0);
}

void func_fe6_0807DEC8(struct PrepSubItemProc *proc, u16 item)
{
	register u8 i;
	register u8 kind;

	kind = GetItemKind(item);

	for (i = 0; i < 9; i++) {
		if ((kind == gUnk_08679354[i * 2 + 0]) || (kind == gUnk_08679354[i * 2 + 1]))
			break;
	}

	if (proc->convoy_page != i) {
		proc->convoy_page = i;
		proc->menu_scroll_bar_disp_idx = proc->unk_32[proc->convoy_page] * 0x10;
		func_fe6_0807D834(proc->convoy_page);
		func_fe6_080823A0(proc->unk_3B + proc->convoy_page, &proc->menu_scroll_bar_disp_idx);
		func_fe6_0807D9E4(gPrepTexts2, 1, proc->units[0], proc->menu_scroll_bar_disp_idx / 0x10, 1);
		func_fe6_0807D358(proc);
	}
}

bool PrepAllItems_SwapItems(struct Unit *unit, u8 u_slot, u16 c_slot)
{
	u32 tmp;
	
	tmp = gPrepConvoyData[c_slot].u.raw;
	gPrepConvoyData[c_slot].u.info.item = unit->items[u_slot];
	unit->items[u_slot] = tmp >> 0x10;

	UnitRemoveInvalidItems(unit);

	if (gPrepConvoyData[c_slot].u.info.item == 0) {
		u16 i;

		for (i = c_slot; i < gPrepAllItemsCount; i++) {
			gPrepConvoyData[i].u.raw = gPrepConvoyData[i + 1].u.raw;

			if (gPrepConvoyData[i].u.info.unk_00 == 0)
				gPrepConvoyData[i].u.info.unk_01--;
		}

		gPrep_Unk_0201636A--;
		gPrepAllItemsCount--;
		PrepAllItems_Update();
		return true;
	}

	PrepAllItems_Update();
	return false;
}

void func_fe6_0807DFEC(u8 a, int timer, int obj_off)
{
	u8 tmp = timer;
	const u16 *src = Pal_Prep_0831B068;

	gPal[PAL_COLOR_OFFSET(0x12, 0xD)] = src[(tmp >> 2) & 0xF];

	EnablePalSync();

	PutSprite(4, a * 12 + 0x7C, 0x18, Sprites_08679330[a], 0x2000 + obj_off / 0x20);
	PutSprite(4, a * 12 + 0x7C, 0x18, Sprite_08679326,	 0x2000 + obj_off / 0x20);
}
