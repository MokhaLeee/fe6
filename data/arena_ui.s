	.data

	.global EventScr_SuspendPrompt
EventScr_SuspendPrompt: @ 0869141C
	.incbin "fe6-base.gba", 0x69141C, (0x691480 - 0x69141C) @ length: 0064
