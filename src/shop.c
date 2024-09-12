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
#include "chapter.h"
#include "hardware.h"
#include "helpbox.h"
#include "constants/iids.h"
#include "constants/faces.h"
#include "constants/msg.h"

u16 CONST_DATA gDefaultShopItems[] = {
    IID_IRONSWORD,
    IID_IRONLANCE,
    IID_IRONAXE,
    IID_IRONBOW,
    IID_FIRE,
    IID_HEALSTAFF,

    IID_NONE
};

int CONST_DATA gShopDislogueIdx[SHOP_TYPE_MAX] = {
    [SHOP_TYPE_ARMORY]      = 0,
    [SHOP_TYPE_VENDOR]      = 1,
    [SHOP_TYPE_SECRET_SHOP] = 2,
};

int CONST_DATA gShopFaces[SHOP_TYPE_MAX] = {
    [SHOP_TYPE_ARMORY]      = FID_B9,
    [SHOP_TYPE_VENDOR]      = FID_BB,
    [SHOP_TYPE_SECRET_SHOP] = FID_BC,
};

struct ProcScr CONST_DATA ProcScr_ShopFadeIn[] =
{
    PROC_CALL(LockGame),
    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, -1),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WhileFadeExists),
    PROC_CALL(LockBmDisplay),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_ShopFadeOut[] =
{
    PROC_CALL(ClearTalk),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(InitBmDisplay),
    PROC_CALL(StartMapSongBgm),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WhileFadeExists),
    PROC_CALL(UnlockGame),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_Shop[] =
{
    PROC_CALL(StartShopFadeIn),
    PROC_YIELD,
    PROC_CALL(func_fe6_08096B38),
    PROC_CALL(Shop_InitBuyState),
    PROC_START_CHILD(ProcScr_ShopDrawHand),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(1),
    PROC_CALL(Shop_EntryDialogue),

PROC_LABEL(PL_SHOP_ENTRY),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_HandleEntryDialoguePrompt),

PROC_LABEL(PL_SHOP_BUY),
    PROC_CALL(Shop_BuyDialogue),

PROC_LABEL(PL_SHOP_BUY_MAIN),
    PROC_CALL(Shop_InitBuyState),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_Loop_BuyKeyHandler),
    PROC_CALL(Shop_HandleBuyConfirmPrompt),
    PROC_GOTO(PL_SHOP_SENDTO_INVENTORY),

PROC_LABEL(PL_SHOP_BUY_DONE),
    PROC_CALL(Shop_AnythingElseDialogue),
    PROC_GOTO(PL_SHOP_BUY_MAIN),

PROC_LABEL(PL_SHOP_SELL),
    PROC_CALL(Shop_SellDialogue),

PROC_LABEL(PL_SHOP_SELL_MAIN),
    PROC_CALL(Shop_InitSellState),
    PROC_SLEEP(1),
    PROC_REPEAT(Shop_Loop_SellKeyHandler),
    PROC_CALL(Shop_HandleSellConfirmPrompt),
    PROC_SLEEP(2),
    PROC_CALL(Shop_SellAnythingElseDialogue),
    PROC_GOTO(PL_SHOP_SELL_MAIN),

PROC_LABEL(PL_SHOP_SELL_NOITEM),
    PROC_SLEEP(2),
    PROC_CALL(Shop_AnythingElseRestartDialogue),
    PROC_GOTO(PL_SHOP_ENTRY),

PROC_LABEL(PL_SHOP_ANYTHING_ELSE),
    PROC_SLEEP(1),
    PROC_CALL(Shop_AnythingElseContinueDialogue),
    PROC_GOTO(PL_SHOP_ENTRY),

PROC_LABEL(PL_SHOP_SENDTO_INVENTORY),
    PROC_CALL(Shop_TryAddItemToInventory),
    PROC_YIELD,
    PROC_CALL(Shop_HandleSendToConvoyPrompt),
    PROC_YIELD,
    PROC_CALL(Shop_CheckIfConvoyFull),
    PROC_CALL(Shop_ConvoyFullDialogue),
    PROC_YIELD,
    PROC_GOTO(PL_SHOP_SELL_NOITEM),

