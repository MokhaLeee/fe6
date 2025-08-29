#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "proc.h"
#include "ending_credit.h"

void SetupCreditCharacterGlyphs(void)
{
	ApplyPalette(Pal_CreditCharacterGlyph, BGPAL_CREDIT_GLYPH);
	ApplyPalette(Pal_CreditCharacterGlyph, OBPAL_CREDIT_GLYPH + 0x10);

	Decompress(Img_CreditGlyph_Cap, OBJ_VRAM0 + OBCHR_CREDIT_GLYPH_CAP * CHR_SIZE);
	Decompress(Img_CreditGlyph_Low, OBJ_VRAM0 + OBCHR_CREDIT_GLYPH_LOW * CHR_SIZE);
	Decompress(Img_CreditGlyph_Narrow, (u8 *)BG_VRAM + BGCHR_CREDIT_GLYPH_NARROW * CHR_SIZE);
}
