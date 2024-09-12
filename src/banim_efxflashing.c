#include "prelude.h"
#include "proc.h"
#include "util.h"
#include "hardware.h"
#include "banim_sprite.h"
#include "banim.h"
#include "banim_ekrdragon.h"

struct ProcScr CONST_DATA ProcScr_EfxFlashBG[] =
{
    PROC_NAME_DEBUG("efxFlashBG"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxFlashBg_Loop),
    PROC_REPEAT(EfxFlashRestorePalSync),
    PROC_END,
};

void NewEfxFlashBgWhite(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = SpawnProc(ProcScr_EfxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(-1, gEfxPal, PLTT_SIZE);
}

void NewEfxFlashBgRed(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = SpawnProc(ProcScr_EfxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(0x001F001F, gEfxPal, PLTT_SIZE);
}

void EfxFlashBg_Loop(struct ProcEfxFlashing * proc)
{
    /**
     * Disable the normal palette sync and use the non-cache buffer
    */
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    if (++proc->timer >= proc->terminator)
        Proc_Break(proc);
}

void EfxFlashRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePalSync();
    Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxWhiteIN[] =
{
    PROC_NAME_DEBUG("efxWhiteIN"),
    PROC_REPEAT(EfxWhiteIn_Loop1),
    PROC_REPEAT(EfxWhiteIn_Loop2),
    PROC_REPEAT(EfxBlackInRestorePalSync),
    PROC_END,
};

void NewEfxWhiteIN(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    proc = SpawnProc(ProcScr_EfxWhiteIN, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    proc->terminator2 = duartion2;
}

void EfxWhiteIn_Loop1(struct ProcEfxFlashing * proc)
{
    CpuFastCopy(gPal, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxWhiteIn_Loop2(struct ProcEfxFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x0, proc->timer, proc->terminator2);
    CpuFastCopy(gPal, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePalSync();

    if (++proc->timer > proc->terminator2)
        Proc_Break(proc);
}

void EfxBlackInRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePalSync();
    Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxFlashHpBar[] =
{
    PROC_NAME_DEBUG("efxFlashHPBar"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxFlashHpBar_Pause),
    PROC_REPEAT(EfxFlashHpBar_Loop),
    PROC_REPEAT(EfxFlashHpBar_RestorePal),
    PROC_END,
};

void NewEfxFlashHpBar(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    u16 _duartion = duartion;
    u16 _duartion2 = duartion2;

    proc = SpawnProc(ProcScr_EfxFlashHpBar, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = _duartion;
    proc->terminator2 = _duartion2;

    /* ? */
    if (_duartion == 0)
        Proc_Break(proc);
}

void EfxFlashHpBar_Pause(struct ProcEfxFlashing * proc)
{
    if (++proc->timer >= proc->terminator)
        Proc_Break(proc);
}

void EfxFlashHpBar_Loop(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == POS_L)
    {
        CpuCopy16(gPalEfxHpBarGreen, gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_L), 0x20);
    }
    else
    {
        CpuCopy16(gPalEfxHpBarGreen, gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_R), 0x20);
    }

    EnablePalSync();

    if (++proc->timer >= proc->terminator2)
        Proc_Break(proc);
}

void EfxFlashHpBar_RestorePal(struct ProcEfxFlashing * proc)
{
    if (GetAnimPosition(proc->anim) == POS_L)
    {
        CpuCopy16(
            gPalEfxHpBarPurple + PAL_OFFSET(gBanimFactionPal[POS_L]),
            gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_L),
            0x20);
    }
    else
    {
        CpuCopy16(
            gPalEfxHpBarPurple + PAL_OFFSET(gBanimFactionPal[POS_R]),
            gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_R),
            0x20);
    }

    EnablePalSync();
    Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxHpBarColorChange[] =
{
    PROC_NAME_DEBUG("efxHPBarColorChange"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxHpBarColorChange_Loop),
    PROC_END,
};

void NewEfxHpBarColorChange(struct Anim * anim)
{
    static const u16 frame_conf[] = {
        0x01, 0x02,
        0x02, 0x02,
        0x03, 0x02,
        0x04, 0x02,
        0x05, 0x0A,
        0x04, 0x02,
        0x03, 0x02,
        0x02, 0x02,
        0x01, 0x02,
        0x00, 0x0A,
        -2
    };

    struct ProcEfxHpBarColorChange * proc;
    gpProcEfxHpBarColorChange = proc = SpawnProc(ProcScr_EfxHpBarColorChange, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_conf = frame_conf;
    proc->frame_state = 0;
    proc->disabled = false;

    EfxSplitColor(
        gPalEfxHpBarPurple + gBanimFactionPal[POS_L] * 0x10,
        gEfxSplitedColorBufA[0],
        0x10);

    EfxSplitColor(
        Pal_081134C4 + gBanimFactionPal[POS_L] * 0x10,
        gEfxSplitedColorBufB[0],
        0x10);

    func_fe6_0805B88C(
        gEfxSplitedColorBufA[0],
        gEfxSplitedColorBufB[0],
        gEfxSplitedColorBufC[0],
        0x10, 5);

    EfxSplitColor(
        gPalEfxHpBarPurple + gBanimFactionPal[POS_R] * 0x10,
        gEfxSplitedColorBufA[1],
        0x10);

    EfxSplitColor(
        Pal_081134C4 + gBanimFactionPal[POS_R] * 0x10,
        gEfxSplitedColorBufB[1],
        0x10);

    func_fe6_0805B88C(
        gEfxSplitedColorBufA[1],
        gEfxSplitedColorBufB[1],
        gEfxSplitedColorBufC[1],
        0x10, 5);
}

void EndEfxHPBarColorChange(void)
{
    Proc_End(gpProcEfxHpBarColorChange);
}

void DisableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = true;
}

void EnableEfxHpBarColorChange(void)
{
    gpProcEfxHpBarColorChange->disabled = false;
}

void EfxHpBarColorChange_Loop(struct ProcEfxHpBarColorChange * proc)
{
    int ret;

    if (proc->disabled == true)
        return;

    ret = EfxAdvanceFrameLut(&proc->timer, (i16 *)&proc->frame, proc->frame_conf);
    if (ret >= 0)
        proc->frame_state = ret;

    EfxDecodeSplitedPalette(
        gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_L),
        gEfxSplitedColorBufA[0],
        gEfxSplitedColorBufB[0],
        gEfxSplitedColorBufC[0],
        0x10,
        proc->frame_state,
        5
    );

    EfxDecodeSplitedPalette(
        gPal + OBPAL_OFFSET(OBPAL_EFXHPBAR_R),
        gEfxSplitedColorBufA[1],
        gEfxSplitedColorBufB[1],
        gEfxSplitedColorBufC[1],
        0x10,
        proc->frame_state,
        5
    );

    EnablePalSync();
}

struct ProcScr CONST_DATA ProcScr_EfxFlashUnit[] =
{
    PROC_NAME_DEBUG("efxFlashUnit"),
    PROC_MARK(PROC_MARK_PAL_CHG),
    PROC_REPEAT(EfxFlashUnit_Loop),
    PROC_REPEAT(EfxFlashUnit_RestorePal),
    PROC_END,
};

void NewEfxFlashUnit(struct BaSprite * anim, u16 dura1, u16 dura2, int flag)
{
    struct ProcEfxFlashing * proc = SpawnProc(ProcScr_EfxFlashUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = dura1;
    proc->terminator2 = dura2;
    proc->flag = flag;
}

void EfxFlashUnit_Loop(struct ProcEfxFlashing * proc)
{
    u32 ret = GetEkrDragonStateType();

    if (++proc->timer < proc->terminator)
        return;

    if (GetAnimPosition(proc->anim) == POS_L)
    {
        CpuFastCopy(Pal_BanimUnitFlashing, gPal + OBPAL_OFFSET(OBPAL_EFX_UNIT_L), 0x20);

        if (proc->flag == 0)
        {
            if (ret & EDRAGON_TYPE_MANAKETE_L)
                EfxBodyFlashingForDragon(POS_L);

            if (ret & EDRAGON_TYPE_IDUNN_L)
                EfxBodyFlashingForDragon(POS_L);
        }
    }
    else
    {
        CpuFastCopy(Pal_BanimUnitFlashing, gPal + OBPAL_OFFSET(OBPAL_EFX_UNIT_R), 0x20);

        if (proc->flag == 0)
        {
            if (ret & EDRAGON_TYPE_MANAKETE_R)
                EfxBodyFlashingForDragon(POS_R);

            if (ret & EDRAGON_TYPE_IDUNN_R)
                EfxBodyFlashingForDragon(POS_R);
        }
    }

    EnablePalSync();

    if (proc->timer >= proc->terminator2)
        Proc_Break(proc);
}

void EfxFlashUnit_RestorePal(struct ProcEfxFlashing * proc)
{
    u32 ret = GetEkrDragonStateType();

    if (GetAnimPosition(proc->anim) == POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[POS_L], gPal + OBPAL_OFFSET(OBPAL_EFX_UNIT_L), 0x20);

        if (proc->flag == 0)
        {
            if (ret & EDRAGON_TYPE_MANAKETE_L)
                RestoreBodyFlashingPalForManakete(POS_L);

            if (ret & EDRAGON_TYPE_IDUNN_L)
                RestoreBodyFlashingPalForIdunn(POS_L);
        }
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[POS_R], gPal + OBPAL_OFFSET(OBPAL_EFX_UNIT_R), 0x20);

        if (proc->flag == 0)
        {
            if (ret & EDRAGON_TYPE_MANAKETE_R)
                RestoreBodyFlashingPalForManakete(POS_R);

            if (ret & EDRAGON_TYPE_IDUNN_R)
                RestoreBodyFlashingPalForIdunn(POS_R);
        }
    }
    EnablePalSync();
    Proc_Break(proc);
}

const u16 gFrameLut_EfxStatusUnit[] = {
    0x00, 0x14,
    0x04, 0x06,
    0x08, 0x05,
    0x0C, 0x06,
    0x10, 0x14,
    0x0C, 0x06,
    0x08, 0x05,
    0x04, 0x06,
    -2
};