PROC_LABEL(PL_SHOP_SENDTO_INVENTORY_EXT),
    PROC_CALL(Shop_AddItemToConvoy),
    PROC_YIELD,
    PROC_CALL(Shop_SendToConvoyDialogue),
    PROC_YIELD,
    PROC_GOTO(PL_SHOP_BUY_DONE),

PROC_LABEL(PL_SHOP_BUY_FULL_NO_INEVNTORY),
    PROC_YIELD,
    PROC_CALL(Shop_NoSendToConvoyDialogue),
    PROC_YIELD,
    PROC_GOTO(PL_SHOP_SELL_NOITEM),

PROC_LABEL(PL_SHOP_EXIT),
    PROC_CALL(Shop_ExitShopDialogue),
    PROC_SLEEP(1),
    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(func_fe6_08014888),
    PROC_SLEEP(1),
    PROC_CALL(Shop_OnExit),
    PROC_END_EACH(ProcScr_ShopDrawHand),
    PROC_CALL(StartShopFadeOut),
    PROC_YIELD,
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_ShopBuyInit[] =
{
    PROC_REPEAT(InitShopBuyStatus),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_ShopSellInit[] =
{
    PROC_REPEAT(InitShopSellStatus),
    PROC_END,
};

int GetShopFace(struct ProcShop * proc)
{
    return gShopFaces[proc->shopType];
}

void StartShopDialogue(int msg, struct ProcShop * proc)
{
    int msgId = msg + gShopDislogueIdx[proc->shopType];

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, DecodeMsg(msgId), proc);

    SetTalkPrintColor(TEXT_COLOR_SYSTEM_WHITE);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetActiveTalkFace(TALK_FACE_1);
}

void StartDefaultArmoryScreen(struct Unit * unit, ProcPtr proc)
{
    StartShopScreen(unit, NULL, SHOP_TYPE_ARMORY, proc);
}

void StartArmoryScreenOrphaned(struct Unit * unit, u16 const * iid_list)
{
    StartShopScreen(unit, iid_list, SHOP_TYPE_ARMORY, NULL);
}

void StartVendorScreenOrphaned(struct Unit * unit, u16 const * iid_list)
{
    StartShopScreen(unit, iid_list, SHOP_TYPE_VENDOR, NULL);
}

void StartSecretShopScreenOrphaned(struct Unit * unit, u16 const * iid_list)
{
    StartShopScreen(unit, iid_list, SHOP_TYPE_SECRET_SHOP, NULL);
}

void StartArmoryScreen(struct Unit * unit, u16 const * iid_list)
{
    StartShopScreen(unit, iid_list, SHOP_TYPE_ARMORY, NULL);
}

void StartShopScreen(struct Unit * unit, u16 const * iid_list, u8 shopType, ProcPtr parent)
{
    struct ProcShop * proc;
    const u16 * items;
    int i;

    EndMapUi();

    if (parent)
        proc = SpawnProcLocking(ProcScr_Shop, parent);
    else
        proc = SpawnProc(ProcScr_Shop, PROC_TREE_3);

    proc->shopType = shopType;
    proc->unit = unit;

    if (iid_list != NULL)
        items = iid_list;
    else
        items = gDefaultShopItems;

    for (i = 0; i <= SHOP_ITEMS_MAX_AMT; i++)
        proc->shopItems[i] = CreateItem(*items++);

    UpdateShopItemCounts(proc);
}

void UpdateShopItemCounts(struct ProcShop * proc)
{
    int i;
    for (i = 0; proc->shopItems[i] != 0; i++);

    proc->shopItemCount = i;
    proc->unitItemCount = GetUnitItemCount(proc->unit);
}

void TalkChoice_OnBuy(void)
{
    struct ProcShop * proc = FindProc(ProcScr_Shop);
    if (proc->buy_or_sel == SHOP_ST_BUY)
        return;

    ShopInitTexts_OnBuy(proc);
}

void TalkChoice_OnSell(void)
{
    struct ProcShop * proc = FindProc(ProcScr_Shop);
    if (proc->buy_or_sel == SHOP_ST_SELL)
        return;

    ShopInitTexts_OnSell(proc);
}

void Shop_EntryDialogue(struct ProcShop * proc)
{
    StartShopDialogue(MSG_SHOP_00, proc);
}

