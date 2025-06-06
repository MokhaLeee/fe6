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
#include "sound.h"
#include "constants/msg.h"
#include "constants/songs.h"

#include "augury.h"

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

CONST_DATA struct AuguryDispConfig gAuguryDispConfig[] = {
	{ 0x0D, 2, 0, 0 },
	{ 0x0D, 4, 0, 0 },
	{ 0x0D, 6, 0, 0 },
	{ 0x0D, 8, 0, 0 },
	{ 0x14, 2, 0, 0 },
	{ 0x14, 4, 0, 0 },
	{ 0x14, 6, 0, 0 }
};

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

void Augury_InitBG(void)
{
	InitBgs(BgConf_Augury);
}

void Augury_InitIO(ProcPtr proc)
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
	int x = gAuguryDispConfig[gAuguryIndex].x * 8 - 2;
	int y = gAuguryDispConfig[gAuguryIndex].y * 8;

	switch (gAuguryChoice) {
	case AUGURY_CHOICE_1:
		PutUiHand(x, y);
		break;

	case AUGURY_CHOICE_2:
		PutFrozenUiHand(x, y);
		break;

	default:
		break;
	}
	PutOamHi(0x20, 8, Obj_AuguryUI, 0x2080);
}

void func_fe6_0808D368(void)
{
	gAuguryChoice = AUGURY_CHOICE_1;
}

