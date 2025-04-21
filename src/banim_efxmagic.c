#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "banim.h"
#include "banim_ekrdragon.h"
#include "constants/songs.h"

void StartSpellAnimation(struct Anim * anim)
{
    i16 index = gEkrSpellAnimIndex[GetAnimPosition(anim)];
    SpellAnimFunc func = gEkrSpellAnimLut[index];

#if BUGFIX
    if (func != NULL)
#else
    if (1)
#endif
    {
        gEfxMagicChk_N = false;
        func(anim);
    }
}

void func_fe6_0804C8D0(void)
{
    return;
}

struct ProcScr CONST_DATA ProcScr_EfxRestRST[] =
{
    PROC_NAME_DEBUG("efxRestRST"),
    PROC_ONEND(EfxRestRST_End),
    PROC_REPEAT(EfxRestRST_Loop),
    PROC_END,
};

ProcPtr NewEfxRestRST(struct Anim * anim, int unk44, int unk48, int frame, int speed)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxRestRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0,
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk48 = unk48;
    proc->frame = frame;
    proc->speed = speed;

    return proc;
}

void EfxRestRST_End(struct ProcEfx * proc)
{
    gEfxBgSemaphore--;
}

void EfxRestRST_Loop(struct ProcEfx * proc)
{
    u8 val1;
    int val2;
    u32 i;
    u16 *buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList2;
    else
        buf = gpBg1ScrollOffsetList1;

    val1 = proc->step;
    proc->step += proc->speed;

    for (i = 0; i < 0x78; buf++, i++) {
        val1 += proc->unk48;
        *buf = (((gUnk_08605A94[val1] * proc->frame) << 8) >> 0x10) + gDispIo.bg_off[BG_1].x;
    }

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxDummyRST[] =
{
    PROC_NAME_DEBUG("efxDummyRST"),
    PROC_ONEND(EfxDummyRST_End),
    PROC_REPEAT(EfxDummyRST_Loop),
    PROC_END,
};

void NewDummvRST(struct Anim * anim, int unk44)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxDummyRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
}

void EfxDummyRST_End(struct ProcEfx * proc)
{
    gEfxBgSemaphore--;
}

void EfxDummyRST_Loop(struct ProcEfx * proc)
{
    u32 i;
    u16 * buf;

    if (gEkrBg1ScrollFlip == 0)
        buf = gpBg1ScrollOffsetList2;
    else
        buf = gpBg1ScrollOffsetList1;

    for (i = 0; i < 0x78; i++)
        buf[i] = gDispIo.bg_off[1].x;

    if (++proc->timer == proc->unk44)
        Proc_End(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxRestWIN[] =
{
    PROC_NAME_DEBUG("efxRestWIN"),
    PROC_REPEAT(EfxRestWIN_Loop),
    PROC_END
};

void NewEfxRestWIN(struct Anim * anim, int unk44, void * unk54, void * unk58)
{
    struct ProcEfx * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxRestWIN, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk54 = unk54;
    proc->unk58 = unk58;

    if (GetAnimPosition(GetAnimAnotherSide(anim)) == POS_L)
        proc->unk32 = 0xFFB8;
    else
        proc->unk32 = 0xFFF8;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == POS_L)
            proc->unk32 += 0x18;
        else
            proc->unk32 -= 0x18;
    }
}

