#include "prelude.h"
#include "banim.h"
#include "item.h"
#include "unit.h"
#include "battle.h"
#include "faction.h"
#include "constants/iids.h"
#include "constants/banims.h"

const u16 RoundTypes_NormalPhy[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_HIT_CLOSE
};

const u16 RoundTypes_NormalMag[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_MISS_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_MISS_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_MISS_CLOSE
};

const u16 gUnk_08112248[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_CRIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_CRIT_CLOSE
};

const u16 gUnk_08112252[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_TAKING_MISS_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_TAKING_MISS_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_TAKING_MISS_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_TAKING_MISS_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_TAKING_MISS_CLOSE
};

const u16 gUnk_0811225C[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_TAKING_HIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_TAKING_HIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_TAKING_HIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_TAKING_HIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_TAKING_HIT_CLOSE
};

const u16 gUnk_08112266[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_HIT_CLOSE
};

const u16 gUnk_08112270[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_CRIT_CLOSE,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_CRIT_CLOSE
};

const u16 gUnk_0811227A[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_HIT_CLOSE,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

const u16 gUnk_08112284[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_NONCRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

const u16 gUnk_0811228E[EKR_DISTANCE_MAX] = {
	[EKR_DISTANCE_CLOSE]       = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FAR]         = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_FARFAR]      = ANIM_ROUND_CRIT_FAR,
	[EKR_DISTANCE_MONOCOMBAT]  = ANIM_ROUND_INVALID,
	[EKR_DISTANCE_PROMOTION]   = ANIM_ROUND_INVALID
};

#if 0
void ParseBattleHitToBanimCmd(void)
{
	int local_distance_types[2];
	int unk_sp_20;
	struct BattleUnit *battle_units[2];

	gpEkrTriangleUnits[POS_L] = NULL;
	gpEkrTriangleUnits[POS_R] = NULL;

	if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
		gAnimRoundData[0 + POS_L] = ANIM_ROUND_TAKING_MISS_CLOSE;
		gAnimRoundData[0 + POS_R] = ANIM_ROUND_TAKING_MISS_CLOSE;

		gAnimRoundData[2 + POS_L] |= 0xFFFF;
		gAnimRoundData[2 + POS_R] |= 0xFFFF;
		return;
	}

	if (gBattleSt.flags & BATTLE_FLAG_REFRESH) {
		gAnimRoundData[0 + POS_L] = ANIM_ROUND_TAKING_HIT_CLOSE;
		gAnimRoundData[0 + POS_R] = ANIM_ROUND_TAKING_HIT_FAR;

		gAnimRoundData[2 + POS_L] |= 0xFFFF;
		gAnimRoundData[2 + POS_R] |= 0xFFFF;
		return;
	}

	local_distance_types[POS_L] = gEkrDistanceType;
	local_distance_types[POS_R] = gEkrDistanceType;

	unk_sp_20 = 0;

	battle_units[POS_L] = gpEkrBattleUnitLeft;
	battle_units[POS_R] = gpEkrBattleUnitRight;
}
#endif

bool CheckBattleHasHit(void)
{
	const struct BattleHit *hit = &gBattleHits[0];

	if (hit->info & BATTLE_HIT_INFO_FINISHES)
		return true;
	else
		return false;
}

int GetBanimUniquePal(struct Unit * unit)
{
	int idx = !!(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_PROMOTED);

	return unit->pinfo->banim_pal[idx] - 1;
}

const u16 *GetBanimTriangleAttackPalette(i16 bid, u16 item)
{
	switch (bid) {
	case BANIM_67:
		switch (GetItemIid(item)) {
		case IID_BALLISTA:
			return Pal_08113FB8;

		case IID_LONGBALLISTA:
			return Pal_08113F98;

		case IID_KILLERBALLISTA:
			return Pal_08113FD8;

		default:
			return NULL;
		}
		break;

	default:
		return NULL;
	}
}

int GetBanimFactionPalette(u32 faction)
{
	u8 _faction = faction;

	switch (_faction) {
	case FACTION_RED:
		return BANIMPAL_RED;

	case FACTION_GREEN:
		return BANIMPAL_GREEN;

	case FACTION_PURPLE:
		return BANIMPAL_PURPLE;

	case FACTION_BLUE:
		return BANIMPAL_BLUE;
	}

	return BANIMPAL_BLUE;
}

void EkrPrepareBanimfx(struct Anim * anim, i16 index)
{
	gBanimIdx[GetAnimPosition(anim)] = index;
	UpdateBanimFrame();
	LoadAnimFrame(anim, ANIM_ROUND_TAKING_HIT_CLOSE);
}

i16 GetBattleAnimRoundType(int index)
{
	i16 * buf = (i16 *)gAnimRoundData;

	if (buf[index] == -1)
		return -1;
	else
		return buf[index] & (0xFFF);
}

i16 func_fe6_0804A57C(int index)
{
	i16 * buf = (i16 *)gAnimRoundData;

	if (buf[index] == -1)
		return 0;
	else
		return buf[index] & (~0xFFF);
}

i16 GetEfxHp(int index)
{
	return gEfxHpLut[index] & 0xFFF;
}

i16 func_fe6_0804A5C0(int index)
{
	i16 * buf = (i16 *)gEfxHpLut;

	return buf[index] & (~0xFFF);
}
