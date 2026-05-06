#include "prelude.h"
#include "hardware.h"
#include "proc.h"
#include "event.h"
#include "sound.h"
#include "sprite.h"
#include "util.h"
#include "msg.h"
#include "oam.h"
#include "titlescreen.h"
#include "gamecontroller.h"
#include "constants/songs.h"
#include "constants/msg.h"
#include "opanim.h"

EWRAM_OVERLAY(opanim) u8 OpAnimGlyphBuffer[0x2800] = {};
EWRAM_OVERLAY(opanim) int OpAnimGlyphIndex = 0;

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
	ResetOpAnimTextIndexMask();
	PutImg_OpAnimGlyphs();
}

void OpAnim_PutSubtitle(int idx)
{
	const char *str = DecodeMsg(Msgs_OpAnim_08691738[idx]);
	u16 *unk_08 = gOpAnimSubtitleConf[idx].unk_08;
	int unk_00 = gOpAnimSubtitleConf[idx].unk_00;
	int unk_r8 = 0;

	while (str != NULL) {
		NewOpAnimSubtitleDisp(idx, unk_00, unk_r8, str);

		str = GetOpAnimTextPrNext(str);
		unk_00 += 20;

		if (gOpAnimSubtitleConf[idx].unk_02 != 0) {
			unk_r8 += gUnk_08691498 + *unk_08;
			unk_08++;
		}
	}
}

void NewOpAnimSubtitleDisp(int idx, int a, int delay, const char *str)
{
	struct ProcOpAnimText *proc;

	proc = SpawnProc(ProcScr_OpAnimSubtitleDisp, PROC_TREE_3);
	proc->delay_timer = delay;
	proc->str = str;
	proc->unk_30 = a;
	proc->index = idx;
}

void OpAnimSubtitleDisp_Init(struct ProcOpAnimText *proc)
{
	proc->delay_timer = 0;
}

void OpAnimSubtitleDisp_Wait(struct ProcOpAnimText *proc)
{
	proc->delay_timer--;

	if (proc->delay_timer <= 0)
		Proc_Break(proc);
}

void OpAnimSubtitleDisp_Setup(struct ProcOpAnimText *proc)
{
	proc->x_center = (0xF0 - GetOpAnimTextStrLength(proc->str)) / 2;
	proc->unk_64 = 0;
}

void OpAnimSubtitleDisp_Loop(struct ProcOpAnimText *proc)
{
	const char *str = proc->str;
	const struct OpAnimSubtitleConf *conf = &gOpAnimSubtitleConf[proc->index];

	proc->unk_64 = 1 - proc->unk_64;
	if (proc->unk_64 == 0)
		return;

	do {
		switch (*str) {
		case 4:
			str++;
			break;

		default: {
			struct ProcOpAnimText *child = SpawnProc(ProcScr_OpAnimText, PROC_TREE_3);

			child->index = proc->index;
			child->x_center = proc->x_center;
			child->unk_30 = conf->unk_04 + (proc->unk_30 & 0xFF);
			child->unk_4A = GetOpAnimTextIndex(str);
			proc->x_center += GetOpAnimTextChLength(str);
			str += 2;
			break;
		}

		case 0:
		case 1:
			Proc_Break(proc);
			return;
		}

		proc->str = str;
	} while (conf->unk_02 == 0);
}

void func_fe6_08098C90(void)
{
}

void RemoveOpAnimText(void)
{
	Proc_EndEach(ProcScr_OpAnimText);
}

void BreakOpAnimText(void)
{
	OpAnimGlyphIndex = 0;
	Proc_BreakEach(ProcScr_OpAnimText);
}

void func_fe6_08098CC0(struct ProcOpAnimText *proc)
{
	proc->unk_64 = 0;
	SetBlendTargetA(0, 0, 0, 0, 1);
	SetBlendTargetB(1, 1, 1, 0, 0);
    SetBlendBackdropB(1);
	SetBlendAlpha(0x10, 0);
}

void func_fe6_08098D10(struct ProcOpAnimText *proc)
{
	if (proc->unk_64 < 0x20) {
		proc->unk_64++;
		SetBlendAlpha(
			Interpolate(0, 0x10, 0, proc->unk_64, 0x20),
			Interpolate(0, 0, 0x10, proc->unk_64, 0x20));
	} else {
		SetBlendNone();
		RemoveOpAnimText();
		Proc_Break(proc);
	}
}

void func_fe6_08098DB0(struct ProcOpAnimText *proc)
{
	proc->unk_64 = 0;
	SetBlendTargetA(0, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 0, 0, 0);
    SetBlendBackdropB(1);
	SetBlendNone();
}

