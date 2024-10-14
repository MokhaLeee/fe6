#pragma once

#include "prelude.h"
#include "proc.h"

struct ProcWorldMap {
    PROC_HEADER;

    /* 2C */ int unk2C;
    /* 30 */ int unk30;
    /* 34 */ int unk34;
    /* 38 */ int unk38;

    STRUCT_PAD(0x3C, 0x44);

    /* 44 */ int unk44;
    /* 48 */ i16 unk48, unk4A;
    /* 4C */ u16 unk4C, unk4E, unk50;
    /* 52 */ u8 unk52, unk53, unk54;
};

struct Struct_030048E0 {
    u8 unk_00, id, unk_02, unk_03;
    /* 04 */ u8 unk_04;
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
    /* DC */ u8 unk_DC[12];

    STRUCT_PAD(0xE8, 0xF0);

    /* DC */ u8 unk_F0[12];

    STRUCT_PAD(0xFC, 0x104);

    /* 104 */ int unk_104[12];

    STRUCT_PAD(0x134, 0x154);

    /* 154 */ int unk_154[12];

    STRUCT_PAD(0x184, 0x244);

    /* 244 */ int unk_244[12];

    STRUCT_PAD(0x274, 0x294);

    /* 294 */ int unk_294[12];

    STRUCT_PAD(0x2C4, 0x2E4);

    /* 2E4 */ int unk_2E4[12];

    STRUCT_PAD(0x314, 0x334);
};

extern struct Struct_030048E0 gUnk_030048E0[2];

// GetCompressedWmPalette
// ApplyCompressedWmPalette
void StartWorldMap(void);
// StartWorldMapUnused
void func_fe6_080922D8(struct ProcWorldMap * proc);
void func_fe6_080923C4(struct ProcWorldMap * proc);

struct ProcWmArrow {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct Struct_030048E0 * unk58;
};

// StartWmArrow
// EndWmArrow
// WmArrowExists
void WmArrow_End(struct ProcWmArrow * proc);
void WmArrow_Init(struct ProcWmArrow * proc);
void func_fe6_080925C4(struct Struct_030048E0 * conf, int idx);
void WmArrow_Loop(struct ProcWmArrow * proc);
void func_fe6_08092838(void);
struct Struct_030048E0 * GetUnkStruct_030048E0(void);

struct Proc_0868C3AC {
    PROC_HEADER;
};

// func_fe6_0809287C
void func_fe6_0809289C(struct Proc_0868C3AC * proc);
// func_fe6_080928C0

struct Proc_0868C3C4 {
    PROC_HEADER;
};

void func_fe6_080928DC(int x, int y, ProcPtr parent);
void func_fe6_0809290C(struct Proc_0868C3C4 * proc);
void func_fe6_0809291C(struct Proc_0868C3C4 * proc);

struct Proc_0868C3EC {
    PROC_HEADER;
};

// func_fe6_08092A9C
void func_fe6_08092CD8(ProcPtr parent);
void func_fe6_08092CFC(struct Proc_0868C3C4 * proc);
void func_fe6_08092D0C(struct Proc_0868C3C4 * proc);

bool func_fe6_08092E68(void);
void func_fe6_08092E94(void);
void func_fe6_08092EB0(int a, int b, int c, int d, int e, int f, int g);
void func_fe6_08093064(int a, int b, int c);
void StartWorldMapIntroScen(void);
// func_fe6_08093114
// func_fe6_08093120
// SetWMFlag
// GetWMFlag
// SetWMDot
// GetWMDot
// SetWMHighlight
// GetWMHighlight
// SetWMMapText
// GetWMMapText
u16 * func_fe6_0809325C(int a);
int func_fe6_08093284(u16 * buf);
int func_fe6_08093288(u16 * buf, int a);
int func_fe6_080932D8(u16 * buf, int a);
// func_fe6_0809331C
// func_fe6_0809338C
// func_fe6_08093394
void func_fe6_080933F8(void);
i8 func_fe6_08093444(void);
// func_fe6_0809345C
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
// func_fe6_08093BA0
void func_fe6_08093BB4(int id);
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
// func_fe6_08094214
// func_fe6_08094228
// func_fe6_08094234
// func_fe6_08094438
// func_fe6_08094460
// func_fe6_080944F4
// func_fe6_08094504

extern u16 CONST_DATA Sprite_0868C2CC[];
extern u16 CONST_DATA Sprite_0868C2D4[];
extern CONST_DATA u8 * Pals_0868C2DC[10];
extern CONST_DATA struct ProcScr ProcScr_WorldMapIntroEvent[];
extern CONST_DATA struct ProcScr ProcScr_WorldMap[];
// extern CONST_DATA ??? ProcScr_WmArrow
// extern CONST_DATA ??? ProcScr_0868C3AC
// extern CONST_DATA ??? ProcScr_0868C3C4
// extern CONST_DATA ??? ProcScr_0868C3EC
// extern CONST_DATA ??? gUnk_0868C414
// extern CONST_DATA ??? ProcScr_0868C648
// extern CONST_DATA ??? ProcScr_0868C658
// extern CONST_DATA ??? ProcScr_0868C668
extern CONST_DATA struct ProcScr ProcScr_0868C688[];
extern CONST_DATA struct ProcScr ProcScr_WroldMapRmBorder[];
// extern CONST_DATA ??? gUnk_0868C734
// extern CONST_DATA ??? gUnk_0868C8D8
// extern CONST_DATA ??? gUnk_0868C940
// extern CONST_DATA ??? gUnk_0868C970
// extern CONST_DATA ??? gUnk_0868C988
// extern CONST_DATA ??? gUnk_0868FDB4
// extern CONST_DATA ??? gUnk_0868FE0C
