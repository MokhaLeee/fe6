#include "prelude.h"
#include "banim.h"
#include "eventinfo.h"

int GetBanimInitPosReal(void)
{
	int quote1, quote2;

	switch (gEkrDistanceType) {
	case EKR_DISTANCE_FAR:
		return gEkrInitialHitSide;

	case EKR_DISTANCE_CLOSE:
	case EKR_DISTANCE_MONOCOMBAT:
	case EKR_DISTANCE_PROMOTION:
		return POS_R;

	case EKR_DISTANCE_FARFAR:
	default:
		break;
	}

	quote2 = false;
	quote1 = false;

	if (gEkrDebugModeMaybe == 0) {
		quote1 = CheckBattleTalk(gEkrPids[POS_L], gEkrPids[POS_R]);
		quote2 = CheckBattleTalk(gEkrPids[POS_R], gEkrPids[POS_L]);
	}

	if (quote1 == true)
		return POS_L;
	else if (quote2 == true)
		return POS_R;
	else
		return gEkrInitialHitSide;
}

void EkrEfxStatusClear(void)
{
	gEkrHpBarCount = 0;
	gEfxSpellAnimExists = 0;
	gUnk_Banim_02017728 = 0;
	gEkrDeadEventExist = 0;
	gEfxQuakeExist = 0;
	gEfxHitQuakeExist = 0;
	gEfxFarAttackExist = 0;
	gEfxBgSemaphore = 0;
	gEfxHpBarResireFlag = 0;
	gUnk_Banim_0201774C = 0;
	gEfxTeonoState = 0;
	gEfxTerrainLayerLow = 0;
	SetEkrBg2QuakeVec(0, 0);
	gUnk_Banim_0201775C[0] = 0;
	gUnk_Banim_0201775C[1] = 0;
	gEfxSpecalEffectExist[0] = 0;
	gEfxSpecalEffectExist[1] = 0;
	gEkrHitNow[0] = 0;
	gEkrHitNow[1] = 0;
	gpProcEfxStatusUnits[0] = NULL;
	gpProcEfxStatusUnits[1] = NULL;
	gpProcEfxSpellCast = NULL;
	gpProcEfxHpBarColorChange = NULL;

	LZ77UnCompVram(gUnk_08113D70, OBJ_VRAM0 + 0x2000);
	gEfxMagicChk_N = 0;
}
