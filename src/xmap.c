#include "prelude.h"
#include "proc.h"
#include "util.h"
#include "text.h"
#include "bm.h"
#include "ui.h"
#include "hardware.h"
#include "savemenu.h"

#include "xmap.h"

EWRAM_DATA struct Text gXmapTexts[6] = {};

struct ProcScr CONST_DATA ProcScr_Xmap[] = {
	PROC_SLEEP(1),
	PROC_CALL(Xmap_Init),
	PROC_CALL(StartMidFadeFromBlack),
	PROC_REPEAT(WhileFadeExists),

PROC_LABEL(PL_XMAP_0),
	PROC_REPEAT(func_fe6_0808B028),
	PROC_REPEAT(func_fe6_0808B194),
	PROC_REPEAT(func_fe6_0808B2BC),
	PROC_GOTO(PL_XMAP_0),

PROC_LABEL(PL_XMAP_1),
	PROC_REPEAT(func_fe6_0808B378),
	PROC_REPEAT(func_fe6_0808B3B8),
	PROC_REPEAT(func_fe6_0808B40C),
	PROC_REPEAT(func_fe6_0808B430),
	PROC_GOTO(PL_XMAP_0),

PROC_LABEL(PL_XMAP_3),
	PROC_CALL(Xmap_TextEnd),
	PROC_CALL(StartSaveDrawFadeOut),
	PROC_SLEEP(0),
	PROC_CALL(Xmap_End),
	PROC_END,
};

#if 0
void Xmap_Init(struct ProcXmap *proc)
{
	int i;

	InitBgs(NULL);
	ResetTextFont();
	ResetText();

	ApplySystemObjectsGraphics();
	UnpackUiWindowFrameGraphics();
	InitSystemTextFont();

	SetDispEnable(1, 1, 1, 1, 1);

	gDispIo.bg0_ct.priority = 0;
	gDispIo.bg1_ct.priority = 2;
	gDispIo.bg2_ct.priority = 1;
	gDispIo.bg3_ct.priority = 3;

	SetWinEnable(1, 0, 0);
	SetWin0Layers(1, 1, 1, 1, 1);
	SetWin0Box(0, 0, 0xF0, 0xA0);
	SetWin1Layers(1, 1, 1, 1, 1);

	SetBlankChr(0);
	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	Decompress(Img_XmapObj, OBJ_VRAM0 + OBCHR_XMAP * 0x20);
	ApplyObPalette(Pal_XmapObj, OBPAL_XMAP);
	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	for (i = 0; i < 6; i++) {
		InitText(gXmapTexts + i, 10);
		ClearText(gXmapTexts + i);
	}

	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, 0, 0);

	ListAvailableTrialChapters(proc->avaliable_trials);

	proc->unk_2B = 0;
}
#endif
