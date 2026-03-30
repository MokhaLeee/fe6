#include "prelude.h"
#include "shop.h"
#include "bm.h"
#include "ui.h"
#include "msg.h"
#include "util.h"
#include "bmio.h"
#include "mapui.h"
#include "item.h"
#include "talk.h"
#include "gold.h"
#include "event.h"
#include "sound.h"
#include "supply.h"
#include "chapter.h"
#include "hardware.h"
#include "helpbox.h"\

#include "constants/iids.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

#if 0
int ShopUpdateBg2Offset(int off, int tar, int trig)
{
	if ((off - tar) >= 0)
	{
        if ((off - tar) < trig)
		    goto here;
	}
	else if  ((tar - off) >= trig)
	{
        here:
		return tar;
	}

	if ((tar - off) <= 0)
	{
        off = off;
		if ((tar - off) < 0) {
			off = off + (-trig);
        }
	}
	else
	{
		off = off + trig;
	}

	return off;
}
#endif

void RegisterShopState(u16 head_loc, u16 item_cnt, u16 lines, u16 hand_loc, int bg2_base, ShopFunc func, struct ProcShop * proc)
{

	ShopSt_SetHeadLocBak(head_loc);

	gpShopSt->head_loc = head_loc;
	gpShopSt->item_cnt = item_cnt;
	gpShopSt->lines = lines;
	gpShopSt->hand_loc = hand_loc;
	gpShopSt->px_per_line = 16;
	gpShopSt->trig = 4;
	gpShopSt->draw_line = func;
	gpShopSt->proc = proc;
	gpShopSt->bg2_base = -bg2_base;
	gpShopSt->bg2_off = hand_loc * 16;
}

void Shop_TryMoveHandPage(void)
{

	gpShopSt->head_loc = ShopTryMoveCursor(gpShopSt->head_loc, gpShopSt->item_cnt, 0);

	switch (ShopTryScrollPage(gpShopSt->head_loc, gpShopSt->item_cnt, gpShopSt->lines, gpShopSt->hand_loc)) {
	case 0:
	default:
		break;

	case +1:
		gpShopSt->hand_loc++;
		gpShopSt->draw_line(gpShopSt->proc, gpShopSt->hand_loc + gpShopSt->lines - 1);
		break;

	case -1:
		gpShopSt->hand_loc--;
		gpShopSt->draw_line(gpShopSt->proc, gpShopSt->hand_loc);
		break;
	}

	gpShopSt->bg2_off = ShopUpdateBg2Offset(
							gpShopSt->bg2_off,
							gpShopSt->hand_loc * gpShopSt->px_per_line,
							gpShopSt->trig);
}

u16 ShopSt_GetHeadLoc(void)
{
	return gpShopSt->head_loc;
}

int ShopSt_GetBg2Offset(void)
{
	return gpShopSt->bg2_base + gpShopSt->bg2_off;
}

u16 ShopSt_GetHandLoc(void)
{
	return gpShopSt->hand_loc;
}

void ShopSt_SetLineHeight(int px)
{
	gpShopSt->px_per_line = px;
}

void ShopSt_SetSetPageScrollTrigOffset(int trig)
{
	gpShopSt->trig = trig;
}

bool IsShopPageScrolling(void)
{
	if (gpShopSt->bg2_off != (gpShopSt->hand_loc * gpShopSt->px_per_line))
		return true;

	return false;
}

bool ShouldDisplayUpArrow(void)
{
	if (gpShopSt->hand_loc != 0) {
		return true;
	}

	return false;
}

bool ShouldDisplayDownArrow(void)
{
	if (gpShopSt->hand_loc + gpShopSt->lines < gpShopSt->item_cnt)
		return true;

	return false;
}


bool func_fe6_08097E2C(int a)
{
	struct MusicPlayer *info = gMusicPlayerTable[gSongTable[0x39].ms].music_player;

	if (((info->status & MUSICPLAYER_STATUS_TRACK) == 0) && ((info->status & MUSICPLAYER_STATUS_PAUSE) == 0))
		return false;
    else
	    return true;
}
