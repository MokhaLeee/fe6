#include "prelude.h"
#include "oam.h"
#include "hardware.h"
#include "util.h"
#include "oam.h"
#include "sprite.h"
#include "bm.h"
#include "bmio.h"
#include "event.h"
#include "worldmap.h"

u16 CONST_DATA Sprite_0868C2CC[] = {
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
};

u16 CONST_DATA Sprite_0868C2D4[] = {
    1,
    OAM0_SHAPE_16x16 + OAM0_Y(252) + OAM0_AFFINE_ENABLE, OAM1_SIZE_16x16 + OAM1_X(508), 0,
};

u8 CONST_DATA * Pals_0868C2DC[10] = {
    Pal_Wm_082C8874,
    Pal_Wm_082D1BA0,
    Pal_Wm_082AADA4,
    Pal_Wm_082D1964,
    Pal_Wm_082B2380,
    Pal_Wm_082D1964,
    Pal_Wm_082B9E64,
    Pal_Wm_082D1964,
    Pal_Wm_082C1224,
    Pal_Wm_082D1964,
};

u8 * GetCompressedWmPalette(int a, int b)
{
    return Pals_0868C2DC[a * 2 + b];
}

void ApplyCompressedWmPalette(int a, int b)
{
    Decompress(GetCompressedWmPalette(a, b), gBuf);
    ApplyPalettes(gBuf, 0, 0x10);
}

struct ProcScr CONST_DATA ProcScr_WorldMapIntroEvent[] = {
    PROC_SLEEP(1),
    PROC_CALL(StartWmEvent),
    PROC_WHILE(IsEventRunning),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_WorldMap[] = {
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_CALL(LockBmDisplay),
    PROC_YIELD,
    PROC_CALL(func_fe6_080922D8),
    PROC_START_CHILD_LOCKING(ProcScr_WmRotIntro),
    PROC_REPEAT(func_fe6_080923C4),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WhileFadeExists),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(UnlockGame),
    PROC_END,
};

void StartWorldMap(void)
{
    SpawnProc(ProcScr_WorldMap, PROC_TREE_3);
}

void StartWorldMapUnused(void)
{
    SpawnProc(ProcScr_WorldMap, PROC_TREE_3);
}

void func_fe6_080922D8(struct ProcWorldMap * proc)
{
    gDispIo.disp_ct.mode = 4;
    SetDispEnable(0, 0, 1, 0, 1);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    gDispIo.disp_ct.bitmap_frame = 0;

    proc->unk2C = 0;
    proc->unk30 = 0;
    proc->unk34 = 0x3C00;
    proc->unk38 = 0x2800;
    proc->unk44 = 0;
    proc->unk48 = 0x100;
    proc->unk4A = 0x100;
    proc->unk4C = 0;
    proc->unk52 = 0;
    proc->unk4E = 0;
    proc->unk53 = 0;
    proc->unk50 = 0;
    proc->unk54 = 0;

    WmZoomCore(proc->unk2C, proc->unk30, proc->unk34, proc->unk38, proc->unk44, proc->unk48, proc->unk4A);

    ApplyCompressedWmPalette(0, 1);
    Decompress(GetCompressedWmPalette(0, 0), (void *)BG_VRAM);
    ResetWmArrowSt();
}

void func_fe6_080923C4(struct ProcWorldMap * proc) {}

struct ProcScr CONST_DATA ProcScr_WmArrow[] = {
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_ONEND(WmArrow_End),
    PROC_SLEEP(1),
    PROC_CALL(WmArrow_Init),
    PROC_REPEAT(WmArrow_Loop),
    PROC_END,
};

void StartWmArrow(int id, int color, int c, int d, int e, int f)
{
    struct ProcWmArrow * proc;

    proc = SpawnProc(ProcScr_WmArrow, PROC_TREE_3);
    proc->conf = GetFreeWmArrowSt();

    if (proc->conf == NULL)
    {
        Proc_End(proc);
        return;
    }

    proc->conf->busy = true;
    proc->conf->eid = id;
    proc->conf->color = color;
    proc->conf->unk_D4 = c;
    proc->conf->unk_D8 = d;
    proc->conf->unk_0C = e;
    proc->conf->unk_08 = f;
}

