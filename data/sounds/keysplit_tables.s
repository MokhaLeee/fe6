.section .rodata

.global keysplit_tables
keysplit_tables:
	.incbin "fe6-base.gba", 0x39917C, (0x3993BC - 0x39917C)
