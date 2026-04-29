#include "prelude.h"
#include "chapterinfo.h"
#include "bmio.h"
#include "constants/chapterassets.h"

// 08664398
void const * CONST_DATA ChapterAssets[] = {
	[PLIST_0] = NULL,

	[PLIST_MAPASSET1_IMG1] = MapAsset01_Img1,
	[PLIST_MAPASSET1_IMG2] = MapAsset01_Img2,
	[PLIST_MAPASSET1_PAL] = MapAsset01_Pal,
	[PLIST_MAPASSET1_TSA_CONF] = MapAsset01_TsaConf,

	[PLIST_CH0_MAP] = MapTsa_Chapter0,
	[PLIST_MAPASSET1_IMGANIM] = MapAsset01_Anims,
	[PLIST_CH0_MAPCHG] = MapChange_Ch0,
	[PLIST_CH0_EVENT] = &ChapterEventInfo_Tutorial,
	[PLIST_CH0_EVENTWM] = EventScr_Wm_Tutorial,

	[PLIST_CH1_MAP] = gUnk_082474C8,
	[PLIST_CH1_MAPCHG] = MapChange_Ch1,
	[PLIST_CH1_EVENT] = &ChapterEventInfo_Chapter1,
	[PLIST_CH1_EVENTWM] = EventScr_Wm_Ch1,

	[PLIST_CH2_MAP] = MapTsa_Chapter2,
	[PLIST_CH2_MAPCHG] = MapChange_Ch2,
	[PLIST_CH2_EVENT] = &ChapterEventInfo_Chapter2,
	[PLIST_CH2_EVENTWM] = EventScr_Wm_Ch2,

	[PLIST_MAPASSET2_IMG1] = MapAsset02_Img,
	[PLIST_MAPASSET2_PAL] = MapAsset02_Pal,
	[PLIST_MAPASSET2_TSA_CONF] = MapAsset02_TsaConf,

	[PLIST_CH3_MAP] = MapTsa_Ch3,
	[PLIST_CH3_MAPCHG] = MapChange_Ch3,
	[PLIST_CH3_EVENT] = &ChapterEventInfo_Chapter3,
	[PLIST_CH3_EVENTWM] = EventScr_Wm_Ch3,
};
