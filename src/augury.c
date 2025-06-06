#include "prelude.h"
#include "hardware.h"
#include "armfunc.h"
#include "menu.h"
#include "bm.h"
#include "faction.h"
#include "unit.h"
#include "talk.h"
#include "msg.h"
#include "ui.h"
#include "util.h"
#include "constants/msg.h"

struct UnkStruct_0868AF58 {
	u8 x, y;

	u8 _pad_[2];
};

struct AuguryConfig {
	/* 00 */ u8 fid;
	/* 01 */ u8 pid;

	STRUCT_PAD(0x02, 0x10);
};

CONST_DATA int AuguryMsgs[] = {
	MSG_716, MSG_717, MSG_718, MSG_719, MSG_71A,
	MSG_71B, MSG_71C, MSG_6F3, MSG_6F4, MSG_6FC,
	MSG_6FD, MSG_6FE, MSG_707, MSG_6FB, MSG_6FA,
	MSG_6F9, MSG_6F8, MSG_6F7, MSG_6F6, MSG_6F5,
	MSG_706, MSG_705, MSG_704, MSG_703, MSG_702,
	MSG_701, MSG_700, MSG_708, MSG_709, MSG_70A,
	MSG_70B, MSG_70C, MSG_70D, MSG_70E, MSG_70F,
	MSG_710, MSG_711, MSG_712, MSG_713, MSG_714,
	MSG_715,
};

CONST_DATA struct UnkStruct_0868AF58 gUnk_0868AF58[] = {
	{ 0x0D, 2, 0, 0 },
	{ 0x0D, 4, 0, 0 },
	{ 0x0D, 6, 0, 0 },
	{ 0x0D, 8, 0, 0 },
	{ 0x14, 2, 0, 0 },
	{ 0x14, 4, 0, 0 },
	{ 0x14, 6, 0, 0 }
};

extern struct AuguryConfig gAuguryConfig[];
extern CONST_DATA u16 BgConf_Augury[];

EWRAM_OVERLAY(0) i16 gAuguryIndex = 0;
EWRAM_OVERLAY(0) u16 unk_020169CE = 0;
EWRAM_OVERLAY(0) u16 unk_020169D0 = 0;
EWRAM_OVERLAY(0) u16 unk_020169D2 = 0;
EWRAM_OVERLAY(0) u8 gAuguryStatus[7] = {};
EWRAM_OVERLAY(0) u8 gCurrentAuguryIndex = 0;
EWRAM_OVERLAY(0) i8 gAuguryChoice = 0;
EWRAM_OVERLAY(0) struct Text gAuguryTexts[7] = {};
EWRAM_OVERLAY(0) i16 unk_02016A18 = 0;
EWRAM_OVERLAY(0) i16 unk_02016A1A = 0;
EWRAM_OVERLAY(0) i16 unk_02016A1C = 0;
EWRAM_OVERLAY(0) u16 unk_02016A1E = 0;
EWRAM_OVERLAY(0) u16 unk_02016A20 = 0;
EWRAM_OVERLAY(0) u16 unk_02016A22 = 0;
EWRAM_OVERLAY(0) u16 unk_02016A24 = 0;
EWRAM_OVERLAY(0) u16 unk_02016A26 = 0;
EWRAM_OVERLAY(0) u16 unk_02016A28 = 0;
EWRAM_OVERLAY(0) u16 unk_02016A2A = 0;
EWRAM_OVERLAY(0) u8 unk_02016A2C = 0;
EWRAM_OVERLAY(0) u8 unk_02016A2D = 0;
EWRAM_OVERLAY(0) u16 unk_02016A2E[7] = {};
EWRAM_OVERLAY(0) u8 unk_02016A3C = 0;
EWRAM_OVERLAY(0) u8 unk_02016A3D = 0;
EWRAM_OVERLAY(0) u8 unk_02016A3E = 0;
EWRAM_OVERLAY(0) u8 unk_02016A3F = 0;
EWRAM_OVERLAY(0) u8 unk_02016A40 = 0;
EWRAM_OVERLAY(0) u8 unk_02016A41 = 0;
EWRAM_OVERLAY(0) u8 unk_02016A42 = 0;
EWRAM_OVERLAY(0) u8 unk_02016A43 = 0;
EWRAM_OVERLAY(0) u8 unk_02016A44[0x7F] = {};
EWRAM_OVERLAY(0) u8 unk_02016AC3[0x81] = {};
EWRAM_OVERLAY(0) u8 unk_02016B44 = 0;
EWRAM_OVERLAY(0) struct Text Texts_02016B48[6] = {};
EWRAM_OVERLAY(0) struct Text Texts_02016B78[2] = {};
EWRAM_OVERLAY(0) u8 unk_02016B88 = 0;
EWRAM_OVERLAY(0) u8 unk_02016B89 = 0;
EWRAM_OVERLAY(0) u8 unk_02016B8A = 0;
EWRAM_OVERLAY(0) ProcPtr gpAuguryFaceProc = NULL;
EWRAM_OVERLAY(0) u16 unk_02016B90 = 0;
EWRAM_OVERLAY(0) u16 unk_02016B92 = 0;
EWRAM_OVERLAY(0) u8 unk_02016B94[0x100] = {};
EWRAM_OVERLAY(0) u8 unk_02016C94[0x100] = {};

bool func_fe6_0808D0C0(struct MenuProc *proc)
{
	TmFillRect(gBg0Tm + TM_OFFSET(12, 1), 6, 14, 0);
	TmFillRect(gBg1Tm + TM_OFFSET(11, 0), 8, 16, 0);

	EndMenu(proc);
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
	return true;
}

