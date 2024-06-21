#include "prelude.h"
#include "proc.h"
#include "oam.h"
#include "move.h"
#include "util.h"
#include "map.h"
#include "hardware.h"
#include "constants/jids.h"
#include "constants/videoalloc_banim.h"

#include "banim_sprite.h"
#include "banim.h"
#include "banim_ekrbattle.h"
#include "banim_ekrdragon.h"

void ResetEkrDragonStatus(void)
{
    EkrDragonProcs[POS_L] = NULL;
    EkrDragonProcs[POS_R] = NULL;
    gUnk_Banim_0201E7BC = NULL;
    gEkrDragonIntroDone[POS_L] = FALSE;
    gEkrDragonIntroDone[POS_R] = FALSE;
    gUnk_Banim_0201E7C4[POS_L] = 0;
    gUnk_Banim_0201E7C4[POS_R] = 0;
    gEkrDragonState[POS_L] = DRAGON_STATE_DEFAULT;
    gEkrDragonState[POS_R] = DRAGON_STATE_DEFAULT;
}

bool EkrDragonIntroDone(struct BaSprite * anim)
{
    if (gEkrDragonIntroDone[GetAnimPosition(anim)] == 1)
        return TRUE;

    return FALSE;
}

void TriggerEkrDragonEnding(struct BaSprite * anim)
{
    gEkrDragonState[GetAnimPosition(anim)] = DRAGON_STATE_ENDING;
}

bool CheckEkrDragonEndingDone(struct BaSprite * anim)
{
    if (gEkrDragonIntroDone[GetAnimPosition(anim)] == 2)
        return TRUE;

    return FALSE;
}

u32 GetEkrDragonStateType(void)
{
    u32 ret = 0;

    if (*GetEkrDragonJid(POS_L) == 0x53)
        ret |= EDRAGON_TYPE_MANAKETE_L;

    if (*GetEkrDragonJid(POS_R) == 0x53)
        ret |= EDRAGON_TYPE_MANAKETE_R;

    if (*GetEkrDragonJid(POS_L) == 0x54)
        ret |= EDRAGON_TYPE_FAE_L;

    if (*GetEkrDragonJid(POS_R) == 0x54)
        ret |= EDRAGON_TYPE_FAE_R;

    if (*GetEkrDragonJid(POS_L) == 0x70)
        ret |= EDRAGON_TYPE_IDUNN_L;

    if (*GetEkrDragonJid(POS_R) == 0x70)
        ret |= EDRAGON_TYPE_IDUNN_R;

    return ret;
}

u32 GetEkrDragonStateTypeIdunnManakete(void)
{
    u32 ret = 0;

    if (*GetEkrDragonJid(POS_L) == 0x53)
        ret |= EDRAGON_TYPE_MANAKETE_L;

    if (*GetEkrDragonJid(POS_R) == 0x53)
        ret |= EDRAGON_TYPE_MANAKETE_R;

    if (*GetEkrDragonJid(POS_L) == 0x70)
        ret |= EDRAGON_TYPE_IDUNN_L;

    if (*GetEkrDragonJid(POS_R) == 0x70)
        ret |= EDRAGON_TYPE_IDUNN_R;

    return ret;
}

u32 GetEkrDragonStateTypeIdunn(void)
{
    u32 ret = 0;

    if (*GetEkrDragonJid(POS_L) == 0x70)
        ret |= EDRAGON_TYPE_IDUNN_L;

    if (*GetEkrDragonJid(POS_R) == 0x70)
        ret |= EDRAGON_TYPE_IDUNN_R;

    return ret;
}

bool CheckEkrDragonStateTypeFae(struct BaSprite * anim)
{
    if (*GetEkrDragonStatusIdx(anim) == TRUE)
        return TRUE;

    if (gEkrDistanceType != EKR_DISTANCE_FARFAR || GetAnimPosition(anim) == gEkrInitPosReal)
        return FALSE;

    return TRUE;
}

u16 * GetEkrDragonJid(int pos)
{
    return gEkrDragonJid + pos;
}

u16 * GetEkrDragonStatusIdx(struct BaSprite * anim)
{
    return gUnk_Banim_0201E7C4 + GetAnimPosition(anim);
}

ProcPtr GetEkrDragonProc(struct BaSprite * anim)
{
    return EkrDragonProcs[GetAnimPosition(anim)];
}

