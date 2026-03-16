#include "prelude.h"
#include "hardware.h"
#include "proc.h"
#include "prepscreen.h"

struct ProcScr CONST_DATA ProcScr_PrepBgScrolling[] =
{
    PROC_SLEEP(0),
    PROC_CALL(PrepBgScrolling_Init),
    PROC_SLEEP(0),
    PROC_REPEAT(PrepBgScrolling_Loop),
PROC_LABEL(0),
    PROC_CALL(PrepBgScrolling_End),
    PROC_END,
};

#if 0
void PrepBgScrolling_Loop(struct Proc_0867968C *proc)
{
	int voffs;

	if (proc->timer == 3) {
		proc->pos++;

		if (proc->pos == 0x500)
			proc->pos = 0;

		SetBgOffset(BG_3, 0, 0xFF & proc->pos);

		voffs = 0xFF & proc->pos;
		REG_BG3VOFS = voffs;
		proc->timer = 0;
	}

	proc->timer++;

	if ((proc->pos & 7) == 0) {
		u16 i;

		for (i = 0; i < 30; i++) {

		}
		const u16 *tsa = Tsa_MonologueScrollingBG;
	}
}
#endif

void PrepBgScrolling_End(struct Proc_0867968C *proc)
{}

ProcPtr func_fe6_08082560(ProcPtr parent)
{
	return SpawnProc(ProcScr_PrepBgScrolling, PROC_TREE_VSYNC);
}
