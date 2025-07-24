#include "prelude.h"
#include "proc.h"
#include "oam.h"
#include "util.h"
#include "hardware.h"
#include "banim_sprite.h"
#include "banim.h"
#include "banim_ekrdragon.h"
#include "constants/terrains.h"
#include "constants/songs.h"

/**
 * C26: banim_code_toss_sword
 * C27: banim_code_toss_shield
 */
struct ProcScr CONST_DATA ProcScr_EfxYushaSpinShield[] = {
	PROC_NAME_DEBUG("efxYushaSpinShield"),
	PROC_REPEAT(EfxYushaSpinShield_Null),
	PROC_END,
};

void NewEfxYushaSpinShield(struct Anim *anim, int r1)
{
	struct ProcEfx *proc;

	proc = SpawnProc(ProcScr_EfxYushaSpinShield, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	NewEfxYushaSpinShieldOBJ(anim, r1);
}

void EfxYushaSpinShield_Null(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxYushaSpinShieldOBJ[] = {
	PROC_NAME_DEBUG("efxYushaSpinShieldOBJ"),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_1),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_2),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_3),
	PROC_REPEAT(EfxYushaSpinShieldOBJ_4),
	PROC_END,
};

void NewEfxYushaSpinShieldOBJ(struct Anim *anim, int r1)
{
	u32 *scr1, *scr2;
	struct ProcEfxOBJ *proc;
	struct Anim *anim2;

	proc = SpawnProc(ProcScr_EfxYushaSpinShieldOBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->unk29 = r1;

	if (r1 == 0) {
		scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeA;
		scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeA;
	} else {
		scr1 = AnimScr_YushaSpinShieldOBJ_LeftTypeB;
		scr2 = AnimScr_YushaSpinShieldOBJ_RightTypeB;
	}

	anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
	proc->anim2 = anim2;

	/**
	 * oam2_data::chr = 0;
	 * oam2_data::pal = 0;
	 */
	anim2->oam2 &= 0xC00;

	if (GetAnimPosition(anim) == POS_L)
		anim2->oam2 |= OAM2_PAL(OBPAL_EFX_UNIT_L) + VRAMOFF_OBJ_4000 / CHR_LINE;
	else
		anim2->oam2 |= OAM2_PAL(OBPAL_EFX_UNIT_R) + VRAMOFF_OBJ_6000 / CHR_SIZE;
}

void EfxYushaSpinShieldOBJ_1(struct ProcEfxOBJ *proc)
{
	struct Anim *anim2 = proc->anim2;
	if (++proc->timer != 0x45)
		return;
	
	if (proc->unk29 == 0) {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_LeftTypeA;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_RightTypeA;
		}
	} else {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_LeftTypeB;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ2_RightTypeB;
		}
	}

	anim2->timer = 0;
	proc->timer = 0;
	Proc_Break(proc);
}

void EfxYushaSpinShieldOBJ_2(struct ProcEfxOBJ *proc)
{
	if (!(proc->anim->flags3 & ANIM_BIT3_C01_BLOCKING_IN_BATTLE))
		return;

	if (!(proc->anim->flags3 & ANIM_BIT3_HIT_EFFECT_APPLIED))
		return;

	proc->timer = 0;
	Proc_Break(proc);
}

void EfxYushaSpinShieldOBJ_3(struct ProcEfxOBJ *proc)
{
	struct Anim *anim2 = proc->anim2;

	if (CheckEkrHitDone() != true)
		return;

	if (proc->unk29 == 0) {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_LeftTypeA;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_RightTypeA;
		}
	} else {
		if (GetAnimPosition(proc->anim) == POS_L) {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_LeftTypeB;
		} else {
			anim2->script = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
			anim2->scrCur = AnimScr_YushaSpinShieldOBJ3_RightTypeB;
		}
	}

	anim2->timer = 0;
	proc->timer = 0;
	Proc_Break(proc);
}

