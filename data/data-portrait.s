    .data

    .incbin "fe6-base.gba", 0x60D0D8, (0x66075C - 0x60D0D8)

    .global FaceInfoTable
FaceInfoTable: @ 0866075C
    .incbin "fe6-base.gba", 0x66075C, (0x6615BC - 0x66075C) @ length: 0E60
