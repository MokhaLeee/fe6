	.include "asm_proc.inc"

    .data

	.global Sprites_086795F8
Sprites_086795F8: @ 086795F8
	.incbin "fe6-base.gba", 0x6795F8, (0x679654 - 0x6795F8) @ length: 005C

	.global Sprites_08679654
Sprites_08679654: @ 08679654
	.incbin "fe6-base.gba", 0x679654, (0x67966C - 0x679654) @ length: 0018

	.global ProcScr_0867966C
ProcScr_0867966C: @ 0867966C
	.incbin "fe6-base.gba", 0x67966C, (0x67968C - 0x67966C) @ length: 0020

	.global ProcScr_0867968C
ProcScr_0867968C: @ 0867968C
	.incbin "fe6-base.gba", 0x67968C, (0x6796C4 - 0x67968C) @ length: 0038

	.global ProcScr_086796C4
ProcScr_086796C4: @ 086796C4
	.incbin "fe6-base.gba", 0x6796C4, (0x6796F4 - 0x6796C4) @ length: 0030

	.global ProcScr_086796F4
ProcScr_086796F4: @ 086796F4
	.incbin "fe6-base.gba", 0x6796F4, (0x67971C - 0x6796F4) @ length: 0028

	.global ProcScr_0867971C
ProcScr_0867971C: @ 0867971C
	.incbin "fe6-base.gba", 0x67971C, (0x67973C - 0x67971C) @ length: 0020

	.global ProcScr_0867973C
ProcScr_0867973C: @ 0867973C
	.incbin "fe6-base.gba", 0x67973C, (0x679754 - 0x67973C) @ length: 0018

	.global Msgs_08679754
Msgs_08679754: @ 08679754
	.incbin "fe6-base.gba", 0x679754, (0x67976C - 0x679754) @ length: 0018

	.global Sprite_Prep_0867976C
Sprite_Prep_0867976C: @ 0867976C
	.incbin "fe6-base.gba", 0x67976C, (0x679774 - 0x67976C) @ length: 0008

	.global ProcScr_Prep_08679774
ProcScr_Prep_08679774: @ 08679774
	.incbin "fe6-base.gba", 0x679774, (0x67978C - 0x679774) @ length: 0018

	.global gUnk_0867978C
gUnk_0867978C: @ 0867978C
	.incbin "fe6-base.gba", 0x67978C, (0x6797D0 - 0x67978C) @ length: 0044

	.global ProcScr_Prep_Password
ProcScr_Prep_Password: @ 086797D0
	.incbin "fe6-base.gba", 0x6797D0, (0x679820 - 0x6797D0) @ length: 0050

	.global gUnk_08679820
gUnk_08679820: @ 08679820
	.incbin "fe6-base.gba", 0x679820, (0x679924 - 0x679820) @ length: 0104

	.global ProcScr_SecretScreen
ProcScr_SecretScreen: @ 08679924
	PROC_SLEEP 0
	PROC_CALL SecretScreen_Init
	PROC_CALL StartMidFadeFromBlack
	PROC_REPEAT WhileFadeExists
	PROC_REPEAT SecretScreen_Loop_Dummy
	PROC_CALL StartMidFadeToBlack
	PROC_REPEAT WhileFadeExists
PROC_LABEL 0
	PROC_CALL SecretScreen_End
	PROC_END
