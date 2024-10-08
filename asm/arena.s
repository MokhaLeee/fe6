	.include "macro.inc"

	.syntax unified

	thumb_func_start func_fe6_0809874C
func_fe6_0809874C: @ 0x0809874C
	push {r7, lr}
	mov r7, sp
	ldr r1, .L08098760 @ =EventScr_SuspendPrompt
	adds r0, r1, #0
	bl StartEvent
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098760: .4byte EventScr_SuspendPrompt

	thumb_func_start func_fe6_08098764
func_fe6_08098764: @ 0x08098764
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq .L08098784
	cmp r0, #1
	bgt .L0809877E
	cmp r0, #0
	beq .L0809878C
	b .L0809878C
.L0809877E:
	cmp r0, #2
	beq .L08098788
	b .L0809878C
.L08098784:
	movs r0, #1
	b .L08098790
.L08098788:
	movs r0, #0
	b .L08098790
.L0809878C:
	movs r0, #0
	b .L08098790
.L08098790:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start WriteSuspandPlaterIdle
WriteSuspandPlaterIdle: @ 0x08098798
	push {r7, lr}
	mov r7, sp
	ldr r0, .L080987B4 @ =gAction
	ldrb r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080987B4: .4byte gAction
