	.include "macro.inc"

	.syntax unified


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
