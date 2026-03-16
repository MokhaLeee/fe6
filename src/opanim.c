#include "prelude.h"
#include "hardware.h"
#include "proc.h"
#include "event.h"
#include "sound.h"
#include "util.h"
#include "titlescreen.h"
#include "gamecontroller.h"
#include "constants/songs.h"

#include "opanim.h"

CONST_DATA struct ProcScr ProcScr_TitleScreenHandler[] = {
	PROC_START_CHILD_LOCKING(ProcScr_TitleScreen),
	PROC_END
};

CONST_DATA int gUnk_08691490 = 0x180;
CONST_DATA int gUnk_08691494 = 0x40;
CONST_DATA int gUnk_08691498 = 0x6E;
CONST_DATA int gUnk_0869149C = 8;
CONST_DATA int gUnk_086914A0 = 0x28;
CONST_DATA int gUnk_086914A4 = 3;
CONST_DATA int gUnk_086914A8 = 0x1F4;
CONST_DATA int gUnk_086914AC = 0xA0;
CONST_DATA int gUnk_086914B0 = 0x96;
CONST_DATA int gUnk_086914B4 = 0x5C;
CONST_DATA int gUnk_086914B8 = 0xC8;
CONST_DATA int gUnk_086914BC = 0x64;
CONST_DATA int gUnk_086914C0 = 0x82;
CONST_DATA int gUnk_086914C4 = 0xB4;
CONST_DATA int gUnk_086914C8 = 0x80;
CONST_DATA int gUnk_086914CC = 0x30;
CONST_DATA int gUnk_086914D0 = 2;
CONST_DATA int gUnk_086914D4 = 4;
CONST_DATA int gUnk_086914D8 = 2;
CONST_DATA int gUnk_086914DC = 3;
CONST_DATA int gUnk_086914E0 = 0x1E0;
CONST_DATA int gUnk_086914E4[3] = { 2, 0x4B0, 0xC };
CONST_DATA int gUnk_086914F0 = 0x10;
CONST_DATA int gUnk_086914F4 = 0xF;
CONST_DATA int gUnk_086914F8 = 8;

void StartOpAnim_unused(void)
{
	SpawnProc(ProcScr_OpAnim, PROC_TREE_3);
}

CONST_DATA struct ProcScr ProcScr_OpAnimfxTerminator[] = {
	PROC_REPEAT(OpAnimfxTerminator_Loop),
	PROC_END
};

void OpAnimfxTerminator_Loop(ProcPtr proc)
{
	if (gKeySt->pressed & (KEY_BUTTON_A | KEY_BUTTON_B | KEY_BUTTON_START)) {
		SetNextGameAction(GAME_ACTION_2);

		bool_opanim_03005284 = true;

		Proc_EndEachMarked(PROC_MARK_OPANIM);
		OpAnim_ResetDispIO();
		FadeBgmOut(1);
		Proc_Break(proc);
	}
}

struct ProcScr CONST_DATA ProcScr_OpAnim[] = {
	PROC_ONEND(OpAnim_OnEnd),
	PROC_CALL(OpAnim_Init),
	PROC_SLEEP(0),
	PROC_START_CHILD(ProcScr_OpAnimfxTerminator),
	PROC_SLEEP(0),
	PROC_START_CHILD_LOCKING(ProcScr_OpAnim_Nintendo),
	PROC_SLEEP(0),
	PROC_CALL(OpAnim_StartBGM),
	PROC_CALL(OpAnim_StartTimer),
	PROC_START_CHILD_LOCKING(ProcScr_OpAnim1),
	PROC_SLEEP(0),
	PROC_CALL(OpAnimAdvance),
	PROC_START_CHILD_LOCKING(ProcScr_OpAnim2),
	PROC_SLEEP(0),
	PROC_CALL(OpAnimAdvance),
	PROC_START_CHILD_LOCKING(ProcScr_OpAnim3),
	PROC_SLEEP(0),
	PROC_CALL(OpAnimAdvance),
	PROC_START_CHILD_LOCKING(ProcScr_OpAnim4),
	PROC_SLEEP(0),
	PROC_CALL(OpAnimAdvance),
	PROC_START_CHILD_LOCKING(ProcScr_OpAnim5),
	PROC_SLEEP(0),
	PROC_CALL(OpAnimAdvance),
	PROC_START_CHILD_LOCKING(ProcScr_OpAnim6),
	PROC_SLEEP(0),
	PROC_CALL(OpAnimAdvance),
	PROC_END_EACH(ProcScr_OpAnimfxTerminator),
	PROC_START_CHILD_LOCKING(ProcScr_TitleScreenFromOp),
	PROC_SLEEP(0),
	PROC_END,
};

void OpAnim_ResetDispIO(void)
{
	gPal[0] = 0;

	SetDispEnable(0, 0, 0, 0, 0);
	SetWinEnable(0, 0, 0);
	SetBlendNone();
}

void OpAnim_OnEnd(void)
{}

