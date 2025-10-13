#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "proc.h"
#include "ui.h"
#include "augury.h"
#include "ending_credit.h"

void SetupCreditCharacterGlyphs(void)
{
	ApplyPalette(Pal_CreditCharacterGlyph, BGPAL_CREDIT_GLYPH);
	ApplyPalette(Pal_CreditCharacterGlyph, OBPAL_CREDIT_GLYPH + 0x10);

	Decompress(Img_CreditGlyph_Cap, OBJ_VRAM0 + OBCHR_CREDIT_GLYPH_CAP * CHR_SIZE);
	Decompress(Img_CreditGlyph_Low, OBJ_VRAM0 + OBCHR_CREDIT_GLYPH_LOW * CHR_SIZE);
	Decompress(Img_CreditGlyph_Narrow, (u8 *)BG_VRAM + BGCHR_CREDIT_GLYPH_NARROW * CHR_SIZE);
}

// https://decomp.me/scratch/i9ay5
#if NONMATCHING
void PutEndingCreditTm(u16 *tm, u16 oam2, u8 w, u8 h)
{
	u16 ix, iy;

	for (iy = h; iy > 0; iy--) {
		for (ix = w; ix > 0; ix--) {
			tm[TM_OFFSET(ix, iy)] = oam2++;
		}
	}
}
#else
NAKEDFUNC
void PutEndingCreditTm(u16 *tm, u16 oam2, u8 w, u8 h)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	adds r7, r0, #0\n\
	lsls r1, r1, #0x10\n\
	lsrs r4, r1, #0x10\n\
	lsls r2, r2, #0x18\n\
	lsrs r6, r2, #0x18\n\
	lsls r3, r3, #0x18\n\
	lsrs r5, r3, #0x18\n\
	adds r3, r5, #0\n\
	lsls r0, r3, #0x10\n\
	cmp r0, #0\n\
	beq .L0808FE30\n\
.L0808FE00:\n\
	asrs r0, r0, #0x10\n\
	subs r0, r5, r0\n\
	lsls r0, r0, #6\n\
	adds r2, r7, r0\n\
	lsls r1, r6, #0x10\n\
	lsls r3, r3, #0x10\n\
	cmp r1, #0\n\
	beq .L0808FE24\n\
.L0808FE10:\n\
	strh r4, [r2]\n\
	adds r2, #2\n\
	adds r0, r4, #1\n\
	lsls r0, r0, #0x10\n\
	lsrs r4, r0, #0x10\n\
	ldr r0, .L0808FE38 @ =0xFFFF0000\n\
	adds r1, r1, r0\n\
	asrs r0, r1, #0x10\n\
	cmp r0, #0\n\
	bgt .L0808FE10\n\
.L0808FE24:\n\
	ldr r1, .L0808FE38 @ =0xFFFF0000\n\
	adds r0, r3, r1\n\
	lsrs r3, r0, #0x10\n\
	lsls r0, r3, #0x10\n\
	cmp r0, #0\n\
	bgt .L0808FE00\n\
.L0808FE30:\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L0808FE38: .4byte 0xFFFF0000\n\
	.syntax divided\n\
");
}
#endif

void EndingCredit_Reinit(struct ProcEndingCredit *proc)
{
	UnpackUiWindowFrameGraphics();

	proc->unk_64 = 0;
	gCreditInfoDispStep = 0;
	unk_02016A3D = 0;
	unk_02016A3F = 0;
	gEndingStep = 0;

	SetBlendAlpha(0, 0x10);
	SetBlendTargetA(1, 1, 0, 0, 0);
	SetBlendTargetB(0, 0, 1, 1, 0);

	SetupCreditCharacterGlyphs();
}

void GameCredit_Init(struct ProcEndingCredit *proc)
{
	gEndingDispType = ENDING_DISP_1;
	EndingCredit_Reinit(proc);
	SetupEndingPInfo2Uids();
}

void EndingCredit_ReinitType2(struct ProcEndingCredit *proc)
{
	gEndingDispType = ENDING_DISP_2;
	EndingCredit_Reinit(proc);
	SetupEndingPInfo2Uids();
}

void EndingCredit_ReinitType0(struct ProcEndingCredit *proc)
{
	gEndingDispType = ENDING_DISP_0;
	EndingCredit_Reinit(proc);
}
