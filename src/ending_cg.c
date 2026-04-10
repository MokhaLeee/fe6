#include "prelude.h"
#include "hardware.h"
#include "oam.h"
#include "util.h"
#include "proc.h"
#include "ui.h"
#include "util.h"
#include "eventinfo.h"
#include "eventfunctions.h"

#include "augury.h"
#include "playrank.h"
#include "ending.h"

#include "constants/flags.h"

CONST_DATA struct EndingCgConf gEndingCgConf[] = {
	[1]  = { EndingCG_08330B4C, EndingCG_08331B9C, NULL, NULL },
	[3]  = { EndingCG_0832EDCC, EndingCG_0832FD70, NULL, NULL },
	[6]  = { EndingCG_0832CCB0, EndingCG_0832DC8C, NULL, NULL },
	[8]  = { EndingCG_08335CE8, EndingCG_08336C40, NULL, NULL },
	[10] = { EndingCG_08332E84, EndingCG_08333DD4, EndingCG_08331BBC, EndingCG_08332E64 },
	[11] = { EndingCG_08333DF4, EndingCG_08335060, EndingCG_08335080, EndingCG_08335CC8 },
	[12] = { EndingCG_0832FD90, EndingCG_08330B2C, EndingCG_0832DCAC, EndingCG_0832EDAC },
};

bool CheckDisplayEndingCG(void)
{
	if (gEndingCgIndex < 13 && gEndingCgConf[gEndingCgIndex].img1)
		return true;

	return false;
}

struct ProcScr CONST_DATA ProcScr_EndingBG[] = {
	PROC_19,
	PROC_CALL(EndingBG_Init),
	PROC_CALL(FadeInBlackSpeed08),
	PROC_SLEEP(1),
	PROC_REPEAT(EndingBG_Loop),
	PROC_CALL(FadeInBlackWithCallBack_Speed08),
	PROC_SLEEP(1),
	PROC_END,
};