void func_fe6_08058A34(struct BaSprite * anim)
{
    Proc_End(gUnk_Banim_0201E7B4[GetAnimPosition(anim)]);
}

void SetDragonBasLayer(u8 layer)
{
    u32 oam2;
    struct BaSprite * anim_l = MAIN_ANIM_FRONT(POS_L);
    struct BaSprite * anim_r = MAIN_ANIM_FRONT(POS_R);

    anim_l->oam2 = (anim_l->oam2 & (OAM2_PAL_MASK | OAM2_CHR_MASK)) | (layer * 0x0400);
    anim_r->oam2 = (anim_r->oam2 & (OAM2_PAL_MASK | OAM2_CHR_MASK)) | (layer * 0x0400);
}

void func_fe6_08058A80(struct ProcEkrDragon * proc)
{
    CpuFastCopy(Pal_081BF434, &PAL_BG_COLOR(1, 0), 0x20);

    if (GetAnimPosition(proc->anim) == POS_L)
    {
        CpuFastCopy(Pal_081BF434, &PAL_BG_COLOR(6, 0), 0x20);
    }
    else
    {
        CpuFastCopy(Pal_081BF434, &PAL_BG_COLOR(7, 0), 0x20);
    }
    EnablePalSync();
}

void func_fe6_08058ACC(struct ProcEkrDragon * proc)
{
    LZ77UnCompWram(Img_081BC268, gSpellAnimBgfx);
    LZ77UnCompWram(Tsa_081BF5B4, gEkrTsaBuffer);
    EfxTmFill(0);

    if (GetAnimPosition(proc->anim) == POS_L)
    {
        int x = gEkrDistanceType == EKR_DISTANCE_CLOSE ? 0x23 : 0x1D;

        EfxTmCpyExtHFlip(
            gEkrTsaBuffer, -1,
            EFX_TILEMAP_LOC(gEfxFrameTmap, x, 0), EFX_BG_WIDTH,
            0xF, 0x16, 0x6, 0
        );

        EfxTmCpyExt(
            EFX_TILEMAP_LOC(gEfxFrameTmap, 0x21, 0), EFX_BG_WIDTH,
            gBg3Tm, 0x20,
            0x20, 0x16, -1, -1
        );

        RegisterVramMove(gSpellAnimBgfx, CHR_SIZE * BGCHR_EKRDRAGON_400, CHR_SIZE * 0x100);
    }
    EnableBgSync(BG3_SYNC_BIT);
}

void func_fe6_08058B84(struct ProcEkrDragon * proc)
{
    LZ77UnCompWram(Img_081BCBDC, gSpellAnimBgfx);
    LZ77UnCompWram(Tsa_081BF6F4, gEkrTsaBuffer);
    EfxTmFill(0);

    if (GetAnimPosition(proc->anim) == POS_L)
    {
        int x = gEkrDistanceType == EKR_DISTANCE_CLOSE ? 0x21 : 0x1B;

        EfxTmCpyExtHFlip(
            gEkrTsaBuffer, -1,
            EFX_TILEMAP_LOC(gEfxFrameTmap, x, 0), EFX_BG_WIDTH,
            0xF, 0x16, 0x6, 0
        );

        EfxTmCpyExt(
            EFX_TILEMAP_LOC(gEfxFrameTmap, 0x21, 0), EFX_BG_WIDTH,
            gBg3Tm, 0x20,
            0x20, 0x16, -1, -1
        );

        RegisterVramMove(gSpellAnimBgfx, CHR_SIZE * BGCHR_EKRDRAGON_400, CHR_SIZE * 0x100);
    }
    EnableBgSync(BG3_SYNC_BIT);
}

