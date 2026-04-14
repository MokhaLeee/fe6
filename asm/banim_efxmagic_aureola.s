	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxApocalypseOBJ_Loop2
EfxApocalypseOBJ_Loop2: @ 0x08052E9C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r7, #0x3c
	str r7, [sp]
	movs r0, #0
	movs r1, #0xb4
	movs r2, #0x32
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r6, #0
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, .L08052F24 @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10	@ tmp = ret
	muls r1, r0, r1
	lsls r1, r1, #4		@ tmp * gSinLut[proc->unk30 / 0x10] * 0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L08052F04
	strh r7, [r5, #0x2c]
.L08052F04:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble .L08052F1C
	strh r6, [r5, #0x2c]
	strh r6, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L08052F1C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052F24: .4byte gSinLut

	thumb_func_start EfxApocalypseOBJ_Loop3
EfxApocalypseOBJ_Loop3: @ 0x08052F28
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r7, #0x50
	str r7, [sp]
	movs r0, #0
	movs r1, #0x32
	movs r2, #0
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r6, #0
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, .L08052FB0 @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble .L08052F90
	strh r7, [r5, #0x2c]
.L08052F90:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble .L08052FA8
	strh r6, [r5, #0x2c]
	strh r6, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L08052FA8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052FB0: .4byte gSinLut

	thumb_func_start EfxApocalypseOBJ_Loop4
EfxApocalypseOBJ_Loop4: @ 0x08052FB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0x32
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0xb4
	bl Interpolate
	ldrh r2, [r5, #0x30]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r2, r3
	strh r1, [r5, #0x30]
	lsrs r2, r1, #8
	ldr r3, .L08053044 @ =gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r3, r0
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L0805301A
	strh r6, [r5, #0x2c]
.L0805301A:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L0805303C
	ldr r0, .L08053048 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r5, #0x60]
	bl BasRemove
	adds r0, r5, #0
	bl Proc_Break
.L0805303C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053044: .4byte gSinLut
.L08053048: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseBGCOL2
NewEfxApocalypseBGCOL2: @ 0x0805304C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805307C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053080 @ =ProcScr_EfxApocalypseBGCOL2
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08053084 @ =FrameArray_EfxApocalypseBGCOL2
	str r1, [r0, #0x48]
	ldr r1, .L08053088 @ =Pals_EfxApocalypseBGCOL2
	str r1, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805307C: .4byte gEfxBgSemaphore
.L08053080: .4byte ProcScr_EfxApocalypseBGCOL2
.L08053084: .4byte FrameArray_EfxApocalypseBGCOL2
.L08053088: .4byte Pals_EfxApocalypseBGCOL2

	thumb_func_start EfxApocalypseBGCOL2_Loop
EfxApocalypseBGCOL2_Loop: @ 0x0805308C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080530B6
	ldr r0, [r4, #0x4c]
	ldr r1, .L080530DC @ =gPal+0x2
	movs r2, #0xf
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl func_fe6_08047B6C
.L080530B6:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080530D4
	ldr r1, .L080530E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080530D4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080530DC: .4byte gPal+0x2
.L080530E0: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseDummy
NewEfxApocalypseDummy: @ 0x080530E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, .L0805310C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053110 @ =ProcScr_EfxApocalypseDummy
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805310C: .4byte gEfxBgSemaphore
.L08053110: .4byte ProcScr_EfxApocalypseDummy

	thumb_func_start EfxApocalypseDummy_Loop
EfxApocalypseDummy_Loop: @ 0x08053114
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053150
	ldr r1, .L08053158 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08053150:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053158: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseBgFlash1
NewEfxApocalypseBgFlash1: @ 0x0805315C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, .L08053184 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053188 @ =ProcScr_EfxApocalypseBgFlash1
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r6, [r0, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053184: .4byte gEfxBgSemaphore
.L08053188: .4byte ProcScr_EfxApocalypseBgFlash1

	thumb_func_start EfxApocalypseBgFlash1_Loop
EfxApocalypseBgFlash1_Loop: @ 0x0805318C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080531B8
	ldr r1, .L080531C0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x5c]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl NewEfxFlashBgWhite
	adds r0, r4, #0
	bl Proc_Break
.L080531B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080531C0: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseBgFlash2
NewEfxApocalypseBgFlash2: @ 0x080531C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, .L080531EC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080531F0 @ =ProcScr_EfxApocalypseBgFlash2
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r6, [r0, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080531EC: .4byte gEfxBgSemaphore
.L080531F0: .4byte ProcScr_EfxApocalypseBgFlash2

	thumb_func_start EfxApocalypseBgFlash2_Loop1
EfxApocalypseBgFlash2_Loop1: @ 0x080531F4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble .L08053212
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
.L08053212:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxApocalypseBgFlash2_Loop2
EfxApocalypseBgFlash2_Loop2: @ 0x08053218
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L08053270 @ =Pal_EfxApocalypse_0817B418
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08053274 @ =gPal
	movs r1, #1
	movs r2, #1
	adds r3, r4, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053266
	ldr r1, .L08053278 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08053266:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053270: .4byte Pal_EfxApocalypse_0817B418
.L08053274: .4byte gPal
.L08053278: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseBG2
NewEfxApocalypseBG2: @ 0x0805327C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L08053320 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053324 @ =ProcScr_EfxApocalypseBG2
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	str r0, [r5, #0x44]
	ldr r0, .L08053328 @ =FrameArray_EfxApocalypseBG2
	str r0, [r5, #0x48]
	ldr r0, .L0805332C @ =TsaArray_EfxApocalypseBG2
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08053330 @ =ImgArray_EfxApocalypseBG2
	str r0, [r5, #0x54]
	ldr r0, .L08053334 @ =Pal_EfxApocalypseBG2
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08053318
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	ldr r4, .L08053338 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r4, #0xc]
	ands r1, r3
	strb r1, [r4, #0xc]
	adds r1, r2, #0
	ldrb r3, [r4, #0x18]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r4, #0x18]
	ldrb r1, [r4, #0x10]
	ands r2, r1
	movs r1, #2
	orrs r2, r1
	strb r2, [r4, #0x10]
	movs r1, #3
	ldrb r2, [r4, #0x14]
	orrs r1, r2
	strb r1, [r4, #0x14]
	ldr r1, .L0805333C @ =0x0000F3FF
	adds r2, r1, #0
	ldrh r3, [r6, #8]
	ands r2, r3
	movs r4, #0x80
	lsls r4, r4, #3
	adds r3, r4, #0
	orrs r2, r3
	strh r2, [r6, #8]
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r3
	strh r1, [r0, #8]
.L08053318:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053320: .4byte gEfxBgSemaphore
.L08053324: .4byte ProcScr_EfxApocalypseBG2
.L08053328: .4byte FrameArray_EfxApocalypseBG2
.L0805332C: .4byte TsaArray_EfxApocalypseBG2
.L08053330: .4byte ImgArray_EfxApocalypseBG2
.L08053334: .4byte Pal_EfxApocalypseBG2
.L08053338: .4byte gDispIo
.L0805333C: .4byte 0x0000F3FF

	thumb_func_start EfxApocalypseBG2_Loop
EfxApocalypseBG2_Loop: @ 0x08053340
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	bl GetAnimAnotherSide
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08053388
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
.L08053388:
	ldrh r0, [r7, #0x2e]
	adds r0, #1
	strh r0, [r7, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08053408
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080533F2
	ldr r3, .L08053414 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldr r2, [r7, #0x5c]
	ldr r1, .L08053418 @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	ldr r2, [r7, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r0, #0
	ldrh r0, [r2, #8]
	orrs r0, r3
	strh r0, [r2, #8]
	mov r2, r8
	ldrh r2, [r2, #8]
	ands r1, r2
	orrs r1, r3
	mov r3, r8
	strh r1, [r3, #8]
.L080533F2:
	bl SpellFx_ClearBG1
	ldr r1, .L0805341C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L08053408:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08053414: .4byte gDispIo
.L08053418: .4byte 0x0000F3FF
.L0805341C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseOBJ2
NewEfxApocalypseOBJ2: @ 0x08053420
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L080534A4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080534A8 @ =ProcScr_EfxApocalypseOBJ2
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	ldr r3, .L080534AC @ =AnimScr_EfxApocalypseOBJ2_1
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r5, #2]
	movs r0, #0x48
	strh r0, [r5, #4]
	movs r0, #0x14
	strh r0, [r5, #0xa]
	bl BasSort
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L08053486
	ldr r0, .L080534B0 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
.L08053486:
	ldr r0, .L080534B4 @ =Pal_EfxMistyrainOBJ1
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080534B8 @ =Img_EfxApocalypseOBJ2_1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080534A4: .4byte gEfxBgSemaphore
.L080534A8: .4byte ProcScr_EfxApocalypseOBJ2
.L080534AC: .4byte AnimScr_EfxApocalypseOBJ2_1
.L080534B0: .4byte 0x0000F3FF
.L080534B4: .4byte Pal_EfxMistyrainOBJ1
.L080534B8: .4byte Img_EfxApocalypseOBJ2_1

	thumb_func_start EfxApocalypseOBJ2_Loop1
EfxApocalypseOBJ2_Loop1: @ 0x080534BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x60]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r5, [r4, #0x2e]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble .L080534EE
	strh r3, [r4, #0x2c]
	ldr r0, .L080534F4 @ =AnimScr_EfxApocalypseOBJ2_2
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	ldr r0, .L080534F8 @ =Img_EfxApocalypseOBJ2_2
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
.L080534EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080534F4: .4byte AnimScr_EfxApocalypseOBJ2_2
.L080534F8: .4byte Img_EfxApocalypseOBJ2_2

	thumb_func_start EfxApocalypseOBJ2_Loop2
EfxApocalypseOBJ2_Loop2: @ 0x080534FC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053524
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0805352C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08053524:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805352C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseOBJ3
NewEfxApocalypseOBJ3: @ 0x08053530
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08053560 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053564 @ =ProcScr_EfxApocalypseOBJ3
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	str r2, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053560: .4byte gEfxBgSemaphore
.L08053564: .4byte ProcScr_EfxApocalypseOBJ3

	thumb_func_start EfxApocalypseOBJ3_Loop
EfxApocalypseOBJ3_Loop: @ 0x08053568
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov ip, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08053594
	ldr r1, .L08053590 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L080535E4
	.align 2, 0
.L08053590: .4byte gEfxBgSemaphore
.L08053594:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne .L080535E4
	mov r0, ip
	strh r0, [r4, #0x30]
	movs r0, #2
	str r0, [r4, #0x44]
	ldr r3, .L080535EC @ =DuraArray_EfxApocalypseOBJ3RND
	ldr r1, [r4, #0x4c]
	lsls r2, r1, #2
	adds r0, r2, r3
	ldr r7, [r0]
	ldr r0, .L080535F0 @ =LoArray_EfxApocalypseOBJ3RND
	adds r0, r2, r0
	ldr r6, [r0]
	ldr r0, .L080535F4 @ =StateArray_EfxApocalypseOBJ3RND
	adds r2, r2, r0
	ldr r5, [r2]
	adds r1, #1
	str r1, [r4, #0x4c]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080535D8
	mov r1, ip
	str r1, [r4, #0x4c]
.L080535D8:
	ldr r0, [r4, #0x5c]
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl NewEfxApocalypseOBJ3RND
.L080535E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080535EC: .4byte DuraArray_EfxApocalypseOBJ3RND
.L080535F0: .4byte LoArray_EfxApocalypseOBJ3RND
.L080535F4: .4byte StateArray_EfxApocalypseOBJ3RND

	thumb_func_start NewEfxApocalypseOBJ3RND
NewEfxApocalypseOBJ3RND: @ 0x080535F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	ldr r1, .L08053644 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053648 @ =ProcScr_EfxApocalypseOBJ3RND
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	mov r0, r8
	str r0, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r4, [r6, #0x2e]
	str r5, [r6, #0x44]
	lsls r4, r4, #0xb
	adds r5, r5, r4
	str r5, [r6, #0x48]
	movs r0, #0x78
	strh r0, [r6, #0x32]
	movs r0, #0x48
	strh r0, [r6, #0x3a]
	cmp r7, #6
	bhi .L0805367C
	lsls r0, r7, #2
	ldr r1, .L0805364C @ =.L08053650
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08053644: .4byte gEfxBgSemaphore
.L08053648: .4byte ProcScr_EfxApocalypseOBJ3RND
.L0805364C: .4byte .L08053650
.L08053650: @ jump table
	.4byte .L0805366C @ case 0
	.4byte .L0805366C @ case 1
	.4byte .L0805366C @ case 2
	.4byte .L0805366C @ case 3
	.4byte .L0805366C @ case 4
	.4byte .L08053674 @ case 5
	.4byte .L0805367C @ case 6
.L0805366C:
	ldr r3, .L08053670 @ =AnimScr_EfxApocalypseOBJ3RND_3
	b .L0805367E
	.align 2, 0
.L08053670: .4byte AnimScr_EfxApocalypseOBJ3RND_3
.L08053674:
	ldr r3, .L08053678 @ =AnimScr_EfxApocalypseOBJ3RND_2
	b .L0805367E
	.align 2, 0
.L08053678: .4byte AnimScr_EfxApocalypseOBJ3RND_2
.L0805367C:
	ldr r3, .L080536BC @ =AnimScr_EfxApocalypseOBJ3RND_1
.L0805367E:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r6, #0x60]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	bl GetEkrDragonStateType
	cmp r0, #0
	beq .L080536AE
	ldr r0, .L080536C0 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
.L080536AE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080536BC: .4byte AnimScr_EfxApocalypseOBJ3RND_1
.L080536C0: .4byte 0x0000F3FF

	thumb_func_start EfxApocalypseOBJ3RND_Loop
EfxApocalypseOBJ3RND_Loop: @ 0x080536C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x6e
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, [r6, #0x44]
	ldr r2, [r6, #0x48]
	movs r7, #0x2c
	ldrsh r3, [r6, r7]
	movs r7, #0x2e
	ldrsh r0, [r6, r7]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	ldr r2, .L0805375C @ =gSinLut
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	muls r1, r4, r1
	lsls r1, r1, #4
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r4, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r6, #0x32]
	adds r1, r2, r1
	asrs r0, r0, #0x10
	ldrh r7, [r6, #0x3a]
	adds r0, r7, r0
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08053752
	ldr r0, [r6, #0x60]
	bl BasRemove
	ldr r1, .L08053760 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L08053752:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805375C: .4byte gSinLut
.L08053760: .4byte gEfxBgSemaphore
