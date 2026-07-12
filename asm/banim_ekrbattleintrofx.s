	.include "macro.inc"
	.include "asm_proc.inc"
	.syntax unified

	.section .text

	thumb_func_start EkrUnitKakudai_Main
EkrUnitKakudai_Main: @ 0x08048BF0
	push {r4, r5, r6, r7, lr}
	ldr r4, .L08048C10 @ =0xFFFFFCB4
	add sp, r4
	adds r4, r0, #0
	add r5, sp, #0x304
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08048C14
	adds r0, r4, #0
	bl Proc_Break
	b .L08048D8A
	.align 2, 0
.L08048C10: .4byte 0xFFFFFCB4
.L08048C14:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048C2C
	movs r1, #0x94
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	b .L08048C38
.L08048C2C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x94
	lsls r2, r2, #2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
.L08048C38:
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne .L08048CEA
	ldr r0, [r4, #0x54]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl BanimUpdateSpriteRotScale
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048C96
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b .L08048CC4
.L08048C96:
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r6, #0x32
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
.L08048CC4:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0xe4
	lsls r1, r1, #7
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl BasPutOam
.L08048CEA:
	ldr r1, [r4, #0x50]
	cmp r1, #1
	bne .L08048D8A
	ldr r0, [r4, #0x58]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl BanimUpdateSpriteRotScale
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048D36
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	movs r6, #0x38
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b .L08048D64
.L08048D36:
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
.L08048D64:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0x93
	lsls r1, r1, #8
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl BasPutOam
.L08048D8A:
	movs r3, #0xd3
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EkrUnitKakudai_End
EkrUnitKakudai_End: @ 0x08048D98
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrWindowAppear
NewEkrWindowAppear: @ 0x08048DA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L08048DE8 @ =ProcScr_EkrWindowAppear
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne .L08048DC6
	movs r2, #0x39
.L08048DC6:
	ldr r1, .L08048DEC @ =gEkrBg0QuakeVec
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Clr323A
	ldr r1, .L08048DF0 @ =gEkrWindowAppearUnexist
	movs r0, #1
	str r0, [r1]
	bl EkrGauge_ClrInitFlag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048DE8: .4byte ProcScr_EkrWindowAppear
.L08048DEC: .4byte gEkrBg0QuakeVec
.L08048DF0: .4byte gEkrWindowAppearUnexist

	thumb_func_start CheckEkrWindowAppearUnexist
CheckEkrWindowAppearUnexist: @ 0x08048DF4
	ldr r0, .L08048E00 @ =gEkrWindowAppearUnexist
	ldr r0, [r0]
	cmp r0, #0
	beq .L08048E04
	movs r0, #0
	b .L08048E06
	.align 2, 0
.L08048E00: .4byte gEkrWindowAppearUnexist
.L08048E04:
	movs r0, #1
.L08048E06:
	bx lr

	thumb_func_start EkrWindowAppear_Main
EkrWindowAppear_Main: @ 0x08048E08
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08048E34
	ldr r1, .L08048E30 @ =gEkrWindowAppearUnexist
	movs r0, #0
	str r0, [r1]
	bl EkrGauge_SetInitFlag
	adds r0, r4, #0
	bl Proc_Break
	b .L08048E7C
	.align 2, 0
.L08048E30: .4byte gEkrWindowAppearUnexist
.L08048E34:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048E52
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	b .L08048E64
.L08048E52:
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
.L08048E64:
	bl Interpolate
	adds r2, r0, #0
	ldr r1, .L08048E84 @ =gEkrBg0QuakeVec
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Clr323A
.L08048E7C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08048E84: .4byte gEkrBg0QuakeVec

	thumb_func_start NewEkrNamewinAppear
NewEkrNamewinAppear: @ 0x08048E88
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08048EB8 @ =ProcScr_EkrNamewinAppear
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	subs r1, #0x31
	str r1, [r0, #0x48]
	cmp r4, #0
	bne .L08048EBC
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_SetPositionUnsync
	b .L08048EC4
	.align 2, 0
.L08048EB8: .4byte ProcScr_EkrNamewinAppear
.L08048EBC:
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_SetPositionUnsync
.L08048EC4:
	ldr r1, .L08048ED4 @ =gEkrNameWinAppearExist
	movs r0, #1
	str r0, [r1]
	bl UnsyncEkrDispUP
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048ED4: .4byte gEkrNameWinAppearExist

	thumb_func_start CheckEkrNamewinAppearUnexist
CheckEkrNamewinAppearUnexist: @ 0x08048ED8
	ldr r0, .L08048EE4 @ =gEkrNameWinAppearExist
	ldr r0, [r0]
	cmp r0, #0
	beq .L08048EE8
	movs r0, #0
	b .L08048EEA
	.align 2, 0
.L08048EE4: .4byte gEkrNameWinAppearExist
.L08048EE8:
	movs r0, #1
.L08048EEA:
	bx lr

	thumb_func_start EkrNamewinAppear_Delay
EkrNamewinAppear_Delay: @ 0x08048EEC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	ldrh r2, [r1, #0x30]
	cmp r0, r2
	bne .L08048F04
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
	b .L08048F08
.L08048F04:
	adds r0, #1
	strh r0, [r1, #0x2c]
.L08048F08:
	pop {r0}
	bx r0

	thumb_func_start EkrNamewinAppear_Main
EkrNamewinAppear_Main: @ 0x08048F0C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08048F40
	ldr r0, .L08048F3C @ =gEkrNameWinAppearExist
	movs r1, #0
	str r1, [r0]
	bl SyncEkrDispUP
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne .L08048F34
	bl EndEkrDispUP
.L08048F34:
	adds r0, r4, #0
	bl Proc_Break
	b .L08048F7E
	.align 2, 0
.L08048F3C: .4byte gEkrNameWinAppearExist
.L08048F40:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08048F60
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b .L08048F74
.L08048F60:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
.L08048F74:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_SetPositionUnsync
.L08048F7E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrBaseAppear
NewEkrBaseAppear: @ 0x08048F88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08048FAC @ =ProcScr_EkrBaseAppear
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne .L08048FB4
	ldr r2, .L08048FB0 @ =0x0000FFA8
	movs r0, #2
	bl SetBgOffset
	b .L08048FBE
	.align 2, 0
.L08048FAC: .4byte ProcScr_EkrBaseAppear
.L08048FB0: .4byte 0x0000FFA8
.L08048FB4:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08048FBE:
	ldr r1, .L08048FCC @ =gProcEkrBaseAppearExist
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048FCC: .4byte gProcEkrBaseAppearExist

	thumb_func_start CheckEkrBaseAppearUnexist
CheckEkrBaseAppearUnexist: @ 0x08048FD0
	ldr r0, .L08048FDC @ =gProcEkrBaseAppearExist
	ldr r0, [r0]
	cmp r0, #0
	beq .L08048FE0
	movs r0, #0
	b .L08048FE2
	.align 2, 0
.L08048FDC: .4byte gProcEkrBaseAppearExist
.L08048FE0:
	movs r0, #1
.L08048FE2:
	bx lr

	thumb_func_start EkrBaseAppear_Loop
EkrBaseAppear_Loop: @ 0x08048FE4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L0804900C
	ldr r1, .L08049008 @ =gProcEkrBaseAppearExist
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08049050
	.align 2, 0
.L08049008: .4byte gProcEkrBaseAppearExist
.L0804900C:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L0804902E
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b .L08049044
.L0804902E:
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
.L08049044:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
.L08049050:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
