#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "util.h"
#include "sprite.h"
#include "oam.h"
#include "scanline.h"
#include "worldmap.h"
#include "sound.h"
#include "random.h"
#include "gbasvc.h"
#include "unknown_objects.h"

#include "opanim.h"
#include "constants/songs.h"

void OpAnimSparksOBJ_Init(struct ProcOpAnim5 *proc)
{
	PutOpAnimSparksObjGfx();
	proc->unk_64 = 0;
}

void OpAnimSparksOBJ_Loop(struct ProcOpAnim5 *proc)
{
	proc->unk_64++;

	if ((proc->unk_64 & 7) == 0)
		func_fe6_0809A13C(proc);
}

void PutOpAnimSparksObjGfx(void)
{
	Decompress(Img_OpAnimSparksOBJ, OBJ_VRAM0);
	ApplyPaletteExt(Pal_OpAnimSparksOBJ, 0x220, 0x20);
}

void func_fe6_0809A13C(ProcPtr proc)
{
	struct ProcOpAnimSparksFall *child = SpawnProc(ProcScr_OpAnimSparksOBJFALL, proc);

	child->x = DivRem(RandNextB(), 241) + 0x28;
	child->y = 0xA0;
	child->type = gUnk_08380F5A[DivRem(RandNextB(), 8)];
	child->dx = DivRem(RandNextB(), 4) + 2;
	child->dy = DivRem(RandNextB(), 4) + 3;
	child->phase = DivRem(RandNextB(), 257);
}

void OpAnimSparksOBJFALL_Init(struct ProcOpAnimSparksFall *proc)
{
	proc->timer = 0;
}

void OpAnimSparksOBJFALL_Loop(struct ProcOpAnimSparksFall *proc)
{
	int x_off = (SIN_Q12(proc->phase + proc->timer * 4) * 0x10) >> 12;
	int frame = proc->timer >> 4;
	int chr;

	if (frame > 7)
		frame = 7;

	chr = gUnk_08380F62[proc->type * 8 + frame] * 2;

	proc->x -= proc->dx;
	proc->y -= proc->dy;
	proc->timer++;

	if (proc->x + x_off < 0 || proc->y < 0) {
		Proc_Break(proc);
		return;
	}

	PutSpriteExt(2, proc->x + x_off, proc->y, Sprite_16x16, OAM2_PAL(1) + OAM2_LAYER(1) + chr);
}

void func_fe6_0809A264(struct ProcOpAnim5 *proc)
{
	proc->unk_64 = 0;
}

void func_fe6_0809A26C(struct ProcOpAnim5 *proc)
{
	PrepareSineWaveScanlineBuf(func_fe6_0806A87C(1, 0), proc->unk_64, gUnk_086914D4, gUnk_086914D0);
	PrepareSineWaveScanlineBuf(func_fe6_0806A87C(1, DISPLAY_HEIGHT), proc->unk_64, gUnk_086914DC, gUnk_086914D8);
	SwapScanlineBufs();
	proc->unk_64 += 2;
}

void func_fe6_0809A2CC(ProcPtr proc)
{
	if (bool_opanim_03005284) {
		Proc_End(proc);
		return;
	}

	func_fe6_0809A900();
	SetAllBlackPals();

	Decompress(Img_OpAnim_Fog, (u8 *)BG_VRAM + GetBgChrOffset(BG_0));
	Decompress(Tsa_OpAnim_Fog, gBg0Tm);
	Decompress(Tsa_OpAnim_Fog, gBg1Tm);
	Decompress(Tsa_OpAnim_08375B84, (u8 *)BG_VRAM + GetBgChrOffset(BG_2));
	Decompress(gUnk_08376B70, gBg2Tm);

	Decompress(Pal_Lz_OpAnim_Fog, gBuf);
	ApplyPaletteExt(gBuf, 0, 0x200);
	gPal[0] = 0;

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
	SpawnProc(ProcScr_OpAnim_08691DE8, proc);
	OpAnim_SetupGlyph(3);
	OpAnim_SetWin0Layers(1, 1, 1, 0, 1);
}

void func_fe6_0809A3A4(struct ProcOpAnim5 *proc)
{
	proc->unk_64 = 0;
	SetBlendTargetA(1, 0, 0, 0, 0);
	SetBlendDarken(0);
}

void func_fe6_0809A3D4(struct ProcOpAnim5 *proc)
{
	proc->unk_64++;

	SetBlendDarken(Interpolate(0, 0, gUnk_086914CC, proc->unk_64, gUnk_086914C8));

	if (proc->unk_64 == 0x20) {
		Proc_Break(proc);
		SetDispEnable(0, 0, 0, 0, 1);
		SetBlendNone();
	}
}

void func_fe6_0809A484(struct ProcOpAnim6 *proc)
{
	proc->unk_64 = 0x10;
	proc->unk_44 = 0;
	SetBlendAlpha(0, 0x10);
}

