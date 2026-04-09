#include "prelude.h"
#include "hardware.h"
#include "oam.h"
#include "util.h"
#include "proc.h"

#include "ending.h"

void EndingStep1_Loop(struct ProcGameEnding *proc)
{
	proc->timer++;

	if (proc->timer > 0xF0)
		Proc_Break(proc);
}
