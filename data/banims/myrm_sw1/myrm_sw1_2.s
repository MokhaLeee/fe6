.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0000, -3, -21
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0020, -4, -13
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0040, -11, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0042, 5, -5
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0060, -11, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x003E, 5, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x007F, 5, -21
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_32, 0x008D, -10, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0095, 6, -16
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00D5, 6, 0
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00EF, 6, 8
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_16, 0x0091, -2, -17
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0092, 6, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00F2, 6, 7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F4, 22, 7
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0097, 14, -17
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x00F5, 6, -1
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
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0000, -5, -21
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0020, -12, -13
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0040, -5, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0042, -13, -5
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0060, -5, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x003E, -21, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x007F, -13, -21
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_32, 0x008D, -6, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0095, -22, -16
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00D5, -22, 0
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00EF, -22, 8
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_16, 0x0091, -6, -17
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0092, -14, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00F2, -22, 7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x00F4, -30, 7
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0097, -30, -17
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x00F5, -22, -1
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
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_myrm_sw1_1, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x02, BANIM_IMG_myrm_sw1_1, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
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
