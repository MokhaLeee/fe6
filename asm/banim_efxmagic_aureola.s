	.include "macro.inc"

	.syntax unified

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
