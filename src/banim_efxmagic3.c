#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "oam.h"
#include "banim.h"
#include "banim_ekrdragon.h"
#include "constants/songs.h"

/**
 * Eclipse
 */
void StartSpellAnimEclipse(struct Anim * anim)
{
	struct ProcEfx * proc;

	SpellFx_Begin();
	NewEfxSpellCast();
	SpellFx_ClearBG1Position();

	proc = SpawnProc(ProcScr_EfxHazymoon, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}
