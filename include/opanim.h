#pragma once

#include "prelude.h"
#include "proc.h"

enum videoalloc_opanim {
	OBPAL_OPANIM_0F = 0xF,
};

extern IWRAM_DATA u8 gUnk_03005280[4];
extern IWRAM_DATA bool bool_opanim_03005284;
extern IWRAM_DATA u8 Pad_Common_03005285[11];
extern IWRAM_DATA int gOpAnimStep[8];

void StartOpAnim_unused(void);
void OpAnimfxTerminator_Loop(ProcPtr proc);
void OpAnim_ResetDispIO(void);
void OpAnim_OnEnd(void);
void OpAnim_Init(void);
void func_fe6_080988BC(void);
void OpAnim6_ResetBG(void);
void OpAnim_SetWin0Layers(int arg_0, int arg_1, int arg_2, int arg_3, int arg_4);
void OpAnim_StartBGM(void);

struct ProcOpAnimTimer {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x54);
	u32 timer;
};

void OpAnim_StartTimer(ProcPtr proc);
void OpAnimTimer_Init(struct ProcOpAnimTimer *proc);
void OpAnimTimer_Loop(struct ProcOpAnimTimer *proc);
void OpAnimAdvance(void);
void PutOpAnimSubtitle0(void);
void PutOpAnimSubtitle1(void);
void PutOpAnimSubtitle2(void);
void PutOpAnimSubtitle3(void);
void PutOpAnimSubtitle4(void);
void PutOpAnimSubtitle5(void);
void PutOpAnimSubtitle6(void);
void PutOpAnimSubtitle7(void);
void OpAnim_SetupGlyph(int pal_id);
void OpAnim_PutSubtitle(int idx);

struct ProcOpAnimSubtitleDisp {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x2C);

	/* 2C */ int x_center;
	/* 30 */ int unk_30;

	STRUCT_PAD(0x34, 0x44);

	/* 44 */ i16 delay_timer;

	STRUCT_PAD(0x46, 0x4C);

	/* 4C */ char *str;

	STRUCT_PAD(0x50, 0x54);

	/* 54 */ int index;

	STRUCT_PAD(0x58, 0x64);

	/* 64 */ u16 unk_64;
};

void NewOpAnimSubtitleDisp(int idx, int a, int b, char *str);
void OpAnimSubtitleDisp_Init(struct ProcOpAnimSubtitleDisp *proc);
void OpAnimSubtitleDisp_Wait(struct ProcOpAnimSubtitleDisp *proc);
void OpAnimSubtitleDisp_Setup(struct ProcOpAnimSubtitleDisp *proc);
void OpAnimSubtitleDisp_Loop(struct ProcOpAnimSubtitleDisp *proc);
// func_fe6_08098C90
// func_fe6_08098C94
// func_fe6_08098CA4
// func_fe6_08098CC0
// func_fe6_08098D10
// func_fe6_08098DB0
// func_fe6_08098DEC
// func_fe6_08098E74
// func_fe6_08098EC8
// func_fe6_08098F68
// func_fe6_08098FA8
// func_fe6_080990B8
// func_fe6_080990E4
// func_fe6_080990F0
// func_fe6_080990FC
// func_fe6_08099194
// func_fe6_080992B8
// func_fe6_080992D0
// func_fe6_080992DC
// func_fe6_08099314
int func_fe6_08099328(const char *str);
char *OpAnimSubtitleStringAdvance(char *str);
void func_fe6_0809937C(void);
// func_fe6_080993AC
// func_fe6_080993E8
void PutImg_OpAnimGlyphs(void);
// func_fe6_08099424
// func_fe6_0809947C
// func_fe6_08099520
// func_fe6_08099534
// func_fe6_08099540
// func_fe6_08099580
// func_fe6_080995B0
// func_fe6_08099644
// func_fe6_08099654
// func_fe6_08099738
// func_fe6_08099750
// func_fe6_08099768
// func_fe6_08099784
// func_fe6_08099794
// func_fe6_0809979C
// func_fe6_0809980C
// func_fe6_08099824
// func_fe6_08099868
// func_fe6_080998D4
// func_fe6_0809992C
// func_fe6_0809997C
// func_fe6_08099A2C
// func_fe6_08099A84
// func_fe6_08099A90
// func_fe6_08099AD0
// func_fe6_08099B18
// func_fe6_08099B34
// func_fe6_08099B44
// func_fe6_08099B5C
// func_fe6_08099BA8
// func_fe6_08099BCC
// func_fe6_08099BE4
// func_fe6_08099CCC
// func_fe6_08099D3C
// func_fe6_08099DA4
// func_fe6_08099E50
// func_fe6_08099EC0
// func_fe6_08099F98
// func_fe6_08099F9C
// func_fe6_08099FA8
// func_fe6_08099FD0
// func_fe6_0809A014
// func_fe6_0809A034
// func_fe6_0809A048
// func_fe6_0809A068
// func_fe6_0809A0A8
// OpAnimSparksOBJ_Init
// OpAnimSparksOBJ_Loop
// PutOpAnimSparksObjGfx
// func_fe6_0809A13C
// OpAnimSparksOBJFALL_Init
// OpAnimSparksOBJFALL_Loop
// func_fe6_0809A264
// func_fe6_0809A26C
// func_fe6_0809A2CC
// func_fe6_0809A3A4
// func_fe6_0809A3D4
// func_fe6_0809A484
// func_fe6_0809A4C4
// func_fe6_0809A53C
// func_fe6_0809A564
// func_fe6_0809A588
// func_fe6_0809A600
// func_fe6_0809A638
// func_fe6_0809A6DC
// func_fe6_0809A6E4
// func_fe6_0809A804
// func_fe6_0809A80C
// func_fe6_0809A868
// func_fe6_0809A8A4
// func_fe6_0809A8B4
// func_fe6_0809A900