void func_fe6_0809A4C4(struct ProcOpAnim6 *proc)
{
	proc->unk_64++;
	SetBlendAlpha(Interpolate(0, 0, 0x10, proc->unk_64, gUnk_086914BC), 0x10);

	if (proc->unk_64 == gUnk_086914BC)
		Proc_Break(proc);
}

void func_fe6_0809A53C(struct ProcOpAnim6 *proc)
{
	if (proc->unk_44++ >= gUnk_086914C4)
		Proc_Break(proc);
}

void func_fe6_0809A564(struct ProcOpAnim6 *proc)
{
	proc->unk_64 = 0;
	SetBlendTargetB(0, 1, 1, 0, 0);
}

void func_fe6_0809A588(struct ProcOpAnim6 *proc)
{
	proc->unk_64++;
	SetBlendAlpha(0x10, Interpolate(0, 0x10, 0, proc->unk_64, gUnk_086914C0));

	if (proc->unk_64 == gUnk_086914C0)
		Proc_Break(proc);
}

void func_fe6_0809A600(struct ProcOpAnim6 *proc)
{
	proc->unk_64 = 0;
	SetDispEnable(1, 0, 0, 0, 1);
	SetBlendTargetA(1, 0, 0, 0, 0);
}

void func_fe6_0809A638(struct ProcOpAnim6 *proc)
{
	SetBlendDarken(Interpolate(0, 0, 0x10, proc->unk_64++, 0x20));

	if (proc->unk_64 >= 0x20) {
		SetBlendNone();
		SetDispEnable(0, 0, 0, 0, 1);
		Proc_Break(proc);
	}
}

void func_fe6_0809A6DC(struct ProcOpAnim3Zoom *proc)
{
	proc->timer = 0;
}

void func_fe6_0809A6E4(struct ProcOpAnim3Zoom *proc)
{
	int angle, radius, x, y, zoom, unk;

	SetDispEnable(1, 1, 1, 0, 1);

	if (proc->timer < gUnk_086914B8)
		proc->timer++;
	else
		Proc_Break(proc);

	angle = Interpolate(4, 0x100, 0x500, proc->timer, gUnk_086914B8);
	radius = Interpolate(4, gUnk_086914A8, 0, proc->timer, gUnk_086914B8);

	x = (gSinLut_u32[(angle + 0x100) & 0x3FF] * radius) >> 7;
	y = (gSinLut_u32[angle & 0x3FF] * radius) >> 7;

	zoom = Interpolate(4, 0, 0x4000, proc->timer, gUnk_086914B8) * 4;
	unk = Interpolate(4, gUnk_086914A4 << 8, 0x100, proc->timer, gUnk_086914B8);

	func_fe6_0809A868(x, y, zoom, unk);

	proc->x = x;
	proc->y = y;
	proc->zoom = zoom;
	proc->unk_58 = unk;
}

void func_fe6_0809A804(struct ProcOpAnim3Zoom *proc)
{
	proc->timer2 = 0;
}

void func_fe6_0809A80C(struct ProcOpAnim3Zoom *proc)
{
	int y = Interpolate(0, proc->y, proc->y - (gUnk_086914B4 << 8), proc->timer2, gUnk_086914B0);

	func_fe6_0809A868(proc->x, y, proc->zoom, proc->unk_58);

	if (proc->timer2 < gUnk_086914B0)
		proc->timer2++;
	else
		Proc_Break(proc);
}

void func_fe6_0809A868(int x, int y, int zoom, int unk)
{
	WmZoomCore(x - 0x1000, y + (gUnk_086914AC - 0x50) * 0x100, 0x6800, gUnk_086914AC * 0x100, zoom, unk, unk);
}

void func_fe6_0809A8A4(struct ProcOpAnim5 *proc)
{
	proc->unk_64 = 0;
	proc->unk_66 = 0;
}

void func_fe6_0809A8B4(struct ProcOpAnim5 *proc)
{
	proc->unk_64 += 2;
	proc->unk_66 += 3;

	SetBgOffset(BG_0, (proc->unk_64 >> 4) + 0x10, proc->unk_64 >> 3);
	SetBgOffset(BG_1, -(proc->unk_66 >> 4), proc->unk_66 >> 3);
}

void func_fe6_0809A900(void)
{
	InitBgs(BgConf_OpAnim_08691DF8);
	DisableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	gDispIo.disp_ct.mode = 1;
	SetDispEnable(1, 1, 0, 0, 1);
	SetWinEnable(0, 0, 0);

	gDispIo.bg0_ct.priority = 0;
	gDispIo.bg1_ct.priority = 2;
	gDispIo.bg2_ct.priority = 1;
	gDispIo.bg3_ct.priority = 0;

	SetBlendAlpha(0, 0x10);
	SetBlendTargetA(1, 0, 0, 0, 0);
	SetBlendTargetB(0, 1, 1, 0, 0);
	SetBlendBackdropB(1);

	SetBgBpp(BG_0, 4);
	SetBgBpp(BG_1, 4);
	SetBgBpp(BG_2, 8);
}

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
