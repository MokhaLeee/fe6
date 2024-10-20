#include "prelude.h"
#include "oam.h"
#include "hardware.h"
#include "util.h"
#include "oam.h"
#include "sprite.h"
#include "bm.h"
#include "bmio.h"
#include "event.h"
#include "sound.h"
#include "talk.h"
#include "manim.h"
#include "spriteanim.h"
#include "chapterinfo.h"
#include "worldmap.h"

#if NONMATCHING
void DrawWmArrowCore(u8 id, i16 b, i16 c, int d)
{
    PutSpriteAffine(
        id,
        (gUnk_08353328[(d + 0x100) & 0x3FF] * b) >> 0xF,
        (gUnk_08353328[(d) & 0x3FF] * c) >> 0xF,
        -((gUnk_08353328[(d) & 0x3FF] * b) >> 0xF),
        (gUnk_08353328[(d + 0x100) & 0x3FF] * c) >> 0xF
    );
}
#else

NAKEDFUNC
void DrawWmArrowCore(u8 id, i16 b, i16 c, int d)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, lr}\n\
    mov r6, r8\n\
    push {r6}\n\
    sub sp, #4\n\
    adds r4, r1, #0\n\
    adds r5, r2, #0\n\
    lsls r0, r0, #0x18\n\
    lsrs r0, r0, #0x18\n\
    lsls r4, r4, #0x10\n\
    asrs r4, r4, #0x10\n\
    ldr r6, .L080930CC @ =gUnk_08353328\n\
    movs r2, #0x80\n\
    lsls r2, r2, #1\n\
    adds r1, r3, r2\n\
    ldr r2, .L080930D0 @ =0x000003FF\n\
    ands r1, r2\n\
    lsls r1, r1, #2\n\
    adds r1, r1, r6\n\
    ldr r1, [r1]\n\
    mov r8, r1\n\
    mov r1, r8\n\
    muls r1, r4, r1\n\
    lsls r1, r1, #1\n\
    asrs r1, r1, #0x10\n\
    lsls r5, r5, #0x10\n\
    asrs r5, r5, #0x10\n\
    ands r3, r2\n\
    lsls r3, r3, #2\n\
    adds r3, r3, r6\n\
    ldr r3, [r3]\n\
    adds r2, r5, #0\n\
    muls r2, r3, r2\n\
    lsls r2, r2, #1\n\
    asrs r2, r2, #0x10\n\
    muls r3, r4, r3\n\
    asrs r3, r3, #0xf\n\
    rsbs r3, r3, #0\n\
    lsls r3, r3, #0x10\n\
    asrs r3, r3, #0x10\n\
    mov r4, r8\n\
    muls r4, r5, r4\n\
    lsls r4, r4, #1\n\
    asrs r4, r4, #0x10\n\
    str r4, [sp]\n\
    bl PutSpriteAffine\n\
    add sp, #4\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4, r5, r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
.L080930CC: .4byte gUnk_08353328\n\
.L080930D0: .4byte 0x000003FF\n\
    .syntax divided\n\
");
}

#endif

void StartWmEvent(void)
{
    if (ChapterAssets[GetChapterInfo(gPlaySt.chapter)->asset_event_info_wm])
        StartEvent(ChapterAssets[GetChapterInfo(gPlaySt.chapter)->asset_event_info_wm]);
}

void func_fe6_08093114(void)
{
    FadeBgmOut(4);
}

void func_fe6_08093120(void)
{
    FadeBgmOut(1);
}

void SetWmFlag(int index, ProcPtr approc)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        proc->flag_procs[index] = approc;
}

ProcPtr GetWmFlag(int index)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        return proc->flag_procs[index];

    return NULL;
}

void SetWMDot(int index, ProcPtr approc)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        proc->dot_procs[index] = approc;
}

ProcPtr GetWMDot(int index)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        return proc->dot_procs[index];

    return NULL;
}

void SetWmHighlight(int index, ProcPtr approc)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        proc->highlight_procs[index] = approc;
}