void EndWmArrow(void)
{
    Proc_EndEach(ProcScr_WmArrow);
}

bool WmArrowExists(void)
{
    if (FindProc(ProcScr_WmArrow) != NULL)
        return true;

    return false;
}

void WmArrow_End(struct ProcWmArrow * proc)
{
    proc->conf->busy = false;
}

void WmArrow_Init(struct ProcWmArrow * proc)
{
    int i;
    struct WmArrowSt * conf = proc->conf;
    int unk = GetWmArrowCount(GetWmArrowConfigBuf(conf->eid));

    conf->amount = unk;
    conf->unk_14[0] = 0;

    for (i = 0; i < conf->amount; i++)
    {
        conf->unk_74[i] = (func_fe6_08093288(GetWmArrowConfigBuf(conf->eid), i) + conf->unk_D4) * 0x100;
        conf->unk_A4[i] = (func_fe6_080932D8(GetWmArrowConfigBuf(conf->eid), i) + conf->unk_D8) * 0x100;
    }

    for (i = 1; i < conf->amount; i++)
    {
        int arctan;

        int r5 = conf->unk_74[i] - conf->unk_74[i - 1];
        int r4 = conf->unk_A4[i] - conf->unk_A4[i - 1];

        int sqrt = Sqrt(r5 * r5 + r4 * r4);
        conf->unk_14[i] = conf->unk_14[i - 1] + sqrt;
        conf->unk_44[i] = (arctan = ArcTan2(r5, r4)) / 0x3F;
    }

    conf->unk_10 = conf->unk_14[conf->amount - 1];
    conf->unk_03 = conf->unk_10 / conf->unk_08 + 1;

    for (i = 0; i < conf->unk_03; i++)
    {
        conf->unk_244[i] = (conf->unk_0C * i) / (conf->unk_03 - 1);
        conf->unk_DC[i] = 0;
        conf->unk_2E4[i] = 0;
        conf->unk_F0[i] = 0;
    }
}

/* https://decomp.me/scratch/WjMel */
void PutWmArrowSpriteExt(struct WmArrowSt * conf, int idx)
{
    int r0 = OAM2_CHR(conf->unk_294[idx] + 0x20);
    int r2 = r0 >> 6;
    int r3 = (r0 >> 8) << 8;
    int r6 = (r2 & 3) * 2;

    if (idx == (conf->unk_03 - 1))
    {
        int a1;
        register u32 r1 asm("r1");

        DrawWmArrowCore(conf->sprite_index, 0x100, 0x100, r3);

        a1 = OAM2_PAL(conf->color);
        a1 = a1 + 0x310;
        r6 = r6 + a1;

        r1 = conf->x_array[idx];
        r1 = (r1 << 0xF) >> 0x17;
        r1 = r1 | (conf->sprite_index << 9);

        r2 = conf->y_array[idx];
        r2 = (r2 >> 8) & 0xFF;
        r2 = r2 | 0x100;

        PutSpriteExt(
            0xC,
            r1,
            r2,
            Sprite_0868C2D4,
            r6
        );
    }
    else
    {
        int a1;
        register u32 r1 asm("r1");

        a1 = OAM2_PAL(conf->color);
        a1 += 0x323;
        r6 = a1;

        r1 = conf->x_array[idx];
        r1 = ((r1 << 0xF) >> 0x17);

        r2 = ((conf->y_array[idx] >> 8) & 0xFF);

        PutSpriteExt(
            0xC,
            r1,
            r2,
            Sprite_0868C2CC,
            r6
        );
    }
}

