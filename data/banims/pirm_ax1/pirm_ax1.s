.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
.global BANIM_OAMR_pirm_ax1
BANIM_OAMR_pirm_ax1:
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0004, 16, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -8, -24
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0065, -13, -1
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0069, 19, -1
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0026, -5, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0007, 3, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0009, 19, -25
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, 3, -33
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x000A, -45, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x000E, -13, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x004E, -13, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x000F, -69, -15
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0011, -53, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x006E, -77, -7
    ANIM_SPRITE_END
OAMR_3:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0012, -54, -24
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0016, -22, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0052, -54, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0072, -54, 0
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0076, -22, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0051, -62, 8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0050, -62, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x004F, -70, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x006F, -62, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0071, -14, -5
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0017, -35, -32
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0019, -19, -32
    ANIM_SPRITE_END
OAMR_4:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x001A, -69, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001C, -53, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x003D, -69, -9
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x005D, -53, -9
    ANIM_SPRITE_END
OAMR_5:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0038, -44, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x003A, -28, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x007B, -20, 0
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x003B, -20, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0097, -28, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0037, -52, -5
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0057, -60, -8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x007C, -68, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -41, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x005B, -20, -24
    ANIM_SPRITE_END
OAMR_6:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x008A, -64, -8
    ANIM_SPRITE_END
OAMR_7:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00B1, -38, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x00F1, -38, 0
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x00B5, -38, 8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D5, -30, -24
    ANIM_SPRITE_END
OAMR_8:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, -22, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0084, -14, -24
    ANIM_SPRITE_END
OAMR_9:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x00A4, -17, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00E5, -9, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, 7, -8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00A8, -25, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00A9, -17, -32
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00C9, -9, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CB, 7, 0
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x00E8, -17, 8
    ANIM_SPRITE_END
OAMR_10:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x008C, -16, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0090, 16, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -8, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, -3, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, -8, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00B9, -20, -2
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D6, 7, 0
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00D8, 23, 0
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00FA, 7, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FC, 23, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BB, 31, -2
    ANIM_SPRITE_END
OAMR_11:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0004, 16, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -8, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D6, 15, -1
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00D8, 31, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, -3, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, -11, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00B9, -27, -2
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, 8, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F9, 4, -6
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F9, -9, -3
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00FA, 15, -9
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FC, 31, -9
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BB, 39, -4
    ANIM_SPRITE_END
OAMR_12:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0024, -23, -4
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0044, 9, -4
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0003, -15, -12
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0007, -31, -4
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x008F, 10, -18
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CF, 10, -2
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0020, -14, -10
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0000, -6, -18
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0002, 10, -18
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0061, -14, 6
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0060, 3, -26
    ANIM_SPRITE_END
OAMR_13:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0011, 14, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D0, 14, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0045, -14, -2
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0008, -6, -10
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0049, 10, -10
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0069, 18, -10
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, -1, -26
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0028, 15, -26
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0071, 20, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0051, 20, -24
    ANIM_SPRITE_END
OAMR_14:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0012, -54, -24
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0016, -22, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0052, -54, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0072, -54, 0
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0076, -22, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0051, -62, 8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0050, -62, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x004F, -70, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x006F, -62, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0071, -14, -5
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0017, -35, -32
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0019, -19, -32
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x001A, -69, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001C, -53, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x003D, -69, -9
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x005D, -53, -9
    ANIM_SPRITE_END
OAMR_15:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0038, -44, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x003A, -28, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x007B, -20, 0
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x003B, -20, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0097, -28, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0037, -52, -5
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0057, -60, -8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x007C, -68, -8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -41, -24
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x008A, -64, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x005B, -20, -24
    ANIM_SPRITE_END
OAMR_16:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, 0, -8
    ANIM_SPRITE_END
OAMR_17:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, 0, -8
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
.global BANIM_OAML_pirm_ax1
BANIM_OAML_pirm_ax1:
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0004, -24, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, 0, -24
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0065, -19, -1
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0069, -27, -1
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0026, -27, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0007, -19, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0009, -27, -25
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, -19, -33
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x000A, 13, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x000E, 5, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x004E, 5, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x000F, 53, -15
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0011, 45, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x006E, 69, -7
    ANIM_SPRITE_END
OAML_3:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0012, 22, -24
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0016, 14, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0052, 22, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0072, 22, 0
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0076, 14, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0051, 54, 8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0050, 54, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x004F, 62, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x006F, 54, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0071, 6, -5
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0017, 19, -32
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0019, 11, -32
    ANIM_SPRITE_END
OAML_4:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x001A, 53, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001C, 45, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x003D, 53, -9
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x005D, 45, -9
    ANIM_SPRITE_END
OAML_5:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0038, 28, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x003A, 20, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x007B, 12, 0
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x003B, 4, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0097, 20, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0037, 44, -5
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0057, 52, -8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x007C, 60, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, 33, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x005B, 4, -24
    ANIM_SPRITE_END
