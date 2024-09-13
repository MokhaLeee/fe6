#include "prelude.h"
#include "proc.h"
#include "bmio.h"
#include "mu.h"
#include "oam.h"
#include "util.h"
#include "hardware.h"
#include "banim_sprite.h"
#include "banim.h"
#include "banim_ekrbattle.h"
#include "banim_ekrdragon.h"

struct ProcScr CONST_DATA ProcScr_EkrBattleStarting[] =
{
    PROC_19,
    PROC_REPEAT(EkrBaStart_InitScreen),
    PROC_REPEAT(EkrBaStart_SreenFailIn),
    PROC_REPEAT(EkrBaStart_InitBattleScreen),
    PROC_REPEAT(EkrBaStart_ExecEkrBattle),
    PROC_REPEAT(EkrBaStart_BgFadeOut),
    PROC_REPEAT(EkrBaStart_MergeBG),
    PROC_REPEAT(func_fe6_08048154),
    PROC_END,
};

void NewEkrBattleStarting(void)
{
    SpawnProc(ProcScr_EkrBattleStarting, PROC_TREE_3);
}

void EkrBaStart_InitScreen(struct ProcEkrBattleStarting * proc)
{
    int val;

    proc->timer = 0;
    proc->terminator = 0xF;

    val = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
    proc->x2 = val;
    proc->x1 = val;

    val = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
    proc->y2 = val;
    proc->y1 = val;

    CpuFastFill(0, gBg2Tm, 0x800);
    EnableBgSync(BG2_SYNC_BIT);

    SetBlendConfig(3, 0, 0, 4);
    SetBlendTargetA(0, 0, 0, 1, 0);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 0);

    gDispIo.win_ct.win0_enable_blend = false;
    gDispIo.win_ct.wout_enable_blend = true;

    Proc_Break(proc);
}

void EkrBaStart_SreenFailIn(struct ProcEkrBattleStarting * proc)
{
    int left, top, right, bottom;
    
    if (proc->timer != proc->terminator)
        proc->timer++;

    left   = Interpolate(INTERPOLATE_LINEAR, 0,    proc->x1, proc->timer, proc->terminator);
    top    = Interpolate(INTERPOLATE_LINEAR, 0,    proc->y1, proc->timer, proc->terminator);
    right  = Interpolate(INTERPOLATE_LINEAR, 0xF0, proc->x2, proc->timer, proc->terminator);
    bottom = Interpolate(INTERPOLATE_LINEAR, 0xA0, proc->y2, proc->timer, proc->terminator);

    SetWin0Box(left, top, right, bottom);

    if (proc->timer == proc->terminator) {
        SetWOutLayers(1, 1, 1, 1, 1);
        InitOam(0);
        LockBmDisplay();
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EfxPalBlackInOut(gPal, BGPAL_EFXDRAGON_L, 0xA, 0x4);
        EnablePalSync();
        EndAllMus();
        Proc_Break(proc);
    }
}

void EkrBaStart_InitBattleScreen(struct ProcEkrBattleStarting * proc)
{
    if (gEkrDebugModeMaybe == 0)
    {
        NewEkrGauge();
        NewEkrDispUP();

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            break;

        case EKR_DISTANCE_MONOCOMBAT:
            if (gBanimValid[POS_L] == false)
            {
                func_fe6_080438E8();
                func_fe6_080441FC();
            }

            if (gBanimValid[POS_R] == false)
            {
                func_fe6_080438F8();
                func_fe6_0804420C();
            }
            break;

        case EKR_DISTANCE_PROMOTION:
            func_fe6_080438E8();
            func_fe6_080441FC();
            break;

        default:
            break;
        }
    }

    EfxClearScreenFx();
    NewEkrUnitKakudai(0);
    NewEkrBaseKaiten(0);
    NewEkrWindowAppear(0, 0xB);
    NewEkrNamewinAppear(0, 0xB, 0);
    NewEkrBaseAppear(0, 0xB);

    proc->timer = 0;
    Proc_Break(proc);
}

void EkrBaStart_ExecEkrBattle(struct ProcEkrBattleStarting * proc)
{
    if (++proc->timer > 0xB)
    {
        if (gBanimBG == 0 || GetEkrDragonStateType() != 0)
        {
            /* In normal battle, here will directly end the proc */
            NewEkrBattle();
            Proc_End(proc);
        }
        else
        {
            proc->timer = 0;
            NewEkrBattle();
            Proc_Break(proc);
        }
    }
}

void EkrBaStart_BgFadeOut(struct ProcEkrBattleStarting * proc)
{
    EfxChapterMapFadeOUT(Interpolate(0, 4, 0x10, proc->timer, 8));

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrBaStart_MergeBG(struct ProcEkrBattleStarting *proc)
{
    if (gEkrSnowWeather == 0)
        gUnk_Banim_0201E0F8 = 0x6;
    else
        gUnk_Banim_0201E0F8 = 0xA;

    PutBanimBG(gBanimBG - 1);
    EfxPalBlackInOut(gPal, BGPAL_EFXDRAGON_L, 0xA, 0x10);
    Proc_Break(proc);
}

void func_fe6_08048154(struct ProcEkrBattleStarting *proc)
{
    int val = Interpolate(0, 0x10, 0, proc->timer, 8);

    PutBanimBgPAL(gBanimBG - 1);
    EfxPalBlackInOut(gPal, BGPAL_EFXDRAGON_L, 0xA, val);
    EnablePalSync();

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
