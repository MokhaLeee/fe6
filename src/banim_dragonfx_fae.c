#include "prelude.h"
#include "proc.h"

#include "banim_sprite.h"
#include "banim.h"
#include "banim_ekrbattle.h"
#include "banim_ekrdragon.h"

struct ProcScr CONST_DATA ProcScr_EkrDragonFae[] =
{
    PROC_19,
    PROC_REPEAT(func_fe6_08059A28),
    PROC_REPEAT(func_fe6_08059A44),
    PROC_REPEAT(func_fe6_08059AD0),
    PROC_REPEAT(func_fe6_08059B78),
    PROC_REPEAT(func_fe6_08059BE4),
    PROC_REPEAT(func_fe6_08059C38),
    PROC_REPEAT(func_fe6_08059C54),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_EkrFaefx[] =
{
    PROC_19,
    PROC_REPEAT(EkrFaeDeamon_Loop),
    PROC_END,
};

void * CONST_DATA TsaLut_EkrFaefx[] =
{
    (void *)0x081C8F58,
    (void *)0x081C9084,
    (void *)0x081C91CC,
    (void *)0x081C92F8,
    (void *)0x081C946C,
    (void *)0x081C9618,
    (void *)0x081C9794,
    (void *)0x081C9940,
    (void *)0x081C9A9C,
    (void *)0x081C9BB8,
    (void *)0x081C9CE4,
    (void *)0x081C9DEC,
};
