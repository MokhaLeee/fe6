	.include "macro.inc"
	.syntax unified

	.section .text


	thumb_func_start EkrMainMini_PutTerrainfx
EkrMainMini_PutTerrainfx: @ 0x0804BF40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, .L0804BFA8 @ =gBanimTerrainTable
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq .L0804BF7E
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
.L0804BF7E:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0804BF94
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
.L0804BF94:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt .L0804BFAC
	cmp r0, #1
	bge .L0804BFBA
	cmp r0, #0
	beq .L0804BFB0
	b .L0804BFBA
	.align 2, 0
.L0804BFA8: .4byte gBanimTerrainTable
.L0804BFAC:
	cmp r0, #4
	bne .L0804BFBA
.L0804BFB0:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b .L0804BFC8
.L0804BFBA:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
.L0804BFC8:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov sb, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq .L0804C04C
	cmp r4, r0
	blt .L0804C0AC
	cmp r4, #3
	bgt .L0804C0AC
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, .L0804C048 @ =gPal
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r6, #0
	bl func_fe6_0804C330
	b .L0804C0AC
	.align 2, 0
.L0804C048: .4byte gPal
.L0804C04C:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0804C07A
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, .L0804C0C4 @ =gPal+0x200
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
.L0804C07A:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0804C0A8
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, .L0804C0C4 @ =gPal+0x200
	adds r1, r1, r0
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
.L0804C0A8:
	bl EnablePalSync
.L0804C0AC:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls .L0804C0BA
	b .L0804C2DA
.L0804C0BA:
	lsls r0, r0, #2
	ldr r1, .L0804C0C8 @ =.L0804C0CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C0C4: .4byte gPal+0x200
.L0804C0C8: .4byte .L0804C0CC
.L0804C0CC: @ jump table
	.4byte .L0804C100 @ case 0
	.4byte .L0804C0E0 @ case 1
	.4byte .L0804C0E8 @ case 2
	.4byte .L0804C0F0 @ case 3
	.4byte .L0804C0F8 @ case 4
.L0804C0E0:
	movs r0, #1
	bl EnableBgSync
	b .L0804C2DA
.L0804C0E8:
	movs r0, #2
	bl EnableBgSync
	b .L0804C2DA
.L0804C0F0:
	movs r0, #4
	bl EnableBgSync
	b .L0804C2DA
.L0804C0F8:
	movs r0, #8
	bl EnableBgSync
	b .L0804C2DA
.L0804C100:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq .L0804C1EE
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi .L0804C1EE
	lsls r0, r0, #2
	ldr r1, .L0804C124 @ =.L0804C128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C124: .4byte .L0804C128
.L0804C128: @ jump table
	.4byte .L0804C13C @ case 0
	.4byte .L0804C168 @ case 1
	.4byte .L0804C194 @ case 2
	.4byte .L0804C1C0 @ case 3
	.4byte .L0804C13C @ case 4
.L0804C13C:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C164 @ =gUnk_085CCF38
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b .L0804C1E4
	.align 2, 0
.L0804C164: .4byte gUnk_085CCF38
.L0804C168:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C190 @ =AnimScr_EkrMainMini_L_Far
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b .L0804C1E4
	.align 2, 0
.L0804C190: .4byte AnimScr_EkrMainMini_L_Far
.L0804C194:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C1BC @ =AnimScr_EkrMainMini_L_Far
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b .L0804C1E4
	.align 2, 0
.L0804C1BC: .4byte AnimScr_EkrMainMini_L_Far
.L0804C1C0:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C20C @ =gUnk_085CCF38
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
.L0804C1E4:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
.L0804C1EE:
	movs r0, #6
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq .L0804C2DA
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi .L0804C2DA
	lsls r0, r0, #2
	ldr r1, .L0804C210 @ =.L0804C214
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C20C: .4byte gUnk_085CCF38
.L0804C210: .4byte .L0804C214
.L0804C214: @ jump table
	.4byte .L0804C228 @ case 0
	.4byte .L0804C254 @ case 1
	.4byte .L0804C280 @ case 2
	.4byte .L0804C2AC @ case 3
	.4byte .L0804C228 @ case 4
.L0804C228:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C250 @ =gUnk_085CCEB8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b .L0804C2D0
	.align 2, 0
.L0804C250: .4byte gUnk_085CCEB8
.L0804C254:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C27C @ =AnimScr_EkrMainMini_R_Far
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b .L0804C2D0
	.align 2, 0
.L0804C27C: .4byte AnimScr_EkrMainMini_R_Far
.L0804C280:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C2A8 @ =AnimScr_EkrMainMini_R_Far
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b .L0804C2D0
	.align 2, 0
.L0804C2A8: .4byte AnimScr_EkrMainMini_R_Far
.L0804C2AC:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0804C2E8 @ =AnimScr_EkrMainMini_R_Far
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
.L0804C2D0:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
.L0804C2DA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C2E8: .4byte AnimScr_EkrMainMini_R_Far

	thumb_func_start func_fe6_0804C2EC
