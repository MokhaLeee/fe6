.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
@ BANIM_OAMR_magm_mg1:
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0004, -8, -24
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0006, -15, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0044, -7, -24
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x000A, -14, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x000E, -4, -24
    ANIM_SPRITE_END
OAMR_3:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0010, -7, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x002E, 1, -24
    ANIM_SPRITE_END
OAMR_4:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0014, -7, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x004E, 9, -24
    ANIM_SPRITE_END
OAMR_5:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0018, -2, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x001C, 6, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001E, 22, -25
    ANIM_SPRITE_END
OAMR_6:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, 1, -18
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0084, 1, -26
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, 17, -26
    ANIM_SPRITE_END
OAMR_7:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DA, -4, -22
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0086, 1, -18
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0084, 1, -26
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, 17, -26
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00C4, 33, -18
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C5, 33, -2
    ANIM_SPRITE_END
OAMR_8:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x008A, 6, -18
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00EF, -2, 6
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00CE, -2, -18
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00AE, 14, -26
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x008E, -2, -26
    ANIM_SPRITE_END
OAMR_9:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x009C, -12, -23
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x009E, 4, -23
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FF, 12, 1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0090, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F4, 37, 7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0094, 37, -14
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D4, 21, -25
    ANIM_SPRITE_END
OAMR_10:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0096, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x009A, 37, -14
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E5, 21, -25
    ANIM_SPRITE_END
OAMR_11:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0044, 37, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0004, 21, -25
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0024, 37, -25
    ANIM_SPRITE_END
OAMR_12:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0006, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, 37, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x004A, 37, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x006A, 21, -25
    ANIM_SPRITE_END
OAMR_13:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x000C, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0010, 37, -9
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, 37, 7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0070, 21, -25
    ANIM_SPRITE_END
OAMR_14:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0012, 5, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0016, 37, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0076, 21, -25
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x003F, 37, -9
    ANIM_SPRITE_END
OAMR_15:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0017, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x007F, 21, -25
    ANIM_SPRITE_END
OAMR_16:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x001B, 5, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x005F, 16, -25
    ANIM_SPRITE_END
OAMR_17:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, 1, -15
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0084, 9, -23
    ANIM_SPRITE_END
OAMR_18:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0086, -5, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, 3, -24
    ANIM_SPRITE_END
OAMR_19:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x008A, -7, -16
    ANIM_SPRITE_END
OAMR_20:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0024, -14, -15
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0004, -8, -24
    ANIM_SPRITE_END
OAMR_21:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x008E, -13, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00C4, -5, -24
    ANIM_SPRITE_END
OAMR_22:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0092, -11, -15
    ANIM_SPRITE_END
OAMR_23:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0096, -13, -15
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00DE, 19, -7
    ANIM_SPRITE_END
OAMR_24:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x009A, -6, -15
    ANIM_SPRITE_END
OAMR_25:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -13, -16
    ANIM_SPRITE_END
OAMR_26:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0004, -16, -16
    ANIM_SPRITE_END
OAMR_27:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0008, -15, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0010, -7, -24
    ANIM_SPRITE_END
OAMR_28:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x000C, -6, -14
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0030, 4, -22
    ANIM_SPRITE_END
OAMR_29:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, 0, -8
    ANIM_SPRITE_END
OAMR_30:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x009F, 0, -8
    ANIM_SPRITE_END
OAMR_31:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, 0, -8
    ANIM_SPRITE_END
OAMR_32:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x009F, 0, -8
    ANIM_SPRITE_END
OAMR_33:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, 0, -8
    ANIM_SPRITE_END
OAMR_34:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0012, -16, -16
    ANIM_SPRITE_END
OAMR_35:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0056, -15, 0
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x001A, -15, -16
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x001C, 1, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0039, 9, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -6, -24
    ANIM_SPRITE_END
OAMR_36:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0016, -15, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -6, -24
    ANIM_SPRITE_END
OAMR_37:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, -16, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -8, -24
    ANIM_SPRITE_END
OAMR_38:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_32, 0x0084, -16, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -8, -24
    ANIM_SPRITE_END
