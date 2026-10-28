#pragma once

#include "prelude.h"
#include "proc.h"
#include "text.h"
#include "save_multiarena.h"

struct ProcSioBlend
{
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x58);

    /* 58 */ u32 timer;
};

struct ProcSioHold
{
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ int y_min;
    /* 38 */ int y_max;
};

struct SioSaveConf
{
    u8 unk_0 : 1;
    u8 unk_1 : 1;
    u8 unk_2 : 1;
    u8 unk_3 : 1;
    u8 unk_4 : 4;
    u8 unk_8;
};

struct LinkArenaTeamEnt
{
    /* 00 */ char name[MULTIARENA_TEAMNAME_SIZE + 1];
    /* 0F */ u8 unk_0F;
    /* 10 */ u8 unk_10;
    /* 11 */ STRUCT_PAD(0x11, 0x14);
};

struct LATeamListConfig
{
    /* 00 */ u8 kind;
    /* 01 */ STRUCT_PAD(0x01, 0x02);
    /* 02 */ u16 help_msg;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ STRUCT_PAD(0x06, 0x08);
    /* 08 */ char const * menu_text;
    /* 0C */ bool (* is_valid)(void);
};

enum
{
    MULTIARENA_LIST_NONE = 0,
    MULTIARENA_LIST_BUILDTEAM = 1,
    MULTIARENA_LIST_SELECTTEAM = 2,
    MULTIARENA_LIST_UNITLIST = 3,
    MULTIARENA_LIST_SWAP = 4,
    MULTIARENA_LIST_CONFIRMSWAP = 5,
    MULTIARENA_LIST_DISBAND = 6,
    MULTIARENA_LIST_LINKMENU = 7,
    MULTIARENA_LIST_8 = 8,
};

struct SioProc85AAA78
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int unk_2C;
    /* 30 */ i16 unk_30[5];
    /* 3A */ u8 unk_3A[5];
    /* 3F */ STRUCT_PAD(0x3F, 0x40);
    /* 40 */ int unk_40;
    /* 44 */ i8 unk_44;
    /* 45 */ STRUCT_PAD(0x45, 0x48);
    /* 48 */ int unk_48;
};

struct SioTeamListProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ struct SioProc85AAA78 * unk_2C;
    /* 30 */ ProcPtr sio_hold_proc;
    /* 34 */ int num_active_options;
    /* 38 */ int unk_38;
    /* 3C */ int option_idx;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u8 unk_48;
    /* 49 */ STRUCT_PAD(0x49, 0x4A);
    /* 4A */ u16 y_bg1;
    /* 4C */ i8 unk_4C;
    /* 4D */ u8 valid_options[5];
    /* 52 */ u8 selected_option;
    /* 53 */ u8 selected_team;
    /* 54 */ u8 unk_54;
    /* 55 */ u8 unk_55;
    /* 56 */ STRUCT_PAD(0x56, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ i8 unk_5C;
};

extern struct Text gSioText_0203C67C[];
extern struct Text gSioText_0203C6A4;
extern struct SioSaveConf gSioSaveConfig;
extern struct Font gSioFont_0203C758;
extern struct LinkArenaTeamEnt gLinkArenaTeamList[];
extern struct Text gSioTexts[2];
extern u16 gKeyInputSequenceBuffer[16];
extern int gKeyInputSequenceTimer;
extern char gUnk_Sio_0203C944[][MULTIARENA_TEAMNAME_SIZE + 1];
extern int gCurrentKeyInSeqIndex;
extern int gTargetKeyInSeqIndex;

extern char const SioText_NoData[];
extern char const gUnk_Sio_0810F170[];
extern int const gUnk_Sio_0810F190[];
extern u8 const gUnk_Sio_0810F19C[];
extern i8 const gXposArray_SioTeamListSwicthing[];
extern char const gUnk_Sio_0810F1AC[];

