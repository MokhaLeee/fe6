#include "prelude.h"
#include "proc.h"
#include "face.h"
#include "unit.h"
#include "battle.h"
#include "text.h"
#include "msg.h"
#include "hardware.h"
#include "constants/videoalloc_banim.h"
#include "constants/videoalloc_global.h"

#include "banim.h"

struct FaceVramEnt CONST_DATA FaceConfig_EkrLevelup[] = {
    [0] = { 0, 0xF },
    [1] = {0},
    [2] = {0},
    [3] = {0},
};

struct ProcScr CONST_DATA ProcScr_EkrLevelup[] = {
    PROC_NAME_DEBUG("ekrLevelup"),
    PROC_REPEAT(EkrLvup_Init),
    PROC_SLEEP(1),

    PROC_REPEAT(EkrLvup_InitLevelUpBox),
    PROC_REPEAT(func_fe6_0805DA08),
    PROC_REPEAT(func_fe6_0805DA38),
    PROC_REPEAT(func_fe6_0805DA7C),
    PROC_REPEAT(func_fe6_0805DBA4),
    PROC_SLEEP(20),
    PROC_REPEAT(func_fe6_0805DBD4),
    PROC_REPEAT(func_fe6_0805DC2C),
    PROC_REPEAT(func_fe6_0805DCB4),
    PROC_REPEAT(func_fe6_0805DD08),
    PROC_REPEAT(func_fe6_0805DD78),
    PROC_REPEAT(func_fe6_0805DDA8),
    PROC_REPEAT(func_fe6_0805DE8C),
    PROC_REPEAT(func_fe6_0805DEBC),
    PROC_REPEAT(func_fe6_0805DEC8),
    PROC_REPEAT(func_fe6_0805DF90),
    PROC_REPEAT(func_fe6_0805E104),
    PROC_END,
};

bool CheckEkrLvupDone(void)
{
    if (gpProcEkrLevelup->finished == true)
        return true;
    else
        return false;
}

void EndEkrLevelUp(void)
{
    Proc_End(gpProcEkrLevelup);
}

