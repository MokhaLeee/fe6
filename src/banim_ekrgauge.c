#include "prelude.h"
#include "item.h"
#include "move.h"
#include "banim_sprite.h"
#include "banim.h"
#include "oam.h"
#include "icon.h"
#include "hardware.h"

void func_fe6_080435EC(void *_src, void *_dst)
{
    u16 *src = _src;
    u16 *dst = _dst;
    u32 i;

    for (i = 0; i < 11; i++) {
        u32 val = *src == 0xFF ? 0xF : *src;

        CpuFastCopy(Pal_08113224 + BGPAL_OFFSET(val), dst + BGPAL_OFFSET(i), 0x20);
        src++;
    }

    CpuFastFill(0, dst + BGPAL_OFFSET(12), 0x20);
}

void EkrGaugeModDec(i16 val, u16 buf[])
{
    if (val == -1) {
        buf[0] = 11;
        buf[1] = 10;
        buf[2] = 10;
        return;
    }

    buf[0] = Div(val, 100);

    val -= buf[0] * 100;

    buf[1] = Div(val, 10);
    buf[2] = val - buf[1] * 10;

    if ((buf[0] + buf[1]) == 0)
        buf[1] = 11;

    if (buf[0] == 0)
        buf[0] = 11;
}

void NewEkrGauge(void)
{
    u32 i, j;

    gpProcEkrGauge = SpawnProc(ProcScr_EkrGauge, PROC_TREE_1);

    EkrGauge_Setup44(0);
    EkrGauge_Clr4C50();
    DisableEkrGauge();
    EkrGauge_ClrInitFlag();
    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

    CpuCopy16(gPalEfxHpBarPurple + PAL_OFFSET(gBanimFactionPal[POS_L]), gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_L), 0x10 * sizeof(u16));
    CpuCopy16(gPalEfxHpBarPurple + PAL_OFFSET(gBanimFactionPal[POS_R]), gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_R), 0x10 * sizeof(u16));

    gEkrGaugeHpBak[0] = -1;
    gEkrGaugeHpBak[1] = -1;

    LZ77UnCompVram(Img_EfxSideHitDmgCrit, OBJ_VRAM0 + VRAMOFF_OBJ_EKRGAUGE_SUBFIX);
    LZ77UnCompVram(Img_EfxArrowWTA, OBJ_VRAM0 + VRAMOFF_OBJ_EKRGAUGE_ARROW);

    CpuFastCopy(Pal_EkrGauge_081131A4 + PAL_OFFSET(gBanimFactionPal[POS_L]), gPal + OBPAL_OFFSET(OBPAL_EFX_5), 0x10 * sizeof(u16));
    CpuFastCopy(Pal_EkrGauge_081131A4 + PAL_OFFSET(gBanimFactionPal[POS_R]), gPal + OBPAL_OFFSET(OBPAL_EFX_6), 0x10 * sizeof(u16));

    EnablePalSync();

    EkrGaugeModDec(gEkrGaugeHit[0], &gEkrGaugeDecoder[0x0]);
    EkrGaugeModDec(gEkrGaugeDmg[0], &gEkrGaugeDecoder[0x3]);
    EkrGaugeModDec(gEkrGaugeCrt[0], &gEkrGaugeDecoder[0x6]);

    EkrGaugeModDec(gEkrGaugeHit[1], &gEkrGaugeDecoder[0x9]);
    EkrGaugeModDec(gEkrGaugeDmg[1], &gEkrGaugeDecoder[0xC]);
    EkrGaugeModDec(gEkrGaugeCrt[1], &gEkrGaugeDecoder[0xF]);

    CpuFastFill(0, Buf_EkrGaugeNumImg, 0x400);

    /* value of hit & dmg & crit */
    for (i = 0; i < 6; i++) {
        for (j = 0; j < 3; j++) {
            int offset = i * 0x40 + j * 0x10;

            CpuCopy16(
                Img_EkrGaugeNumber + gEkrGaugeDecoder[i * 3 + j] * 0x10,
                Buf_EkrGaugeNumImg + offset,
                0x10 * sizeof(u16));
        }
    }

    RegisterDataMove(Buf_EkrGaugeNumImg + 0x00, OBJ_VRAM0 + VRAMOFF_OBJ_EKRGAUGE_NUM_L, 0x180);
    RegisterDataMove(Buf_EkrGaugeNumImg + 0xC0, OBJ_VRAM0 + VRAMOFF_OBJ_EKRGAUGE_NUM_R, 0x180);

    InitIcons();
    ApplyIconPalette(0, 0x10 + OBPAL_EFX_ITEM_L);
    ApplyIconPalette(0, 0x10 + OBPAL_EFX_ITEM_R);

    PutIconObjImg(GetItemIcon(gpEkrBattleUnitLeft->weapon_before),  OAM2_CHR(VRAMOFF_OBJ_EKRGAUGE_ICON_L / 0x20));
    PutIconObjImg(GetItemIcon(gpEkrBattleUnitRight->weapon_before), OAM2_CHR(VRAMOFF_OBJ_EKRGAUGE_ICON_R / 0x20));
    ApplyObPalette(Pal_SystemObjects, OBPAL_EFX_SYSTEM_OBJ);
}

void EndEkrGauge(void)
{
    Proc_End(gpProcEkrGauge);
}

void EkrGauge_Clr4C50(void)
{
    gpProcEkrGauge->unk4C = 0;
    gpProcEkrGauge->unk50 = 0;
}

void EkrGauge_Set4C50(void)
{
    gpProcEkrGauge->unk4C = 1;
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_Set4C(void)
{
    gpProcEkrGauge->unk4C = 1;
}

void EkrGauge_Set50(void)
{
    gpProcEkrGauge->unk50 = 1;
}

void EkrGauge_Setup44(u16 val)
{
    gpProcEkrGauge->unk44 = val * 0x400;
}

void EkrGauge_Clr323A(i16 x, i16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = false;
}

void EkrGauge_Setxy323A(i16 x, i16 y)
{
    gpProcEkrGauge->unk32 = x;
    gpProcEkrGauge->unk3A = y;
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_SetInitFlag(void)
{
    gpProcEkrGauge->battle_init = true;
}

void EkrGauge_ClrInitFlag(void)
{
    gpProcEkrGauge->battle_init = false;
}

void EnableEkrGauge(void)
{
    gpProcEkrGauge->valid = true;
}

void DisableEkrGauge(void)
{
    gpProcEkrGauge->valid = false;
}
