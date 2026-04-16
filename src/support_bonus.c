#include "prelude.h"
#include "support.h"

struct SupportBonuses CONST_DATA AffinityBonuses[] = {
	{
		.affinity = AFFINITY_1,
		.bonus_attack = 1,
		.bonus_defense = 0,
		.bonus_hit = 5,
		.bonus_avoid = 5,
		.bonus_crit = 5,
		.bonus_dodge = 0,
	},
	{
		.affinity = AFFINITY_2,
		.bonus_attack = 0,
		.bonus_defense = 1,
		.bonus_hit = 0,
		.bonus_avoid = 5,
		.bonus_crit = 5,
		.bonus_dodge = 5,
	},
	{
		.affinity = AFFINITY_3,
		.bonus_attack = 1,
		.bonus_defense = 0,
		.bonus_hit = 5,
		.bonus_avoid = 0,
		.bonus_crit = 5,
		.bonus_dodge = 5,
	},
	{
		.affinity = AFFINITY_4,
		.bonus_attack = 0,
		.bonus_defense = 1,
		.bonus_hit = 5,
		.bonus_avoid = 5,
		.bonus_crit = 0,
		.bonus_dodge = 5,
	},
	{
		.affinity = AFFINITY_5,
		.bonus_attack = 0,
		.bonus_defense = 0,
		.bonus_hit = 5,
		.bonus_avoid = 5,
		.bonus_crit = 5,
		.bonus_dodge = 5,
	},
	{
		.affinity = AFFINITY_6,
		.bonus_attack = 1,
		.bonus_defense = 1,
		.bonus_hit = 5,
		.bonus_avoid = 0,
		.bonus_crit = 5,
		.bonus_dodge = 0,
	},
	{
		.affinity = AFFINITY_7,
		.bonus_attack = 1,
		.bonus_defense = 1,
		.bonus_hit = 0,
		.bonus_avoid = 5,
		.bonus_crit = 0,
		.bonus_dodge = 5,
	},
	{}
};
