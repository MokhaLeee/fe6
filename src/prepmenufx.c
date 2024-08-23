#include "prelude.h"
#include "prepscreen.h"
#include "mu.h"
#include "bm.h"
#include "proc.h"
#include "hardware.h"
#include "util.h"
#include "bmio.h"

struct ProcScr CONST_DATA ProcScr_AtMenu[] =
{
    PROC_19,
    PROC_CALL(LockGame),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WhileFadeExists),
    PROC_CALL(LockBmDisplay),
    PROC_CALL(PrepMenu_EndIfNoUnit),
    PROC_SLEEP(0),
    PROC_CALL(PrepMenu_Init),
    PROC_CALL(StartPrepMenuFadeIn),
    PROC_SLEEP(0),
PROC_LABEL(1),
    PROC_REPEAT(PrepMenu_Loop),
    PROC_GOTO(5),
PROC_LABEL(7),
    PROC_REPEAT(PrepUnit_HandleScrollUp),
PROC_LABEL(8),
    PROC_REPEAT(PrepUnit_HandleScrollDown),
PROC_LABEL(3),
    PROC_REPEAT(AtMenu_StartSubmenu),
PROC_LABEL(4),
    PROC_REPEAT(AtMenu_OnSubmenuEnd),
    PROC_GOTO(1),
PROC_LABEL(15),
    PROC_SLEEP(1),
    PROC_CALL(func_fe6_0807B69C),
    PROC_GOTO(1),
PROC_LABEL(9),
    PROC_CALL(PrepScreen_ReloadLeftUnitInfoFromStatscreen),
    PROC_REPEAT(func_fe6_0807B4C0),
    PROC_GOTO(1),
PROC_LABEL(10),
    PROC_CALL(PrepScreen_ReloadLeftUnitInfoFromStatscreen),
    PROC_REPEAT(func_fe6_0807B5A0),
    PROC_GOTO(1),
PROC_LABEL(13),
    PROC_CALL(func_fe6_0807B89C),
    PROC_SLEEP(0),
    PROC_GOTO(3),
PROC_LABEL(12),
    PROC_CALL(StartPrepMenuFadeIn),
    PROC_SLEEP(0),
    PROC_GOTO(1),
PROC_LABEL(14),
    PROC_CALL(func_fe6_0807B0DC),
    PROC_GOTO(6),
PROC_LABEL(L_PREPMENU_5),
    PROC_CALL(func_fe6_0807B0DC),
    PROC_SLEEP(60),
PROC_LABEL(L_PREPMENU_6),
    PROC_CALL(func_fe6_0807B89C),
    PROC_SLEEP(1),
PROC_LABEL(11),
    PROC_CALL(func_fe6_0807B0E4),
    PROC_SLEEP(0),
    PROC_CALL(EndAllMus),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(UnlockGame),
    PROC_END,
};

void StartPrepAtMenu(void)
{
    SpawnProc(ProcScr_AtMenu, PROC_TREE_3);
}

void StartSioPrepMenu(void)
{
    SpawnProc(ProcScr_AtMenu, PROC_TREE_3);
    SioResetUnitItems();
    ResetSioPidPool();
}

void PrepMenuFadeIn_Init(struct ProcPrepMenuFadeIn * proc)
{
    int i;

    proc->timer = 0;
    for (i = 0; i < 0x200; i++)
        gPalPrepMenuFadeIn[i] = gPal[i];
}
