#pragma once

#include "prelude.h"
#include "proc.h"

struct ProcWorldMap {
    PROC_HEADER;

    /* 2C */ int unk2C;
    /* 30 */ int unk30;
    /* 34 */ int unk34;
    /* 38 */ int unk38;

    /* 3C */ int camera_x, camera_y;

    /* 44 */ int unk44;
    /* 48 */ i16 unk48, unk4A;
    /* 4C */ u16 unk4C, unk4E, unk50;
    /* 52 */ u8 unk52, unk53, unk54;
};

struct WmArrowSt {
    /* 00 */ u8 busy;
    /* 01 */ u8 eid;    /* user defined */;
    /* 02 */ u8 sprite_index;  /* gWmArrowSt index */
    /* 03 */ u8 unk_03;
    /* 04 */ u8 amount;
    /* 05 */ u8 color;

    /* 08 */ int unk_08;
    /* 0C */ int unk_0C;
    /* 10 */ int unk_10;
    /* 14 */ int unk_14[12];
    /* 44 */ int unk_44[12];
    /* 74 */ int unk_74[12];
    /* A4 */ int unk_A4[12];
    /* D4 */ int unk_D4;
    /* D8 */ int unk_D8;

    /* DC */ u8 unk_DC[20];
    /* DC */ u8 unk_F0[20];

    /* 104 */ int x_array[20];
    /* 154 */ int y_array[20];
    /* 1A4 */ int unk_1A4[20];
    /* 1F4 */ int unk_1F4[20];
    /* 244 */ int unk_244[20];
    /* 294 */ int unk_294[20];
    /* 2E4 */ int unk_2E4[20];
};

extern struct WmArrowSt gWmArrowSt[2];

// GetCompressedWmPalette
// ApplyCompressedWmPalette
void StartWorldMap(void);
// StartWorldMapUnused
void func_fe6_080922D8(struct ProcWorldMap * proc);
void func_fe6_080923C4(struct ProcWorldMap * proc);

struct ProcWmArrow {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct WmArrowSt * conf;
};

void StartWmArrow(int id, int color, int c, int d, int e, int f);
void EndWmArrow(void);
bool WmArrowExists(void);
void WmArrow_End(struct ProcWmArrow * proc);
void WmArrow_Init(struct ProcWmArrow * proc);
void PutWmArrowSpriteExt(struct WmArrowSt * conf, int idx);
void WmArrow_Loop(struct ProcWmArrow * proc);
void ResetWmArrowSt(void);
struct WmArrowSt * GetFreeWmArrowSt(void);

struct Proc_0868C3AC {
    PROC_HEADER;

    /* 2C */ int duration;

    STRUCT_PAD(0x30, 0x66);

    /* 66 */ i16 timer;
};

void func_fe6_0809287C(int duration);
void func_fe6_0809289C(struct Proc_0868C3AC * proc);
bool func_fe6_080928C0(void);

struct ProcWmZoom {
    PROC_HEADER;

    /* 2C */ int ix, iy;

    STRUCT_PAD(0x34, 0x4C);

    /* 4C */ struct ProcWorldMap * wmproc;

    STRUCT_PAD(0x50, 0x66);

    /* 66 */ i16 unk_66, unk_68;
};

void StartWmZoomTo(int x, int y, ProcPtr parent);
void WmZoomIn_Init(struct ProcWmZoom * proc);
void WmZoomIn_Loop(struct ProcWmZoom * proc);
void func_fe6_08092A9C(int x, int y);
void StartWmZoomBack(ProcPtr parent);
void WmZoomBack_Init(struct ProcWmZoom * proc);
void WmZoomBack_Loop(struct ProcWmZoom * proc);
bool WmZoomExists(void);
void EndWmZoom(void);

void WmZoomCore(int a, int b, int c, int d, int e, int f, int g);
void DrawWmArrowCore(u8 a, i16 b, i16 c, int d);
void StartWmEvent(void);
// func_fe6_08093114
void func_fe6_08093120(void);

struct ProcWmSprite {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2E);

    /* 2E */ u8 unk_2E;

    /* 30 */ ProcPtr flag_procs[4];
    /* 40 */ ProcPtr dot_procs[2];
    /* 48 */ ProcPtr highlight_procs[2];
    /* 50 */ ProcPtr text_procs[2];
};

struct WmArrowConf {
    const u16 * buf;
    i16 unk_04, unk_06;
    u8 unk_08, unk_09;
    u16 unk_0A;
};

extern CONST_DATA struct WmArrowConf gWmArrowConf[];

