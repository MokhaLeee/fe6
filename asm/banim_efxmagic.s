	.include "macro.inc"
	.syntax unified


	thumb_func_start StartSpellAnimNosferatu
StartSpellAnimNosferatu: @ 0x08050860
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08050898 @ =ProcScr_EfxResire
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
.L08050898: .4byte ProcScr_EfxResire

	thumb_func_start EfxResire_Loop
EfxResire_Loop: @ 0x0805089C
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
	bne .L080508D2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L080508D2:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L08050930
	ldr r3, .L0805092C @ =gDispIo
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
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x28
	movs r3, #0x10
	bl NewEfxALPHA
	adds r0, r6, #0
	bl NewEfxResireBG2
	movs r0, #0x92
	lsls r0, r0, #1
	b .L08050982
	.align 2, 0
.L0805092C: .4byte gDispIo
.L08050930:
	adds r0, r5, #0
	adds r0, #0xf
	cmp r1, r0
	bne .L0805096C
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x52
	movs r2, #0xf
	movs r3, #0
	bl NewEfxRestRST
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x3c
	bl NewEfxResireRST
	ldr r0, .L08050964 @ =gDispIo
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	ldr r3, .L08050968 @ =EfxRestWINH_DefaultHblank
	adds r0, r6, #0
	movs r1, #0x53
	bl NewEfxRestWINH
	b .L080509D8
	.align 2, 0
.L08050964: .4byte gDispIo
.L08050968: .4byte EfxRestWINH_DefaultHblank
.L0805096C:
	adds r0, r5, #0
	adds r0, #0x64
	cmp r1, r0
	bne .L08050998
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl NewEfxResireBG
	ldr r0, .L08050994 @ =0x00000125
.L08050982:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl PlaySFX
	b .L080509D8
	.align 2, 0
