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

extern const char String_Prep_08327294[];
extern const char Msg_Prep_Supply[]; // 輸送隊

void func_fe6_0807D9E4(struct Text *text, u8 x, struct Unit *unit, u16 off, int unused)
{
	u16 i;

	TmFill(gBg2Tm, 0);

	if (gPrepMenuScrollPos == 0) {
		ClearText(text);
		Text_SetCursor(text, 0);
		Text_SetColor(text, TEXT_COLOR_SYSTEM_GRAY);
		Text_DrawString(text, String_Prep_08327294);
		PutText(text, gBg2Tm + TM_OFFSET(x * 14 + 4, 0));
	}

	for (i = off; i < (off + 7) && i < gPrepMenuScrollPos; i++) {
		bool usable;

		ClearText(&text[i & 7]);
		Text_SetCursor(&text[i & 7], 0);
		PutIcon(
			gBg2Tm + TM_OFFSET(x * 14 + 2, (i * 2) & 0x1F),
			GetItemIcon(gPrepItemListData[i].u.info.item),
			OAM2_PAL(OBPAL_PREPMENU_4));
		func_fe6_0807D2F4(GetItemIcon(gPrepItemListData[i].u.info.item));

		if (!unit || IsItemDisplayUsable(unit, gPrepItemListData[i].u.info.item))
			usable = true;
		else
			usable = false;

		Text_SetColor(&text[i & 7], usable ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY);
		Text_DrawString(&text[i & 7], GetItemName(gPrepItemListData[i].u.info.item));
		PutText(&text[i & 7], gBg2Tm + TM_OFFSET(x * 14 + 4, (i * 2) & 0x1F));
		PutNumberOrBlank(
			gBg2Tm + TM_OFFSET(x * 14 + 0xD, (i * 2) & 0x1F),
			usable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
			GetItemUses(gPrepItemListData[i].u.info.item));
	}

	EnableBgSync(BG2_SYNC_BIT);
}

void func_fe6_0807DB80(struct Text *texts, u8 x, u16 y, struct Unit *unit)
{
	i8 tmp;
	struct Text *text;
	u8 _y = y & 0xF;

	TmFillRect(gBg2Tm + TM_OFFSET(x * 14, _y * 2), 0x10, 1, 0);
	ClearText(&texts[y & 0x7]);
	PutIcon(
		gBg2Tm + TM_OFFSET(x * 14 + 2, _y * 2),
		GetItemIcon(gPrepItemListData[y].u.info.item),
		0x4000);
	func_fe6_0807D2F4(GetItemIcon(gPrepItemListData[y].u.info.item));

	if (unit == NULL || IsItemDisplayUsable(unit, gPrepItemListData[y].u.info.item) != false)
		tmp = 1;
	else
		tmp = 0;

	text = &texts[y & 0x7];

	Text_SetColor(text, (tmp == 0) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);
	Text_SetCursor(text, 0);
	Text_DrawString(text, GetItemName(gPrepItemListData[y].u.info.item));
	PutText(text, gBg2Tm + TM_OFFSET(x * 14 + 4, _y * 2));
	PutNumberOrBlank(
		gBg2Tm + TM_OFFSET(x * 14 + 13, _y * 2),
		(tmp != 0) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
		GetItemUses(gPrepItemListData[y].u.info.item));

	EnableBgSync(BG2_SYNC_BIT);
}

void PrepAllItems_PutPName(struct Text *text, u8 pid, u8 x, u8 y)
{
	TmFillRect(gBg0Tm + TM_OFFSET(0xF, 0), 0xF, 1, 0);

	if (gPrepMenuScrollPos == 0)
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
		if (gPrepItemListData[i].u.info.pid == 0) {
			supply_items[j] = gPrepItemListData[i].u.info.item;
			j++;
		}
	}

	for (; j < SUPPLY_ITEM_COUNT; j++)
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
	
	tmp = gPrepItemListData[c_slot].u.raw;
	gPrepItemListData[c_slot].u.info.item = unit->items[u_slot];
	unit->items[u_slot] = tmp >> 0x10;

	UnitRemoveInvalidItems(unit);

	if (gPrepItemListData[c_slot].u.info.item == 0) {
		u16 i;

		for (i = c_slot; i < gPrepAllItemsCount; i++) {
			gPrepItemListData[i].u.raw = gPrepItemListData[i + 1].u.raw;

			if (gPrepItemListData[i].u.info.pid == 0)
				gPrepItemListData[i].u.info.slot--;
		}

		gPrepMenuScrollPos--;
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
