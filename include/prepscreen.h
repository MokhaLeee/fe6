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

enum prepscreen_text_idx {
    TEXT_PREP_PICK_LEFT_BAR = 0,
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

struct UnkProc_08678E18;
struct UnkProc_PrepMenu_50;

enum PREP_SUB2_ACTION_IDX {
    PREP_SUB2ACT_TRADE_ITEM = 2,
    PREP_SUB2ACT_CONVOY,
    PREP_SUB2ACT_DISCARD_ITEM,
    PREP_SUB2ACT_CHECK_ALL_ITEM,
    PREP_SUB2ACT_STATSCREEN,
    PREP_SUB2ACT_SAVEMENU,
};

struct PrepMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 in_unit_sel_screen;
    /* 2B */ u8 unk_2B;
    /* 2C */ u8 unk_2C;
    /* 2D */ u8 unk_2D; // size of gPrepUnitList?
    /* 2E */ u8 max_counter;
    /* 2F */ u8 cur_counter;
    /* 30 */ u8 list_num_cur; // id within gPrepUnitList
    /* 31 */ u8 unk_31;
    /* 32 */ u8 unk_32;
    /* 33 */ u8 unk_33[2];
    /* 35 */ u8 unk_35;
    /* 36 */ i8 hand_y_pos;
    /* 37 */ u8 unk_37; // i8 also?
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 unk_3A;
    /* 3B */ u8 sub2_action;
    /* 3C */ u8 a_button_actions; // Bit1:selection unit, Bit2:Start battle
    /* 3D */ u8 do_help;
    /* 3E */ u8 unk_3E;
    /* 3F */ u8 unk_3F;
    /* 40 */ u16 unk_40;
    /* 42 */ u16 scroll_timer;
    /* 44 */ u16 yDiff_cur;
    /* 46 */ STRUCT_PAD(0x46, 0x48);
    /* 48 */ u32 unk_48;
    /* 4C */ u32 unk_4C;
    /* 50 */ struct UnkProc_PrepMenu_50 * unk_50;
    /* 54 */ STRUCT_PAD(0x54, 0x58);
    /* 58 */ ProcPtr procbg;
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

void PrepScreen_DrawScreenInfo(struct PrepMenuProc * proc);
fu8 GetPrepMenuItemAmount(fu8 arg_0);
void func_fe6_0807CEF0(fu8 arg_0, fu8 arg_1);
void PutPrepScreenMenuItems(struct Text * text, fu8 arg_1, u16 * tm, fu8 arg_3);
void func_fe6_08082D08(ProcPtr proc, int unused_1, fu16 obpal);
void ResetPrepMenuItem(void);

enum { SID_PID_POOL_SIZE = 5 };
extern u8 SioPidPool[SID_PID_POOL_SIZE];

void ResetSioPidPool(void);
void RegisterSioPid(fu8 pid);
void RemoveSioPid(fu8 pid);
void func_fe6_0807921C(void);
void func_fe6_08079250(struct UnkProc_08678DE0 * proc);
void func_fe6_080792C8(struct UnkProc_08678DE0 * proc);
void func_fe6_08079388(struct UnkProc_08678DE0 * proc);
void func_fe6_080793F0(struct PrepMenuProc * parent);
bool IsUnitMandatoryDeploy(struct Unit * unit);
void InitPrepScreenMainMenu(struct PrepMenuProc * proc);
void PrepUnit_DrawLeftUnitInfo(struct Unit * unit, u16 * tm);
void PrepScreen_ReloadLeftUnitInfo(struct Unit * unit);
void func_fe6_0807979C(struct UnkProc_08678E00 * proc);
void func_fe6_080797DC(struct PrepMenuProc * parent);
void func_fe6_08079804(struct PrepMenuProc * proc);
void func_fe6_080798EC(struct PrepMenuProc * proc);
void func_fe6_08079928(struct PrepMenuProc * proc, int unit_id_or_pid, bool by_pid);
void func_fe6_08079A28(void);
void func_fe6_08079A94(struct PrepMenuProc * proc);
void func_fe6_08079BC8(struct UnkProc_08678E18 * proc);
void func_fe6_08079C38(struct UnkProc_08678E18 * proc);
struct UnkProc_08678E18 * func_fe6_08079D70(struct PrepMenuProc * parent);
void func_fe6_08079D84(struct PrepMenuProc * proc);
void PrepUnit_DrawPickLeftBar(struct PrepMenuProc * proc);
void PrepUnit_DrawUnitListNames(struct PrepMenuProc * proc, fu8 row);
void RearrangeMandatoryDeployUnits(void);
void SioResetUnitItems(void);
void func_fe6_0807A1C8(struct PrepMenuProc * proc, bool load_sprites);
void PrepMenu_InitScreenExt(struct PrepMenuProc * proc);
void PrepMenu_InitScreen(struct PrepMenuProc * proc);
void PrepScreen_DrawScreenInfo(struct PrepMenuProc * proc);
void PrepMenu_InitExt(struct PrepMenuProc * proc);
fi8 PrepUnitSel_Loop(struct PrepMenuProc * proc);
void func_fe6_0807ABF4(struct PrepMenuProc * proc);
void func_fe6_0807AC9C(struct PrepMenuProc * proc);
void func_fe6_0807ACE8(struct PrepMenuProc * proc);
void PrepMenu_EndIfNoUnit(struct PrepMenuProc * proc);
void PrepMenu_Init(struct PrepMenuProc * proc);
void PrepMenu_Loop(struct PrepMenuProc * proc);
// func_fe6_0807B0DC
// func_fe6_0807B0E4
// func_fe6_0807B178
// func_fe6_0807B200
// PrepMenu_ExecSub2Screen
// func_fe6_0807B3D8
// PrepScreen_ReloadLeftUnitInfoFromStatscreen
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
void func_fe6_0807B8B0(ProcPtr proc, int);
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
void PrepScreenMenu_OnPickUnits(struct PrepMenuProc * proc);
void PrepScreenMenu_OnItems(struct PrepMenuProc * proc);
// func_fe6_0807C840
void PrepScreenSubMenu_OnTrade(struct PrepMenuProc * proc);
void PrepScreenSubMenu_OnDiscard(struct PrepMenuProc * proc);
void PrepScreenSubMenu_Convoy(struct PrepMenuProc * proc);
void PrepScreenSubMenu_AllItems(struct PrepMenuProc * proc);
void PrepScreenSubMenu_Shop(struct PrepMenuProc * proc);
// func_fe6_0807CAD4
void PrepScreenMenu_Augury(struct PrepMenuProc * proc);
// func_fe6_0807CB40
void PrepScreenMenu_OnSave(struct PrepMenuProc * proc);
void PrepScreenMenu_OnCheckMap(struct PrepMenuProc * proc);
void PrepScreenSubMenu_StartBattle(struct PrepMenuProc * proc);
// ResetPrepMenuItem
void SetPrepScreenMenuItem(void(*func)(struct PrepMenuProc * proc), fu8 is_submenu, int name, fu8 color, int desc, fu8 index);
bool PrepMenuOnSelected(struct PrepMenuProc * proc);
// GetPrepMenuItemAmount
// PutPrepScreenMenuItems
void PrepMenuHelpbox(struct PrepMenuProc * proc);
// PrepMenuHelpbox
// func_fe6_0807CE98
// func_fe6_0807CEF0
u8 func_fe6_0807CF2C(u8, u8);
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

extern struct Unit * gPrepUnitList[];
extern struct Text gPrepScreenText_PickLeftBar;
extern struct Text gUnk_0200E864[];
extern struct Text gPrepScreenText_LeftPersonName;
extern u16 gUnk_0200E8A4[];
extern struct Unit gUnk_0200F0A4[]; // rearrange buf
extern struct Text gPrepScreenTexts_Units[];
extern u8 gUnk_0200E7D4;
extern struct Text gUnk_0200E88C[];
extern u8 gUnk_020104A4[]; // img buf

extern u16 const gUnk_08320FCE[]; // tiles
extern u16 const gUnk_08326EE6[]; // tiles
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
