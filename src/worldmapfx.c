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

void SetWMFlag(int index, ProcPtr approc)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        proc->flag_procs[index] = approc;
}

ProcPtr GetWMFlag(int index)
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

void SetWMHighlight(int index, ProcPtr approc)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        proc->highlight_procs[index] = approc;
}

ProcPtr GetWMHighlight(int index)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        return proc->highlight_procs[index];

    return NULL;
}

void SetWMMapText(int index, ProcPtr approc)
{
    struct ProcWmSprite * proc = FindProc(ProcScr_WmSprite);

    if (proc)
        proc->text_procs[index] = approc;
}

ProcPtr GetWMMapText(int index)
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

struct ProcScr CONST_DATA ProcScr_WmSpriteDisp[] =
{
    PROC_CALL(WmSpriteDisp_Init),
    PROC_REPEAT(WmSpriteDisp_Loop),
};