void EkrLvup_InitStatusText(struct ProcEkrlvup *proc)
{
    int i;
    struct BattleUnit *bunit, *bunit2;
    struct Unit *unit;
    struct Text *th;
    const char *str;

    if (proc->anim_this == NULL) {
        struct BattleUnit ** test;
        bunit2 = gpEkrBattleUnitLeft;
        gpEkrLvupUnit = unit = &bunit2->unit;
        test = &gpEkrBattleUnitRight;
        gpEkrLvupBattleUnit = (bunit = *test);
    } else {
        struct BattleUnit ** test;
        bunit2 = gpEkrBattleUnitRight;
        gpEkrLvupUnit = unit = &bunit2->unit;
        test = &gpEkrBattleUnitLeft;
        gpEkrLvupBattleUnit = (bunit = *test);
    }

    if (proc->is_promotion == false) {
        unit = GetUnit(unit->id);

        gEkrLvupPreLevel = bunit2->previous_level;
        gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->max_hp;
        gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
        gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
        gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
        gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
        gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->jinfo->base_con + unit->pinfo->bonus_con;
        gEkrLvupPostLevel = bunit2->previous_level + 1;

        gEkrLvupPostStatus[EKRLVUP_STAT_HP] = unit->max_hp + bunit2->change_hp;
        gEkrLvupPostStatus[EKRLVUP_STAT_POW] = unit->pow + bunit2->change_pow;
        gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = unit->skl + bunit2->change_skl;
        gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = unit->lck + bunit2->change_lck;
        gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = unit->spd + bunit2->change_spd;
        gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = unit->def + bunit2->change_def;
        gEkrLvupPostStatus[EKRLVUP_STAT_RES] = unit->res + bunit2->change_res;
        gEkrLvupPostStatus[EKRLVUP_STAT_CON] = unit->jinfo->base_con + unit->pinfo->bonus_con + bunit2->change_con;
    } else {
        gEkrLvupPreLevel = unit->level;
        gEkrLvupBaseStatus[EKRLVUP_STAT_HP] = unit->max_hp;
        gEkrLvupBaseStatus[EKRLVUP_STAT_POW] = unit->pow;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SKL] = unit->skl;
        gEkrLvupBaseStatus[EKRLVUP_STAT_LCK] = unit->lck;
        gEkrLvupBaseStatus[EKRLVUP_STAT_SPD] = unit->spd;
        gEkrLvupBaseStatus[EKRLVUP_STAT_DEF] = unit->def;
        gEkrLvupBaseStatus[EKRLVUP_STAT_RES] = unit->res;
        gEkrLvupBaseStatus[EKRLVUP_STAT_CON] = unit->jinfo->base_con + unit->pinfo->bonus_con;
        gEkrLvupPostLevel = 1;

        gEkrLvupPostStatus[EKRLVUP_STAT_HP] = bunit->unit.max_hp;
        gEkrLvupPostStatus[EKRLVUP_STAT_POW] = bunit->unit.pow;
        gEkrLvupPostStatus[EKRLVUP_STAT_SKL] = bunit->unit.skl;
        gEkrLvupPostStatus[EKRLVUP_STAT_LCK] = bunit->unit.lck;
        gEkrLvupPostStatus[EKRLVUP_STAT_SPD] = bunit->unit.spd;
        gEkrLvupPostStatus[EKRLVUP_STAT_DEF] = bunit->unit.def;
        gEkrLvupPostStatus[EKRLVUP_STAT_RES] = bunit->unit.res;
        gEkrLvupPostStatus[EKRLVUP_STAT_CON] = bunit->unit.jinfo->base_con + bunit->unit.pinfo->bonus_con;
    }

    InitTextFont(&gBanimFont, (u8 *)BG_VRAM + VRAMOFF_BG_EKRLVUP_FONT, VRAMOFF_BG_EKRLVUP_FONT / 0x20, 0);

    for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
        int text_x;

        if (!UnitKnowsMagic(unit))
            str = EkrLvupMsgsStr[i];
        else
            str = EkrLvupMsgsMag[i];

        InitText(&gBanimText[i], 3);
        text_x = GetStringTextLen(str);
        text_x = (0x10 - text_x) >> 1;
        if (text_x < 0)
            text_x = 0;

        Text_SetCursor(&gBanimText[i], text_x);
        Text_SetColor(&gBanimText[i], TEXT_COLOR_SYSTEM_GOLD);
        Text_DrawString(&gBanimText[i], str);
        PutText(&gBanimText[i], gBg2Tm + sEfxLvupPartsPos[i]);
    }

    for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
        InitText(&gBanimText[EKRLVUP_STAT_MAX + i], 2);
        Text_SetCursor(&gBanimText[EKRLVUP_STAT_MAX + i], 8);
        Text_SetColor(&gBanimText[EKRLVUP_STAT_MAX + i], TEXT_COLOR_SYSTEM_BLUE);
        Text_DrawNumber(&gBanimText[EKRLVUP_STAT_MAX + i], gEkrLvupBaseStatus[i]);
        PutText(&gBanimText[EKRLVUP_STAT_MAX + i], gBg2Tm + 3 + sEfxLvupPartsPos[i]);
    }

    /* class */
    th = &gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_CLASS];
    InitText(th, 8);
    Text_DrawString(th,
        DecodeMsg(gpEkrLvupUnit->jinfo->msg_name));
    PutText(th, gBg2Tm + TM_OFFSET(2, 7));

    /* level msg */
    th = &gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LV_MSG];
    InitText(th, 3);
    Text_SetColor(th, TEXT_COLOR_SYSTEM_GOLD);
    Text_DrawString(th, gMsg_Lv);
    PutText(th, gBg2Tm + TM_OFFSET(10, 7));

    /* level value */
    th = &gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LV_VAL];
    InitText(th, 2);
    Text_SetCursor(th, 8);
    Text_SetColor(th, TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumber(th, gEkrLvupPreLevel);
    PutText(th, gBg2Tm + TM_OFFSET(13, 7));
}