void EfxYushaSpinShieldOBJ_4(struct ProcEfxOBJ *proc)
{
	if (++proc->timer == 0x14) {
		proc->timer = 0;
		BasRemove(proc->anim2);
		Proc_Break(proc);
	}
}

/**
 * C2C: banim_code_effect_sealed_sword_fire
 */
CONST_DATA struct ProcScr ProcScr_EfxHurtmutEff00[] = {
	PROC_NAME_DEBUG("efxHurtmutEff00"),
	PROC_REPEAT(EfxHurtmutEff00_Null),
	PROC_END,
};

void NewEfxHurtmutEff00(struct Anim *anim)
{
	struct ProcEfx *proc;

	if (gEfxBgSemaphore != 0)
		return;
	
	proc = SpawnProc(ProcScr_EfxHurtmutEff00, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;

	if (gEkrDistanceType == POS_L)
		NewEfxHurtmutEff00OBJ(anim);
	else
		NewEfxHurtmutEff01OBJ(anim);
}

void EfxHurtmutEff00_Null(struct ProcEfx *proc)
{
	Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxHurtmutEff00OBJ[] = {
	PROC_NAME_DEBUG("efxHurtmutEff00OBJ"),
	PROC_REPEAT(EfxHurtmutEff00OBJ_1),
	PROC_SLEEP(26),
	PROC_REPEAT(EfxHurtmutEff00OBJ_2),
	PROC_SLEEP(8),
	PROC_REPEAT(EfxHurtmutEff00OBJ_3),
	PROC_END,
};

void NewEfxHurtmutEff00OBJ(struct Anim *anim)
{
	struct ProcEfxOBJ *proc;
	gEfxBgSemaphore++;
	proc = SpawnProc(ProcScr_EfxHurtmutEff00OBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame);
}

void EfxHurtmutEff00OBJ_1(struct ProcEfxOBJ *proc)
{
	struct Anim *anim2 = proc->anim2;

	if (GetAnimPosition(proc->anim) == POS_R) {
		anim2->script = AnimScr_HurtmutEff00OBJ1_Right;
		anim2->scrCur = AnimScr_HurtmutEff00OBJ1_Right;
	} else {
		anim2->script = AnimScr_HurtmutEff00OBJ1_Left;
		anim2->scrCur = AnimScr_HurtmutEff00OBJ1_Left;
	}

	anim2->timer = 0;

	SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
	Proc_Break(proc);
}

void EfxHurtmutEff00OBJ_2(struct ProcEfxOBJ *proc)
{
	struct Anim *anim2 = proc->anim2;

	if (GetAnimPosition(proc->anim) == POS_R) {
		anim2->script = AnimScr_HurtmutEff00OBJ2_Right;
		anim2->scrCur = AnimScr_HurtmutEff00OBJ2_Right;
	} else {
		anim2->script = AnimScr_HurtmutEff00OBJ2_Left;
		anim2->scrCur = AnimScr_HurtmutEff00OBJ2_Left;
	}

	anim2->timer = 0;

	SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
	Proc_Break(proc);
}

void EfxHurtmutEff00OBJ_3(struct ProcEfxOBJ *proc)
{
	gEfxBgSemaphore--;
	BasRemove(proc->anim2);
	Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxHurtmutEff01OBJ[] = {
	PROC_NAME_DEBUG("efxHurtmutEff01OBJ"),
	PROC_REPEAT(EfxHurtmutEff01OBJ_1),
	PROC_SLEEP(58),
	PROC_REPEAT(EfxHurtmutEff01OBJ_2),
	PROC_SLEEP(21),
	PROC_REPEAT(EfxHurtmutEff01OBJ_3),
	PROC_END,
};

void NewEfxHurtmutEff01OBJ(struct Anim *anim)
{
	struct ProcEfxOBJ *proc;

	gEfxBgSemaphore++;
	proc = SpawnProc(ProcScr_EfxHurtmutEff01OBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame, AnimScr_ManaketeFlame);
}

void EfxHurtmutEff01OBJ_1(struct ProcEfxOBJ *proc)
{
	struct Anim *anim2 = proc->anim2;
	if (GetAnimPosition(proc->anim) == POS_R) {
		anim2->script = AnimScr_HurtmutEff01OBJ1_Right;
		anim2->scrCur = AnimScr_HurtmutEff01OBJ1_Right;
	} else {
		anim2->script = AnimScr_HurtmutEff01OBJ1_Left;
		anim2->scrCur = AnimScr_HurtmutEff01OBJ1_Left;
	}

	anim2->timer = 0;

	SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
	Proc_Break(proc);
}

void EfxHurtmutEff01OBJ_2(struct ProcEfxOBJ *proc)
{
	struct Anim *anim2 = proc->anim2;
	if (GetAnimPosition(proc->anim) == POS_R) {
		anim2->script = AnimScr_HurtmutEff01OBJ2_Right;
		anim2->scrCur = AnimScr_HurtmutEff01OBJ2_Right;
	} else {
		anim2->script = AnimScr_HurtmutEff01OBJ2_Left;
		anim2->scrCur = AnimScr_HurtmutEff01OBJ2_Left;
	}

	anim2->timer = 0;

	SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
	Proc_Break(proc);
}

void EfxHurtmutEff01OBJ_3(struct ProcEfxOBJ *proc)
{
	gEfxBgSemaphore--;
	BasRemove(proc->anim2);
	Proc_Break(proc);
}

/**
 * C2E: banim_code_effect_magic_rune_normal
 * C2F: banim_code_effect_magic_rune_critical
 */
struct ProcScr CONST_DATA ProcScr_EfxMagfcast[] = {
	PROC_NAME_DEBUG("efxMagfcast"),
	PROC_REPEAT(EfxMagfcast_Loop),
	PROC_END,
};

void NewEfxMagfcast(struct Anim *anim, int type)
{
    i16 banim_index;
    struct ProcEfx *proc;

    if (gEfxBgSemaphore != 0)
        return;

    SpellFx_SetBG1Position();
    proc = SpawnProc(ProcScr_EfxMagfcast, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    banim_index = gBanimIdx[GetAnimPosition(anim)];

#if !NONMATCHING
	if (banim_index == 0x11)
		goto L080571F8;
	if (banim_index > 0x11)
		goto L080571F8;
    switch (banim_index) {
    case 0xC:
    case 0xD:
        NewEfxMagfcastBG(proc->anim, type);
        return;
    default:
        break;
    }

	

L080571F8:
	NewEfxMagfcastBG(proc->anim, type + 2);
	return;
#else
    switch (banim_index) {
    case 0xC:
    case 0xD:
        NewEfxMagfcastBG(proc->anim, type);
        break;

	case 0x11:
    default:
        NewEfxMagfcastBG(proc->anim, type + 2);
        break;
    }
#endif
}

void EfxMagfcast_Loop(struct ProcEfx *proc)
{
	if (++proc->timer == 0x14)
		Proc_Break(proc);
}

const u16 FrameConfig_EfxMagFcastBg1[] = {
	0, 3,
	1, 4,
	2, 8,
	3, 4,
	4, 3,

	-1
};

const u16 FrameConfig_EfxMagFcastBg2[] = {
	5, 3,

	-1
};

const u16 FrameConfig_EfxMagFcastBg3[] = {
	0, 7,
	1, 7,
	2, 8,
	3, 11,
	4, 2,
	5, 2,
	6, 2,
	7, 2,

	-1
};

const u16 FrameConfig_EfxMagFcastBg4[] = {
	8, 3,
	9, 23,
	10, 4,
	11, 23,
	12, 4,
	13, 26,
	14, 4,
	15, 4,

	-1
};

struct ProcScr CONST_DATA ProcScr_EfxMagfcastBG[] = {
	PROC_NAME_DEBUG("efxMagfcastBG"),
	PROC_REPEAT(EfxMagfcastBG_Loop),
	PROC_END,
};

CONST_DATA u16 *TsaLut1_EfxMagfcastBG[] = {
	Tsa1_EfxMagfcastBG,
	Tsa2_EfxMagfcastBG,
	Tsa3_EfxMagfcastBG,
	Tsa4_EfxMagfcastBG,
	Tsa5_EfxMagfcastBG,
	Tsa6_EfxMagfcastBG,
};

CONST_DATA u16 *TsaLut2_EfxMagfcastBG[] = {
	Tsa7_EfxMagfcastBG,
	Tsa8_EfxMagfcastBG,
	Tsa9_EfxMagfcastBG,
	Tsa10_EfxMagfcastBG,
	Tsa11_EfxMagfcastBG,
	Tsa12_EfxMagfcastBG,
	Tsa13_EfxMagfcastBG,
	Tsa14_EfxMagfcastBG,
	Tsa15_EfxMagfcastBG,
	Tsa16_EfxMagfcastBG,
	Tsa17_EfxMagfcastBG,
	Tsa18_EfxMagfcastBG,
	Tsa19_EfxMagfcastBG,
	Tsa20_EfxMagfcastBG,
	Tsa21_EfxMagfcastBG,
	Tsa22_EfxMagfcastBG,
};

void NewEfxMagfcastBG(struct Anim *anim, u32 type)
{
	struct ProcEfxBG *proc;

	gEfxBgSemaphore++;
	proc = SpawnProc(ProcScr_EfxMagfcastBG, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->frame = 0;

	switch (type) {
	case 0:
		proc->frame_config = FrameConfig_EfxMagFcastBg1;
		proc->tsal = TsaLut1_EfxMagfcastBG;
		proc->tsar = TsaLut1_EfxMagfcastBG;
		break;

	case 1:
		proc->frame_config = FrameConfig_EfxMagFcastBg2;
		proc->tsal = TsaLut1_EfxMagfcastBG;
		proc->tsar = TsaLut1_EfxMagfcastBG;
		break;

	case 2:
		proc->frame_config = FrameConfig_EfxMagFcastBg3;
		proc->tsal = TsaLut2_EfxMagfcastBG;
		proc->tsar = TsaLut2_EfxMagfcastBG;
		break;

	case 3:
		proc->frame_config = FrameConfig_EfxMagFcastBg4;
		proc->tsal = TsaLut2_EfxMagfcastBG;
		proc->tsar = TsaLut2_EfxMagfcastBG;
		break;

	default:
		break;
	}

	SpellFx_RegisterBgGfx(Img_EfxMagfcastBG, 0x2000);
	SpellFx_RegisterBgPal(Pal_EfxMagfcastBG, 0x20);
	SpellFx_SetSomeColorEffect();

	if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
		if (GetAnimPosition(proc->anim) == POS_L)
			SetBgOffset(BG_1, 0x18, 0x0);
		else
			SetBgOffset(BG_1, 0xE8, 0x0);
	}
}

void EfxMagfcastBG_Loop(struct ProcEfxBG *proc)
{
	i16 ret = EfxAdvanceFrameLut(
		(void *)&proc->timer,
		(void *)&proc->frame,
		proc->frame_config
	);

	if (ret >= 0) {
		u16 **tsa1;
		u16 **tsa2;

		tsa1 = proc->tsal;
		tsa2 = proc->tsar;

		SpellFx_WriteBgMap(
			proc->anim,
			tsa1[ret],
			tsa2[ret]
		);

		return;
	}

	if (ret == -1) {
		SpellFx_ClearBG1();
		gEfxBgSemaphore--;
		SpellFx_ClearColorEffects();
		Proc_End(proc);
	}
}

/**
 * C30: banim_code_effect_dirt_kick
 * C31: banim_code_effect_dirt_wave_small
 * C32: banim_code_effect_dirt_wave_medium
 */
struct ProcScr CONST_DATA ProcScr_EfxSunakemuri[] = {
	PROC_NAME_DEBUG("efxSunakemuri"),
	PROC_REPEAT(EfxSunakemuri_Null),
	PROC_END,
};

void NewEfxSunakemuri(struct Anim *anim, int type)
{
	if (gEfxBgSemaphore == 0) {
		struct ProcEfx *proc;

		proc = SpawnProc(ProcScr_EfxSunakemuri, PROC_TREE_3);
		proc->anim = anim;
		proc->timer = 0;
		NewEfxSunakemuriOBJ(anim, type);
	}
}

void EfxSunakemuri_Null(struct ProcEfx *proc)
{
	Proc_Break(proc);
}

struct ProcScr CONST_DATA ProcScr_EfxSunakemuriOBJ[] = {
	PROC_NAME_DEBUG("efxSunakemuriOBJ"),
	PROC_REPEAT(EfxSunakemuriOBJ_Loop),
	PROC_END,
};

void NewEfxSunakemuriOBJ(struct Anim *anim, int type)
{
	int terrain;
	u32 *scr1, *scr2;
	struct ProcEfxOBJ *proc;

	gEfxBgSemaphore++;
	proc = SpawnProc(ProcScr_EfxSunakemuriOBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;

	scr1 = AnimScr_EfxSunakemuriOBJ1_R;
	if (type != 0) {
		scr1 = AnimScr_EfxSunakemuriOBJ3_R;
		if (type == 1)
			scr1 = AnimScr_EfxSunakemuriOBJ2_R;
	}

	scr2 = AnimScr_EfxSunakemuriOBJ1_L;
	if (type != 0) {
		scr2 = AnimScr_EfxSunakemuriOBJ3_L;
		if (type == 1)
			scr2 = AnimScr_EfxSunakemuriOBJ2_L;
	}

	proc->anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);

	terrain = gBanimTerrain[GetAnimPosition(proc->anim)];
	switch (terrain) {
	case TERRAIN_PLAINS:
	case TERRAIN_ROAD:
	case TERRAIN_VILLAGE:
	case TERRAIN_VILLAGE_CLOSED:
	case TERRAIN_HOUSE:
	case TERRAIN_FORT:
	case TERRAIN_FOREST:
	case TERRAIN_THICKET:
	case TERRAIN_SAND:
	case TERRAIN_DESERT:
	case TERRAIN_MOUNTAIN:
	case TERRAIN_PEAK:
	case TERRAIN_BRIDGE:
	case TERRAIN_FENCE_19:
	case TERRAIN_WALL:
	case TERRAIN_WALL_BREAKABLE:
	case TERRAIN_RUBBLE:
	case TERRAIN_ROOF:
	case TERRAIN_GATE_23:
	case TERRAIN_RUINS:
	case TERRAIN_CLIFF:
	case TERRAIN_BALLISTA:
	case TERRAIN_LONGBALLISTA:
	case TERRAIN_KILLERBALLISTA:
	case TERRAIN_SHIP_FLAT:
	case TERRAIN_SHIP_WRECK:
	case TERRAIN_GLACIER:
#if FE8
	case TERRAIN_SNAG:
	case TERRAIN_INN:
	case TERRAIN_BARREL:
	case TERRAIN_BONE:
	case TERRAIN_DARK:
	case TERRAIN_GUNNELS:
	case TERRAIN_BRACE:
	case TERRAIN_MAST:
#endif
		SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
		break;
	
	case TERRAIN_DRAWBRIDGE:
		if (IsAnimSoundInPosition(proc->anim) != POS_L)
			SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ1, 0x20);
		else
			SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
		break;

	case TERRAIN_RIVER:
	case TERRAIN_SEA:
	case TERRAIN_LAKE:
#if FE8
	case TERRAIN_DEEPS:
	case TERRAIN_WATER:
#endif
		SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ2, 0x20);
		break;

	case TERRAIN_ARMORY:
	case TERRAIN_VENDOR:
	case TERRAIN_ARENA_08:
	case TERRAIN_C_ROOM_09:
	case TERRAIN_GATE_0B:
	case TERRAIN_FLOOR_17:
	case TERRAIN_FLOOR_18:
	case TERRAIN_PILLAR:
	case TERRAIN_DOOR:
	case TERRAIN_THRONE:
	case TERRAIN_CHEST_OPENED:
	case TERRAIN_CHEST:
	case TERRAIN_CHURCH:
	case TERRAIN_STAIRS:
	case TERRAIN_ARENA_30:
	case TERRAIN_VALLEY:
	case TERRAIN_FENCE_32:
#if FE8
	case TERRAIN_RUINS_37:
	case TERRAIN_DECK:
#endif
		SpellFx_RegisterObjPal(Pal_EfxSunakemuriOBJ3, 0x20);
		break;

	case TERRAIN_TILE_00:
	default:
		break;
	}

	SpellFx_RegisterObjGfx(Img_EfxSunakemuriOBJ, 0x1000);
}

void EfxSunakemuriOBJ_Loop(struct ProcEfxOBJ *proc)
{
	if (++proc->timer == 0x9) {
		gEfxBgSemaphore--;
		BasRemove(proc->anim2);
		Proc_Break(proc);
	}
}

/**
 * C39: banim_code_hit_fake
 */
struct ProcScr CONST_DATA ProcScr_EfxKingPika[] = {
	PROC_NAME_DEBUG("efxKingPika"),
	PROC_REPEAT(EfxKingPika_Loop),
	PROC_END,
};

void NewEfxKingPika(struct Anim *anim)
{
	struct ProcEfx *proc;

	proc = SpawnProc(ProcScr_EfxKingPika, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
}

void EfxKingPika_Loop(struct ProcEfx *proc)
{
	struct Anim *anim = proc->anim;
	int time = ++proc->timer;

	if (time == 0x1) {
		NewEfxFlashUnit(anim, 0x1, 0x28, 0x0);
		return;
	}

	if (time == 0xA) {
		NewEfxFlashBgWhite(anim, 0x14);
		return;
	}

	if (time == 0x2D) {
		struct Anim *anim1 = gAnims[GetAnimPosition(anim) * 2];
		struct Anim *anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

		anim1->flags3 |= ANIM_BIT3_BLOCKEND;
		anim2->flags3 |= ANIM_BIT3_BLOCKEND;
		Proc_Break(proc);
	}
}

/**
 * C44: singer
 */
struct ProcScr CONST_DATA ProcScr_EfxSongFE6[] =
{
	PROC_19,
	PROC_REPEAT(EfxSongFE6_Loop),
	PROC_END,
};

void NewEfxSongFE6(struct Anim *anim)
{
	struct ProcEfxOBJ *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxSongFE6, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->terminator = 40;

	proc->anim2 = EfxCreateFrontAnim(
						proc->anim,
						AnimScr_EfxSongFE6,
						AnimScr_EfxSongFE6,
						AnimScr_EfxSongFE6,
						AnimScr_EfxSongFE6);

	SpellFx_RegisterObjPal(Pal_EfxSongFE6, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxSongFE6, 0x1000);
	PlaySFX(SONG_EE, 0x100, proc->anim->xPosition, 1);
}

void EfxSongFE6_Loop(struct ProcEfxOBJ * proc)
{
	if (++proc->timer == 0x18)
		PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);

	if (proc->timer > proc->terminator) {
		BasRemove(proc->anim2);
		gEfxBgSemaphore--;
		Proc_Break(proc);
	}
}

/**
 * C45: dancer
 */
struct ProcScr CONST_DATA ProcScr_EfxDanceOBJ[] = {
    PROC_NAME_DEBUG("efxDanceOBJ"),
    PROC_REPEAT(EfxDanceOBJ_Loop),
    PROC_END,
};

void NewEfxDanceOBJ(struct Anim *anim)
{
	struct ProcEfxOBJ *proc;

	gEfxBgSemaphore++;

	proc = SpawnProc(ProcScr_EfxDanceOBJ, PROC_TREE_3);
	proc->anim = anim;
	proc->timer = 0;
	proc->terminator = 25;

	proc->anim2 = EfxCreateFrontAnim(
						proc->anim,
						AnimScr_EfxDanceObj,
						AnimScr_EfxDanceObj,
						AnimScr_EfxDanceObj,
						AnimScr_EfxDanceObj);

	SpellFx_RegisterObjPal(Pal_EfxSongFE6, 0x20);
	SpellFx_RegisterObjGfx(Img_EfxSongFE6, 0x1000);
	PlaySFX(SONG_E1, 0x100, proc->anim->xPosition, 1);
}

void EfxDanceOBJ_Loop(struct ProcEfxOBJ *proc)
{
	if (++proc->timer > proc->terminator) {
		BasRemove(proc->anim2);
		gEfxBgSemaphore--;
		Proc_Break(proc);
	}
}

/**
 * UNK
 */
struct ProcScr CONST_DATA ProcScr_EfxUnk_085D371C[] =
{
    PROC_19,
    PROC_REPEAT(ProEfx_Unk085D371C_1),
    PROC_REPEAT(ProEfx_Unk085D371C_2),
    PROC_END,
};

void NewEfx_Unk_08057754(struct Anim *anim, int duration, int hi)
{
	register int mosaic asm("r2");
	struct ProcEfxBG *proc;

	if (GetEkrDragonStateType() != 0)
		return;

	gEfxBgSemaphore++;
	proc = SpawnProc(ProcScr_EfxUnk_085D371C, PROC_TREE_3);
	proc->anim = anim;

	mosaic = 0;
	proc->timer = 0;
	proc->terminator = duration;
	proc->unk30 = hi;

	SetMosaic(3, mosaic);
}

#if NONMATCHING

void ProEfx_Unk085D371C_1(struct ProcEfxBG *proc)
{
	int ret;
	u8 *disp;
	u8 *mosaic;

	ret = Interpolate(
		INTERPOLATE_LINEAR,
		0, proc->unk30,
		proc->timer, proc->terminator
	);

	disp = ((u8 *) &gDispIo);
	mosaic = disp + 0x38;

	*mosaic = (ret & 0xF) | (ret << 4);

	if (++proc->timer > proc->terminator) {
		proc->timer = 0;
		Proc_Break(proc);
	}
}

#else

NAKEDFUNC
void ProEfx_Unk085D371C_1(struct ProcEfxBG *proc)
{
asm("\
	.syntax unified\n\
	push {r4, lr}\n\
	sub sp, #4\n\
	adds r4, r0, #0\n\
	movs r0, #0x30\n\
	ldrsh r2, [r4, r0]\n\
	movs r1, #0x2c\n\
	ldrsh r3, [r4, r1]\n\
	movs r1, #0x2e\n\
	ldrsh r0, [r4, r1]\n\
	str r0, [sp]\n\
	movs r0, #0\n\
	movs r1, #0\n\
	bl Interpolate\n\
	ldr r2, .L080577F0 @ =gDispIo\n\
	adds r2, #0x38\n\
	movs r3, #0xf\n\
	adds r1, r0, #0\n\
	ands r1, r3\n\
	lsls r0, r0, #4\n\
	orrs r0, r1\n\
	strb r0, [r2]\n\
	ldrh r0, [r4, #0x2c]\n\
	adds r0, #1\n\
	strh r0, [r4, #0x2c]\n\
	lsls r0, r0, #0x10\n\
	ldrh r2, [r4, #0x2e]\n\
	lsls r1, r2, #0x10\n\
	cmp r0, r1\n\
	ble .L080577E6\n\
	movs r0, #0\n\
	strh r0, [r4, #0x2c]\n\
	adds r0, r4, #0\n\
	bl Proc_Break\n\
.L080577E6:\n\
	add sp, #4\n\
	pop {r4}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L080577F0: .4byte gDispIo\n\
	.syntax divided\n\
");
}

#endif
