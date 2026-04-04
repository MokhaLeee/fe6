#pragma once

#include "prelude.h"
#include "proc.h"

enum video_alloc_credit {
	BGPAL_CREDIT_GLYPH = 4,
	OBPAL_CREDIT_GLYPH = 4,

	BGCHR_CREDIT_GLYPH_NARROW = 0x80,
	OBCHR_CREDIT_GLYPH_CAP = 0x280,
	OBCHR_CREDIT_GLYPH_LOW = 0x200,
};

enum ending_disp_type {
	ENDING_DISP_0 = 0,
	ENDING_DISP_1,
	ENDING_DISP_2,
	ENDING_DISP_3,
};

struct ProcEndingCredit {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x64);

	u16 unk_64;
};

struct ProcEndingfx {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x4C);

	i16 unk_4C;
};

// SetupCreditCharacterGlyphs
// PutEndingCreditTm
// EndingCredit_Reinit
// GameCredit_Init
void EndingCredit_ReinitType2(struct ProcEndingCredit *proc);
void EndingCredit_ReinitType0(struct ProcEndingCredit *proc);
// func_fe6_0808FF04
// func_fe6_0808FF9C
// func_fe6_0808FFE0
// func_fe6_080902F0
// func_fe6_080904F0
// func_fe6_08090508
// func_fe6_0809058C
// func_fe6_080905A0
// func_fe6_0809060C
void EndingStepAdvance(void);
// func_fe6_08090630
// func_fe6_08090644
// func_fe6_08090660
// EndingCredit_Init
// EndingCredit_WaitingDisp
// EndingCredit_Ending
// EndingCopyRight_Init
// EndingCopyRight_Loop
void func_fe6_08090854(u16 *tm, int oam2);
// EndingStep1_End
// EndingStep1_Init
// EndingStep1_Loop
// Fin_Init
// Fin_Loop
// func_fe6_08090BA0
// func_fe6_08090BC8
// func_fe6_08090D34
bool func_fe6_08090D54(void);
// Ending_Init
// Ending_Loop
void StartCharacterEndings(void);
// GameCredit_Loop
void StartGameCredit(void);
// PersonEndingHasSupporter
void EndingFacePosCtrlExt(void);
// HBlank_Ending_SinglePInfo
void HBlank_Ending_DyadPInfo(void);
void func_fe6_080914DC(void);
void func_fe6_0809154C(void);
void SetupEndingPInfo2Uids(void);

struct ProcEndingPInfoDisp {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x2C);

	/* 2C */ int timer;
};

struct ProcEndingPinfoText {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x54);

	int text_x;
};

extern IWRAM_DATA ProcPtr gEndingFace1;

// EndingPInfoDisp_InitDisp
// PopNextEndingPerson
u8 PopNextEnding2Person(u8 pos);
// EndingPInfo1Detail_PutText
// EndingPInfo1Detail_WaitingTypewritter
// EndingPInfo1_DrawDetails
// EndingPInfo1_StartMerge
// EndingPInfo1_Idle
// func_fe6_08091A24
// func_fe6_08091A4C
void EndingP1InfoText_Init(struct ProcEndingPinfoText *proc);
void EndingP1InfoText_Loop(struct ProcEndingPinfoText *proc);
void SpawnEndingP1InfoText(void);
void EndingP2InfoText_Init(struct ProcEndingPinfoText *proc);
void EndingP2InfoText_Loop(struct ProcEndingPinfoText *proc);
void SpawnEndingP2InfoText(void);
void Ending_DrawDyadPInfo(struct ProcEndingPInfoDisp *proc);
void EndingPInfoDisp_Loop(struct ProcEndingPInfoDisp *proc);
void EndingPInfoDisp_End(struct ProcEndingPInfoDisp *proc);
bool EndingFacePosCtrlExists(void);
void EndingFacePosCtrl_Init(ProcPtr proc);
void EndingFacePosCtrl_Loop(ProcPtr proc);
void Ending_DrawPInfoTitle(u8 x, u8 y, struct Unit *unit, u8 type);
