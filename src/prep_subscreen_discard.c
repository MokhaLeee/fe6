#include "prelude.h"
#include "bm.h"
#include "hardware.h"
#include "proc.h"
#include "oam.h"
#include "sprite.h"
#include "ui.h"
#include "face.h"
#include "text.h"
#include "icon.h"
#include "prepscreen.h"

struct ProcScr CONST_DATA ProcScr_PrepDiscardItemScreen[] = {
	PROC_19,
	PROC_SLEEP(1),
	PROC_CALL(PrepDiscard_Init),
PROC_LABEL(0),
	PROC_REPEAT(PrepDiscard_Loop),
PROC_LABEL(1),
	PROC_CALL(PrepDiscard_End),
	PROC_END,
};

void PrepDiscard_End(struct ProcPrepDiscardScreen *proc)
{
	EndFaceById(0);

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

	ResetTextFont();
	ClearIcons();
	InitBmBgLayers();
}

void StartPrepDiscardItemScreen(ProcPtr parent)
{
	SpawnProcLocking(ProcScr_PrepDiscardItemScreen, parent);
}

struct ProcScr CONST_DATA ProcScr_PrepDiscardHand[] = {
	PROC_19,
	PROC_CALL(PrepDiscardHand_Init),
	PROC_REPEAT(PrepDiscardHand_Loop),
	PROC_END,
};

void PrepDiscardHand_Init(struct ProcPrepDiscardHand *proc)
{
	proc->timer = 0;
}

void PrepDiscardHand_Loop(struct ProcPrepDiscardHand *proc)
{
	dummy_0807CFB8(1, 4, proc->timer);

	PutSpriteExt(0xB, OAM1_HFLIP, 0, Sprite_086792B6, OAM2_CHR(OBCHR_PREPMENU_390));

	if (proc->proc_parent->in_arena == true) {
		PutUiHand(proc->proc_parent->x * 0x20 + 0x9C, 0x40);
		PutFrozenUiHand(0x10, proc->proc_parent->y * 0x10 + 0x48);
	} else {
		PutUiHand(0x10, proc->proc_parent->y * 0x10 + 0x48);
	}

	proc->timer++;
}

ProcPtr NewPrepDiscardHand(ProcPtr parent)
{
	return SpawnProc(ProcScr_PrepDiscardHand, parent);
}
