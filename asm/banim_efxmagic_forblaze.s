	.include "macro.inc"

	.syntax unified

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
