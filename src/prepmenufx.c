#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "bm.h"
#include "chapterinfo.h"
#include "prepscreen.h"

void PrepMenuFade_Init(struct ProcPrepFade * proc)
{
    int i;
    u16 * src, * dst;

    proc->timer = 0;

    src = gPal;
    dst = gPrepFadePal;

    for (i = 0x200; i != 0; i--)
    {
        *dst = *src;
        src++;
        dst++;
    }
}

void PrepMenuFadeOut_Loop(struct ProcPrepFade * proc)
{
    #define SCALE 0x10
    int i;
    u8 coef = proc->timer;

    SetDispEnable(1, 1, 1, 1, 1);

    for (i = 0; i < 0x200; i++)
    {
        int b_scaled = (gPrepFadePal[i] & RGB5_MASK_B) * coef;
        int b_out = (b_scaled / SCALE) & RGB5_MASK_B;

        int g_scaled = (gPrepFadePal[i] & RGB5_MASK_G) * coef;
        int g_out = (g_scaled / SCALE) & RGB5_MASK_G;

        int r_scaled = (gPrepFadePal[i] & RGB5_MASK_R) * coef;
        int r_out = (r_scaled / SCALE) & RGB5_MASK_R;

        gPal[i] = b_out | g_out | r_out;
    }

    EnablePalSync();
    proc->timer++;
    if (coef == 0x10)
        Proc_Break(proc);

    #undef SCALE
}

void PrepMenuFadeIn_Loop(struct ProcPrepFade * proc)
{
    #define SCALE 0x10
    int i;
    u8 coef = 0x10 - proc->timer;

    for (i = 0; i < 0x200; i++)
    {
        int b_scaled = (gPrepFadePal[i] & RGB5_MASK_B) * coef;
        int b_out = (b_scaled / SCALE) & RGB5_MASK_B;

        int g_scaled = (gPrepFadePal[i] & RGB5_MASK_G) * coef;
        int g_out = (g_scaled / SCALE) & RGB5_MASK_G;

        int r_scaled = (gPrepFadePal[i] & RGB5_MASK_R) * coef;
        int r_out = (r_scaled / SCALE) & RGB5_MASK_R;

        gPal[i] = b_out | g_out | r_out;
    }

    EnablePalSync();
    proc->timer++;
    if (coef == 0)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        Proc_Break(proc);
    }

    #undef SCALE
}

struct ProcScr CONST_DATA ProcScr_PrepMenuFadeOut[] =
{
    PROC_19,
    PROC_CALL(PrepMenuFade_Init),
    PROC_REPEAT(PrepMenuFadeOut_Loop),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_PrepMenuFadeIn[] =
{
    PROC_19,
    PROC_CALL(PrepMenuFade_Init),
    PROC_REPEAT(PrepMenuFadeIn_Loop),
    PROC_END,
};

void StartPrepMenuFadeOut(ProcPtr proc)
{
    SpawnProcLocking(ProcScr_PrepMenuFadeOut, proc);
}

void StartPrepMenuFadeIn(ProcPtr proc)
{
    SpawnProcLocking(ProcScr_PrepMenuFadeIn, proc);
}

void func_fe6_0807B8B0(struct PrepMenuCursorProc * proc, int idx)
{
    u8 _idx = idx;

    if (proc->pre != _idx)
        proc->pre = _idx;

    proc->unk_44 = TRUE;
}

void func_fe6_0807B8CC(struct PrepMenuCursorProc * proc, fu8 x, fu8 y, int chidx)
{
    proc->cursor_x = x;
    proc->cursor_y = y;
    proc->chidx = chidx;
    proc->disp_x = GetChapterInfo(gPlaySt.chapter)->gmap_dispx;
    proc->disp_y = GetChapterInfo(gPlaySt.chapter)->gmap_dispy;
}
