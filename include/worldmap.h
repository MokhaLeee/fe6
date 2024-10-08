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

// GetCompressedWmPalette
// ApplyCompressedWmPalette
void StartWorldMap(void);
// StartWorldMapUnused
void func_fe6_080922D8(struct ProcWorldMap * proc);
void func_fe6_080923C4(struct ProcWorldMap * proc);

struct Proc_0868C37C {
    PROC_HEADER;
};

// func_fe6_080923C8
// func_fe6_08092424
// func_fe6_08092434
void func_fe6_08092450(struct Proc_0868C37C * proc);
void func_fe6_08092458(struct Proc_0868C37C * proc);
// func_fe6_080925C4
void func_fe6_0809268C(struct Proc_0868C37C * proc);
void func_fe6_08092838(void);
// func_fe6_08092854

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
void func_fe6_08092EB0(int a, int b, int c, int d, int e, int f);
// func_fe6_08093064
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
// func_fe6_0809325C
// func_fe6_08093284
// func_fe6_08093288
// func_fe6_080932D8
// func_fe6_0809331C
// func_fe6_0809338C
// func_fe6_08093394
void func_fe6_080933F8(void);
i8 func_fe6_08093444(void);
// func_fe6_0809345C
void func_fe6_0809347C(int x, int y);
void func_fe6_080934A0(void);
void func_fe6_080934BC(int x, int y);
void func_fe6_08093518(void);
void StartWMIntroRotation(ProcPtr parent);
// func_fe6_08093584
// func_fe6_080935A0
// func_fe6_08093608
// func_fe6_080936E8
// func_fe6_08093764
void StartWMHighlight(int arg_0, int id);
// func_fe6_080937D4
// func_fe6_080938BC
// func_fe6_08093960
// func_fe6_0809397C
// func_fe6_08093990
void func_fe6_080939A8(int id);
i8 WMHighlightExists(int id);
i8 func_fe6_080939D0(void);
void func_fe6_080939F0(int palid, int x, int y, int id);
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
// func_fe6_08094540
// func_fe6_080945F4
// func_fe6_080946D4
// func_fe6_08094724
// func_fe6_080947AC
// func_fe6_080947B8
// func_fe6_080947DC
void StartClassDemo(u8 arg_0, ProcPtr parent);
// func_fe6_0809480C
// func_fe6_0809485C
// func_fe6_08094878
// func_fe6_080949B8
// func_fe6_08094B28
// func_fe6_08094B80
// func_fe6_08094BE0
// func_fe6_08094C50
// func_fe6_08094C80
// func_fe6_08094CB8
// func_fe6_08094CEC
// func_fe6_08094E20
// func_fe6_08094E4C
// func_fe6_08094EE8
// func_fe6_08094F08
// func_fe6_08094F14
// func_fe6_08094F94
// func_fe6_08095034
// func_fe6_08095100
// func_fe6_08095138
// func_fe6_0809517C
// func_fe6_080951A4
// func_fe6_080951DC
// func_fe6_080951FC
// func_fe6_0809525C
// func_fe6_08095334
// func_fe6_08095850
// func_fe6_0809597C
// func_fe6_08095A70
// func_fe6_08095A74
// func_fe6_08095AB8
// func_fe6_08095AE0
// func_fe6_08095BCC
// func_fe6_08095D28
// func_fe6_08095D2C
// func_fe6_08095D40
// func_fe6_08095D48
// func_fe6_08095D58

extern u16 CONST_DATA Sprite_0868C2CC[];
extern u16 CONST_DATA Sprite_0868C2D4[];
extern CONST_DATA u8 * Pals_0868C2DC[10];
extern CONST_DATA struct ProcScr ProcScr_WorldMapIntroEvent[];
extern CONST_DATA struct ProcScr ProcScr_WorldMap[];
// extern CONST_DATA ??? ProcScr_0868C37C
// extern CONST_DATA ??? ProcScr_0868C3AC
// extern CONST_DATA ??? ProcScr_0868C3C4
// extern CONST_DATA ??? ProcScr_0868C3EC
// extern CONST_DATA ??? gUnk_0868C414
// extern CONST_DATA ??? ProcScr_0868C648
// extern CONST_DATA ??? ProcScr_0868C658
// extern CONST_DATA ??? ProcScr_0868C668
extern CONST_DATA struct ProcScr ProcScr_0868C688[];
// extern CONST_DATA ??? gUnk_0868C6B0
// extern CONST_DATA ??? gUnk_0868C704
// extern CONST_DATA ??? gUnk_0868C734
// extern CONST_DATA ??? gUnk_0868C8D8
// extern CONST_DATA ??? gUnk_0868C940
// extern CONST_DATA ??? gUnk_0868C970
// extern CONST_DATA ??? gUnk_0868C988
// extern CONST_DATA ??? gUnk_0868FDB4
// extern CONST_DATA ??? gUnk_0868FE0C
// extern CONST_DATA ??? ProcScr_ClassDemo
// extern CONST_DATA ??? gUnk_0868FEDC
// extern CONST_DATA ??? gUnk_0868FEFC
// extern CONST_DATA ??? gUnk_0868FF4C
// extern CONST_DATA ??? gUnk_0868FF84
// extern CONST_DATA ??? gUnk_0868FFCC
// extern CONST_DATA ??? gUnk_08690014
// extern CONST_DATA ??? gUnk_0869006C
// extern CONST_DATA ??? gUnk_086900BC
// extern CONST_DATA ??? gUnk_086900DC
// extern CONST_DATA ??? gUnk_086900F0
// extern CONST_DATA ??? gUnk_086900F8
// extern CONST_DATA ??? gUnk_08690100
// extern CONST_DATA ??? gUnk_08690288
// extern CONST_DATA ??? gUnk_0869056C
// extern CONST_DATA ??? gUnk_0869058C
// extern CONST_DATA ??? gUnk_086905B0
// extern CONST_DATA ??? gUnk_086905F8
// extern CONST_DATA ??? gUnk_086909A4
// extern CONST_DATA ??? gUnk_08690A53
// extern CONST_DATA ??? gUnk_08690A99
// extern CONST_DATA ??? gUnk_08690C14
// extern CONST_DATA ??? gUnk_08690D44