ProcPtr GetWmHighlight(int index)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        return proc->highlight_procs[index];

    return NULL;
}

void SetWmMapText(int index, ProcPtr approc)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        proc->text_procs[index] = approc;
}

ProcPtr GetWmMapText(int index)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        return proc->text_procs[index];

    return NULL;
}

CONST_DATA struct WmArrowConf gWmArrowConf[] = {
    { gUnk_WmArrow_Buf4, 0x014A, 0x00DF, 0x00, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x014A, 0x00DF, 0x00, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x014A, 0x00DF, 0x00, 0x08, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x0154, 0x00CF, 0x01, 0x08, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x013E, 0x00B3, 0x02, 0x08, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x0125, 0x00C2, 0x03, 0x08, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x0114, 0x00BC, 0x04, 0x06, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x0106, 0x00B6, 0x05, 0x08, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x00F4, 0x00B3, 0x06, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x00CD, 0x00AC, 0x00, 0x08, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x0095, 0x007E, 0x01, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x0087, 0x0066, 0x02, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x0079, 0x0056, 0x03, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf5, 0x0066, 0x009A, 0x00, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf3, 0x0040, 0x010C, 0x00, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf3, 0x00A0, 0x00F8, 0x01, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf3, 0x00BC, 0x00E6, 0x02, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf2, 0x00CD, 0x00AC, 0x05, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x011E, 0x0091, 0x06, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x0167, 0x0090, 0x07, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x016C, 0x008E, 0x07, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf6, 0x01A6, 0x0092, 0x03, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x01B3, 0x00C9, 0x07, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x018C, 0x00D0, 0x08, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x017C, 0x00E9, 0x09, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x0187, 0x0107, 0x0A, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x0095, 0x007E, 0x04, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x0073, 0x0088, 0x05, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x003D, 0x00C6, 0x06, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf2, 0x00CD, 0x00AC, 0x00, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x0107, 0x0056, 0x01, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x0145, 0x004B, 0x02, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf2, 0x019B, 0x004E, 0x03, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf6, 0x01B4, 0x0063, 0x02, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf4, 0x0106, 0x00B6, 0x05, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf1, 0x0079, 0x0056, 0x03, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf3, 0x001C, 0x0111, 0x00, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf3, 0x00BD, 0x00E6, 0x02, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x016C, 0x008E, 0x07, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x019B, 0x004E, 0x03, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf2, 0x01B4, 0x0071, 0x04, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf6, 0x01B3, 0x00AA, 0x00, 0x0A, 0x0050 },
    { gUnk_WmArrow_Buf6, 0x01B3, 0x00AA, 0x01, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf4, 0x0167, 0x00B4, 0x0C, 0x0A, 0x0080 },
    { gUnk_WmArrow_Buf4, 0x00F4, 0x00B4, 0x0D, 0x0A, 0x00C0 },
    { gUnk_WmArrow_Buf4, 0x0139, 0x00BF, 0x0B, 0x06, 0x0080 },
    { gUnk_WmArrow_Buf7, 0x00F4, 0x00B4, 0x00, 0x0A, 0x0080 },
};

const u16 * GetWmArrowConfigBuf(int index)
{
    struct WmArrowConf * _conf = gWmArrowConf;
    struct WmArrowConf * conf = _conf + index;
    const u16 * buf = conf->buf;

    buf = buf + buf[0] / 2;
    buf = buf + buf[conf->unk_08] / 2;

    return buf;
}

int GetWmArrowCount(const u16 * buf)
{
    return buf[0];
}

int func_fe6_08093288(const u16 * buf, int a)
{
    int x = OAM1_X(buf[a * 3 + 2]);
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (0x100 & x)
        x |= 0xFFFFFE00;

    if (proc->unk_2E == 0)
        x = Div(x, 2);

    return x;
}

int func_fe6_080932D8(const u16 * buf, int a)
{
    int x = OAM0_Y(buf[a * 3 + 1]);
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (0x80 & x)
        x |= 0xFFFFFF00;

    if (proc->unk_2E == 0)
        x = Div(x, 2);

    return x;
}

