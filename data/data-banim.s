
	.data

	BEGIN = 0x6A0000
	END   = 0x6A1000

.global banim_number
banim_number:
	.incbin "fe6-base.gba", BEGIN, 8

.global banim_data
banim_data:
	.incbin "fe6-base.gba", BEGIN + 8, (END - BEGIN - 8)