OAMR_39:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x008E, 17, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0090, 33, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00CE, 17, -1
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00B1, 41, -9
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x00AD, 9, -9
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00E8, 9, 7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00EA, 25, 7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x008D, 9, -17
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CB, 17, -25
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
@ BANIM_OAML_magm_mg1:
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0004, -8, -24
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0006, -17, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0044, -9, -24
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x000A, -18, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x000E, -12, -24
    ANIM_SPRITE_END
OAML_3:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0010, -25, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x002E, -17, -24
    ANIM_SPRITE_END
OAML_4:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0014, -25, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x004E, -25, -24
    ANIM_SPRITE_END
OAML_5:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0018, -30, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x001C, -22, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001E, -30, -25
    ANIM_SPRITE_END
OAML_6:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, -33, -18
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0084, -17, -26
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, -33, -26
    ANIM_SPRITE_END
OAML_7:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x00DA, -12, -22
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0086, -33, -18
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0084, -17, -26
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, -33, -26
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00C4, -41, -18
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00C5, -41, -2
    ANIM_SPRITE_END
OAML_8:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x008A, -38, -18
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00EF, -6, 6
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00CE, -6, -18
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00AE, -30, -26
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x008E, -14, -26
    ANIM_SPRITE_END
OAML_9:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x009C, -4, -23
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x009E, -12, -23
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00FF, -20, 1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0090, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F4, -45, 7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0094, -53, -14
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00D4, -29, -25
    ANIM_SPRITE_END
OAML_10:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0096, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x009A, -53, -14
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00E5, -29, -25
    ANIM_SPRITE_END
OAML_11:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0044, -53, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0004, -37, -25
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0024, -53, -25
    ANIM_SPRITE_END
OAML_12:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0006, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, -53, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x004A, -53, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x006A, -29, -25
    ANIM_SPRITE_END
OAML_13:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x000C, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0010, -53, -9
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -53, 7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0070, -29, -25
    ANIM_SPRITE_END
OAML_14:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0012, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0016, -45, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0076, -29, -25
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x003F, -45, -9
    ANIM_SPRITE_END
OAML_15:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0017, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x007F, -29, -25
    ANIM_SPRITE_END
OAML_16:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x001B, -37, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x005F, -24, -25
    ANIM_SPRITE_END
OAML_17:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, -33, -15
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0084, -25, -23
    ANIM_SPRITE_END
OAML_18:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0086, -27, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00A4, -19, -24
    ANIM_SPRITE_END
OAML_19:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x008A, -25, -16
    ANIM_SPRITE_END
OAML_20:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0024, 6, -15
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0004, -8, -24
    ANIM_SPRITE_END
OAML_21:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x008E, -19, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00C4, -11, -24
    ANIM_SPRITE_END
OAML_22:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0092, -21, -15
    ANIM_SPRITE_END
OAML_23:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0096, -19, -15
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00DE, -27, -7
    ANIM_SPRITE_END
OAML_24:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x009A, -26, -15
    ANIM_SPRITE_END
OAML_25:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0000, -19, -16
    ANIM_SPRITE_END
OAML_26:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0004, -16, -16
    ANIM_SPRITE_END
OAML_27:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0008, -17, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0010, -9, -24
    ANIM_SPRITE_END
OAML_28:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x000C, -26, -14
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0030, -20, -22
    ANIM_SPRITE_END
OAML_29:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, -8, -8
    ANIM_SPRITE_END
OAML_30:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x009F, -8, -8
    ANIM_SPRITE_END
OAML_31:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, -8, -8
    ANIM_SPRITE_END
OAML_32:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x009F, -8, -8
    ANIM_SPRITE_END
OAML_33:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x001F, -8, -8
    ANIM_SPRITE_END
OAML_34:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0012, -16, -16
    ANIM_SPRITE_END
OAML_35:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0056, -17, 0
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x001A, -1, -16
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x001C, -9, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0039, -17, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -10, -24
    ANIM_SPRITE_END
OAML_36:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0016, -17, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -10, -24
    ANIM_SPRITE_END
OAML_37:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0080, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -8, -24
    ANIM_SPRITE_END
OAML_38:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_32, 0x0084, -16, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0050, -8, -24
    ANIM_SPRITE_END
