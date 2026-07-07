	.include "macro.inc"

	.syntax unified


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
