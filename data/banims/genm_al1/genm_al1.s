.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
@ BANIM_OAMR_genm_al1:
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, -18, -18
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x008A, -26, -20
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, -10, -26
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, -18, -26
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 16, -4
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x004A, -14, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x002B, -16, 10
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x000C, -16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0010, 16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0090, 16, -4
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x004A, -10, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, -14, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x008A, -22, -18
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, -6, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, -14, -24
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0016, -16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x001A, 16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x009A, 16, -4
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, -3, -15
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x008A, -11, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, 5, -23
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, -3, -23
    ANIM_SPRITE_END
OAMR_3:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0016, -16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x001A, 16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x009A, 16, -4
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00B4, 16, 7
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0094, -17, 7
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x000A, 14, -14
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, 10, -15
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x008A, 2, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, 18, -23
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, 10, -23
    ANIM_SPRITE_END
OAMR_4:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -8, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 24, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 24, -5
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00FC, -12, -12
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FE, -20, -12
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00FC, 27, -13
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FE, 43, -13
    ANIM_SPRITE_END
OAMR_5:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -2, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 30, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 30, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DE, 1, -16
    ANIM_SPRITE_END
OAMR_6:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, 0, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, -8, -19
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, 0, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -3, -29
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 29, -29
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0080, -3, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0084, 29, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, 4, -15
    ANIM_SPRITE_END
OAMR_7:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, -2, -18
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, -10, -20
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, -2, -26
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x000E, -3, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0012, 29, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0092, 29, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, 2, -16
    ANIM_SPRITE_END
OAMR_8:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, -6, -18
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, -14, -20
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, -6, -26
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0014, -11, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0018, 21, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0098, 21, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, -2, -16
    ANIM_SPRITE_END
OAMR_9:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, -13, -19
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, -21, -21
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, -13, -27
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x001A, -16, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x001E, 16, -37
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x009E, 16, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, -9, -17
    ANIM_SPRITE_END
OAMR_10:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0014, -21, -20
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0054, -29, -22
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0016, -21, -28
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 16, -4
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0092, -17, -18
    ANIM_SPRITE_END
OAMR_11:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0014, -17, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0054, -25, -19
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0016, -17, -25
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x000A, -16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x000E, 16, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x008E, 16, -4
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0092, -13, -15
    ANIM_SPRITE_END
OAMR_12:
    ANIM_SPRITE ATTR0_SQUARE, 0x6000, 0x00D7, -33, -37
    ANIM_SPRITE ATTR0_WIDE, 0x2000, 0x00D9, -33, -21
    ANIM_SPRITE ATTR0_SQUARE, 0x2000, 0x00F9, -17, -31
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -17, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 15, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 15, -9
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0086, -25, -33
    ANIM_SPRITE_END
OAMR_13:
    ANIM_SPRITE ATTR0_SQUARE, 0x6000, 0x00CF, -27, -43
    ANIM_SPRITE ATTR0_TALL, 0x2000, 0x00CE, -35, -39
    ANIM_SPRITE ATTR0_SQUARE, 0x2000, 0x00D1, -19, -27
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -17, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 15, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 15, -9
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0086, -25, -33
    ANIM_SPRITE_END
OAMR_14:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C6, -21, -42
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C8, -29, -42
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E8, -23, -26
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -17, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 15, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 15, -9
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0086, -25, -33
    ANIM_SPRITE_END
OAMR_15:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D7, -17, -34
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00D9, -17, -42
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F9, -25, -32
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -17, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 15, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 15, -9
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0086, -25, -33
    ANIM_SPRITE_END
OAMR_16:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CF, -22, -28
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00CE, -6, -32
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D1, -22, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -17, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 15, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 15, -9
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0086, -25, -33
    ANIM_SPRITE_END
OAMR_17:
    ANIM_SPRITE ATTR0_SQUARE, 0x6000, 0x00C6, -28, -28
    ANIM_SPRITE ATTR0_SQUARE, 0x2000, 0x00C8, -12, -20
    ANIM_SPRITE ATTR0_SQUARE, 0x2000, 0x00E8, -18, -36
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -17, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0004, 15, -41
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0084, 15, -9
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0086, -25, -33
    ANIM_SPRITE_END
