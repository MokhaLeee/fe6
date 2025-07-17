	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayRank_Loop
PlayRank_Loop: @ 0x0808F098
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq .L0808F0B0
	ldr r0, .L0808F12C @ =unk_02016A1C
	ldrh r0, [r0]
	bl func_fe6_0808EC78
	movs r0, #0
	strh r0, [r4, #0x30]
.L0808F0B0:
	ldr r7, .L0808F130 @ =unk_02016A26
	ldrh r0, [r7]
	cmp r0, #8
	bhi .L0808F0CC
	ldrh r0, [r4, #0x2e]
	adds r1, r0, #1
	strh r1, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bgt .L0808F0C8
	b .L0808F220
.L0808F0C8:
	movs r0, #0
	strh r0, [r4, #0x2e]
.L0808F0CC:
	ldr r5, .L0808F12C @ =unk_02016A1C
	ldrh r2, [r5]
	adds r2, #1
	strh r2, [r5]
	movs r6, #0xff
	ands r2, r6
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r7]
	cmp r1, #0xc
	bls .L0808F0F8
	ldr r0, .L0808F134 @ =unk_02016A1E
	ldrh r2, [r0]
	adds r2, #1
	strh r2, [r0]
	ands r2, r6
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
.L0808F0F8:

	ldr r2, .L0808F138 @ =unk_02016A22
	ldrh r5, [r5]
	ldrh r1, [r2]
	subs r0, r5, r1
	movs r1, #0xf0
	ands r0, r1
	asrs r1, r0, #3
	ldr r0, .L0808F13C @ =unk_02016A20
	adds r3, r0, #0
	ldrh r0, [r3]
	cmp r1, r0
	bne .L0808F112
	b .L0808F220
.L0808F112:
	strh r1, [r3]
	movs r0, #1
	strh r0, [r4, #0x30]
	ldrh r0, [r7]
	cmp r0, #0xe
	bls .L0808F120
	b .L0808F218
.L0808F120:
	lsls r0, r0, #2
	ldr r1, .L0808F140 @ =.L0808F144
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808F12C: .4byte unk_02016A1C
.L0808F130: .4byte unk_02016A26
.L0808F134: .4byte unk_02016A1E
.L0808F138: .4byte unk_02016A22
.L0808F13C: .4byte unk_02016A20
.L0808F140: .4byte .L0808F144
.L0808F144: @ jump table
	.4byte .L0808F180 @ case 0
	.4byte .L0808F218 @ case 1
	.4byte .L0808F218 @ case 2
	.4byte .L0808F218 @ case 3
	.4byte .L0808F218 @ case 4
	.4byte .L0808F218 @ case 5
	.4byte .L0808F218 @ case 6
	.4byte .L0808F218 @ case 7
	.4byte .L0808F18E @ case 8
	.4byte .L0808F1A4 @ case 9
	.4byte .L0808F218 @ case 10
	.4byte .L0808F1BC @ case 11
	.4byte .L0808F218 @ case 12
	.4byte .L0808F1C4 @ case 13
	.4byte .L0808F1EC @ case 14
.L0808F180:
	ldrh r0, [r3]
	bl PlayRank_ChapterTurns_DrawTurn
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808F220
	b .L0808F218
.L0808F18E:
	ldr r0, .L0808F1A0 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	b .L0808F218
	.align 2, 0
.L0808F1A0: .4byte gBg0Tm
.L0808F1A4:
	movs r1, #0x80
	strh r1, [r2]
	ldr r0, .L0808F1B8 @ =unk_02016A1C
	strh r1, [r0]
	movs r0, #0
	strh r0, [r3]
	bl SetupPlayRanks
	b .L0808F218
	.align 2, 0
.L0808F1B8: .4byte unk_02016A1C
.L0808F1BC:
	ldrh r0, [r3]
	bl func_fe6_0808EB94
	b .L0808F218
.L0808F1C4:
	ldrh r0, [r3]
	bl PlayRank_PutTotalPlayTime
	ldr r2, .L0808F1E8 @ =gDispIo
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	b .L0808F218
	.align 2, 0
.L0808F1E8: .4byte gDispIo
.L0808F1EC:
	ldr r1, .L0808F20C @ =unk_02016A2A
	movs r0, #0
	strh r0, [r1]
	ldr r0, .L0808F210 @ =ProcScr_0868B730
	movs r1, #3
	bl SpawnProc
	ldr r0, .L0808F214 @ =ProcScr_0868B6D8
	movs r1, #3
	bl SpawnProc
	adds r0, r4, #0
	bl Proc_Break
	b .L0808F220
	.align 2, 0
.L0808F20C: .4byte unk_02016A2A
.L0808F210: .4byte ProcScr_0868B730
.L0808F214: .4byte ProcScr_0868B6D8
.L0808F218:
	ldr r1, .L0808F228 @ =unk_02016A26
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L0808F220:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F228: .4byte unk_02016A26