OAML_6:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x008A, 48, -8
    ANIM_SPRITE_END
OAML_7:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00B1, 6, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x00F1, 6, 0
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x00B5, 6, 8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D5, 22, -24
    ANIM_SPRITE_END
OAML_8:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, -10, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0084, 6, -24
    ANIM_SPRITE_END
OAML_9:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x00A4, -15, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00E5, -7, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E7, -15, -8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00A8, 17, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00A9, 1, -32
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00C9, -7, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CB, -15, 0
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x00E8, -15, 8
    ANIM_SPRITE_END
OAML_10:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x008C, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0090, -24, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, 0, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, -5, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, 0, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00B9, 4, -2
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D6, -23, 0
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00D8, -31, 0
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00FA, -23, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FC, -31, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BB, -39, -2
    ANIM_SPRITE_END
OAML_11:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0004, -24, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, 0, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00D6, -31, -1
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00D8, -39, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, -5, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, 3, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00B9, 11, -2
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F5, -16, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F9, -12, -6
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F9, 1, -3
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00FA, -31, -9
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FC, -39, -9
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BB, -47, -4
    ANIM_SPRITE_END
OAML_12:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0024, -9, -4
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0044, -17, -4
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0003, -17, -12
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0007, 23, -4
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x008F, -18, -18
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CF, -18, -2
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0020, -18, -10
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0000, -10, -18
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0002, -18, -18
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0061, -18, 6
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0060, -11, -26
    ANIM_SPRITE_END
OAML_13:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0011, -30, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D0, -22, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0045, -18, -2
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0008, -10, -10
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0049, -18, -10
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0069, -26, -10
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, -15, -26
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0028, -23, -26
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0071, -36, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0051, -36, -24
    ANIM_SPRITE_END
OAML_14:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0012, 22, -24
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0016, 14, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0052, 22, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0072, 22, 0
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0076, 14, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0051, 54, 8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0050, 54, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x004F, 62, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x006F, 54, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0071, 6, -5
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0017, 19, -32
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0019, 11, -32
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x001A, 53, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001C, 45, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x003D, 53, -9
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x005D, 45, -9
    ANIM_SPRITE_END
OAML_15:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0038, 28, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x003A, 20, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x007B, 12, 0
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x003B, 4, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0097, 20, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0037, 44, -5
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0057, 52, -8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x007C, 60, -8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, 33, -24
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x008A, 48, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x005B, 4, -24
    ANIM_SPRITE_END
OAML_16:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, -8, -8
    ANIM_SPRITE_END
OAML_17:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, -8, -8
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
.global BANIM_SCR_pirm_ax1
BANIM_SCR_pirm_ax1:
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x41
    ANIMSCR_FRAME 0x14, _data_BANIM_IMG_pirm_ax1_0_start, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x42
    ANIMSCR_CMD 0x30
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x04
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x20
    ANIMSCR_CMD 0x1A
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x41
    ANIMSCR_FRAME 0x14, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x42
    ANIMSCR_CMD 0x30
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x04
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x20
    ANIMSCR_CMD 0x1A
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x41
    ANIMSCR_FRAME 0x0F, _data_BANIM_IMG_pirm_ax1_0_start, 0x09, OAMR_9 - OAMR
    ANIMSCR_CMD 0x42
    ANIMSCR_FRAME 0x02, _data_BANIM_IMG_pirm_ax1_0_start, 0x0A, OAMR_10 - OAMR
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x0B, OAMR_11 - OAMR
    ANIMSCR_FRAME 0x1E, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x41
    ANIMSCR_FRAME 0x14, _data_BANIM_IMG_pirm_ax1_0_start, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x42
    ANIMSCR_CMD 0x30
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x04
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x0B
    ANIMSCR_CMD 0x20
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x05, OAMR_5 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x41
    ANIMSCR_FRAME 0x0F, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x42
    ANIMSCR_FRAME 0x02, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x1E, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x41
    ANIMSCR_FRAME 0x14, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x42
    ANIMSCR_CMD 0x30
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x04
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x0B
    ANIMSCR_CMD 0x20
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x06, OAMR_6 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x10, OAMR_16 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_pirm_ax1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_pirm_ax1_1, 0x0D, OAMR_13 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_pirm_ax1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_pirm_ax1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_pirm_ax1_1, 0x0D, OAMR_13 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_pirm_ax1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x41
    ANIMSCR_FRAME 0x14, _data_BANIM_IMG_pirm_ax1_0_start, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x42
    ANIMSCR_CMD 0x30
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x04
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x0E, OAMR_14 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x01, _data_BANIM_IMG_pirm_ax1_0_start, 0x0F, OAMR_15 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_CMD 0x06
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x03, _data_BANIM_IMG_pirm_ax1_0_start, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
.global BANIM_MODES_pirm_ax1
BANIM_MODES_pirm_ax1:
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