void func_fe6_08058C3C(struct ProcEkrDragon * proc)
{
    LZ77UnCompWram(Img_081BD5E8, gSpellAnimBgfx);
    LZ77UnCompWram(Tsa_081BD5E8, gEkrTsaBuffer);
    EfxTmFill(0);

    if (GetAnimPosition(proc->anim) == POS_L)
    {
        int x;

#if NONMATCHING
        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
            x = 0x21;
            break;

        default:
            x = 1;
            break;

        case EKR_DISTANCE_FAR:
            x = 0x1B;
            break;
        }
#else
        int distance = gEkrDistanceType;
        x = 0x21;
        if (distance != EKR_DISTANCE_CLOSE)
        {
            x = 1;
            if (distance == EKR_DISTANCE_FAR)
                x = 0x1B;
        }
#endif

        EfxTmCpyExtHFlip(
            gEkrTsaBuffer, -1,
            EFX_TILEMAP_LOC(gEfxFrameTmap, x, 0), EFX_BG_WIDTH,
            0xF, 0x16, 0x6, 0
        );

        EfxTmCpyExt(
            EFX_TILEMAP_LOC(gEfxFrameTmap, 0x21, 0), EFX_BG_WIDTH,
            gBg3Tm, 0x20,
            0x20, 0x16, -1, -1
        );

        RegisterVramMove(gSpellAnimBgfx, CHR_SIZE * BGCHR_EKRDRAGON_400, CHR_SIZE * 0x100);
    }
    EnableBgSync(BG3_SYNC_BIT);
}

struct ProcScr CONST_DATA ProcScr_EkrDragon_086046D8[] = {
    PROC_19,
    PROC_REPEAT(func_fe6_08058D08),
    PROC_END,
};

void func_fe6_08058CEC(int x)
{
    struct ProcEkrDragon_086046D8 * proc;
    proc = SpawnProc(ProcScr_EkrDragon_086046D8, PROC_TREE_4);
    proc->timer = 0;
    proc->x = x;
}

void func_fe6_08058D08(struct ProcEkrDragon_086046D8 * proc)
{
    SetBgOffset(3, proc->x, 0x10);

    if (++proc->timer == 0x46)
        Proc_Break(proc);
}

void func_fe6_08058D34(struct ProcEkrDragon * proc)
{
    int pos;

    LZ77UnCompWram(Img_081BE490, gSpellAnimBgfx);
    RegisterVramMove(gSpellAnimBgfx, CHR_SIZE * BGCHR_EKRDRAGON_400, CHR_SIZE * 0x100);
    EfxTmFill(0);

    pos = GetAnimPosition(proc->anim);
    if (pos == POS_L)
    {
        LZ77UnCompWram(Tsa_081BFA34, gEkrTsaBuffer);
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBg3Tm, 30, 22, 6, pos);

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
            SetBgOffset(3, 0, 16);
            break;

        case EKR_DISTANCE_FAR:
            func_fe6_08058CEC(gEkrBgPosition + 48);
            SetBgOffset(3, gEkrBgPosition + 48, 16);

            if (gEkrBgPosition == 0)
            {
                FillBGRect(gBg3Tm, 2, 22, 240, 0);
                FillBGRect(gBg3Tm + 2, 2, 22, 240, 0);
            }
            break;

        case EKR_DISTANCE_FARFAR:
            func_fe6_08058CEC(16);
            SetBgOffset(3, 16, 16);
            break;
        }
    }
    EnableBgSync(BG3_SYNC_BIT);
}

void func_fe6_08058E24(void)
{
    CpuFastFill16(0, gUnk_Banim_0201C77C, CHR_SIZE);
    RegisterVramMove(gUnk_Banim_0201C77C, CHR_SIZE * BGCHR_EKRDRAGON_400, CHR_SIZE);
}

void func_fe6_08058E58(int pos)
{
    if (pos == POS_L)
        CpuFastCopy(Pal_081BF434, gPal + BGPAL_OFFSET(6), 0x20);
    else
        CpuFastCopy(Pal_081BF434, gPal + BGPAL_OFFSET(7), 0x20);

    EnablePalSync();
}

void func_fe6_08058E90(int pos)
{
    if (pos == POS_L)
        CpuFastCopy(Pal_081C4DE8, gPal + BGPAL_OFFSET(6), 0x20);
    else
        CpuFastCopy(Pal_081C4DE8, gPal + BGPAL_OFFSET(7), 0x20);

    EnablePalSync();
}

void func_fe6_08058EC8(int pos)
{
    if (pos == POS_L)
        CpuFastCopy(Pal_08113564, gPal + BGPAL_OFFSET(6), 0x20);
    else
        CpuFastCopy(Pal_08113564, gPal + BGPAL_OFFSET(7), 0x20);

    EnablePalSync();
}