OAMR_18:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0015, -20, -14
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0017, -20, -22
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0050, -20, -33
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0054, 12, -33
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00D0, -20, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D4, 12, -1
    ANIM_SPRITE_END
OAMR_19:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0010, -17, -13
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0012, -1, -13
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0056, -20, -33
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x005A, 12, -33
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00D6, -20, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DA, 12, -1
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END

.section .data.oaml
@ BANIM_OAML_genm_al1:
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, 2, -18
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x008A, 18, -20
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, 2, -26
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, 10, -26
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -16, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -32, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -32, -4
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x004A, -2, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x002B, 8, 10
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x000C, -16, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0010, -32, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0090, -32, -4
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x004A, 2, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, -2, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x008A, 14, -18
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, -2, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, 6, -24
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0016, -16, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x001A, -32, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x009A, -32, -4
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, -13, -15
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x008A, 3, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, -13, -23
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, -5, -23
    ANIM_SPRITE_END
OAML_3:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0016, -16, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x001A, -32, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x009A, -32, -4
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00B4, -32, 7
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0094, 1, 7
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000A, -22, -14
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CA, -26, -15
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x008A, -10, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00AB, -26, -23
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x008B, -18, -23
    ANIM_SPRITE_END
OAML_4:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -24, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -40, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -40, -5
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00FC, -4, -12
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FE, 12, -12
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00FC, -43, -13
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FE, -51, -13
    ANIM_SPRITE_END
OAML_5:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -30, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -46, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -46, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DE, -17, -16
    ANIM_SPRITE_END
OAML_6:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, -16, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, 0, -19
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, -16, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -29, -29
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -45, -29
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0080, -29, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0084, -45, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, -20, -15
    ANIM_SPRITE_END
OAML_7:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, -14, -18
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, 2, -20
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, -14, -26
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x000E, -29, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0012, -45, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0092, -45, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, -18, -16
    ANIM_SPRITE_END
OAML_8:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, -10, -18
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, 6, -20
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, -10, -26
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0014, -21, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0018, -37, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0098, -37, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, -14, -16
    ANIM_SPRITE_END
OAML_9:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C1, -3, -19
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00C0, 13, -21
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00C3, -3, -27
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x001A, -16, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x001E, -32, -37
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x009E, -32, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x004C, -7, -17
    ANIM_SPRITE_END
OAML_10:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0014, 5, -20
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0054, 21, -22
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0016, 5, -28
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -16, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -32, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -32, -4
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0092, 1, -18
    ANIM_SPRITE_END
OAML_11:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0014, 1, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0054, 17, -19
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0016, 1, -25
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x000A, -16, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x000E, -32, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x008E, -32, -4
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0092, -3, -15
    ANIM_SPRITE_END
OAML_12:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, 0x6000, 0x00D7, 17, -37
    ANIM_SPRITE_XFLIP ATTR0_WIDE, 0x2000, 0x00D9, 17, -21
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, 0x2000, 0x00F9, 9, -31
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -15, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -31, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -31, -9
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0086, 17, -33
    ANIM_SPRITE_END
OAML_13:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, 0x6000, 0x00CF, 11, -43
    ANIM_SPRITE_XFLIP ATTR0_TALL, 0x2000, 0x00CE, 27, -39
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, 0x2000, 0x00D1, 11, -27
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -15, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -31, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -31, -9
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0086, 17, -33
    ANIM_SPRITE_END
OAML_14:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00C6, 5, -42
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C8, 21, -42
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E8, 15, -26
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -15, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -31, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -31, -9
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0086, 17, -33
    ANIM_SPRITE_END
OAML_15:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D7, 1, -34
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00D9, 1, -42
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F9, 17, -32
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -15, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -31, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -31, -9
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0086, 17, -33
    ANIM_SPRITE_END