struct ProcOpAnim6 {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x44);

	i16 unk_44;

	STRUCT_PAD(0x46, 0x64);

	i16 unk_64;
};

void OpAnim_PutThunderStormGfx(void);
void func_fe6_0809AA20(int a, int b);
void OpAnim6_StartBGM(struct ProcOpAnim6 *proc);
void OpAnim6_PutThunderStormGfx(struct ProcOpAnim6 *proc);
void OpAnim6_StartThunderStorm(struct ProcOpAnim6 *proc);
// OpAnimThunderStorm_Init
// OpAnimThunderStorm_PutPal1
// OpAnimThunderStorm_PutPal2
// OpAnimThunderStorm_PutPal3
// OpAnimThunderStorm_PutPal4
// OpAnimThunderStorm_PutPal5
// OpAnim6_PutIdunnGfx
// func_fe6_0809AD3C
// func_fe6_0809AD64
// func_fe6_0809AD88
// func_fe6_0809ADCC
// func_fe6_0809AE60
// func_fe6_0809AEA0
// func_fe6_0809AEC4
// func_fe6_0809AED4
// func_fe6_0809AF30
// func_fe6_0809AF74
// func_fe6_0809AF84
// func_fe6_0809AFE4
// func_fe6_0809B01C
// func_fe6_0809B024
// func_fe6_0809B094
// func_fe6_0809B0A4
// func_fe6_0809B0E8
// func_fe6_0809B188
// func_fe6_0809B220
// func_fe6_0809B280

extern CONST_DATA struct ProcScr ProcScr_TitleScreenHandler[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim[];
extern u16 CONST_DATA BgConf_OpAnim_08691604[];
extern u16 CONST_DATA BgConf_OpAnim_0869161C[];
extern CONST_DATA struct ProcScr ProcScr_OpAnimTimer[];
// ??? gUnk_08691644
// ??? gUnk_086916E5
extern CONST_DATA int Msgs_OpAnim_08691738[];

struct OpAnimSubtitleConf {
	u16 unk_00;
	u16 unk_02;

	STRUCT_PAD(0x4, 0x8);

	u16 *unk_08;
};
extern CONST_DATA struct OpAnimSubtitleConf gOpAnimSubtitleConf[];

extern CONST_DATA struct ProcScr ProcScr_OpAnimSubtitleDisp[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691810[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691828[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691840[];
extern CONST_DATA struct ProcScr NewOpAnimSubtitleIntroDisp[];
extern CONST_DATA struct ProcScr ProcScr_08691890[];
// ??? gUnk_086918B0
extern CONST_DATA struct ProcScr ProcScr_OpAnim1[];
extern CONST_DATA struct ProcScr ProcScr_Unk_086919D0[];
extern CONST_DATA struct ProcScr ProcScr_Unk_086919E8[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim2[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691AC0[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim_08691B20[];
extern u16 CONST_DATA BgConf_OpAnim_08691B38[];
extern u16 CONST_DATA BgConf_OpAnim_08691B50[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim4[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691C38[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691C58[];
// ??? gUnk_08691C78
extern CONST_DATA struct ProcScr ProcScr_OpAnimSparksOBJ[];
extern CONST_DATA struct ProcScr ProcScr_OpAnimSparksOBJFALL[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim_08691CC0[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim3[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691D70[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691D88[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691DB8[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim_08691DE8[];
extern u16 CONST_DATA BgConf_OpAnim_08691DF8[];

struct OpAnim_08691E10 {
	u8 unk_00;
	u8 tileref;
	i8 unk_02;
	u8 _pad_;
};
extern CONST_DATA struct OpAnim_08691E10 OpAnim_08691E10[];

struct OpAnim_08691E30 {
	u8 unk_00;
	u8 tileref;
	u16 unk_02;
};
extern CONST_DATA struct OpAnim_08691E30 OpAnim_08691E30[];

extern CONST_DATA struct ProcScr ProcScr_OpAnim6[];
extern CONST_DATA struct ProcScr ProcScr_OpAnimThunderStorm[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim5[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08691FF8[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08692060[];
extern CONST_DATA struct ProcScr ProcScr_Unk_08692090[];
extern u16 CONST_DATA BgConf_OpAnim_086920A0[];
extern u16 CONST_DATA BgConf_OpAnim_086920B8[];
extern CONST_DATA struct ProcScr ProcScr_OpAnim_Nintendo[];
extern CONST_DATA int gTitleDuration;
extern CONST_DATA int gUnk_0869211C;
extern CONST_DATA int gUnk_08692120;
extern CONST_DATA int gUnk_08692124;
extern CONST_DATA int gUnk_08692128;
extern CONST_DATA int gUnk_0869212C;
extern CONST_DATA struct ProcScr ProcScr_TitleScreenFromOp[];