OAML_39:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x008E, -33, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0090, -41, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00CE, -33, -1
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00B1, -49, -9
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x00AD, -17, -9
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00E8, -25, 7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00EA, -33, 7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x008D, -17, -17
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00CB, -25, -25
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
@ BANIM_SCR_magm_mg1:
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x2E
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x06, OAMR_6 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_0, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_0, 0x0A, OAMR_10 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x47
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x27, OAMR_39 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_1, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x11, OAMR_17 - OAMR
    ANIMSCR_FRAME 0x05, BANIM_IMG_magm_mg1_1, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x14, OAMR_20 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x2E
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x47
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x05, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x15, OAMR_21 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x16, OAMR_22 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x17, OAMR_23 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x18, OAMR_24 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_2, 0x19, OAMR_25 - OAMR
    ANIMSCR_CMD 0x2F
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x1A, OAMR_26 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_2, 0x22, OAMR_34 - OAMR
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x23, OAMR_35 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_2, 0x24, OAMR_36 - OAMR
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x25, OAMR_37 - OAMR
    ANIMSCR_FRAME 0x0B, BANIM_IMG_magm_mg1_2, 0x26, OAMR_38 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x2E
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x06, OAMR_6 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_0, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_0, 0x0A, OAMR_10 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x47
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x27, OAMR_39 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_1, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x11, OAMR_17 - OAMR
    ANIMSCR_FRAME 0x05, BANIM_IMG_magm_mg1_1, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x14, OAMR_20 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x20, OAMR_32 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x20, OAMR_32 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x20, OAMR_32 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x20, OAMR_32 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_CMD 0x2F
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_FRAME 0x0B, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x2E
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x47
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x21, OAMR_33 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_FRAME 0x05, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_1, 0x1F, OAMR_31 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x1D, OAMR_29 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x2E
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x06, OAMR_6 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_0, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_0, 0x0A, OAMR_10 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x47
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x27, OAMR_39 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_1, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x11, OAMR_17 - OAMR
    ANIMSCR_FRAME 0x05, BANIM_IMG_magm_mg1_1, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x14, OAMR_20 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x15, OAMR_21 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x16, OAMR_22 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x17, OAMR_23 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x18, OAMR_24 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_2, 0x19, OAMR_25 - OAMR
    ANIMSCR_CMD 0x2F
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x1A, OAMR_26 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_2, 0x22, OAMR_34 - OAMR
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x23, OAMR_35 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_2, 0x24, OAMR_36 - OAMR
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x25, OAMR_37 - OAMR
    ANIMSCR_FRAME 0x0B, BANIM_IMG_magm_mg1_2, 0x26, OAMR_38 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x2E
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x06, OAMR_6 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_0, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_0, 0x0A, OAMR_10 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x47
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x27, OAMR_39 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_1, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x11, OAMR_17 - OAMR
    ANIMSCR_FRAME 0x05, BANIM_IMG_magm_mg1_1, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x14, OAMR_20 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x1B, OAMR_27 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x1C, OAMR_28 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x1B, OAMR_27 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x1B, OAMR_27 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x1C, OAMR_28 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_2, 0x1B, OAMR_27 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x03
    ANIMSCR_CMD 0x07
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x03, OAMR_3 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x04, OAMR_4 - OAMR
    ANIMSCR_CMD 0x2E
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x05, OAMR_5 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x06, OAMR_6 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_0, 0x07, OAMR_7 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_0, 0x08, OAMR_8 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_CMD 0x05
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x09, OAMR_9 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_0, 0x0A, OAMR_10 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0B, OAMR_11 - OAMR
    ANIMSCR_CMD 0x47
    ANIMSCR_FRAME 0x01, BANIM_IMG_magm_mg1_2, 0x27, OAMR_39 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0C, OAMR_12 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0D, OAMR_13 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x0E, OAMR_14 - OAMR
    ANIMSCR_FRAME 0x08, BANIM_IMG_magm_mg1_1, 0x0F, OAMR_15 - OAMR
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x10, OAMR_16 - OAMR
    ANIMSCR_FRAME 0x04, BANIM_IMG_magm_mg1_1, 0x11, OAMR_17 - OAMR
    ANIMSCR_FRAME 0x05, BANIM_IMG_magm_mg1_1, 0x12, OAMR_18 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x02, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x06
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_1, 0x13, OAMR_19 - OAMR
    ANIMSCR_CMD 0x1B
    ANIMSCR_FRAME 0x03, BANIM_IMG_magm_mg1_0, 0x14, OAMR_20 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
@ BANIM_MODES_magm_mg1:
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