u8 GetAuguryIndex(void)
{
	if (gPlaySt.chapter > 12) {
		int i;

		for (i = 0; i < 2; i++) {
			struct Unit *prophet = GetUnitByPid(gAuguryConfig[i].pid);

			if (prophet) {
				FOR_UNITS_FACTION(FACTION_BLUE, unit, {
					if (UNIT_PID(unit) == gAuguryConfig[i].pid)
						return i ^ 1;
				})
			}
		}
	}
	return -1;
}

void StartAuguryDialogue1(int msg, ProcPtr proc)
{
	SetInitTalkTextFont();
	ClearTalkText();
	EndTalk();

	StartTalkExt(10, 14, DecodeMsg(msg), proc);
	SetTalkPrintColor(TEXT_COLOR_SYSTEM_GRAY);

	SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

	SetTalkPrintDelay(3);
	SetActiveTalkFace(TALK_FACE_1);
}

void StartAuguryDialogue2(int msg)
{
	SetInitTalkTextFont();
	ClearTalkText();
	EndTalk();

	StartTalk(10, 14, DecodeMsg(msg));
	SetTalkPrintColor(TEXT_COLOR_SYSTEM_GRAY);

	SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

	SetTalkPrintDelay(3);
	SetActiveTalkFace(TALK_FACE_1);
}

void func_fe6_0808D204(void)
{
	InitBgs(BgConf_Augury);
}

void func_fe6_0808D214(ProcPtr proc)
{
	SetBlendAlpha(0x10, 1);
	SetBlendTargetA(0, 1, 0, 0, 0);
	SetBlendTargetB(0, 0, 0, 1, 0);
	SetWinEnable(1, 0, 0);
	SetWin0Box(0x40, 0x68, -0x10, -0x68);
	SetWin0Layers(1, 1, 1, 1, 1);
	SetWOutLayers(1, 1, 1, 1, 1);
    gDispIo.win_ct.win0_enable_blend = 1;
    gDispIo.win_ct.wout_enable_blend = 0;

	PutTalkBubbleTm(9, 13, 20, 6);
	PutTalkBubbleTail(8, 16, 2);
	EnableBgSync(BG1_SYNC_BIT);
	func_fe6_0808D954(proc);
}

void func_fe6_0808D308(void)
{
	int x = gUnk_0868AF58[gAuguryIndex].x * 8 - 2;
	int y = gUnk_0868AF58[gAuguryIndex].y * 8;

	switch (gAuguryChoice) {
	case 1:
		PutUiHand(x, y);
		break;

	case 2:
		PutFrozenUiHand(x, y);
		break;

	default:
		break;
	}
	PutOamHi(0x20, 8, Obj_AuguryUI, 0x2080);
}

void func_fe6_0808D368(void)
{
	gAuguryChoice = 1;
}

void func_fe6_0808D374(void)
{
	int i;

	unk_020169CE = 0;
	gAuguryChoice = 0;
	gCurrentAuguryIndex = GetAuguryIndex();

	if (gCurrentAuguryIndex == (u8)-1)
		gCurrentAuguryIndex = 2;

	ResetText();
	UnpackUiWindowFrameGraphics();
	SetDispEnable(1, 1, 0, 1, 1);

	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_3, 0, 0);

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg3Tm, 0);

	ApplyPalette(Pal_0833C01C, 4);
	ApplyPalette(Pal_0833C01C + 0x10, 0x12);

	Decompress(Img_0833C09C, OBJ_VRAM0 + 0x1000);
	Decompress(Img_MuralBackground, (void *)BG_VRAM + GetBgChrOffset(BG_3));
	UnpackUiWindowFrameImg((void *)BG_VRAM + 0x3000);
	UnpackUiWindowFrameGraphics();

	TmApplyTsa(gBg1Tm, Tsa_0833C1D8, 0x1180);
	TmApplyTsa(gBg1Tm + TM_OFFSET(11, 1), Tsa_0833C234, 0x1180);
	func_fe6_08090854(gBg3Tm, 0x4000);
	ResetTextFont();

	for (i = 0; i < 7; i++) {
		struct Text *text = &gAuguryTexts[i];

		InitText(text, 6);
		ClearText(text);

		PutDrawText(
			text,
			gBg0Tm + TM_OFFSET(gUnk_0868AF58[i].x, gUnk_0868AF58[i].y),
			TEXT_COLOR_SYSTEM_WHITE, 0, 6,
			DecodeMsg(AuguryMsgs[i])
		);
	}

	gAuguryIndex = 0;
	func_fe6_0808D6D4(0, 0);
	InitTalk(0x200, 2, 1);
	StartTalkFace(gAuguryConfig[gCurrentAuguryIndex].fid, 0x20, 0x50, FACE_DISP_FLIPPED | 2, TALK_FACE_1);
	SpawnProc(ProcScr_0868AFD8, PROC_TREE_3);
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG3_SYNC_BIT);

	unk_02016A2E[0] = gAuguryStatus[1] = func_fe6_0808F33C();
	unk_02016A2E[1] = gAuguryStatus[2] = func_fe6_0808F490();
	unk_02016A2E[2] = gAuguryStatus[3] = func_fe6_0808F524();
	unk_02016A2E[3] = gAuguryStatus[4] = func_fe6_0808F5AC();
	unk_02016A2E[4] = gAuguryStatus[5] = func_fe6_0808F600();
	unk_02016A2E[5] = gAuguryStatus[6] = func_fe6_0808F68C();
	gAuguryStatus[0] = func_fe6_0808F6E0();
}
