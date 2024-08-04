#pragma once

#include "prelude.h"

enum
{
    PREPMENU_FLAG_MULTIARENA = 1 << 0,
};

enum
{
    L_PREPMENU_5 = 0x05,
    L_PREPMENU_6 = 0x06,
    L_PREPMENU_B = 0x0B,
};

// TODO: MOOOOVE

#define BGCHR_PREPMENU_230 0x230
#define BGCHR_PREPMENU_240 0x240
#define BGCHR_PREPMENU_700 0x700

#define OBCHR_PREPMENU_240 0x240
#define OBCHR_PREPMENU_380 0x380

#define BGPAL_PREPMENU_2 0x02
#define BGPAL_PREPMENU_A 0x0A // ..E // background
#define BGPAL_PREPMENU_E 0x0E
#define BGPAL_PREPMENU_F 0x0F

#define OBPAL_PREPMENU_2 0x02 // ..4
#define OBPAL_PREPMENU_4 0x04
#define OBPAL_PREPMENU_5 0x05
#define OBPAL_PREPMENU_6 0x06 // ..A
#define OBPAL_PREPMENU_D 0x0D

extern u32 const gUnk_0831A268[]; // img(lz)
extern u32 const Img_SpinningArrow[]; // img(lz)
extern u32 const gUnk_08326930[]; // img(lz)
extern u16 const Pal_SpinningArrow[]; // pal
extern u16 const gUnk_0831AABC[]; // pal (x2)
extern u16 const gUnk_08326E64[]; // pal (x4)
extern u16 const gUnk_08327108[]; // pal
extern u32 const gUnk_0831B0A8[]; // img(lz)
extern u16 const gUnk_08320D98[]; // pal (x4)
extern u32 const gUnk_08321FA4[]; // img(lz)
extern u16 const gUnk_08326910[]; // pal

struct UnkProc_08678E18;
struct UnkProc_PrepMenu_50;

struct PrepMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2A;
    /* 2B */ u8 unk_2B;
    /* 2C */ u8 unk_2C;
    /* 2D */ u8 unk_2D; // size of gUnk_0200E6D4?
    /* 2E */ u8 unk_2E;
    /* 2F */ u8 unk_2F;
    /* 30 */ u8 unk_30; // id within gUnk_0200E6D4
    /* 31 */ u8 unk_31;
    /* 32 */ STRUCT_PAD(0x32, 0x33);
    /* 33 */ u8 unk_33[2];
    /* 35 */ u8 unk_35;
    /* 36 */ i8 unk_36;
    /* 37 */ u8 unk_37; // i8 also?
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3A;
    /* 3B */ u8 unk_3B;
    /* 3C */ u8 unk_3C;
    /* 3D */ u8 do_help;
    /* 3E */ u8 unk_3E;
    /* 3F */ u8 unk_3F;
    /* 40 */ u16 unk_40;
    /* 42 */ u16 unk_42;
    /* 44 */ u16 unk_44;
    /* 46 */ STRUCT_PAD(0x46, 0x48);
    /* 48 */ u32 unk_48;
    /* 4C */ u32 unk_4C;
    /* 50 */ struct UnkProc_PrepMenu_50 * unk_50;
    /* 54 */ STRUCT_PAD(0x54, 0x58);
    /* 58 */ ProcPtr unk_58;
    /* 5C */ struct UnkProc_08678E18 * unk_5C;
    /* 60 */ ProcPtr unk_60;
};

struct UnkProc_08678DE0
{
    /* 00 */ PROC_HEADER_EXT(struct PrepMenuProc);
    /* 29 */ STRUCT_PAD(0x29, 0x30);
    /* 30 */ u16 unk_30;
};

struct UnkProc_08678E00
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x48);
    /* 48 */ struct Unit * unit;
};

struct UnkProc_08678E18
{
    /* 00 */ PROC_HEADER_EXT(struct PrepMenuProc);
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct Unit * unit;
    /* 30 */ struct PrepMenuProc * main_proc;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
};

struct UnkProc_PrepMenu_50
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ u8 unk_2A;
};

void func_fe6_0807A67C(struct PrepMenuProc * proc);
fu8 func_fe6_0807CD24(fu8 arg_0);
void func_fe6_0807CEF0(fu8 arg_0, fu8 arg_1);
void PutPrepScreenMenuItems(struct Text * text, fu8 arg_1, u16 * tm, fu8 arg_3);
void func_fe6_08082D08(ProcPtr proc, int unused_1, fu16 obpal);
void ResetPrepMenuItem(void);

enum { SID_PID_POOL_SIZE = 5 };
extern u8 SioPidPool[SID_PID_POOL_SIZE];

