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
    proc->unk58 = GetUnkStruct_030048E0();

    if (proc->unk58 == NULL)
    {
        Proc_End(proc);
        return;
    }

    proc->unk58->unk_00 = 1;
    proc->unk58->id = id;
    proc->unk58->color = color;
    proc->unk58->unk_D4 = c;
    proc->unk58->unk_D8 = d;
    proc->unk58->unk_0C = e;
    proc->unk58->unk_08 = f;
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
    proc->unk58->unk_00 = 0;
}

void WmArrow_Init(struct ProcWmArrow * proc)
{
    int i;
    struct Struct_030048E0 * conf = proc->unk58;
    int unk = func_fe6_08093284(func_fe6_0809325C(conf->id));

    conf->unk_04 = unk;
    conf->unk_14[0] = 0;

    for (i = 0; i < conf->unk_04; i++)
    {
        conf->unk_74[i] = (func_fe6_08093288(func_fe6_0809325C(conf->id), i) + conf->unk_D4) * 0x100;
        conf->unk_A4[i] = (func_fe6_080932D8(func_fe6_0809325C(conf->id), i) + conf->unk_D8) * 0x100;
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