void WmArrow_Loop(struct ProcWmArrow * proc)
{
    int i;
    int r6;
    struct WmArrowSt * conf = proc->conf;

    for (i = 0; i < conf->unk_03; i++)
    {
        switch (conf->unk_F0[i]) {
        case 0:
            r6 = conf->unk_DC[i];

            conf->x_array[i] = conf->unk_74[r6];
            conf->y_array[i] = conf->unk_A4[r6];
            conf->unk_294[i] = conf->unk_44[r6 + 1];
            conf->unk_1A4[i] = conf->unk_244[i] * gUnk_08353328[(conf->unk_294[i] + 0x100) & 0x3FF] / 0x8000;
            conf->unk_1F4[i] = conf->unk_244[i] * gUnk_08353328[(conf->unk_294[i]) & 0x3FF] / 0x8000;
            conf->unk_F0[i] = 1;

            /* Fall through */

        case 1:
            PutWmArrowSpriteExt(conf, i);

            r6 = conf->unk_DC[i];

            conf->x_array[i] += conf->unk_1A4[i];
            conf->y_array[i] += conf->unk_1F4[i];
            conf->unk_2E4[i] += conf->unk_244[i];

            if (conf->unk_2E4[i] >= (conf->unk_10 * i / (conf->unk_03 - 1)))
            {
                conf->unk_F0[i] = 99;
            }
            else if (conf->unk_2E4[i] >= conf->unk_14[r6 + 1])
            {
                conf->unk_DC[i]++;
                conf->unk_F0[i] = 0;
            }
            break;

        case 99:
            PutWmArrowSpriteExt(conf, i);                            
            break;

        default:
            break;
        }
    }
}

void ResetWmArrowSt(void)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        gWmArrowSt[i].busy = false;
        gWmArrowSt[i].sprite_index = i;
    }
}

struct WmArrowSt * GetFreeWmArrowSt(void)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        struct WmArrowSt * st = &gWmArrowSt[i];

        if (st->busy == false)
            return st;
    }
    return NULL;
}

struct ProcScr CONST_DATA ProcScr_0868C3AC[] = {
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_REPEAT(func_fe6_0809289C),
    PROC_END,
};

void func_fe6_0809287C(int duration)
{
    struct Proc_0868C3AC * proc;

    proc = SpawnProc(ProcScr_0868C3AC, PROC_TREE_3);
    proc->duration = duration;
    proc->timer = 0;
}

void func_fe6_0809289C(struct Proc_0868C3AC * proc)
{
    proc->timer++;

    if (proc->timer == proc->duration)
        Proc_Break(proc);
}

bool func_fe6_080928C0(void)
{
    if (FindProc(ProcScr_0868C3AC) != NULL)
        return true;

    return false;
}

struct ProcScr CONST_DATA ProcScr_WmZoomTo[] = {
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_SLEEP(1),
    PROC_CALL(WmZoomTo_Init),
    PROC_REPEAT(WmZoomTo_Loop),
    PROC_END,
};

void StartWmZoomTo(int x, int y, ProcPtr parent)
{
    struct ProcWmZoom * proc;

    proc = SpawnProc(ProcScr_WmZoomTo, parent);

    proc->wmproc = FindProc(ProcScr_WorldMap);

    proc->ix = x * 0x100;
    proc->iy = y * 0x100;
}

void WmZoomTo_Init(struct ProcWmZoom * proc)
{
    proc->unk_66 = 0;
    proc->unk_68 = 0;
}

void WmZoomTo_Loop(struct ProcWmZoom * proc)
{
    int ret;
    struct ProcWorldMap * wmproc = proc->wmproc;

    wmproc->camera_x = proc->ix;
    wmproc->camera_y = proc->iy;

    switch (proc->unk_66) {
    case 0:
        func_fe6_08092A9C(wmproc->camera_x, wmproc->camera_y);
        proc->unk_66++;
        proc->unk_68 = 0;
        break;

    case 1:
        ret = Interpolate(INTERPOLATE_RCUBIC, 0x100, 0x200, proc->unk_68, 0x20);

        wmproc->unk4A = ret;
        wmproc->unk48 = ret;

        wmproc->unk34 = wmproc->camera_x + 0xFFFF8800;
        wmproc->unk38 = wmproc->camera_y + 0xFFFFB000;

        proc->unk_68++;
        if (proc->unk_68 == 0x21)
        {
            proc->unk_66++;
            proc->unk_68 = 0;
        }
        break;

    case 2:
        if (1 & proc->unk_68)
        {
            ApplyCompressedWmPalette(1, 1);

            wmproc->unk2C = 0;
            wmproc->unk30 = 0;

            wmproc->unk34 = 0x7800;
            wmproc->unk38 = 0x5000;

            wmproc->unk44 = 0;

            wmproc->unk48 = 0x100;
            wmproc->unk4A = 0x100;

            gDispIo.disp_ct.bitmap_frame = true;
        }
        else
        {
            ApplyCompressedWmPalette(0, 1);

            wmproc->unk2C = 0;
            wmproc->unk30 = 0;

            wmproc->unk34 = wmproc->camera_x + 0xFFFF8800;
            wmproc->unk38 = wmproc->camera_y + 0xFFFFB000;

            wmproc->unk44 = 0;

            wmproc->unk48 = 0x200;
            wmproc->unk4A = 0x200;

            gDispIo.disp_ct.bitmap_frame = false;
        }

        proc->unk_68++;
        if (proc->unk_68 == 8)
            Proc_Break(proc);

        break;
    }

    WmZoomCore(wmproc->unk2C, wmproc->unk30, wmproc->unk34, wmproc->unk38, wmproc->unk44, wmproc->unk48, wmproc->unk4A);
}