struct ProcScr CONST_DATA ProcScr_WmSprite[] =
{
    PROC_CALL(StartWmSpriteDisp),
    PROC_BLOCK,
};

void StartWmSpriteDisp(struct ProcWmSprite * proc)
{
    int i;
    const struct ProcScr * procscr;

    proc->unk_2A = 0;
    proc->unk_2C = 0;
    proc->unk_2E = 0;

    procscr = ProcScr_WmSpriteDisp;

    for (i = 0; i < 4; i++)
        proc->flag_procs[i] = NULL;

    for (i = 0; i < 2; i++)
        proc->dot_procs[i] = NULL;

    for (i = 0; i < 2; i++)
        proc->text_procs[i] = NULL;

    for (i = 0; i < 2; i++)
        proc->highlight_procs[i] = NULL;

    SpawnProc(ProcScr_WmSpriteDisp, proc);
}

struct ProcScr CONST_DATA ProcScr_WmSpriteDisp[] =
{
    PROC_CALL(WmSpriteDisp_Init),
    PROC_REPEAT(WmSpriteDisp_Loop),
};

void WmSpriteDisp_Init(struct GenericProc * proc)
{
    proc->timer1 = 0;
}

void WmSpriteDisp_Loop(struct GenericProc * proc)
{
    int pal_off;

    u8 pal_table[] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1,
        2, 2, 2, 2, 2, 2,
        3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        2, 2, 2, 2, 2, 2,
        1, 1, 1, 1, 1, 1,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        -1
    };

    proc->timer1++;

    if (pal_table[proc->timer1] == (u8)-1)
        proc->timer1 = 0;

    pal_off = pal_table[proc->timer1] * 0x10;

    ApplyPalette(Pal_WmSpriteDisp1 + pal_off, 0x10);
    ApplyPalette(Pal_WmSpriteDisp2 + pal_off, 0x11);
}

void StartWmSprite(void)
{
    Decompress(Img_WorldMapStuff, OBJ_VRAM0 + 0x6200);
    ApplyPalettes(Pal_WorldMapStuff, 0x10, 4);
    ApplyPalettes(Pal_WorldMap_082D3864, 0x14, 2);
    ResetWmArrowSt();

    SpawnProc(ProcScr_WmSprite, PROC_TREE_3);
    ResetWmSpriteState();
}

bool WmSpriteExists(void)
{
    return Proc_Exists(ProcScr_WmSprite);
}

void EndWmSprite(void)
{
    Proc_EndEachMarked(PROC_MARK_WMSTUFF);
    EndEachSpriteAnimProc();
    EndPutTalkSpriteText();
    Proc_EndEach(ProcScr_WmSprite);
}

void func_fe6_0809347C(int x, int y)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    proc->unk_2A = x - 0x78;
    proc->unk_2C = y - 0x50;
    proc->unk_2E = true;
}

void ResetWmSpriteState(void)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    proc->unk_2A = 0;
    proc->unk_2C = 0;
    proc->unk_2E = false;
}

void DisplayWmArrow(int id, int color)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);
    struct WmArrowConf * conf = gWmArrowConf + id;
    int r4 = conf->unk_04 - proc->unk_2A;
    int r3 = conf->unk_06 - proc->unk_2C;

    if (proc->unk_2E == 0)
    {
        r4 = r4 >> 1;
        r3 = r3 >> 1;

        r4 -= 2;
        r3 -= 2;
    }

    StartWmArrow(id, color, r4, r3, conf->unk_0A, conf->unk_09 << 8);
}

void SetupWmTalkBoxGfx(void)
{
    Decompress(Img_WorldMapStuff, OBJ_VRAM0 + 0x6200);
    ApplyPalettes(Pal_WorldMapStuff, 0x10, 4);
    ApplyPalettes(Pal_SystemObjects, 0x1B, 2);
    Decompress(Img_WmDialogueBox, OBJ_VRAM0 + 0x6800);
    ApplyPalette(Pal_WmDialogueBox, 0x19);
}