void EfxRestWIN_Loop(struct ProcEfx * proc)
{
    u32 i;
    u16 val2;
    u16 * buf;
    i16 * buf2, * base;

    if (gEkrBg2ScrollFlip == 0)
        buf = gpBg2ScrollOffsetTable2;
    else
        buf = gpBg2ScrollOffsetTable1;

    base = proc->unk54;
    val2 = base[proc->step];
    buf2 = proc->unk58[val2];

    if (val2 != 0xFFFF)
    {
        proc->step++;
        for (i = 0; i < 0x78; buf2 = buf2 + 2, buf++, i++)
        {
            if (buf2[0] == 0x7FFF)
                buf[0] = 0;
            else
            {
                i16 tmp3 = buf2[0] + proc->unk32;
                i16 tmp4 = buf2[1] + proc->unk32;
                buf[0] = (tmp3 * 0x100) | tmp4;
            }
        }
    }
    else
    {
        for (i = 0; i < 0x78; i++)
            *buf++ = 0;
    }

    proc->timer++;
    if (proc->timer == proc->unk44)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxRestWINH[] =
{
    PROC_NAME_DEBUG("efxRestWINH"),
    PROC_REPEAT(EfxRestWINH_Dummy),
    PROC_REPEAT(EfxRestWINH_Loop),
    PROC_END,
};

void NewEfxRestWINH(struct Anim * anim, int a, i16 b, void (* hblank)(void))
{
    u32 i;
    u16 * buf;
    struct ProcEfx * proc;

    gEfxBgSemaphore++;

    buf = gpBg2ScrollOffsetTable1;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    buf = gpBg2ScrollOffsetTable2;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    buf = gpBg1ScrollOffsetList1;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    buf = gpBg1ScrollOffsetList2;
    for (i = 0; i < 0xA0; buf++, i++)
        *buf = b;

    gEkrBg2ScrollFlip = 0;
    gEkrBg1ScrollFlip = 0;

    gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
    gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
    gpBg2ScrollOffset = gpBg2ScrollOffsetTable1;
    gpBg1ScrollOffset = gpBg1ScrollOffsetList1;

    SetOnHBlankA(hblank);
    gEfxMagicChk_N = true;
    proc = SpawnProc(ProcScr_EfxRestWINH, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = a;
}

void NewEfxRestWINH_(struct Anim * anim, int a, void (* hblank)(void))
{
    NewEfxRestWINH(anim, a, 0, hblank);
}

void EfxRestWINH_Dummy(struct ProcEfx * proc)
{
    Proc_Break(proc);
}

void EfxRestWINH_Loop(struct ProcEfx * proc)
{
    if (gBmSt.main_loop_ended != false)
    {
        if (gEkrBg2ScrollFlip == 1)
        {
            gEkrBg2ScrollFlip = 0;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
        }
        else
        {
            gEkrBg2ScrollFlip = 1;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
        }

        if (gEkrBg1ScrollFlip == 1)
        {
            gEkrBg1ScrollFlip = 0;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
        }
        else
        {
            gEkrBg1ScrollFlip = 1;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
        }

        gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
        gpBg1ScrollOffset = gpBg1ScrollOffsetStart;
    }

    if (++proc->timer == proc->unk44)
    {
        gEfxBgSemaphore--;
        SetOnHBlankA(NULL);
        gEfxMagicChk_N = false;
        Proc_Break(proc);
    }
}

void EfxRestWINH_DefaultHblank(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
    {
        REG_WIN0H   = *gpBg2ScrollOffset++; // ?
        REG_BG1HOFS = *gpBg1ScrollOffset++;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxALPHA[] =
{
    PROC_NAME_DEBUG("efxALPHA"),
    PROC_REPEAT(EfxALPHA_Loop),
    PROC_END,
};

void NewEfxALPHA(struct Anim * anim, int delay, int duration2, int lo, int hi, int type)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxALPHA, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->delay = delay;
    proc->duration_total = delay + duration2;
    proc->lo = lo;
    proc->hi = hi;
    proc->type = type;
}

void EfxALPHA_Loop(struct ProcEfxALPHA * proc)
{
    int bldA, bldB;

    proc->timer++;
    if (proc->timer < proc->delay)
        return;

    bldA = Interpolate(
        INTERPOLATE_LINEAR,
        proc->lo,
        proc->hi,
        proc->timer - proc->delay,
        proc->duration_total - proc->delay);

    switch (proc->type) {
    case 0:
        SetBlendAlpha(bldA, 16);
        break;

    case 1:
        SetBlendBrighten(bldA);
        break;

    case 2:
        bldB = Interpolate(
            INTERPOLATE_LINEAR,
            8, 16,
            proc->timer - proc->delay,
            proc->duration_total - proc->delay);

        SetBlendAlpha(bldA, bldB);
        break;
    }

    if (proc->timer >= proc->duration_total)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxCircleWIN[] =
{
    PROC_NAME_DEBUG("efxCircleWIN"),
    PROC_REPEAT(EfxCircleWIN_Loop),
    PROC_END,
};

void NewEfxCircleWIN(struct Anim * anim, int terminator, u16 * c, u16 d, u16 e)
{
    struct ProcEfxCircleWIN * proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxCircleWIN, PROC_TREE_3);

    proc->anim = anim;

    proc->timer = 0;
    proc->unk_2e = 0;

    proc->unk_44 = terminator;
    proc->unk_54 = c;

    GetAnimAnotherSide(anim);

    proc->unk_32 = d;
    proc->unk_3a = e;

    return;
}

void EfxCircleWIN_Loop(struct ProcEfxCircleWIN * proc)
{
    u16 * unk_54;
    struct Vec2i * vec;
    i16 a, b;
    i16 x, y;
    u16 var;
    u32 i;

    u16 * buf = (gEkrBg2ScrollFlip == 0)
              ? gpBg2ScrollOffsetTable2
              : gpBg2ScrollOffsetTable1;

    unk_54 = proc->unk_54;
    var = unk_54[proc->unk_2e];

    vec = func_fe6_08013F7C(var);

    if (unk_54[proc->unk_2e + 1] != 0xFFFF)
        proc->unk_2e++;

    a = proc->unk_3a - var;
    if (a < 0)
        a = 0;

    b = var + proc->unk_3a;
    if (b > DISPLAY_HEIGHT)
        b = DISPLAY_HEIGHT;

    for (i = 0; i < DISPLAY_HEIGHT; buf++, i++)
    {
        if ((a > i) || (b < i))
        {
            *buf = 0;
            continue;
        }

        x = vec->x + proc->unk_32;
        if (x < 0)
            x = 0;

        y = vec->y + proc->unk_32;
        if (y > DISPLAY_WIDTH)
            y = DISPLAY_WIDTH;

        *buf = y | (x << 8);
        vec++;
    }

    proc->timer++;

    if (proc->timer == proc->unk_44)
    {
        gEfxBgSemaphore--;
        SetBlendNone();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxMagicQUAKE[] =
{
    PROC_NAME_DEBUG("efxMagicQUAKE"),
    PROC_REPEAT(EfxMagicQUAKE_Loop),
    PROC_END,
};

void NewEfxMagicQUAKE(struct Anim * anim, int duration)
{
    struct ProcEfxMagicQuake * proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxMagicQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->qproc = NewEfxQuakePure(6, 0);
    proc->timer = 0;
    proc->duration = duration;
}

void EfxMagicQUAKE_Loop(struct ProcEfxMagicQuake * proc)
{
    i16 x1, y1, x2, y2;

    SetBgOffset(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    SetBgOffset(BG_0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    func_fe6_08044230(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    if (GetEkrDragonStateType() != 0)
    {
        SetBgOffset(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y + 0x10);
    }

    if (GetEkrDragonStateType() != 0)
    {
        x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }
    else
    {
        x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }

    x2 = ((gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition);
    y2 = (gEkrYPosReal[1] - gEkrBg2QuakeVec.y);

    SetEkrFrontAnimPostion(POS_L, x1, y1);
    SetEkrFrontAnimPostion(POS_R, x2, y2);

    proc->timer++;
    if (proc->timer > proc->duration)
    {
        gEfxBgSemaphore--;

        SetBgOffset(BG_2, 0, 0);
        SetBgOffset(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        func_fe6_08044230(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);

        if (GetEkrDragonStateType() != 0)
            SetBgOffset(BG_3, 0, 0x10);

        x1 = (gEkrXPosReal[0] - gEkrBgPosition);
        y1 = gEkrYPosReal[0];

        x2 = (gEkrXPosReal[1] - gEkrBgPosition);
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        Proc_End(proc->qproc);
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxDummyMagic[] =
{
    PROC_NAME_DEBUG("efxDummymagic"),
    PROC_REPEAT(EfxDummyMagic_Loop),
    PROC_END,
};

void NewEfxDummyMagic(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxDummyMagic, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxDummyMagic_Loop(struct ProcEfxMagic * proc)
{
    struct Anim * anim_other = GetAnimAnotherSide(proc->anim);
    int time = ++proc->timer;

    if (time == 1)
    {
        anim_other->flags3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        return;
    }

    if (time == 10)
    {
        if (GetAnimNextRoundType(anim_other) != ANIM_ROUND_INVALID)
            anim_other->flags3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

/* HandAxe */
struct ProcScr CONST_DATA ProcScr_EfxTeono[] =
{
    PROC_NAME_DEBUG("efxTeono"),
    PROC_REPEAT(EfxTeono_Loop),
    PROC_END,
};

void NewEfxTeono(struct Anim * anim)
{
    struct ProcEfxMagic * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeono, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxTeono_Loop(struct ProcEfxMagic * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxTeonoOBJ(proc->anim);

        if (proc->timer == 1)
        {
            animc->flags3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE)
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == 0x46)
    {
        return;
    }

    if (proc->timer == 0x50)
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxTeonoOBJ[] =
{
    PROC_NAME_DEBUG("efxTeonoOBJ"),
    PROC_REPEAT(EfxTeonoObj_Loop),
    PROC_REPEAT(EfxTeonoObj_End),
    PROC_END,
};

void NewEfxTeonoOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxTeonoOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_TeonoObjCloseLeft, AnimScr_TeonoObjCloseRight, AnimScr_TeonoObjFarLeft, AnimScr_TeonoObjFarRight);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x48;
    else
        anim2->xPosition -= 0x48;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        proc->terminator = 35;
    else
        proc->terminator = 10;

    proc->seproc = NewEfxTeonoSE(proc->anim, proc->anim2);

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_TeonoOBJ, 0x1000);
}

void EfxTeonoObj_Loop(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        BasRemove(proc->anim2);

        if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        {
            gEfxTeonoState = 1;
            Proc_End(proc->seproc);
            Proc_End(proc);
        }
        else
        {
            Proc_Break(proc);
        }
    }
}

void EfxTeonoObj_End(struct ProcEfxMagicOBJ * proc)
{
    gUnk_Banim_0201774C = 0;
    Proc_End(proc->seproc);
    NewEfxTeonoOBJ2(proc->anim);
    Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxTeonoOBJ2[] =
{
    PROC_NAME_DEBUG("efxTeonoOBJ2"),
    PROC_REPEAT(EfxTeonoOBJ2_Loop),
    PROC_END
};

void NewEfxTeonoOBJ2(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxTeonoOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right, AnimScr_TeonoObj2Left, AnimScr_TeonoObj2Right);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x48;
    else
        anim2->xPosition -= 0x48;

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_TeonoOBJ, 0x1000);
    proc->seproc = NewEfxTeonoSE(proc->anim, proc->anim2);
}

void EfxTeonoOBJ2_Loop(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 17)
    {
        gEfxBgSemaphore--;
        gEfxTeonoState = 1;
        Proc_End(proc->seproc);
        BasRemove(proc->anim2);
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxTeonoSE[] =
{
    PROC_NAME_DEBUG("efxTeonoSE"),
    PROC_ONEND(EfxTeonoSE_End),
    PROC_REPEAT(EfxTeonoSE_Loop),
    PROC_END,
};

ProcPtr NewEfxTeonoSE(struct Anim * anim, struct Anim * anim2)
{
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxTeonoSE, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 1;
    PlaySFX(SONG_CD, 0x100, anim->xPosition, 1);
    return proc;
}

void EfxTeonoSE_End(struct ProcEfxMagicOBJ * proc)
{
    gEfxBgSemaphore--;
}

void EfxTeonoSE_Loop(struct ProcEfxMagicOBJ * proc)
{
    int sound_pos;

    if (++proc->timer == 0x8)
    {
        sound_pos = (u16)proc->anim2->xPosition + GetProperAnimSoundLocation(proc->anim2);
        PlaySFX(SONG_CD, 0x100, (i16)sound_pos, 1);
        proc->timer = 0;
        if (proc->terminator <= 8)
            proc->terminator++;
    }
}

/* Arrow */
struct ProcScr CONST_DATA ProcScr_EfxArrow[] =
{
    PROC_NAME_DEBUG("efxArrowOBJ"),
    PROC_REPEAT(EfxArrow_Loop),
    PROC_END,
};

void NewEfxArrow(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxArrow, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxArrow_Loop(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);
    int frame = EfxGetCamMovDuration();

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxArrowOBJ(proc->anim);
        PlaySFX(SONG_CC, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1)
        {
            animc->flags3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE)
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == (frame + 9))
    {
#if !BUGFIX
        GetAnimAnotherSide(proc->anim);
#endif
        return;
    }

    if (proc->timer == (frame + 10))
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxArrowOBJ[] =
{
    PROC_NAME_DEBUG("efxArrowOBJ"),
    PROC_REPEAT(EfxArrowObj_Loop),
    PROC_END
};

void NewEfxArrowOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxArrowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_ArrowCloseLeft, AnimScr_ArrowCloseRight, AnimScr_ArrowFarLeft, AnimScr_ArrowFarRight);

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxArrowOBJ, 0x60);
}

void EfxArrowObj_Loop(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 4)
    {
        gEfxBgSemaphore--;
        BasRemove(proc->anim2);
        Proc_Break(proc);
    }
}

void StartSpellAnimJavelin(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 0);
    SpellFx_RegisterObjPal(Pal_SpellJavelin, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelin, 0x1000);
}

void StartSpellAnimJavelinCavalier(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinCavalier, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinCavalier, 0x1000);
}

void StartSpellAnimJavelinSoldier(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 0);
    SpellFx_RegisterObjPal(Pal_SpellJavelinSoldier, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinSoldier, 0x1000);
}

void StartSpellAnimJavelinPaladin(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinPaladin, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinPaladin, 0x1000);
}

void StartSpellAnimJavelinPrgasusKnight(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinPrgasusKnight, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinPrgasusKnight, 0x1000);
}

void StartSpellAnimJavelinFalcon(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinFalcon, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinFalcon, 0x1000);
}

void StartSpellAnimJavelinWyvernRider(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinWyvernRider, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinWyvernRider, 0x1000);
}

void StartSpellAnimJavelinWyvernLord(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinWyvernLord, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinWyvernLord, 0x1000);
}

