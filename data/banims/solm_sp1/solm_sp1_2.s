.include "macro.inc"
.include "animscr.inc"
.include "gba_sprites.inc"

.section .data.oamr
@ BANIM_OAMR_solm_sp1_2:
OAMR:
OAMR_0:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, -7, -8
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0042, 9, -8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0080, -7, 8
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0082, 9, 8
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0020, -5, -16
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0000, 1, -24
    ANIM_SPRITE_END
OAMR_1:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0003, -5, -21
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, 11, -13
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_32, 0x0043, -6, -5
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_16, 0x0083, -6, 11
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0001, 26, 3
    ANIM_SPRITE_END
OAMR_2:
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_16, 0x0007, -4, -13
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0009, 12, -13
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0047, -4, 3
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0049, 12, 3
    ANIM_SPRITE ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, -1, 11
    ANIM_SPRITE ATTR0_SQUARE, ATTR1_SIZE_8, 0x0026, 15, 11
    ANIM_SPRITE ATTR0_TALL, ATTR1_SIZE_8, 0x0002, 20, -5
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
@ BANIM_OAML_solm_sp1_2:
OAML:
OAML_0:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0040, -9, -8
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0042, -17, -8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0080, -9, 8
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0082, -17, 8
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0020, -11, -16
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0000, -9, -24
    ANIM_SPRITE_END
OAML_1:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0003, -11, -21
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0025, -19, -13
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_32, 0x0043, -26, -5
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_16, 0x0083, -26, 11
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0001, -34, 3
    ANIM_SPRITE_END
OAML_2:
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_16, 0x0007, -12, -13
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0009, -20, -13
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0047, -12, 3
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0049, -20, 3
    ANIM_SPRITE_XFLIP ATTR0_WIDE, ATTR1_SIZE_8, 0x0005, -15, 11
    ANIM_SPRITE_XFLIP ATTR0_SQUARE, ATTR1_SIZE_8, 0x0026, -23, 11
    ANIM_SPRITE_XFLIP ATTR0_TALL, ATTR1_SIZE_8, 0x0002, -28, -5
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
@ BANIM_SCR_solm_sp1_2:
SCR:
SCR_NORMAL_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_NORMAL_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CRIT_ATK_PRIORITY_L:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_CRIT_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_CLOSE_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_RANGED_DODGE:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED

SCR_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_STANDING2:
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_RANGED_STANDING:
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_BLOCKED

SCR_MISSED_ATK:
    ANIMSCR_CMD 0x02
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x00, OAMR_0 - OAMR
    ANIMSCR_CMD 0x0E
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_FRAME 0x01, BANIM_IMG_solm_sp1_2_0, 0x02, OAMR_2 - OAMR
    ANIMSCR_CMD 0x01
    ANIMSCR_FRAME 0x03, BANIM_IMG_solm_sp1_2_0, 0x01, OAMR_1 - OAMR
    ANIMSCR_CMD 0x0D
    ANIMSCR_BLOCKED


.section .data.modes
@ BANIM_MODES_solm_sp1_2:
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