.L08050994: .4byte 0x00000125
.L08050998:
	adds r0, r5, #0
	adds r0, #0x69
	cmp r1, r0
	bne .L080509C0
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimResireHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080509D8
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b .L080509D8
.L080509C0:
	adds r0, r5, #0
	adds r0, #0x96
	cmp r1, r0
	beq .L080509D8
	adds r0, #0x14
	cmp r1, r0
	bne .L080509D8
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L080509D8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxResireBG
NewEfxResireBG: @ 0x080509E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08050A44 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050A48 @ =ProcScr_EfxResireBG
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, .L08050A4C @ =FrameConf_EfxResireBG
	str r0, [r6, #0x48]
	ldr r0, .L08050A50 @ =TsaArray_EfxResireBG
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, .L08050A54 @ =ImgArray_EfxResireBG
	str r0, [r6, #0x54]
	ldr r0, .L08050A58 @ =Pal_EfxResireBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08050A5C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050A6A
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050A60
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08050A6A
	.align 2, 0
.L08050A44: .4byte gEfxBgSemaphore
.L08050A48: .4byte ProcScr_EfxResireBG
.L08050A4C: .4byte FrameConf_EfxResireBG
.L08050A50: .4byte TsaArray_EfxResireBG
.L08050A54: .4byte ImgArray_EfxResireBG
.L08050A58: .4byte Pal_EfxResireBG
.L08050A5C: .4byte gEkrDistanceType
.L08050A60:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08050A6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NewEfxResireBG2
NewEfxResireBG2: @ 0x08050A70
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08050AE0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050AE4 @ =ProcScr_EfxResireBG2
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08050AE8 @ =FrameConf_EfxResireBG2
	str r0, [r5, #0x48]
	ldr r0, .L08050AEC @ =TsaArray_EfxResireBG
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08050AF0 @ =ImgArray_EfxResireBG
	str r0, [r5, #0x54]
	ldr r0, .L08050AF4 @ =Pal_EfxResireBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08050AF8 @ =gDispIo
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
	ldr r0, .L08050AFC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050B0A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050B00
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08050B0A
	.align 2, 0
.L08050AE0: .4byte gEfxBgSemaphore
.L08050AE4: .4byte ProcScr_EfxResireBG2
.L08050AE8: .4byte FrameConf_EfxResireBG2
.L08050AEC: .4byte TsaArray_EfxResireBG
.L08050AF0: .4byte ImgArray_EfxResireBG
.L08050AF4: .4byte Pal_EfxResireBG
.L08050AF8: .4byte gDispIo
.L08050AFC: .4byte gEkrDistanceType
.L08050B00:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08050B0A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxResireBG_Loop1
EfxResireBG_Loop1: @ 0x08050B10
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
	blt .L08050B4C
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
	b .L08050B8E
.L08050B4C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08050B8E
	bl SpellFx_ClearBG1
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08050B80
	ldr r1, .L08050B7C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl EndEfxSpellCastAsync
	adds r0, r7, #0
	bl Proc_End
	b .L08050B8E
	.align 2, 0
.L08050B7C: .4byte gEfxBgSemaphore
.L08050B80:
	movs r0, #0
	strh r0, [r7, #0x2c]
	movs r0, #0x1e
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl Proc_Break
.L08050B8E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EfxResireBG_Loop2
EfxResireBG_Loop2: @ 0x08050B94
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L08050BB8 @ =gEfxHpBarResireFlag
	ldr r0, [r5]
	cmp r0, #2
	bne .L08050BC0
	ldr r1, .L08050BBC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_End
	b .L08050C1A
	.align 2, 0
.L08050BB8: .4byte gEfxHpBarResireFlag
.L08050BBC: .4byte gEfxBgSemaphore
.L08050BC0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble .L08050BD8
	strh r1, [r4, #0x2c]
.L08050BD8:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne .L08050C1A
	ldr r0, [r5]
	cmp r0, #1
	bne .L08050C1A
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, .L08050C20 @ =FrameConf_EfxResireBG3
	str r0, [r4, #0x48]
	ldr r0, .L08050C24 @ =TsaArray_EfxResireBG
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, .L08050C28 @ =ImgArray_EfxResireBG
	str r0, [r4, #0x54]
	ldr r0, .L08050C2C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050C14
	bl EfxGetCamMovDuration
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08050C14:
	adds r0, r4, #0
	bl Proc_Break
.L08050C1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050C20: .4byte FrameConf_EfxResireBG3
.L08050C24: .4byte TsaArray_EfxResireBG
.L08050C28: .4byte ImgArray_EfxResireBG
.L08050C2C: .4byte gEkrDistanceType

	thumb_func_start EfxResireBG_Loop3
EfxResireBG_Loop3: @ 0x08050C30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08050C96
	ldr r0, .L08050C6C @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq .L08050C7A
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050C70
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08050C7A
	.align 2, 0
.L08050C6C: .4byte gEkrDistanceType
.L08050C70:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08050C7A:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r4, #0
	bl Proc_Break
.L08050C96:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxResireBG_Loop4
EfxResireBG_Loop4: @ 0x08050C9C
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
	blt .L08050CD8
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
	b .L08050CFA
.L08050CD8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08050CFA
	bl SpellFx_ClearBG1
	ldr r1, .L08050D00 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl EndEfxSpellCastAsync
	adds r0, r7, #0
	bl Proc_Break
.L08050CFA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08050D00: .4byte gEfxBgSemaphore

	thumb_func_start EfxResireBG2_Loop
EfxResireBG2_Loop: @ 0x08050D04
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
	blt .L08050D40
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
	b .L08050D5E
.L08050D40:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08050D5E
	bl SpellFx_ClearBG1
	ldr r1, .L08050D64 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08050D5E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08050D64: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxResireRST
NewEfxResireRST: @ 0x08050D68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, .L08050D90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050D94 @ =ProcScr_EfxResireRST
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
.L08050D90: .4byte gEfxBgSemaphore
.L08050D94: .4byte ProcScr_EfxResireRST

	thumb_func_start EfxResireRST_Loop
EfxResireRST_Loop: @ 0x08050D98
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
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08050DD4
	ldr r1, .L08050DDC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08050DD4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050DDC: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimLightning
StartSpellAnimLightning: @ 0x08050DE0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08050E18 @ =ProcScr_EfxLightning
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
.L08050E18: .4byte ProcScr_EfxLightning

	thumb_func_start EfxLightning_Loop
EfxLightning_Loop: @ 0x08050E1C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08050E46
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08050E46:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L08050E6A
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl NewEfxLightningBG
	b .L08050ECC
.L08050E6A:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne .L08050EB0
	ldr r0, .L08050EAC @ =0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08050ECC
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L08050ECC
	.align 2, 0
.L08050EAC: .4byte 0x00000121
.L08050EB0:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq .L08050ECC
	adds r0, #1
	cmp r1, r0
	bne .L08050ECC
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L08050ECC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxLightningBG
NewEfxLightningBG: @ 0x08050ED4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08050F28 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08050F2C @ =ProcScr_EfxLightningBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08050F30 @ =FrameConf_EfxLightningBG
	str r0, [r5, #0x48]
	ldr r0, .L08050F34 @ =TsaArray_EfxLightningBG
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08050F38 @ =ImgArray_EfxLightningBG
	str r0, [r5, #0x54]
	ldr r0, .L08050F3C @ =PalArray_EfxLightningBG
	str r0, [r5, #0x58]
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L08050F40 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050F4E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08050F44
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08050F4E
	.align 2, 0
.L08050F28: .4byte gEfxBgSemaphore
.L08050F2C: .4byte ProcScr_EfxLightningBG
.L08050F30: .4byte FrameConf_EfxLightningBG
.L08050F34: .4byte TsaArray_EfxLightningBG
.L08050F38: .4byte ImgArray_EfxLightningBG
.L08050F3C: .4byte PalArray_EfxLightningBG
.L08050F40: .4byte gEkrDistanceType
.L08050F44:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08050F4E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxLightningBG_Loop
EfxLightningBG_Loop: @ 0x08050F54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L08050FDC
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	ldr r0, .L08050FBC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050FFA
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne .L08050FC4
	ldr r0, .L08050FC0 @ =gBg1Tm
	b .L08050FC8
	.align 2, 0
.L08050FBC: .4byte gEkrDistanceType
.L08050FC0: .4byte gBg1Tm
.L08050FC4:
	ldr r0, .L08050FD8 @ =gBg1Tm+0x3A
	movs r1, #0
.L08050FC8:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L08050FFA
	.align 2, 0
.L08050FD8: .4byte gBg1Tm+0x3A
.L08050FDC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08050FFA
	bl SpellFx_ClearBG1
	ldr r1, .L08051008 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L08050FFA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051008: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimPurge
StartSpellAnimPurge: @ 0x0805100C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08051048 @ =ProcScr_EfxPurge
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r6, #0
	strh r6, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	ldr r0, .L0805104C @ =gEfxPurgeCounter
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08051048: .4byte ProcScr_EfxPurge
.L0805104C: .4byte gEfxPurgeCounter

	thumb_func_start EfxPurge_PlaySFX
EfxPurge_PlaySFX: @ 0x08051050
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, .L0805106C @ =gEfxPurgeCounter
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08051070
	adds r1, #0xff
	movs r0, #0xfe
	bl PlaySFX
	b .L0805107A
	.align 2, 0
.L0805106C: .4byte gEfxPurgeCounter
.L08051070:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl PlaySFX
.L0805107A:
	ldr r1, .L08051088 @ =gEfxPurgeCounter
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08051088: .4byte gEfxPurgeCounter

	thumb_func_start EfxPurge_Loop
EfxPurge_Loop: @ 0x0805108C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080510BA
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L080510BA:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L080510DC
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl NewEfxPurgeBG
	adds r0, r5, #0
	bl NewEfxPurgeOBJRND
	movs r0, #0x30
	b .L08051102
.L080510DC:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne .L080510F0
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0xa0
	b .L08051102
.L080510F0:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne .L0805110A
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0x70
.L08051102:
	movs r1, #0
	bl EfxPurge_PlaySFX
	b .L080511B4
.L0805110A:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne .L0805113E
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl PlaySFX
	b .L080511B4
.L0805113E:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne .L08051184
	adds r0, r5, #0
	movs r1, #4
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
	ldr r0, .L08051180 @ =0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080511B4
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L080511B4
	.align 2, 0
.L08051180: .4byte 0x00000101
.L08051184:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne .L0805119E
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl NewEfxALPHA
	b .L080511B4
.L0805119E:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne .L080511B4
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r6, #0
	bl Proc_Break
.L080511B4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxPurgeBG
NewEfxPurgeBG: @ 0x080511BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080511F4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080511F8 @ =ProcScr_EfxPurgeBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080511FC @ =FrameArray_EfxPurgeBG
	str r1, [r0, #0x48]
	ldr r1, .L08051200 @ =TsaArray_EfxPurgeBG
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08051204 @ =ImgArray_EfxPurgeBG
	str r1, [r0, #0x54]
	ldr r1, .L08051208 @ =PalArray_EfxPurgeBG
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080511F4: .4byte gEfxBgSemaphore
.L080511F8: .4byte ProcScr_EfxPurgeBG
.L080511FC: .4byte FrameArray_EfxPurgeBG
.L08051200: .4byte TsaArray_EfxPurgeBG
.L08051204: .4byte ImgArray_EfxPurgeBG
.L08051208: .4byte PalArray_EfxPurgeBG

	thumb_func_start EfxPurgeBG_Loop
EfxPurgeBG_Loop: @ 0x0805120C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0805125A
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	b .L08051278
.L0805125A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne .L08051278
	bl SpellFx_ClearBG1
	ldr r1, .L08051284 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
.L08051278:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051284: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxPurgeOBJRND
NewEfxPurgeOBJRND: @ 0x08051288
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080512B4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080512B8 @ =ProcScr_EfxPurgeOBJRND
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #6
	str r1, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080512B4: .4byte gEfxBgSemaphore
.L080512B8: .4byte ProcScr_EfxPurgeOBJRND

	thumb_func_start EfxPurgeOBJRND_Loop
EfxPurgeOBJRND_Loop: @ 0x080512BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble .L08051318
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, .L08051320 @ =Vecs_EfxPurgeOBJRND
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl NewEfxPurgeOBJ
	adds r0, r4, #0
	movs r1, #1
	bl EfxPurge_PlaySFX
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble .L08051318
	ldr r1, .L08051324 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08051318:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08051320: .4byte Vecs_EfxPurgeOBJRND
.L08051324: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxPurgeOBJ
NewEfxPurgeOBJ: @ 0x08051328
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L08051380 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051384 @ =ProcScr_EfxPurgeOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08051388 @ =AnimScr_EfxPurgeOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, .L0805138C @ =Pal_EfxPurgeOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08051390 @ =Img_EfxPurgeOBJ
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
.L08051380: .4byte gEfxBgSemaphore
.L08051384: .4byte ProcScr_EfxPurgeOBJ
.L08051388: .4byte AnimScr_EfxPurgeOBJ
.L0805138C: .4byte Pal_EfxPurgeOBJ
.L08051390: .4byte Img_EfxPurgeOBJ

	thumb_func_start EfxPurgeOBJ_OnEnd
EfxPurgeOBJ_OnEnd: @ 0x08051394
	push {lr}
	ldr r0, [r0, #0x60]
	bl BasRemove
	ldr r1, .L080513A8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L080513A8: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimForblaze
StartSpellAnimForblaze: @ 0x080513AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L080513E4 @ =ProcScr_EfxForblaze
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
.L080513E4: .4byte ProcScr_EfxForblaze

	thumb_func_start EfxForblaze_Loop
EfxForblaze_Loop: @ 0x080513E8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08051416
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08051416:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08051448
	adds r0, r5, #0
	bl NewEfxForblazeBG1
	bl NewEfxForblazeBGCtrl1
	adds r0, r5, #0
	movs r1, #0xa0
	bl NewEfxForblazeBGCOL1
	ldr r0, .L08051444 @ =0x0000012D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b .L08051514
	.align 2, 0
.L08051444: .4byte 0x0000012D
.L08051448:
	adds r0, r4, #0
	adds r0, #0x5a
	cmp r1, r0
	bne .L0805146A
	adds r0, r5, #0
	movs r1, #0x3c
	bl NewEfxForblazeOBJ
	movs r0, #0x97
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b .L08051514
.L0805146A:
	adds r0, r4, #0
	adds r0, #0xa0
	cmp r1, r0
	bne .L0805147C
	ldr r0, [r6, #0x5c]
	movs r1, #3
	bl NewEfxFlashBgRed
	b .L08051514
.L0805147C:
	adds r0, r4, #0
	adds r0, #0xa3
	cmp r1, r0
	bne .L080514F4
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxMagicQUAKE
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxForblazeBG2
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r2, .L080514EC @ =HBlank_EfxForblaze
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxRestWINH_
	movs r0, #0x64
	bl NewEfxForblazeRST
	adds r0, r5, #0
	bl NewEfxForblazeOBJCtrl
	ldr r0, .L080514F0 @ =0x0000012F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
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
	bne .L08051514
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L08051514
	.align 2, 0
.L080514EC: .4byte HBlank_EfxForblaze
.L080514F0: .4byte 0x0000012F
.L080514F4:
	adds r0, r4, #0
	adds r0, #0xfa
	cmp r1, r0
	beq .L08051514
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08051514
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r6, #0
	bl Proc_Break
.L08051514:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxForblazeBG1
NewEfxForblazeBG1: @ 0x0805151C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051570 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051574 @ =ProcScr_EfxForblazeBG1
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051578 @ =FrameConf_EfxForblazeBG1
	str r0, [r5, #0x48]
	ldr r0, .L0805157C @ =TsaArray_EfxForblazeBG1
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051580 @ =ImgArray_EfxForblazeBG1
	str r0, [r5, #0x54]
	ldr r0, .L08051584 @ =Pal_EfxForblazeBG1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051588 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051596
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L0805158C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08051596
	.align 2, 0
.L08051570: .4byte gEfxBgSemaphore
.L08051574: .4byte ProcScr_EfxForblazeBG1
.L08051578: .4byte FrameConf_EfxForblazeBG1
.L0805157C: .4byte TsaArray_EfxForblazeBG1
.L08051580: .4byte ImgArray_EfxForblazeBG1
.L08051584: .4byte Pal_EfxForblazeBG1
.L08051588: .4byte gEkrDistanceType
.L0805158C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08051596:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxForblazeBG1_Loop
EfxForblazeBG1_Loop: @ 0x080515A0
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
	blt .L080515F8
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
	ldr r0, .L080515F0 @ =gBg1Tm+0x3C
	ldr r1, .L080515F4 @ =0x0000011F
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	b .L08051616
	.align 2, 0
.L080515F0: .4byte gBg1Tm+0x3C
.L080515F4: .4byte 0x0000011F
.L080515F8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08051616
	bl SpellFx_ClearBG1
	ldr r1, .L08051620 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08051616:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051620: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxForblazeBGCOL1
NewEfxForblazeBGCOL1: @ 0x08051624
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805165C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051660 @ =ProcScr_EfxForblazeBGCOL1
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08051664 @ =FrameArray_EfxForblazeBGCOL1
	str r1, [r0, #0x48]
	ldr r1, .L08051668 @ =Pal_EfxForblazeBG1
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805165C: .4byte gEfxBgSemaphore
.L08051660: .4byte ProcScr_EfxForblazeBGCOL1
.L08051664: .4byte FrameArray_EfxForblazeBGCOL1
.L08051668: .4byte Pal_EfxForblazeBG1

	thumb_func_start EfxForblazeBGCOL1_Loop
EfxForblazeBGCOL1_Loop: @ 0x0805166C
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
	blt .L08051690
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L08051690:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080516AE
	ldr r1, .L080516B4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080516AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080516B4: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxForblazeBGCtrl1
NewEfxForblazeBGCtrl1: @ 0x080516B8
	push {lr}
	ldr r0, .L080516D0 @ =gEfxBgSemaphore
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	ldr r0, .L080516D4 @ =gUnk_085D2230
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L080516D0: .4byte gEfxBgSemaphore
.L080516D4: .4byte gUnk_085D2230

	thumb_func_start EfxForblazeBGCtrl1_Loop1
EfxForblazeBGCtrl1_Loop1: @ 0x080516D8
	push {lr}
	ldr r2, .L080516E8 @ =gDispIo
	movs r1, #8
	strh r1, [r2, #0x22]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
.L080516E8: .4byte gDispIo

	thumb_func_start EfxForblazeBGCtrl1_Loop2
EfxForblazeBGCtrl1_Loop2: @ 0x080516EC
	push {lr}
	ldr r2, .L080516FC @ =gDispIo
	movs r1, #0x10
	strh r1, [r2, #0x22]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
.L080516FC: .4byte gDispIo

	thumb_func_start EfxForblazeBGCtrl1_Loop3
EfxForblazeBGCtrl1_Loop3: @ 0x08051700
	push {lr}
	ldr r2, .L08051718 @ =gDispIo
	movs r1, #0x18
	strh r1, [r2, #0x22]
	ldr r2, .L0805171C @ =gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
.L08051718: .4byte gDispIo
.L0805171C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxForblazeOBJ
NewEfxForblazeOBJ: @ 0x08051720
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08051760 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051764 @ =ProcScr_EfxForblazeOBJ
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
	ldr r0, .L08051768 @ =Img_EfxForblazeOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, .L0805176C @ =Pal_EfxForblazeOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08051760: .4byte gEfxBgSemaphore
.L08051764: .4byte ProcScr_EfxForblazeOBJ
.L08051768: .4byte Img_EfxForblazeOBJ
.L0805176C: .4byte Pal_EfxForblazeOBJ

	thumb_func_start EfxForblazeOBJ_Loop
EfxForblazeOBJ_Loop: @ 0x08051770
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r4, [r3, #0x2e]
	lsls r1, r4, #0x10
	cmp r0, r1
	bne .L0805179C
	ldr r1, .L08051798 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b .L080517DA
	.align 2, 0
.L08051798: .4byte gEfxBgSemaphore
.L0805179C:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne .L080517DA
	strh r2, [r3, #0x30]
	movs r0, #2
	str r0, [r3, #0x44]
	ldr r4, .L080517E0 @ =gUnk_085D2288
	ldr r0, [r3, #0x48]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne .L080517C6
	str r2, [r3, #0x48]
.L080517C6:
	ldr r2, [r3, #0x48]
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r2, #1
	str r2, [r3, #0x48]
	ldr r0, [r3, #0x5c]
	movs r2, #0x50
	bl NewEfxForblazeOBJ2
.L080517DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080517E0: .4byte gUnk_085D2288

	thumb_func_start NewEfxForblazeOBJ2
NewEfxForblazeOBJ2: @ 0x080517E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L08051830 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051834 @ =ProcScr_EfxForblazeOBJ2
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xc
	strh r0, [r4, #0x2e]
	ldr r3, .L08051838 @ =AnimScr_EfxForblazeOBJ2
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
.L08051830: .4byte gEfxBgSemaphore
.L08051834: .4byte ProcScr_EfxForblazeOBJ2
.L08051838: .4byte AnimScr_EfxForblazeOBJ2

	thumb_func_start EfxForblazeOBJ2_Loop
EfxForblazeOBJ2_Loop: @ 0x0805183C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08051864
	ldr r0, .L0805186C @ =gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
.L08051864:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805186C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxForblazeBG2
NewEfxForblazeBG2: @ 0x08051870
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L080518E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080518E4 @ =ProcScr_EfxForblazeBG2
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r1, [r0, #0x30]
	ldr r0, .L080518E8 @ =Img1_EfxForblazeBG2
	ldr r1, .L080518EC @ =gSpellAnimBgfx
	bl LZ77UnCompWram
	ldr r0, .L080518F0 @ =Img2_EfxForblazeBG2
	ldr r1, .L080518F4 @ =gBuf_Banim + 0x1000
	bl LZ77UnCompWram
	ldr r0, .L080518F8 @ =Tsa1_EfxForblazeBG2
	ldr r4, .L080518FC @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, .L08051900 @ =Tsa2_EfxForblazeBG2
	movs r1, #0x80
	lsls r1, r1, #4
	adds r4, r4, r1
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08051904 @ =gDispIo
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080518E0: .4byte gEfxBgSemaphore
.L080518E4: .4byte ProcScr_EfxForblazeBG2
.L080518E8: .4byte Img1_EfxForblazeBG2
.L080518EC: .4byte gSpellAnimBgfx
.L080518F0: .4byte Img2_EfxForblazeBG2
.L080518F4: .4byte gBuf_Banim + 0x1000
.L080518F8: .4byte Tsa1_EfxForblazeBG2
.L080518FC: .4byte gEkrTsaBuffer
.L08051900: .4byte Tsa2_EfxForblazeBG2
.L08051904: .4byte gDispIo

	thumb_func_start EfxForblazeBG2_Loop
EfxForblazeBG2_Loop: @ 0x08051908
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r5, #1
	adds r0, r5, #0
	ldrh r1, [r4, #0x2c]
	ands r0, r1
	cmp r0, #0
	bne .L080519A0
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq .L0805193C
	cmp r0, #1
	bgt .L0805192C
	cmp r0, #0
	beq .L08051932
	b .L0805194C
.L0805192C:
	cmp r0, #2
	beq .L08051944
	b .L0805194C
.L08051932:
	ldr r0, .L08051938 @ =Pal1_EfxForblazeBG2
	b .L0805194E
	.align 2, 0
.L08051938: .4byte Pal1_EfxForblazeBG2
.L0805193C:
	ldr r0, .L08051940 @ =Pal2_EfxForblazeBG2
	b .L0805194E
	.align 2, 0
.L08051940: .4byte Pal2_EfxForblazeBG2
.L08051944:
	ldr r0, .L08051948 @ =Pal3_EfxForblazeBG2
	b .L0805194E
	.align 2, 0
.L08051948: .4byte Pal3_EfxForblazeBG2
.L0805194C:
	movs r0, #0
.L0805194E:
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bne .L08051966
	movs r0, #0
	strh r0, [r4, #0x30]
.L08051966:
	ldr r0, .L08051990 @ =gSpellAnimBgfx
	ldr r1, .L08051994 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
	ldr r0, .L08051998 @ =gEkrTsaBuffer
	ldr r1, .L0805199C @ =gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x10
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	b .L080519CE
	.align 2, 0
.L08051990: .4byte gSpellAnimBgfx
.L08051994: .4byte 0x06002000
.L08051998: .4byte gEkrTsaBuffer
.L0805199C: .4byte gBg1Tm
.L080519A0:
	ldr r0, .L080519FC @ =Pal4_EfxForblazeBG2
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051A00 @ =gBuf_Banim + 0x1000
	ldr r1, .L08051A04 @ =0x06002000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterDataMove
	ldr r0, .L08051A08 @ =gEkrTsaBuffer + 0x800
	ldr r1, .L08051A0C @ =gBg1Tm
	str r5, [sp]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x10
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
.L080519CE:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080519F4
	bl SpellFx_ClearBG1
	ldr r1, .L08051A10 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
.L080519F4:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080519FC: .4byte Pal4_EfxForblazeBG2
.L08051A00: .4byte gBuf_Banim + 0x1000
.L08051A04: .4byte 0x06002000
.L08051A08: .4byte gEkrTsaBuffer + 0x800
.L08051A0C: .4byte gBg1Tm
.L08051A10: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxForblazeOBJCtrl
NewEfxForblazeOBJCtrl: @ 0x08051A14
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08051A50 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051A54 @ =ProcScr_EfxForblazeOBJCtrl
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #2
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, .L08051A58 @ =Img_EfxForblazeOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, .L08051A5C @ =Pal_EfxForblazeOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08051A50: .4byte gEfxBgSemaphore
.L08051A54: .4byte ProcScr_EfxForblazeOBJCtrl
.L08051A58: .4byte Img_EfxForblazeOBJ
.L08051A5C: .4byte Pal_EfxForblazeOBJ

	thumb_func_start EfxForblazeOBJCtrl_Loop
EfxForblazeOBJCtrl_Loop: @ 0x08051A60
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x41
	bne .L08051A88
	ldr r1, .L08051A84 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08051ABC
	.align 2, 0
.L08051A84: .4byte gEfxBgSemaphore
.L08051A88:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne .L08051ABC
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r0, #2
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl NewEfxForblazeOBJFall
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl NewEfxForblazeOBJFall
.L08051ABC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxForblazeOBJFall
NewEfxForblazeOBJFall: @ 0x08051AC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08051B1C @ =gUnk_0811A520
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r1, .L08051B20 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051B24 @ =ProcScr_EfxForblazeOBJFall
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r4, #0
	strh r4, [r6, #0x2c]
	movs r0, #7
	ands r0, r5
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r6, #0x2e]
	movs r0, #0xe0
	bl BanimSpawnRandB
	adds r0, #8
	strh r0, [r6, #0x32]
	strh r4, [r6, #0x3a]
	movs r0, #9
	bl BanimSpawnRandB
	cmp r0, #9
	bhi .L08051B78
	lsls r0, r0, #2
	ldr r1, .L08051B28 @ =.L08051B2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08051B1C: .4byte gUnk_0811A520
.L08051B20: .4byte gEfxBgSemaphore
.L08051B24: .4byte ProcScr_EfxForblazeOBJFall
.L08051B28: .4byte .L08051B2C
.L08051B2C: @ jump table
	.4byte .L08051B54 @ case 0
	.4byte .L08051B54 @ case 1
	.4byte .L08051B54 @ case 2
	.4byte .L08051B54 @ case 3
	.4byte .L08051B54 @ case 4
	.4byte .L08051B54 @ case 5
	.4byte .L08051B54 @ case 6
	.4byte .L08051B5C @ case 7
	.4byte .L08051B64 @ case 8
	.4byte .L08051B6C @ case 9
.L08051B54:
	ldr r0, .L08051B58 @ =gUnk_085E5C44
	b .L08051B6E
	.align 2, 0
.L08051B58: .4byte gUnk_085E5C44
.L08051B5C:
	ldr r0, .L08051B60 @ =gUnk_085E5C3C
	b .L08051B6E
	.align 2, 0
.L08051B60: .4byte gUnk_085E5C3C
.L08051B64:
	ldr r0, .L08051B68 @ =gUnk_085E5C34
	b .L08051B6E
	.align 2, 0
.L08051B68: .4byte gUnk_085E5C34
.L08051B6C:
	ldr r0, .L08051B8C @ =gUnk_085E5C2C
.L08051B6E:
	movs r1, #0x78
	bl BasCreate
	adds r4, r0, #0
	str r4, [r6, #0x60]
.L08051B78:
	cmp r4, #0
	bne .L08051B94
	ldr r1, .L08051B90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_End
	b .L08051BA2
	.align 2, 0
.L08051B8C: .4byte gUnk_085E5C2C
.L08051B90: .4byte gEfxBgSemaphore
.L08051B94:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r4, #8]
	ldrh r0, [r6, #0x32]
	strh r0, [r4, #2]
	ldrh r0, [r6, #0x3a]
	strh r0, [r4, #4]
.L08051BA2:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxForblazeOBJFall_Loop
EfxForblazeOBJFall_Loop: @ 0x08051BAC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble .L08051BDC
	ldr r1, .L08051BD8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl BasRemove
	adds r0, r4, #0
	bl Proc_Break
	b .L08051BF8
	.align 2, 0
.L08051BD8: .4byte gEfxBgSemaphore
.L08051BDC:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #8
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
.L08051BF8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start HBlank_EfxForblaze
HBlank_EfxForblaze: @ 0x08051C00
	ldr r0, .L08051C24 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08051C20
	ldr r2, .L08051C28 @ =0x04000014
	ldr r3, .L08051C2C @ =gpBg2ScrollOffset
	ldr r1, [r3]
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	str r1, [r3]
.L08051C20:
	bx lr
	.align 2, 0
.L08051C24: .4byte 0x04000004
.L08051C28: .4byte 0x04000014
.L08051C2C: .4byte gpBg2ScrollOffset

	thumb_func_start NewEfxForblazeRST
NewEfxForblazeRST: @ 0x08051C30
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08051C54 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051C58 @ =ProcScr_EfxForblazeRST
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08051C54: .4byte gEfxBgSemaphore
.L08051C58: .4byte ProcScr_EfxForblazeRST

	thumb_func_start EfxForblazeRST_Loop
EfxForblazeRST_Loop: @ 0x08051C5C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, .L08051CBC @ =gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r4, .L08051CC0 @ =gpBg2ScrollOffsetTable1
	cmp r0, #0
	bne .L08051C6C
	ldr r4, .L08051CC4 @ =gpBg2ScrollOffsetTable2
.L08051C6C:
	movs r2, #0
	ldr r6, .L08051CC8 @ =gSinLut
	movs r5, #0xff
.L08051C72:
	lsls r0, r2, #1
	movs r7, #0x30
	ldrsh r1, [r3, r7]
	adds r0, r0, r1
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #0xa
	adds r0, #4
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, #0x9f
	bls .L08051C72
	ldrh r0, [r3, #0x30]
	adds r0, #2
	strh r0, [r3, #0x30]
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r3, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08051CB6
	ldr r1, .L08051CCC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
.L08051CB6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051CBC: .4byte gEkrBg1ScrollFlip
.L08051CC0: .4byte gpBg2ScrollOffsetTable1
.L08051CC4: .4byte gpBg2ScrollOffsetTable2
.L08051CC8: .4byte gSinLut
.L08051CCC: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimDivine
StartSpellAnimDivine: @ 0x08051CD0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08051D08 @ =ProcScr_EfxDivine
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
.L08051D08: .4byte ProcScr_EfxDivine

	thumb_func_start EfxDivine_Loop
EfxDivine_Loop: @ 0x08051D0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne .L08051D50
	ldr r0, .L08051D4C @ =0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl NewEfxDivineBG
	ldr r0, [r4, #0x5c]
	bl NewEfxDivineOBJ
	b .L08051DF6
	.align 2, 0
.L08051D4C: .4byte 0x00000127
.L08051D50:
	cmp r2, #0x14
	bne .L08051D64
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08051D90
.L08051D64:
	cmp r2, #0x32
	bne .L08051D74
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b .L08051DF6
.L08051D74:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne .L08051D9C
	adds r0, r5, #0
	bl NewEfxDivineBG2
	ldr r0, .L08051D98 @ =0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L08051D90:
	movs r3, #1
	bl PlaySFX
	b .L08051DF6
	.align 2, 0
.L08051D98: .4byte 0x00000129
.L08051D9C:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne .L08051DAE
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b .L08051DF6
.L08051DAE:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne .L08051DDC
	adds r0, r5, #0
	bl NewEfxDivineBG3
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08051DF6
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L08051DF6
.L08051DDC:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq .L08051DF6
	cmp r2, #0x64
	bne .L08051DF6
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L08051DF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewEfxDivineBG
NewEfxDivineBG: @ 0x08051DFC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051E50 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051E54 @ =ProcScr_EfxDivineBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051E58 @ =FrameArray_EfxDivineBG
	str r0, [r5, #0x48]
	ldr r0, .L08051E5C @ =TsaArray_EfxDivineBG
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051E60 @ =ImgArray_EfxDivineBG
	str r0, [r5, #0x54]
	ldr r0, .L08051E64 @ =Pal_EfxDivineBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051E68 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051E76
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08051E6C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08051E76
	.align 2, 0
.L08051E50: .4byte gEfxBgSemaphore
.L08051E54: .4byte ProcScr_EfxDivineBG
.L08051E58: .4byte FrameArray_EfxDivineBG
.L08051E5C: .4byte TsaArray_EfxDivineBG
.L08051E60: .4byte ImgArray_EfxDivineBG
.L08051E64: .4byte Pal_EfxDivineBG
.L08051E68: .4byte gEkrDistanceType
.L08051E6C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08051E76:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewEfxDivineBG2
NewEfxDivineBG2: @ 0x08051E80
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051ED4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051ED8 @ =ProcScr_EfxDivineBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051EDC @ =FrameArray_EfxDivineBG2
	str r0, [r5, #0x48]
	ldr r0, .L08051EE0 @ =TsaArray_EfxDivineBG2
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051EE4 @ =ImgArray_EfxDivineBG2
	str r0, [r5, #0x54]
	ldr r0, .L08051EE8 @ =Pal_EfxDivineBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051EEC @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051EFA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08051EF0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08051EFA
	.align 2, 0
.L08051ED4: .4byte gEfxBgSemaphore
.L08051ED8: .4byte ProcScr_EfxDivineBG
.L08051EDC: .4byte FrameArray_EfxDivineBG2
.L08051EE0: .4byte TsaArray_EfxDivineBG2
.L08051EE4: .4byte ImgArray_EfxDivineBG2
.L08051EE8: .4byte Pal_EfxDivineBG
.L08051EEC: .4byte gEkrDistanceType
.L08051EF0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08051EFA:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewEfxDivineBG3
NewEfxDivineBG3: @ 0x08051F04
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08051F58 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08051F5C @ =ProcScr_EfxDivineBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08051F60 @ =FrameArray_EfxDivineBG3
	str r0, [r5, #0x48]
	ldr r0, .L08051F64 @ =TsaArray_EfxDivineBG3
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08051F68 @ =ImgArray_EfxDivineBG3
	str r0, [r5, #0x54]
	ldr r0, .L08051F6C @ =Pal_EfxDivineBG3
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08051F70 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08051F7E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L08051F74
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08051F7E
	.align 2, 0
.L08051F58: .4byte gEfxBgSemaphore
.L08051F5C: .4byte ProcScr_EfxDivineBG
.L08051F60: .4byte FrameArray_EfxDivineBG3
.L08051F64: .4byte TsaArray_EfxDivineBG3
.L08051F68: .4byte ImgArray_EfxDivineBG3
.L08051F6C: .4byte Pal_EfxDivineBG3
.L08051F70: .4byte gEkrDistanceType
.L08051F74:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08051F7E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxDivineBG_Loop
EfxDivineBG_Loop: @ 0x08051F88
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
	blt .L08051FC4
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
	b .L08051FE2
.L08051FC4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08051FE2
	bl SpellFx_ClearBG1
	ldr r1, .L08051FE8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
.L08051FE2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051FE8: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxDivineOBJ
NewEfxDivineOBJ: @ 0x08051FEC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805202C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052030 @ =ProcScr_EfxDivineOBJ
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08052034 @ =AnimScr_EfxDivineOBJ
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L08052038
	ldrh r0, [r6, #2]
	subs r0, #6
	b .L0805203C
	.align 2, 0
.L0805202C: .4byte gEfxBgSemaphore
.L08052030: .4byte ProcScr_EfxDivineOBJ
.L08052034: .4byte AnimScr_EfxDivineOBJ
.L08052038:
	ldrh r0, [r6, #2]
	adds r0, #6
.L0805203C:
	strh r0, [r6, #2]
	ldr r0, .L08052058 @ =Pal_EfxDivineOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805205C @ =Img_EfxDivineOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08052058: .4byte Pal_EfxDivineOBJ
.L0805205C: .4byte Img_EfxDivineOBJ

	thumb_func_start EfxDivineOBJ_Loop
EfxDivineOBJ_Loop: @ 0x08052060
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne .L08052086
	ldr r0, [r4, #0x60]
	bl BasRemove
	ldr r1, .L0805208C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08052086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805208C: .4byte gEfxBgSemaphore

	thumb_func_start StartSpellAnimAureola
StartSpellAnimAureola: @ 0x08052090
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L080520C8 @ =ProcScr_EfxAureola
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
.L080520C8: .4byte ProcScr_EfxAureola

	thumb_func_start EfxAureola_Loop
EfxAureola_Loop: @ 0x080520CC
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
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08052100
	ldr r0, [r4, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
.L08052100:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne .L08052158
	adds r0, r5, #0
	bl NewEfxAureolaBG
	ldr r3, .L08052154 @ =gDispIo
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
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r2, r8
	str r2, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl NewEfxALPHA
	adds r0, r5, #0
	movs r1, #0xaa
	bl NewEfxAureolaOBJ
	movs r0, #0x95
	lsls r0, r0, #1
	b .L08052162
	.align 2, 0
.L08052154: .4byte gDispIo
.L08052158:
	ldr r2, .L08052174 @ =0x0000011B
	adds r0, r6, r2
	cmp r1, r0
	bne .L0805217C
	ldr r0, .L08052178 @ =0x0000012B
.L08052162:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b .L0805222A
	.align 2, 0
.L08052174: .4byte 0x0000011B
.L08052178: .4byte 0x0000012B
.L0805217C:
	ldr r2, .L08052190 @ =0x0000013B
	adds r0, r6, r2
	cmp r1, r0
	bne .L08052194
	adds r0, r5, #0
	movs r1, #0x19
	bl NewEfxAureolaOBJ2
	b .L0805222A
	.align 2, 0
.L08052190: .4byte 0x0000013B
.L08052194:
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne .L080521C6
	adds r0, r5, #0
	movs r1, #0xc
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl func_fe6_08047610
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805222A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L0805222A
.L080521C6:
	movs r2, #0xad
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne .L08052212
	movs r0, #0x96
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxMagicQUAKE
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxAureolaBG2
	adds r0, r5, #0
	movs r1, #0x64
	bl NewEfxAureolaBG2COL
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	adds r0, r5, #0
	bl NewEfxAureolaOBJ3
	b .L0805222A
.L08052212:
	movs r2, #0xf5
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne .L0805222A
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r4, #0
	bl Proc_Break
.L0805222A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxAureolaBG
NewEfxAureolaBG: @ 0x08052238
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805228C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052290 @ =ProcScr_EfxAureolaBG
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08052294 @ =FrameArray_EfxAureolaBG
	str r0, [r5, #0x48]
	ldr r0, .L08052298 @ =TsaArray_EfxAureolaBG
	str r0, [r5, #0x4c]
	ldr r0, .L0805229C @ =ImgArray_EfxAureolaBG
	str r0, [r5, #0x54]
	ldr r0, .L080522A0 @ =Pal_EfxAureolaBG
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1Position
	bl SpellFx_SetSomeColorEffect
	ldr r0, .L080522A4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080522B4
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080522A8
	movs r0, #1
	movs r1, #0xf8
	b .L080522AC
	.align 2, 0
.L0805228C: .4byte gEfxBgSemaphore
.L08052290: .4byte ProcScr_EfxAureolaBG
.L08052294: .4byte FrameArray_EfxAureolaBG
.L08052298: .4byte TsaArray_EfxAureolaBG
.L0805229C: .4byte ImgArray_EfxAureolaBG
.L080522A0: .4byte Pal_EfxAureolaBG
.L080522A4: .4byte gEkrDistanceType
.L080522A8:
	movs r0, #1
	movs r1, #0x18
.L080522AC:
	movs r2, #0
	bl SetBgOffset
	b .L080522C8
.L080522B4:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne .L080522C8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
.L080522C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxAureolaBG_Loop
EfxAureolaBG_Loop: @ 0x080522D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805230A
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl SpellFx_WriteBgMapExt
	b .L08052328
.L0805230A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne .L08052328
	bl SpellFx_ClearBG1
	ldr r1, .L08052330 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r6, #0
	bl Proc_Break
.L08052328:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08052330: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxAureolaBG2
NewEfxAureolaBG2: @ 0x08052334
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805237C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052380 @ =ProcScr_EfxAureolaBG2
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	ldr r0, .L08052384 @ =Img_EfxAureolaBG2
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08052388 @ =Pal_EfxAureolaBG2
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805237C: .4byte gEfxBgSemaphore
.L08052380: .4byte ProcScr_EfxAureolaBG2
.L08052384: .4byte Img_EfxAureolaBG2
.L08052388: .4byte Pal_EfxAureolaBG2

	thumb_func_start EfxAureolaBG2_Loop
EfxAureolaBG2_Loop: @ 0x0805238C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r5, #0x2c]
	ands r0, r1
	cmp r0, #0
	beq .L080523E8
	ldrh r2, [r5, #0x32]
	subs r2, #0xc
	strh r2, [r5, #0x32]
	ldrh r1, [r5, #0x3a]
	adds r1, #0xc
	strh r1, [r5, #0x3a]
	ldr r0, .L080523D8 @ =gDispIo
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, .L080523DC @ =Tsa_EfxAureolaBG2
	ldr r4, .L080523E0 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L080523E4 @ =gBg1Tm
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	b .L0805241E
	.align 2, 0
.L080523D8: .4byte gDispIo
.L080523DC: .4byte Tsa_EfxAureolaBG2
.L080523E0: .4byte gEkrTsaBuffer
.L080523E4: .4byte gBg1Tm
.L080523E8:
	ldrh r2, [r5, #0x34]
	adds r2, #8
	strh r2, [r5, #0x34]
	ldrh r1, [r5, #0x3c]
	adds r1, #8
	strh r1, [r5, #0x3c]
	ldr r0, .L0805244C @ =gDispIo
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, .L08052450 @ =Tsa_EfxAureolaBG2
	ldr r4, .L08052454 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L08052458 @ =gBg1Tm
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
.L0805241E:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08052444
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, .L0805245C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08052444:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805244C: .4byte gDispIo
.L08052450: .4byte Tsa_EfxAureolaBG2
.L08052454: .4byte gEkrTsaBuffer
.L08052458: .4byte gBg1Tm
.L0805245C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxAureolaBG2COL
NewEfxAureolaBG2COL: @ 0x08052460
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08052498 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805249C @ =ProcScr_EfxAureolaBG2COL
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L080524A0 @ =FrameArray_EfxAureolaBG2COL
	str r1, [r0, #0x48]
	ldr r1, .L080524A4 @ =Pal_EfxAureolaBG2
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052498: .4byte gEfxBgSemaphore
.L0805249C: .4byte ProcScr_EfxAureolaBG2COL
.L080524A0: .4byte FrameArray_EfxAureolaBG2COL
.L080524A4: .4byte Pal_EfxAureolaBG2

	thumb_func_start EfxAureolaBG2COL_Loop
EfxAureolaBG2COL_Loop: @ 0x080524A8
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
	blt .L080524CC
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L080524CC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L080524EA
	ldr r1, .L080524F0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080524EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080524F0: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxAureolaOBJ
NewEfxAureolaOBJ: @ 0x080524F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08052534 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052538 @ =ProcScr_EfxAureolaOBJ
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #0xa
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, .L0805253C @ =Pal_EfxAureolaOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08052540 @ =Img_EfxAureolaOBJ
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052534: .4byte gEfxBgSemaphore
.L08052538: .4byte ProcScr_EfxAureolaOBJ
.L0805253C: .4byte Pal_EfxAureolaOBJ
.L08052540: .4byte Img_EfxAureolaOBJ

	thumb_func_start EfxAureolaOBJ_Loop
EfxAureolaOBJ_Loop: @ 0x08052544
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r3, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L0805256C
	ldr r1, .L08052568 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b .L08052592
	.align 2, 0
.L08052568: .4byte gEfxBgSemaphore
.L0805256C:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne .L08052592
	movs r0, #0
	strh r0, [r3, #0x30]
	movs r0, #0xa
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl NewEfxAureolaOBJCtrl
.L08052592:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxAureolaOBJCtrl
NewEfxAureolaOBJCtrl: @ 0x08052598
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, .L08052624 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052628 @ =ProcScr_EfxAureolaOBJCtrl
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x1e
	bl BanimSpawnRandB
	adds r0, #0x8c
	strh r0, [r4, #0x2e]
	movs r0, #0x1e
	bl BanimSpawnRandB
	adds r5, r0, #0
	movs r0, #0x1e
	bl BanimSpawnRandB
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x46
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x28
	strh r0, [r4, #0x34]
	ldr r0, .L0805262C @ =0x0000FFEC
	strh r0, [r4, #0x3a]
	movs r0, #0xa0
	strh r0, [r4, #0x3c]
	ldr r0, .L08052630 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne .L080525F8
	adds r0, r5, #0
	adds r0, #0x5e
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x40
	strh r0, [r4, #0x34]
.L080525F8:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #1
	bne .L08052610
	movs r0, #0xf0
	ldrh r2, [r4, #0x32]
	subs r1, r0, r2
	strh r1, [r4, #0x32]
	ldrh r1, [r4, #0x34]
	subs r0, r0, r1
	strh r0, [r4, #0x34]
.L08052610:
	movs r0, #2
	bl BanimSpawnRandB
	cmp r0, #0
	beq .L08052638
	cmp r0, #1
	beq .L08052640
	ldr r0, .L08052634 @ =AnimScr_EfxAureolaOBJCtrl3
	b .L08052642
	.align 2, 0
.L08052624: .4byte gEfxBgSemaphore
.L08052628: .4byte ProcScr_EfxAureolaOBJCtrl
.L0805262C: .4byte 0x0000FFEC
.L08052630: .4byte gEkrDistanceType
.L08052634: .4byte AnimScr_EfxAureolaOBJCtrl3
.L08052638:
	ldr r0, .L0805263C @ =AnimScr_EfxAureolaOBJCtrl1
	b .L08052642
	.align 2, 0
.L0805263C: .4byte AnimScr_EfxAureolaOBJCtrl1
.L08052640:
	ldr r0, .L08052660 @ =AnimScr_EfxAureolaOBJCtrl2
.L08052642:
	movs r1, #0x78
	bl BasCreate
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r1, #0
	bne .L08052668
	ldr r1, .L08052664 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_End
	b .L08052676
	.align 2, 0
.L08052660: .4byte AnimScr_EfxAureolaOBJCtrl2
.L08052664: .4byte gEfxBgSemaphore
.L08052668:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
.L08052676:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EfxAureolaOBJCtrl_Loop
EfxAureolaOBJCtrl_Loop: @ 0x0805267C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble .L080526AC
	ldr r1, .L080526A8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl BasRemove
	adds r0, r5, #0
	bl Proc_Break
	b .L080526EC
	.align 2, 0
.L080526A8: .4byte gEfxBgSemaphore
.L080526AC:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
.L080526EC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxAureolaOBJ2
NewEfxAureolaOBJ2: @ 0x080526F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L0805278C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052790 @ =ProcScr_EfxAureolaOBJ2
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	movs r0, #0x5b
	strh r0, [r5, #0x32]
	movs r0, #0x3f
	strh r0, [r5, #0x34]
	ldr r0, .L08052794 @ =0x0000FFF6
	strh r0, [r5, #0x3a]
	movs r0, #0x64
	strh r0, [r5, #0x3c]
	ldr r0, .L08052798 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805273A
	movs r0, #0x73
	strh r0, [r5, #0x32]
	movs r0, #0x57
	strh r0, [r5, #0x34]
.L0805273A:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #1
	bne .L08052752
	movs r0, #0xf0
	ldrh r2, [r5, #0x32]
	subs r1, r0, r2
	strh r1, [r5, #0x32]
	ldrh r1, [r5, #0x34]
	subs r0, r0, r1
	strh r0, [r5, #0x34]
.L08052752:
	ldr r3, .L0805279C @ =AnimScr_EfxAureolaOBJ2_1
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r3, .L080527A0 @ =AnimScr_EfxAureolaOBJ2_2
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x64]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805278C: .4byte gEfxBgSemaphore
.L08052790: .4byte ProcScr_EfxAureolaOBJ2
.L08052794: .4byte 0x0000FFF6
.L08052798: .4byte gEkrDistanceType
.L0805279C: .4byte AnimScr_EfxAureolaOBJ2_1
.L080527A0: .4byte AnimScr_EfxAureolaOBJ2_2

	thumb_func_start EfxAureolaOBJ2_Loop
EfxAureolaOBJ2_Loop: @ 0x080527A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, [r4, #0x60]
	ldr r5, [r4, #0x64]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r7, #0x34
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	movs r1, #0
	mov r8, r1
	strh r0, [r5, #2]
	strh r0, [r6, #2]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	movs r7, #0x3c
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	strh r0, [r6, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L0805280A
	mov r0, r8
	strh r0, [r4, #0x2c]
	ldr r0, .L08052840 @ =AnimScr_EfxAureolaOBJ2_2
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	mov r1, r8
	strh r1, [r6, #6]
.L0805280A:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08052834
	adds r0, r6, #0
	bl BasRemove
	adds r0, r5, #0
	bl BasRemove
	ldr r1, .L08052844 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08052834:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052840: .4byte AnimScr_EfxAureolaOBJ2_2
.L08052844: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxAureolaOBJ3
NewEfxAureolaOBJ3: @ 0x08052848
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08052870 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052874 @ =ProcScr_EfxAureolaOBJ3
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052870: .4byte gEfxBgSemaphore
.L08052874: .4byte ProcScr_EfxAureolaOBJ3

	thumb_func_start EfxAureolaOBJ3_Loop
EfxAureolaOBJ3_Loop: @ 0x08052878
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	bne .L080528A0
	ldr r1, .L0805289C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b .L080528C6
	.align 2, 0
.L0805289C: .4byte gEfxBgSemaphore
.L080528A0:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne .L080528C6
	movs r0, #0
	strh r0, [r3, #0x2e]
	movs r0, #1
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl NewEfxAureolaOBJ3Ctrl
.L080528C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxAureolaOBJ3Ctrl
NewEfxAureolaOBJ3Ctrl: @ 0x080528CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08052928 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805292C @ =ProcScr_EfxAureolaOBJ3Ctrl
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	movs r0, #0x78
	bl BanimSpawnRandB
	adds r1, r0, #0
	subs r1, #0x3c
	strh r1, [r5, #0x32]
	adds r0, #0xb4
	strh r0, [r5, #0x34]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #1
	adds r1, #0xc0
	strh r1, [r5, #0x3a]
	ldr r1, .L08052930 @ =0xFFFFFEB8
	adds r0, r0, r1
	strh r0, [r5, #0x3c]
	movs r0, #2
	bl BanimSpawnRandB
	cmp r0, #1
	bne .L08052938
	ldr r0, .L08052934 @ =AnimScr_EfxAureolaOBJ3_1
	b .L0805293A
	.align 2, 0
.L08052928: .4byte gEfxBgSemaphore
.L0805292C: .4byte ProcScr_EfxAureolaOBJ3Ctrl
.L08052930: .4byte 0xFFFFFEB8
.L08052934: .4byte AnimScr_EfxAureolaOBJ3_1
.L08052938:
	ldr r0, .L08052958 @ =AnimScr_EfxAureolaOBJ3_2
.L0805293A:
	movs r1, #0x78
	bl BasCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
	cmp r1, #0
	bne .L08052960
	ldr r1, .L0805295C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_End
	b .L0805296E
	.align 2, 0
.L08052958: .4byte AnimScr_EfxAureolaOBJ3_2
.L0805295C: .4byte gEfxBgSemaphore
.L08052960:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
.L0805296E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EfxAureolaOBJ3Ctrl_Loop
EfxAureolaOBJ3Ctrl_Loop: @ 0x08052974
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble .L080529A4
	ldr r1, .L080529A0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl BasRemove
	adds r0, r5, #0
	bl Proc_Break
	b .L080529E4
	.align 2, 0
.L080529A0: .4byte gEfxBgSemaphore
.L080529A4:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
.L080529E4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartSpellAnimApocalypse
StartSpellAnimApocalypse: @ 0x080529EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08052A24 @ =ProcScr_EfxApocalypse
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
.L08052A24: .4byte ProcScr_EfxApocalypse

	thumb_func_start EfxApocalypse_Loop
EfxApocalypse_Loop: @ 0x08052A28
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08052A56
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
.L08052A56:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08052AD4
	ldr r4, .L08052AC4 @ =0x000001D1
	adds r0, r5, #0
	adds r1, r4, #0
	bl NewEfxApocalypseBG
	adds r0, r5, #0
	bl NewEfxApocalypseBGCOL
	adds r0, r5, #0
	bl NewEfxApocalypseBGCtrl
	ldr r1, .L08052AC8 @ =0x0000018B
	adds r0, r5, #0
	movs r2, #0xa
	bl NewEfxApocalypseBgFlash1
	ldr r1, .L08052ACC @ =0x0000019F
	adds r0, r5, #0
	movs r2, #0x14
	bl NewEfxApocalypseBgFlash2
	adds r0, r5, #0
	bl NewEfxApocalypseOBJ
	adds r0, r5, #0
	adds r1, r4, #0
	bl NewEfxApocalypseBGCOL2
	movs r0, #3
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x14
	movs r3, #0x80
	bl NewEfxRestRST
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x8c
	bl NewEfxApocalypseDummy
	ldr r2, .L08052AD0 @ =EfxRestWINH_DefaultHblank
	adds r0, r5, #0
	adds r1, r4, #0
	bl NewEfxRestWINH_
	movs r0, #0x82
	lsls r0, r0, #1
	b .L08052B38
	.align 2, 0
.L08052AC4: .4byte 0x000001D1
.L08052AC8: .4byte 0x0000018B
.L08052ACC: .4byte 0x0000019F
.L08052AD0: .4byte EfxRestWINH_DefaultHblank
.L08052AD4:
	adds r0, r4, #0
	adds r0, #0x92
	cmp r1, r0
	bne .L08052AE4
	ldr r0, .L08052AE0 @ =0x00000105
	b .L08052B38
	.align 2, 0
.L08052AE0: .4byte 0x00000105
.L08052AE4:
	movs r2, #0xe6
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052AFA
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x14
	bl NewEfxWhiteIN
	b .L08052B9A
.L08052AFA:
	ldr r2, .L08052B48 @ =0x000001D5
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052B4C
	adds r0, r5, #0
	movs r1, #0xa0
	bl NewEfxApocalypseBG2
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x6e
	movs r2, #0x28
	movs r3, #0x10
	bl NewEfxALPHA
	adds r0, r5, #0
	movs r1, #0x8c
	movs r2, #0x18
	bl NewEfxApocalypseOBJ2
	adds r0, r5, #0
	movs r1, #0x3c
	bl NewEfxApocalypseOBJ3
	adds r0, r5, #0
	movs r1, #0x5a
	bl NewEfxMagicQUAKE
	movs r0, #0x83
	lsls r0, r0, #1
.L08052B38:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b .L08052B9A
	.align 2, 0
.L08052B48: .4byte 0x000001D5
.L08052B4C:
	ldr r2, .L08052B78 @ =0x0000020D
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052B7C
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
	bne .L08052B9A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b .L08052B9A
	.align 2, 0
.L08052B78: .4byte 0x0000020D
.L08052B7C:
	ldr r2, .L08052BA4 @ =0x00000271
	adds r0, r4, r2
	cmp r1, r0
	beq .L08052B9A
	adds r2, #0xa
	adds r0, r4, r2
	cmp r1, r0
	bne .L08052B9A
	bl SpellFx_Finish
	bl EndEfxSpellCastAsync
	adds r0, r6, #0
	bl Proc_Break
.L08052B9A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052BA4: .4byte 0x00000271

	thumb_func_start NewEfxApocalypseBG
NewEfxApocalypseBG: @ 0x08052BA8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08052C18 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052C1C @ =ProcScr_EfxApocalypseBG
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08052C20 @ =gUnk_0817AC4C
	movs r1, #0x84
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, .L08052C24 @ =gUnk_0817B438
	ldr r4, .L08052C28 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L08052C2C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	bl SpellFx_SetSomeColorEffect
	ldr r2, .L08052C30 @ =gDispIo
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
.L08052C18: .4byte gEfxBgSemaphore
.L08052C1C: .4byte ProcScr_EfxApocalypseBG
.L08052C20: .4byte gUnk_0817AC4C
.L08052C24: .4byte gUnk_0817B438
.L08052C28: .4byte gEkrTsaBuffer
.L08052C2C: .4byte gBg1Tm
.L08052C30: .4byte gDispIo

	thumb_func_start EfxApocalypseBG_Loop
EfxApocalypseBG_Loop: @ 0x08052C34
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne .L08052C5E
	bl SpellFx_ClearBG1
	ldr r1, .L08052C64 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
.L08052C5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C64: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseBGCtrl
NewEfxApocalypseBGCtrl: @ 0x08052C68
	push {r4, lr}
	ldr r1, .L08052C94 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052C98 @ =ProcScr_EfxApocalypseBGCtrl
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C94: .4byte gEfxBgSemaphore
.L08052C98: .4byte ProcScr_EfxApocalypseBGCtrl

	thumb_func_start EfxApocalypseBGCtrl_Loop
EfxApocalypseBGCtrl_Loop: @ 0x08052C9C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x30
	ldrsh r3, [r6, r0]
	movs r0, #0x96
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xff
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r6, #0x30]
	movs r3, #0x30
	ldrsh r0, [r6, r3]
	cmp r0, #0x96
	bgt .L08052CC6
	adds r0, r1, #1
	strh r0, [r6, #0x30]
.L08052CC6:
	ldrh r3, [r6, #0x2e]
	movs r1, #0xff
	ands r1, r3
	ldr r5, .L08052D34 @ =PosArray_EfxApocalypseBGCtrl
	lsls r0, r1, #1
	adds r0, r0, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r0, [r0]
	muls r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldr r4, .L08052D38 @ =gDispIo
	strh r0, [r4, #0x20]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	adds r0, r1, #0
	muls r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, #0x10
	strh r0, [r4, #0x22]
	adds r3, #2
	strh r3, [r6, #0x2e]
	movs r0, #1
	ldrh r1, [r6, #0x2c]
	ands r0, r1
	cmp r0, #0
	bne .L08052D0E
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	bl SetBgOffset
.L08052D0E:
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x11
	cmp r0, r1
	bne .L08052D2C
	ldr r1, .L08052D3C @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L08052D2C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08052D34: .4byte PosArray_EfxApocalypseBGCtrl
.L08052D38: .4byte gDispIo
.L08052D3C: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseBGCOL
NewEfxApocalypseBGCOL: @ 0x08052D40
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08052D7C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052D80 @ =ProcScr_EfxApocalypseBGCOL
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x10
	strh r1, [r0, #0x2e]
	ldr r0, .L08052D84 @ =Pal_EfxApocalypse_0817B418
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08052D88 @ =gPal
	movs r1, #1
	movs r2, #1
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052D7C: .4byte gEfxBgSemaphore
.L08052D80: .4byte ProcScr_EfxApocalypseBGCOL
.L08052D84: .4byte Pal_EfxApocalypse_0817B418
.L08052D88: .4byte gPal

	thumb_func_start EfxApocalypseBGCOL_Loop
EfxApocalypseBGCOL_Loop: @ 0x08052D8C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L08052DE8 @ =Pal_EfxApocalypse_0817B418
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08052DEC @ =gPal
	movs r1, #1
	movs r2, #1
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble .L08052DDE
	ldr r1, .L08052DF0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L08052DDE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052DE8: .4byte Pal_EfxApocalypse_0817B418
.L08052DEC: .4byte gPal
.L08052DF0: .4byte gEfxBgSemaphore

	thumb_func_start NewEfxApocalypseOBJ
NewEfxApocalypseOBJ: @ 0x08052DF4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
.L08052DFA:
	ldr r0, .L08052E24 @ =ProcScr_EfxApocalypseOBJ
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls .L08052DFA
	ldr r0, .L08052E28 @ =Pal_EfxApocalypseOBJ
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08052E2C @ =Img_EfxApocalypseOBJ
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052E24: .4byte ProcScr_EfxApocalypseOBJ
.L08052E28: .4byte Pal_EfxApocalypseOBJ
.L08052E2C: .4byte Img_EfxApocalypseOBJ

	thumb_func_start EfxApocalypseOBJ_Loop1
EfxApocalypseOBJ_Loop1: @ 0x08052E30
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08052E90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	lsls r1, r0, #0xd
	strh r1, [r4, #0x30]
	ldr r1, .L08052E94 @ =AnimArray_EfxApocalypseOBJ
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, .L08052E98 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	movs r0, #0x78
	strh r0, [r4, #0x32]
	movs r0, #0x40
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052E90: .4byte gEfxBgSemaphore
.L08052E94: .4byte AnimArray_EfxApocalypseOBJ
.L08052E98: .4byte 0x0000F3FF

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

	thumb_func_start StartSpellAnimEclipse
StartSpellAnimEclipse: @ 0x08053764
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L0805379C @ =ProcScr_EfxHazymoon
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
.L0805379C: .4byte ProcScr_EfxHazymoon

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
	ldr r3, .L08053B5C @ =AnimScr_ManaketeFlame
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
.L08053B5C: .4byte AnimScr_ManaketeFlame
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
	ldr r1, .L08054114 @ =PalArray_EfxFenrirBGCOL
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
.L08054114: .4byte PalArray_EfxFenrirBGCOL

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
	ldr r0, .L08054BEC @ =TsaArray_EfxLiveBG_A_L
	str r0, [r5, #0x4c]
	ldr r0, .L08054BF0 @ =TsaArray_EfxLiveBG_A_R
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
.L08054BEC: .4byte TsaArray_EfxLiveBG_A_L
.L08054BF0: .4byte TsaArray_EfxLiveBG_A_R
.L08054BF4: .4byte Img_EfxLiveBG
.L08054BF8:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08054C30 @ =FrameArray1_EfxLiveBG
	str r0, [r5, #0x48]
	ldr r0, .L08054C34 @ =TsaArray_EfxLiveBG_B_L
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054C38 @ =TsaArray_EfxLiveBG_B_R
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
.L08054C34: .4byte TsaArray_EfxLiveBG_B_L
.L08054C38: .4byte TsaArray_EfxLiveBG_B_R
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
	ldr r0, .L08054CA8 @ =TsaArray_EfxLiveBG_A_L
	str r0, [r5, #0x4c]
	ldr r0, .L08054CAC @ =TsaArray_EfxLiveBG_A_R
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
.L08054CA8: .4byte TsaArray_EfxLiveBG_A_L
.L08054CAC: .4byte TsaArray_EfxLiveBG_A_R
.L08054CB0: .4byte Img_EfxLiveBG
.L08054CB4:
	ldr r0, .L08054CE4 @ =FrameArray2_EfxLiveBG
	str r0, [r5, #0x48]
	ldr r0, .L08054CE8 @ =TsaArray_EfxLiveBG_B_L
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08054CEC @ =TsaArray_EfxLiveBG_B_R
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
.L08054CE8: .4byte TsaArray_EfxLiveBG_B_L
.L08054CEC: .4byte TsaArray_EfxLiveBG_B_R
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
	ldr r0, .L08054DC8 @ =PalArray1_EfxLiveBGCOL
	b .L08054DDA
	.align 2, 0
.L08054DC4: .4byte FrameArray4_EfxLiveBGCOL
.L08054DC8: .4byte PalArray1_EfxLiveBGCOL
.L08054DCC:
	cmp r5, #1
	bne .L08054DD8
	ldr r0, .L08054DD4 @ =PalArray2_EfxLiveBGCOL
	b .L08054DDA
	.align 2, 0
.L08054DD4: .4byte PalArray2_EfxLiveBGCOL
.L08054DD8:
	ldr r0, .L08054DE4 @ =PalArray3_EfxLiveBGCOL
.L08054DDA:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054DE4: .4byte PalArray3_EfxLiveBGCOL

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
	ldr r0, .L08054E38 @ =PalArray1_EfxLiveBGCOL
	b .L08054E4A
	.align 2, 0
.L08054E34: .4byte FrameArray4_EfxLiveBGCOL
.L08054E38: .4byte PalArray1_EfxLiveBGCOL
.L08054E3C:
	cmp r5, #1
	bne .L08054E48
	ldr r0, .L08054E44 @ =PalArray2_EfxLiveBGCOL
	b .L08054E4A
	.align 2, 0
.L08054E44: .4byte PalArray2_EfxLiveBGCOL
.L08054E48:
	ldr r0, .L08054E54 @ =PalArray3_EfxLiveBGCOL
.L08054E4A:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054E54: .4byte PalArray3_EfxLiveBGCOL

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
	ldr r0, .L08055120 @ =gUnk_085D2F2C
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
.L08055120: .4byte gUnk_085D2F2C
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

	thumb_func_start func_fe6_08055134
func_fe6_08055134: @ 0x08055134
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
	ldr r0, .L0805517C @ =gUnk_085F1FC0
	mov r8, r0
	ldr r7, .L08055180 @ =gUnk_085F35C0
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
.L0805517C: .4byte gUnk_085F1FC0
.L08055180: .4byte gUnk_085F35C0
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
	ldr r2, .L080551BC @ =gUnk_085F2034
	mov r8, r2
	ldr r7, .L080551C0 @ =gUnk_085F3634
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
.L080551BC: .4byte gUnk_085F2034
.L080551C0: .4byte gUnk_085F3634
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

	thumb_func_start func_fe6_08055200
func_fe6_08055200: @ 0x08055200
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
	ldr r0, .L08055260 @ =gUnk_085D2F4C
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
.L08055260: .4byte gUnk_085D2F4C

	thumb_func_start StartSpellAnimLatona
StartSpellAnimLatona: @ 0x08055264
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L08055290 @ =gUnk_085D2F4C
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
.L08055290: .4byte gUnk_085D2F4C

	thumb_func_start func_fe6_08055294
func_fe6_08055294: @ 0x08055294
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
	bl func_fe6_08055364
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl func_fe6_08055434
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
	bl func_fe6_080554C8
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl func_fe6_08055628
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

	thumb_func_start func_fe6_08055364
func_fe6_08055364: @ 0x08055364
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080553A0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080553A4 @ =gUnk_085D2F64
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080553A8 @ =gUnk_0811A9A8
	str r1, [r0, #0x48]
	ldr r1, .L080553AC @ =gUnk_085D2F7C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L080553B0 @ =TsaArray_EfxLiveBG_B_R
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080553A0: .4byte gEfxBgSemaphore
.L080553A4: .4byte gUnk_085D2F64
.L080553A8: .4byte gUnk_0811A9A8
.L080553AC: .4byte gUnk_085D2F7C
.L080553B0: .4byte TsaArray_EfxLiveBG_B_R

	thumb_func_start func_fe6_080553B4
func_fe6_080553B4: @ 0x080553B4
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
	ldr r0, .L08055404 @ =gUnk_0811A9BA
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, .L08055408 @ =gUnk_0811A9C2
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl PlaySFX
	b .L0805542A
	.align 2, 0
.L08055404: .4byte gUnk_0811A9BA
.L08055408: .4byte gUnk_0811A9C2
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

	thumb_func_start func_fe6_08055434
func_fe6_08055434: @ 0x08055434
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08055460 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055464 @ =gUnk_085D2F8C
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L08055468 @ =gUnk_0811A9CA
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08055470
	ldr r0, .L0805546C @ =gUnk_081AE88C
	b .L08055472
	.align 2, 0
.L08055460: .4byte gEfxBgSemaphore
.L08055464: .4byte gUnk_085D2F8C
.L08055468: .4byte gUnk_0811A9CA
.L0805546C: .4byte gUnk_081AE88C
.L08055470:
	ldr r0, .L0805547C @ =gUnk_081AEA8C
.L08055472:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805547C: .4byte gUnk_081AEA8C

	thumb_func_start func_fe6_08055480
func_fe6_08055480: @ 0x08055480
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

	thumb_func_start func_fe6_080554C8
func_fe6_080554C8: @ 0x080554C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0805555C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055560 @ =gUnk_085D2FAC
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08055564 @ =gUnk_0811AACC
	str r1, [r0, #0x48]
	ldr r1, .L08055568 @ =gUnk_085D2FC4
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
	bl func_fe6_08047C1C
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
.L08055560: .4byte gUnk_085D2FAC
.L08055564: .4byte gUnk_0811AACC
.L08055568: .4byte gUnk_085D2FC4
.L0805556C: .4byte Img_EfxLiveBG
.L08055570: .4byte gDispIo
.L08055574: .4byte 0x0000F3FF
.L08055578: .4byte 0x0000FFE0
.L0805557C: .4byte 0x0000E0FF

	thumb_func_start func_fe6_08055580
func_fe6_08055580: @ 0x08055580
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

	thumb_func_start func_fe6_08055628
func_fe6_08055628: @ 0x08055628
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08055654 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055658 @ =gUnk_085D2FC8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L0805565C @ =gUnk_0811AAD2
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08055664
	ldr r0, .L08055660 @ =PalArray1_EfxLiveBGCOL
	b .L08055666
	.align 2, 0
.L08055654: .4byte gEfxBgSemaphore
.L08055658: .4byte gUnk_085D2FC8
.L0805565C: .4byte gUnk_0811AAD2
.L08055660: .4byte PalArray1_EfxLiveBGCOL
.L08055664:
	ldr r0, .L08055670 @ =gUnk_081AEC8C
.L08055666:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055670: .4byte gUnk_081AEC8C

	thumb_func_start func_fe6_08055674
func_fe6_08055674: @ 0x08055674
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
	ldr r0, .L080556F4 @ =gUnk_085D2FE8
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
.L080556F4: .4byte gUnk_085D2FE8

	thumb_func_start func_fe6_080556F8
func_fe6_080556F8: @ 0x080556F8
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
	bl func_fe6_0805581C
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
	bl func_fe6_080558D4
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

	thumb_func_start func_fe6_0805581C
func_fe6_0805581C: @ 0x0805581C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08055858 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805585C @ =gUnk_085D3000
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08055860 @ =gUnk_0811ABB0
	str r1, [r0, #0x48]
	ldr r1, .L08055864 @ =gUnk_085D3018
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08055868 @ =gUnk_085D304C
	str r1, [r0, #0x54]
	ldr r0, .L0805586C @ =Pal_Unk_081B1710
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055858: .4byte gEfxBgSemaphore
.L0805585C: .4byte gUnk_085D3000
.L08055860: .4byte gUnk_0811ABB0
.L08055864: .4byte gUnk_085D3018
.L08055868: .4byte gUnk_085D304C
.L0805586C: .4byte Pal_Unk_081B1710

	thumb_func_start func_fe6_08055870
func_fe6_08055870: @ 0x08055870
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

	thumb_func_start func_fe6_080558D4
func_fe6_080558D4: @ 0x080558D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08055910 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055914 @ =gUnk_085D3080
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, .L08055918 @ =gUnk_085F63A8
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
.L08055914: .4byte gUnk_085D3080
.L08055918: .4byte gUnk_085F63A8
.L0805591C:
	ldrh r0, [r6, #2]
	adds r0, #8
.L08055920:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, .L08055944 @ =gUnk_081B7650
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055948 @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08055944: .4byte gUnk_081B7650
.L08055948: .4byte gUnk_081B7468

	thumb_func_start func_fe6_0805594C
func_fe6_0805594C: @ 0x0805594C
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
	ldr r0, .L08055994 @ =gUnk_085D30A0
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
.L08055994: .4byte gUnk_085D30A0

	thumb_func_start func_fe6_08055998
func_fe6_08055998: @ 0x08055998
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
	bl func_fe6_08055B84
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
	bl func_fe6_08055AA0
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
	bl func_fe6_0805BD8C
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

	thumb_func_start func_fe6_08055AA0
func_fe6_08055AA0: @ 0x08055AA0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08055B00 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055B04 @ =gUnk_085D30B8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08055B08 @ =gUnk_0811ABE6
	str r0, [r5, #0x48]
	ldr r0, .L08055B0C @ =gUnk_085D30D0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08055B10 @ =gUnk_081B4254
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08055B14 @ =gUnk_081B2348
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
.L08055B04: .4byte gUnk_085D30B8
.L08055B08: .4byte gUnk_0811ABE6
.L08055B0C: .4byte gUnk_085D30D0
.L08055B10: .4byte gUnk_081B4254
.L08055B14: .4byte gUnk_081B2348
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

	thumb_func_start func_fe6_08055B2C
func_fe6_08055B2C: @ 0x08055B2C
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

	thumb_func_start func_fe6_08055B84
func_fe6_08055B84: @ 0x08055B84
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055BC8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055BCC @ =gUnk_085D3118
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055BD0 @ =gUnk_085F6674
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055BD4 @ =gUnk_081B4254
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055BD8 @ =gUnk_081B3D34
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055BC8: .4byte gEfxBgSemaphore
.L08055BCC: .4byte gUnk_085D3118
.L08055BD0: .4byte gUnk_085F6674
.L08055BD4: .4byte gUnk_081B4254
.L08055BD8: .4byte gUnk_081B3D34

	thumb_func_start func_fe6_08055BDC
func_fe6_08055BDC: @ 0x08055BDC
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
	ldr r0, .L08055C2C @ =gUnk_085D3138
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
.L08055C2C: .4byte gUnk_085D3138

	thumb_func_start func_fe6_08055C30
func_fe6_08055C30: @ 0x08055C30
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
	bl func_fe6_08055E14
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
	bl func_fe6_08055E6C
	adds r0, r5, #0
	bl func_fe6_08055ED0
	ldr r0, [r4, #0x5c]
	bl func_fe6_08055D30
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

	thumb_func_start func_fe6_08055D30
func_fe6_08055D30: @ 0x08055D30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08055D90 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055D94 @ =gUnk_085D3150
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08055D98 @ =gUnk_0811AC30
	str r0, [r5, #0x48]
	ldr r0, .L08055D9C @ =gUnk_085D3168
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08055DA0 @ =gUnk_081B6688
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08055DA4 @ =gUnk_081B57BC
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
.L08055D94: .4byte gUnk_085D3150
.L08055D98: .4byte gUnk_0811AC30
.L08055D9C: .4byte gUnk_085D3168
.L08055DA0: .4byte gUnk_081B6688
.L08055DA4: .4byte gUnk_081B57BC
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

	thumb_func_start func_fe6_08055DBC
func_fe6_08055DBC: @ 0x08055DBC
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

	thumb_func_start func_fe6_08055E14
func_fe6_08055E14: @ 0x08055E14
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055E58 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055E5C @ =gUnk_085D31A8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055E60 @ =gUnk_085FE544
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08055E64 @ =gUnk_081B7650
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08055E68 @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08055E58: .4byte gEfxBgSemaphore
.L08055E5C: .4byte gUnk_085D31A8
.L08055E60: .4byte gUnk_085FE544
.L08055E64: .4byte gUnk_081B7650
.L08055E68: .4byte gUnk_081B7468

	thumb_func_start func_fe6_08055E6C
func_fe6_08055E6C: @ 0x08055E6C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08055EB4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055EB8 @ =gUnk_085D31C8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08055EBC @ =gUnk_085FE3C4
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
.L08055EB8: .4byte gUnk_085D31C8
.L08055EBC: .4byte gUnk_085FE3C4

	thumb_func_start func_fe6_08055EC0
func_fe6_08055EC0: @ 0x08055EC0
	ldr r1, .L08055ECC @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055ECC: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_08055ED0
func_fe6_08055ED0: @ 0x08055ED0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08055EEC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08055EF0 @ =gUnk_085D31E8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055EEC: .4byte gEfxBgSemaphore
.L08055EF0: .4byte gUnk_085D31E8

	thumb_func_start func_fe6_08055EF4
func_fe6_08055EF4: @ 0x08055EF4
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

	thumb_func_start func_fe6_08055F14
func_fe6_08055F14: @ 0x08055F14
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
	ldr r0, .L08055F5C @ =gUnk_085D3230
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
.L08055F5C: .4byte gUnk_085D3230

	thumb_func_start func_fe6_08055F60
func_fe6_08055F60: @ 0x08055F60
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
	bl func_fe6_08056080
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
	bl func_fe6_08056138
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

	thumb_func_start func_fe6_08056080
func_fe6_08056080: @ 0x08056080
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080560BC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080560C0 @ =gUnk_085D3248
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080560C4 @ =gUnk_0811AD32
	str r1, [r0, #0x48]
	ldr r1, .L080560C8 @ =gUnk_085D3260
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080560CC @ =gUnk_085D3294
	str r1, [r0, #0x54]
	ldr r0, .L080560D0 @ =gUnk_081B4274
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080560BC: .4byte gEfxBgSemaphore
.L080560C0: .4byte gUnk_085D3248
.L080560C4: .4byte gUnk_0811AD32
.L080560C8: .4byte gUnk_085D3260
.L080560CC: .4byte gUnk_085D3294
.L080560D0: .4byte gUnk_081B4274

	thumb_func_start func_fe6_080560D4
func_fe6_080560D4: @ 0x080560D4
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

	thumb_func_start func_fe6_08056138
func_fe6_08056138: @ 0x08056138
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805617C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056180 @ =gUnk_085D32C8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08056184 @ =gUnk_085F9358
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L08056188 @ =gUnk_081B7670
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805618C @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805617C: .4byte gEfxBgSemaphore
.L08056180: .4byte gUnk_085D32C8
.L08056184: .4byte gUnk_085F9358
.L08056188: .4byte gUnk_081B7670
.L0805618C: .4byte gUnk_081B7468

	thumb_func_start func_fe6_08056190
func_fe6_08056190: @ 0x08056190
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
	ldr r0, .L080561D8 @ =gUnk_085D32E8
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
.L080561D8: .4byte gUnk_085D32E8

	thumb_func_start func_fe6_080561DC
func_fe6_080561DC: @ 0x080561DC
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
	bl func_fe6_080564E4
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_fe6_080562C0
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_fe6_08056444
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

	thumb_func_start func_fe6_080562C0
func_fe6_080562C0: @ 0x080562C0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L080563B8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080563BC @ =gUnk_085D3300
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, .L080563C0 @ =gUnk_081B7690
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L080563C4 @ =gUnk_081B4E9C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L080563C8 @ =gUnk_081B4F9C
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
.L080563BC: .4byte gUnk_085D3300
.L080563C0: .4byte gUnk_081B7690
.L080563C4: .4byte gUnk_081B4E9C
.L080563C8: .4byte gUnk_081B4F9C
.L080563CC: .4byte gBg1Tm
.L080563D0: .4byte gDispIo
.L080563D4: .4byte 0x0000FFE0
.L080563D8: .4byte 0x0000E0FF
.L080563DC: .4byte 0x0000F3FF

	thumb_func_start func_fe6_080563E0
func_fe6_080563E0: @ 0x080563E0
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

	thumb_func_start func_fe6_08056444
func_fe6_08056444: @ 0x08056444
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08056468 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805646C @ =gUnk_085D3318
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
.L0805646C: .4byte gUnk_085D3318

	thumb_func_start func_fe6_08056470
func_fe6_08056470: @ 0x08056470
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

	thumb_func_start func_fe6_080564D4
func_fe6_080564D4: @ 0x080564D4
	ldr r1, .L080564E0 @ =gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L080564E0: .4byte gEfxBgSemaphore

	thumb_func_start func_fe6_080564E4
func_fe6_080564E4: @ 0x080564E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805652C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08056530 @ =gUnk_085D3338
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, .L08056534 @ =AnimScr_ManaketeFlame
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
.L08056530: .4byte gUnk_085D3338
.L08056534: .4byte AnimScr_ManaketeFlame
.L08056538: .4byte 0x0000F3FF

	thumb_func_start func_fe6_0805653C
func_fe6_0805653C: @ 0x0805653C
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

	thumb_func_start func_fe6_08056554
func_fe6_08056554: @ 0x08056554
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056584 @ =gUnk_085FEAF8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056588 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805658C @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056584: .4byte gUnk_085FEAF8
.L08056588: .4byte gUnk_081B7F68
.L0805658C: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056590
func_fe6_08056590: @ 0x08056590
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080565C0 @ =gUnk_085FEB0C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080565C4 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080565C8 @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080565C0: .4byte gUnk_085FEB0C
.L080565C4: .4byte gUnk_081B7F68
.L080565C8: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_080565CC
func_fe6_080565CC: @ 0x080565CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080565FC @ =gUnk_085FEB20
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056600 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056604 @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080565FC: .4byte gUnk_085FEB20
.L08056600: .4byte gUnk_081B7F68
.L08056604: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056608
func_fe6_08056608: @ 0x08056608
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056638 @ =gUnk_085FEB34
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805663C @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056640 @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056638: .4byte gUnk_085FEB34
.L0805663C: .4byte gUnk_081B7F68
.L08056640: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056644
func_fe6_08056644: @ 0x08056644
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056674 @ =gUnk_085FEB48
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056678 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805667C @ =gUnk_081B76B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056674: .4byte gUnk_085FEB48
.L08056678: .4byte gUnk_081B7F68
.L0805667C: .4byte gUnk_081B76B0

	thumb_func_start func_fe6_08056680
func_fe6_08056680: @ 0x08056680
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080566B0 @ =gUnk_085FEEBC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080566B4 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080566B8 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080566B0: .4byte gUnk_085FEEBC
.L080566B4: .4byte gUnk_081B7F68
.L080566B8: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_080566BC
func_fe6_080566BC: @ 0x080566BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080566EC @ =gUnk_085FEEC8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080566F0 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080566F4 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080566EC: .4byte gUnk_085FEEC8
.L080566F0: .4byte gUnk_081B7F68
.L080566F4: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_080566F8
func_fe6_080566F8: @ 0x080566F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056728 @ =gUnk_085FEED4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805672C @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08056730 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056728: .4byte gUnk_085FEED4
.L0805672C: .4byte gUnk_081B7F68
.L08056730: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_08056734
func_fe6_08056734: @ 0x08056734
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08056764 @ =gUnk_085FEEE0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08056768 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805676C @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056764: .4byte gUnk_085FEEE0
.L08056768: .4byte gUnk_081B7F68
.L0805676C: .4byte gUnk_081B7B48

	thumb_func_start func_fe6_08056770
func_fe6_08056770: @ 0x08056770
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080567A0 @ =gUnk_085FEEEC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080567A4 @ =gUnk_081B7F68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080567A8 @ =gUnk_081B7B48
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080567A0: .4byte gUnk_085FEEEC
.L080567A4: .4byte gUnk_081B7F68
.L080567A8: .4byte gUnk_081B7B48

	thumb_func_start StartSpellAnimBarrier
StartSpellAnimBarrier: @ 0x080567AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, .L080567E4 @ =gUnk_085D33F0
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
.L080567E4: .4byte gUnk_085D33F0

	thumb_func_start func_fe6_080567E8
func_fe6_080567E8: @ 0x080567E8
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
	bl func_fe6_080568B4
	adds r0, r4, #0
	bl func_fe6_08056968
	adds r0, r4, #0
	bl func_fe6_080569C0
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
	bl func_fe6_080569C0
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

	thumb_func_start func_fe6_080568B4
func_fe6_080568B4: @ 0x080568B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080568F8 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080568FC @ =gUnk_085D3408
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08056900 @ =gUnk_0811AD68
	str r1, [r0, #0x48]
	ldr r1, .L08056904 @ =gUnk_085D3420
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08056908 @ =gUnk_081B8934
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0805690C @ =gUnk_081B80A8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080568F8: .4byte gEfxBgSemaphore
.L080568FC: .4byte gUnk_085D3408
.L08056900: .4byte gUnk_0811AD68
.L08056904: .4byte gUnk_085D3420
.L08056908: .4byte gUnk_081B8934
.L0805690C: .4byte gUnk_081B80A8

	thumb_func_start func_fe6_08056910
func_fe6_08056910: @ 0x08056910
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

	thumb_func_start func_fe6_08056968
func_fe6_08056968: @ 0x08056968
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080569AC @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080569B0 @ =gUnk_085D3434
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L080569B4 @ =gUnk_08602FAC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, .L080569B8 @ =gUnk_081B8E44
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080569BC @ =gUnk_081B7468
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080569AC: .4byte gEfxBgSemaphore
.L080569B0: .4byte gUnk_085D3434
.L080569B4: .4byte gUnk_08602FAC
.L080569B8: .4byte gUnk_081B8E44
.L080569BC: .4byte gUnk_081B7468

	thumb_func_start func_fe6_080569C0
func_fe6_080569C0: @ 0x080569C0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080569F4 @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080569F8 @ =gUnk_085D3454
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L080569FC @ =gUnk_086030FC
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
.L080569F8: .4byte gUnk_085D3454
.L080569FC: .4byte gUnk_086030FC

	thumb_func_start func_fe6_08056A00
func_fe6_08056A00: @ 0x08056A00
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
