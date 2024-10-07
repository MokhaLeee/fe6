#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "bm.h"
#include "oam.h"
#include "sound.h"
#include "sprite.h"
#include "text.h"
#include "ui.h"
#include "prepscreen.h"
#include "constants/msg.h"

CONST_DATA int HelpboxMsg_0867929C[3] = { MSG_664, MSG_665, MSG_660 };

u16 CONST_DATA Sprite_086792A8[] =
{
    2,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x2) + OAM2_LAYER(2) + OAM2_PAL(4),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(32), OAM2_CHR(0x3) + OAM2_LAYER(2) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_086792B6[] =
{
    2,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(32), OAM2_CHR(0x2) + OAM2_LAYER(2) + OAM2_PAL(4),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x3) + OAM2_LAYER(2) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_086792C4[] =
{
    4,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x2) + OAM2_LAYER(2) + OAM2_PAL(4),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(32), OAM2_CHR(0x3) + OAM2_LAYER(2) + OAM2_PAL(4),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(64), OAM2_CHR(0x3) + OAM2_LAYER(2) + OAM2_PAL(4),
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32 + OAM1_X(72), OAM2_CHR(0x3) + OAM2_LAYER(2) + OAM2_PAL(4),
};

u16 CONST_DATA Sprite_086792DE[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2C),
};

u16 CONST_DATA Sprite_086792E6[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x2E),
};

u16 CONST_DATA Sprite_086792EE[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x30),
};

u16 CONST_DATA Sprite_086792F6[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x32),
};

u16 CONST_DATA Sprite_086792FE[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x34),
};

u16 CONST_DATA Sprite_08679306[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x36),
};

u16 CONST_DATA Sprite_0867930E[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x38),
};

u16 CONST_DATA Sprite_08679316[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x3A),
};

u16 CONST_DATA Sprite_0867931E[] =
{
    1,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x3C),
};

u16 CONST_DATA Sprite_08679326[] =
{
    1,
    OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x7),
};

u16 CONST_DATA * Sprites_08679330[] =
{
    Sprite_086792DE,
    Sprite_086792E6,
    Sprite_086792EE,
    Sprite_086792F6,
    Sprite_086792FE,
    Sprite_08679306,
    Sprite_0867930E,
    Sprite_08679316,
    Sprite_0867931E,
};

u8 CONST_DATA gUnk_08679354[20] =
{
    0, 0, 1, 1, 2, 2,
    3, 3, 4, 4, 5, 5,
    6, 6, 7, 7, 9, 11,
    0, 0
};

struct ProcScr CONST_DATA ProcScr_08679368[] =
{
    PROC_19,
    PROC_CALL(func_fe6_0807CF78),
    PROC_REPEAT(func_fe6_0807CFA0),
    PROC_END,
};

#if NONMATCHING
void func_fe6_0807CF78(struct ProcPrepfx_08679368 * proc)
{
    InitTextDb(proc->text1, 12);
    InitTextDb(proc->text2, 12);
    InitText(proc->text3, 12);
}
#else

