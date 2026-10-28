#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "util.h"
#include "sound.h"
#include "random.h"
#include "gbasvc.h"
#include "unknown_objects.h"

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

void OpAnim6_PutIdunnGfx(struct ProcOpAnim6 *proc)
{
	PlaySe(SONG_94);

	TmFill(gBg0Tm, 0);
	Decompress(Img_OpAnim_Dragon, (u8 *)BG_VRAM + GetBgChrOffset(BG_0));
	Decompress(Tsa_Opanim6_0837EEB4, gBg0Tm);
	ApplyPalettes(Pal_Opanim6_0837F418, 0, 3);
	EnableBgSync(BG0_SYNC_BIT);
	SetBlendBrighten(0x10);
	SetBlendTargetA(0, 1, 1, 1, 1);
	SetBlendBackdropA(1);
}

void func_fe6_0809AD3C(struct ProcOpAnim6 *proc)
{
	SetBlendNone();
}

void func_fe6_0809AD64(struct ProcOpAnim6 *proc)
{
	SetDispEnable(0, 0, 0, 0, 0);
}

void func_fe6_0809AD88(ProcPtr proc)
{
	if (bool_opanim_03005284) {
		Proc_End(proc);
		return;
	}

	SetDispEnable(0, 0, 0, 0, 1);
}

void func_fe6_0809ADCC(ProcPtr proc)
{
	func_fe6_0809B0E8();
	Decompress(gUnk_08375ADC, (u8 *)BG_VRAM + 0x20 + GetBgChrOffset(BG_0));
	func_fe6_0809AED4();
	Decompress(Img_EndingMonologue, (u8 *)BG_VRAM + GetBgChrOffset(BG_2));
	Decompress(Tsa_EndingMonologue, (u8 *)BG_VRAM + GetBgTilemapOffset(BG_2));
	Decompress(Zpal_EndingMonologue, gBuf);
	VramCopy(gUnk_08375B64, gBuf + 0x1A0, 0x20);
	OpAnim_SetWin0Layers(1, 1, 1, 0, 1);
}

void func_fe6_0809AE60(ProcPtr proc)
{
	SetDispEnable(1, 1, 1, 0, 1);
	ApplyPaletteExt(gBuf, 0, 0x200);
	gPal[0] = 0;
}

void func_fe6_0809AEA0(void)
{
	SetDispEnable(0, 0, 0, 0, 1);
}

void func_fe6_0809AEC4(void)
{
	func_fe6_08014ACC(0xD, 1);
}

void func_fe6_0809AED4(void)
{
	int i;

	for (i = 0; i < gUnk_086914F8; i++) {
		int x = DivRem(RandNextB(), 29);
		int y = DivRem(RandNextB(), 29);

		func_fe6_08014E30(gBg0Tm, x, y, TILEREF(1, 13), 4, 4);
	}

	EnableBgSync(BG0_SYNC_BIT);
}

void func_fe6_0809AF30(ProcPtr proc)
{
	if (bool_opanim_03005284) {
		Proc_End(proc);
		return;
	}

	func_fe6_0809B188();
	EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
	OpAnim_SetupGlyph(2);
	OpAnim_SetWin0Layers(1, 0, 1, 0, 1);
}

void func_fe6_0809AF74(struct ProcOpAnim5 *proc)
{
	proc->unk_64 = 0;
	proc->unk_66 = 0;
}

void func_fe6_0809AF84(struct ProcOpAnim5 *proc)
{
	int x0, x1, off;

	proc->unk_64++;

	x0 = proc->unk_64 * gUnk_086914F0;
	x1 = proc->unk_64 * gUnk_086914F4;

	if (proc->unk_64 & 1)
		off = 0;
	else
		off = 0x30;

	SetBgOffset(BG_0, x0 + off, off - 0x10);
	SetBgOffset(BG_1, x1 + 0x18 + off, off + 8);
}

void func_fe6_0809AFE4(struct ProcOpAnim5 *proc)
{
	func_fe6_0809AF84(proc);

	proc->unk_66++;

	SetBgOffset(BG_2, proc->unk_66 >> 3, 0);
	SetBgOffset(BG_3, proc->unk_66 >> 3, 0);
}

void func_fe6_0809B01C(struct ProcOpAnim5 *proc)
{
	proc->unk_64 = 0;
}

void func_fe6_0809B024(struct ProcOpAnim5 *proc)
{
	proc->unk_64++;

	if (proc->unk_64 >= 0x20)
		Proc_Break(proc);

	SetBlendAlpha(
		Interpolate(0, 6, 4, proc->unk_64, 0x20),
		Interpolate(0, 0, 0x10, proc->unk_64, 0x20));
}

void func_fe6_0809B094(struct ProcOpAnim5 *proc)
{
	proc->unk_64 = 0;
	proc->unk_66 = 0;
}

void func_fe6_0809B0A4(struct ProcOpAnim5 *proc)
{
	proc->unk_64 += 0xA0;
	proc->unk_66 += 0x40;

	SetBgOffset(BG_0, 0, proc->unk_64 >> 8);
	SetBgOffset(BG_2, 0, 0xB4 - (proc->unk_66 >> 8));
}

void func_fe6_0809B0E8(void)
{
	InitBgs(BgConf_OpAnim_086920A0);
	DisableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	gDispIo.disp_ct.mode = 0;
	SetDispEnable(1, 1, 0, 0, 1);

	gDispIo.bg0_ct.priority = 0;
	gDispIo.bg1_ct.priority = 0;
	gDispIo.bg2_ct.priority = 1;
	gDispIo.bg3_ct.priority = 0;

	SetWinEnable(0, 0, 0);
	SetBlendNone();
}

void func_fe6_0809B188(void)
{
	InitBgs(BgConf_OpAnim_086920B8);
	DisableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	gDispIo.disp_ct.mode = 0;
	SetDispEnable(1, 0, 1, 0, 1);
	SetWinEnable(0, 0, 0);
	SetBlendAlpha(6, 0);
	SetBlendTargetA(1, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 1, 0, 0);

	SetAllBlackPals();
}

void func_fe6_0809B220(u16 *tm, u16 tileref, int width, int height)
{
	int x, y, ix, iy;

	for (y = 0; y < 32; y += height) {
		for (iy = 0; iy < height; iy++) {
			for (x = 0; x < 32; x += width) {
				for (ix = 0; ix < width; ix++)
					*tm++ = tileref + iy * 0x20 + ix;
			}
		}
	}
}

void func_fe6_0809B280(ProcPtr proc)
{
	if (bool_opanim_03005284) {
		Proc_End(proc);
		return;
	}

	OpAnim6_ResetBG();
	SetAllBlackPals();
	SetDispEnable(0, 0, 0, 0, 1);
	SetBlendNone();
	OpAnim_SetupGlyph(0);
	PutOpAnimSubtitle6();
}
