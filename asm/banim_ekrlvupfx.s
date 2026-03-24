	.include "macro.inc"

	.syntax unified

	.section .data

	.global ProcScr_Ekrlvup_08606254
ProcScr_Ekrlvup_08606254: @ 08606254
	.incbin "fe6-base.gba", 0x606254, (0x60626C - 0x606254) @ length: 0018

	.global gUnk_0860626C
gUnk_0860626C: @ 0860626C
	.incbin "fe6-base.gba", 0x60626C, (0x60628C - 0x60626C) @ length: 0020

	.global gUnk_0860628C
gUnk_0860628C: @ 0860628C
	.incbin "fe6-base.gba", 0x60628C, (0x6062AC - 0x60628C) @ length: 0020

	.global gUnk_086062AC
gUnk_086062AC: @ 086062AC
	.incbin "fe6-base.gba", 0x6062AC, (0x6062EC - 0x6062AC) @ length: 0040

	.global gUnk_086062EC
gUnk_086062EC: @ 086062EC
	.incbin "fe6-base.gba", 0x6062EC, (0x606314 - 0x6062EC) @ length: 0028

	.section .text

	thumb_func_start func_fe6_0805E140
func_fe6_0805E140: @ 0x0805E140
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, .L0805E17C @ =ProcScr_Ekrlvup_08606254
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r2, r0, #0
	adds r2, #0x29
	strb r4, [r2]
	strh r5, [r0, #0x32]
	strh r6, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	mov r2, r8
	str r2, [r0, #0x44]
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0805E17C: .4byte ProcScr_Ekrlvup_08606254

	thumb_func_start func_fe6_0805E180
func_fe6_0805E180: @ 0x0805E180
	push {r4, r5, lr}
	sub sp, #0x48
	adds r3, r0, #0
	ldr r1, [r3, #0x44]
	movs r2, #0x2c
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bne .L0805E1F8
	movs r4, #0x2e
	ldrsh r0, [r3, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x3f
	ldrb r0, [r0, #3]
	ands r1, r0
	cmp r1, #0
	bne .L0805E1D6
	adds r0, r3, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0805E1C6
	cmp r0, #1
	bgt .L0805E1B8
	cmp r0, #0
	beq .L0805E1BE
	b .L0805E1F8
.L0805E1B8:
	cmp r0, #2
	beq .L0805E1CC
	b .L0805E1F8
.L0805E1BE:
	adds r0, r3, #0
	bl Proc_Break
	b .L0805E224
.L0805E1C6:
	strh r0, [r3, #0x2c]
	strh r1, [r3, #0x2e]
	b .L0805E1F8
.L0805E1CC:
	movs r0, #1
	strh r0, [r3, #0x2c]
	ldrh r0, [r3, #0x2e]
	subs r0, #1
	b .L0805E1F6
.L0805E1D6:
	cmp r1, #4
	bne .L0805E1DE
	strh r2, [r3, #0x2c]
	b .L0805E1F2
.L0805E1DE:
	ldr r0, .L0805E22C @ =0x0FFFFFFC
	ands r0, r2
	str r0, [r3, #0x48]
	lsrs r0, r2, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r2, r1
	adds r0, r0, r2
	strh r0, [r3, #0x2c]
.L0805E1F2:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
.L0805E1F6:
	strh r0, [r3, #0x2e]
.L0805E1F8:
	ldrh r0, [r3, #0x2c]
	subs r0, #1
	movs r2, #0
	strh r0, [r3, #0x2c]
	str r2, [sp, #0x1c]
	ldr r0, [r3, #0x48]
	str r0, [sp, #0x3c]
	mov r1, sp
	ldr r0, [r3, #0x4c]
	strh r0, [r1, #8]
	ldrh r5, [r3, #0x32]
	ldrh r4, [r3, #0x34]
	adds r0, r5, r4
	strh r0, [r1, #2]
	ldrh r5, [r3, #0x3a]
	ldrh r4, [r3, #0x3c]
	adds r0, r5, r4
	strh r0, [r1, #4]
	mov r0, sp
	strh r2, [r0, #0xc]
	bl BasPutOam
.L0805E224:
	add sp, #0x48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E22C: .4byte 0x0FFFFFFC

	thumb_func_start NewEfxPartsofScroll
NewEfxPartsofScroll: @ 0x0805E230
	push {lr}
	ldr r0, .L0805E244 @ =gUnk_0860626C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
.L0805E244: .4byte gUnk_0860626C

	thumb_func_start EfxUpdatePartsofScroll
EfxUpdatePartsofScroll: @ 0x0805E248
	push {r4, r5, r6, lr}
	ldr r0, .L0805E274 @ =gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r2, .L0805E278 @ =gpBg2ScrollOffsetTable1
	cmp r0, #0
	bne .L0805E256
	ldr r2, .L0805E27C @ =gpBg2ScrollOffsetTable2
.L0805E256:
	ldr r1, .L0805E280 @ =gpBg1ScrollOffsetList1
	cmp r0, #0
	bne .L0805E25E
	ldr r1, .L0805E284 @ =gpBg1ScrollOffsetList2
.L0805E25E:
	movs r3, #0
	movs r6, #0
	ldr r5, .L0805E288 @ =gEkrLvupScrollPos1
	ldr r4, .L0805E28C @ =gEkrLvupScrollPos2
.L0805E266:
	cmp r3, #0x27
	bhi .L0805E290
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b .L0805E2AC
	.align 2, 0
.L0805E274: .4byte gEkrBg1ScrollFlip
.L0805E278: .4byte gpBg2ScrollOffsetTable1
.L0805E27C: .4byte gpBg2ScrollOffsetTable2
.L0805E280: .4byte gpBg1ScrollOffsetList1
.L0805E284: .4byte gpBg1ScrollOffsetList2
.L0805E288: .4byte gEkrLvupScrollPos1
.L0805E28C: .4byte gEkrLvupScrollPos2
.L0805E290:
	cmp r3, #0x47
	bhi .L0805E29E
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b .L0805E2AA
.L0805E29E:
	cmp r3, #0x9f
	bhi .L0805E2AE
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
.L0805E2AA:
	strh r0, [r1]
.L0805E2AC:
	adds r1, #2
.L0805E2AE:
	adds r3, #1
	cmp r3, #0x9f
	bls .L0805E266
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805E2BC
func_fe6_0805E2BC: @ 0x0805E2BC
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0805E2C0
func_fe6_0805E2C0: @ 0x0805E2C0
	push {lr}
	bl EfxUpdatePartsofScroll
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxPartsofScroll2
NewEfxPartsofScroll2: @ 0x0805E2CC
	push {lr}
	ldr r0, .L0805E2E0 @ =gUnk_0860628C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
.L0805E2E0: .4byte gUnk_0860628C

	thumb_func_start func_fe6_0805E2E4
func_fe6_0805E2E4: @ 0x0805E2E4
	bx lr
	.align 2, 0

	thumb_func_start func_fe6_0805E2E8
func_fe6_0805E2E8: @ 0x0805E2E8
	push {r4, r5, r6, lr}
	ldr r0, .L0805E334 @ =gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r3, .L0805E338 @ =gpBg2ScrollOffsetTable1
	cmp r0, #0
	bne .L0805E2F6
	ldr r3, .L0805E33C @ =gpBg2ScrollOffsetTable2
.L0805E2F6:
	ldr r2, .L0805E340 @ =gpBg1ScrollOffsetList1
	cmp r0, #0
	bne .L0805E2FE
	ldr r2, .L0805E344 @ =gpBg1ScrollOffsetList2
.L0805E2FE:
	movs r4, #0
	movs r5, #0
	ldr r0, .L0805E348 @ =gUnk_086062AC
	adds r6, r0, #0
	subs r6, #0x50
.L0805E308:
	cmp r4, #0x27
	bls .L0805E358
	cmp r4, #0x47
	bhi .L0805E354
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, .L0805E34C @ =gEkrLvupScrollPos1
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	cmp r0, #0x2e
	bls .L0805E32A
	cmp r0, #0x51
	bls .L0805E32C
.L0805E32A:
	ldr r1, .L0805E350 @ =0x0000FFE0
.L0805E32C:
	strh r1, [r3]
	adds r3, #2
	strh r1, [r2]
	b .L0805E35E
	.align 2, 0
.L0805E334: .4byte gEkrBg1ScrollFlip
.L0805E338: .4byte gpBg2ScrollOffsetTable1
.L0805E33C: .4byte gpBg2ScrollOffsetTable2
.L0805E340: .4byte gpBg1ScrollOffsetList1
.L0805E344: .4byte gpBg1ScrollOffsetList2
.L0805E348: .4byte gUnk_086062AC
.L0805E34C: .4byte gEkrLvupScrollPos1
.L0805E350: .4byte 0x0000FFE0
.L0805E354:
	cmp r4, #0x9f
	bhi .L0805E360
.L0805E358:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
.L0805E35E:
	adds r2, #2
.L0805E360:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls .L0805E308
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxleveluphb
NewEfxleveluphb: @ 0x0805E370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, .L0805E40C @ =gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, .L0805E410 @ =gpBg2ScrollOffsetTable1
	movs r1, #0
	adds r6, r2, #0
	ldr r4, .L0805E414 @ =gpBg2ScrollOffsetTable2
	ldr r0, .L0805E418 @ =gpBg1ScrollOffsetList1
	ldr r5, .L0805E41C @ =gpBg1ScrollOffsetList2
	ldr r7, .L0805E420 @ =gEkrBg2ScrollFlip
	ldr r3, .L0805E424 @ =gEkrBg1ScrollFlip
	mov ip, r3
	ldr r3, .L0805E428 @ =gpBg2ScrollOffsetStart
	mov r8, r3
	ldr r3, .L0805E42C @ =gpBg1ScrollOffsetStart
	mov sb, r3
	ldr r3, .L0805E430 @ =gpBg2ScrollOffset
	mov sl, r3
	movs r3, #0
.L0805E3A2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3A2
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
.L0805E3B2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3B2
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
.L0805E3C2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3C2
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
.L0805E3D2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls .L0805E3D2
	movs r4, #0
	str r4, [r7]
	mov r1, ip
	str r4, [r1]
	mov r3, r8
	str r6, [r3]
	mov r1, sb
	str r0, [r1]
	mov r3, sl
	str r6, [r3]
	ldr r1, .L0805E434 @ =gpBg1ScrollOffset
	str r0, [r1]
	ldr r0, .L0805E438 @ =gUnk_086062EC
	movs r1, #0
	bl SpawnProc
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0805E40C: .4byte gEfxBgSemaphore
.L0805E410: .4byte gpBg2ScrollOffsetTable1
.L0805E414: .4byte gpBg2ScrollOffsetTable2
.L0805E418: .4byte gpBg1ScrollOffsetList1
.L0805E41C: .4byte gpBg1ScrollOffsetList2
.L0805E420: .4byte gEkrBg2ScrollFlip
.L0805E424: .4byte gEkrBg1ScrollFlip
.L0805E428: .4byte gpBg2ScrollOffsetStart
.L0805E42C: .4byte gpBg1ScrollOffsetStart
.L0805E430: .4byte gpBg2ScrollOffset
.L0805E434: .4byte gpBg1ScrollOffset
.L0805E438: .4byte gUnk_086062EC

	thumb_func_start func_fe6_0805E43C
func_fe6_0805E43C: @ 0x0805E43C
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start func_fe6_0805E448
func_fe6_0805E448: @ 0x0805E448
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start func_fe6_0805E454
func_fe6_0805E454: @ 0x0805E454
	ldr r1, .L0805E468 @ =gEkrBg2ScrollFlip
	ldr r0, [r1]
	cmp r0, #1
	bne .L0805E474
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0805E46C @ =gpBg2ScrollOffsetStart
	ldr r0, .L0805E470 @ =gpBg2ScrollOffsetTable1
	b .L0805E47C
	.align 2, 0
.L0805E468: .4byte gEkrBg2ScrollFlip
.L0805E46C: .4byte gpBg2ScrollOffsetStart
.L0805E470: .4byte gpBg2ScrollOffsetTable1
.L0805E474:
	movs r0, #1
	str r0, [r1]
	ldr r1, .L0805E494 @ =gpBg2ScrollOffsetStart
	ldr r0, .L0805E498 @ =gpBg2ScrollOffsetTable2
.L0805E47C:
	str r0, [r1]
	adds r3, r1, #0
	ldr r1, .L0805E49C @ =gEkrBg1ScrollFlip
	ldr r0, [r1]
	cmp r0, #1
	bne .L0805E4A8
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0805E4A0 @ =gpBg1ScrollOffsetStart
	ldr r0, .L0805E4A4 @ =gpBg1ScrollOffsetList1
	b .L0805E4B0
	.align 2, 0
.L0805E494: .4byte gpBg2ScrollOffsetStart
.L0805E498: .4byte gpBg2ScrollOffsetTable2
.L0805E49C: .4byte gEkrBg1ScrollFlip
.L0805E4A0: .4byte gpBg1ScrollOffsetStart
.L0805E4A4: .4byte gpBg1ScrollOffsetList1
.L0805E4A8:
	movs r0, #1
	str r0, [r1]
	ldr r1, .L0805E4C4 @ =gpBg1ScrollOffsetStart
	ldr r0, .L0805E4C8 @ =gpBg1ScrollOffsetList2
.L0805E4B0:
	str r0, [r1]
	adds r2, r1, #0
	ldr r1, .L0805E4CC @ =gpBg2ScrollOffset
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, .L0805E4D0 @ =gpBg1ScrollOffset
	ldr r0, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805E4C4: .4byte gpBg1ScrollOffsetStart
.L0805E4C8: .4byte gpBg1ScrollOffsetList2
.L0805E4CC: .4byte gpBg2ScrollOffset
.L0805E4D0: .4byte gpBg1ScrollOffset

	thumb_func_start EkrLvupHBlank
EkrLvupHBlank: @ 0x0805E4D4
	ldr r0, .L0805E500 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805E4FC
	ldr r3, .L0805E504 @ =0x04000018
	ldr r2, .L0805E508 @ =gpBg2ScrollOffset
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, .L0805E50C @ =gpBg1ScrollOffset
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805E4FC:
	bx lr
	.align 2, 0
.L0805E500: .4byte 0x04000004
.L0805E504: .4byte 0x04000018
.L0805E508: .4byte gpBg2ScrollOffset
.L0805E50C: .4byte gpBg1ScrollOffset

	thumb_func_start EfxPartsofScroll2HBlank
EfxPartsofScroll2HBlank: @ 0x0805E510
	push {r4, r5, r6, lr}
	ldr r0, .L0805E54C @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805E544
	ldr r3, .L0805E550 @ =0x0400001A
	ldr r4, .L0805E554 @ =gDispIo
	ldr r2, .L0805E558 @ =gpBg2ScrollOffset
	ldr r0, [r2]
	ldrh r5, [r4, #0x26]
	ldrh r6, [r0]
	adds r1, r5, r6
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, .L0805E55C @ =gpBg1ScrollOffset
	ldr r0, [r2]
	ldrh r4, [r4, #0x22]
	ldrh r5, [r0]
	adds r1, r4, r5
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805E544:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E54C: .4byte 0x04000004
.L0805E550: .4byte 0x0400001A
.L0805E554: .4byte gDispIo
.L0805E558: .4byte gpBg2ScrollOffset
.L0805E55C: .4byte gpBg1ScrollOffset