void func_fe6_08098DEC(struct ProcOpAnimText *proc)
{
	if (proc->unk_64 < 0x20) {
		proc->unk_64++;

		gDispIo.blend_ct.effect = 0;
		gDispIo.blend_coef_a = Interpolate(0, 0x10, 0, proc->unk_64, 0x20);
		gDispIo.blend_coef_b = 0;
		gDispIo.blend_y = 0;
	} else {
		SetBlendNone();
		RemoveOpAnimText();
		Proc_Break(proc);
	}
}

void func_fe6_08098E74(struct ProcOpAnimText *proc)
{
	proc->unk_64 = 0;
	SetBlendTargetA(0, 0, 1, 0, 0);
	SetBlendTargetB(0, 0, 0, 0, 1);
    SetBlendBackdropB(0);
	SetBlendAlpha(0, 0x10);
}

void func_fe6_08098EC8(struct ProcOpAnimText *proc)
{
	if (proc->unk_64 < 0x20) {
		proc->unk_64++;
		SetBlendAlpha(
			Interpolate(0, 0, 0x10, proc->unk_64, 0x20),
			Interpolate(0, 0x10, 0, proc->unk_64, 0x20));
	} else {
		SetBlendNone();
		RemoveOpAnimText();
		Proc_Break(proc);
	}
}

void OpAnimText_Init1(struct ProcOpAnimText *proc)
{
	proc->unk_64 = 0;
	func_fe6_08099424(proc->unk_4A);
	proc->unk_4A = func_fe6_0809947C(
		proc->unk_4A,
		gOpAnimSubtitleConf[proc->index].unk_02,
		proc) - 0x1000;
}

void func_fe6_08098FA8(struct ProcOpAnimText *proc)
{
	if (proc->unk_58 >= gUnk_08691494) {
		proc->unk_58 = 0;
		ClearOpAnimTextIndex(proc->index);
		Proc_Break(proc);
		OpAnimText_Loop1(proc);
		return;
	}

	proc->unk_58++;

	PutSpriteExt(
		0,
		proc->x_center + (proc->index << 9),
		0x100 + Interpolate(4, proc->unk_30 + 8, proc->unk_30, proc->unk_58, gUnk_08691494),
		Sprite_16x16,
		proc->unk_4A);

	SetObjAffineAuto(
		proc->index, 0, 0x100,
		Interpolate(4, 1, 0x100, proc->unk_58, gUnk_08691494));
}

void OpAnimText_Loop1(struct ProcOpAnimText *proc)
{
	PutSpriteExt(
		0,
		proc->x_center,
		proc->unk_30,
		Sprite_16x16,
		proc->unk_4A + proc->unk_64);
}

void OpAnimText_Init2(struct ProcOpAnimText *proc)
{
	func_fe6_08099520(proc);
}

void OpAnimText_Loop2(struct ProcOpAnimText *proc)
{
	OpAnimText_Loop1(proc);
}

void func_fe6_080990FC(struct ProcOpAnimText *proc)
{
	proc->index = GetNextOpAnimTextIndex();
	proc->unk_58 = 1;
	SetObjAffineAuto(proc->index, 0, 1, 0x100);
}

void func_fe6_08099194(struct ProcOpAnimText *proc)
{
	if (proc->unk_58 >= gUnk_08691494) {
		proc->unk_58 = 0;
		ClearOpAnimTextIndex(proc->index);
		Proc_Break(proc);
		// OpAnimText_Loop1(proc);
		return;
	}

	proc->unk_58++;

	PutSpriteExt(
		0,
		Interpolate(4, proc->x_center, proc->x_center + 0x10, proc->unk_58, gUnk_08691494) + (proc->index << 9),
		Interpolate(4, proc->unk_30, proc->unk_30 + 0x10, proc->unk_58, gUnk_08691494) + 0x100,
		Sprite_16x16,
		proc->unk_4A);

	SetObjAffineAuto(
		proc->index, 0, Interpolate(0, 0x100, 2, proc->unk_58, gUnk_08691494), 0x100);
}

void func_fe6_080992B8(void)
{
	Proc_ForEach(ProcScr_OpAnimText, (ProcFunc)func_fe6_080992D0);
}

void func_fe6_080992D0(struct ProcOpAnimText *proc)
{
	proc->unk_64 = 0x800;
}