OAML_16:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00CF, 6, -28
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00CE, -2, -32
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D1, 14, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -15, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -31, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -31, -9
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0086, 17, -33
    ANIM_SPRITE_END
OAML_17:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, 0x6000, 0x00C6, 12, -28
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, 0x2000, 0x00C8, 4, -20
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, 0x2000, 0x00E8, 10, -36
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_64, 0x0000, -15, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0004, -31, -41
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0084, -31, -9
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0086, 17, -33
    ANIM_SPRITE_END
OAML_18:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0015, 4, -14
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0017, 4, -22
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0050, -12, -33
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0054, -28, -33
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00D0, -12, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D4, -28, -1
    ANIM_SPRITE_END
OAML_19:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0010, 1, -13
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0012, -7, -13
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0056, -12, -33
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x005A, -28, -33
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00D6, -12, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DA, -28, -1
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END
    ANIM_SPRITE_END

.section .data.script
@ BANIM_SCR_genm_al1:
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x0C, BANIM_IMG_genm_al1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x24
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x13
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x15
    ANIMSCR_FRAME 0x0A, BANIM_IMG_genm_al1_3, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_genm_al1_4, 0x0A, OAMR_10 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_4, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x0C, BANIM_IMG_genm_al1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x24
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x13
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x15
    ANIMSCR_FRAME 0x0A, BANIM_IMG_genm_al1_3, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_genm_al1_4, 0x0A, OAMR_10 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_4, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x0C, BANIM_IMG_genm_al1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x24
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x13
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x15
    ANIMSCR_FRAME 0x0A, BANIM_IMG_genm_al1_3, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_genm_al1_4, 0x0A, OAMR_10 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_4, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x0C, BANIM_IMG_genm_al1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x24
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x13
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x15
    ANIMSCR_FRAME 0x0A, BANIM_IMG_genm_al1_3, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_genm_al1_4, 0x0A, OAMR_10 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_4, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x0C, BANIM_IMG_genm_al1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x24
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x13
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x15
    ANIMSCR_FRAME 0x0A, BANIM_IMG_genm_al1_3, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_genm_al1_4, 0x0A, OAMR_10 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_4, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_5, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_5, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x11, OAMR_17 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0C, OAMR_12 - OAMR
    ANIMSCR_CMD 0x22
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x11, OAMR_17 - OAMR
    ANIMSCR_CMD 0x22
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_5, 0x11, OAMR_17 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_FRAME 0x10, BANIM_IMG_genm_al1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x24
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x13
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x15
    ANIMSCR_FRAME 0x0A, BANIM_IMG_genm_al1_3, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_genm_al1_4, 0x0A, OAMR_10 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_4, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_genm_al1_2, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_genm_al1_2, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_genm_al1_2, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_genm_al1_2, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_FRAME 0x0C, BANIM_IMG_genm_al1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x24
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x02, BANIM_IMG_genm_al1_1, 0x04, OAMR_4 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_genm_al1_2, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x13
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_3, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x15
    ANIMSCR_FRAME 0x0A, BANIM_IMG_genm_al1_3, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_genm_al1_4, 0x0A, OAMR_10 - OAMR
    ANIMSCR_CMD 0x2B
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x04, BANIM_IMG_genm_al1_4, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
@ BANIM_MODES_genm_al1:
    .word SCR_NORMAL_ATK - SCR
    .word SCR_NORMAL_ATK_PRIORITY_L - SCR
    .word SCR_CRIT_ATK - SCR
    .word SCR_CRIT_ATK_PRIORITY_L - SCR
    .word SCR_RANGED_ATK - SCR
    .word SCR_RANGED_CRIT_ATK - SCR
    .word SCR_CLOSE_DODGE - SCR
    .word SCR_RANGED_DODGE - SCR
    .word SCR_STANDING - SCR
    .word SCR_STANDING2 - SCR
    .word SCR_RANGED_STANDING - SCR
    .word SCR_MISSED_ATK - SCR
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