NAKEDFUNC
void func_fe6_08092A9C(int x, int y)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, sb\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    sub sp, #0x18\n\
    adds r2, r0, #0\n\
    adds r3, r1, #0\n\
    asrs r0, r2, #8\n\
    adds r2, r0, #0\n\
    subs r2, #0x78\n\
    asrs r0, r3, #8\n\
    adds r3, r0, #0\n\
    subs r3, #0x50\n\
    movs r1, #0xf0\n\
    subs r0, r1, r2\n\
    lsls r0, r0, #0x10\n\
    lsrs r4, r0, #0x10\n\
    mov sb, r4\n\
    asrs r0, r0, #0x10\n\
    subs r1, r1, r0\n\
    lsls r1, r1, #0x10\n\
    lsrs r1, r1, #0x10\n\
    str r1, [sp, #0x14]        @ sp_14 = sb = 0xF0 - r2\n\
    movs r1, #0xa0\n\
    subs r4, r1, r3\n\
    lsls r4, r4, #0x10\n\
    lsrs r5, r4, #0x10\n\
    asrs r4, r4, #0x10\n\
    subs r1, r1, r4\n\
    lsls r1, r1, #0x10\n\
    lsrs r1, r1, #0x10\n\
    mov r8, r1\n\
    adds r0, r0, r2\n\
    subs r0, #0xf0\n\
    lsls r0, r0, #0x10\n\
    lsrs r0, r0, #0x10\n\
    mov sl, r0\n\
    mov r0, r8\n\
    str r0, [sp, #8]\n\
    ldr r1, [sp, #0x14]\n\
    str r1, [sp]\n\
    adds r0, r4, r3\n\
    subs r0, #0xa0\n\
    lsls r0, r0, #0x10\n\
    lsrs r0, r0, #0x10\n\
    str r0, [sp, #0xc]\n\
    mov r2, sl\n\
    str r2, [sp, #4]\n\
    str r0, [sp, #0x10]\n\
    movs r0, #1\n\
    movs r1, #0\n\
    bl GetCompressedWmPalette\n\
    ldr r1, .L08092CD0 @ =0x02000000\n\
    bl Decompress\n\
    movs r2, #0\n\
    cmp r2, r4\n\
    bge .L08092B66\n\
    ldr r4, [sp, #8]\n\
    lsls r0, r4, #0x10\n\
    asrs r7, r0, #0x10\n\
    ldr r1, [sp, #0x14]\n\
    lsls r0, r1, #0x10\n\
    asrs r6, r0, #0x10\n\
.L08092B20:\n\
    lsls r0, r2, #0x10\n\
    asrs r4, r0, #0x10\n\
    lsls r0, r4, #4\n\
    subs r0, r0, r4\n\
    lsls r0, r0, #4\n\
    ldr r2, .L08092CD4 @ =0x0600A000\n\
    adds r3, r0, r2\n\
    adds r1, r7, r4\n\
    lsls r0, r1, #4\n\
    subs r0, r0, r1\n\
    lsls r0, r0, #4\n\
    adds r0, r0, r6\n\
    ldr r1, .L08092CD0 @ =0x02000000\n\
    adds r1, r0, r1\n\
    mov r2, sb\n\
    lsls r0, r2, #0x10\n\
    asrs r0, r0, #0x10\n\
    cmp r0, #0\n\
    bge .L08092B48\n\
    adds r0, #3\n\
.L08092B48:\n\
    lsls r2, r0, #9\n\
    lsrs r2, r2, #0xb\n\
    movs r0, #0x80\n\
    lsls r0, r0, #0x13\n\
    orrs r2, r0\n\
    adds r0, r1, #0\n\
    adds r1, r3, #0\n\
    bl CpuSet\n\
    adds r1, r4, #1\n\
    lsls r1, r1, #0x10\n\
    lsrs r2, r1, #0x10\n\
    lsls r0, r5, #0x10\n\
    cmp r1, r0\n\
    blt .L08092B20\n\
.L08092B66:\n\
    movs r0, #2\n\
    movs r1, #0\n\
    bl GetCompressedWmPalette\n\
    ldr r1, .L08092CD0 @ =0x02000000\n\
    bl Decompress\n\
    lsls r0, r5, #0x10\n\
    movs r2, #0\n\
    adds r5, r0, #0\n\
    mov r4, r8\n\
    lsls r6, r4, #0x10\n\
    cmp r5, #0\n\
    ble .L08092BDE\n\
    mov r1, sb\n\
    lsls r0, r1, #0x10\n\
    asrs r0, r0, #0x10\n\
    ldr r4, .L08092CD4 @ =0x0600A000\n\
    adds r4, r4, r0\n\
    mov r8, r4\n\
    ldr r1, [sp, #8]\n\
    lsls r0, r1, #0x10\n\
    asrs r7, r0, #0x10\n\
.L08092B94:\n\
    lsls r0, r2, #0x10\n\
    asrs r4, r0, #0x10\n\
    lsls r0, r4, #4\n\
    subs r0, r0, r4\n\
    lsls r0, r0, #4\n\
    mov r2, r8\n\
    adds r3, r0, r2\n\
    adds r0, r7, r4\n\
    lsls r1, r0, #4\n\
    subs r1, r1, r0\n\
    lsls r1, r1, #4\n\
    mov r2, sl\n\
    lsls r0, r2, #0x10\n\
    asrs r0, r0, #0x10\n\
    adds r1, r1, r0\n\
    ldr r0, .L08092CD0 @ =0x02000000\n\
    adds r1, r1, r0\n\
    ldr r2, [sp, #0x14]\n\
    lsls r0, r2, #0x10\n\
    asrs r0, r0, #0x10\n\
    cmp r0, #0\n\
    bge .L08092BC2\n\
    adds r0, #3\n\
.L08092BC2:\n\
    lsls r2, r0, #9\n\
    lsrs r2, r2, #0xb\n\
    movs r0, #0x80\n\
    lsls r0, r0, #0x13\n\
    orrs r2, r0\n\
    adds r0, r1, #0\n\
    adds r1, r3, #0\n\
    bl CpuSet\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #0x10\n\
    lsrs r2, r0, #0x10\n\
    cmp r0, r5\n\
    blt .L08092B94\n\
.L08092BDE:\n\
    movs r0, #3\n\
    movs r1, #0\n\
    bl GetCompressedWmPalette\n\
    ldr r1, .L08092CD0 @ =0x02000000\n\
    bl Decompress\n\
    movs r2, #0\n\
    cmp r6, #0\n\
    ble .L08092C4A\n\
    ldr r4, [sp, #0xc]\n\
    lsls r0, r4, #0x10\n\
    asrs r0, r0, #0x10\n\
    mov r8, r0\n\
    ldr r1, [sp]\n\
    lsls r0, r1, #0x10\n\
    asrs r7, r0, #0x10\n\
.L08092C00:\n\
    asrs r1, r5, #0x10\n\
    lsls r0, r2, #0x10\n\
    asrs r4, r0, #0x10\n\
    adds r1, r1, r4\n\
    lsls r0, r1, #4\n\
    subs r0, r0, r1\n\
    lsls r0, r0, #4\n\
    ldr r2, .L08092CD4 @ =0x0600A000\n\
    adds r3, r0, r2\n\
    mov r0, r8\n\
    adds r1, r0, r4\n\
    lsls r0, r1, #4\n\
    subs r0, r0, r1\n\
    lsls r0, r0, #4\n\
    adds r0, r0, r7\n\
    ldr r1, .L08092CD0 @ =0x02000000\n\
    adds r1, r0, r1\n\
    mov r2, sb\n\
    lsls r0, r2, #0x10\n\
    asrs r0, r0, #0x10\n\
    cmp r0, #0\n\
    bge .L08092C2E\n\
    adds r0, #3\n\
.L08092C2E:\n\
    lsls r2, r0, #9\n\
    lsrs r2, r2, #0xb\n\
    movs r0, #0x80\n\
    lsls r0, r0, #0x13\n\
    orrs r2, r0\n\
    adds r0, r1, #0\n\
    adds r1, r3, #0\n\
    bl CpuSet\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #0x10\n\
    lsrs r2, r0, #0x10\n\
    cmp r0, r6\n\
    blt .L08092C00\n\
.L08092C4A:\n\
    movs r0, #4\n\
    movs r1, #0\n\
    bl GetCompressedWmPalette\n\
    ldr r1, .L08092CD0 @ =0x02000000\n\
    bl Decompress\n\
    movs r2, #0\n\
    cmp r6, #0\n\
    ble .L08092CBE\n\
    mov r4, sb\n\
    lsls r0, r4, #0x10\n\
    asrs r0, r0, #0x10\n\
    ldr r1, .L08092CD4 @ =0x0600A000\n\
    adds r1, r1, r0\n\
    mov r8, r1\n\
    ldr r4, [sp, #0x10]\n\
    lsls r0, r4, #0x10\n\
    asrs r7, r0, #0x10\n\
.L08092C70:\n\
    asrs r1, r5, #0x10\n\
    lsls r0, r2, #0x10\n\
    asrs r4, r0, #0x10\n\
    adds r1, r1, r4\n\
    lsls r0, r1, #4\n\
    subs r0, r0, r1\n\
    lsls r0, r0, #4\n\
    mov r1, r8\n\
    adds r3, r0, r1\n\
    adds r0, r7, r4\n\
    lsls r1, r0, #4\n\
    subs r1, r1, r0\n\
    lsls r1, r1, #4\n\
    ldr r2, [sp, #4]\n\
    lsls r0, r2, #0x10\n\
    asrs r0, r0, #0x10\n\
    adds r1, r1, r0\n\
    ldr r0, .L08092CD0 @ =0x02000000\n\
    adds r1, r1, r0\n\
    ldr r2, [sp, #0x14]\n\
    lsls r0, r2, #0x10\n\
    asrs r0, r0, #0x10\n\
    cmp r0, #0\n\
    bge .L08092CA2\n\
    adds r0, #3\n\
.L08092CA2:\n\
    lsls r2, r0, #9\n\
    lsrs r2, r2, #0xb\n\
    movs r0, #0x80\n\
    lsls r0, r0, #0x13\n\
    orrs r2, r0\n\
    adds r0, r1, #0\n\
    adds r1, r3, #0\n\
    bl CpuSet\n\
    adds r0, r4, #1\n\
    lsls r0, r0, #0x10\n\
    lsrs r2, r0, #0x10\n\
    cmp r0, r6\n\
    blt .L08092C70\n\
.L08092CBE:\n\
    add sp, #0x18\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
.L08092CD0: .4byte 0x02000000\n\
.L08092CD4: .4byte 0x0600A000\n\
    .syntax divided\n\
");
}

struct ProcScr CONST_DATA ProcScr_WmZoomBack[] = {
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_SLEEP(1),
    PROC_CALL(WmZoomBack_Init),
    PROC_REPEAT(WmZoomBack_Loop),
    PROC_END,
};

void StartWmZoomBack(ProcPtr parent)
{
    struct ProcWmZoom * proc;

    proc = SpawnProc(ProcScr_WmZoomBack, parent);
    proc->wmproc = FindProc(ProcScr_WorldMap);
}

void WmZoomBack_Init(struct ProcWmZoom * proc)
{
    proc->unk_66 = 0;
    proc->unk_68 = 0;
}

void WmZoomBack_Loop(struct ProcWmZoom * proc)
{
    int ret;
    struct ProcWorldMap * wmproc = proc->wmproc;

    switch (proc->unk_66) {
    case 0:
        if (1 & proc->unk_68)
        {
            ApplyCompressedWmPalette(1, 1);

            wmproc->unk2C = 0;
            wmproc->unk30 = 0;

            wmproc->unk34 = 0x7800;
            wmproc->unk38 = 0x5000;

            wmproc->unk44 = 0;

            wmproc->unk48 = 0x100;
            wmproc->unk4A = 0x100;

            gDispIo.disp_ct.bitmap_frame = true;
        }
        else
        {
            ApplyCompressedWmPalette(0, 1);

            wmproc->unk2C = 0;
            wmproc->unk30 = 0;

            wmproc->unk34 = wmproc->camera_x + 0xFFFF8800;
            wmproc->unk38 = wmproc->camera_y + 0xFFFFB000;

            wmproc->unk44 = 0;

            wmproc->unk48 = 0x200;
            wmproc->unk4A = 0x200;

            gDispIo.disp_ct.bitmap_frame = false;
        }

        proc->unk_68++;
        if (proc->unk_68 == 7)
        {
            proc->unk_66++;
            proc->unk_68 = 0;
        }
        break;

    case 1:
        ret = Interpolate(INTERPOLATE_RCUBIC, 0x200, 0x100, proc->unk_68, 0x20);

        wmproc->unk4A = ret;
        wmproc->unk48 = ret;

        wmproc->unk34 = wmproc->camera_x + 0xFFFF8800;
        wmproc->unk38 = wmproc->camera_y + 0xFFFFB000;

        proc->unk_68++;
        if (proc->unk_68 == 0x21)
            Proc_Break(proc);

        break;

    default:
        break;
    }

    WmZoomCore(wmproc->unk2C, wmproc->unk30, wmproc->unk34, wmproc->unk38, wmproc->unk44, wmproc->unk48, wmproc->unk4A);
}

bool WmZoomExists(void)
{
    if (FindProc(ProcScr_WmZoomTo) != NULL)
        return true;

    if (FindProc(ProcScr_WmZoomBack) != NULL)
        return true;

    return false;
}

void EndWmZoom(void)
{
    Proc_EndEach(ProcScr_WmZoomTo);
    Proc_EndEach(ProcScr_WmZoomBack);
}

void WmZoomCore(int a, int b, int c, int d, int e, i16 f, i16 g)
{
    int r5 = Div(e, 0x20);
    int r4 = Div(r5, 2);
    int r7;

    if (1 & r5)
        r7 = (gUnk_08353328[r4 & 0x3FF] + gUnk_08353328[(r4 + 1) & 0x3FF]) >> 1;
    else
        r7 =  gUnk_08353328[r4 & 0x3FF];

    if (1 & r5)
        r5 = (gUnk_08353328[(r4 + 0x100) & 0x3FF] + gUnk_08353328[(r4 + 0x101) & 0x3FF]) >> 1;
    else
        r5 =  gUnk_08353328[(r4 + 0x100) & 0x3FF];

    a = a / 0x100;
    b = b / 0x100;
    c = c / 0x100;
    d = d / 0x100;

    gDispIo.bg2pa = ((0x10000 / f * r5) / 0x100) >> 7;
    gDispIo.bg2pb = ((0x10000 / f * r7) / 0x100) >> 7;

    gDispIo.bg2pc = -(((0x10000 /g * r7) / 0x100) >> 7);
    gDispIo.bg2pd = ((0x10000 / g * r5) / 0x100) >> 7;

    gDispIo.bg2x = ((i16)gDispIo.bg2pa) * (a - c) + ((i16)gDispIo.bg2pb) * (b - d) + c * 0x100;
    gDispIo.bg2y = ((i16)gDispIo.bg2pc) * (a - c) + ((i16)gDispIo.bg2pd) * (b - d) + d * 0x100;
}
