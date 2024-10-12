#include "prelude.h"
#include "proc.h"
#include "face.h"
#include "hardware.h"
#include "constants/videoalloc_banim.h"
#include "constants/videoalloc_global.h"

#include "banim.h"

struct FaceVramEnt CONST_DATA FaceConfig_EkrLevelup[] = {
    [0] = { 0, 0xF },
    [1] = {0},
    [2] = {0},
    [3] = {0},
};

struct ProcScr CONST_DATA ProcScr_EkrLevelup[] = {
    PROC_NAME_DEBUG("ekrLevelup"),
    PROC_REPEAT(EkrLvup_Init),
    PROC_SLEEP(1),

    PROC_REPEAT(EkrLvup_InitLevelUpBox),
    PROC_REPEAT(func_fe6_0805DA08),
    PROC_REPEAT(func_fe6_0805DA38),
    PROC_REPEAT(func_fe6_0805DA7C),
    PROC_REPEAT(func_fe6_0805DBA4),
    PROC_SLEEP(20),
    PROC_REPEAT(func_fe6_0805DBD4),
    PROC_REPEAT(func_fe6_0805DC2C),
    PROC_REPEAT(func_fe6_0805DCB4),
    PROC_REPEAT(func_fe6_0805DD08),
    PROC_REPEAT(func_fe6_0805DD78),
    PROC_REPEAT(func_fe6_0805DDA8),
    PROC_REPEAT(func_fe6_0805DE8C),
    PROC_REPEAT(func_fe6_0805DEBC),
    PROC_REPEAT(func_fe6_0805DEC8),
    PROC_REPEAT(func_fe6_0805DF90),
    PROC_REPEAT(func_fe6_0805E104),
    PROC_END,
};
