#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "proc.h"
#include "ui.h"
#include "augury.h"
#include "playrank.h"
#include "ending_credit.h"

void SetupCreditCharacterGlyphs(void)
{
	ApplyPalette(Pal_CreditCharacterGlyph, BGPAL_CREDIT_GLYPH);
	ApplyPalette(Pal_CreditCharacterGlyph, OBPAL_CREDIT_GLYPH + 0x10);

	Decompress(Img_CreditGlyph_Cap, OBJ_VRAM0 + OBCHR_CREDIT_GLYPH_CAP * CHR_SIZE);
	Decompress(Img_CreditGlyph_Low, OBJ_VRAM0 + OBCHR_CREDIT_GLYPH_LOW * CHR_SIZE);
	Decompress(Img_CreditGlyph_Narrow, (u8 *)BG_VRAM + BGCHR_CREDIT_GLYPH_NARROW * CHR_SIZE);
}

void PutEndingCreditTm(u16 *tm, u16 oam2, u8 w, u8 h)
{
	i16 ix, iy;
	u32 h_ = h;

	for (iy = h_; iy > 0; iy--) {
		u16 *local_tm = tm + TM_OFFSET(0, h - iy);

		for (ix = w; ix > 0; ix--) {
			*local_tm++ = oam2;
			oam2++;
		}
	}
}

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

u8 func_fe6_0808FF04(struct ProcEndingfx *proc, int b, int c)
{
	if (unk_02016A42 <= 0x13) {
		unk_02016A43[proc->unk_4C] = 0x16;
		unk_02016AC3[proc->unk_4C] = c >> 1;
	}

	else if (unk_02016AC3[proc->unk_4C] != 0) {
		unk_02016AC3[proc->unk_4C]--;
	} else {
		unk_02016A43[proc->unk_4C] += 4;

		if (unk_02016A43[proc->unk_4C] > b)
			unk_02016A43[proc->unk_4C] = b;

		return unk_02016A43[proc->unk_4C++];
	}

	proc->unk_4C++;
	return 0xF0;
}

int func_fe6_0808FF9C(int a, int b, int c)
{
	int i;

	for (i = 0; gUnk_0868BB1C[i].unk_0 != 0; i++) {
		if (gUnk_0868BB1C[i].unk_0 == b && gUnk_0868BB1C[i].unk_1 == c) {
			a = gUnk_0868BB1C[i].unk_2 + a - 8;
            break;
		}
	}
	return a;
}

