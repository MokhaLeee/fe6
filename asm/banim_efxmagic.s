	.include "macro.inc"

	.syntax unified


	thumb_func_start EfxHazymoon_Loop
EfxHazymoon_Loop: @ 0x080537A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080537D6
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L080537D6:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08053848
	ldr r3, .L08053844 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xa0
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, [r6, #0x5c]
	bl NewEfxHazymoonBG1
	ldr r0, [r6, #0x5c]
	bl NewEfxHazymoonOBJ3
	movs r0, #0x9c
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b .L08053946
	.align 2, 0
.L08053844: .4byte gDispIo
.L08053848:
	adds r0, r4, #0
	adds r0, #0x7f
	cmp r1, r0
	bne .L0805387C
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x52
	movs r2, #0xf
	movs r3, #0
	bl NewEfxRestRST
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x3c
	bl NewEfxResireRST
	ldr r2, .L08053878 @ =EfxRestWINH_DefaultHblank
	adds r0, r5, #0
	movs r1, #0x53
	bl NewEfxRestWINH_
	b .L08053946
	.align 2, 0
.L08053878: .4byte EfxRestWINH_DefaultHblank
.L0805387C:
	adds r0, r4, #0
	adds r0, #0xd2
	cmp r1, r0
	bne .L0805388C
	adds r0, r5, #0
	bl NewEfxHazymoonBG2
	b .L08053946
.L0805388C:
	adds r0, r4, #0
	adds r0, #0xd7
	cmp r1, r0
	bne .L080538AC
	ldr r0, .L080538A8 @ =0x00000139
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b .L08053946
	.align 2, 0
.L080538A8: .4byte 0x00000139
.L080538AC:
	adds r0, r4, #0
	adds r0, #0xf1
	cmp r1, r0
	bne .L080538BC
	ldr r0, [r6, #0x5c]
	bl NewEfxHazymoonOBJ2
	b .L08053946
.L080538BC:
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053902
	movs r0, #0x9d
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08053946
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L08053946
.L08053902:
	movs r2, #0xa3
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053924
	adds r0, r5, #0
	bl NewEfxHazymoonBG3
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	b .L08053946
.L08053924:
	movs r3, #0xaf
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	beq .L08053946
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053946
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r6, #0
	bl Proc_Break
.L08053946:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxHazymoonBG1
NewEfxHazymoonBG1: @ 0x08053954
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080539A8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080539AC @ =ProcScr_EfxHazymoonBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080539B0 @ =FrameArray_EfxHazymoonBG1
	str r1, [r0, #0x48]
	ldr r1, .L080539B4 @ =TsaArray_EfxHazymoonBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080539B8 @ =ImgArray_EfxHazymoonBG
	str r1, [r0, #0x54]
	ldr r0, .L080539BC @ =Pal_EfxResireBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L080539C0 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080539A8: .4byte gEfxBgSemaphore
.L080539AC: .4byte ProcScr_EfxHazymoonBG
.L080539B0: .4byte FrameArray_EfxHazymoonBG1
.L080539B4: .4byte TsaArray_EfxHazymoonBG
.L080539B8: .4byte ImgArray_EfxHazymoonBG
.L080539BC: .4byte Pal_EfxResireBG
.L080539C0: .4byte gDispIo

	thumb_func_start NewEfxHazymoonBG2
NewEfxHazymoonBG2: @ 0x080539C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08053A28 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053A2C @ =ProcScr_EfxHazymoonBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r4, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08053A30 @ =FrameArray_EfxHazymoonBG2
	str r1, [r0, #0x48]
	ldr r1, .L08053A34 @ =TsaArray_EfxHazymoonBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08053A38 @ =ImgArray_EfxHazymoonBG
	str r1, [r0, #0x54]
	ldr r0, .L08053A3C @ =Pal_EfxHazymoonBG2
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, .L08053A40 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053A28: .4byte gEfxBgSemaphore
.L08053A2C: .4byte ProcScr_EfxHazymoonBG
.L08053A30: .4byte FrameArray_EfxHazymoonBG2
.L08053A34: .4byte TsaArray_EfxHazymoonBG
.L08053A38: .4byte ImgArray_EfxHazymoonBG
.L08053A3C: .4byte Pal_EfxHazymoonBG2
.L08053A40: .4byte gDispIo

	thumb_func_start NewEfxHazymoonBG3
NewEfxHazymoonBG3: @ 0x08053A44
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08053A80 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053A84 @ =ProcScr_EfxHazymoonBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08053A88 @ =FrameArray_EfxHazymoonBG3
	str r1, [r0, #0x48]
	ldr r1, .L08053A8C @ =TsaArray_EfxHazymoonBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08053A90 @ =ImgArray_EfxHazymoonBG
	str r1, [r0, #0x54]
	ldr r0, .L08053A94 @ =Pal_EfxHazymoonBG3
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053A80: .4byte gEfxBgSemaphore
.L08053A84: .4byte ProcScr_EfxHazymoonBG
.L08053A88: .4byte FrameArray_EfxHazymoonBG3
.L08053A8C: .4byte TsaArray_EfxHazymoonBG
.L08053A90: .4byte ImgArray_EfxHazymoonBG
.L08053A94: .4byte Pal_EfxHazymoonBG3

	thumb_func_start EfxHazymoonBG_Loop
EfxHazymoonBG_Loop: @ 0x08053A98
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08053AD4
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
	b .L08053AF2
.L08053AD4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08053AF2
	bl SpellFx_ClearBG1
	ldr r1, .L08053AF8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08053AF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08053AF8: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxHazymoonOBJ2
NewEfxHazymoonOBJ2: @ 0x08053AFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08053B54 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053B58 @ =ProcScr_EfxHazymoonOBJ2
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08053B5C @ =AnimScr_Common
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, .L08053B60 @ =0x0000F3FF
	ldrh r1, [r6, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08053B64
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L08053B68
	.align 2, 0
.L08053B54: .4byte gEfxBgSemaphore
.L08053B58: .4byte ProcScr_EfxHazymoonOBJ2
.L08053B5C: .4byte AnimScr_Common
.L08053B60: .4byte 0x0000F3FF
.L08053B64:
	ldrh r0, [r6, #2]
	adds r0, #8
.L08053B68:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	beq .L08053B7E
	ldrh r0, [r6, #2]
	subs r0, #0x10
	strh r0, [r6, #2]
.L08053B7E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxHazymoonOBJ2_OnEnd
EfxHazymoonOBJ2_OnEnd: @ 0x08053B88
	push {lr}
	ldr r2, .L08053B9C @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08053B9C: .4byte gEfxBgSemaphore

	thumb_func_start EfxHazymoonOBJ2_Loop1
EfxHazymoonOBJ2_Loop1: @ 0x08053BA0
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L08053BE4
	ldr r0, .L08053BD8 @ =AnimScr_EfxHazymoonOBJ2_1
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08053BDC @ =Pal_EfxHazymoonOBJ2
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053BE0 @ =Img_EfxHazymoonOBJ2_1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L08053BF4
	.align 2, 0
.L08053BD8: .4byte AnimScr_EfxHazymoonOBJ2_1
.L08053BDC: .4byte Pal_EfxHazymoonOBJ2
.L08053BE0: .4byte Img_EfxHazymoonOBJ2_1
.L08053BE4:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L08053BF4
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08053BF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxHazymoonOBJ2_Loop2
EfxHazymoonOBJ2_Loop2: @ 0x08053BFC
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L08053C40
	ldr r0, .L08053C34 @ =AnimScr_EfxHazymoonOBJ2_2
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08053C38 @ =Pal_EfxHazymoonOBJ2
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053C3C @ =Img_EfxHazymoonOBJ2_2
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L08053C50
	.align 2, 0
.L08053C34: .4byte AnimScr_EfxHazymoonOBJ2_2
.L08053C38: .4byte Pal_EfxHazymoonOBJ2
.L08053C3C: .4byte Img_EfxHazymoonOBJ2_2
.L08053C40:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L08053C50
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08053C50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxHazymoonOBJ2_Loop3
EfxHazymoonOBJ2_Loop3: @ 0x08053C58
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L08053C9C
	ldr r0, .L08053C90 @ =AnimScr_EfxHazymoonOBJ2_3
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08053C94 @ =Pal_EfxHazymoonOBJ2
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053C98 @ =Img_EfxHazymoonOBJ2_3
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L08053CAC
	.align 2, 0
.L08053C90: .4byte AnimScr_EfxHazymoonOBJ2_3
.L08053C94: .4byte Pal_EfxHazymoonOBJ2
.L08053C98: .4byte Img_EfxHazymoonOBJ2_3
.L08053C9C:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L08053CAC
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08053CAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxHazymoonOBJ3
NewEfxHazymoonOBJ3: @ 0x08053CB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08053CEC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053CF0 @ =ProcScr_EfxHazymoonOBJ3
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x64
	strh r1, [r0, #0x30]
	ldr r0, .L08053CF4 @ =Pal_EfxMistyrainOBJ1
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08053CF8 @ =Img_EfxMistyrainOBJ1_1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053CEC: .4byte gEfxBgSemaphore
.L08053CF0: .4byte ProcScr_EfxHazymoonOBJ3
.L08053CF4: .4byte Pal_EfxMistyrainOBJ1
.L08053CF8: .4byte Img_EfxMistyrainOBJ1_1

	thumb_func_start EfxHazymoonOBJ3_Loop
EfxHazymoonOBJ3_Loop: @ 0x08053CFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x12
	bne .L08053D4E
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L08053D54 @ =gEclipseAnimSpriteCoordinates
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r0, [r4, #0x5c]
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl NewEfxHazymoonOBJ3RND
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne .L08053D4E
	ldr r1, .L08053D58 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08053D4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08053D54: .4byte gEclipseAnimSpriteCoordinates
.L08053D58: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxHazymoonOBJ3RND
NewEfxHazymoonOBJ3RND: @ 0x08053D5C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L08053DA4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08053DA8 @ =ProcScr_EfxHazymoonOBJ3RND
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08053DAC @ =AnimScr_EfxHazymoonOBJ3RND
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053DA4: .4byte gEfxBgSemaphore
.L08053DA8: .4byte ProcScr_EfxHazymoonOBJ3RND
.L08053DAC: .4byte AnimScr_EfxHazymoonOBJ3RND

	thumb_func_start EfxHazymoonOBJ3RND_Loop
EfxHazymoonOBJ3RND_Loop: @ 0x08053DB0
	push {lr}
	ldr r2, .L08053DC4 @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08053DC4: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimFenrir
StartSpellAnimFenrir: @ 0x08053DC8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08053E00 @ =ProcScr_EfxFenrir
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053E00: .4byte ProcScr_EfxFenrir

	thumb_func_start EfxFenrir_Loop
EfxFenrir_Loop: @ 0x08053E04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08053E3A
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08053E3A:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08053ED0
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxFenrirBG
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxFenrirBGCOL
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl NewEfxRestRST
	ldr r2, .L08053EC8 @ =EfxRestWINH_DefaultHblank
	adds r0, r5, #0
	movs r1, #0x69
	bl NewEfxRestWINH_
	ldr r3, .L08053ECC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl NewEfxALPHA
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b .L08053FE8
	.align 2, 0
.L08053EC8: .4byte EfxRestWINH_DefaultHblank
.L08053ECC: .4byte gDispIo
.L08053ED0:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne .L08053EE8
	adds r0, r5, #0
	movs r1, #0x4a
	bl NewEfxFenrirOBJ
	ldr r0, .L08053EE4 @ =0x00000131
	b .L08053F40
	.align 2, 0
.L08053EE4: .4byte 0x00000131
.L08053EE8:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne .L08053EF8
	adds r0, r5, #0
	bl NewEfxFenrirBG2_A
	b .L08053FE8
.L08053EF8:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xdf
	cmp r1, r0
	beq .L08053F3C
	adds r0, r4, #0
	adds r0, #0xfb
	cmp r1, r0
	beq .L08053F3C
	ldr r2, .L08053F50 @ =0x00000117
	adds r0, r4, r2
	cmp r1, r0
	beq .L08053F3C
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	ldr r7, .L08053F54 @ =0x00000133
	adds r0, r4, r7
	cmp r1, r0
	bne .L08053F58
.L08053F3C:
	movs r0, #0x99
	lsls r0, r0, #1
.L08053F40:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b .L08053FE8
	.align 2, 0
.L08053F50: .4byte 0x00000117
.L08053F54: .4byte 0x00000133
.L08053F58:
	movs r2, #0xb3
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053FA2
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl NewEfxFenrirOBJ2
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	adds r0, r7, #0
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08053FE8
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L08053FE8
.L08053FA2:
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053FC6
	adds r0, r5, #0
	bl NewEfxFenrirBG2_B
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl NewEfxALPHA
	b .L08053FE8
.L08053FC6:
	movs r3, #0xcd
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	beq .L08053FE8
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08053FE8
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r6, #0
	bl Proc_Break
.L08053FE8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxFenrirBG
NewEfxFenrirBG: @ 0x08053FF4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054068 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805406C @ =ProcScr_EfxFenrirBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08054070 @ =Img_EfxFenrirBG
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, .L08054074 @ =Tsa_EfxFenrirBG
	ldr r4, .L08054078 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L0805407C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08054080 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054068: .4byte gEfxBgSemaphore
.L0805406C: .4byte ProcScr_EfxFenrirBG
.L08054070: .4byte Img_EfxFenrirBG
.L08054074: .4byte Tsa_EfxFenrirBG
.L08054078: .4byte gEkrTsaBuffer
.L0805407C: .4byte gBg1Tm
.L08054080: .4byte gDispIo

	thumb_func_start EfxFenrirBG_OnEnd
EfxFenrirBG_OnEnd: @ 0x08054084
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, .L0805409C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
.L0805409C: .4byte gEfxBgSemaphore

	thumb_func_start EfxFenrirBG_Loop
EfxFenrirBG_Loop: @ 0x080540A0
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080540CC @ =gDispIo
	ldrh r1, [r0, #0x22]
	adds r1, #1
	strh r1, [r0, #0x22]
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble .L080540C8
	adds r0, r2, #0
	bl Proc_Break
.L080540C8:
	pop {r0}
	bx r0
	.align 2, 0
.L080540CC: .4byte gDispIo

	thumb_func_start NewEfxFenrirBGCOL
NewEfxFenrirBGCOL: @ 0x080540D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054108 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805410C @ =ProcScr_EfxFenrirBGCOL
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08054110 @ =FrameArray_EfxFenrirBGCOL
	str r1, [r0, #0x48]
	ldr r1, .L08054114 @ =Pal_EfxFenrirBGCOL
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054108: .4byte gEfxBgSemaphore
.L0805410C: .4byte ProcScr_EfxFenrirBGCOL
.L08054110: .4byte FrameArray_EfxFenrirBGCOL
.L08054114: .4byte Pal_EfxFenrirBGCOL

	thumb_func_start EfxFenrirBGCOL_OnEnd
EfxFenrirBGCOL_OnEnd: @ 0x08054118
	ldr r1, .L08054124 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08054124: .4byte gEfxBgSemaphore

	thumb_func_start EfxFenrirBGCOL_Loop
EfxFenrirBGCOL_Loop: @ 0x08054128
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805414C
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L0805414C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08054162
	adds r0, r4, #0
	bl Proc_Break
.L08054162:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxFenrirOBJ
NewEfxFenrirOBJ: @ 0x08054168
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, .L080541B4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080541B8 @ =ProcScr_EfxFenrirOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, .L080541BC @ =AnimScr_EfxFenrirOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L080541C0 @ =Pal_EfxFenrirOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080541C4 @ =Img_EfxFenrirOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080541B4: .4byte gEfxBgSemaphore
.L080541B8: .4byte ProcScr_EfxFenrirOBJ
.L080541BC: .4byte AnimScr_EfxFenrirOBJ
.L080541C0: .4byte Pal_EfxFenrirOBJ
.L080541C4: .4byte Img_EfxFenrirOBJ

	thumb_func_start EfxFenrirOBJ_Loop
EfxFenrirOBJ_Loop: @ 0x080541C8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L080541F0
	ldr r0, .L080541F8 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L080541F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080541F8: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxFenrirBG2_A
NewEfxFenrirBG2_A: @ 0x080541FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08054260 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054264 @ =ProcScr_EfxFenrirBG2
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08054268 @ =FrameArray_EfxFenrirBG2_A
	str r0, [r5, #0x48]
	ldr r0, .L0805426C @ =TsaArray_EfxFenrirBG2_A
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054270 @ =ImgArray_EfxFenrirBG2_A
	str r0, [r5, #0x54]
	ldr r0, .L08054274 @ =Pal_EfxFenrirBG2_A
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08054278 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08054286
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805427C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08054286
	.align 2, 0
.L08054260: .4byte gEfxBgSemaphore
.L08054264: .4byte ProcScr_EfxFenrirBG2
.L08054268: .4byte FrameArray_EfxFenrirBG2_A
.L0805426C: .4byte TsaArray_EfxFenrirBG2_A
.L08054270: .4byte ImgArray_EfxFenrirBG2_A
.L08054274: .4byte Pal_EfxFenrirBG2_A
.L08054278: .4byte gEkrDistanceType
.L0805427C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08054286:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewEfxFenrirBG2_B
NewEfxFenrirBG2_B: @ 0x0805428C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L080542E4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080542E8 @ =ProcScr_EfxFenrirBG2
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L080542EC @ =FrameConf_EfxFireHITBG
	str r0, [r5, #0x48]
	ldr r0, .L080542F0 @ =TsaArray_EfxFireHITBG
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L080542F4 @ =ImgArray_EfxFireHITBG
	str r0, [r5, #0x54]
	ldr r0, .L080542F8 @ =Pal_EfxFenrirBG2_B
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L080542FC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805430A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08054300
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805430A
	.align 2, 0
.L080542E4: .4byte gEfxBgSemaphore
.L080542E8: .4byte ProcScr_EfxFenrirBG2
.L080542EC: .4byte FrameConf_EfxFireHITBG
.L080542F0: .4byte TsaArray_EfxFireHITBG
.L080542F4: .4byte ImgArray_EfxFireHITBG
.L080542F8: .4byte Pal_EfxFenrirBG2_B
.L080542FC: .4byte gEkrDistanceType
.L08054300:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805430A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxFenrirBG2_Loop
EfxFenrirBG2_Loop: @ 0x08054310
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08054398
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
	ldr r0, .L08054374 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080543B6
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne .L0805437C
	ldr r0, .L08054378 @ =gBg1Tm
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L0805438C
	.align 2, 0
.L08054374: .4byte gEkrDistanceType
.L08054378: .4byte gBg1Tm
.L0805437C:
	ldr r0, .L08054394 @ =gBg1Tm+0x3A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
.L0805438C:
	movs r0, #2
	bl EnableBgSync
	b .L080543B6
	.align 2, 0
.L08054394: .4byte gBg1Tm+0x3A
.L08054398:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L080543B6
	bl SpellFx_ClearBG1
	ldr r1, .L080543C0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L080543B6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080543C0: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxFenrirOBJ2
NewEfxFenrirOBJ2: @ 0x080543C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080543FC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054400 @ =ProcScr_EfxFenrirOBJ2
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, .L08054404 @ =Pal_EfxFenrirOBJ2
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08054408 @ =Img_EfxFenrirOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080543FC: .4byte gEfxBgSemaphore
.L08054400: .4byte ProcScr_EfxFenrirOBJ2
.L08054404: .4byte Pal_EfxFenrirOBJ2
.L08054408: .4byte Img_EfxFenrirOBJ

	thumb_func_start EfxFenrirOBJ2_Loop
EfxFenrirOBJ2_Loop: @ 0x0805440C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0805444C
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x44]
	bl NewEfxFenrirOBJ2Chiri
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L0805444C
	ldr r1, .L08054454 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805444C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054454: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxFenrirOBJ2Chiri
NewEfxFenrirOBJ2Chiri: @ 0x08054458
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L08054498 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805449C @ =ProcScr_EfxFenrirOBJ2Chiri
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, .L080544A0 @ =gFenrirSpriteAngles
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080544A4
	cmp r0, #1
	beq .L080544AC
	b .L080544B8
	.align 2, 0
.L08054498: .4byte gEfxBgSemaphore
.L0805449C: .4byte ProcScr_EfxFenrirOBJ2Chiri
.L080544A0: .4byte gFenrirSpriteAngles
.L080544A4:
	ldr r0, .L080544A8 @ =AnimScr_EfxFenrirOBJ2Chiri1
	b .L080544AE
	.align 2, 0
.L080544A8: .4byte AnimScr_EfxFenrirOBJ2Chiri1
.L080544AC:
	ldr r0, .L080544D4 @ =AnimScr_EfxFenrirOBJ2Chiri2
.L080544AE:
	movs r1, #0x78
	bl BasCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
.L080544B8:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080544D4: .4byte AnimScr_EfxFenrirOBJ2Chiri2

	thumb_func_start EfxFenrirOBJ2Chiri_Loop
EfxFenrirOBJ2Chiri_Loop: @ 0x080544D8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r2, #0x96
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, .L08054550 @ =gSinLut
	ldr r2, [r6, #0x44]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	muls r0, r1, r0
	asrs r3, r3, #0xc
	ldrh r1, [r6, #0x32]
	adds r3, r1, r3
	strh r3, [r5, #2]
	asrs r0, r0, #0xc
	ldrh r2, [r6, #0x3a]
	adds r0, r2, r0
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r6, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble .L08054546
	ldr r0, .L08054554 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl BasRemove
	adds r0, r6, #0
	bl Proc_Break
.L08054546:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054550: .4byte gSinLut
.L08054554: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimHeal
StartSpellAnimHeal: @ 0x08054558
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L0805457C @ =ProcScr_EfxLive
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805457C: .4byte ProcScr_EfxLive

	thumb_func_start EfxLive_Loop
EfxLive_Loop: @ 0x08054580
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080545B0
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L0805465C
.L080545B0:
	cmp r0, #0x34
	bne .L08054618
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBG_A
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBGCOL_A
	ldr r3, .L08054614 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L0805465C
	.align 2, 0
.L08054614: .4byte gDispIo
.L08054618:
	cmp r0, #0x37
	bne .L08054626
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L080546A0
.L08054626:
	cmp r0, #0x71
	bne .L08054668
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBG_B
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBGCOL_B
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	ldr r0, .L08054664 @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L0805465C:
	movs r3, #1
	bl PlaySFX
	b .L080546A0
	.align 2, 0
.L08054664: .4byte 0x0000010F
.L08054668:
	cmp r0, #0xa6
	bne .L08054674
	adds r0, r5, #0
	bl NewEfxHpBarLive
	b .L080546A0
.L08054674:
	cmp r0, #0xb5
	bne .L080546A0
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L0805469A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L0805469A:
	adds r0, r4, #0
	bl Proc_Break
.L080546A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSpellAnimMend
StartSpellAnimMend: @ 0x080546A8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L080546CC @ =ProcScr_EfxRelive
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080546CC: .4byte ProcScr_EfxRelive

	thumb_func_start EfxRelive_Loop
EfxRelive_Loop: @ 0x080546D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08054706
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L080547EE
.L08054706:
	cmp r0, #0x34
	bne .L0805476C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl NewEfxLiveBG_A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl NewEfxLiveBGCOL_A
	ldr r3, .L08054768 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L080547EE
	.align 2, 0
.L08054768: .4byte gDispIo
.L0805476C:
	cmp r0, #0x37
	bne .L0805477A
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L08054840
.L0805477A:
	cmp r0, #0x71
	bne .L0805478A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08054840
.L0805478A:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne .L08054800
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl NewEfxLiveBG_B
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl NewEfxLiveBGCOL_B
	ldr r3, .L080547F8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	ldr r0, .L080547FC @ =0x00000111
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L080547EE:
	movs r3, #1
	bl PlaySFX
	b .L08054840
	.align 2, 0
.L080547F8: .4byte gDispIo
.L080547FC: .4byte 0x00000111
.L08054800:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne .L08054810
	adds r0, r5, #0
	bl NewEfxHpBarLive
	b .L08054840
.L08054810:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne .L08054840
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L0805483A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L0805483A:
	adds r0, r4, #0
	bl Proc_Break
.L08054840:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSpellAnimRecover
StartSpellAnimRecover: @ 0x08054848
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L0805486C @ =ProcScr_EfxRecover
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805486C: .4byte ProcScr_EfxRecover

	thumb_func_start EfxRecover_Loop
EfxRecover_Loop: @ 0x08054870
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080548A6
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L0805498E
.L080548A6:
	cmp r0, #0x34
	bne .L0805490C
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl NewEfxLiveBG_A
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl NewEfxLiveBGCOL_A
	ldr r3, .L08054908 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	movs r0, #0x89
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L0805498E
	.align 2, 0
.L08054908: .4byte gDispIo
.L0805490C:
	cmp r0, #0x37
	bne .L0805491A
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L080549E0
.L0805491A:
	cmp r0, #0x71
	bne .L0805492A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L080549E0
.L0805492A:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne .L080549A0
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl NewEfxLiveBG_B
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl NewEfxLiveBGCOL_B
	ldr r3, .L08054998 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	ldr r0, .L0805499C @ =0x00000113
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L0805498E:
	movs r3, #1
	bl PlaySFX
	b .L080549E0
	.align 2, 0
.L08054998: .4byte gDispIo
.L0805499C: .4byte 0x00000113
.L080549A0:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne .L080549B0
	adds r0, r5, #0
	bl NewEfxHpBarLive
	b .L080549E0
.L080549B0:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne .L080549E0
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L080549DA
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L080549DA:
	adds r0, r4, #0
	bl Proc_Break
.L080549E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSpellAnimPhysic
StartSpellAnimPhysic: @ 0x080549E8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08054A0C @ =ProcScr_EfxReblow
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054A0C: .4byte ProcScr_EfxReblow

	thumb_func_start EfxReblow_Loop
EfxReblow_Loop: @ 0x08054A10
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08054A4E
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxReblowOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	b .L08054B3E
.L08054A4E:
	cmp r0, #0x34
	bne .L08054AB4
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBG_A
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBGCOL_A
	ldr r3, .L08054AB0 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08054B3E
	.align 2, 0
.L08054AB0: .4byte gDispIo
.L08054AB4:
	cmp r0, #0x37
	bne .L08054AC2
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L08054B90
.L08054AC2:
	cmp r0, #0x97
	bne .L08054ADA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl NewEfxReblowOBJ
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08054B90
.L08054ADA:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0xa1
	cmp r1, r0
	bne .L08054B50
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBG_B
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxLiveBGCOL_B
	ldr r3, .L08054B48 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl NewEfxLiveALPHA
	ldr r0, .L08054B4C @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L08054B3E:
	movs r3, #1
	bl PlaySFX
	b .L08054B90
	.align 2, 0
.L08054B48: .4byte gDispIo
.L08054B4C: .4byte 0x0000010F
.L08054B50:
	adds r0, r2, #0
	adds r0, #0xd3
	cmp r1, r0
	bne .L08054B60
	adds r0, r5, #0
	bl NewEfxHpBarLive
	b .L08054B90
.L08054B60:
	adds r0, r2, #0
	adds r0, #0xdd
	cmp r1, r0
	bne .L08054B90
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r5, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq .L08054B8A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
.L08054B8A:
	adds r0, r4, #0
	bl Proc_Break
.L08054B90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxLiveBG_A
NewEfxLiveBG_A: @ 0x08054B98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, .L08054BE0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054BE4 @ =ProcScr_EfxLiveBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq .L08054BF8
	cmp r6, #2
	bhi .L08054C4A
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08054BE8 @ =FrameArray3_EfxLiveBG
	str r0, [r5, #0x48]
	ldr r0, .L08054BEC @ =Tsa_Uncomp_EfxLiveBG_BA_L
	str r0, [r5, #0x4c]
	ldr r0, .L08054BF0 @ =Tsa_Uncomp_EfxLiveBG_BA_R
	str r0, [r5, #0x50]
	ldr r0, .L08054BF4 @ =Img_EfxLiveBG
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b .L08054C4A
	.align 2, 0
.L08054BE0: .4byte gEfxBgSemaphore
.L08054BE4: .4byte ProcScr_EfxLiveBG
.L08054BE8: .4byte FrameArray3_EfxLiveBG
.L08054BEC: .4byte Tsa_Uncomp_EfxLiveBG_BA_L
.L08054BF0: .4byte Tsa_Uncomp_EfxLiveBG_BA_R
.L08054BF4: .4byte Img_EfxLiveBG
.L08054BF8:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08054C30 @ =FrameArray1_EfxLiveBG
	str r0, [r5, #0x48]
	ldr r0, .L08054C34 @ =Tsa_Uncomp_EfxLiveBG_BB_L
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054C38 @ =Img_EfxHealCommon
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08054C3C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08054C4A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08054C40
	movs r0, #1
	movs r1, #0x18
	b .L08054C44
	.align 2, 0
.L08054C30: .4byte FrameArray1_EfxLiveBG
.L08054C34: .4byte Tsa_Uncomp_EfxLiveBG_BB_L
.L08054C38: .4byte Img_EfxHealCommon
.L08054C3C: .4byte gEkrDistanceType
.L08054C40:
	movs r0, #1
	movs r1, #0xe8
.L08054C44:
	movs r2, #0
	bl SetBgOffset
.L08054C4A:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NewEfxLiveBG_B
NewEfxLiveBG_B: @ 0x08054C54
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, .L08054C9C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054CA0 @ =ProcScr_EfxLiveBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq .L08054CB4
	cmp r6, #2
	bhi .L08054CFE
	ldr r0, .L08054CA4 @ =FrameArray4_EfxLiveBG
	str r0, [r5, #0x48]
	ldr r0, .L08054CA8 @ =Tsa_Uncomp_EfxLiveBG_BA_L
	str r0, [r5, #0x4c]
	ldr r0, .L08054CAC @ =Tsa_Uncomp_EfxLiveBG_BA_R
	str r0, [r5, #0x50]
	ldr r0, .L08054CB0 @ =Img_EfxLiveBG
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b .L08054CFE
	.align 2, 0
.L08054C9C: .4byte gEfxBgSemaphore
.L08054CA0: .4byte ProcScr_EfxLiveBG
.L08054CA4: .4byte FrameArray4_EfxLiveBG
.L08054CA8: .4byte Tsa_Uncomp_EfxLiveBG_BA_L
.L08054CAC: .4byte Tsa_Uncomp_EfxLiveBG_BA_R
.L08054CB0: .4byte Img_EfxLiveBG
.L08054CB4:
	ldr r0, .L08054CE4 @ =FrameArray2_EfxLiveBG
	str r0, [r5, #0x48]
	ldr r0, .L08054CE8 @ =Tsa_Uncomp_EfxLiveBG_BB_L
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054CEC @ =Img_EfxHealCommon
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08054CF0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08054CFE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08054CF4
	movs r0, #1
	movs r1, #0xe8
	b .L08054CF8
	.align 2, 0
.L08054CE4: .4byte FrameArray2_EfxLiveBG
.L08054CE8: .4byte Tsa_Uncomp_EfxLiveBG_BB_L
.L08054CEC: .4byte Img_EfxHealCommon
.L08054CF0: .4byte gEkrDistanceType
.L08054CF4:
	movs r0, #1
	movs r1, #0x18
.L08054CF8:
	movs r2, #0
	bl SetBgOffset
.L08054CFE:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EfxLiveBG_Loop
EfxLiveBG_Loop: @ 0x08054D08
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08054D3A
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl SpellFx_WriteBgMapUncomp
	b .L08054D6C
.L08054D3A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L08054D6C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08054D54
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
.L08054D54:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, .L08054D74 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08054D6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054D74: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxLiveBGCOL_A
NewEfxLiveBGCOL_A: @ 0x08054D78
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054DA0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054DA4 @ =ProcScr_EfxLiveBGCOL
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne .L08054DAC
	ldr r0, .L08054DA8 @ =FrameArray1_EfxLiveBGCOL
	b .L08054DBA
	.align 2, 0
.L08054DA0: .4byte gEfxBgSemaphore
.L08054DA4: .4byte ProcScr_EfxLiveBGCOL
.L08054DA8: .4byte FrameArray1_EfxLiveBGCOL
.L08054DAC:
	cmp r5, #1
	bne .L08054DB8
	ldr r0, .L08054DB4 @ =FrameArray3_EfxLiveBGCOL
	b .L08054DBA
	.align 2, 0
.L08054DB4: .4byte FrameArray3_EfxLiveBGCOL
.L08054DB8:
	ldr r0, .L08054DC4 @ =FrameArray4_EfxLiveBGCOL
.L08054DBA:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08054DCC
	ldr r0, .L08054DC8 @ =Pals1_EfxLiveBGCOL
	b .L08054DDA
	.align 2, 0
.L08054DC4: .4byte FrameArray4_EfxLiveBGCOL
.L08054DC8: .4byte Pals1_EfxLiveBGCOL
.L08054DCC:
	cmp r5, #1
	bne .L08054DD8
	ldr r0, .L08054DD4 @ =Pals2_EfxLiveBGCOL
	b .L08054DDA
	.align 2, 0
.L08054DD4: .4byte Pals2_EfxLiveBGCOL
.L08054DD8:
	ldr r0, .L08054DE4 @ =Pals3_EfxLiveBGCOL
.L08054DDA:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054DE4: .4byte Pals3_EfxLiveBGCOL

	thumb_func_start NewEfxLiveBGCOL_B
NewEfxLiveBGCOL_B: @ 0x08054DE8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08054E10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054E14 @ =ProcScr_EfxLiveBGCOL
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne .L08054E1C
	ldr r0, .L08054E18 @ =FrameArray2_EfxLiveBGCOL
	b .L08054E2A
	.align 2, 0
.L08054E10: .4byte gEfxBgSemaphore
.L08054E14: .4byte ProcScr_EfxLiveBGCOL
.L08054E18: .4byte FrameArray2_EfxLiveBGCOL
.L08054E1C:
	cmp r5, #1
	bne .L08054E28
	ldr r0, .L08054E24 @ =FrameArray3_EfxLiveBGCOL
	b .L08054E2A
	.align 2, 0
.L08054E24: .4byte FrameArray3_EfxLiveBGCOL
.L08054E28:
	ldr r0, .L08054E34 @ =FrameArray4_EfxLiveBGCOL
.L08054E2A:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08054E3C
	ldr r0, .L08054E38 @ =Pals1_EfxLiveBGCOL
	b .L08054E4A
	.align 2, 0
.L08054E34: .4byte FrameArray4_EfxLiveBGCOL
.L08054E38: .4byte Pals1_EfxLiveBGCOL
.L08054E3C:
	cmp r5, #1
	bne .L08054E48
	ldr r0, .L08054E44 @ =Pals2_EfxLiveBGCOL
	b .L08054E4A
	.align 2, 0
.L08054E44: .4byte Pals2_EfxLiveBGCOL
.L08054E48:
	ldr r0, .L08054E54 @ =Pals3_EfxLiveBGCOL
.L08054E4A:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054E54: .4byte Pals3_EfxLiveBGCOL

	thumb_func_start EfxLiveBGCOL_Loop
EfxLiveBGCOL_Loop: @ 0x08054E58
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08054E7E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08054E94
.L08054E7E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L08054E94
	ldr r1, .L08054E9C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08054E94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054E9C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxLiveALPHA
NewEfxLiveALPHA: @ 0x08054EA0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, .L08054ED4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054ED8 @ =ProcScr_EfxLiveALPHA
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054ED4: .4byte gEfxBgSemaphore
.L08054ED8: .4byte ProcScr_EfxLiveALPHA

	thumb_func_start EfxLiveALPHA_Delay
EfxLiveALPHA_Delay: @ 0x08054EDC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08054EF2
	adds r0, r1, #0
	bl Proc_Break
.L08054EF2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxLiveALPHA_Loop
EfxLiveALPHA_Loop: @ 0x08054EF8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble .L08054F20
	ldr r1, .L08054F1C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08054F7E
	.align 2, 0
.L08054F1C: .4byte gEfxBgSemaphore
.L08054F20:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08054F3C
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b .L08054F4C
.L08054F3C:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
.L08054F4C:
	bl Interpolate
	adds r5, r0, #0
	ldr r3, .L08054F88 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r5, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
.L08054F7E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054F88: .4byte gDispIo

	thumb_func_start NewEfxLiveOBJ
NewEfxLiveOBJ: @ 0x08054F8C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08054FD8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08054FDC @ =ProcScr_EfxLiveOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, .L08054FE0 @ =AnimScr_EfxLiveOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08054FE4 @ =Pal_EfxFimbulvetrOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08054FE8 @ =Img_EfxLiveOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054FD8: .4byte gEfxBgSemaphore
.L08054FDC: .4byte ProcScr_EfxLiveOBJ
.L08054FE0: .4byte AnimScr_EfxLiveOBJ
.L08054FE4: .4byte Pal_EfxFimbulvetrOBJ
.L08054FE8: .4byte Img_EfxLiveOBJ

	thumb_func_start NewEfxReserveOBJ
NewEfxReserveOBJ: @ 0x08054FEC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805503C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055040 @ =ProcScr_EfxReserveOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	movs r0, #0x34
	strh r0, [r4, #0x30]
	ldr r3, .L08055044 @ =AnimScr_EfxLiveOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055048 @ =Pal_EfxFimbulvetrOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805504C @ =Img_EfxLiveOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805503C: .4byte gEfxBgSemaphore
.L08055040: .4byte ProcScr_EfxReserveOBJ
.L08055044: .4byte AnimScr_EfxLiveOBJ
.L08055048: .4byte Pal_EfxFimbulvetrOBJ
.L0805504C: .4byte Img_EfxLiveOBJ

	thumb_func_start EfxLiveOBJ_Loop
EfxLiveOBJ_Loop: @ 0x08055050
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08055078
	ldr r0, .L08055080 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08055078:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055080: .4byte gEfxBgSemaphore

	thumb_func_start EfxReserveOBJ_Loop1
EfxReserveOBJ_Loop1: @ 0x08055084
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r5, [r2, #0x2e]
	lsls r1, r5, #0x10
	cmp r0, r1
	bne .L080550AC
	ldr r0, .L080550B4 @ =AnimScr_EfxReserveOBJ
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	strh r4, [r3, #6]
	strh r4, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
.L080550AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080550B4: .4byte AnimScr_EfxReserveOBJ

	thumb_func_start EfxReserveOBJ_Loop2
EfxReserveOBJ_Loop2: @ 0x080550B8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080550E0
	ldr r0, .L080550E8 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L080550E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080550E8: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxReblowOBJ
NewEfxReblowOBJ: @ 0x080550EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L0805511C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055120 @ =ProcScr_EfxReblowOBJ
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne .L08055124
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b .L0805512A
	.align 2, 0
.L0805511C: .4byte gEfxBgSemaphore
.L08055120: .4byte ProcScr_EfxReblowOBJ
.L08055124:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
.L0805512A:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxReblowOBJ_Loop1
EfxReblowOBJ_Loop1: @ 0x08055134
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080551F2
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805519A
	ldr r0, .L0805517C @ =AnimScr_EfxReblowOBJ_L_A
	mov r8, r0
	ldr r7, .L08055180 @ =AnimScr_EfxReblowOBJ_R_A
	ldr r0, .L08055184 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08055188
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x88
	cmp r0, #0
	bne .L08055196
	movs r5, #0x68
	b .L08055196
	.align 2, 0
.L0805517C: .4byte AnimScr_EfxReblowOBJ_L_A
.L08055180: .4byte AnimScr_EfxReblowOBJ_R_A
.L08055184: .4byte gEkrDistanceType
.L08055188:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x70
	cmp r0, #0
	bne .L08055196
	movs r5, #0x80
.L08055196:
	movs r6, #0x4e
	b .L080551D8
.L0805519A:
	ldr r2, .L080551BC @ =AnimScr_EfxReblowOBJ_L_B
	mov r8, r2
	ldr r7, .L080551C0 @ =AnimScr_EfxReblowOBJ_R_B
	ldr r0, .L080551C4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080551C8
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x4c
	cmp r0, #0
	bne .L080551D6
	movs r5, #0xa4
	b .L080551D6
	.align 2, 0
.L080551BC: .4byte AnimScr_EfxReblowOBJ_L_B
.L080551C0: .4byte AnimScr_EfxReblowOBJ_R_B
.L080551C4: .4byte gEkrDistanceType
.L080551C8:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x64
	cmp r0, #0
	bne .L080551D6
	movs r5, #0x8c
.L080551D6:
	movs r6, #0x40
.L080551D8:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl Proc_Break
.L080551F2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxReblowOBJ_Loop2
EfxReblowOBJ_Loop2: @ 0x08055200
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08055228
	ldr r0, .L08055230 @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08055228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055230: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimFortify
StartSpellAnimFortify: @ 0x08055234
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08055260 @ =ProcScr_EfxReserve
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055260: .4byte ProcScr_EfxReserve

	thumb_func_start StartSpellAnimLatona
StartSpellAnimLatona: @ 0x08055264
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08055290 @ =ProcScr_EfxReserve
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055290: .4byte ProcScr_EfxReserve

	thumb_func_start EfxReserve_Loop
EfxReserve_Loop: @ 0x08055294
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne .L080552C2
	ldr r0, [r4, #0x5c]
	bl NewEfxReserveOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf3
	movs r3, #1
	bl PlaySFX
	b .L08055358
.L080552C2:
	cmp r1, #0x34
	bne .L080552DA
	ldr r0, [r4, #0x5c]
	bl NewEfxReserveBG
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl NewEfxReserveBGCOL
	b .L08055358
.L080552DA:
	cmp r1, #0xb7
	bne .L08055344
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	bl NewEfxReserveBG2
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl NewEfxReserveBGCOL2
	ldr r3, .L08055340 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl NewEfxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl NewEfxLiveALPHA
	b .L08055358
	.align 2, 0
.L08055340: .4byte gDispIo
.L08055344:
	ldr r0, .L08055360 @ =0x000001C5
	cmp r1, r0
	bne .L08055358
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L08055358:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055360: .4byte 0x000001C5

	thumb_func_start NewEfxReserveBG
NewEfxReserveBG: @ 0x08055364
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080553A0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080553A4 @ =ProcScr_EfxReserveBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080553A8 @ =FrameArray_EfxReserveBG
	str r1, [r0, #0x48]
	ldr r1, .L080553AC @ =TsaArray_EfxReserveBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L080553B0 @ =Img_EfxHealCommon
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080553A0: .4byte gEfxBgSemaphore
.L080553A4: .4byte ProcScr_EfxReserveBG
.L080553A8: .4byte FrameArray_EfxReserveBG
.L080553AC: .4byte TsaArray_EfxReserveBG
.L080553B0: .4byte Img_EfxHealCommon

	thumb_func_start EfxReserveBG_Loop
EfxReserveBG_Loop: @ 0x080553B4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0805540C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl SpellFx_WriteBgMap
	ldr r0, .L08055404 @ =SfxArray_EfxReserveBG
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, .L08055408 @ =SfxLocArray_EfxReserveBG
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl PlaySFX
	b .L0805542A
	.align 2, 0
.L08055404: .4byte SfxArray_EfxReserveBG
.L08055408: .4byte SfxLocArray_EfxReserveBG
.L0805540C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L0805542A
	bl SpellFx_ClearBG1
	ldr r1, .L08055430 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0805542A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08055430: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxReserveBGCOL
NewEfxReserveBGCOL: @ 0x08055434
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08055460 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055464 @ =ProcScr_EfxReserveBGCOL
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L08055468 @ =FrameArray_EfxReserveBGCOL
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08055470
	ldr r0, .L0805546C @ =Pals1_EfxReserveBGCOL
	b .L08055472
	.align 2, 0
.L08055460: .4byte gEfxBgSemaphore
.L08055464: .4byte ProcScr_EfxReserveBGCOL
.L08055468: .4byte FrameArray_EfxReserveBGCOL
.L0805546C: .4byte Pals1_EfxReserveBGCOL
.L08055470:
	ldr r0, .L0805547C @ =Pals2_EfxReserveBGCOL
.L08055472:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805547C: .4byte Pals2_EfxReserveBGCOL

	thumb_func_start EfxReserveBGCOL_Loop
EfxReserveBGCOL_Loop: @ 0x08055480
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080554A6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080554BC
.L080554A6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080554BC
	ldr r1, .L080554C4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080554BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080554C4: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxReserveBG2
NewEfxReserveBG2: @ 0x080554C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0805555C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055560 @ =ProcScr_EfxReserveBG2
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08055564 @ =FrameArray_EfxReserveBG2
	str r1, [r0, #0x48]
	ldr r1, .L08055568 @ =TsaArray_EfxReserveBG2
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L0805556C @ =Img_EfxLiveBG
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	ldr r4, .L08055570 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl PutEfxTerrainToLowerLayer
	ldr r0, .L08055574 @ =0x0000F3FF
	ldrh r2, [r5, #8]
	ands r0, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08055578 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L0805557C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805555C: .4byte gEfxBgSemaphore
.L08055560: .4byte ProcScr_EfxReserveBG2
.L08055564: .4byte FrameArray_EfxReserveBG2
.L08055568: .4byte TsaArray_EfxReserveBG2
.L0805556C: .4byte Img_EfxLiveBG
.L08055570: .4byte gDispIo
.L08055574: .4byte 0x0000F3FF
.L08055578: .4byte 0x0000FFE0
.L0805557C: .4byte 0x0000E0FF

	thumb_func_start EfxReserveBG2_Loop
EfxReserveBG2_Loop: @ 0x08055580
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldr r6, [r4, #0x5c]
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080555BA
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r5, #0
	bl SpellFx_WriteBgMap
	b .L08055614
.L080555BA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L08055614
	bl SpellFx_ClearBG1
	ldr r1, .L0805561C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, .L08055620 @ =gDispIo
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
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r0, .L08055624 @ =0x0000F3FF
	ldrh r2, [r6, #8]
	ands r0, r2
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08055614:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805561C: .4byte gEfxBgSemaphore
.L08055620: .4byte gDispIo
.L08055624: .4byte 0x0000F3FF

	thumb_func_start NewEfxReserveBGCOL2
NewEfxReserveBGCOL2: @ 0x08055628
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08055654 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055658 @ =ProcScr_EfxReserveBGCOL2
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L0805565C @ =FrameArray_EfxReserveBGCOL2
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08055664
	ldr r0, .L08055660 @ =Pals1_EfxLiveBGCOL
	b .L08055666
	.align 2, 0
.L08055654: .4byte gEfxBgSemaphore
.L08055658: .4byte ProcScr_EfxReserveBGCOL2
.L0805565C: .4byte FrameArray_EfxReserveBGCOL2
.L08055660: .4byte Pals1_EfxLiveBGCOL
.L08055664:
	ldr r0, .L08055670 @ =Pals2_EfxReserveBGCOL2
.L08055666:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055670: .4byte Pals2_EfxReserveBGCOL2

	thumb_func_start EfxReserveBGCOL2_Loop
EfxReserveBGCOL2_Loop: @ 0x08055674
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805569A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080556B0
.L0805569A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080556B0
	ldr r1, .L080556B8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080556B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080556B8: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimRestore
StartSpellAnimRestore: @ 0x080556BC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L080556F4 @ =ProcScr_EfxRest
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080556F4: .4byte ProcScr_EfxRest

	thumb_func_start EfxRest_Loop
EfxRest_Loop: @ 0x080556F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805572E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0805572E:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L080557A4
	adds r0, r6, #0
	bl NewEfxRestBG
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xfd
	movs r3, #1
	bl PlaySFX
	b .L08055810
.L080557A4:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L080557B4
	adds r0, r6, #0
	bl NewEfxRestOBJ
	b .L08055810
.L080557B4:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne .L080557CA
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b .L08055810
.L080557CA:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne .L080557F0
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl StartBattleAnimStatusChgHitEffects
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitEfxDebuff
	b .L08055810
.L080557F0:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08055810
	movs r0, #2
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L08055810:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxRestBG
NewEfxRestBG: @ 0x0805581C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08055858 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805585C @ =ProcScr_EfxRestBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08055860 @ =FrameArray_EfxRestBG
	str r1, [r0, #0x48]
	ldr r1, .L08055864 @ =TsaArray_EfxRestBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08055868 @ =ImgArray_EfxRestBG
	str r1, [r0, #0x54]
	ldr r0, .L0805586C @ =Pal_EfxRestBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055858: .4byte gEfxBgSemaphore
.L0805585C: .4byte ProcScr_EfxRestBG
.L08055860: .4byte FrameArray_EfxRestBG
.L08055864: .4byte TsaArray_EfxRestBG
.L08055868: .4byte ImgArray_EfxRestBG
.L0805586C: .4byte Pal_EfxRestBG

	thumb_func_start EfxRestBG_Loop
EfxRestBG_Loop: @ 0x08055870
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080558AC
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L080558CA
.L080558AC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L080558CA
	bl SpellFx_ClearBG1
	ldr r1, .L080558D0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L080558CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080558D0: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxRestOBJ
NewEfxRestOBJ: @ 0x080558D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08055910 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055914 @ =ProcScr_EfxRestOBJ
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, .L08055918 @ =AnimScr_EfxRestOBJ
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805591C
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L08055920
	.align 2, 0
.L08055910: .4byte gEfxBgSemaphore
.L08055914: .4byte ProcScr_EfxRestOBJ
.L08055918: .4byte AnimScr_EfxRestOBJ
.L0805591C:
	ldrh r0, [r6, #2]
	adds r0, #8
.L08055920:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, .L08055944 @ =Pal_EfxRestOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055948 @ =Img_EfxHammarneOBJ
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08055944: .4byte Pal_EfxRestOBJ
.L08055948: .4byte Img_EfxHammarneOBJ

	thumb_func_start EfxRestOBJ_Loop
EfxRestOBJ_Loop: @ 0x0805594C
	ldr r1, .L08055958 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055958: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimSilence
StartSpellAnimSilence: @ 0x0805595C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08055994 @ =ProcScr_EfxSilence
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055994: .4byte ProcScr_EfxSilence

	thumb_func_start EfxSilence_Loop
EfxSilence_Loop: @ 0x08055998
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080559DC
	ldr r0, [r4, #0x5c]
	bl NewEfxSilenceOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xfa
	movs r3, #1
	bl PlaySFX
.L080559DC:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x29
	bne .L080559EE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08055A92
.L080559EE:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x44
	cmp r1, r0
	bne .L08055A22
	ldr r0, [r4, #0x5c]
	bl NewEfxSilenceBG
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xfb
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0x42
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	b .L08055A92
.L08055A22:
	adds r0, r6, #0
	adds r0, #0x86
	cmp r1, r0
	bne .L08055A74
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r0, #0xfc
	movs r3, #1
	bl PlaySFX
	bl EfxStopBGM1
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	ldrb r0, [r6]
	cmp r0, #0
	bne .L08055A92
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L08055A92
	adds r0, r5, #0
	movs r1, #3
	bl SetUnitEfxDebuff
	b .L08055A92
.L08055A74:
	adds r0, r6, #0
	adds r0, #0x9e
	cmp r1, r0
	bne .L08055A92
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L08055A92:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxSilenceBG
NewEfxSilenceBG: @ 0x08055AA0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08055B00 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055B04 @ =ProcScr_EfxSilenceBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08055B08 @ =FrameArray_EfxSilenceBG
	str r0, [r5, #0x48]
	ldr r0, .L08055B0C @ =TsaArray_EfxSilenceBG
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08055B10 @ =Pal_EfxSilenceBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08055B14 @ =Img_EfxSilenceBG
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08055B18 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08055B26
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08055B1C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08055B26
	.align 2, 0
.L08055B00: .4byte gEfxBgSemaphore
.L08055B04: .4byte ProcScr_EfxSilenceBG
.L08055B08: .4byte FrameArray_EfxSilenceBG
.L08055B0C: .4byte TsaArray_EfxSilenceBG
.L08055B10: .4byte Pal_EfxSilenceBG
.L08055B14: .4byte Img_EfxSilenceBG
.L08055B18: .4byte gEkrDistanceType
.L08055B1C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08055B26:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxSilenceBG_Loop
EfxSilenceBG_Loop: @ 0x08055B2C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08055B5A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08055B78
.L08055B5A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08055B78
	bl SpellFx_ClearBG1
	ldr r1, .L08055B80 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08055B78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055B80: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxSilenceOBJ
NewEfxSilenceOBJ: @ 0x08055B84
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055BC8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055BCC @ =ProcScr_EfxSilenceOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055BD0 @ =AnimScr_EfxSilenceOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055BD4 @ =Pal_EfxSilenceBG
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055BD8 @ =Img_EfxSilenceOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055BC8: .4byte gEfxBgSemaphore
.L08055BCC: .4byte ProcScr_EfxSilenceOBJ
.L08055BD0: .4byte AnimScr_EfxSilenceOBJ
.L08055BD4: .4byte Pal_EfxSilenceBG
.L08055BD8: .4byte Img_EfxSilenceOBJ

	thumb_func_start EfxSilenceOBJ_OnEnd
EfxSilenceOBJ_OnEnd: @ 0x08055BDC
	push {lr}
	ldr r0, [r0, #0x60]
	bl BasRemove
	ldr r1, .L08055BF0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08055BF0: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimSleep
StartSpellAnimSleep: @ 0x08055BF4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08055C2C @ =ProcScr_EfxSleep
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055C2C: .4byte ProcScr_EfxSleep

	thumb_func_start EfxSleep_Loop
EfxSleep_Loop: @ 0x08055C30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08055C74
	ldr r0, [r4, #0x5c]
	bl NewEfxSleepOBJ
	ldr r0, .L08055CC8 @ =0x0000011B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
.L08055C74:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x64
	bne .L08055C84
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08055C84:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #0
	adds r0, #0x82
	cmp r1, r0
	bne .L08055CCC
	adds r0, r5, #0
	bl NewEfxSleepOBJ2
	adds r0, r5, #0
	bl NewEfxSleepSE
	ldr r0, [r4, #0x5c]
	bl NewEfxSleepBG
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xe6
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	b .L08055D22
	.align 2, 0
.L08055CC8: .4byte 0x0000011B
.L08055CCC:
	movs r3, #0xa5
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne .L08055D02
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08055D22
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L08055D22
	adds r0, r5, #0
	movs r1, #2
	bl SetUnitEfxDebuff
	b .L08055D22
.L08055D02:
	movs r2, #0xb9
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne .L08055D22
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L08055D22:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxSleepBG
NewEfxSleepBG: @ 0x08055D30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08055D90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055D94 @ =ProcScr_EfxSleepBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08055D98 @ =FrameArray_EfxSleepBG
	str r0, [r5, #0x48]
	ldr r0, .L08055D9C @ =TsaArray_EfxSleepBG
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08055DA0 @ =Pal_EfxSleepBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08055DA4 @ =Img_EfxSleepBG
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08055DA8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08055DB6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08055DAC
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08055DB6
	.align 2, 0
.L08055D90: .4byte gEfxBgSemaphore
.L08055D94: .4byte ProcScr_EfxSleepBG
.L08055D98: .4byte FrameArray_EfxSleepBG
.L08055D9C: .4byte TsaArray_EfxSleepBG
.L08055DA0: .4byte Pal_EfxSleepBG
.L08055DA4: .4byte Img_EfxSleepBG
.L08055DA8: .4byte gEkrDistanceType
.L08055DAC:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08055DB6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxSleepBG_Loop
EfxSleepBG_Loop: @ 0x08055DBC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08055DEA
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08055E08
.L08055DEA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08055E08
	bl SpellFx_ClearBG1
	ldr r1, .L08055E10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08055E08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055E10: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxSleepOBJ
NewEfxSleepOBJ: @ 0x08055E14
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055E58 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055E5C @ =ProcScr_EfxSleepOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055E60 @ =AnimScr_EfxSleepOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055E64 @ =Pal_EfxRestOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055E68 @ =Img_EfxHammarneOBJ
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055E58: .4byte gEfxBgSemaphore
.L08055E5C: .4byte ProcScr_EfxSleepOBJ
.L08055E60: .4byte AnimScr_EfxSleepOBJ
.L08055E64: .4byte Pal_EfxRestOBJ
.L08055E68: .4byte Img_EfxHammarneOBJ

	thumb_func_start NewEfxSleepOBJ2
NewEfxSleepOBJ2: @ 0x08055E6C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055EB4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055EB8 @ =ProcScr_EfxSleepOBJ2
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055EBC @ =AnimScr_EfxSleepOBJ2
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r4, #0x60]
	ldrh r0, [r5, #4]
	subs r0, #8
	strh r0, [r5, #4]
	bl GetEkrDragonStateTypeIdunn
	cmp r0, #0
	beq .L08055EAC
	ldrh r0, [r5, #2]
	subs r0, #0x10
	strh r0, [r5, #2]
.L08055EAC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055EB4: .4byte gEfxBgSemaphore
.L08055EB8: .4byte ProcScr_EfxSleepOBJ2
.L08055EBC: .4byte AnimScr_EfxSleepOBJ2

	thumb_func_start EfxSleepOBJ_OnEnd
EfxSleepOBJ_OnEnd: @ 0x08055EC0
	ldr r1, .L08055ECC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055ECC: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxSleepSE
NewEfxSleepSE: @ 0x08055ED0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08055EEC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055EF0 @ =ProcScr_EfxSleepSE
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055EEC: .4byte gEfxBgSemaphore
.L08055EF0: .4byte ProcScr_EfxSleepSE

	thumb_func_start EfxSleepSE_PlaySE
EfxSleepSE_PlaySE: @ 0x08055EF4
	push {r4, lr}
	movs r3, #0x8e
	lsls r3, r3, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r0, #0x5c]
	movs r4, #2
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	movs r3, #1
	bl PlaySFX
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxSleepSE_OnEnd
EfxSleepSE_OnEnd: @ 0x08055F14
	ldr r1, .L08055F20 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055F20: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimHammerne
StartSpellAnimHammerne: @ 0x08055F24
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08055F5C @ =ProcScr_EfxHammarne
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055F5C: .4byte ProcScr_EfxHammarne

	thumb_func_start EfxHammarne_Loop
EfxHammarne_Loop: @ 0x08055F60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08055F96
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08055F96:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L08056010
	adds r0, r6, #0
	bl NewEfxHammarneBG
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, .L0805600C @ =0x00000103
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl PlaySFX
	b .L08056074
	.align 2, 0
.L0805600C: .4byte 0x00000103
.L08056010:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L08056020
	adds r0, r6, #0
	bl NewEfxHammarneOBJ
	b .L08056074
.L08056020:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne .L08056036
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b .L08056074
.L08056036:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne .L08056054
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl StartBattleAnimStatusChgHitEffects
	b .L08056074
.L08056054:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08056074
	movs r0, #2
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L08056074:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxHammarneBG
NewEfxHammarneBG: @ 0x08056080
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080560BC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080560C0 @ =ProcScr_EfxHammarneBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080560C4 @ =FrameArray_EfxHammarneBG
	str r1, [r0, #0x48]
	ldr r1, .L080560C8 @ =TsaArray_EfxHammarneBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080560CC @ =ImgArray_EfxHammarneBG
	str r1, [r0, #0x54]
	ldr r0, .L080560D0 @ =Pal_EfxHammarneBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080560BC: .4byte gEfxBgSemaphore
.L080560C0: .4byte ProcScr_EfxHammarneBG
.L080560C4: .4byte FrameArray_EfxHammarneBG
.L080560C8: .4byte TsaArray_EfxHammarneBG
.L080560CC: .4byte ImgArray_EfxHammarneBG
.L080560D0: .4byte Pal_EfxHammarneBG

	thumb_func_start EfxHammarneBG_Loop
EfxHammarneBG_Loop: @ 0x080560D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08056110
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0805612E
.L08056110:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne .L0805612E
	bl SpellFx_ClearBG1
	ldr r1, .L08056134 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0805612E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056134: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxHammarneOBJ
NewEfxHammarneOBJ: @ 0x08056138
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805617C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056180 @ =ProcScr_EfxHammarneOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08056184 @ =AnimScr_EfxHammarneOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08056188 @ =Pal_EfxHammarneOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805618C @ =Img_EfxHammarneOBJ
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805617C: .4byte gEfxBgSemaphore
.L08056180: .4byte ProcScr_EfxHammarneOBJ
.L08056184: .4byte AnimScr_EfxHammarneOBJ
.L08056188: .4byte Pal_EfxHammarneOBJ
.L0805618C: .4byte Img_EfxHammarneOBJ

	thumb_func_start EfxHammarneOBJ_OnEnd
EfxHammarneOBJ_OnEnd: @ 0x08056190
	ldr r1, .L0805619C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805619C: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimBerserk
StartSpellAnimBerserk: @ 0x080561A0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L080561D8 @ =ProcScr_EfxBerserk
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080561D8: .4byte ProcScr_EfxBerserk

	thumb_func_start EfxBerserk_Loop
EfxBerserk_Loop: @ 0x080561DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805620A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L0805620A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805625C
	adds r0, r5, #0
	bl NewEfxBerserkOBJ
	adds r0, r5, #0
	movs r1, #0x4a
	bl NewEfxBerserkBG
	adds r0, r5, #0
	movs r1, #0x4a
	bl NewEfxBerserkCLONE
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl NewEfxRestRST
	ldr r2, .L08056258 @ =EfxRestWINH_DefaultHblank
	adds r0, r5, #0
	movs r1, #0x4a
	bl NewEfxRestWINH_
	movs r1, #2
	ldrsh r2, [r5, r1]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl PlaySFX
	b .L080562B6
	.align 2, 0
.L08056258: .4byte EfxRestWINH_DefaultHblank
.L0805625C:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne .L08056298
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080562B6
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne .L080562B6
	adds r0, r5, #0
	movs r1, #4
	bl SetUnitEfxDebuff
	b .L080562B6
.L08056298:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne .L080562B6
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L080562B6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxBerserkBG
NewEfxBerserkBG: @ 0x080562C0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L080563B8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080563BC @ =ProcScr_EfxBerserkBG
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, .L080563C0 @ =Pal_EfxBerserkBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L080563C4 @ =Img_EfxClasschgFIN
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L080563C8 @ =Tsa_EfxBerserkBG
	ldr r1, .L080563CC @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L080563D0 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r4, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
	mov r6, ip
	adds r6, #0x37
	movs r3, #0x20
	ldrb r1, [r6]
	orrs r1, r3
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r7, ip
	strb r0, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6]
	ldr r0, .L080563D4 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, .L080563D8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, ip
	adds r0, #0x3d
	ldrb r7, [r0]
	orrs r3, r7
	strb r3, [r0]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, .L080563DC @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080563B8: .4byte gEfxBgSemaphore
.L080563BC: .4byte ProcScr_EfxBerserkBG
.L080563C0: .4byte Pal_EfxBerserkBG
.L080563C4: .4byte Img_EfxClasschgFIN
.L080563C8: .4byte Tsa_EfxBerserkBG
.L080563CC: .4byte gBg1Tm
.L080563D0: .4byte gDispIo
.L080563D4: .4byte 0x0000FFE0
.L080563D8: .4byte 0x0000E0FF
.L080563DC: .4byte 0x0000F3FF

	thumb_func_start EfxBerserkBG_Loop
EfxBerserkBG_Loop: @ 0x080563E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, .L08056434 @ =gDispIo
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0805642C
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r0, [r5, #0x1c]
	ldr r1, .L08056438 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, .L0805643C @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	ldr r1, .L08056440 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805642C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056434: .4byte gDispIo
.L08056438: .4byte 0xFFFFF7FF
.L0805643C: .4byte 0x0000F3FF
.L08056440: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxBerserkCLONE
NewEfxBerserkCLONE: @ 0x08056444
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08056468 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805646C @ =ProcScr_EfxBerserkCLONE
	movs r1, #4
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056468: .4byte gEfxBgSemaphore
.L0805646C: .4byte ProcScr_EfxBerserkCLONE

	thumb_func_start EfxBerserkCLONE_Loop
EfxBerserkCLONE_Loop: @ 0x08056470
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, .L080564CC @ =0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, .L080564D0 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl BasPutOam
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080564C2
	adds r0, r4, #0
	bl Proc_Break
.L080564C2:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080564CC: .4byte 0xFFFFF7FF
.L080564D0: .4byte 0x0000F3FF

	thumb_func_start EfxBerserkCLONE_OnEnd
EfxBerserkCLONE_OnEnd: @ 0x080564D4
	ldr r1, .L080564E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L080564E0: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxBerserkOBJ
NewEfxBerserkOBJ: @ 0x080564E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805652C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056530 @ =ProcScr_EfxBerserkOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, .L08056534 @ =AnimScr_Common
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, .L08056538 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805652C: .4byte gEfxBgSemaphore
.L08056530: .4byte ProcScr_EfxBerserkOBJ
.L08056534: .4byte AnimScr_Common
.L08056538: .4byte 0x0000F3FF

	thumb_func_start EfxBerserkOBJ_OnEnd
EfxBerserkOBJ_OnEnd: @ 0x0805653C
	push {lr}
	ldr r2, .L08056550 @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BasRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08056550: .4byte gEfxBgSemaphore

	thumb_func_start EfxBerserkOBJ_Loop1
EfxBerserkOBJ_Loop1: @ 0x08056554
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056584 @ =AnimScr_EfxBerserk1
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056588 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805658C @ =Img_EfxBerserk1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056584: .4byte AnimScr_EfxBerserk1
.L08056588: .4byte Pal_EfxBerserk
.L0805658C: .4byte Img_EfxBerserk1

	thumb_func_start EfxBerserkOBJ_Loop3
EfxBerserkOBJ_Loop3: @ 0x08056590
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080565C0 @ =AnimScr_EfxBerserk2
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080565C4 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080565C8 @ =Img_EfxBerserk1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080565C0: .4byte AnimScr_EfxBerserk2
.L080565C4: .4byte Pal_EfxBerserk
.L080565C8: .4byte Img_EfxBerserk1

	thumb_func_start EfxBerserkOBJ_Loop5
EfxBerserkOBJ_Loop5: @ 0x080565CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080565FC @ =AnimScr_EfxBerserk3
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056600 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056604 @ =Img_EfxBerserk1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080565FC: .4byte AnimScr_EfxBerserk3
.L08056600: .4byte Pal_EfxBerserk
.L08056604: .4byte Img_EfxBerserk1

	thumb_func_start EfxBerserkOBJ_Loop7
EfxBerserkOBJ_Loop7: @ 0x08056608
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056638 @ =AnimScr_EfxBerserk4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805663C @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056640 @ =Img_EfxBerserk1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056638: .4byte AnimScr_EfxBerserk4
.L0805663C: .4byte Pal_EfxBerserk
.L08056640: .4byte Img_EfxBerserk1

	thumb_func_start EfxBerserkOBJ_Loop9
EfxBerserkOBJ_Loop9: @ 0x08056644
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056674 @ =AnimScr_EfxBerserk5
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056678 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805667C @ =Img_EfxBerserk1
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056674: .4byte AnimScr_EfxBerserk5
.L08056678: .4byte Pal_EfxBerserk
.L0805667C: .4byte Img_EfxBerserk1

	thumb_func_start EfxBerserkOBJ_Loop2
EfxBerserkOBJ_Loop2: @ 0x08056680
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080566B0 @ =AnimScr_EfxBerserk6
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080566B4 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080566B8 @ =Img_EfxBerserk2
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080566B0: .4byte AnimScr_EfxBerserk6
.L080566B4: .4byte Pal_EfxBerserk
.L080566B8: .4byte Img_EfxBerserk2

	thumb_func_start EfxBerserkOBJ_Loop4
EfxBerserkOBJ_Loop4: @ 0x080566BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080566EC @ =AnimScr_EfxBerserk7
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080566F0 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080566F4 @ =Img_EfxBerserk2
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080566EC: .4byte AnimScr_EfxBerserk7
.L080566F0: .4byte Pal_EfxBerserk
.L080566F4: .4byte Img_EfxBerserk2

	thumb_func_start EfxBerserkOBJ_Loop6
EfxBerserkOBJ_Loop6: @ 0x080566F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056728 @ =AnimScr_EfxBerserk8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805672C @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056730 @ =Img_EfxBerserk2
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056728: .4byte AnimScr_EfxBerserk8
.L0805672C: .4byte Pal_EfxBerserk
.L08056730: .4byte Img_EfxBerserk2

	thumb_func_start EfxBerserkOBJ_Loop8
EfxBerserkOBJ_Loop8: @ 0x08056734
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056764 @ =AnimScr_EfxBerserk9
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056768 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805676C @ =Img_EfxBerserk2
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056764: .4byte AnimScr_EfxBerserk9
.L08056768: .4byte Pal_EfxBerserk
.L0805676C: .4byte Img_EfxBerserk2

	thumb_func_start EfxBerserkOBJ_Loop10
EfxBerserkOBJ_Loop10: @ 0x08056770
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080567A0 @ =AnimScr_EfxBerserk10
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080567A4 @ =Pal_EfxBerserk
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080567A8 @ =Img_EfxBerserk2
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080567A0: .4byte AnimScr_EfxBerserk10
.L080567A4: .4byte Pal_EfxBerserk
.L080567A8: .4byte Img_EfxBerserk2

	thumb_func_start StartSpellAnimBarrier
StartSpellAnimBarrier: @ 0x080567AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L080567E4 @ =ProcScr_EfxMshield
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080567E4: .4byte ProcScr_EfxMshield

	thumb_func_start EfxMshield_Loop
EfxMshield_Loop: @ 0x080567E8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08056814
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08056814:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L08056844
	ldr r0, [r5, #0x5c]
	bl NewEfxMshieldBG
	adds r0, r4, #0
	bl NewEfxMshieldOBJ
	adds r0, r4, #0
	bl NewEfxMshieldOBJ2
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl PlaySFX
	b .L080568AE
.L08056844:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq .L08056854
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L0805685C
.L08056854:
	adds r0, r4, #0
	bl NewEfxMshieldOBJ2
	b .L080568AE
.L0805685C:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne .L08056872
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b .L080568AE
.L08056872:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne .L08056890
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartBattleAnimStatusChgHitEffects
	b .L080568AE
.L08056890:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne .L080568AE
	movs r0, #2
	ldrh r3, [r4, #0x10]
	orrs r0, r3
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r5, #0
	bl Proc_Break
.L080568AE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxMshieldBG
NewEfxMshieldBG: @ 0x080568B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080568F8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080568FC @ =ProcScr_EfxMshieldBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08056900 @ =FrameArray_EfxMshieldBG
	str r1, [r0, #0x48]
	ldr r1, .L08056904 @ =TsaArray_EfxMshieldBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08056908 @ =Pal_EfxMshieldBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0805690C @ =Img_EfxMshieldBG
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080568F8: .4byte gEfxBgSemaphore
.L080568FC: .4byte ProcScr_EfxMshieldBG
.L08056900: .4byte FrameArray_EfxMshieldBG
.L08056904: .4byte TsaArray_EfxMshieldBG
.L08056908: .4byte Pal_EfxMshieldBG
.L0805690C: .4byte Img_EfxMshieldBG

	thumb_func_start EfxMshieldBG_Loop
EfxMshieldBG_Loop: @ 0x08056910
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L0805693E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0805695C
.L0805693E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L0805695C
	bl SpellFx_ClearBG1
	ldr r1, .L08056964 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L0805695C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056964: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxMshieldOBJ
NewEfxMshieldOBJ: @ 0x08056968
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080569AC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080569B0 @ =ProcScr_EfxMshieldOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L080569B4 @ =AnimScr_EfxMshieldOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L080569B8 @ =Pal_EfxMshieldOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080569BC @ =Img_EfxHammarneOBJ
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080569AC: .4byte gEfxBgSemaphore
.L080569B0: .4byte ProcScr_EfxMshieldOBJ
.L080569B4: .4byte AnimScr_EfxMshieldOBJ
.L080569B8: .4byte Pal_EfxMshieldOBJ
.L080569BC: .4byte Img_EfxHammarneOBJ

	thumb_func_start NewEfxMshieldOBJ2
NewEfxMshieldOBJ2: @ 0x080569C0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080569F4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080569F8 @ =ProcScr_EfxMshieldOBJ2
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L080569FC @ =AnimScr_EfxMshieldOBJ2
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080569F4: .4byte gEfxBgSemaphore
.L080569F8: .4byte ProcScr_EfxMshieldOBJ2
.L080569FC: .4byte AnimScr_EfxMshieldOBJ2

	thumb_func_start EfxMshieldOBJ_OnEnd
EfxMshieldOBJ_OnEnd: @ 0x08056A00
	push {lr}
	ldr r0, [r0, #0x60]
	bl BasRemove
	ldr r1, .L08056A14 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08056A14: .4byte gEfxBgSemaphore
