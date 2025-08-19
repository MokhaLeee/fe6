#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "banim.h"
#include "banim_ekrdragon.h"

struct ProcScr CONST_DATA ProcScr_EfxFarAttack[] =
{
    PROC_NAME_DEBUG("efxFarAttack"),
    PROC_REPEAT(func_fe6_08045DA4),
    PROC_REPEAT(func_fe6_08045DDC),
    PROC_REPEAT(func_fe6_08045E50),
    PROC_END,
};

void NewEfxFarAttackWithDistance(struct Anim * anim, i16 arg)
{
    struct ProcEfxFarAttack * proc;
    u32 val;

    switch (gEkrDistanceType)
    {
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            proc = SpawnProc(ProcScr_EfxFarAttack, PROC_TREE_3);
            proc->pos = GetAnimPosition(anim);
            proc->timer = 0;

            if (arg != -1)
            {
                proc->unk_2e = arg >> 1;
                proc->terminator = arg - (arg >> 1);
            }
            else
            {
                if (gEkrDistanceType == EKR_DISTANCE_FAR)
                {
                    proc->unk_2e = 5;
                    proc->terminator = 5;
                }
                else
                {
                    proc->unk_2e = 7;
                    proc->terminator = 7;
                }
            }

            if (gEkrDistanceType == EKR_DISTANCE_FAR)
            {
                val = 0x20;
            }
            else
            {
                val = 0xf0;
            }

            if (proc->pos == POS_L)
            {
                proc->unk_32 = -val;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = 0;
            }
            else
            {
                proc->unk_32 = 0;
                proc->unk_34 = (-val >> 1);
                proc->unk_36 = (-val >> 1);
                proc->unk_38 = -val;
            }

            gEkrBgPosition = proc->unk_32;
            gEfxFarAttackExist = 1;

            break;

        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_MONOCOMBAT:
        case EKR_DISTANCE_PROMOTION:
            break;
    }
}

void func_fe6_08045D6C(struct ProcEfxFarAttack * unused, int x)
{
    struct Anim * anim = gAnims[0];
    x = -x;

    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[1];
    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[2];
    anim->xPosition = x + gEkrXPosReal[1];

    anim = gAnims[3];
    anim->xPosition = x + gEkrXPosReal[1];
}

void func_fe6_08045DA4(struct ProcEfxFarAttack * proc)
{
    func_fe6_08045D6C(proc, proc->unk_32);

    if (GetEkrDragonStateType() != 0)
        EkrDragonTmCpyExt(proc->unk_32);

    BanimSetBg2Position(proc->unk_32);
    proc->timer = 0;
    Proc_Break(proc);
}

void func_fe6_08045DDC(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_SQUARE, proc->unk_32, proc->unk_34, proc->timer, proc->unk_2e);
    gEkrBgPosition = ret;

    func_fe6_08045D6C(proc, ret);

    if (GetEkrDragonStateType() != 0)
        EkrDragonTmCpyExt(gEkrBgPosition);

    BanimSetBg2Position(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
        func_fe6_0804C50C(gEkrBgPosition);

    proc->timer++;

    if (proc->timer > proc->unk_2e)
    {
        proc->timer = 1;
        Proc_Break(proc);
    }
}

void func_fe6_08045E50(struct ProcEfxFarAttack * proc)
{
    u32 ret = Interpolate(INTERPOLATE_RSQUARE, proc->unk_36, proc->unk_38, proc->timer, proc->terminator);
    gEkrBgPosition = ret;

    func_fe6_08045D6C(proc, ret);

    if (GetEkrDragonStateType() != 0)
        EkrDragonTmCpyExt(gEkrBgPosition);

    BanimSetBg2Position(gEkrBgPosition);

    if (GetBattleAnimArenaFlag() != 0)
        func_fe6_0804C50C(gEkrBgPosition);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        if (proc->pos == POS_L)
            gEkrInitPosReal = POS_R;
        else
            gEkrInitPosReal = POS_L;

        gEfxFarAttackExist = false;

        Proc_Break(proc);
    }
}

void BanimSetBg2Position(int xPos)
{
    u16 * p;
    int a;
    int x;

    if ((GetEkrDragonStateTypeIdunn() != 0) || (GetBattleAnimArenaFlag() != 0))
        return;

    a = (xPos >> 3);
    x = xPos & 7;
    SetBgOffset(BG_2, x, 0);

    p = gTmA_Banim + 33 + a;
    EfxTmCpyExt(p + 132, 66, gBg2Tm, 32, 32, 20, -1, -1);

    EnableBgSync(BG2_SYNC_BIT);
}
