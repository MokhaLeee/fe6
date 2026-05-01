#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "util.h"
#include "sound.h"

#include "opanim.h"
#include "constants/songs.h"

void OpAnim_PutThunderStormGfx(void)
{
	Decompress(Img_OpAnimThunderStorm, (u8 *)BG_VRAM + GetBgChrOffset(BG_0));
	Decompress(Tsa_OpAnimThunderStorm, gBuf);
}

CONST_DATA struct OpAnim_08691E10 OpAnim_08691E10[] = {
	{ 0,  12, 0, 0 },
	{ 12,  5, 0, 0 },
	{ 18,  3, 0, 0 },
	{ 21, 10, 0, 0},
	{  0, 12, 1, 0 },
	{ 12,  5, 1, 0 },
	{ 18,  3, 1, 0 },
	{ 21, 10, 1, 0 },
};

void func_fe6_0809AA20(int a, int b)
{
	TmFill(gBg0Tm, 0xFF);

	func_fe6_08014E98(
		gBg0Tm, b, 0, 0,
		OpAnim_08691E10[a].tileref, 20,
		(u16 *)gBuf + OpAnim_08691E10[a].unk_00,
		OpAnim_08691E10[a].unk_02
	);

	EnableBgSync(BG0_SYNC_BIT);
}

void OpAnim6_StartBGM(struct ProcOpAnim6 *proc)
{
	if (bool_opanim_03005284 == false)
		StartBgmCore(SONG_44, 0);
}

void OpAnim6_PutThunderStormGfx(struct ProcOpAnim6 *proc)
{
	if (bool_opanim_03005284) {
		Proc_End(proc);
		return;
	}

	OpAnim6_ResetBG();
	SetAllBlackPals();
	SetDispEnable(1, 0, 0, 0, 1);
	OpAnim_PutThunderStormGfx();
	proc->unk_64 = 0;
	proc->unk_44 = 0;
}

CONST_DATA struct OpAnim_08691E30 OpAnim_08691E30[] = {
	{ 0,  8, 0x32 },
	{ 1,  4, 0xA },
	{ 3, 13, 0xF },
	{ 5, 12, 0x5 },
	{ 7,  8, 0x5 },
	{},
};

void OpAnim6_StartThunderStorm(struct ProcOpAnim6 *proc)
{
	const struct OpAnim_08691E30 *conf = &OpAnim_08691E30[proc->unk_64];

	if (conf->unk_02 == 0) {
		Proc_Break(proc);
		return;
	}

	if (proc->unk_44 != 0) {
		proc->unk_44--;
		return;
	}

	func_fe6_0809AA20(conf->unk_00, conf->tileref);
	SpawnProc(ProcScr_OpAnimThunderStorm, proc);
	proc->unk_44 = conf->unk_02;
	proc->unk_64++;
}

void OpAnimThunderStorm_Init(struct ProcOpAnim6 *proc)
{
	PlaySe(SONG_93);
	SetBlendBrighten(0x10);
	SetBlendTargetA(1, 1, 1, 1, 1);
	SetBlendBackdropA(1);
}

void OpAnimThunderStorm_PutPal1(struct ProcOpAnim6 *proc)
{
	SetBlendBrighten(0x8);
	ApplyPalette(Pal_OpAnimThunderStorm1, 0);
	gPal[0] = 0;
}

void OpAnimThunderStorm_PutPal2(struct ProcOpAnim6 *proc)
{
	SetBlendNone();
	ApplyPalette(Pal_OpAnimThunderStorm2, 0);
	gPal[0] = 0;
}

void OpAnimThunderStorm_PutPal3(struct ProcOpAnim6 *proc)
{
	ApplyPalette(Pal_OpAnimThunderStorm3, 0);
	gPal[0] = 0;
}

void OpAnimThunderStorm_PutPal4(struct ProcOpAnim6 *proc)
{
	ApplyPalette(Pal_OpAnimThunderStorm4, 0);
	gPal[0] = 0;
}

void OpAnimThunderStorm_PutPal5(struct ProcOpAnim6 *proc)
{
	ApplyPalette(Pal_AllBlack, 0);
	gPal[0] = 0;
}
