#include "prelude.h"
#include "proc.h"
#include "oam.h"
#include "move.h"
#include "hardware.h"
#include "constants/jids.h"
#include "constants/videoalloc_banim.h"

#include "banim_sprite.h"
#include "banim.h"
#include "banim_ekrbattle.h"
#include "banim_ekrdragon.h"

void ResetEkrDragonStatus(void)
{
    gUnk_Banim_0201E7AC[POS_L] = NULL;
    gUnk_Banim_0201E7AC[POS_R] = NULL;
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

u32 GetEkrDragonStatueType(void)
{
    u32 ret = 0;

    if (*GetEkrDragonJid(POS_L) == 0x53)
        ret |= EDRAGON_TYPE_0;

    if (*GetEkrDragonJid(POS_R) == 0x53)
        ret |= EDRAGON_TYPE_1;

    if (*GetEkrDragonJid(POS_L) == 0x54)
        ret |= EDRAGON_TYPE_2;

    if (*GetEkrDragonJid(POS_R) == 0x54)
        ret |= EDRAGON_TYPE_3;

    if (*GetEkrDragonJid(POS_L) == 0x70)
        ret |= EDRAGON_TYPE_4;

    if (*GetEkrDragonJid(POS_R) == 0x70)
        ret |= EDRAGON_TYPE_5;

    return ret;
}

u32 GetEkrDragonStatueType5370(void)
{
    u32 ret = 0;

    if (*GetEkrDragonJid(POS_L) == 0x53)
        ret |= EDRAGON_TYPE_0;

    if (*GetEkrDragonJid(POS_R) == 0x53)
        ret |= EDRAGON_TYPE_1;

    if (*GetEkrDragonJid(POS_L) == 0x70)
        ret |= EDRAGON_TYPE_4;

    if (*GetEkrDragonJid(POS_R) == 0x70)
        ret |= EDRAGON_TYPE_5;

    return ret;
}

u32 GetEkrDragonStatueType70(void)
{
    u32 ret = 0;

    if (*GetEkrDragonJid(POS_L) == 0x70)
        ret |= EDRAGON_TYPE_4;

    if (*GetEkrDragonJid(POS_R) == 0x70)
        ret |= EDRAGON_TYPE_5;

    return ret;
}

bool func_fe6_080589C4(struct BaSprite * anim)
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

ProcPtr func_fe6_08058A1C(struct BaSprite * anim)
{
    return gUnk_Banim_0201E7AC[GetAnimPosition(anim)];
}

void func_fe6_08058A34(struct BaSprite * anim)
{
    Proc_End(gUnk_Banim_0201E7B4[GetAnimPosition(anim)]);
}

void func_fe6_08058A50(u8 layer)
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