void SetWMFlag(int index, ProcPtr approc);
ProcPtr GetWMFlag(int index);
void SetWMDot(int index, ProcPtr approc);
ProcPtr GetWMDot(int index);
void SetWMHighlight(int index, ProcPtr approc);
ProcPtr GetWMHighlight(int index);
void SetWMMapText(int index, ProcPtr approc);
ProcPtr GetWMMapText(int index);
const u16 * GetWmArrowConfigBuf(int a);
int GetWmArrowCount(const u16 * buf);
int func_fe6_08093288(const u16 * buf, int a);
int func_fe6_080932D8(const u16 * buf, int a);
void StartWmSpriteDisp(struct ProcWmSprite * proc);
void WmSpriteDisp_Init(struct GenericProc * proc);
void WmSpriteDisp_Loop(struct GenericProc * proc);
void StartWmSprite(void);
bool WmSpriteExists(void);

void func_fe6_0809345C(void);
void func_fe6_0809347C(int x, int y);
void func_fe6_080934A0(void);
void DisplayWmArrow(int id, int color);
void func_fe6_08093518(void);
void StartWMIntroRotation(ProcPtr parent);
// func_fe6_08093584
// func_fe6_080935A0
// func_fe6_08093608
// func_fe6_080936E8
// func_fe6_08093764

struct WMHighlightConfig {
    const void * img;
    const u16 * sprite;
    i16 x, y;
};

extern CONST_DATA struct WMHighlightConfig Config_WMHighlight[];

void StartWMHighlight(int arg_0, int id);
// WMHighlight_Init
// WMHighlight_Loop
// WMHighlight_End
// RemoveWMHighlight
// RemoveAllWMHighlight
void WMHighlightFadeOut(int id);
i8 WMHighlightExists(int id);
i8 WMHighlightAllSideExists(void);
void WmPutDot(int palid, int x, int y, int id);
void EndWMDot(int id);
void StartWMFlag(int palid, int x, int y, int id);
void EndWMFlag(int id);
void StartWMMapText(int x_a, int y_a, int unk, int x_b, int y_b, int id);
// RemoveWmMapText
void EndWmMapText(int id);
// func_fe6_08093BC8
// func_fe6_08093C18
// func_fe6_08093C24
// func_fe6_08093D54
// func_fe6_08093DD4
// func_fe6_08093E14
// func_fe6_08093E90
// func_fe6_08093EAC
// func_fe6_08093FD8
void PlayWMIntroBGM(void);
void func_fe6_08094030(int arg_0, int arg_1, int arg_2, ProcPtr proc);
// func_fe6_08094064
// func_fe6_0809406C
// func_fe6_080940F0
// func_fe6_08094108
// func_fe6_08094110
// func_fe6_0809412C

extern u16 CONST_DATA Sprite_0868C2CC[];
extern u16 CONST_DATA Sprite_0868C2D4[];
extern CONST_DATA u8 * Pals_0868C2DC[10];
extern CONST_DATA struct ProcScr ProcScr_WorldMapIntroEvent[];
extern CONST_DATA struct ProcScr ProcScr_WorldMap[];
extern CONST_DATA struct ProcScr ProcScr_WmArrow[];
extern CONST_DATA struct ProcScr ProcScr_0868C3AC[];
extern CONST_DATA struct ProcScr ProcScr_WmZoomIn[];
extern CONST_DATA struct ProcScr ProcScr_WmZoomBack[];
extern CONST_DATA struct ProcScr ProcScr_WmSprite[];
extern CONST_DATA struct ProcScr ProcScr_WmSpriteDisp[];
extern CONST_DATA struct ProcScr ProcScr_0868C668[];
extern CONST_DATA struct ProcScr ProcScr_0868C688[];
extern CONST_DATA struct ProcScr ProcScr_WroldMapRmBorder[];
// extern CONST_DATA ??? gUnk_0868C734
// extern CONST_DATA ??? gUnk_0868C8D8
// extern CONST_DATA ??? gUnk_0868C940
// extern CONST_DATA ??? gUnk_0868C970
// extern CONST_DATA ??? gUnk_0868C988

extern u16 const gUnk_WmArrow_Buf1[];
extern u16 const gUnk_WmArrow_Buf2[];
extern u16 const gUnk_WmArrow_Buf3[];
extern u16 const gUnk_WmArrow_Buf4[];
extern u16 const gUnk_WmArrow_Buf5[];
extern u16 const gUnk_WmArrow_Buf6[];
extern u16 const gUnk_WmArrow_Buf7[];

extern const int gUnk_08353328[];
