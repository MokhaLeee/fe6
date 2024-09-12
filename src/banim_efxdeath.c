#include "prelude.h"
#include "banim.h"
#include "banim_ekrbattle.h"
#include "banim_ekrdragon.h"
#include "proc.h"
#include "eventinfo.h"
#include "hardware.h"
#include "constants/pids.h"

struct ProcScr CONST_DATA ProcScr_EfxDeadEvent[] =
{
    PROC_NAME_DEBUG("efxDeadEVTENT"),
    PROC_REPEAT(EfxDeathEvent_Init),
    PROC_REPEAT(EfxDeathEvent_RemoveUI),
    PROC_REPEAT(EfxDeathEvent_CallEvent),
    PROC_REPEAT(EfxDeathEvent_WaitEvent),
    PROC_REPEAT(EfxDeathEvent_End),
    PROC_END,
};

void NewEfxDeadEvent(struct BaSprite * anim_f, struct BaSprite * anim_b)
{
    struct ProcEfxDead * proc;
    proc = SpawnProc(ProcScr_EfxDeadEvent, PROC_TREE_3);
    proc->anim1 = anim_f;
    proc->anim2 = anim_b;

    gEkrDeadEventExist = TRUE;

    if (GetEkrDragonStateTypeIdunn() != 0)
    {
        struct ProcEkrDragonDeamon * subproc;
        subproc = NewEkrIdunnIntroDeamon1(proc->anim1);
        proc->subproc = subproc;
        subproc->x = gEkrXPosBase[POS_L] - (gEkrBgPosition - 0x4E);
        subproc->y = 0xB2;
    }
}

void EfxDeathEvent_Init(struct ProcEfxDead * proc)
{
    struct Anim * another = GetAnimAnotherSide(proc->anim1);
    int ret = false;

    if (gEfxBgSemaphore == 0 && gEfxSpellAnimExists == 0)
    {
        if (gBanimDoneFlag[GetAnimPosition(another)] == true)
            ret = true;
    }

    if (ret != true)
        return;

    proc->timer = 7;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE && GetAnimPosition(proc->anim1) != gEkrInitPosReal)
    {
        NewEfxFarAttackWithDistance(another, -1);
        proc->timer = 0;
    }

    Proc_Break(proc);
}

void EfxDeathEvent_RemoveUI(struct ProcEfxDead * proc)
{
    if (++proc->timer == 8)
    {
        NewEkrWindowAppear(1, 7);
        NewEkrNamewinAppear(1, 7, 0);
        Proc_Break(proc);
    }
}

void EfxDeathEvent_CallEvent(struct ProcEfxDead * proc)
{
    if (CheckEkrWindowAppearUnexist() == true)
    {
        EnableEkrGauge();
        AsyncEkrDispUP();

        CpuFastFill(0, gBg0Tm, 0x800);
        SetBgOffset(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        SetBgOffset(BG_1, 0, 0);
        EnableBgSync(BG0_SYNC_BIT);

        EkrGauge_080438D8();

        if (gEkrPids[GetAnimPosition(proc->anim1)] == PID_IDUNN_DRAGON)
            func_fe6_0805AFD4();

        StartBattleDefeatTalk(gEkrPids[GetAnimPosition(proc->anim1)]);
        Proc_Break(proc);
    }
}

void EfxDeathEvent_WaitEvent(struct ProcEfxDead * proc)
{
    if (IsEventRunning() == false)
    {
        PlayDeathSoundForArena();
        NewEfxDead(proc->anim1, proc->anim2);
        EfxPrepareScreenFx();
        gBanimValid[GetAnimPosition(proc->anim1)] = false;
        EnableBgSync(BG0_SYNC_BIT);
        NewEkrWindowAppear(0, 7);
        NewEkrNamewinAppear(0, 7, 0);

        DisableEkrGauge();
        UnAsyncEkrDispUP();
        EkrGauge_080438C8();
        Proc_Break(proc);
    }
}

void EfxDeathEvent_End(struct ProcEfxDead * proc)
{
    struct ProcEkrDragonDeamon * subproc = proc->subproc;

    if (CheckEkrWindowAppearUnexist() == true)
    {
        gEkrDeadEventExist = false;

        if (GetEkrDragonStateTypeIdunn() != 0)
            subproc->fxtype = 1;

        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxDead[] =
{
    PROC_NAME_DEBUG("efxDead"),
    PROC_REPEAT(EfxDead_StartPika),
    PROC_REPEAT(EfxDead_StartAlpha),
    PROC_END,
};

void NewEfxDead(struct Anim * anim1, struct Anim * anim2)
{
    struct ProcEfxDead * proc;
    gEkrHpBarCount++;
    gEkrDeadExist = 1;

    proc = SpawnProc(ProcScr_EfxDead, PROC_TREE_3);
    proc->anim1 = anim1;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 0;
    DisableEfxStatusUnits(anim1);
}

void EfxDead_StartPika(struct ProcEfxDead *proc)
{
    u32 conf = GetEkrDragonStateTypeGeneric();
    struct Anim * anim1 = proc->anim1;
    struct Anim * anim2 = proc->anim2;

    if (GetAnimPosition(anim1) == POS_L)
        conf &= (EDRAGON_TYPE_IDUNN_L | EDRAGON_TYPE_FAE_L | EDRAGON_TYPE_MANAKETE_L);
    else
        conf &= (EDRAGON_TYPE_IDUNN_R | EDRAGON_TYPE_FAE_R | EDRAGON_TYPE_MANAKETE_R);

    if (gEfxBgSemaphore == false && gEfxSpellAnimExists == false)
    {
        if ((EDRAGON_TYPE_MANAKETE_L | EDRAGON_TYPE_MANAKETE_R) & conf)
        {
            anim1->flags |= BAS_BIT_HIDDEN;
            anim2->flags |= BAS_BIT_HIDDEN;
            PutManaketeTotalImg(GetEkrDragonProc(proc->anim1));
            *CheckEkrDragonFasten(proc->anim1) = true;
        }
        else if ((EDRAGON_TYPE_IDUNN_L | EDRAGON_TYPE_IDUNN_R) & conf)
        {
             *CheckEkrDragonFasten(proc->anim1) = true;
        }
        else if ((EDRAGON_TYPE_FAE_L | EDRAGON_TYPE_FAE_R) & conf)
        {
            NewEfxDeadPika(proc->anim1, proc->anim2);
            *CheckEkrDragonFasten(proc->anim1) = true;
        }
        else
        {
            NewEfxDeadPika(proc->anim1, proc->anim2);
        }

        proc->terminator = 0x32;
        Proc_Break(proc);
    }
}