struct ProcScr CONST_DATA ProcScr_WmZoomIntro[] =
{
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_CALL(WmZoomIntro_Init),
    PROC_REPEAT(WmZoomIntro_Loop),
    PROC_END,
};

void StartWmZoomIntro(ProcPtr parent)
{
    SpawnProcLocking(ProcScr_WmZoomIntro, parent);
}

void WmZoomIntro_Init(struct GenericProc * proc)
{
    proc->unk44 = 0x200;
    proc->unk48 = 0x80;
    proc->timer1 = 0;
}

void WmZoomIntro_Loop(struct GenericProc * proc)
{
    int val1 = Interpolate(INTERPOLATE_RCUBIC, 0x8000, 0,     proc->timer1, 35);
    int val2 = Interpolate(INTERPOLATE_RCUBIC, 0x400,  0x100, proc->timer1++, 35);

    WmZoomCore(0, 0, 0x7800, 0x5000, val1, val2, val2);

    if (proc->timer1 == 0x28)
        Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_WmRotIntro[] =
{
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_ONEND(WmRotIntro_End),
    PROC_CALL(WmRotIntro_Init),
    PROC_REPEAT(WmRotIntro_Loop),
    PROC_END,
};

void WmRotIntro_Init(struct GenericProc * proc)
{
    proc->timer1 = 0;
    InitScanlineEffect();
    func_fe6_08069C74();

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    SetWinEnable(1, 0, 0);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

    SetBlendBrighten(proc->timer1);
}

void WmRotIntro_Loop(struct GenericProc * proc)
{
    func_fe6_08069DA4(0x78, 0x50, Interpolate(INTERPOLATE_RCUBIC, 1, 200, proc->timer1, 45));
    SetBlendBrighten(Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer1, 40));

    if (++proc->timer1 == 40)
        Proc_Break(proc);
}

void WmRotIntro_End(struct GenericProc * proc)
{
    SetBlendNone();
    SetOnHBlankA(NULL);
    SetWinEnable(0, 0, 0);
}

void StartWmHighlight(int nation, int id)
{
    struct ProcWmHighLight * proc = SpawnProc(ProcScr_WroldMapRmBorder, PROC_TREE_3);

    proc->nation = nation;
    proc->id = id;

    SetWmHighlight(id, proc);
}

struct WmHighlightConfig CONST_DATA Config_WmHighlight[7] =
{
    [0] = {
        .img = Img_WmHighlight_Nation1,
        .sprite = ApInfo_WmHighlight_Nation1,
        .x = 0x3E,
        .y = 0x1D,
    },

    [1] = {
        .img = Img_WmHighlight_Nation2,
        .sprite = ApInfo_WmHighlight_Nation2,
        .x = 0xC9,
        .y = 0x33,
    },

    [2] = {
        .img = Img_WmHighlight_Nation3,
        .sprite = ApInfo_WmHighlight_Nation3,
        .x = 0x40,
        .y = 0x69,
    },

    [3] = {
        .img = Img_WmHighlight_Nation4,
        .sprite = ApInfo_WmHighlight_Nation4,
        .x = 0xA0,
        .y = 0x50,
    },

    [4] = {
        .img = Img_WmHighlight_Nation5,
        .sprite = ApInfo_WmHighlight_Nation5,
        .x = 0xE5,
        .y = 0x4B,
    },

    [5] = {
        .img = Img_WmHighlight_Nation6,
        .sprite = ApInfo_WmHighlight_Nation6,
        .x = 0xB3,
        .y = 0x00,
    },

    [6] = {
        .img = Img_WmHighlight_Nation7,
        .sprite = ApInfo_WmHighlight_Nation7,
        .x = 0x62,
        .y = 0x26,
    },
};