int GetDragonPosition(void)
{
    int type = GetEkrDragonStateTypeIdunn();
    if (type & EDRAGON_TYPE_IDUNN_L)
        return POS_L;

    if (type & EDRAGON_TYPE_IDUNN_R)
        return POS_R;

    return 2;
}

void InitEkrDragonStatus(void)
{
    SetAnimStateHidden(GetDragonPosition());
}

int func_fe6_08058F38(void)
{
    if (GetEkrDragonStateTypeIdunn() == 0)
        return 0;

    if (*GetEkrDragonStatusIdx(MAIN_ANIM_FRONT(POS_L)) != 1)
        return 0;

    return 1;
}

void EkrDragonTmCpyExt(int x)
{
    int _x, tmp1;
    u16 * buf;

    _x = x >> 3;
    tmp1 = 7;

    SetBgOffset(3, x & tmp1, 16);

    buf = gEfxFrameTmap + 0x21 + _x;

    EfxTmCpyExt(
        buf,
        EFX_BG_WIDTH,
        gBg3Tm,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, 22, -1, -1);

    EnableBgSync(BG3_SYNC_BIT);
}

void func_fe6_08058FA8(const u8 * tsa)
{
    LZ77UnCompWram(tsa, gEkrTsaBuffer);

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        EfxTmCpyExt(
            gEkrTsaBuffer,
            -1,
            gBg3Tm,
            TILE_SIZE_4BPP, 30, 30, 6, 0);
    }
    else
    {
        EfxTmCpyExt(
            gEkrTsaBuffer + 4,
            30,
            gBg3Tm,
            TILE_SIZE_4BPP, 26, 30, 6, 0);
    }
    EnableBgSync(BG3_SYNC_BIT);
}

static inline void _func(int loc)
{
    EfxTmCpyExt(
        gUnk_Banim_0201E7CC,
        -1,
        gEfxFrameTmap + loc,
        EFX_BG_WIDTH, 30, 22,
        6, 0);
}

void func_fe6_08059018(const u8 * tsa)
{
    int loc, distance;

    LZ77UnCompWram(tsa, gUnk_Banim_0201E7CC);

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        loc = TM_OFFSET(1, 1);
    else if (gEkrDistanceType == EKR_DISTANCE_FAR)
        loc = TM_OFFSET(29, 0);
    else
        loc = TM_OFFSET(3, 0);

    EfxTmCpyExt(
        gUnk_Banim_0201E7CC,
        -1,
        gEfxFrameTmap + loc,
        EFX_BG_WIDTH, 30, 22,
        6, 0);

    EkrDragonTmCpyExt(gEkrBgPosition);
}

struct ProcScr CONST_DATA ProcScr_EkrDragon_086046F0[] =
{
    PROC_19,
    PROC_SLEEP(20),
    PROC_REPEAT(func_fe6_08059090),
    PROC_END,
};

void func_fe6_08059078(struct BaSprite * anim)
{
    struct ProcEkrDragon_086046F0 * proc;
    proc = SpawnProc(ProcScr_EkrDragon_086046F0, PROC_TREE_3);
    proc->anim = anim;
}

void func_fe6_08059090(struct ProcEkrDragon_086046F0 * proc)
{
    struct BaSprite * anim = proc->anim;

    EfxPlaySE(0x0E6, 0x100);
    M4aPlayWithPostionCtrl(0x0E6, anim->xPosition, 1);
    Proc_Break(proc);
}

/**
 * Manakete
 */
struct ProcScr CONST_DATA ProcScr_EkrManakete[] =
{
    PROC_19,
    PROC_REPEAT(EkrManakete_BgFadeIn),
    PROC_REPEAT(func_fe6_08059144),
    PROC_REPEAT(func_fe6_080591AC),
    PROC_REPEAT(func_fe6_080591CC),
    PROC_REPEAT(func_fe6_080592D0),
    PROC_REPEAT(EkrManakete_EnterPrepareNewBanimfx),
    PROC_REPEAT(EkrManakete_BlockingInBattle),
    PROC_REPEAT(func_fe6_08059400),
    PROC_REPEAT(EkrManakete_StartExit),
    PROC_REPEAT(func_fe6_0805946C),
    PROC_REPEAT(func_fe6_080594CC),
    PROC_REPEAT(func_fe6_08059578),
    PROC_REPEAT(func_fe6_080595EC),
    PROC_REPEAT(EkrManakete_ReloadBg),
    PROC_REPEAT(EkrManakete_TriggerEnding),
    PROC_END,
};

