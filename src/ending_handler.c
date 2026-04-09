#include "prelude.h"
#include "proc.h"

#include "ending.h"

void StartGameCredit(void)
{
    SpawnProc(ProcScr_GameCredit, PROC_TREE_3);
}
