#include "prelude.h"
#include "save_stats.h"
#include "chapterinfo.h"
#include "save_xmap.h"
#include "faction.h"
#include "unit.h"
#include "item.h"

#include "augury.h"
#include "playrank.h"

u16 PlayRank_GetTotalTurn(void)
{
	int i, total_turn = 0;
	int slot = GetNextChapterStatsSlot();

	for (i = 0; i < slot; i++)
		total_turn += GetChapterStats(i)->chapter_turn;

	return total_turn;
}

u8 PlayRankGetter_Tactics(void)
{
	int slot, total_turn = PlayRank_GetTotalTurn();
	int i, ranks[PALYRANK_MAX], *_ranks;

	for (i = 0; i < PALYRANK_MAX; i++)
		ranks[i] = 0;

	slot = GetNextChapterStatsSlot();
	for (i = 0; i < slot; i++) {
		struct ChapterStats *chapter_stat = GetChapterStats(i);

		ranks[0] += ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[PALYRANK_A];
		ranks[1] += ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[PALYRANK_B];
		ranks[2] += ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[PALYRANK_C];
		ranks[3] += ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[PALYRANK_D];
	}

	// WTF
	i = PALYRANK_D;
	_ranks = ranks;
	while (1) {
		if (total_turn > *_ranks)
			break;

		_ranks++;
		i++;

		if (i > 3)
			break;
	}

	return i;
}

u8 PlayRankGetter_XmapTactics(void)
{
	int total_turn;
	int i, ranks[PALYRANK_MAX];
	struct ChapterStats *chapter_stat = GetXmapChapterStats();

	ranks[PALYRANK_D] = ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[REFRANK_D];
	ranks[PALYRANK_C] = ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[REFRANK_C];
	ranks[PALYRANK_B] = ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[REFRANK_B];
	ranks[PALYRANK_A] = ChapterInfoTable[chapter_stat->chapter_id].tactics_ranks[REFRANK_A];

	total_turn = chapter_stat->chapter_turn;

	if (unk_02016A2D == 0)
		return PALYRANK_D;

	i = 0;
	for (;;) {
		if (total_turn > ranks[i])
			break;

		if (++i > 3)
			break;
	}

	return i;
}

u16 PlayRank_GetWinningRate(void)
{
	int denominator = PidStatsCountTotalBattles();
	int numerator   = PidStatsCountTotalWins() * 100;

	return numerator / denominator;
}

u8 PlayRankGetter_Combat(void)
{
	int winning_rate = PlayRank_GetWinningRate();
	int i = 0;

	for (;;) {
		if (winning_rate < gPlayRank_CombatRef[i])
			break;

		if (++i > 3)
			break;
	}
	return i;
}

u8 PlayRankGetter_XmapCombat(void)
{
	int denominator = PidStatsCountTotalBattles();
	int numerator   = PidStatsCountTotalWins() * 100;
	int winning_rate = numerator / denominator;
	int i;

	i = 0;
	for (;;) {
		if (winning_rate < gPlayRank_CombatRef[i])
			break;

		if (++i > 3)
			break;
	}
	return i;
}

u16 PlayRank_GetDeadAllies(void)
{
	int ret = 0;

	FOR_UNITS_FACTION(FACTION_BLUE, unit, {
		if (unit->flags & UNIT_FLAG_DEAD)
			ret++;
	})
	return ret;
}

u8 PlayRankGetter_Survival(void)
{
	int dead_allies = PlayRank_GetDeadAllies();
	u8 i = 0;

	for (;;) {
		if (dead_allies >= gPlayRank_SurvivalRef[i])
			break;

		if (++i > 3)
			break;
	}
	return i;
}

u8 PlayRankGetter_XmapSurvival(void)
{
	int dead_allies = 0;
	u8 i;

	FOR_UNITS_FACTION(FACTION_BLUE, unit, {
		if (unit->flags & UNIT_FLAG_DEAD)
			dead_allies++;
	})

	i = 0;
	for (;;) {
		if (dead_allies >= gPlayRank_XmapSurvivalRef[i])
			break;

		if (++i > 3)
			break;
	}
	return i;
}

u16 PlayRank_GetTotalLevelsGained(void)
{
	return PidStatsCountTotalLevelsGained();
}

u8 PlayRankGetter_Experience(void)
{
	int total_level = PlayRank_GetTotalLevelsGained();
	int chapter_id = GetChapterStats(GetNextChapterStatsSlot() - 1)->chapter_id;
	int ret;

	/**
	 * What a horrible coding style....
	 */
	ret = PALYRANK_D;
	if (total_level > ChapterInfoTable[chapter_id].exp_ranks[REFRANK_D]) {
		ret = PALYRANK_C;

		if (total_level > ChapterInfoTable[chapter_id].exp_ranks[REFRANK_C]) {
			ret = PALYRANK_B;

			if (total_level > ChapterInfoTable[chapter_id].exp_ranks[REFRANK_B]) {
				ret = PALYRANK_A;

				if (total_level > ChapterInfoTable[chapter_id].exp_ranks[REFRANK_A])
					ret = PALYRANK_S;
			}
		}
	}
	return ret;
}

u8 PlayRankGetter_Asset(void)
{
	u32 total_asset = GetTotalAsset();
	_UNUSED struct ChapterStats *chapter_state = GetChapterStats(GetNextChapterStatsSlot());
	u32 ref = GetChapterInfo(gPlaySt.chapter)->number_id / 2;

	int i = 0;
	int *ref_assets = gPlayRank_AssetRef;

	for (;;) {
		u32 ref_asset = *ref_assets;

		if (total_asset < (ref_asset * ref))
			break;

		ref_assets++;
		i++;
		if (i > 3)
			break;
	}
	return i;
}

u16 PlayRank_CalcTotalLevel(void)
{
	int ret = 0;

	FOR_UNITS_FACTION(FACTION_BLUE, unit, {
		if (UNIT_ATTRIBUTES(unit) & UNIT_ATTR_PROMOTED)
			ret += 20;

		ret += unit->level;
	})
	return ret;
}

u8 PlayRankGetter_Power(void)
{
	int total_level = PlayRank_CalcTotalLevel();
	int chapter_id = GetChapterStats(GetNextChapterStatsSlot() - 1)->chapter_id;
	int ret;

	/**
	 * What a horrible coding style....
	 */
	ret = PALYRANK_D;
	if (total_level > ChapterInfoTable[chapter_id].combat_ranks[REFRANK_D]) {
		ret = PALYRANK_C;

		if (total_level > ChapterInfoTable[chapter_id].combat_ranks[REFRANK_C]) {
			ret = PALYRANK_B;

			if (total_level > ChapterInfoTable[chapter_id].combat_ranks[REFRANK_B]) {
				ret = PALYRANK_A;

				if (total_level > ChapterInfoTable[chapter_id].combat_ranks[REFRANK_A])
					ret = PALYRANK_S;
			}
		}
	}
	return ret;
}