// https://decomp.me/scratch/0w0Tb
#if NONMATCHING
void EndingBG_Init(struct ProcGameEnding *proc)
{
	const void *img;
	const void *pal;
	bool tmp, ret = 0;

	proc->timer = 0;

	InitBgs(BgConf_0868BA24);
	SetDispEnable(0, 0, 1, 0, 0);
	SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);
	SetBlendTargetA(0, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 0, 0, 0);

	SetBgOffset(BG_2, 0, -4);
	TmFill(gBg2Tm, 0);

	switch (gEndingCgIndex) {
	case 10:
		if (CheckFlag(FLAG_107))
			ret = true;

		break;

	case 11:
		if (GetEndingId() == FAKE_ENDING)
			ret = true;

		break;

	case 12:
		if (GetEndingId() == TRUE_ENDING)
			ret = true;

		break;

	default:
		break;
	}

	if (ret)
		img = gEndingCgConf[gEndingCgIndex].img2;
	else
		img = gEndingCgConf[gEndingCgIndex].img1;

	Decompress(img, (u8 *)BG_VRAM + BGCHR_ENDING_CG * CHR_SIZE + GetBgChrOffset(BG_2));

	if (ret)
		pal = gEndingCgConf[gEndingCgIndex].pal2;
	else
		pal = gEndingCgConf[gEndingCgIndex].pal1;

	ApplyPalette(pal, BGPAL_ENDING_CG);

	PutEndingCreditTm(gBg2Tm + TM_OFFSET(7, 5), OAM2_PAL(BGPAL_ENDING_CG) + BGCHR_ENDING_CG, 15, 10);
	EnableBgSync(BG2_SYNC_BIT);
}
#else
NAKEDFUNC
void EndingBG_Init(struct ProcGameEnding *proc)
{
asm("\
	.syntax unified\n\
	push {r4, r5, lr}\n\
	movs r5, #0\n\
	adds r0, #0x64\n\
	movs r4, #0\n\
	strh r5, [r0]\n\
	ldr r0, .L08090C48 @ =BgConf_0868BA24\n\
	bl InitBgs\n\
	ldr r2, .L08090C4C @ =gDispIo\n\
	movs r0, #2\n\
	rsbs r0, r0, #0\n\
	ldrb r1, [r2, #1]\n\
	ands r0, r1\n\
	movs r1, #3\n\
	rsbs r1, r1, #0\n\
	ands r0, r1\n\
	movs r1, #4\n\
	orrs r0, r1\n\
	movs r1, #9\n\
	rsbs r1, r1, #0\n\
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
	ldr r0, .L08090C50 @ =0x0000FFE0\n\
	ldrh r1, [r2, #0x3c]\n\
	ands r0, r1\n\
	ldr r1, .L08090C54 @ =0x0000E0FF\n\
	ands r0, r1\n\
	strh r0, [r2, #0x3c]\n\
	ldr r2, .L08090C58 @ =0x0000FFFC\n\
	movs r0, #2\n\
	movs r1, #0\n\
	bl SetBgOffset\n\
	ldr r0, .L08090C5C @ =gBg2Tm\n\
	movs r1, #0\n\
	bl TmFill\n\
	ldr r0, .L08090C60 @ =gEndingCgIndex\n\
	ldrb r0, [r0]\n\
	cmp r0, #0xa\n\
	beq .L08090C64\n\
	cmp r0, #0xa\n\
	blt .L08090C96\n\
	cmp r0, #0xb\n\
	beq .L08090C74\n\
	cmp r0, #0xc\n\
	beq .L08090C88\n\
	b .L08090C96\n\
	.align 2, 0\n\
.L08090C48: .4byte BgConf_0868BA24\n\
.L08090C4C: .4byte gDispIo\n\
.L08090C50: .4byte 0x0000FFE0\n\
.L08090C54: .4byte 0x0000E0FF\n\
.L08090C58: .4byte 0x0000FFFC\n\
.L08090C5C: .4byte gBg2Tm\n\
.L08090C60: .4byte gEndingCgIndex\n\
.L08090C64:\n\
	movs r0, #0x6b\n\
	bl CheckFlag\n\
	movs r1, #0\n\
	lsls r0, r0, #0x18\n\
	cmp r0, #0\n\
	bne .L08090C84\n\
	b .L08090C82\n\
.L08090C74:\n\
	bl GetEndingId\n\
	movs r1, #0\n\
	lsls r0, r0, #0x18\n\
	lsrs r0, r0, #0x18\n\
	cmp r0, #2\n\
	bne .L08090C84\n\
.L08090C82:\n\
	movs r1, #1\n\
.L08090C84:\n\
	adds r5, r1, #0\n\
	b .L08090C96\n\
.L08090C88:\n\
	bl GetEndingId\n\
	lsls r0, r0, #0x18\n\
	lsrs r0, r0, #0x18\n\
	rsbs r1, r0, #0\n\
	orrs r1, r0\n\
	lsrs r5, r1, #0x1f\n\
.L08090C96:\n\
	lsls r0, r5, #0x18\n\
	adds r5, r0, #0\n\
	cmp r5, #0\n\
	beq .L08090CB8\n\
	ldr r0, .L08090CB0 @ =gEndingCgConf\n\
	ldr r1, .L08090CB4 @ =gEndingCgIndex\n\
	ldrb r1, [r1]\n\
	lsls r1, r1, #4\n\
	adds r0, #8\n\
	adds r1, r1, r0\n\
	ldr r4, [r1]\n\
	b .L08090CC4\n\
	.align 2, 0\n\
.L08090CB0: .4byte gEndingCgConf\n\
.L08090CB4: .4byte gEndingCgIndex\n\
.L08090CB8:\n\
	ldr r1, .L08090CE8 @ =gEndingCgConf\n\
	ldr r0, .L08090CEC @ =gEndingCgIndex\n\
	ldrb r0, [r0]\n\
	lsls r0, r0, #4\n\
	adds r0, r0, r1\n\
	ldr r4, [r0]\n\
.L08090CC4:\n\
	movs r0, #2\n\
	bl GetBgChrOffset\n\
	adds r1, r0, #0\n\
	ldr r3, .L08090CF0 @ =0x06002800\n\
	adds r1, r1, r3\n\
	adds r0, r4, #0\n\
	bl Decompress\n\
	cmp r5, #0\n\
	beq .L08090CF4\n\
	ldr r0, .L08090CE8 @ =gEndingCgConf\n\
	ldr r1, .L08090CEC @ =gEndingCgIndex\n\
	ldrb r1, [r1]\n\
	lsls r1, r1, #4\n\
	adds r0, #0xc\n\
	b .L08090CFE\n\
	.align 2, 0\n\
.L08090CE8: .4byte gEndingCgConf\n\
.L08090CEC: .4byte gEndingCgIndex\n\
.L08090CF0: .4byte 0x06002800\n\
.L08090CF4:\n\
	ldr r0, .L08090D24 @ =gEndingCgConf\n\
	ldr r1, .L08090D28 @ =gEndingCgIndex\n\
	ldrb r1, [r1]\n\
	lsls r1, r1, #4\n\
	adds r0, #4\n\
.L08090CFE:\n\
	adds r1, r1, r0\n\
	ldr r0, [r1]\n\
	movs r1, #0xc0\n\
	movs r2, #0x20\n\
	bl ApplyPaletteExt\n\
	ldr r0, .L08090D2C @ =gBg2Tm+0x14E\n\
	ldr r1, .L08090D30 @ =0x00006140\n\
	movs r2, #0xf\n\
	movs r3, #0xa\n\
	bl PutEndingCreditTm\n\
	movs r0, #4\n\
	bl EnableBgSync\n\
	pop {r4, r5}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L08090D24: .4byte gEndingCgConf\n\
.L08090D28: .4byte gEndingCgIndex\n\
.L08090D2C: .4byte gBg2Tm+0x14E\n\
.L08090D30: .4byte 0x00006140\n\
	.syntax divided\n\
");
}
#endif

void EndingBG_Loop(struct ProcGameEnding *proc)
{
	proc->timer++;

	if (proc->timer > 0xF0)
		Proc_Break(proc);
}