CONST_DATA char OpAnimTextRef[] =
	"あいえかきくけこさしすそたちつてとにのはまもよりるれをがずだっ　神人近時代祝福英雄存亡未来戦世界光導剣闇炎宿尊紋章幾多空間物語　・「」２０ＮｉｎｔｅｄｏＰｒｓ　";

int GetOpAnimTextIndex(const char *str)
{
	const char *ref = OpAnimTextRef;
	int i = 0;

	// JTEXT
	for (; ref[0] != '\0'; i++, ref += 2) {
		if (ref[0] == str[0] && ref[1] == str[1])
			return i;
	}
	return '@';
}

CONST_DATA u8 OpAnimTextLenRef[] = {
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x06,
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F,
	0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x06,
	0x08, 0x08, 0x08, 0x07, 0x07, 0x09, 0x05, 0x07,
	0x06, 0x07, 0x07, 0x07, 0x08, 0x07, 0x06, 0x06,
	0x00,
};

int GetOpAnimTextChLength(const char *str)
{
	int index = GetOpAnimTextIndex(str);

	return OpAnimTextLenRef[index];
}

int GetOpAnimTextStrLength(const char *str)
{
	int len = 0;

	while (str[0] != '\0') {
		switch (str[0]) {
		case 1:
			return len;

		default:
			if (str[0] == 4)
				str++;
			else {
				len = len + GetOpAnimTextChLength(str);
				str = str + 2;
			}
			break;
		}
	}
	return len;
}

const char *GetOpAnimTextPrNext(const char *str)
{
	while (*str != '\0') {
		switch (str[0]) {
		case 4:
			str = str + 1;
			break;

		case 1:
			return str + 1;

		default:
			str = str + 2;
			break;
		}
	}
	return NULL;
}

void ResetOpAnimTextIndexMask(void)
{
	int i;

	for (i = 0; i < 0x20; i++)
		gOpAnimTextMask[i >> 3] &= ~(1 << (i & 7));
}

int GetNextOpAnimTextIndex(void)
{
	int i;

	for (i = 0; i < 0x20; i++) {
		if (((gOpAnimTextMask[i >> 3] >> (i & 7)) & 1) == 0) {
			gOpAnimTextMask[i >> 3] |= (1 << (i & 7));
			return i;
		}
	}
#if BUGFIX
	return i;
#endif
}

void ClearOpAnimTextIndex(int i)
{
	gOpAnimTextMask[i >> 3] &= ~(1 << (i & 7));
}

void PutImg_OpAnimGlyphs(void)
{
	Decompress(Img_OpAnimGlyphs, OpAnimGlyphBuffer);
	OpAnimGlyphIndex = 0;
}

void func_fe6_08099424(int index)
{
	void *dst = OBJ_VRAM0 + ((((OpAnimGlyphIndex & 0x0F) * 2 + (OpAnimGlyphIndex & 0xF0) * 4 + 0x200) & 0x3FF) << 5);
	void *src = OpAnimGlyphBuffer + ((((index & 0x0F) * 2 + (index & 0xF0) * 4 + 0) & 0x3FF) << 5);

	OpAnimTextPutGlyph(src, dst, 0);
}

