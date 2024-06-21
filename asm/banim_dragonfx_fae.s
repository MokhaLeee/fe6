	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonFae
NewEkrDragonFae: @ 0x080599D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetAnimPosition
	adds r4, r0, #0
	ldr r0, .L08059A10 @ =ProcScr_EkrDragonFae
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	ldr r0, .L08059A14 @ =EkrDragonProcs
	lsls r4, r4, #2
	adds r4, r4, r0
	str r6, [r4]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r1, .L08059A18 @ =gEkrDragonState
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
	str r5, [r6, #0x5c]
	adds r0, r5, #0
	bl CheckEkrDragonStateTypeFae
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08059A1C
	movs r0, #0x3c
	b .L08059A1E
	.align 2, 0
.L08059A10: .4byte ProcScr_EkrDragonFae
.L08059A14: .4byte EkrDragonProcs
.L08059A18: .4byte gEkrDragonState
.L08059A1C:
	movs r0, #0
.L08059A1E:
	strh r0, [r6, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08059A28
func_fe6_08059A28: @ 0x08059A28
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3d
	bne .L08059A40
	adds r0, r1, #0
	bl Proc_Break
.L08059A40:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08059A44
func_fe6_08059A44: @ 0x08059A44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, .L08059AA0 @ =0x0203CD08
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, .L08059AA4 @ =0x086A0B68
	ldr r0, [r0, #0x1c]
	ldr r6, .L08059AA8 @ =gUnk_Banim_0201C77C
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	movs r1, #0xd0
	lsls r1, r1, #1
	cmp r0, #0
	bne .L08059A74
	subs r1, #0x20
.L08059A74:
	lsls r0, r4, #5
	adds r0, r0, r6
	lsls r1, r1, #1
	ldr r2, .L08059AAC @ =gPal
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r5, #0x5c]
	bl CheckEkrDragonStateTypeFae
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08059AB0
	adds r0, r5, #0
	bl Proc_Break
	b .L08059ACA
	.align 2, 0
.L08059AA0: .4byte 0x0203CD08
.L08059AA4: .4byte 0x086A0B68
.L08059AA8: .4byte gUnk_Banim_0201C77C
.L08059AAC: .4byte gPal
.L08059AB0:
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #0x5c]
	movs r1, #0x6b
	bl EkrPrepareBanimfx
	ldr r0, [r5, #0x5c]
	movs r1, #0
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r5, #0
	bl Proc_Break
.L08059ACA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08059AD0
func_fe6_08059AD0: @ 0x08059AD0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonStateTypeFae
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne .L08059B04
	ldr r0, [r4, #0x5c]
	movs r1, #0x5b
	bl EkrPrepareBanimfx
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08059B00 @ =gEkrDragonIntroDone
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b .L08059B6E
	.align 2, 0
.L08059B00: .4byte gEkrDragonIntroDone
.L08059B04:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1a
	bne .L08059B2A
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xdc
	bl EfxPlaySE
	ldr r0, [r4, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r0, #0xdc
	movs r2, #1
	bl M4aPlayWithPostionCtrl
.L08059B2A:
	ldr r0, [r4, #0x5c]
	ldr r1, [r0, #0x20]
	movs r0, #0x3f
	ldrb r1, [r1, #3]
	ands r0, r1
	cmp r0, #0
	bne .L08059B6E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xde
	bl EfxPlaySE
	ldr r0, [r4, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r0, #0xde
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	ldr r0, [r4, #0x5c]
	movs r1, #0x5b
	bl EkrPrepareBanimfx
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08059B74 @ =gEkrDragonIntroDone
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
.L08059B6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08059B74: .4byte gEkrDragonIntroDone

	thumb_func_start func_fe6_08059B78
func_fe6_08059B78: @ 0x08059B78
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08059BA4 @ =gEkrDragonState
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #2
	bne .L08059BDC
	ldr r0, [r5, #0x5c]
	bl CheckEkrDragonStateTypeFae
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08059BA8
	adds r0, r5, #0
	bl Proc_Break
	b .L08059BDC
	.align 2, 0
.L08059BA4: .4byte gEkrDragonState
.L08059BA8:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xdd
	bl EfxPlaySE
	ldr r0, [r5, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r0, #0xdd
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	ldr r0, [r5, #0x5c]
	movs r1, #0x6c
	bl EkrPrepareBanimfx
	ldr r0, [r5, #0x5c]
	movs r1, #0
	bl SwitchAISFrameDataFromBARoundType
	ldr r0, [r5, #0x5c]
	bl NewEkrFaeDeamon
	adds r0, r5, #0
	bl Proc_Break
.L08059BDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_08059BE4
func_fe6_08059BE4: @ 0x08059BE4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl CheckEkrDragonStateTypeFae
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08059C02
	movs r0, #0x3c
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
	b .L08059C2E
.L08059C02:
	ldr r5, [r6, #0x5c]
	ldr r0, [r5, #0x20]
	movs r7, #0x3f
	ldrb r0, [r0, #3]
	ands r7, r0
	cmp r7, #0
	bne .L08059C2E
	ldr r4, .L08059C34 @ =gBanimIdx_bak
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r5, #0
	bl EkrPrepareBanimfx
	strh r7, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
.L08059C2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08059C34: .4byte gBanimIdx_bak

	thumb_func_start func_fe6_08059C38
func_fe6_08059C38: @ 0x08059C38
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3d
	bne .L08059C50
	adds r0, r1, #0
	bl Proc_Break
.L08059C50:
	pop {r0}
	bx r0

	thumb_func_start func_fe6_08059C54
func_fe6_08059C54: @ 0x08059C54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, .L08059C74 @ =gEkrDragonIntroDone
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08059C74: .4byte gEkrDragonIntroDone

	thumb_func_start NewEkrFaeDeamon
NewEkrFaeDeamon: @ 0x08059C78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08059CD0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08059CD4 @ =ProcScr_EkrFaefx
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08059CD8 @ =FrameLut_EkrFaefx
	str r0, [r5, #0x48]
	ldr r0, .L08059CDC @ =TsaLut_EkrFaefx
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08059CE0 @ =Img_EkrFaefx
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08059CE4 @ =Pal_EkrFaefx
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08059CE8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08059CF8
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08059CEC
	movs r0, #1
	movs r1, #0x18
	b .L08059CF0
	.align 2, 0
.L08059CD0: .4byte gEfxBgSemaphore
.L08059CD4: .4byte ProcScr_EkrFaefx
.L08059CD8: .4byte FrameLut_EkrFaefx
.L08059CDC: .4byte TsaLut_EkrFaefx
.L08059CE0: .4byte Img_EkrFaefx
.L08059CE4: .4byte Pal_EkrFaefx
.L08059CE8: .4byte gEkrDistanceType
.L08059CEC:
	movs r0, #1
	movs r1, #0xe8
.L08059CF0:
	movs r2, #0
	bl SetBgOffset
	b .L08059D02
.L08059CF8:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08059D02:
	ldr r3, .L08059D30 @ =gDispIo
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08059D30: .4byte gDispIo

	thumb_func_start EkrFaeDeamon_Loop
EkrFaeDeamon_Loop: @ 0x08059D34
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
	blt .L08059D62
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08059D80
.L08059D62:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne .L08059D80
	bl SpellFx_ClearBG1
	ldr r1, .L08059D88 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
.L08059D80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08059D88: .4byte gEfxBgSemaphore