void StartSpellAnimJavelinGenerial(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeyari, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    NewEfxTeyariOBJ(anim, 1);
    SpellFx_RegisterObjPal(Pal_SpellJavelinGenerial, 0x20);
    SpellFx_RegisterObjGfx(Img_SpellJavelinGenerial, 0x1000);
}

void EfxTeyari_Loop(struct ProcEfx * proc)
{
    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        PlaySFX(SONG_CA, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1)
        {
            struct Anim * animc = GetAnimAnotherSide(proc->anim);
            animc->flags3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE)
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == 0xE)
    {
#if !BUGFIX
        GetAnimAnotherSide(proc->anim);
#endif
        return;
    }

    if (proc->timer == 0x10)
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

void NewEfxTeyariOBJ(struct Anim * anim, int type)
{
    struct Anim * anim2;
    struct ProcEfxMagicOBJ * proc;
    u32 * scr1, * scr2;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxTeyariOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (type == 0)
    {
        scr2 = AnimScr_EfxTeyariObjType0Right;
        scr1 = AnimScr_EfxTeyariObjType0Left;
    }
    else
    {
        scr2 = AnimScr_EfxTeyariObjType1Right;
        scr1 = AnimScr_EfxTeyariObjType1Left;
    }

    anim2 = EfxCreateFrontAnim(anim, scr1, scr2, scr1, scr2);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition += 0x38;
    else
        anim2->xPosition -= 0x38;
}

void EfxTeyariObj_Loop(struct ProcEfxMagicOBJ * proc)
{
    if (++proc->timer == 0xC)
    {
        gEfxBgSemaphore--;
        BasRemove(proc->anim2);
        Proc_Break(proc);
    }
}