/* https://decomp.me/scratch/GVkFn */
#if NONMATCHING
int func_fe6_0809947C(int index, int speed, ProcPtr parent)
{
	int chr;
	void *dst, *src;
	struct ProcOpAnimGlyphFallIn *proc;

	chr = (OpAnimGlyphIndex & 0x0F) * 2 + (OpAnimGlyphIndex & 0xF0) * 4 + 0x200;
	dst = OBJ_VRAM0 + ((chr & 0x3FF) << 5);
	src = OpAnimGlyphBuffer + ((((index & 0x0F) * 2 + (index & 0xF0) * 4 + 0) & 0x3FF) << 5);

	OpAnimGlyphIndex++;

	if (speed == 0) {
		OpAnimTextPutGlyph(src, dst, 0xFFFF);
		return chr;
	}

	proc = SpawnProc(ProcScr_OpAnimGlyphFallIn, parent);
	proc->dst = dst;
	proc->src = src;
	proc->speed = speed;
	return chr;
}
#else
NAKEDFUNC
int func_fe6_0809947C(int index, int speed, ProcPtr parent)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, sl\n\
	mov r6, sb\n\
	mov r5, r8\n\
	push {r5, r6, r7}\n\
	mov sb, r1\n\
	mov sl, r2\n\
	ldr r1, .L080994EC @ =OpAnimGlyphIndex\n\
	mov r8, r1\n\
	ldr r3, [r1]\n\
	movs r2, #0xf\n\
	mov ip, r2\n\
	adds r2, r3, #0\n\
	mov r1, ip\n\
	ands r2, r1\n\
	lsls r2, r2, #1\n\
	movs r5, #0xf0\n\
	adds r1, r3, #0\n\
	ands r1, r5\n\
	lsls r1, r1, #2\n\
	adds r2, r2, r1\n\
	movs r1, #0x80\n\
	lsls r1, r1, #2\n\
	adds r6, r2, r1\n\
	ldr r4, .L080994F0 @ =0x000003FF\n\
	adds r1, r6, #0\n\
	ands r1, r4\n\
	lsls r1, r1, #5\n\
	ldr r2, .L080994F4 @ =0x06010000\n\
	adds r7, r1, r2\n\
	adds r1, r0, #0\n\
	mov r2, ip\n\
	ands r1, r2\n\
	lsls r1, r1, #1\n\
	ands r0, r5\n\
	lsls r0, r0, #2\n\
	adds r1, r1, r0\n\
	ands r1, r4\n\
	lsls r1, r1, #5\n\
	ldr r0, .L080994F8 @ =0x02000000\n\
	adds r4, r1, r0\n\
	adds r3, #1\n\
	mov r0, r8\n\
	str r3, [r0]\n\
	mov r1, sb\n\
	cmp r1, #0\n\
	beq .L08099500\n\
	ldr r0, .L080994FC @ =ProcScr_OpAnimGlyphFallIn\n\
	mov r1, sl\n\
	bl SpawnProc\n\
	str r7, [r0, #0x30]\n\
	str r4, [r0, #0x2c]\n\
	mov r2, sb\n\
	strh r2, [r0, #0x3c]\n\
	b .L0809950A\n\
	.align 2, 0\n\
.L080994EC: .4byte OpAnimGlyphIndex\n\
.L080994F0: .4byte 0x000003FF\n\
.L080994F4: .4byte 0x06010000\n\
.L080994F8: .4byte 0x02000000\n\
.L080994FC: .4byte ProcScr_OpAnimGlyphFallIn\n\
.L08099500:\n\
	ldr r2, .L0809951C @ =0x0000FFFF\n\
	adds r0, r4, #0\n\
	adds r1, r7, #0\n\
	bl OpAnimTextPutGlyph\n\
.L0809950A:\n\
	adds r0, r6, #0\n\
	pop {r3, r4, r5}\n\
	mov r8, r3\n\
	mov sb, r4\n\
	mov sl, r5\n\
	pop {r4, r5, r6, r7}\n\
	pop {r1}\n\
	bx r1\n\
	.align 2, 0\n\
.L0809951C: .4byte 0x0000FFFF\n\
	.syntax divided\n\
");
}
#endif

int func_fe6_08099520(ProcPtr proc)
{
	return func_fe6_0809947C(0x1F, 0x180, proc);
}

void OpAnimGlyphFallIn_Init(struct ProcOpAnimGlyphFallIn *proc)
{
	proc->step = 0;
	proc->unk_38 = 0;
	proc->unk3A = proc->speed;
}

void OpAnimGlyphFallIn_Loop(struct ProcOpAnimGlyphFallIn *proc)
{
    register i16 c asm("r0");
    register int a asm("r1");
    register int b asm("r2");

	a = proc->unk_38;
	b = proc->unk3A;

	goto _b;

_a:
	OpAnimTextPutGlyph(proc->src, proc->dst, ++proc->step);
	a = proc->unk_38;
	b = 0xFFFFFF00;

_b:
	proc->unk_38 = a + b;
    c = proc->unk_38;
	if (c > 0xFF)
		goto _a;

	if (proc->step >= 0x40)
		Proc_Break(proc);
}

#if 0
void func_fe6_08099580(const u32 *src, u32 *dst, int index)
{
	register int r2 asm("r2");
	register int r3 asm("r3");

	r3 = 0xF << ((index & 7) << 2);
	r2 = index >> 3;

	if (r2 >= 0x10)
		r2 += 0xF0;

	dst[r2] = (dst[r2] & ~r3) + (src[r2] & r3);
}
#endif

CONST_DATA int Msgs_OpAnim_08691738[] = {
	MSG_C08,
	MSG_C09,
	MSG_C0A,
	MSG_C0C,
	MSG_C0D,
	MSG_C0E,
	MSG_C0F,
	MSG_C0B, // "闇よりいずるものたち"
};

CONST_DATA u8 gUnk_08691758[] = {
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0x3C, 0, 0x3C, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
};
