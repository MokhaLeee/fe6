#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "util.h"

#include "ending.h"

struct ProcScr CONST_DATA ProcScr_Fin[] = {
	PROC_19,
	PROC_SLEEP(60),
	PROC_CALL(Fin_Init),
	PROC_CALL(FadeInBlackSpeed08),
	PROC_SLEEP(1),
	PROC_REPEAT(Fin_Loop),
	PROC_CALL_ARG(_FadeBgmOut, 8),
	PROC_CALL(FadeInBlackWithCallBack_Speed08),
	PROC_SLEEP(1),
	PROC_SLEEP(180),
	PROC_END,
};

// https://decomp.me/scratch/ruode
#if NONMATCHING
void Fin_Init(struct ProcGameEnding *proc)
{
	int i;
	int oam2_base;

	proc->timer = 0;

	InitBgs(BgConf_0868BA24);
	SetDispEnable(1, 0, 0, 0, 0);
	SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);
	SetBlendTargetA(0, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 0, 0, 0);

	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_3, 0, 0);

	TmFill(gBg0Tm, 0);
	TmFill(gBg3Tm, 0);

	ApplyPalette(Pal_MuralBackground, 4);
	ApplyPalette(Pal_Fin, 6);

	Decompress(Img_Fin, (u8 *)BG_VRAM + 0x1000);
	Decompress(Img_MuralBackground, (u8 *)BG_VRAM + GetBgChrOffset(BG_3));
	func_fe6_08090854(gBg3Tm, 0x4000);

	oam2_base = 0x6080;

	for (i = 0; i < 6; i++) {
		u16 *dst;
		int tm_off;

		tm_off = i + 0x10C;
		gBg0Tm[tm_off] = oam2_base + i;

		tm_off = i + 0x12C;
		gBg0Tm[tm_off] = oam2_base + 0x20 + i;

		tm_off = i + 0x14C;
		gBg0Tm[tm_off] = oam2_base + 0x40 + i;

		tm_off = i + 0x16C;
		gBg0Tm[tm_off] = oam2_base + 0x60 + i;
	}

	EnableBgSync(BG0_SYNC_BIT | BG3_SYNC_BIT);
}
#else
NAKEDFUNC
void Fin_Init(struct ProcGameEnding *proc)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, lr}\n\
	adds r0, #0x64\n\
	movs r4, #0\n\
	movs r1, #0\n\
	strh r1, [r0]\n\
	ldr r0, .L08090B54 @ =BgConf_0868BA24\n\
	bl InitBgs\n\
	ldr r2, .L08090B58 @ =gDispIo\n\
	movs r0, #1\n\
	ldrb r1, [r2, #1]\n\
	orrs r0, r1\n\
	movs r1, #3\n\
	rsbs r1, r1, #0\n\
	ands r0, r1\n\
	subs r1, #2\n\
	ands r0, r1\n\
	subs r1, #4\n\
	ands r0, r1\n\
	subs r1, #8\n\
	ands r0, r1\n\
	strb r0, [r2, #1]\n\
	adds r1, r2, #0\n\
	adds r1, #0x3c\n\
	movs r0, #0x3f\n\
	ldrb r3, [r1]\n\
	ands r0, r3\n\
	strb r0, [r1]\n\
	adds r0, r2, #0\n\
	adds r0, #0x44\n\
	strb r4, [r0]\n\
	adds r0, #1\n\
	strb r4, [r0]\n\
	adds r0, #1\n\
	strb r4, [r0]\n\
	ldr r0, .L08090B5C @ =0x0000FFE0\n\
	ldrh r1, [r2, #0x3c]\n\
	ands r0, r1\n\
	ldr r1, .L08090B60 @ =0x0000E0FF\n\
	ands r0, r1\n\
	strh r0, [r2, #0x3c]\n\
	movs r0, #0\n\
	movs r1, #0\n\
	movs r2, #0\n\
	bl SetBgOffset\n\
	movs r0, #3\n\
	movs r1, #0\n\
	movs r2, #0\n\
	bl SetBgOffset\n\
	ldr r6, .L08090B64 @ =gBg0Tm\n\
	adds r0, r6, #0\n\
	movs r1, #0\n\
	bl TmFill\n\
	ldr r5, .L08090B68 @ =gBg3Tm\n\
	adds r0, r5, #0\n\
	movs r1, #0\n\
	bl TmFill\n\
	ldr r0, .L08090B6C @ =Pal_MuralBackground\n\
	movs r1, #0x80\n\
	movs r2, #0x20\n\
	bl ApplyPaletteExt\n\
	ldr r0, .L08090B70 @ =Pal_Fin\n\
	movs r1, #0xc0\n\
	movs r2, #0x20\n\
	bl ApplyPaletteExt\n\
	ldr r0, .L08090B74 @ =Img_Fin\n\
	ldr r1, .L08090B78 @ =0x06001000\n\
	bl Decompress\n\
	ldr r4, .L08090B7C @ =Img_MuralBackground\n\
	movs r0, #3\n\
	bl GetBgChrOffset\n\
	adds r1, r0, #0\n\
	movs r3, #0xc0\n\
	lsls r3, r3, #0x13\n\
	adds r1, r1, r3\n\
	adds r0, r4, #0\n\
	bl Decompress\n\
	movs r1, #0x80\n\
	lsls r1, r1, #7\n\
	adds r0, r5, #0\n\
	bl func_fe6_08090854\n\
	movs r3, #0xc1\n\
	lsls r3, r3, #7\n\
	movs r2, #0\n\
.L08090AFC:\n\
	movs r1, #0x86\n\
	lsls r1, r1, #1\n\
	adds r0, r2, r1\n\
	lsls r0, r0, #1\n\
	adds r0, r0, r6\n\
	adds r1, r3, r2\n\
	strh r1, [r0]\n\
	movs r0, #0x96\n\
	lsls r0, r0, #1\n\
	adds r1, r2, r0\n\
	lsls r1, r1, #1\n\
	adds r1, r1, r6\n\
	adds r0, r3, #0\n\
	adds r0, #0x20\n\
	adds r0, r0, r2\n\
	strh r0, [r1]\n\
	movs r0, #0xa6\n\
	lsls r0, r0, #1\n\
	adds r1, r2, r0\n\
	lsls r1, r1, #1\n\
	adds r1, r1, r6\n\
	adds r0, r3, #0\n\
	adds r0, #0x40\n\
	adds r0, r0, r2\n\
	strh r0, [r1]\n\
	movs r0, #0xb6\n\
	lsls r0, r0, #1\n\
	adds r1, r2, r0\n\
	lsls r1, r1, #1\n\
	adds r1, r1, r6\n\
	adds r0, r3, #0\n\
	adds r0, #0x60\n\
	adds r0, r0, r2\n\
	strh r0, [r1]\n\
	adds r2, #1\n\
	cmp r2, #5\n\
	ble .L08090AFC\n\
	movs r0, #9\n\
	bl EnableBgSync\n\
	pop {r4, r5, r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L08090B54: .4byte BgConf_0868BA24\n\
.L08090B58: .4byte gDispIo\n\
.L08090B5C: .4byte 0x0000FFE0\n\
.L08090B60: .4byte 0x0000E0FF\n\
.L08090B64: .4byte gBg0Tm\n\
.L08090B68: .4byte gBg3Tm\n\
.L08090B6C: .4byte Pal_MuralBackground\n\
.L08090B70: .4byte Pal_Fin\n\
.L08090B74: .4byte Img_Fin\n\
.L08090B78: .4byte 0x06001000\n\
.L08090B7C: .4byte Img_MuralBackground\n\
	.syntax divided\n\
");
}
#endif

void Fin_Loop(struct ProcGameEnding *proc)
{
	proc->timer++;

	if (proc->timer > 0xF0)
		Proc_Break(proc);
}
