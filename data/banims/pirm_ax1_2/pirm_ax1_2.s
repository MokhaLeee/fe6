
.section .data.oamr
BANIM_OAMR_pirm_ax1_2:
BANIM_OAMR_pirm_ax1_2_0:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x0001, -7, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0060, -15, 8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x009D, -15, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00DD, -15, 0
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x005E, 9, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -7, -24
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BC, 17, -8
    ANIM_SPRITE_END
BANIM_OAMR_pirm_ax1_2_1:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0020, -14, -10
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0000, -6, -18
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0002, 10, -18
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0061, -14, 6
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0060, 3, -26
    ANIM_SPRITE_END
BANIM_OAMR_pirm_ax1_2_2:
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0045, -14, -2
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0008, -6, -10
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0049, 10, -10
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0069, 18, -10
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, -1, -26
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0028, 15, -26
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
BANIM_OAML_pirm_ax1_2:
BANIM_OAML_pirm_ax1_2_0:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x0001, -9, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0060, 7, 8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x009D, 7, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00DD, 7, 0
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x005E, -17, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -1, -24
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00BC, -25, -8
    ANIM_SPRITE_END
BANIM_OAML_pirm_ax1_2_1:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0020, -18, -10
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0000, -10, -18
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0002, -18, -18
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0061, -18, 6
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0060, -11, -26
    ANIM_SPRITE_END
BANIM_OAML_pirm_ax1_2_2:
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0045, -18, -2
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0008, -10, -10
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0049, -18, -10
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0069, -26, -10
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x000A, -15, -26
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0028, -23, -26
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
BANIM_SCR_pirm_ax1_2
BANIM_SCR_pirm_ax1_2_NORMAL_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_RANGED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_STANDING:
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_STANDING2:
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

BANIM_SCR_pirm_ax1_2_MISSED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, 0x086A50D4, 0x00, 0x0000
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_FRAME 0x01, 0x086A63BC, 0x02, 0x00A8
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, 0x086A63BC, 0x01, 0x0060
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
    .word BANIM_SCR_pirm_ax1_2_NORMAL_ATK - BANIM_SCR_pirm_ax1_2_START @ 0x0
    .word BANIM_SCR_pirm_ax1_2_NORMAL_ATK_PRIORITY_L - BANIM_SCR_pirm_ax1_2_START @ 0x44
    .word BANIM_SCR_pirm_ax1_2_CRIT_ATK - BANIM_SCR_pirm_ax1_2_START @ 0x88
    .word BANIM_SCR_pirm_ax1_2_CRIT_ATK_PRIORITY_L - BANIM_SCR_pirm_ax1_2_START @ 0xCC
    .word BANIM_SCR_pirm_ax1_2_RANGED_ATK - BANIM_SCR_pirm_ax1_2_START @ 0x110
    .word BANIM_SCR_pirm_ax1_2_RANGED_CRIT_ATK - BANIM_SCR_pirm_ax1_2_START @ 0x154
    .word BANIM_SCR_pirm_ax1_2_CLOSE_DODGE - BANIM_SCR_pirm_ax1_2_START @ 0x198
    .word BANIM_SCR_pirm_ax1_2_RANGED_DODGE - BANIM_SCR_pirm_ax1_2_START @ 0x1DC
    .word BANIM_SCR_pirm_ax1_2_STANDING - BANIM_SCR_pirm_ax1_2_START @ 0x220
    .word BANIM_SCR_pirm_ax1_2_STANDING2 - BANIM_SCR_pirm_ax1_2_START @ 0x234
    .word BANIM_SCR_pirm_ax1_2_RANGED_STANDING - BANIM_SCR_pirm_ax1_2_START @ 0x248
    .word BANIM_SCR_pirm_ax1_2_MISSED_ATK - BANIM_SCR_pirm_ax1_2_START @ 0x25C
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0

.section .data.frames
