	.include "macro.inc"

	.syntax unified

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
	ldr r0, .L080516D4 @ =ProcScr_EfxForblazeBGCtrl1
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L080516D0: .4byte gEfxBgSemaphore
.L080516D4: .4byte ProcScr_EfxForblazeBGCtrl1

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
	ldr r0, .L08051B58 @ =AnimScr_EfxForblazeOBJ6
	b .L08051B6E
	.align 2, 0
.L08051B58: .4byte AnimScr_EfxForblazeOBJ6
.L08051B5C:
	ldr r0, .L08051B60 @ =AnimScr_EfxForblazeOBJ5
	b .L08051B6E
	.align 2, 0
.L08051B60: .4byte AnimScr_EfxForblazeOBJ5
.L08051B64:
	ldr r0, .L08051B68 @ =AnimScr_EfxForblazeOBJ4
	b .L08051B6E
	.align 2, 0
.L08051B68: .4byte AnimScr_EfxForblazeOBJ4
.L08051B6C:
	ldr r0, .L08051B8C @ =AnimScr_EfxForblazeOBJ3
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
.L08051B8C: .4byte AnimScr_EfxForblazeOBJ3
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
