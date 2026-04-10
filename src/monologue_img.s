	.section .rodata

	.global Img_MonologueText
Img_MonologueText: @ 0834658C
	.incbin "data/Monologue/Img_MonologueText.4bpp.lz"

	.global Pal_MonologueText
Pal_MonologueText: @ 08349A78
	.incbin "data/Monologue/Img_MonologueText.gbapal", 0, 0x20
