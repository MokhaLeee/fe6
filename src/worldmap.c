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
    PROC_CALL(StartWorldMapIntroScen),
    PROC_WHILE(IsEventRunning),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_WorldMap[] = {
    PROC_MARK(8),
    PROC_CALL(LockBmDisplay),
    PROC_YIELD,
    PROC_CALL(func_fe6_080922D8),
    PROC_START_CHILD_LOCKING(ProcScr_0868C688),
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

    func_fe6_08092EB0(proc->unk2C, proc->unk30, proc->unk34, proc->unk38, proc->unk44, proc->unk48, proc->unk4A);

    ApplyCompressedWmPalette(0, 1);
    Decompress(GetCompressedWmPalette(0, 0), (void *)BG_VRAM);
    func_fe6_08092838();
}

void func_fe6_080923C4(struct ProcWorldMap * proc) {}

struct ProcScr CONST_DATA ProcScr_WmArrow[] = {
    PROC_MARK(8),
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
    int unk = func_fe6_08093284(func_fe6_0809325C(conf->eid));

    conf->unk_04 = unk;
    conf->unk_14[0] = 0;

    for (i = 0; i < conf->unk_04; i++)
    {
        conf->unk_74[i] = (func_fe6_08093288(func_fe6_0809325C(conf->eid), i) + conf->unk_D4) * 0x100;
        conf->unk_A4[i] = (func_fe6_080932D8(func_fe6_0809325C(conf->eid), i) + conf->unk_D8) * 0x100;
    }

    for (i = 1; i < conf->unk_04; i++)
    {
        int arctan;

        int r5 = conf->unk_74[i] - conf->unk_74[i - 1];
        int r4 = conf->unk_A4[i] - conf->unk_A4[i - 1];

        int sqrt = Sqrt(r5 * r5 + r4 * r4);
        conf->unk_14[i] = conf->unk_14[i - 1] + sqrt;
        conf->unk_44[i] = (arctan = ArcTan2(r5, r4)) / 0x3F;
    }

    conf->unk_10 = conf->unk_14[conf->unk_04 - 1];
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

        func_fe6_08093064(conf->affin, 0x100, 0x100, r3);

        a1 = OAM2_PAL(conf->color);
        a1 = a1 + 0x310;
        r6 = r6 + a1;

        r1 = conf->x_array[idx];
        r1 = (r1 << 0xF) >> 0x17;
        r1 = r1 | (conf->affin << 9);

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

void func_fe6_08092838(void)
{
    int i;

    for (i = 0; i < 3; i++)
    {
        gWmArrowSt[i].busy = false;
        gWmArrowSt[i].affin = i;
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
    PROC_MARK(8),
    PROC_REPEAT(func_fe6_0809289C),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_0868C3C4[] = {
    PROC_MARK(8),
    PROC_SLEEP(1),
    PROC_CALL(func_fe6_0809290C),
    PROC_REPEAT(func_fe6_0809291C),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_0868C3EC[] = {
    PROC_MARK(8),
    PROC_SLEEP(1),
    PROC_CALL(func_fe6_08092CFC),
    PROC_REPEAT(func_fe6_08092D0C),
    PROC_END,
};