extern struct ProcScr CONST_DATA ProcScr_SioHOLD[];
extern u16 CONST_DATA KeyList_SioSecretTeam[];
extern u16 CONST_DATA gSioKeyList_PasswordScreenEN[];
extern struct LATeamListConfig * CONST_DATA gSioTeamListConfigLut[];
extern void const * CONST_DATA gUnk_Sio_085C9AD4[];
extern struct ProcScr CONST_DATA ProcScr_SioTeamList[];

extern u8 const Img_TacticianSelObj[];
extern u16 const Pal_TacticianSelObj[];
extern u8 const Img_Sio_081080D4[];
extern u8 const Tsa_Sio_08109DF4[];

void SIOCON_Init(void);
void SIOCON_Loop(ProcPtr proc);
void SetBmStLinkArenaFlag(void);
void UnsetBmStLinkArenaFlag(void);
void func_fe6_080369A0(struct ProcSioBlend * proc);
void func_fe6_080369E0(struct ProcSioBlend * proc);
void func_fe6_08036A40(void);
void func_fe6_08036A54(ProcPtr proc);
void func_fe6_08036A80(void);
void func_fe6_08036A94(ProcPtr proc);
void SioHold_Loop(struct ProcSioHold * proc);
ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min);
void EndSioHold(void);
void func_fe6_08036B38(ProcPtr proc, int num);
void ClearSioBG(void);
void ClearSioAllBGs(void);
void SioPutText(int msg, int text_idx);
void func_fe6_08036C60(void);
void SioSetNormalWeapons(struct Unit * unit);
void SioPlaySe(int idx);
void func_fe6_08036D3C(void);
bool SioIsKeyInputSequenceComplete(u16 const * list);
void StartLinkArenaTeamList(ProcPtr parent);
void SioTeamList_Init(struct SioTeamListProc * proc);
bool CanBuildNewLinkArenaTeam(void);
bool CanDirectlyBuildNewLinkArenaTeam(void);
int GetSioTeams(int active_option, u8 mode);
void DrawLinkArenaTeamName(int idx);
void DrawAllLinkArenaTeams(struct SioTeamListProc * proc);
void func_fe6_0803703C(struct SioTeamListProc * proc, u8 mode);
void SioTeamList_EraseTeam(struct SioTeamListProc * proc);
void SioTeamList_SwapTeams(struct SioTeamListProc * proc);
int func_fe6_080372B0(u8 mode, struct SioTeamListProc * proc);
u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc);
void SioTeamList_SetupGfx(struct SioTeamListProc * proc);
void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total);
void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc);
void SioTeamList_StartUnitList(struct SioTeamListProc * proc);
void SioTeamList_WaitForUnitListScreen(ProcPtr proc);
int func_fe6_0803784C(void);
void SioTeamList_Loop_SubSel(struct SioTeamListProc * proc);
void func_fe6_08037D74(struct SioProc85AAA78 * proc, i8 x);
void SioTeamList_SubSel_Switching(struct SioTeamListProc * proc);
void func_fe6_08037E14(struct SioTeamListProc * proc);
void SioTeamList_StartEraseTeamSubMenu(struct SioTeamListProc * proc);
void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc);
void SioTeamList_LoadTeam_Dummy(struct SioTeamListProc * proc);

void InitSioBG(void);
void Sio_RestartBgSlide(int a, int b);
void Sio_EndBackgroundSlide(void);
void StartLinkArenaTitleBanner(ProcPtr parent, int arg);
void func_fe6_0803FD40(void const * a, int b, int c, int d, int e, ProcPtr parent);
struct SioProc85AAA78 * func_fe6_080403C0(ProcPtr parent, int count, u8 * buf);
void ScrollMultiArenaTeamSprites(int amount);
void UpdateLinkArenaMenuScrollBar(u8 a, i16 b);
void SioPutSupportMenuImage(void);
void PutLinkArenaChoiceBannerSprite(int x, int y);
