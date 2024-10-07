#pragma once

#include "prelude.h"
#include "proc.h"

// func_fe6_08097E2C
void StartArenaScreen(void);
void StartArenaResultsScreen(void);
// ArenaUi_Init
// ArenaUi_BmEnd
// ArenaUi_WelcomeDialogue
// ArenaUi_WagerGoldDialogue
// ArenaUi_CheckConfirmation
// func_fe6_08098340
// func_fe6_08098390
// func_fe6_080983B0
// func_fe6_080983D0
// func_fe6_080983EC
// func_fe6_08098478
// func_fe6_08098490
// func_fe6_080984A8
// func_fe6_08098550
// func_fe6_080985AC
void StartArenaDialogue(int msg, ProcPtr proc);
// func_fe6_08098624
// Arena_PlayResultSong
// Arena_PlayArenaSong

extern CONST_DATA struct ProcScr ProcScr_ArenaUiMain[];
extern CONST_DATA struct ProcScr ProcScr_ArenaUiResults[];
extern CONST_DATA struct ProcScr ProcScr_ArenaUiResultBgm[];
