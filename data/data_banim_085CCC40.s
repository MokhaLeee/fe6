	.include "animscr.inc"
	.section .data

	.global gUnk_085CCC40
gUnk_085CCC40: @ 085CCC40
	.incbin "fe6-base.gba", 0x5CCC40, (0x5CCDAC - 0x5CCC40) @ length: 016C

	.global AnimScr_EkrTerrainfx_R_Far
AnimScr_EkrTerrainfx_R_Far: @ 085CCDAC
	.incbin "fe6-base.gba", 0x5CCDAC, (0x5CCE38 - 0x5CCDAC) @ length: 008C

	.global AnimScr_EkrTerrainfx_L_Far
AnimScr_EkrTerrainfx_L_Far: @ 085CCE38
	.incbin "fe6-base.gba", 0x5CCE38, (0x5CCEB8 - 0x5CCE38) @ length: 0080

	.global AnimScr_EkrTerrainfx_R_Close
AnimScr_EkrTerrainfx_R_Close: @ 085CCEB8
	.incbin "fe6-base.gba", 0x5CCEB8, (0x5CCF38 - 0x5CCEB8) @ length: 0080

	.global AnimScr_EkrTerrainfx_L_Close
AnimScr_EkrTerrainfx_L_Close: @ 085CCF38
	.incbin "fe6-base.gba", 0x5CCF38, (0x5CDCA4 - 0x5CCF38) @ length: 0D6C

	.global AnimScr_NoDamage
AnimScr_NoDamage: @ 085CDCA4
	.incbin "fe6-base.gba", 0x5CDCA4, (0x5CDD18 - 0x5CDCA4) @ length: 0074

	.global AnimScr_Miss
AnimScr_Miss: @ 085CDD18
	.incbin "fe6-base.gba", 0x5CDD18, (0x5D0DA0 - 0x5CDD18) @ length: 3088
