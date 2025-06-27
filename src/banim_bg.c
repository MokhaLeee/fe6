#include "prelude.h"
#include "hardware.h"
#include "banim.h"

void PutBanimBgIMG(int index)
{
	int _i = index * 3;

	LZ77UnCompVram(gBattleBGDataTable[_i], (u8 *)BG_VRAM + 0x8000);
}

void PutBanimBgTSA(int index)
{
	int _i = index * 3 + 1;

	LZ77UnCompWram(gBattleBGDataTable[_i], gEkrTsaBuffer);
	EfxTmCpyBG(gEkrTsaBuffer, gBg3Tm, 0x1E, 0x14, OBPAL_EFX_BG, 0x0);
}

void PutBanimBgPAL(int index)
{
	int _i = index * 3 + 2;

	LZ77UnCompWram(gBattleBGDataTable[_i], PAL_BG(OBPAL_EFX_BG));
}

void PutBanimBG(int index)
{
	PutBanimBgIMG(index);
	CpuFastFill16(0, (u8 *)BG_VRAM + BG_VRAM_SIZE - 0x20, 0x20);
	PutBanimBgTSA(index);
	PutBanimBgPAL(index);

	PAL_BG_COLOR(0, 0) = RGB(0, 0, 0);
	EnableBgSync(BG3_SYNC_BIT);
	EnablePalSync();
}
