#include "prelude.h"
#include "bm.h"
#include "hardware.h"
#include "proc.h"
#include "oam.h"
#include "sprite.h"
#include "ui.h"
#include "util.h"
#include "bmfx.h"
#include "face.h"
#include "msg.h"
#include "text.h"
#include "icon.h"
#include "armfunc.h"
#include "helpbox.h"
#include "prepscreen.h"

#include "constants/videoalloc_global.h"

void PrepDiscardUpdateInfoWindow(struct ProcPrepDiscardScreen *proc)
{
	UpdateEquipInfoWindow(proc->sel_slot);
}

const char gUnk_083272F0[] = "本当に";
const char gUnk_083272F8[] = "すてますか";
const char gUnk_08327304[] = "はい";
const char gUnk_0832730C[] = "いいえ";

void func_fe6_0808166C(struct Text *text, bool disp)
{
	if (disp == true) {
		PutUiWindowFrame(17, 4, 12, 7, 0);
		PrepPutText(&text[0], gBg0Tm + TM_OFFSET(0x13, 5), TEXT_COLOR_SYSTEM_WHITE, 0, gUnk_083272F0);
		PrepPutText(&text[1], gBg0Tm + TM_OFFSET(0x16, 5), TEXT_COLOR_SYSTEM_WHITE, 0, gUnk_083272F8);
		PrepPutText(&text[2], gBg0Tm + TM_OFFSET(0x14, 8), TEXT_COLOR_SYSTEM_WHITE, 0, gUnk_08327304);
		PrepPutText(&text[3], gBg0Tm + TM_OFFSET(0x18, 8), TEXT_COLOR_SYSTEM_WHITE, 0, gUnk_0832730C);
	} else {
		TmFillRect(gBg0Tm + TM_OFFSET(18, 5), 13, 5, 0);
		TmFillRect(gBg1Tm + TM_OFFSET(17, 4), 12, 6, 0);
	}

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void PrepDiscard_Init(struct ProcPrepDiscardScreen *proc)
{
	u8 i;
	int x;

	ResetTextFont();
	ClearIcons();

	gDispIo.bg0_ct.priority = 0;
	gDispIo.bg1_ct.priority = 1;
	gDispIo.bg2_ct.priority = 0;
	gDispIo.bg3_ct.priority = 3;

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	ApplySystemObjectsGraphics();
	InitIcons();
	ApplyIconPalettes(BGPAL_ICONS);

	InitText(&gPrepTexts3[0], 6);

	for (i = 0; i < 8; i++)
		InitTextDb(&gPrepTexts1[i], 7);

	for (i = 0; i < 4; i++)
		InitText(&gPrepTexts2[i], 7);

	proc->unit1 = proc->proc_parent->unit1;
	proc->unit2 = proc->proc_parent->unit2;

	StartEquipInfoWindow(proc, proc->unit1, 0x10, 0xB);

	proc->unk_2F = 0;
	proc->sel_slot = 0;
	proc->sel_yes = 0;
	proc->unk_31 = 0;
	proc->unk_45 = 0;
	proc->unk_50 = 0;
	proc->sub_sel = false;
	proc->unk_52 = 0;
	proc->in_helpbox = false;
	proc->unk_2D = 0;

	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, 0, 0);

	UnpackUiWindowFrameGraphics();
	PutUiWindowFrame(0x10, 0xB, 0xE, 8, 0);
	PrepDiscardUpdateInfoWindow(proc);
	PutUiWindowFrame(1, 8, 0xE, 0xC, 0);

	StartFace(0, GetUnitFid(proc->unit1), 0x40, -4, FACE_DISP_KIND(FACE_96x80_FLIPPED));
	func_fe6_0807D6C0(0, proc->unit1);
	PutUiEntryHover(
		proc->unk_2F * 14 + 2,
		proc->sel_slot * 2 + 9,
		12);

	PrepPutText(
		&gPrepTexts3[0], gBg0Tm, TEXT_COLOR_SYSTEM_WHITE,
		(0x30 - GetStringTextLen(DecodeMsg(proc->unit1->pinfo->msg_name))) / 2,
		DecodeMsg(proc->unit1->pinfo->msg_name));

	Decompress(Img_Prep_083198CC, OBJ_VRAM0 + OBCHR_PREPMENU_390 * CHR_SIZE);
	ApplyPalettes(Pal_SpinningArrow, 0x10 + OBPAL_PREPMENU_2, 3);
	Decompress(Img_Prep_0831AB1C, OBJ_VRAM0 + OBCHR_PREPMENU_080 * CHR_SIZE);
	ApplyPalette(Pal_Sio_0831AABC, 0x10 + OBPAL_PREPMENU_8);
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

	NewPrepDiscardHand(proc);
	LoadHelpBoxGfx(NULL, -1);
	NewSallyCir2(proc, -1);
	Proc_Goto(proc, 0);
}
