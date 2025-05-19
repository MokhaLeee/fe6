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

void func_fe6_08043980(struct Anim * anim, int a, int b)
{
    if (a > 0)
    {
        if (b != 1)
        {
            unsigned int temp = 1;

            if (b < temp)
            {
                anim->sprData = gUnk_085CB688;
                return;
            }
        }
        else
        {
            anim->sprData = gUnk_085CB6A0;
            return;
        }

        anim->sprData = gUnk_085CB6B8;
    }
    else
    {
        if (b != 1)
        {
            unsigned int temp = 1;

            if (b < temp)
            {
                anim->sprData = gUnk_085CB6D0;
                return;
            }
        }
        else
        {
            anim->sprData = gUnk_085CB6E8;
            return;
        }

        anim->sprData = gUnk_085CB700;
    }
}

#define gBg0Tm2D ((u16 (*)[1])gBg0Tm)

#if 0
void ekrGaugeMain(struct ProcEkrGauge * proc)
{
    struct Anim AStack_130;
    u16 auStack_e8[12];
    u16 local_d0[4];
    struct BaSpriteData auStack_c8[8];
    i16 r7_;
    i16 r6_;
    i16 r8_;
    i16 sp_d4;
    int spD8;
    int spDC;
    int x;
    int y;
    int clk;
    i16 uVar8;
    i16 sVar16;
    i16 sVar5;
    i16 uVar15;

    spD8 = 0;
    clk = DivRem(GetGameClock() / 8, 3);

    if (proc->valid == 1)
        return;

    if (proc->battle_init == 0) {
        i16 r4;
        int r6, r7, r8, r9;

        r4 = proc->unk3A >> 3;
        r7 = (r4 << 5) + 0x1A0;

        if (r7 < 0)
            r7 = 0;

        r6 = r4 + 7;
        if (r6 > 7)
            r6 = 7;

        r8 = (7 - r6) * 30;

        switch (gEkrDistanceType) {
        case 0:
        case 1:
        case 2:
            r9 = 0;
            spDC = 15;

            break;

        case 3:
        case 4:
        default:
            spDC = 8;
            r9 = 8;

            break;
        }

        FillBGRect(gBg0Tm + 0x1A0, 30, 8, 0, 0x80);

        if (0 == proc->unk4C) {
            EfxTmCpyBG(gUnk_08112AD0 + r8, &gBg0Tm2D[r7][r9], 15, r6, -1, -1);
            func_fe6_0805B01C(&gBg0Tm2D[r7][r9], 15, r6, 2, 0x80);
        }

        if (0 == proc->unk50) {
            void * ptr;
            
            if (0 == proc->unk4C)
                ptr = gUnk_08112BA4 + r8;
            else
                ptr = gUnk_08112BA4 + r8;

            EfxTmCpyBG(ptr, &gBg0Tm2D[r7][spDC], 16, r6, -1, -1);
            func_fe6_0805B01C(&gBg0Tm2D[r7][spDC], 16, r6, 3, 128);
        }

        EnableBgSync(1);
    }

    if (gEkrGaugeHpBak[0] != gEkrGaugeHp[0])
        spD8 = 1;

    if (gEkrGaugeHpBak[1] != gEkrGaugeHp[1])
        spD8 = 1;

    gEkrGaugeHpBak[0] = gEkrGaugeHp[0];
    gEkrGaugeHpBak[1] = gEkrGaugeHp[1];

    r7_ = gEkrGaugeHp[0];
    r6_ = gBanimMaxHP[0];
    r8_ = gEkrGaugeHp[1];
    sp_d4 = gBanimMaxHP[1];

    switch (gEkrDistanceType) {
        case 3:
            if (gBanimValid[0] == 1) {
                x = proc->unk32 + 0x38;
            } else {
                x = proc->unk32 - 0x38;
            }
            break;

        case 0:
        case 1:
        case 2:
            x = proc->unk32;
            break;

        case 4:
        default:
            x = proc->unk32 - 0x38;
            break;
    }


    if (proc->battle_init == 0) {
        y = proc->unk3A & 0xFFF8;
    } else {
        y = proc->unk3A;
    }

    local_d0[0] = Div(gEkrGaugeHp[0], 10);
    local_d0[1] = gEkrGaugeHp[0] - local_d0[0] * 10;

    if (local_d0[0] == 0) {
        local_d0[0] = 0xb;
    }

    local_d0[2] = Div(gEkrGaugeHp[1], 10);
    local_d0[3] = gEkrGaugeHp[1] - local_d0[2] * 10;

    if (local_d0[2] == 0) {
        local_d0[2] = 0xb;
    }

    if (gEkrGaugeHp[0] > 0x50) {
        local_d0[0] = 0xc;
        local_d0[1] = 0xc;
    }

    if (gEkrGaugeHp[1] > 0x50) {
        local_d0[2] = 0xc;
        local_d0[3] = 0xc;
    }

    if (spD8 == 1) {
        int i;
        int j;

        CpuFastFill(0, gUnk_Banim_02016DC0, 0x80);

        for (i = 0; i < 2; i++) {
            for (j = 0; j < 2; j++) {
                CpuCopy16(
                    Img_EkrGaugeNumber + local_d0[i * 2 + j] * 0x10,
                    gUnk_Banim_02016DC0 + ((i * 0x20) + (j * 0x10)),
                    0x20
                );
            }
        }

        RegisterDataMove(gUnk_Banim_02016DC0 + 0x00, (void *)0x060139C0, 0x40);
        RegisterDataMove(gUnk_Banim_02016DC0 + 0x20, (void *)0x06013DC0, 0x40);
    }

    AStack_130.oam2 = 0x000051CE;
    AStack_130.oam2 |= proc->unk44;
    
    AStack_130.xPosition = x + 9;
    AStack_130.yPosition = y + 0x91;
    AStack_130.flags2 = 0;

    if (CheckEkrHitNow(0) != 1) {
        AStack_130.sprData = gUnk_085CB5B0;
        AStack_130.oam01 = 0;
    } else {
        AStack_130.sprData = auStack_c8;
        AStack_130.oam01 = 0x200;
        AStack_130.xPosition = AStack_130.xPosition - 8;
        AStack_130.yPosition = AStack_130.yPosition - 8;
        BanimUpdateSpriteRotScale(gUnk_085CB5B0, auStack_c8, 0x100, 0x80, 1);
    }

    if (proc->unk4C == 0) {
        BasPutOam(&AStack_130);
    }

    AStack_130.oam01 = 0;
    
    AStack_130.oam2 = 0x0000C1EE;
    AStack_130.oam2 |= proc->unk44;
    
    AStack_130.xPosition = x + 0x81;
    AStack_130.yPosition = y + 0x91;
    AStack_130.flags2 = 0;

    if (CheckEkrHitNow(1) != 1) {
        AStack_130.sprData = gUnk_085CB5B0;
        AStack_130.oam01 = 0;
    } else {
        AStack_130.sprData = auStack_c8;
        AStack_130.oam01 = 0x200;
        AStack_130.xPosition = AStack_130.xPosition - 8;
        AStack_130.yPosition = AStack_130.yPosition - 8;
        BanimUpdateSpriteRotScale(gUnk_085CB5B0, auStack_c8, 0x100, 0x80, 1);
    }

    if (proc->unk50 == 0) {
        BasPutOam(&AStack_130);
    }

    uVar15 = (r7_ - 0x28);
    uVar8 = (r6_ - 0x28);
    sVar16 = (r7_);
    sVar5 = (r6_);
        
    if (uVar15 > 0x28) {
        uVar15 = 0x28;
    }
    
    if (uVar8 > 0x28) {
        uVar8 = 0x28;
    }
    
    if ((uVar15) < 0) {
        uVar15 = 0;
    }
    
    if ((uVar8) < 0) {
        uVar8 = 0;
    }
    
    if ((sVar16) > 0x28) {
        sVar16 = 0x28;
    }
    
    if (sVar5 > 0x28) {
        sVar5 = 0x28;
    }

    AStack_130.oam2 = 0xb000;
    AStack_130.oam2 |= proc->unk44;
    
    AStack_130.oam01 = 0;
    AStack_130.xPosition = x + 0x1d;
    AStack_130.sprData = gUnk_085CB580;

    if (proc->unk4C == 0) {
        if (uVar8 != 0) {
            func_fe6_0805B380(auStack_e8, uVar15, uVar8);
            if (spD8 == 1) {
                func_fe6_080435EC(auStack_e8, gUnk_Banim_02016E40);
            }
            
            AStack_130.yPosition = y + 0x8e;
            AStack_130.oam2 &= 0xfc00;
            AStack_130.oam2 |= 0;
            AStack_130.flags2 = 0;
            
            BasPutOam(&AStack_130);
        }
        
        func_fe6_0805B380(auStack_e8, sVar16, sVar5);
        
        if (spD8 == 1) {
            func_fe6_080435EC(auStack_e8, gUnk_Banim_02017240);
        }

        if (uVar8 != 0) {
            AStack_130.yPosition = y + 0x95;
        } else {
            AStack_130.yPosition = y + 0x91;
        }

        AStack_130.oam2 &= 0xfc00;
        AStack_130.oam2 |= 0x20;
        AStack_130.flags2 = 0;
        
        BasPutOam(&AStack_130);
    }

    uVar15 = (r8_ - 0x28);
    uVar8 = (sp_d4 - 0x28);
    sVar16 = (r8_);
    sVar5 = (sp_d4);
    
    if (uVar15 > 0x28) {
        uVar15 = 0x28;
    }

    if (uVar8 > 0x28) {
        uVar8 = 0x28;
    }
    
    if ((uVar15) < 0) {
        uVar15 = 0;
    }
    
    if ((uVar8) < 0) {
        uVar8 = 0;
    }
    
    if (sVar16 > 0x28) {
        sVar16 = 0x28;
    }
    
    if (sVar5 > 0x28) {
        sVar5 = 0x28;
    }

    AStack_130.oam2 = 0xc000;
    AStack_130.oam2 |= proc->unk44;
    
    AStack_130.oam01 = 0;
    AStack_130.xPosition = x + 0x95;
    AStack_130.sprData = gUnk_085CB580;

    if (proc->unk50 == 0) {
        if (uVar8 != 0) {
            func_fe6_0805B380(auStack_e8, uVar15, uVar8);
            if (spD8 == 1) {
                func_fe6_080435EC(auStack_e8, gUnk_Banim_02017040);
            }
            
            AStack_130.yPosition = y + 0x8e;
            AStack_130.oam2 &= 0xfc00;
            AStack_130.oam2 |= 0x10;
            AStack_130.flags2 = 0;
            
            AnimDisplay(&AStack_130);
        }

        func_fe6_0805B380(auStack_e8, sVar16, sVar5);
        
        if (spD8 == 1) {
            func_fe6_080435EC(auStack_e8, gUnk_Banim_02017448);
        }
        
        if (uVar8 != 0) {
            AStack_130.yPosition = y + 0x95;
        } else {
            AStack_130.yPosition = y + 0x91;
        }
        
        AStack_130.oam2 &= 0xfc00;
        AStack_130.oam2 |= 0x30;
        AStack_130.flags2 = 0;
        
        AnimDisplay(&AStack_130);
    }

    if (spD8 == 1) {
        RegisterDataMove((void *)gUnk_Banim_02016E48, (void *)0x06013000, 0x800);
    }

    if (proc->unk4C == 0) {
        AStack_130.oam01 = 0;
        AStack_130.sprData = gUnknown_085B9424;
        AStack_130.oam2 = 0x0000B1D0;
        AStack_130.oam2 |= proc->unk44;
        
        AStack_130.xPosition = x + 0x12;
        AStack_130.yPosition = y + 0x70;
        AStack_130.flags2 = 0;
        AnimDisplay(&AStack_130);
        AStack_130.oam01 = 0;
        
        AStack_130.sprData = gUnknown_085B949C;
        AStack_130.oam2 = 0x0000B1C0;
        AStack_130.oam2 |= proc->unk44;
        
        AStack_130.xPosition = x + 0x65;
        AStack_130.yPosition = y + 0x78;
        AStack_130.flags2 = 0;
        AnimDisplay(&AStack_130);
    }

    if (proc->unk50 == 0) {
        AStack_130.oam01 = 0;
        AStack_130.sprData = gUnknown_085B9424;
        AStack_130.oam2 = 0x0000C1F0;
        AStack_130.oam2 |= proc->unk44;
        
        AStack_130.xPosition = x + 0xd8;
        AStack_130.yPosition = y + 0x70;
        AStack_130.flags2 = 0;
        AnimDisplay(&AStack_130);

        AStack_130.oam01 = 0;
        AStack_130.sprData = gUnknown_085B94F0;
        AStack_130.oam2 = 0x0000C1C0;
        AStack_130.oam2 |= proc->unk44;
        
        AStack_130.xPosition = x + 0x87;
        AStack_130.yPosition = y + 0x78;
        AStack_130.flags2 = 0;
        AnimDisplay(&AStack_130);
    }

    if (proc->unk4C == 0) {
        AStack_130.oam01 = 0;
        if (gBanimWtaBonus[0] != 0) {
            sub_8051238((void*)&AStack_130, gBanimWtaBonus[0], clk);
            AStack_130.oam2 = 0x1ca;
            AStack_130.oam2 |= proc->unk44;
            
            AStack_130.xPosition = x + 0x36;
            AStack_130.yPosition = y + 0x79;
            AStack_130.flags2 = 0;
            AnimDisplay(&AStack_130);
        }

        AStack_130.sprData = gUnknown_085B9544;
        AStack_130.oam2 = 0x0000D1DC;
        AStack_130.oam2 |= proc->unk44;
        
        AStack_130.xPosition = x + 0x2c;
        AStack_130.yPosition = y + 0x79;
        AStack_130.flags2 = 0;
        AnimDisplay(&AStack_130);
    }
    
    if (proc->unk50 == 0) {
        AStack_130.oam01 = 0;
        if (gBanimWtaBonus[1] != 0) {
            
            sub_8051238((void*)&AStack_130, gBanimWtaBonus[1], clk);
            AStack_130.oam2 = 0x1ca;
            AStack_130.oam2 |= proc->unk44;
            
            AStack_130.xPosition = x + 0x85;
            AStack_130.yPosition = y + 0x79;
            AStack_130.flags2 = 0;
            AnimDisplay(&AStack_130);
        }
        
        AStack_130.sprData = gUnknown_085B9544;
        AStack_130.oam2 = 0x0000E1DE;
        AStack_130.oam2 |= proc->unk44;
        
        AStack_130.xPosition = x + 0x7b;
        AStack_130.yPosition = y + 0x79;
        AStack_130.flags2 = 0;
        AnimDisplay(&AStack_130);
    }
}
#endif
