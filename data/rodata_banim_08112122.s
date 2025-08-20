	.section .rodata

	.global BanimDefaultModeConfig
BanimDefaultModeConfig: @ 08112298
	.incbin "fe6-base.gba", 0x112298, (0x1122C0 - 0x112298) @ length: 0028

	.global BanimDefaultStandingTypes
BanimDefaultStandingTypes: @ 081122C0
	.incbin "fe6-base.gba", 0x1122C0, (0x1122C5 - 0x1122C0) @ length: 0005

	.global BanimTypesPosLeft
BanimTypesPosLeft: @ 081122C5
	.incbin "fe6-base.gba", 0x1122C5, (0x1122CA - 0x1122C5) @ length: 0005

	.global BanimTypesPosRight
BanimTypesPosRight: @ 081122CA
	.incbin "fe6-base.gba", 0x1122CA, (0x1122D0 - 0x1122CA) @ length: 0006

	.global BanimLeftDefaultPos
BanimLeftDefaultPos: @ 081122D0
	.incbin "fe6-base.gba", 0x1122D0, (0x1122DA - 0x1122D0) @ length: 000A

	.global Tsa_EkrTerrainfx_081122DA
Tsa_EkrTerrainfx_081122DA: @ 081122DA
	.incbin "fe6-base.gba", 0x1122DA, (0x112370 - 0x1122DA) @ length: 0096