NAKEDFUNC
void func_fe6_0807CF78(struct ProcPrepfx_08679368 * proc)
{
asm("\
    .syntax unified\n\
    push {r4, lr}\n\
    adds r4, r0, #0\n\
    adds r0, #0x34\n\
    movs r1, #0xc\n\
    bl InitTextDb\n\
    adds r0, r4, #0\n\
    adds r0, #0x3c\n\
    movs r1, #0xc\n\
    bl InitTextDb\n\
    adds r0, r4, #0\n\
    adds r0, #0x44\n\
    movs r1, #0xc\n\
    bl InitText\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
");
}
#endif

void func_fe6_0807CFA0(struct ProcPrepfx_08679368 * proc)
{
    return;
}

struct ProcPrepfx_08679368 * func_fe6_0807CFA4(ProcPtr parent)
{
    return SpawnProc(ProcScr_08679368, parent);
}

struct ProcScr CONST_DATA ProcScr_08679388[] =
{
    PROC_19,
    PROC_CALL(func_fe6_0807CFBC),
    PROC_REPEAT(func_fe6_0807CFDC),
    PROC_END,
};

void func_fe6_0807CFB8(int a, int b, int c)
{
    return;
}

void func_fe6_0807CFBC(struct ProcPrepfx_086793A8 * proc)
{
    proc->timer = 0;

    if (proc->proc_parent->unk2D <= 3)
        proc->obj_offset = 0x7200;
    else
        proc->obj_offset = 0x5000;
}

void func_fe6_0807CFDC(struct ProcPrepfx_086793A8 * proc)
{
    PutSpriteExt(0xB, OAM1_HFLIP, 0, Sprite_086792B6, proc->obj_offset / 0x20);
    PutSpriteExt(0xB, 0xB0,       0, Sprite_086792A8, proc->obj_offset / 0x20);

    PutUiHand(
        proc->proc_parent->unk2F * 0x70 + 0x10,
        proc->proc_parent->unk2E * 0x10 + 0x48);

    if (proc->proc_parent->unk30 != 0xFF)
    {
        PutFrozenUiHand(
            proc->proc_parent->unk30 * 0x70 + 0x10,
            proc->proc_parent->unk31 * 0x10 + 0x48);
    }

    func_fe6_0807CFB8(0, 4, proc->timer);
    proc->timer++;
}

ProcPtr func_fe6_0807D074(ProcPtr parent)
{
    return SpawnProc(ProcScr_08679388, parent);
}

struct ProcScr CONST_DATA ProcScr_086793A8[] =
{
    PROC_19,
    PROC_CALL(func_fe6_0807D088),
    PROC_REPEAT(func_fe6_0807D0A8),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_086793C8[] =
{
    PROC_19,
    PROC_CALL(func_fe6_0807D180),
    PROC_REPEAT(func_fe6_0807D1AC),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_PrepSubItemScreen[] =
{
    PROC_19,
    PROC_SLEEP(0),
    PROC_CALL(func_fe6_0807E0D4),
PROC_LABEL(0),
    PROC_CALL(func_fe6_0807EB70),
PROC_LABEL(1),
    PROC_REPEAT(func_fe6_0807EDBC),
PROC_LABEL(2),
    PROC_CALL(func_fe6_0807E41C),
PROC_LABEL(3),
    PROC_REPEAT(func_fe6_0807E5A8),
PROC_LABEL(4),
    PROC_CALL(func_fe6_0807FCFC),
PROC_LABEL(5),
    PROC_REPEAT(func_fe6_0807FF98),
    PROC_REPEAT(func_fe6_08080284),
PROC_LABEL(7),
    PROC_CALL(func_fe6_080813E8),
PROC_LABEL(6),
    PROC_CALL(func_fe6_08081540),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_08679490[] =
{
    PROC_19,
    PROC_CALL(LockGame),
    PROC_SLEEP(0),
    PROC_CALL(func_fe6_0807E0D4),
PROC_LABEL(4),
    PROC_CALL(func_fe6_0807FCFC),
    PROC_SLEEP(0),
PROC_LABEL(5),
    PROC_REPEAT(func_fe6_0807FF98),
PROC_LABEL(7),
    PROC_SLEEP(0),
    PROC_REPEAT(func_fe6_08080284),
PROC_LABEL(6),
    PROC_CALL(func_fe6_08081540),
    PROC_SLEEP(0),
    PROC_CALL(UnlockGame),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_PrepDiscardItemScreen[] =
{
    PROC_19,
    PROC_SLEEP(1),
    PROC_CALL(func_fe6_0808171C),
PROC_LABEL(0),
    PROC_REPEAT(func_fe6_08081970),
PROC_LABEL(1),
    PROC_CALL(func_fe6_08081DF8),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_08679558[] =
{
    PROC_19,
    PROC_CALL(func_fe6_08081E50),
    PROC_REPEAT(func_fe6_08081E58),
    PROC_END,
};

u16 CONST_DATA Sprite_08679578[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08679580[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08679588[] =
{
    1,
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32, OAM2_CHR(0x1),
};

u16 CONST_DATA Sprite_08679590[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x15),
};

u16 CONST_DATA Sprite_08679598[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x16),
};

u16 CONST_DATA Sprite_086795A0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x14),
};

u16 CONST_DATA Sprite_086795A8[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xC),
};

u16 CONST_DATA Sprite_086795B0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xD),
};

u16 CONST_DATA Sprite_086795B8[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xE),
};

u16 CONST_DATA Sprite_086795C0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0xF),
};

u16 CONST_DATA Sprite_086795C8[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x10),
};

u16 CONST_DATA Sprite_086795D0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x11),
};

u16 CONST_DATA Sprite_086795D8[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x12),
};

u16 CONST_DATA Sprite_086795E0[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x13),
};

u16 CONST_DATA Sprite_086795E8[] =
{
    1,
    OAM0_SHAPE_8x16, OAM1_SIZE_8x16, 0,
};

u16 CONST_DATA Sprite_086795F0[] =
{
    1,
    OAM0_SHAPE_8x32, OAM1_SIZE_8x32, 0,
};