u16 CONST_DATA BgConf_OpAnim_08691604[12] = {
	// tile offset  map offset  screen size
	0x0000,         0xA000,     0,          // BG 0
	0x0000,         0xA800,     0,          // BG 1
	0xC000,         0xB000,     0,          // BG 2
	0x8000,         0xB800,     0,          // BG 3
};

void OpAnim_Init(void)
{
	InitBgs(BgConf_OpAnim_08691604);
	SetDispEnable(1, 1, 1, 1, 1);
	SetWinEnable(0, 0, 0);
	SetAllBlackPals();
	EnablePalSync();
	OpAnim_SetupGlyph(0);
	bool_opanim_03005284 = false;
}

void func_fe6_080988BC(void)
{}

u16 CONST_DATA BgConf_OpAnim_0869161C[12] = {
	// tile offset  map offset  screen size
	0x0000,         0xA000,     0,          // BG 0
	0x4000,         0xA800,     0,          // BG 1
	0xC000,         0xB000,     0,          // BG 2
	0x8000,         0xB800,     0,          // BG 3
};

void OpAnim6_ResetBG(void)
{
	InitBgs(BgConf_OpAnim_0869161C);
	Clear4bppFirstTm();

	gDispIo.disp_ct.mode = 0;
	SetDispEnable(1, 1, 0, 0, 1);
	SetWinEnable(0, 0, 0);
	SetBlendNone();
}

void OpAnim_SetWin0Layers(int bg0, int bg1, int bg2, int bg3, int obj)
{
	SetWinEnable(1, 0, 0);
	SetWin0Box(0, 0x10, 0xF0, 0x90);
	SetWin0Layers(bg0, bg1, bg2, bg3, obj);
	SetWOutLayers(0, 0, 0, 0, 0);

	gDispIo.win_ct.win0_enable_blend = 1;
	gDispIo.win_ct.wout_enable_blend = 0;

	EnablePalSync();
}

void OpAnim_StartBGM(void)
{
	if (!bool_opanim_03005284)
		StartBgmCore(SONG_42, NULL);
}

struct ProcScr CONST_DATA ProcScr_OpAnimTimer[] = {
	PROC_CALL(OpAnimTimer_Init),
	PROC_REPEAT(OpAnimTimer_Loop),
};

#if NONMATCHING
void OpAnim_StartTimer(ProcPtr proc)
{
	const struct ProcScr *scr = ProcScr_OpAnimTimer;
	int i = 0;

	while (i < ARRAY_COUNT(gOpAnimStep))
		gOpAnimStep[i++] = 0;

	SpawnProc(scr, proc);
}
#else
NAKEDFUNC
void OpAnim_StartTimer(ProcPtr proc)
{
asm("\
	.syntax unified\n\
	push {r4, lr}\n\
	adds r1, r0, #0\n\
	ldr r4, .L08098A3C @ =ProcScr_OpAnimTimer\n\
	ldr r3, .L08098A40 @ =gOpAnimStep\n\
	movs r0, #0\n\
	adds r2, r3, #0\n\
	adds r2, #0x1c\n\
.L08098A26:\n\
	str r0, [r2]\n\
	subs r2, #4\n\
	cmp r2, r3\n\
	bge .L08098A26\n\
	adds r0, r4, #0\n\
	bl SpawnProc\n\
	pop {r4}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L08098A3C: .4byte ProcScr_OpAnimTimer\n\
.L08098A40: .4byte gOpAnimStep\n\
	.syntax divided\n\
");
}
#endif

void OpAnimTimer_Init(struct ProcOpAnimTimer *proc)
{
	proc->timer = 0;
}

void OpAnimTimer_Loop(struct ProcOpAnimTimer *proc)
{
	proc->timer++;
}

void OpAnimAdvance(void)
{
	struct ProcOpAnimTimer *timer;

	timer = FindProc(ProcScr_OpAnimTimer);

	gOpAnimStep[0]++;
	gOpAnimStep[gOpAnimStep[0]] = timer->timer;
}

void PutOpAnimSubtitle0(void)
{
	OpAnim_PutSubtitle(0);
}

void PutOpAnimSubtitle1(void)
{
	OpAnim_PutSubtitle(1);
}

void PutOpAnimSubtitle2(void)
{
	OpAnim_PutSubtitle(2);
}

void PutOpAnimSubtitle3(void)
{
	OpAnim_PutSubtitle(3);
}

void PutOpAnimSubtitle4(void)
{
	OpAnim_PutSubtitle(4);
}

void PutOpAnimSubtitle5(void)
{
	OpAnim_PutSubtitle(5);
}

void PutOpAnimSubtitle6(void)
{
	OpAnim_PutSubtitle(6);
}

void PutOpAnimSubtitle7(void)
{
	OpAnim_PutSubtitle(7);
}

void OpAnim_SetupGlyph(int pal_id)
{
	ApplyPalette(Pal_OpAnimGlyphs + PAL_OFFSET(pal_id), 0x10 + OBPAL_OPANIM_0F);
	func_fe6_0809937C();
	PutImg_OpAnimGlyphs();
}
