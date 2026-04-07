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

extern EWRAM_DATA i8 gEndingUids1[55];
extern EWRAM_DATA i8 gEndingUids2[14];

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
bool PersonEndingHasSupporter(u8 pid);
void EndingFacePosCtrlExt(void);
void HBlank_Ending_SinglePInfo(void);
void HBlank_Ending_DyadPInfo(void);
void SetupTrueEndingUids(void);
void SetupFakeEndingUids(void);
void SetupEndingPInfo2Uids(void);

struct ProcEndingPInfo1 {
	PROC_HEADER;

	/* 2C */ int timer;
	/* 30 */ int duration;
};

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
u8 PopNextEndingPerson(void);
u8 PopNextEnding2Person(u8 pos);
// EndingP0InfoText_Init
// EndingP0InfoText_Loop
// EndingPInfo1_PutP0InfoText
// EndingPInfo1_StartMerge
// EndingPInfo1_Idle
// EndingPInfo1_End
// EndingPInfo1Exists
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