void Shop_HandleEntryDialoguePrompt(struct ProcShop * proc)
{
    switch (GetTalkChoiceResult()) {
    case TALK_CHOICE_CANCEL:
    default:
        Proc_Goto(proc, PL_SHOP_EXIT);
        return;

    case TALK_CHOICE_YES:
        Proc_Goto(proc, PL_SHOP_BUY);
        return;

    case TALK_CHOICE_NO:
        if (GetUnitItemCount(proc->unit) == 0)
        {
            StartShopDialogue(MSG_SHOP_12, proc);
            Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
        }
        else
        {
            Proc_Goto(proc, PL_SHOP_SELL);
        }
    }
}

void Shop_BuyDialogue(struct ProcShop * proc)
{
    StartShopDialogue(MSG_SHOP_09, proc);
}

void ShopDrawBuyItemLine(struct ProcShop * _proc, int list_idx)
{
    struct ProcShop * proc = _proc;
    int index, item;

    index = DivRem(list_idx, 6);

    SetTextFont(NULL);
    InitSystemTextFont();

    EnableBgSync(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[list_idx];
    if (item == 0)
        return;

    DrawShopItemPriceLine(
        &gShopItemTexts[index],
        item,
        proc->unit,
        gBg2Tm + TM_OFFSET(7, (list_idx * 2 & 0x1F))
    );
}

void ShopDrawSellItemLine(struct ProcShop * _proc, int list_idx)
{
    struct ProcShop * proc = _proc;
    int index, item;

    index = DivRem(list_idx, 6);

    SetTextFont(NULL);
    InitSystemTextFont();

    EnableBgSync(BG2_SYNC_BIT);

    ClearText(&gShopItemTexts[index]);

    item = proc->shopItems[list_idx];
    if (item == 0)
        return;

    DrawShopItemLine(
        &gShopItemTexts[index],
        item,
        proc->unit,
        gBg2Tm + TM_OFFSET(7, (list_idx * 2 & 0x1F))
    );
}

void Shop_InitBuyState(struct ProcShop * proc)
{
    RegisterShopState(
        proc->head_idx,
        proc->shopItemCount,
        5,
        proc->hand_idx,
        72,
        ShopDrawBuyItemLine,
        proc);
}

#if NONMATCHING
void Shop_Loop_BuyKeyHandler(struct ProcShop * proc)
{
    u8 head_loc;
    u32 cursor_at_head;
    int price;
    int a;
    int b;

    cursor_at_head = FALSE;

    Shop_TryMoveHandPage();

    SetBgOffset(2, 0, ShopSt_GetBg2Offset());

    if (proc->head_loc != ShopSt_GetHeadLoc())
        cursor_at_head = TRUE;

    proc->head_loc = ShopSt_GetHeadLoc();
    proc->hand_loc = ShopSt_GetHandLoc();

    proc->head_idx = proc->head_loc;
    proc->hand_idx = proc->hand_loc;

    PutUiHand(0x38, - (proc->hand_loc * 0x10 - 72) + proc->head_loc * 0x10);

    if ((proc->helpTextActive != 0) && (cursor_at_head != 0))
    {
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
    }

    DisplayShopUiArrows();

    if (IsShopPageScrolling() != 0)
        return;

    if (proc->helpTextActive != 0)
    {
        if (gKeySt->pressed & (KEY_BUTTON_B | KEY_BUTTON_R))
        {
            proc->helpTextActive = 0;
            CloseHelpBox();
        }
        return;
    }

    if (gKeySt->pressed & KEY_BUTTON_R)
    {
        proc->helpTextActive = 1;
        a = (proc->head_loc * 16);
        b = ((proc->hand_loc * 16) - 72);
        StartItemHelpBox(56, a - b, proc->shopItems[proc->head_loc]);
        return;
    }

    price = GetItemPrice(proc->unit, proc->shopItems[proc->head_loc]);

    if (gKeySt->pressed & KEY_BUTTON_A)
    {
        if (price > GetGold())
        {
            StartShopDialogue(0x2DB, proc);
            Proc_Goto(proc, 1);
        }
        else
        {
            SetTalkNumber(price);
            StartShopDialogue(0x2DE, proc);
            Proc_Break(proc);
        }
        return;
    }

    if (gKeySt->pressed & KEY_BUTTON_B)
    {
        PlaySe(0x6B);
        Proc_Goto(proc, PL_SHOP_SELL_NOITEM);
        return;
    }
}
#endif