func_fe6_0804C2EC: @ 0x0804C2EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L0804C310
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq .L0804C306
	bl Proc_End
.L0804C306:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq .L0804C310
	bl Proc_End
.L0804C310:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804C318
func_fe6_0804C318: @ 0x0804C318
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #0x14]
	strh r1, [r5, #0x32]
	strh r2, [r5, #0x3a]
	ldr r5, [r0, #0x18]
	strh r3, [r5, #0x32]
	strh r4, [r5, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0804C330
func_fe6_0804C330: @ 0x0804C330
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	mov sl, r4
	ldr r0, .L0804C374 @ =TsaConfs_BanimTmA
	movs r2, #0xc
	ldrsh r1, [r7, r2]
	lsls r2, r1, #3
	adds r2, r2, r0
	ldr r2, [r2]
	str r2, [sp, #0x10]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #0x14]
	movs r0, #0
	bl EfxTmFilA
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bhi .L0804C3C4
	lsls r0, r0, #2
	ldr r1, .L0804C378 @ =.L0804C37C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C374: .4byte TsaConfs_BanimTmA
.L0804C378: .4byte .L0804C37C
.L0804C37C: @ jump table
	.4byte .L0804C390 @ case 0
	.4byte .L0804C398 @ case 1
	.4byte .L0804C3B0 @ case 2
	.4byte .L0804C3C4 @ case 3
	.4byte .L0804C390 @ case 4
.L0804C390:
	movs r4, #0x21
	movs r2, #0x30
	mov sl, r2
	b .L0804C3E4
.L0804C398:
	movs r4, #0x1d
	movs r0, #0x30
	mov sl, r0
	ldr r0, .L0804C3AC @ =gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #4
	rsbs r5, r5, #0
.L0804C3A6:
	cmp r0, #1
	bne .L0804C3E6
	b .L0804C3E4
	.align 2, 0
.L0804C3AC: .4byte gEkrInitPosReal
.L0804C3B0:
	movs r4, #3
	movs r1, #0x30
	mov sl, r1
	ldr r0, .L0804C3C0 @ =gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #0x1e
	rsbs r5, r5, #0
	b .L0804C3A6
	.align 2, 0
.L0804C3C0: .4byte gEkrInitPosReal
.L0804C3C4:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L0804C3D6
	movs r4, #0x27
	movs r0, #3
	mov sl, r0
.L0804C3D6:
	movs r2, #6
	ldrsh r0, [r7, r2]
	cmp r0, r1
	beq .L0804C3E4
	movs r4, #3
	movs r0, #0x2a
	mov sl, r0
.L0804C3E4:
	movs r5, #0
.L0804C3E6:
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	lsls r2, r4, #1
	ldr r4, .L0804C46C @ =gTmA_Banim + 0x6B4
	adds r2, r2, r4
	movs r0, #0xf
	mov r8, r0
	str r0, [sp]
	movs r6, #5
	str r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #4
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	mov r0, sl
	lsls r2, r0, #1
	adds r2, r2, r4
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	lsls r0, r5, #1
	adds r4, r4, r0
	ldr r2, .L0804C470 @ =0xFFFFFA96
	adds r4, r4, r2
	ldr r2, .L0804C474 @ =gBg2Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C46C: .4byte gTmA_Banim + 0x6B4
.L0804C470: .4byte 0xFFFFFA96
.L0804C474: .4byte gBg2Tm

	thumb_func_start BanimCopyBgTM
BanimCopyBgTM: @ 0x0804C478
	push {lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi .L0804C4C0
	lsls r0, r0, #2
	ldr r1, .L0804C494 @ =.L0804C498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804C494: .4byte .L0804C498
.L0804C498: @ jump table
	.4byte .L0804C4AC @ case 0
	.4byte .L0804C4B6 @ case 1
	.4byte .L0804C4C0 @ case 2
	.4byte .L0804C4C0 @ case 3
	.4byte .L0804C4AC @ case 4
.L0804C4AC:
	movs r2, #0x30
	cmp r3, #0
	bne .L0804C4C8
	movs r2, #0x21
	b .L0804C4C8
.L0804C4B6:
	movs r2, #0x30
	cmp r3, #0
	bne .L0804C4C8
	movs r2, #0x1d
	b .L0804C4C8
.L0804C4C0:
	movs r2, #0x30
	cmp r3, #0
	bne .L0804C4C8
	movs r2, #3
.L0804C4C8:
	ldr r0, .L0804C4EC @ =gUnk_081122DA
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	ldr r3, .L0804C4F0 @ =gTmA_Banim + 0x6B4
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl EfxTmCpyExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
.L0804C4EC: .4byte gUnk_081122DA
.L0804C4F0: .4byte gTmA_Banim + 0x6B4