struct ProcScr CONST_DATA ProcScr_WroldMapRmBorder[] =
{
    PROC_MARK(PROC_MARK_WMSTUFF),
    PROC_ONEND(WmHighlight_End),
    PROC_YIELD,
    PROC_CALL(WmHighlight_Init),
    PROC_REPEAT(WmHighlight_Loop),
    PROC_END,
};

void WmHighlight_Init(struct ProcWmHighLight * proc)
{
    struct SpriteAnim * sprite_anim;

    Decompress(
        Config_WmHighlight[proc->nation].img,
        proc->id == 0
            ? OBJ_VRAM0 + 0x4000
            : OBJ_VRAM0 + 0x5100);

    ApplyObPalette(Pal_WmHightlight, 0xA);

    sprite_anim = StartSpriteAnim(Config_WmHighlight[proc->nation].sprite, 0xD);

    proc->sprite_anim = sprite_anim;
    sprite_anim->oam2 = proc->id == 0 ? 0xA200 : 0xA288;

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendTargetB(0, 0, 1, 0, 0);
    SetBlendBackdropB(1);

    proc->ctrl = false;
    proc->unk_44 = 0xC0;
}

void WmHighlight_Loop(struct ProcWmHighLight * proc)
{
    int sin;

    DisplaySpriteAnim(
        proc->sprite_anim,
        Config_WmHighlight[proc->nation].x,
        Config_WmHighlight[proc->nation].y | 0x400
    );

    sin = ((SIN_Q12(proc->unk_44) * 3) >> 0xB) + 8;
    proc->unk_44 += 3;

    SetBlendConfig(BLEND_EFFECT_NONE, sin, 0x10 - sin, 0);

    if (proc->ctrl != 0 && sin == 2)
    {
        SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
        Proc_End(proc);
    }
}

void WmHighlight_End(struct ProcWmHighLight * proc)
{
    EndSpriteAnim(proc->sprite_anim);
    SetWmHighlight(proc->id, NULL);
}

void RemoveWmHighlight(int index)
{
    struct ProcWmHighLight * proc = GetWmHighlight(index);

    if (proc)
        Proc_End(proc);
}

void RemoveAllWmHighlight(void)
{
    int i;

    for (i = 0; i < 2; i++)
        RemoveWmHighlight(i);
}

void WmHighlightFadeOut(int index)
{
    struct ProcWmHighLight * proc = GetWmHighlight(index);

    if (proc)
        proc->ctrl = true;
}

bool WmHighlightExists(int index)
{
    if (GetWmHighlight(index) != NULL)
        return true;

    return false;
}

bool WmHighlightAllSideExists(void)
{
    if (GetWmHighlight(0) != NULL)
        return true;

    if (GetWmHighlight(1) != NULL)
        return true;

    return false;
}

void StartWmDot(int x, int y, int palid, int id)
{
    ProcPtr proc = GetWMDot(id);
    struct Vec2i vec = { x, y };

    ModifyWmSpritePosition(&vec);

    if (proc)
        SetSpriteAnimProcParameters(proc, vec.x, vec.y, 0x310);
    else
        SetWMDot(id, StartSpriteAnimProc(ApInfo_WmDot, vec.x, vec.y, OAM2_PAL(palid) | 0x310, 1, 0xA));
}

void EndWMDot(int id)
{
    ProcPtr proc = GetWMDot(id);

    if (proc)
        EndSpriteAnimProc(proc);

    SetWMDot(id, NULL);
}

void StartWmFlag(int x, int y, int palid, int id)
{
    ProcPtr proc = GetWmFlag(id);
    struct Vec2i vec = { x, y };

    ModifyWmSpritePosition(&vec);

    if (proc)
        SetSpriteAnimProcParameters(proc, vec.x, vec.y, OAM2_PAL(palid) | 0x310);
    else
        SetWmFlag(id, StartSpriteAnimProc(ApInfo_WmDot, vec.x, vec.y, OAM2_PAL(palid) | 0x310, 0, 0x7));
}

void EndWmFlag(int id)
{
    ProcPtr proc = GetWmFlag(id);

    if (proc)
        EndSpriteAnimProc(proc);

    SetWmFlag(id, NULL);
}

