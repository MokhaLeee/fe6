#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "oam.h"
#include "banim.h"
#include "banim_ekrdragon.h"
#include "constants/songs.h"

void StartSpellAnimation(struct Anim *anim)
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

ProcPtr NewEfxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed)
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

void EfxRestRST_End(struct ProcEfx *proc)
{
    gEfxBgSemaphore--;
}

void EfxRestRST_Loop(struct ProcEfx *proc)
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
        *buf = (((gUnk_08605A94[val1] *proc->frame) << 8) >> 0x10) + gDispIo.bg_off[BG_1].x;
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

void NewDummvRST(struct Anim *anim, int unk44)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxDummyRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
}

void EfxDummyRST_End(struct ProcEfx *proc)
{
    gEfxBgSemaphore--;
}

void EfxDummyRST_Loop(struct ProcEfx *proc)
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

void NewEfxRestWIN(struct Anim *anim, int unk44, void * unk54, void * unk58)
{
    struct ProcEfx *proc;

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

void EfxRestWIN_Loop(struct ProcEfx *proc)
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

    if (val2 != 0xFFFF) {
        proc->step++;
        for (i = 0; i < 0x78; buf2 = buf2 + 2, buf++, i++) {
            if (buf2[0] == 0x7FFF)
                buf[0] = 0;
            else {
                i16 tmp3 = buf2[0] + proc->unk32;
                i16 tmp4 = buf2[1] + proc->unk32;

                buf[0] = (tmp3 * 0x100) | tmp4;
            }
        }
    } else {
        for (i = 0; i < 0x78; i++)
            *buf++ = 0;
    }

    proc->timer++;
    if (proc->timer == proc->unk44) {
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

void NewEfxRestWINH(struct Anim *anim, int a, i16 b, void (* hblank)(void))
{
    u32 i;
    u16 * buf;
    struct ProcEfx *proc;

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

void NewEfxRestWINH_(struct Anim *anim, int a, void (* hblank)(void))
{
    NewEfxRestWINH(anim, a, 0, hblank);
}

void EfxRestWINH_Dummy(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void EfxRestWINH_Loop(struct ProcEfx *proc)
{
    if (gBmSt.main_loop_ended != false) {
        if (gEkrBg2ScrollFlip == 1) {
            gEkrBg2ScrollFlip = 0;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
        } else {
            gEkrBg2ScrollFlip = 1;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
        }

        if (gEkrBg1ScrollFlip == 1) {
            gEkrBg1ScrollFlip = 0;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
        } else {
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
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
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

void NewEfxALPHA(struct Anim *anim, int delay, int duration2, int lo, int hi, int type)
{
    struct ProcEfxALPHA *proc;

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

void EfxALPHA_Loop(struct ProcEfxALPHA *proc)
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

    if (proc->timer >= proc->duration_total) {
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

void NewEfxCircleWIN(struct Anim *anim, int terminator, u16 * c, u16 d, u16 e)
{
    struct ProcEfxCircleWIN *proc;

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

void EfxCircleWIN_Loop(struct ProcEfxCircleWIN *proc)
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

    for (i = 0; i < DISPLAY_HEIGHT; buf++, i++) {
        if ((a > i) || (b < i)) {
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

    if (proc->timer == proc->unk_44) {
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

void NewEfxMagicQUAKE(struct Anim *anim, int duration)
{
    struct ProcEfxMagicQuake *proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxMagicQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->qproc = NewEfxQuakePure(6, 0);
    proc->timer = 0;
    proc->duration = duration;
}

void EfxMagicQUAKE_Loop(struct ProcEfxMagicQuake *proc)
{
    i16 x1, y1, x2, y2;

    SetBgOffset(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    SetBgOffset(BG_0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    func_fe6_08044230(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    if (GetEkrDragonStateType() != 0)
        SetBgOffset(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y + 0x10);

    if (GetEkrDragonStateType() != 0) {
        x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    } else {
        x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }

    x2 = ((gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition);
    y2 = (gEkrYPosReal[1] - gEkrBg2QuakeVec.y);

    SetEkrFrontAnimPostion(POS_L, x1, y1);
    SetEkrFrontAnimPostion(POS_R, x2, y2);

    proc->timer++;
    if (proc->timer > proc->duration) {
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

void NewEfxDummyMagic(struct Anim *anim)
{
    struct ProcEfx *proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxDummyMagic, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxDummyMagic_Loop(struct ProcEfxMagic *proc)
{
    struct Anim *anim_other = GetAnimAnotherSide(proc->anim);
    int time = ++proc->timer;

    if (time == 1) {
        anim_other->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
        return;
    }

    if (time == 10) {
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

void NewEfxTeono(struct Anim *anim)
{
    struct ProcEfxMagic *proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxTeono, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxTeono_Loop(struct ProcEfxMagic *proc)
{
    struct Anim *animc = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxTeonoOBJ(proc->anim);

        if (proc->timer == 1) {
            animc->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE) {
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
        return;

    if (proc->timer == 0x50) {
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

void NewEfxTeonoOBJ(struct Anim *anim)
{
    struct Anim *anim2;
    struct ProcEfxMagicOBJ *proc;

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

void EfxTeonoObj_Loop(struct ProcEfxMagicOBJ *proc)
{
    if (++proc->timer == proc->terminator) {
        gEfxBgSemaphore--;
        BasRemove(proc->anim2);

        if (gEkrDistanceType == EKR_DISTANCE_CLOSE) {
            gEfxTeonoState = 1;
            Proc_End(proc->seproc);
            Proc_End(proc);
        } else
            Proc_Break(proc);
    }
}

void EfxTeonoObj_End(struct ProcEfxMagicOBJ *proc)
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

void NewEfxTeonoOBJ2(struct Anim *anim)
{
    struct Anim *anim2;
    struct ProcEfxMagicOBJ *proc;

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

void EfxTeonoOBJ2_Loop(struct ProcEfxMagicOBJ *proc)
{
    if (++proc->timer == 17) {
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

ProcPtr NewEfxTeonoSE(struct Anim *anim, struct Anim *anim2)
{
    struct ProcEfxMagicOBJ *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxTeonoSE, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 1;
    PlaySFX(SONG_CD, 0x100, anim->xPosition, 1);
    return proc;
}

void EfxTeonoSE_End(struct ProcEfxMagicOBJ *proc)
{
    gEfxBgSemaphore--;
}

void EfxTeonoSE_Loop(struct ProcEfxMagicOBJ *proc)
{
    if (++proc->timer == 0x8) {
        int sound_pos;

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

void NewEfxArrow(struct Anim *anim)
{
    struct ProcEfx *proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxArrow, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxArrow_Loop(struct ProcEfx *proc)
{
    struct Anim *animc = GetAnimAnotherSide(proc->anim);
    int frame = EfxGetCamMovDuration();

    if (++proc->timer == 1) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxArrowOBJ(proc->anim);
        PlaySFX(SONG_CC, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1) {
            animc->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE) {
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

    if (proc->timer == (frame + 9)) {
#if !BUGFIX
        GetAnimAnotherSide(proc->anim);
#endif
        return;
    }

    if (proc->timer == (frame + 10)) {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxArrowOBJ[] = {
    PROC_NAME_DEBUG("efxArrowOBJ"),
    PROC_REPEAT(EfxArrowObj_Loop),
    PROC_END
};

void NewEfxArrowOBJ(struct Anim *anim)
{
    struct ProcEfxMagicOBJ *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxArrowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_ArrowCloseLeft, AnimScr_ArrowCloseRight, AnimScr_ArrowFarLeft, AnimScr_ArrowFarRight);

    SpellFx_RegisterObjPal(Pal_TeonoOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxArrowOBJ, 0x60);
}

void EfxArrowObj_Loop(struct ProcEfxMagicOBJ *proc)
{
    if (++proc->timer == 4)
    {
        gEfxBgSemaphore--;
        BasRemove(proc->anim2);
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxTeyari[] = {
    PROC_NAME_DEBUG("efxTeyariOBJ"),
    PROC_REPEAT(EfxTeyari_Loop),
    PROC_END,
};

void StartSpellAnimJavelin(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinCavalier(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinSoldier(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinPaladin(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinPrgasusKnight(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinFalcon(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinWyvernRider(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinWyvernLord(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void StartSpellAnimJavelinGenerial(struct Anim *anim)
{
    struct ProcEfx *proc;

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

void EfxTeyari_Loop(struct ProcEfx *proc)
{
    if (++proc->timer == 1) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        PlaySFX(SONG_CA, 0x100, proc->anim->xPosition, 1);

        if (proc->timer == 1) {
            struct Anim *animc = GetAnimAnotherSide(proc->anim);

            animc->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE) {
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

    if (proc->timer == 0xE) {
#if !BUGFIX
        GetAnimAnotherSide(proc->anim);
#endif
        return;
    }

    if (proc->timer == 0x10) {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxTeyariOBJ[] =
{
    PROC_NAME_DEBUG("efxTeyariOBJ"),
    PROC_REPEAT(EfxTeyariObj_Loop),
    PROC_END,
};

void NewEfxTeyariOBJ(struct Anim *anim, int type)
{
    struct Anim *anim2;
    struct ProcEfxMagicOBJ *proc;
    u32 *scr1, *scr2;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxTeyariOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (type == 0) {
        scr2 = AnimScr_EfxTeyariObjType0Right;
        scr1 = AnimScr_EfxTeyariObjType0Left;
    } else {
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

void EfxTeyariObj_Loop(struct ProcEfxMagicOBJ *proc)
{
    if (++proc->timer == 0xC) {
        gEfxBgSemaphore--;
        BasRemove(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * Efx song
 */
struct ProcScr CONST_DATA ProcScr_EfxSong[] =
{
    PROC_NAME_DEBUG("efxSong"),
    PROC_REPEAT(EfxSong_Loop),
    PROC_END,
};

void StartSpellAnimSong(struct Anim *anim)
{
    struct ProcEfx *proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxSong, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxSong_Loop(struct ProcEfx *proc)
{
    struct Anim *anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 39) {
        NewEfxSongBG(anim);
        NewEfxSongBGCOL(anim);

#if FE8U
        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);
#endif

        PlaySFX(SONG_EF, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 69) {
        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == POS_L) {
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPal + PAL_OFFSET(0x17), 0x20);
        } else {
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPal + PAL_OFFSET(0x19), 0x20);
        }

        EnableEfxStatusUnits(anim);
    } else if (proc->timer == 100) {
        anim->flags3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxSongBG[] = {
    PROC_NAME_DEBUG("efxSongBG"),
    PROC_REPEAT(EfxSongBG_Loop),
    PROC_END,
};

void NewEfxSongBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxSongBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(Img_EfxSongBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxSongBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, Tsa_EfxSongBG, Tsa_EfxSongBG);

    SpellFx_SetBG1Position();
    SpellFx_SetSomeColorEffect();
}

void EfxSongBG_Loop(struct ProcEfxBG *proc)
{
    if (++proc->timer == 0x1F) {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxSongBGCOL[] = {
    PROC_NAME_DEBUG("efxSongBGCOL"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxSongBGCOL_Loop),
    PROC_END,
};

void NewEfxSongBGCOL(struct Anim *anim)
{
    static const u16 frames[] = {
        0, 1,
        1, 1,
        2, 1,
        3, 1,
        4, 1,
        5, 1,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        16, 1,
        17, 1,
        18, 1,
        19, 1,
        20, 1,
        21, 1,
        22, 1,
        23, 1,
        24, 1,
        25, 1,
        26, 1,
        27, 1,
        28, 1,
        29, 1,
        -1
    };

    struct ProcEfxBGCOL *proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxSongBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->pal = Pal_EfxSongBG;
}

void EfxSongBGCOL_Loop(struct ProcEfxBGCOL *proc)
{
    int ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        const u16 *pal = proc->pal;

        SpellFx_RegisterBgPal(pal + PAL_OFFSET(ret), 0x20);
        return;
    }

    if (ret == -1) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Dance
 */
struct ProcScr CONST_DATA ProcScr_EfxDance[] =
{
    PROC_NAME_DEBUG("efxDance"),
    PROC_REPEAT(EfxDance_Loop),
    PROC_END,
};


void StartSpellAnimDance(struct Anim *anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxDance, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxDance_Loop(struct ProcEfx *proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25) {
        NewEfxSongBG(anim);
        NewEfxSongBGCOL(anim);

        PlaySFX(SONG_EF, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 55) {
        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
            CpuFastCopy(gpEfxUnitPaletteBackup[0], gPal + OBPAL_OFFSET(OBPAL_EFX_UNIT_L), 0x20);
        else
            CpuFastCopy(gpEfxUnitPaletteBackup[1], gPal + OBPAL_OFFSET(OBPAL_EFX_UNIT_R), 0x20);

        EnableEfxStatusUnits(anim);
        return;
    }

    if (proc->timer == 100) {
        anim->flags3 |= ANIM_BIT3_NEXT_ROUND_START;
        SpellFx_Finish();
        Proc_Break(proc);
    }
}

/**
 * Ballista
 */
struct ProcScr CONST_DATA ProcScr_efxShooter[] =
{
    PROC_NAME_DEBUG("efxShooter"),
    PROC_REPEAT(EfxShooter_Loop),
    PROC_END,
};

void StartSpellAnimBallista(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_efxShooter, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    PlaySFX(SONG_136, 0x100, proc->anim->xPosition, 1);
}

void EfxShooter_Loop(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 2) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    timer = proc->timer;

    if (timer == 34) {
        PlaySFX(SONG_137, 0x100, proc->anim->xPosition, 1);
        return;
    }

    if (timer == 42) {
        NewEfxShooterOBJ(anim);
        return;
    }

    if (timer == 45) {
        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (GetEfxHpChangeType(anim) != 2) {
            if (CheckRoundCrit(proc->anim) == 1)
                NewEfxPierceCritical(anim);
            else {
                if (proc->hitted)
                    return;

                NewEfxNormalEffect(proc->anim);
            }
        }

        if (!proc->hitted)
            EfxPlayHittedSFX(anim);

        return;
    }

    if (timer == 62)
        return;

    if (timer == 64) {
        SpellFx_Finish();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxShooterOBJ[] =
{
    PROC_NAME_DEBUG("efxShooterOBJ"),
    PROC_REPEAT(EfxShooterOBJ_Loop),
    PROC_END,
};

void NewEfxShooterOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxShooterOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxShooterOBJ_L, AnimScr_EfxShooterOBJ_R, AnimScr_EfxShooterOBJ_L, AnimScr_EfxShooterOBJ_R);
    proc->anim2 = frontAnim;

    frontAnim->yPosition += 16;
    frontAnim->oam2 &= OAM2_LAYER(3);

    if (GetAnimPosition(anim) == POS_R)
        frontAnim->oam2 |= OAM2_CHR(VRAMOFF_OBJ_4000 / CHR_SIZE) + OAM2_PAL(OBPAL_EFX_UNIT_L);
    else
        frontAnim->oam2 |= OAM2_CHR(VRAMOFF_OBJ_6000 / CHR_SIZE) + OAM2_PAL(OBPAL_EFX_UNIT_R);
}

void EfxShooterOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 10) {
        BasRemove(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

/**
 * Eckesachs
 */
struct ProcScr CONST_DATA ProcScr_EfxEckesachs[] = {
    PROC_19,
    PROC_REPEAT(EfxEckesachs_Loop),
    PROC_END,
};

void StartSpellAnimEckesachs(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxEckesachs, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim)); // missed...
}

void EfxEckesachs_Loop(struct ProcEfx *proc)
{
    struct Anim *anim_other = GetAnimAnotherSide(proc->anim);
    int time = ++proc->timer;

    if (time == 1) {
        NewEfxFlashBgWhite(proc->anim, 6);
        return;
    }

    if (time == 6) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxEckesachsBG(anim_other, 9);
        Pal_EfxEckesachsBGCtrl(anim_other, 9);
        NewEfxEckesachsBGCOL(anim_other);
        PlaySFX(SONG_10C, 0x100, anim_other->xPosition, 1);
        return;
    }

    if (time == 10) {
        anim_other->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
        StartBattleAnimHitEffectsDefault(anim_other, proc->hitted);

        if (!proc->hitted)
            EfxPlayHittedSFX(anim_other);

        return;
    }

    if (time == 25)
        return;

    if (time == 30) {
        SpellFx_Finish();
        EndEfxSpellCastAsync();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxEckesachsBG[] = {
    PROC_19,
    PROC_REPEAT(EfxEckesachsBG_Loop),
    PROC_END,
};

void NewEfxEckesachsBG(struct Anim *anim, int duration)
{
    struct ProcEfxBG *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxEckesachsBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    SpellFx_RegisterBgPal(Pal_EfxEckesachsBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxEckesachsBG, 0x2000);
    LZ77UnCompWram(Tsa_EfxEckesachsBG, gEkrTsaBuffer);

    if (GetAnimPosition(proc->anim) == POS_L)
        EfxTmCpyBG(gEkrTsaBuffer, gBg1Tm, 0x20, 0x14, BGPAL_EFX_SPELL_BG, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);
    else
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg1Tm, 0x20, 0x14, BGPAL_EFX_SPELL_BG, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);

    EnableBgSync(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();
    SetWinEnable(0, 0, 0);
}

void EfxEckesachsBG_Loop(struct ProcEfxBG *proc)
{
    if (++proc->timer == proc->terminator) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxEckesachsBGCtrl[] =
{
    PROC_19,
    PROC_REPEAT(EfxEckesachsBGCtrl_Loop),
    PROC_END,
};

void Pal_EfxEckesachsBGCtrl(struct Anim *anim, int duration)
{
    struct ProcEfxBG *proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxEckesachsBGCtrl, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    if (GetAnimPosition(anim) == POS_L)
        proc->frame = 0xD8;
    else
        proc->frame = -0xD8;
}

void EfxEckesachsBGCtrl_Loop(struct ProcEfxBG *proc)
{
    int x;

    gDispIo.bg_off[BG_1].x = Interpolate(INTERPOLATE_LINEAR, 0, proc->frame, proc->timer, proc->terminator);

    if (GetAnimPosition(proc->anim) == POS_L)
        x = (gDispIo.bg_off[BG_1].x / 8) + 30;
    else
        x = (gDispIo.bg_off[BG_1].x / 8) - 1;

    FillBGRect(gBg1Tm + TM_OFFSET((x + 0) & 0x1F, 0), 1, 20, BGPAL_EFX_SPELL_BG, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);
    FillBGRect(gBg1Tm + TM_OFFSET((x + 1) & 0x1F, 0), 1, 20, BGPAL_EFX_SPELL_BG, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);
    FillBGRect(gBg1Tm + TM_OFFSET((x + 2) & 0x1F, 0), 1, 20, BGPAL_EFX_SPELL_BG, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);

    EnableBgSync(BG1_SYNC_BIT);

    if (++proc->timer > proc->terminator) {
        gEfxBgSemaphore--;
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxEckesachsBGCOL[] = {
    PROC_19,
    PROC_MARK(10),
    PROC_REPEAT(EfxEckesachsBGCOL_Loop),
    PROC_END,
};

void NewEfxEckesachsBGCOL(struct Anim *anim)
{
    static const u16 frames[] = {
        0, 1,
        1, 1,
        2, 1,
        3, 1,
        4, 2,
        5, 1,
        6, 1,
        7, 1,
        -1
    };

    struct ProcEfxBGCOL *proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxEckesachsBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->pal = Pal_EfxEckesachsBG;
}

void EfxEckesachsBGCOL_Loop(struct ProcEfxBGCOL *proc)
{
    int ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        const u16 *pal = proc->pal;

        SpellFx_RegisterBgPal(pal + PAL_OFFSET(ret), 0x20);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Binding blade
 */
struct ProcScr CONST_DATA ProcScr_EfxHurtmut[] =
{
    PROC_NAME_DEBUG("efxHurtmut"),
    PROC_REPEAT(EfxHurtmut_Loop),
    PROC_END,
};

void StartSpellAnimBindingBlade(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxHurtmut, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxHurtmut_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 1) {
        PlaySFX(0x10D, 0x100, anim->xPosition, 1);
        NewEfxHurtmutOBJ(anim);

        NewEfxFlashBgWhite(proc->anim, 6);

        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
            EfxPlayHittedSFX(anim);

        return;
    }

    if (proc->timer == duration + 28) {
        NewEfxALPHA(anim, 0, 14, 16, 0, 0);
        return;
    }

    if (proc->timer == duration + 50)
        return;

    if (proc->timer == duration + 55) {
        SpellFx_Finish();
        EndEfxSpellCastAsync();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxHurtmutOBJ[] =
{
    PROC_NAME_DEBUG("efxHurtmutOBJ"),
    PROC_REPEAT(EfxHurtmutOBJ_Loop),
    PROC_END,
};

void NewEfxHurtmutOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxHurtmutOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == POS_L)
        scr = AnimScr_EfxBindingBlade_L;
    else
        scr = AnimScr_EfxBindingBlade_R;

    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    SpellFx_RegisterObjPal(Pal_EfxBindingBlade, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 0x1000);
}

void EfxHurtmutOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator) {
        BasRemove(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Fire breath
 */
struct ProcScr CONST_DATA ProcScr_EfxFirebreath[] =
{
    PROC_NAME_DEBUG("efxFirebreath"),
    PROC_REPEAT(EfxFirebreath_Loop),
    PROC_END,
};

void StartSpellAnimFireBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxFirebreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

void EfxFirebreath_Loop(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    timer = ++proc->timer;

    if (timer == 1) {
        NewEfxMagicQUAKE(proc->anim, 90);

        NewEfxFirebreathOBJ(anim);
        NewEfxFirebreathBG(anim);
        NewEfxFirebreathBGCOL(anim);

        NewEfxALPHA(anim, 40, 15, 16, 0, 0);

        PlaySFX(0x11D, 0x100, anim->xPosition, 1);
        return;
    }

    if (timer == 15) {
        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
            EfxPlayHittedSFX(anim);

        return;
    }

    if (timer == 120)
        return;

    if (timer == 130) {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxFirebreathOBJ[] =
{
    PROC_NAME_DEBUG("efxFirebreathOBJ"),
    PROC_REPEAT(EfxFirebreathOBJ_Loop),
    PROC_END,
};

void NewEfxFirebreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxFirebreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == 0)
        scr = AnimScr_FirebreathOBJ_L;
    else
        scr = AnimScr_FirebreathOBJ_R;

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
        frontAnim->xPosition += 32;
    else
        frontAnim->xPosition -= 32;

    SpellFx_RegisterObjPal(Pal_EfxBindingBlade, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);
}

void EfxFirebreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator) {
        BasRemove(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxFirebreathBG[] = {
    PROC_NAME_DEBUG("efxFirebreathBG"),
    PROC_REPEAT(EfxFirebreathBG_Loop),
    PROC_END,
};

void NewEfxFirebreathBG(struct Anim * anim)
{
    struct ProcEfxBG *proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxFirebreathBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 112;

    SpellFx_RegisterBgGfx(Img_EfxElfireBG, 32 * 8 * CHR_SIZE);
    SpellFx_WriteBgMap(proc->anim, Tsa_FireBreathBg, Tsa_FireBreathBg);
    SpellFx_SetBG1Position();
    SpellFx_SetSomeColorEffect();

#if FE6
    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;

    if (GetAnimPosition(proc->anim) == POS_L)
        SetBgOffset(BG_1, 0x18, 0);
    else
        SetBgOffset(BG_1, 0xE8, 0);

    func_fe6_0805B0D4(gBg1Tm + TM_OFFSET(0x1E, 0), 2, 20, BGPAL_EFX_SPELL_BG, VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);
#endif
}

void EfxFirebreathBG_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator) {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxFirebreathBGCOL[] =
{
    PROC_NAME_DEBUG("efxFirebreathBGCOL"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxFirebreathBGCOL_Loop),
    PROC_END,
};

void NewEfxFirebreathBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        4, 2,
        5, 2, 6, 2, 5, 2, 6, 2,
        5, 2, 6, 2, 5, 2, 6, 2,
        5, 2, 6, 2, 5, 2, 6, 2,
        5, 2, 6, 2, 5, 2, 6, 2,
        5, 2, 6, 2, 5, 2, 6, 2,
        5, 2, 6, 2, 5, 2, 6, 2,
        5, 2, 6, 2, 4, 2,
        -1
    };

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxFirebreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->pal = Pal_EfxElfireBGCOL;
}

void EfxFirebreathBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
#if FE8
        CpuFastSet(proc->pal, gEfxPal, 8);
        EfxPalWhiteInOut(gEfxPal, 0, 1, ret);
        SpellFx_RegisterBgPal(gEfxPal, PLTT_SIZE_4BPP);
#elif FE6
        const u16 *pal = proc->pal;

        SpellFx_RegisterBgPal(pal + PAL_OFFSET(ret), PLTT_SIZE_4BPP);
#endif
        return;
    }

    if (ret == -1) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Ice breath (by Fae)
 */
struct ProcScr CONST_DATA ProcScr_EfxIcebreath[] = {
    PROC_NAME_DEBUG("efxIcebreath"),
    PROC_REPEAT(EfxIcebreath_Loop),
    PROC_END,
};

void StartSpellAnimIceBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxIcebreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxIcebreath_Loop(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1) {
        NewEfxMagicQUAKE(proc->anim, 90);
        NewEfxIcebreathOBJ(proc->anim);

        PlaySFX(SONG_11E, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4) {
        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
            EfxPlayHittedSFX(anim);

        return;
    }
    if (timer == 50)
        return;

    if (timer == 60) {
        SpellFx_Finish();
        EndEfxSpellCastAsync();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxIcebreathOBJ[] =
{
    PROC_NAME_DEBUG("efxIcebreathOBJ"),
    PROC_ONEND(EfxIcebreathOBJ_OnEnd),
    PROC_SLEEP(52),
    PROC_END,
};

void NewEfxIcebreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scrA;
    u32 * scrB;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxIcebreathOBJ, PROC_TREE_3);
    proc->anim = anim;

    scrB = AnimScr_IcebreathOBJ_R;
    scrA = AnimScr_IcebreathOBJ_L;
    frontAnim = EfxCreateFrontAnim(anim, scrA, scrB, scrA, scrB);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
        frontAnim->xPosition += 32;
    else
        frontAnim->xPosition -= 32;

    SpellFx_RegisterObjPal(Pal_IceBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);
}

void EfxIcebreathOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    BasRemove(proc->anim2);
}

/**
 * Dark breath (by Idunn)
 */
struct ProcScr CONST_DATA ProcScr_EfxDarkbreath[] =
{
    PROC_NAME_DEBUG("efxDarkbreath"),
    PROC_REPEAT(EfxDarkbreath_Loop),
    PROC_END,
};

void StartSpellAnimDarkBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxDarkbreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxDarkbreath_Loop(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1) {
#if FE8
        NewEfxFarAttackWithDistance(proc->anim, -1);
#endif

        NewEfxMagicQUAKE(proc->anim, 90);
        NewEfxDarkbreathBG(proc->anim);
        NewEfxDarkbreathBGCOL(proc->anim);
        NewEfxDarkbreathOBJ(proc->anim);

        PlaySFX(SONG_11F, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4) {
        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
            EfxPlayHittedSFX(anim);

        return;
    }

    if (timer == 32)
        return;

    if (timer == 48) {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}

struct ProcScr CONST_DATA ProcScr_EfxDarkbreathBG[] =
{
    PROC_NAME_DEBUG("efxDarkbreathBG"),
    PROC_REPEAT(EfxDarkbreathBG_Loop),
    PROC_END,
};

u16 * CONST_DATA Tsa_EfxDarkbreathBG[] = {
    Tsa_EfxDarkbreathBG1,
    Tsa_EfxDarkbreathBG2,
    Tsa_EfxDarkbreathBG3,
    Tsa_EfxDarkbreathBG4,
    Tsa_EfxDarkbreathBG5,
    Tsa_EfxDarkbreathBG6,
    Tsa_EfxDarkbreathBG7,
    Tsa_EfxDarkbreathBG8,
    Tsa_EfxDarkbreathBG9,
    Tsa_EfxDarkbreathBG10,
    Tsa_EfxDarkbreathBG11,
    Tsa_EfxDarkbreathBG12,
};

void NewEfxDarkbreathBG(struct Anim * anim)
{
    static const u16 frames[] = {
        11, 12,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        11, 2,
        7, 2,
        8, 2,
        11, 2,
        9, 2,
        10, 2,
        8, 2,
        11, 10,
        -1
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxDarkbreathBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = Tsa_EfxDarkbreathBG;
    proc->tsar = Tsa_EfxDarkbreathBG;
    SpellFx_RegisterBgGfx(Img_EfxDarkbreathBG, 32 * 8 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();
}

void EfxDarkbreathBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxDarkbreathBGCOL[] =
{
    PROC_NAME_DEBUG("efxDarkbreathBGCOL"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxDarkbreathBGCOL_Loop),
    PROC_END,
};

void NewEfxDarkbreathBGCOL(struct Anim *anim)
{
    static const u16 frames[] = {
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        -1,
    };

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxDarkbreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->pal = Pal_EfxThunderstormBG;
}

void EfxDarkbreathBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        const u16 * pal = proc->pal;

        SpellFx_RegisterBgPal(pal + PAL_OFFSET(ret), PLTT_SIZE_4BPP);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxDarkbreathOBJ[] =
{
    PROC_NAME_DEBUG("efxDarkbreathOBJ"),
    PROC_REPEAT(EfxDarkbreathOBJ_Loop),
    PROC_END,
};

void NewEfxDarkbreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = SpawnProc(ProcScr_EfxDarkbreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 55;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_DarkBreath, AnimScr_DarkBreath, AnimScr_DarkBreath, AnimScr_DarkBreath);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
        frontAnim->xPosition += 0x24;
    else
        frontAnim->xPosition -= 0x24;

    frontAnim->yPosition += 0xC;

    SpellFx_RegisterObjPal(Pal_DarkBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);
}

void EfxDarkbreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator) {
        gEfxBgSemaphore--;
        BasRemove(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * Thunder
 */
struct ProcScr CONST_DATA ProcScr_EfxThunder[] = {
    PROC_NAME_DEBUG("efxThunder"),
    PROC_REPEAT(EfxThunder_Loop),
    PROC_END,
};

void StartSpellAnimThunder(struct Anim *anim)
{
    struct ProcEfx *proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxThunder, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxThunder_Loop(struct ProcEfx * proc)
{
    struct Anim *animc = GetAnimAnotherSide(proc->anim);
    int cur, frame = EfxGetCamMovDuration();

    if (++proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);
    
    cur = proc->timer;
    if (cur == (frame + 1)) {
        NewEfxThunderBG(animc);
        NewEfxThunderBGCOL(animc);
        NewEfxThunderOBJ(animc);
        return;
    }

    if (cur == (frame + 4)) {
        animc->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
        StartBattleAnimHitEffectsDefault(animc, proc->hitted);
        PlaySFX(0xF5, 0x100, animc->xPosition, 1);

        if (proc->hitted == EKR_HITTED)
            EfxPlayHittedSFX(animc);
        
        return;
    }

    if (cur == (frame + 0x50))
        return;
    
    if (cur == (frame + 0x60)) {
        SpellFx_Finish();
        EndEfxSpellCastAsync();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxThunderBG[] = {
    PROC_NAME_DEBUG("efxThunderBG"),
    PROC_REPEAT(EfxThunderBG_Loop),
    PROC_END,
};

void NewEfxThunderBG(struct Anim *anim)
{
    static const u16 frame_config[] = {
        0, 4, 1, 40, -1
    };

    static CONST_DATA u16 * tsa_l[] = {
        Tsa_EfxThuderBg1,
        Tsa_EfxThuderBg2
    };

    static CONST_DATA u16 * tsa_r[] = {
        Tsa_EfxThuderBg1,
        Tsa_EfxThuderBg2
    };

    struct ProcEfxBG *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxThunderBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frame_config;
    proc->tsal = tsa_l;
    proc->tsar = tsa_r;

    SpellFx_RegisterBgGfx(Img_EfxThunderBG, 0x10C0);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == POS_L)
            SetBgOffset(BG_1, 0x18, 0x0);
        else
            SetBgOffset(BG_1, 0xE8, 0x0);
    }
}

void EfxThunderBG_Loop(struct ProcEfxBG * proc)
{
    int val, ret;

    val = 0;
    ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);

        if (ret == 0)
            val = 0x11F;
        
        if (ret == 1)
            val = 0x150;
        
        FillBGRect(gBg1Tm+ TM_OFFSET(0x1E, 0x0), 0x2, 0x14, 0x1, val);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxThunderBGCOL[] = {
    PROC_NAME_DEBUG("efxThunderBGCOL"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxThunderBGCOL_Loop),
    PROC_END,
};

void NewEfxThunderBGCOL(struct Anim * anim)
{
    static const u16 frame_config[] = {
        0, 4,
        1, 4,
        2, 2,
        3, 2,
        4, 20,
        5, 2,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        -1
    };

    struct ProcEfxBGCOL *proc;
    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxThunderBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frame_config;
    proc->pal = Pal_EfxThunderBGCOL;
}

void EfxThunderBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        const u16 * pal = proc->pal;

        SpellFx_RegisterBgPal(pal + PAL_OFFSET(ret), 0x20);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxThunderOBJ[] = {
    PROC_NAME_DEBUG("efxThunderOBJ"),
    PROC_REPEAT(EfxThunderOBJ_Loop),
    PROC_END,
};

void NewEfxThunderOBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxThunderOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxThunderOBJ_L, AnimScr_EfxThunderOBJ_R, AnimScr_EfxThunderOBJ_L, AnimScr_EfxThunderOBJ_R);

    SpellFx_RegisterObjPal(Pal_EfxThunderOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxThunderOBJ, 0x1000);
}

void EfxThunderOBJ_Loop(struct ProcEfxOBJ *proc)
{
    if (++proc->timer > 0x32) {
        BasRemove(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxFire[] = {
    PROC_NAME_DEBUG("efxFire"),
    PROC_REPEAT(EfxFire_Loop),
    PROC_END,
};

void StartSpellAnimFire(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void StartSpellAnimElfire(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 1;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxFire_Loop(struct ProcEfx * proc)
{
    int r5, r7, r8, r9, time;
    struct Anim *animc = GetAnimAnotherSide(proc->anim);

    if (0 == gEkrDistanceType) {
        r5 = 0x20;
        r7 = 0x34;
        r8 = 0x36;
        r9 = 0x55;
    } else {
        r5 = 0x28;
        r7 = 0x3C;
        r8 = 0x41;
        r9 = 0x60;
    }

    if (++proc->timer == 1) {
        NewEfxFireBG(proc->anim);
        NewEfxFireOBJ(proc->anim);
        PlaySFX(0xF1, 0x100, proc->anim->xPosition, 1);
    }

    time = proc->timer;
    if (time == r5) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (time == r7) {
        animc->flags3 |= ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE;
        StartBattleAnimHitEffectsDefault(animc, proc->hitted);

        if (proc->hitted != EKR_HITTED)
            return;

        if (proc->type == 0) {
            PlaySFX(SONG_F7, 0x100, animc->xPosition, 1);
            NewEfxFireHITBG(animc);
        } else {
            PlaySFX(SONG_F8, 0x100, animc->xPosition, 1);
            NewEfxElfireBG(animc);
            NewEfxElfireBGCOL(animc);
            NewEfxElfireOBJ(animc);
        }
        EfxPlayHittedSFX(animc);
        return;
    }

    if (time == r8)
        return;

    if (time == r9) {
        SpellFx_Finish();
        EndEfxSpellCastAsync();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxFireBG[] = {
    PROC_NAME_DEBUG("efxFireBG"),
    PROC_REPEAT(EfxFireBG_Loop),
    PROC_END,
};

void NewEfxFireBG(struct Anim * anim)
{
    static const u16 frame_config[] = {
        0, 3,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        9, 3,
        10, 3,
        11, 3,
        -1
    };

    static CONST_DATA u16 *tsal[] = {
        Tsa_EfxFireBG_0812E4C4,
        Tsa_EfxFireBG_0812E56C,
        Tsa_EfxFireBG_0812E614,
        Tsa_EfxFireBG_0812E6CC,
        Tsa_EfxFireBG_0812E794,
        Tsa_EfxFireBG_0812E864,
        Tsa_EfxFireBG_0812E964,
        Tsa_EfxFireBG_0812EA6C,
        Tsa_EfxFireBG_0812EB80,
        Tsa_EfxFireBG_0812ECB8,
        Tsa_EfxFireBG_0812EDBC,
        Tsa_EfxFireBG_0812EE90,
    };

    static CONST_DATA u16 *tsar[] = {
        Tsa_EfxFireBG_0812EF50,
        Tsa_EfxFireBG_0812EFF8,
        Tsa_EfxFireBG_0812F0A0,
        Tsa_EfxFireBG_0812F158,
        Tsa_EfxFireBG_0812F220,
        Tsa_EfxFireBG_0812F2F0,
        Tsa_EfxFireBG_0812F3F0,
        Tsa_EfxFireBG_0812F4F8,
        Tsa_EfxFireBG_0812F60C,
        Tsa_EfxFireBG_0812F744,
        Tsa_EfxFireBG_0812F848,
        Tsa_EfxFireBG_0812F91C,
    };

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxFireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frame_config;
    proc->tsal = tsal;
    proc->tsar = tsar;

    SpellFx_RegisterBgPal(Pal_EfxFireBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxFireBG, 0x2000);
    SpellFx_SetSomeColorEffect();
}

void EfxFireBG_Loop(struct ProcEfxBG * proc)
{
    int ret;

    ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_efxFireOBJ[] = {
    PROC_NAME_DEBUG("efxFireOBJ"),
    PROC_REPEAT(EfxFireOBJ_Loop),
    PROC_END,
};

void NewEfxFireOBJ(struct Anim * anim)
{
    struct Anim *anim2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_efxFireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxFireOBJ_R_Front, AnimScr_EfxFireOBJ_L_Front, AnimScr_EfxFireOBJ_R_Back, AnimScr_EfxFireOBJ_L_Back);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition = anim->xPosition - 0x8;
    else
        anim2->xPosition = anim->xPosition + 0x8;
    
    anim2->yPosition = anim->yPosition + 0x8;

    SpellFx_RegisterObjPal(Pal_EfxFireOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxFireOBJ, 0x1000);
}

void EfxFireOBJ_Loop(struct ProcEfxOBJ * proc)
{
    int time = ++proc->timer;

    if (time == 0x25) {
        PlaySFX(SONG_F2, 0x100, proc->anim->xPosition, 0x1);
        return;
    }

    if (time > 0x32) {
        BasRemove(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxFireHITBG[] = {
    PROC_NAME_DEBUG("efxFireHITBG"),
    PROC_REPEAT(EfxFireHITBG_Loop),
    PROC_END,
};

CONST_DATA u16 *ImgLut_EfxFireHITBG[] = {
    Img_EfxFireHITBG_0812FFF8,
    Img_EfxFireHITBG_0812FFF8,
    Img_EfxFireHITBG_0812FFF8,
    Img_EfxFireHITBG_0812FFF8,
    Img_EfxFireHITBG_0812FFF8,
    Img_EfxFireHITBG_0812FFF8,
    Img_EfxFireHITBG_08130D34,
    Img_EfxFireHITBG_08130D34,
    Img_EfxFireHITBG_08130D34,
    Img_EfxFireHITBG_08131A10,
    Img_EfxFireHITBG_08131A10,
    Img_EfxFireHITBG_08132838,
    Img_EfxFireHITBG_08132838,
    Img_EfxFireHITBG_0813382C,
    Img_EfxFireHITBG_0813382C,
    Img_EfxFireHITBG_08134AC8,
    Img_EfxFireHITBG_08135694,
    Img_EfxFireHITBG_0813628C,
    Img_EfxFireHITBG_08136DE4,
    Img_EfxFireHITBG_081378E0,
    Img_EfxFireHITBG_081382E8
};

CONST_DATA u16 *TsaLut_EfxFireHITBG[] = {
    Tsa_EfxFireHITBG_08138C10,
    Tsa_EfxFireHITBG_08138CBC,
    Tsa_EfxFireHITBG_08138D74,
    Tsa_EfxFireHITBG_08138E40,
    Tsa_EfxFireHITBG_08138F20,
    Tsa_EfxFireHITBG_08139014,
    Tsa_EfxFireHITBG_0813912C,
    Tsa_EfxFireHITBG_08139258,
    Tsa_EfxFireHITBG_08139390,
    Tsa_EfxFireHITBG_081394D4,
    Tsa_EfxFireHITBG_08139628,
    Tsa_EfxFireHITBG_08139780,
    Tsa_EfxFireHITBG_081398E8,
    Tsa_EfxFireHITBG_08139A54,
    Tsa_EfxFireHITBG_08139BD0,
    Tsa_EfxFireHITBG_08139D64,
    Tsa_EfxFireHITBG_08139F04,
    Tsa_EfxFireHITBG_0813A0A4,
    Tsa_EfxFireHITBG_0813A244,
    Tsa_EfxFireHITBG_0813A3E4,
    Tsa_EfxFireHITBG_0813A574
};

const u16 FrameConf_EfxFireHITBG[] = {
    0, 1,
    1, 1,
    2, 1,
    3, 1,
    4, 1,
    5, 1,
    6, 1,
    7, 1,
    8, 1,
    9, 1,
    10, 1,
    11, 1,
    12, 1,
    13, 1,
    14, 1,
    15, 1,
    16, 1,
    17, 1,
    18, 2,
    19, 2,
    20, 4,
    -1
};

void NewEfxFireHITBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxFireHITBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConf_EfxFireHITBG;
    proc->tsal = TsaLut_EfxFireHITBG;
    proc->tsar = TsaLut_EfxFireHITBG;
    proc->img = ImgLut_EfxFireHITBG;

    SpellFx_RegisterBgPal(Pal_EfxFireHITBG, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAnimPosition(proc->anim) == POS_L)
        SetBgOffset(BG_1, 0x18, 0x0);
    else
        SetBgOffset(BG_1, 0xE8, 0x0);
}

void EfxFireHITBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;

        SpellFx_RegisterBgGfx(proc->img[ret], 0x2000);
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SpellFx_ClearColorEffects();
        Proc_End(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxElfireBG[] = {
    PROC_NAME_DEBUG("efxElfireBG"),
    PROC_REPEAT(EfxElfireBG_Loop),
    PROC_END,
};

void NewEfxElfireBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxElfireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(Img_EfxElfireBG, 0x2000);
    SpellFx_WriteBgMap(proc->anim, Tsa_EfxElfireBG, Tsa_EfxElfireBG);
    SpellFx_SetBG1Position();
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAnimPosition(proc->anim) == POS_L)
        SetBgOffset(BG_1, 0x18, 0x0);
    else
        SetBgOffset(BG_1, 0xE8, 0x0);
    
    func_fe6_0805B0D4(
        gBg1Tm + TM_OFFSET(0x1E, 0x0),
        2, 20,
        BGPAL_EFX_SPELL_BG,
        VRAMOFF_BANIM_SPELL_BG / CHR_SIZE);
}

void EfxElfireBG_Loop(struct ProcEfxBG *proc)
{
    if (++proc->timer == 0x28) {
        SpellFx_ClearBG1();
        SpellFx_ClearColorEffects();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxElfireBGCOL[] = {
    PROC_NAME_DEBUG("efxElfireBGCOL"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxElfireBGCOL_Loop),
    PROC_END,
};

void NewEfxElfireBGCOL(struct Anim * anim)
{
    static const u16 frame_config[] = {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        4, 2,
        6, 2,
        4, 2,
        6, 2,
        7, 2,
        8, 1,
        9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 2,
        14, 2,
        15, 3,
        0, 2,
        -1
    };

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxElfireBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frame_config;
    proc->pal = Pal_EfxElfireBGCOL;
    SpellFx_RegisterBgPal(Pal_EfxElfireBGCOL, 0x20);
}

void EfxElfireBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((i16 *)&proc->timer, (i16 *)&proc->frame, proc->frame_config);

    if (ret >= 0) {
        const u16 *pal = proc->pal;

        SpellFx_RegisterBgPal(pal + PAL_OFFSET(ret), 0x20);
        return;
    }

    if (ret == -1) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcScr CONST_DATA ProcScr_EfxElfireOBJ[] = {
    PROC_NAME_DEBUG("efxElfireOBJ"),
    PROC_REPEAT(EfxElfireOBJ_Loop),
    PROC_END,
};

void NewEfxElfireOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = SpawnProc(ProcScr_EfxElfireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxElfireOBJ_L, AnimScr_EfxElfireOBJ_R, AnimScr_EfxElfireOBJ_L, AnimScr_EfxElfireOBJ_R);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == POS_L)
        anim2->xPosition = anim2->xPosition - 0x8;
    else
        anim2->xPosition = anim2->xPosition + 0x8;
    
    anim2->oam01 = anim2->oam01 | OAM1_AFFINE_ID(2);

    SpellFx_RegisterObjPal(Pal_EfxElfireOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxElfireOBJ, 0x800);
}

void EfxElfireOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > 0x28) {
        BasRemove(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Fimbulvetr
 */
struct ProcScr CONST_DATA ProcScr_EfxFimbulvetr[] =
{
    PROC_NAME_DEBUG("efxFimbulvetr"),
    PROC_REPEAT(EfxFimbulvetr_Loop),
    PROC_END,
};

void StartSpellAnimFimbulvetr(struct Anim *anim)
{
    struct ProcEfx *proc;

    SpellFx_Begin();
    NewEfxSpellCast();

    SpellFx_SetBG1Position();

    proc = SpawnProc(ProcScr_EfxFimbulvetr, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void EfxFimbulvetr_Loop(struct ProcEfx *proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (proc->timer == duration + 1) {
        NewEfxFimbulvetrBGTR(anim);
        NewEfxFimbulvetrOBJ2(anim);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 16, 0, 16, 0);
        PlaySFX(0x122, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == duration + 82)
        NewEfxFlashBgWhite(proc->anim, 4);
    else if (proc->timer == duration + 85) {
        NewEfxFimbulvetrBG(anim);
        NewEfxFimbulvetrOBJ(anim);
        NewEfxALPHA(anim, 24, 16, 16, 0, 0);
        PlaySFX(0x123, 0x100, anim->xPosition, 1);
    } else if (proc->timer == duration + 88) {
        anim->flags3 |= (ANIM_BIT3_C02_BLOCK_END | ANIM_BIT3_C01_BLOCK_END_INBATTLE);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
            EfxPlayHittedSFX(anim);
    } else if ((proc->timer != duration + 136) && (proc->timer == duration + 161)) {
        SpellFx_Finish();
        EndEfxSpellCastAsync();
        Proc_Break(proc);
    }
}
