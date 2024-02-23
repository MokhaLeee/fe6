#include "prelude.h"
#include "proc.h"
#include "oam.h"
#include "constants/jids.h"

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
