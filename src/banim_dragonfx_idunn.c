#include "prelude.h"
#include "proc.h"
#include "util.h"
#include "hardware.h"

#include "banim_sprite.h"
#include "banim.h"
#include "banim_data.h"
#include "banim_ekrbattle.h"
#include "banim_ekrdragon.h"

struct ProcScr CONST_DATA ProcScr_EkrDragonIdunn[] =
{
    PROC_19,
    PROC_REPEAT(EkrIdunn_BgFadeIn),
    PROC_REPEAT(EkrIdunn_InitBanimfx),
    PROC_REPEAT(EkrIdunn_InitBodyfx),
    PROC_REPEAT(EkrIdunn_PreMainBodyIntro),
    PROC_REPEAT(func_fe6_0805A000),
    PROC_REPEAT(func_fe6_0805A0BC),
    PROC_REPEAT(func_fe6_0805A140),
    PROC_REPEAT(func_fe6_0805A228),
    PROC_REPEAT(func_fe6_0805A270),
    PROC_REPEAT(func_fe6_0805A2BC),
    PROC_REPEAT(func_fe6_0805A35C),
    PROC_REPEAT(func_fe6_0805A394),
    PROC_REPEAT(func_fe6_0805A3EC),
    PROC_END,
};

void NewEkrDragonIdunn(struct BaSprite * anim)
{
    struct ProcEkrDragon * proc;

    EkrDragonProcs[GetAnimPosition(anim)] = proc = SpawnProc(ProcScr_EkrDragonIdunn, PROC_TREE_3);;
    gEkrDragonState[GetAnimPosition(anim)] = DRAGON_STATE_1;

    proc->anim = anim;
    proc->timer = 0;
}

void EkrIdunn_BgFadeIn(struct ProcEkrDragon * proc)
{
    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));

    if (++proc->timer == 0x9)
        Proc_Break(proc);
}

void EkrIdunn_InitBanimfx(struct ProcEkrDragon * proc)
{
    struct BaSprite * animf, * animr;

    EkrPrepareBanimfx(proc->anim, 0x74);

    animf = MAIN_ANIM_FRONT(POS_L);
    animr = MAIN_ANIM_BACK(POS_L);

    gEkrXPosReal[POS_L] = gEkrXPosBase[POS_L] + 0x54;
    animf->xPosition = gEkrXPosBase[POS_L] + 0x54 - gEkrBgPosition;
    animr->xPosition = gEkrXPosReal[POS_L] - gEkrBgPosition;

    if (CheckEkrDragonFarFar(proc->anim) != TRUE)
    {
        gEkrDragonDeamonProcs[POS_L] = StartEkrIdunnDeamon(proc->anim);
        gEkrDragonDeamonProcs[POS_L]->x_hi = gEkrXPosBase[POS_L] - (gEkrBgPosition - 0x4E);
        gEkrDragonDeamonProcs[POS_L]->y_hi = 0x50;
    }
    proc->timer = 0;
    Proc_Break(proc);
}

void EkrIdunn_InitBodyfx(struct ProcEkrDragon * proc)
{
    LZ77UnCompVram(Img_EkrIdunn_081C1C94, (void *)BG_VRAM + 0x8000);
    LZ77UnCompWram(Tsa_EkrIdunn_081C5AAC, gEkrTsaBuffer);

    EfxTmFill(0x001F001F);
    TmFill(gBg3Tm, 0x1F);
    EnableBgSync(BG3_SYNC_BIT);

    CpuFastCopy(Pal_081C4DE8, gPal + BGPAL_OFFSET(6), 0x20);

    CpuFastCopy(gPal + BGPAL_OFFSET(6), gEkrBgPaletteBackup1, 0x20);
    CpuFastCopy(gPal + OBPAL_OFFSET(7), gEkrBgPaletteBackup2, 0x20);
    CpuFastCopy(gPal + BGPAL_OFFSET(4), gEkrBgPaletteBackup3, 0x40);

    CpuFastFill16(0, gPal + BGPAL_OFFSET(6), 0x20);
    EnablePalSync();
    Proc_Break(proc);
}

void EkrIdunn_PreMainBodyIntro(struct ProcEkrDragon * proc)
{
    struct ProcEkrDragonDeamon * procfx = gEkrDragonDeamonProcs[POS_L];

    if (CheckEkrDragonFarFar(proc->anim) == TRUE)
    {
        Proc_Break(proc);
        return;
    }

    procfx->x = Interpolate(
        INTERPOLATE_SQUARE,
        procfx->x_hi + 0x30,
        procfx->x_hi,
        proc->timer,
        16);

    procfx->y = Interpolate(
        INTERPOLATE_SQUARE,
        procfx->y_hi - 0x80,
        procfx->y_hi,
        proc->timer,
        16);

    if (++proc->timer == 0x11)
    {

        CpuFastCopy(gEkrBgPaletteBackup1, gPal + BGPAL_OFFSET(6), 0x20);
        CpuFastCopy(gEkrBgPaletteBackup2, gPal + OBPAL_OFFSET(7), 0x20);
        func_fe6_08058FA8(Tsa_EkrIdunn_081C4E28);
        NewEfxWhiteOUT(proc->anim, 3, 100);
        EfxPlaySE(0x13F, 0x100);
        M4aPlayWithPostionCtrl(0x13F, proc->anim->xPosition, 1);

        /* ? */
        procfx = NewEfxQuake(6);
        procfx->y_hi = 0x72;

        Proc_Break(proc);
    }
}