void StartEkrManakete(struct BaSprite * anim)
{
    int pos;
    struct ProcEkrDragon * proc;

    pos = GetAnimPosition(anim);
    proc = SpawnProc(ProcScr_EkrManakete, PROC_TREE_3);

    EkrDragonProcs[pos] = proc;
    gEkrDragonState[GetAnimPosition(anim)] = DRAGON_STATE_1;

    proc->anim = anim;
    proc->timer = 0;
}

void EkrManakete_BgFadeIn(struct ProcEkrDragon * proc)
{
    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        NewEfxFlashUnit(proc->anim, 0, 10, 1);
        Proc_Break(proc);
    }
}

void func_fe6_08059144(struct ProcEkrDragon * proc)
{
    if (CheckEkrDragonStateTypeFae(proc->anim) == TRUE)
    {
        proc->timer = 60;
        Proc_Break(proc);
        return;
    }

    if (++proc->timer == 11)
    {
        proc->anim->flags |= BAS_BIT_HIDDEN;
        StartManaketeTransferAnim(proc->anim, 0);
        EfxPlaySE(0xE8, 0x100);
        M4aPlayWithPostionCtrl(0x0E8, proc->anim->xPosition, 1);
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_080591AC(struct ProcEkrDragon * proc)
{
    if (++proc->timer == 61)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_080591CC(struct ProcEkrDragon * proc)
{
    if (CheckEkrDragonStateTypeFae(proc->anim) == TRUE)
    {
        func_fe6_08058E24();
        TmFill(gBg3Tm, 0xF000);
        SetBgOffset(3, 0, 0x10);
        EnableBgSync(BG3_SYNC_BIT);

        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg3_ct.priority = 2;
        gDispIo.bg2_ct.priority = 3;

        SetDragonBasLayer(1);
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    if (proc->timer == 0)
    {
        func_fe6_08058E24();
        TmFill(gBg3Tm, 0xF000);
        SetBgOffset(3, 0, 0x10);

        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg3_ct.priority = 2;
        gDispIo.bg2_ct.priority = 3;

        EnableBgSync(BG3_SYNC_BIT);
        SetDragonBasLayer(1);
        func_fe6_08058A80(proc);
        func_fe6_08058ACC(proc);
    }

    if (++proc->timer == 6)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_080592D0(struct ProcEkrDragon * proc)
{
    if (CheckEkrDragonStateTypeFae(proc->anim) == TRUE)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    if (proc->timer == 0)
    {
        func_fe6_08058B84(proc);
        NewEfxQuake(5);
    }

    if (++proc->timer == 11)
    {
        proc->timer = 0;
        func_fe6_08059078(proc->anim);
        Proc_Break(proc);
    }
}

void EkrManakete_EnterPrepareNewBanimfx(struct ProcEkrDragon * proc)
{
    if (CheckEkrDragonStateTypeFae(proc->anim) == TRUE)
    {
        func_fe6_08058C3C(proc);
        func_fe6_080598F0(proc->anim);
        proc->anim->flags &= ~BAS_BIT_HIDDEN;
        EkrPrepareBanimfx(proc->anim, 0x55);
        gEkrDragonIntroDone[GetAnimPosition(proc->anim)] = TRUE;
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    if (proc->timer == 0)
    {
        func_fe6_08058C3C(proc);
        func_fe6_080598F0(proc->anim);
        proc->anim->flags &= ~BAS_BIT_HIDDEN;
        EkrPrepareBanimfx(proc->anim, 0x55);
    }

    if (++proc->timer == 61)
    {
        gEkrDragonIntroDone[GetAnimPosition(proc->anim)] = TRUE;
        Proc_Break(proc);
    }
}

void EkrManakete_BlockingInBattle(struct ProcEkrDragon * proc)
{
    if (gEkrDragonState[GetAnimPosition(proc->anim)] == DRAGON_STATE_ENDING)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_08059400(struct ProcEkrDragon * proc)
{
    func_fe6_08058A34(proc->anim);
    Proc_Break(proc);
}

void EkrManakete_StartExit(struct ProcEkrDragon * proc)
{
    if (CheckEkrDragonStateTypeFae(proc->anim) == TRUE)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    if (proc->timer == 0)
    {
        func_fe6_08058B84(proc);
        proc->anim->flags |= BAS_BIT_HIDDEN;
    }

    if (++proc->timer == 6)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_0805946C(struct ProcEkrDragon * proc)
{
    if (CheckEkrDragonStateTypeFae(proc->anim) == TRUE)
    {
        func_fe6_08058E24();
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    if (proc->timer == 0)
    {
        func_fe6_08058E24();
        EfxChapterMapFadeOUT(0x10);
        func_fe6_08058A80(proc);
        func_fe6_08058ACC(proc);
    }

    if (++proc->timer == 6)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_080594CC(struct ProcEkrDragon * proc)
{
    if (proc->timer == 0 && CheckEkrDragonStateTypeFae(proc->anim) == FALSE)
    {
        StartManaketeTransferAnim(proc->anim, 1);
        EfxPlaySE(0xE9, 0x100);
        M4aPlayWithPostionCtrl(0xE9, proc->anim->xPosition, 1);
    }

    if (++proc->timer == 6)
    {
        TmFill(gBg3Tm, 0xF000);
        SetBgOffset(3, 0, 0);
        EnableBgSync(BG3_SYNC_BIT);

        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg2_ct.priority = 2;
        gDispIo.bg3_ct.priority = 3;

        SetDragonBasLayer(2);
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_08059578(struct ProcEkrDragon * proc)
{
    if (CheckEkrDragonStateTypeFae(proc->anim) == TRUE)
    {
        proc->timer = 80;
        Proc_Break(proc);
        return;
    }

    if (++proc->timer == 61)
    {
        proc->anim->flags &= ~BAS_BIT_HIDDEN;
        EkrPrepareBanimfx(proc->anim, gBanimIdx_bak[GetAnimPosition(proc->anim)]);
        NewEfxFlashUnit(proc->anim, 0, 10, 1);
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void func_fe6_080595EC(struct ProcEkrDragon * proc)
{
    if (++proc->timer == 81)
    {
        EfxChapterMapFadeOUT(0x10);
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrManakete_ReloadBg(struct ProcEkrDragon * proc)
{
    if (proc->timer == 0)
    {
        ApplyChapterMapGraphics(gPlaySt.chapter);
        RenderMap();
    }

    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_RSQUARE, 0x10, 4, proc->timer, 8));

    if (++proc->timer == 0x9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrManakete_TriggerEnding(struct ProcEkrDragon * proc)
{
    gEkrDragonIntroDone[GetAnimPosition(proc->anim)] = 2;
    Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EkrManaketeComeInFlame[] =
{
    PROC_19,
    PROC_ONEND(func_fe6_08059730),
    PROC_REPEAT(func_fe6_08059758),
    PROC_SLEEP(20),
    PROC_REPEAT(func_fe6_0805979C),
    PROC_SLEEP(26),
    PROC_REPEAT(func_fe6_080597E0),
    PROC_SLEEP(9),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_EkrManaketeDispearInFlame[] =
{
    PROC_19,
    PROC_ONEND(func_fe6_08059730),
    PROC_REPEAT(func_fe6_080598AC),
    PROC_SLEEP(9),
    PROC_REPEAT(func_fe6_08059868),
    PROC_SLEEP(26),
    PROC_REPEAT(func_fe6_08059824),
    PROC_SLEEP(20),
    PROC_END,
};

#if 0
void StartManaketeTransferAnim(struct BaSprite * anim, int type)
{
    struct BaSprite * animfx;
    struct ProcEkrManaketefx * proc;

    gEfxBgSemaphore++;

    if (type == 0)
        proc = SpawnProc(ProcScr_EkrManaketeComeInFlame, PROC_TREE_3);
    else
        proc = SpawnProc(ProcScr_EkrManaketeDispearInFlame, PROC_TREE_3);

    proc->anim = anim;
    proc->animfx = animfx = EfxCreateFrontAnim(proc, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame);
    animfx->oam2 = OAM2_CHR(0x200) + OAM2_LAYER(1) + OAM2_PAL(2);
    animfx->oam01 |= OAM1_AFFINE_ID(2);
    animfx->yPosition += 8;

    proc->timer = 0;
    SpellFx_SetSomeColorEffect();
    gDispIo.blend_ct
}
#endif
