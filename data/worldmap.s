	.data

	.global SpriteConf_WmMapTextDisp
SpriteConf_WmMapTextDisp: @ 0868C940
	.incbin "fe6-base.gba", 0x68C940, (0x68C970 - 0x68C940) @ length: 0030

	.global ProcScr_TalkAdvance
ProcScr_TalkAdvance: @ 0868C970
	.incbin "fe6-base.gba", 0x68C970, (0x68C988 - 0x68C970) @ length: 0018

	.global ProcScr_WmDebug
ProcScr_WmDebug: @ 0868C988
	.incbin "fe6-base.gba", 0x68C988, (0x68C9B8 - 0x68C988)