// ResetSioPidPool
void RegisterSioPid(fu8 pid);
void RemoveSioPid(fu8 pid);
// func_fe6_0807921C
// func_fe6_08079250
// func_fe6_080792C8
// func_fe6_08079388
// func_fe6_080793F0
bool IsUnitMandatoryDeploy(struct Unit * unit);
// InitPrepScreenMainMenu
// func_fe6_08079624
// func_fe6_080796B0
// func_fe6_0807979C
// func_fe6_080797DC
// func_fe6_08079804
// func_fe6_080798EC
// func_fe6_08079928
// func_fe6_08079A28
// func_fe6_08079A94
// func_fe6_08079BC8
// func_fe6_08079C38
// func_fe6_08079D70
// func_fe6_08079D84
// func_fe6_08079EA0
// func_fe6_08079F50
void RearrangeMandatoryDeployUnits(void);
// SioResetUnitItems
// func_fe6_0807A1C8
// func_fe6_0807A268
// func_fe6_0807A59C
// func_fe6_0807A67C
// PrepMenu_InitExt
// func_fe6_0807A940
// func_fe6_0807ABF4
// func_fe6_0807AC9C
// func_fe6_0807ACE8
// PrepMenu_EndIfNoUnit
// PrepMenu_Init
// PrepMenu_Loop
// func_fe6_0807B0DC
// func_fe6_0807B0E4
// func_fe6_0807B178
// func_fe6_0807B200
// func_fe6_0807B28C
// func_fe6_0807B3D8
// func_fe6_0807B49C
// func_fe6_0807B4C0
// func_fe6_0807B5A0
// func_fe6_0807B69C
void StartPrepAtMenu(void);
// StartSioPrepMenu
// PrepMenuFadeIn_Init
// PrepMenuFadeIn_Loop
// func_fe6_0807B7C8
// StartPrepMenuFadeIn
// func_fe6_0807B89C
// func_fe6_0807B8B0
void func_fe6_0807B8CC(ProcPtr proc, fu8 arg_1, fu8 arg_2, int arg_3);
// func_fe6_0807B90C
// func_fe6_0807B9CC
// func_fe6_0807BC04
// func_fe6_0807BE88
// func_fe6_0807BF70
// func_fe6_0807C090
// PrepMenuBmCursor_Init
// PrepMenuBmCursor_Loop
// PrepMenuBmCursor_End
// PrepMenuBmCursor_Block
ProcPtr StartPrepMenuBmCursor(ProcPtr parent);
// func_fe6_0807C520
void func_fe6_0807C5B8(/* TODO: args */);
void func_fe6_0807C7B8(/* TODO: args */);
// func_fe6_0807C840
void func_fe6_0807C884(/* TODO: args */);
void func_fe6_0807C97C(/* TODO: args */);
void func_fe6_0807C9F4(/* TODO: args */);
void func_fe6_0807CA48(/* TODO: args */);
void func_fe6_0807CA9C(/* TODO: args */);
// func_fe6_0807CAD4
void func_fe6_0807CB08(/* TODO: args */);
// func_fe6_0807CB40
void func_fe6_0807CB78(/* TODO: args */);
void func_fe6_0807CBB0(/* TODO: args */);
void func_fe6_0807CBDC(/* TODO: args */);
// ResetPrepMenuItem
void SetPrepScreenMenuItem(void(*func)(/* TODO: args */), fu8 arg_1, int arg_2, fu8 arg_3, int arg_4, fu8 arg_5);
bool PrepMenuOnSelected(struct PrepMenuProc * proc);
// func_fe6_0807CD24
// PutPrepScreenMenuItems
void PrepMenuHelpbox(struct PrepMenuProc * proc);
// PrepMenuHelpbox
// func_fe6_0807CE98
// func_fe6_0807CEF0
// func_fe6_0807CF2C
// func_fe6_0807CF78
// func_fe6_0807CFA0
// func_fe6_0807CFA4
// func_fe6_0807CFB8
// func_fe6_0807CFBC
// func_fe6_0807CFDC
// func_fe6_0807D074
// func_fe6_0807D088
// func_fe6_0807D0A8
// func_fe6_0807D16C

extern struct Unit * gUnk_0200E6D4[];
extern struct Text gUnk_0200E7DC;
extern struct Text gUnk_0200E864[];
extern struct Text gUnk_0200E89C;
extern u16 gUnk_0200E8A4[];
extern struct Unit gUnk_0200F0A4[]; // rearrange buf
extern struct Text gUnk_0200E7E4[];
extern u8 gUnk_0200E7D4;
extern struct Text gUnk_0200E88C[];
extern u8 gUnk_020104A4[]; // img buf

extern u16 const gUnk_08320FCE[]; // tiles
extern u16 const gUnk_08326EE6[]; // tiles