void Augury_Init(void)
{
	int i;

	unk_020169CE = 0;
	gAuguryChoice = AUGURY_CHOICE_0;
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
			gBg0Tm + TM_OFFSET(gAuguryDispConfig[i].x, gAuguryDispConfig[i].y),
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

void func_fe6_0808D59C(ProcPtr proc)
{
	int val;

	switch (unk_020169CE) {
	case 0:
		unk_020169D0 = 0;
		unk_020169D2 = 0x10;
		unk_020169CE += 1;
		break;

	case 1:
		val = unk_020169D2 / 4;

		if (val == 0)
			val = 1;

		if (unk_020169D2 > 1) {
			unk_020169D0 += val;
			unk_020169D2 -= val;

			SetBlendAlpha(unk_020169D0, unk_020169D2);
		} else {
			unk_020169CE = 0;
			Proc_Break(proc);
		}
		break;

	default:
		break;
	}
}

void func_fe6_0808D630(ProcPtr proc)
{
	int val;

	switch (unk_020169CE) {
	case 0:
		if (!IsTalkActive()) {
			ClearTalkText();
			EndTalk();
			EnableBgSync(BG0_SYNC_BIT);
			unk_020169D0 = 0x10;
			unk_020169D2 = 0;
			unk_020169CE += 1;
		}
		break;

	case 1:
		val = unk_020169D0 / 4;

		if (val == 0)
			val = 1;

		if (unk_020169D0 >= 1) {
			unk_020169D0 -= val;
			unk_020169D2 += val;

			SetBlendAlpha(unk_020169D0, unk_020169D2);
		} else {
			unk_020169CE = 0;
			Proc_Break(proc);
		}
		break;

	default:
		break;
	}
}

void func_fe6_0808D6D4(u16 a, u16 b)
{
	int offset, tmp, tileref0, tileref1;

	tileref0 = 0x11DE;
	tileref1 = 0x11DD;
	if (a <= 3) {
		tmp = tileref0;

		tileref0 = tileref1;
		tileref1 = tmp;
	}

	offset = TM_OFFSET(gAuguryDispConfig[a].x, gAuguryDispConfig[a].y + 1) - 1;

	gBg1Tm[offset + 0] = tileref0;
	gBg1Tm[offset + 1] = tileref1;
	gBg1Tm[offset + 2] = tileref0;
	gBg1Tm[offset + 3] = tileref1;
	gBg1Tm[offset + 4] = tileref0;
	gBg1Tm[offset + 5] = tileref1;
	gBg1Tm[offset + 6] = tileref0;


	tileref0 = 0x11F8;
	tileref1 = 0x11FB;
	if (b <= 3) {
		tmp = tileref0;

		tileref0 = tileref1;
		tileref1 = tmp;
	}

	offset = TM_OFFSET(gAuguryDispConfig[b].x, gAuguryDispConfig[b].y + 1) - 1;

	gBg1Tm[offset + 0] = tileref0;

	tileref0 += 1;
	tileref1 += 1;
	gBg1Tm[offset + 1] = tileref0;
	gBg1Tm[offset + 2] = tileref1;
	gBg1Tm[offset + 3] = tileref0;
	gBg1Tm[offset + 4] = tileref1;
	gBg1Tm[offset + 5] = tileref0;

	tileref1 += 1;
	gBg1Tm[offset + 6] = tileref1;

	EnableBgSync(BG1_SYNC_BIT);
}

void func_fe6_0808D7B4(ProcPtr proc)
{
	StartAuguryDialogue2(gAuguryConfig[gCurrentAuguryIndex].msgs3[gAuguryIndex]);
	PlaySe(SONG_66);
}

// https://decomp.me/scratch/0O3Ii
#if NONMATCHING
void func_fe6_0808D7F8(ProcPtr proc)
{
	int index;
	int ref_index = 4;

	switch (gKeySt->pressed) {
	case KEY_BUTTON_A:
		ClearTalkText();
		EndTalk();
		gAuguryChoice = AUGURY_CHOICE_2;
		PlaySe(SONG_6A);
		Proc_Goto(proc, PL_AUGURY_3);
		return;

	case KEY_BUTTON_B:
		ClearTalkText();
		EndTalk();
		TmFillRect(gBg1Tm + TM_OFFSET(8, 13), 0x15, 6, 0);
		EnableBgSync(BG1_SYNC_BIT);
		PlaySe(SONG_6B);
		Proc_Goto(proc, PL_AUGURY_4);
		return;

	default:
		index = gAuguryIndex;

		switch (gKeySt->repeated) {
		case KEY_DPAD_UP:
			if (index < 4) {
				if (index == 0)
					index = 3;
				else
					index = index - 1;
			} else if (index <= 4)
				index = 6;
			else
				index = index - 1;
			break;

		case KEY_DPAD_DOWN:
			if (index < 4) {
				if (index >= 3)
					index = 0;
				else
					index = index + 1;
			} else if (index <= 5)
				index = index + 1;
			else
				index = 4;
			break;

		case KEY_DPAD_RIGHT:
		case KEY_DPAD_LEFT:
			if (index < ref_index) {
				index += ref_index;
				if (index > 6)
					index = 6;
			} else
				index -= ref_index;
			break;

		default:
			break;
		}
		if (gAuguryIndex != index) {
			func_fe6_0808D6D4(gAuguryIndex, index);

			gAuguryIndex = index;
			func_fe6_0808D7B4(proc);
		}
		break;
	}
}
#else
NAKEDFUNC
void func_fe6_0808D7F8(ProcPtr proc)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, lr}\n\
	adds r5, r0, #0\n\
	movs r2, #4\n\
	ldr r0, .L0808D820 @ =gKeySt\n\
	ldr r1, [r0]\n\
	ldrh r0, [r1, #8]\n\
	cmp r0, #1\n\
	beq .L0808D828\n\
	cmp r0, #2\n\
	beq .L0808D858\n\
	ldr r0, .L0808D824 @ =gAuguryIndex\n\
	movs r3, #0\n\
	ldrsh r4, [r0, r3]\n\
	ldrh r1, [r1, #6]\n\
	adds r6, r0, #0\n\
	cmp r1, #0x20\n\
	beq .L0808D8D0\n\
	cmp r1, #0x20\n\
	bgt .L0808D89A\n\
	b .L0808D894\n\
	.align 2, 0\n\
.L0808D820: .4byte gKeySt\n\
.L0808D824: .4byte gAuguryIndex\n\
.L0808D828:\n\
	bl ClearTalkText\n\
	bl EndTalk\n\
	ldr r1, .L0808D850 @ =gAuguryChoice\n\
	movs r0, #2\n\
	strb r0, [r1]\n\
	ldr r0, .L0808D854 @ =gPlaySt\n\
	ldrb r0, [r0, #0x1d]\n\
	lsls r0, r0, #0x1e\n\
	cmp r0, #0\n\
	blt .L0808D846\n\
	movs r0, #0x6a\n\
	bl m4aSongNumStart\n\
.L0808D846:\n\
	adds r0, r5, #0\n\
	movs r1, #3\n\
	bl Proc_Goto\n\
	b .L0808D8FA\n\
	.align 2, 0\n\
.L0808D850: .4byte gAuguryChoice\n\
.L0808D854: .4byte gPlaySt\n\
.L0808D858:\n\
	bl ClearTalkText\n\
	bl EndTalk\n\
	ldr r0, .L0808D88C @ =gBg1Tm+0x350\n\
	movs r1, #0x15\n\
	movs r2, #6\n\
	movs r3, #0\n\
	bl TmFillRect_thm\n\
	movs r0, #2\n\
	bl EnableBgSync\n\
	ldr r0, .L0808D890 @ =gPlaySt\n\
	ldrb r0, [r0, #0x1d]\n\
	lsls r0, r0, #0x1e\n\
	cmp r0, #0\n\
	blt .L0808D882\n\
	movs r0, #0x6b\n\
	bl m4aSongNumStart\n\
.L0808D882:\n\
	adds r0, r5, #0\n\
	movs r1, #4\n\
	bl Proc_Goto\n\
	b .L0808D8FA\n\
	.align 2, 0\n\
.L0808D88C: .4byte gBg1Tm+0x350\n\
.L0808D890: .4byte gPlaySt\n\
.L0808D894:\n\
	cmp r1, #0x10\n\
	beq .L0808D8D0\n\
	b .L0808D8E0\n\
.L0808D89A:\n\
	cmp r1, #0x40\n\
	beq .L0808D8A4\n\
	cmp r1, #0x80\n\
	beq .L0808D8B8\n\
	b .L0808D8E0\n\
.L0808D8A4:\n\
	cmp r4, #4\n\
	bge .L0808D8B0\n\
	cmp r4, #0\n\
	bne .L0808D8B4\n\
	movs r4, #3\n\
	b .L0808D8E0\n\
.L0808D8B0:\n\
	cmp r4, #4\n\
	ble .L0808D8DA\n\
.L0808D8B4:\n\
	subs r4, #1\n\
	b .L0808D8E0\n\
.L0808D8B8:\n\
	cmp r4, #4\n\
	bge .L0808D8C4\n\
	cmp r4, #3\n\
	blt .L0808D8C8\n\
	movs r4, #0\n\
	b .L0808D8E0\n\
.L0808D8C4:\n\
	cmp r4, #5\n\
	bgt .L0808D8CC\n\
.L0808D8C8:\n\
	adds r4, #1\n\
	b .L0808D8E0\n\
.L0808D8CC:\n\
	movs r4, #4\n\
	b .L0808D8E0\n\
.L0808D8D0:\n\
	cmp r4, r2\n\
	bge .L0808D8DE\n\
	adds r4, r4, r2\n\
	cmp r4, #6\n\
	ble .L0808D8E0\n\
.L0808D8DA:\n\
	movs r4, #6\n\
	b .L0808D8E0\n\
.L0808D8DE:\n\
	subs r4, r4, r2\n\
.L0808D8E0:\n\
	movs r1, #0\n\
	ldrsh r0, [r6, r1]\n\
	cmp r0, r4\n\
	beq .L0808D8FA\n\
	ldrh r0, [r6]\n\
	lsls r1, r4, #0x10\n\
	lsrs r1, r1, #0x10\n\
	bl func_fe6_0808D6D4\n\
	strh r4, [r6]\n\
	adds r0, r5, #0\n\
	bl func_fe6_0808D7B4\n\
.L0808D8FA:\n\
	pop {r4, r5, r6}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided\n\
");
}
#endif

void func_fe6_0808D900(ProcPtr proc)
{
	if (gKeySt->held & KEY_BUTTON_B) {
		Proc_Goto(proc, PL_AUGURY_4);
		return;
	}

	if (!IsTalkActive())
		Proc_Break(proc);
}

void func_fe6_0808D938(ProcPtr proc)
{
	if (!IsTalkActive())
		Proc_Break(proc);
}

void func_fe6_0808D954(ProcPtr proc)
{
	StartAuguryDialogue1(gAuguryConfig[gCurrentAuguryIndex].msgs1[0], proc);
}

void func_fe6_0808D978(ProcPtr proc)
{
	StartAuguryDialogue1(gAuguryConfig[gCurrentAuguryIndex].msgs1[1], proc);
}

void func_fe6_0808D99C(ProcPtr proc)
{
	StartAuguryDialogue1(MSG_6FF, proc);
}

void func_fe6_0808D9B0(ProcPtr proc)
{
	StartAuguryDialogue1(gAuguryConfig[gCurrentAuguryIndex].msgs2[gAuguryStatus[gAuguryIndex]], proc);
}

void func_fe6_0808D9F0(ProcPtr proc)
{
	StartAuguryDialogue1(gAuguryConfig[gCurrentAuguryIndex].msgs1[2], proc);
}
