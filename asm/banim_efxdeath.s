	.include "macro.inc"

	.syntax unified

	.section .data

	.global ProcScr_EfxDeadPika
ProcScr_EfxDeadPika: @ 085CB8A8
	.incbin "fe6-base.gba", 0x5CB8A8, (0x5CB8C0 - 0x5CB8A8) @ length: 0018

	.global ProcScr_EfxDeadAlpha
ProcScr_EfxDeadAlpha: @ 085CB8C0
	.incbin "fe6-base.gba", 0x5CB8C0, (0x5CB8D8 - 0x5CB8C0) @ length: 0018

	.global ProcScr_EfxDeadDragonAlpha
ProcScr_EfxDeadDragonAlpha: @ 085CB8D8
	.incbin "fe6-base.gba", 0x5CB8D8, (0x5CB8F0 - 0x5CB8D8) @ length: 0018

	.section .text

	thumb_func_start EfxDead_StartAlpha
EfxDead_StartAlpha: @ 0x080458C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetEkrDragonStateTypeGeneric
	adds r5, r0, #0
	ldr r6, [r4, #0x5c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne .L080458DA
	movs r0, #0x15
	b .L080458DC
.L080458DA:
	movs r0, #0x2a
.L080458DC:
	ands r5, r0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne .L0804594A
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq .L08045918
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl NewEfxDeadDragonAlpha
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd6
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r0, #0x64
	strh r0, [r4, #0x2e]
	b .L08045966
.L08045918:
	movs r0, #0x30
	ands r0, r5
	cmp r0, #0
	beq .L08045926
	movs r0, #0x1f
	strh r0, [r4, #0x2e]
	b .L08045966
.L08045926:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl NewEfxDeadAlpha
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl EfxPlaySE
	movs r2, #2
	ldrsh r1, [r6, r2]
	movs r0, #0xd6
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b .L08045966
.L0804594A:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne .L08045966
	ldr r1, .L0804596C @ =gEkrHpBarCount
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, .L08045970 @ =gEkrDeadExist
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08045966:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804596C: .4byte gEkrHpBarCount
.L08045970: .4byte gEkrDeadExist

	thumb_func_start NewEfxDeadPika
NewEfxDeadPika: @ 0x08045974
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045994 @ =ProcScr_EfxDeadPika
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045994: .4byte ProcScr_EfxDeadPika

	thumb_func_start EfxDeadPika_Loop
EfxDeadPika_Loop: @ 0x08045998
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x5c]
	ldr r4, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble .L080459D0
	ldr r1, .L080459CC @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r5, [r3]
	ands r0, r5
	strh r0, [r3]
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b .L080459DE
	.align 2, 0
.L080459CC: .4byte 0x0000FFFD
.L080459D0:
	movs r0, #2
	ldrh r1, [r3]
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
.L080459DE:
	movs r5, #0x2e
	ldrsh r0, [r2, r5]
	cmp r0, #5
	ble .L080459F2
	movs r0, #0
	strh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
	adds r0, r2, #0
	bl Proc_Break
.L080459F2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewEfxDeadAlpha
NewEfxDeadAlpha: @ 0x080459F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045A60 @ =ProcScr_EfxDeadAlpha
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	bl BasSort
	ldr r2, .L08045A64 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, .L08045A68 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, .L08045A6C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045A60: .4byte ProcScr_EfxDeadAlpha
.L08045A64: .4byte gDispIo
.L08045A68: .4byte 0x0000FFE0
.L08045A6C: .4byte 0x0000E0FF

	thumb_func_start EfxDeadAlpha_Loop
EfxDeadAlpha_Loop: @ 0x08045A70
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L08045AE4
	movs r0, #2
	ldrh r1, [r2]
	orrs r1, r0
	strh r1, [r2]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, .L08045ADC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	ldr r2, .L08045AE0 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b .L08045B16
	.align 2, 0
.L08045ADC: .4byte 0xFFFFFBFF
.L08045AE0: .4byte gDispIo
.L08045AE4:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r3, .L08045B20 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
.L08045B16:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045B20: .4byte gDispIo

	thumb_func_start NewEfxDeadDragonAlpha
NewEfxDeadDragonAlpha: @ 0x08045B24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08045BE8 @ =ProcScr_EfxDeadDragonAlpha
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r2, #2
	movs r6, #0
	movs r3, #0
	ldrh r1, [r4]
	orrs r1, r2
	strh r1, [r4]
	ldrh r1, [r5]
	orrs r2, r1
	strh r2, [r5]
	strh r3, [r0, #0x2c]
	strh r3, [r0, #0x2e]
	ldr r0, [r0, #0x5c]
	bl EndEkrDragonDaemon
	ldr r5, .L08045BEC @ =gDispIo
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, .L08045BF0 @ =0x0000FFE0
	ldrh r2, [r5, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, .L08045BF4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
	movs r2, #0x20
	ldrb r0, [r5, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r3, r5, #0
	adds r3, #0x34
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	orrs r0, r2
	strb r0, [r3]
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r2, r1
	strb r2, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045BE8: .4byte ProcScr_EfxDeadDragonAlpha
.L08045BEC: .4byte gDispIo
.L08045BF0: .4byte 0x0000FFE0
.L08045BF4: .4byte 0x0000E0FF

	thumb_func_start EfxDeadDragonAlpha_Loop
EfxDeadDragonAlpha_Loop: @ 0x08045BF8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L08045C4C
	ldr r0, .L08045C44 @ =gBg3Tm
	movs r1, #0xf0
	lsls r1, r1, #8
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r2, .L08045C48 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b .L08045C84
	.align 2, 0
.L08045C44: .4byte gBg3Tm
.L08045C48: .4byte gDispIo
.L08045C4C:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, .L08045C8C @ =gDispIo
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r5, [r0]
.L08045C84:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045C8C: .4byte gDispIo