void StartWmMapText(int x, int y, int c, int d, int e, int id)
{
    struct ProcWmMapText * proc;
    struct Vec2i vec = { x, y };

    ModifyWmSpritePosition(&vec);

    proc = SpawnProc(ProcScr_WmMapTextDisp, PROC_TREE_3);
    proc->x = vec.x;
    proc->y = vec.y;
    proc->unk_64 = c;
    proc->unk_66 = d;
    proc->unk_68 = e;
    proc->id = id;

    SetWmMapText(id, proc);
}

void RemoveWmMapText(int id)
{
    struct ProcWmMapText * proc = GetWmMapText(id);

    if (proc)
        Proc_End(proc);
}

void EndWmMapText(int id)
{
    struct ProcWmMapText * proc = GetWmMapText(id);

    if (proc)
        proc->end_ctrl = true;
}

void PutWmMapTextGfx(const void * img_src, u8 * vram_dst)
{
    u8 * buf = gBuf;

    Decompress(img_src, buf);

    func_fe6_08015298(buf,         vram_dst,         8, 4);
    func_fe6_08015298(buf + 0x400, vram_dst + 0x100, 4, 4);
    func_fe6_08015298(buf + 0x600, vram_dst + 0x180, 1, 4);
}

void WmMapTextDisp_Init(struct ProcWmMapText * proc)
{
    proc->timer = 0;
    proc->end_ctrl = false;
}

void WmMapTextDisp_DrawGfx(struct ProcWmMapText * proc)
{
    proc->sprite_anim = StartSpriteAnim(ApInfo_WmMapTextDisp, 0xB);
    proc->sprite_anim->oam2 = ((proc->id == 0) ? 0x200 : 0x288) | ((proc->unk_68 == 0) ? 0x5000 : 0x4000);

    if (Config_WmMapText[proc->unk_64].img2 == Img_DefaultMapText)
        SetSpriteAnimId(proc->sprite_anim, 1);
    else
        SetSpriteAnimId(proc->sprite_anim, 2);

    PutWmMapTextGfx(Config_WmMapText[proc->unk_64].img1, proc->id == 0 ? (OBJ_VRAM0 + 0x4000) : (OBJ_VRAM0 + 0x5100));
    PutWmMapTextGfx(Config_WmMapText[proc->unk_64].img2, proc->id == 0 ? (OBJ_VRAM0 + 0x4200) : (OBJ_VRAM0 + 0x5300));

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendTargetB(0, 0, 1, 0, 0);
    SetBlendBackdropB(1);
}

void WmMapTextDisp_Loop1(struct ProcWmMapText * proc)
{
    func_fe6_08093EAC(proc->sprite_anim, proc->x, proc->y | 0x400, proc->unk_64, proc->unk_66, proc->unk_68);

    proc->timer++;
    SetBlendConfig(BLEND_EFFECT_NONE, proc->timer, 0x10 - proc->timer, 0);

    if (proc->timer >= 0x10)
        Proc_Break(proc);
}

void WmMapTextDisp_Loop2(struct ProcWmMapText * proc)
{
    func_fe6_08093EAC(proc->sprite_anim, proc->x, proc->y, proc->unk_64, proc->unk_66, proc->unk_68);

    if (proc->end_ctrl)
        Proc_Break(proc);
}

void WmMapTextDisp_Loop3(struct ProcWmMapText * proc)
{
    func_fe6_08093EAC(proc->sprite_anim, proc->x, proc->y | 0x400, proc->unk_64, proc->unk_66, proc->unk_68);

    proc->timer--;
    SetBlendConfig(BLEND_EFFECT_NONE, proc->timer, 0x10 - proc->timer, 0);

    if (proc->timer == 0)
        Proc_Break(proc);
}

void WmMapTextDisp_End(struct ProcWmMapText * proc)
{
    SetWmMapText(proc->id, NULL);
    EndSpriteAnim(proc->sprite_anim);
}
