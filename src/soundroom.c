#include "prelude.h"
#include "proc.h"
#include "hardware.h"
#include "text.h"
#include "bm.h"
#include "oam.h"
#include "sprite.h"
#include "constants/songs.h"
#include "constants/msg.h"

#include "soundroom.h"

EWRAM_OVERLAY(savemenu) struct SoundRoomText gSoundRoomText = {};
EWRAM_OVERLAY(savemenu) u16 gSoundRoom_020004A8[2] = {};
EWRAM_OVERLAY(savemenu) u8 gSoundRoom_020004AC[2] = {};

CONST_DATA struct SoundRoomInfo gSoundRoomInfo[] = {
	{
		.id = SONG_01,
		.msg_name1 = MSG_SOUNDROM_00_NAME,
		.msg_name2 = MSG_SOUNDROM_00_DESC,
	},
	{
		.id = SONG_02,
		.msg_name1 = MSG_SOUNDROM_01_NAME,
		.msg_name2 = MSG_SOUNDROM_01_DESC,
	},
	{
		.id = SONG_03,
		.msg_name1 = MSG_SOUNDROM_02_NAME,
		.msg_name2 = MSG_SOUNDROM_02_DESC,
	},
	{
		.id = SONG_04,
		.msg_name1 = MSG_SOUNDROM_03_NAME,
		.msg_name2 = MSG_SOUNDROM_03_DESC,
	},
	{
		.id = SONG_05,
		.msg_name1 = MSG_SOUNDROM_04_NAME,
		.msg_name2 = MSG_SOUNDROM_04_DESC,
	},
	{
		.id = SONG_06,
		.msg_name1 = MSG_SOUNDROM_05_NAME,
		.msg_name2 = MSG_SOUNDROM_05_DESC,
	},
	{
		.id = SONG_07,
		.msg_name1 = MSG_SOUNDROM_06_NAME,
		.msg_name2 = MSG_SOUNDROM_06_DESC,
	},
	{
		.id = SONG_08,
		.msg_name1 = MSG_SOUNDROM_07_NAME,
		.msg_name2 = MSG_SOUNDROM_07_DESC,
	},
	{
		.id = SONG_09,
		.msg_name1 = MSG_SOUNDROM_08_NAME,
		.msg_name2 = MSG_SOUNDROM_08_DESC,
	},
	{
		.id = SONG_0A,
		.msg_name1 = MSG_SOUNDROM_09_NAME,
		.msg_name2 = MSG_SOUNDROM_09_DESC,
	},
	{
		.id = SONG_0B,
		.msg_name1 = MSG_SOUNDROM_0A_NAME,
		.msg_name2 = MSG_SOUNDROM_0A_DESC,
	},
	{
		.id = SONG_0C,
		.msg_name1 = MSG_SOUNDROM_0B_NAME,
		.msg_name2 = MSG_SOUNDROM_0B_DESC,
	},
	{
		.id = SONG_0D,
		.msg_name1 = MSG_SOUNDROM_0C_NAME,
		.msg_name2 = MSG_SOUNDROM_0C_DESC,
	},
	{
		.id = SONG_0E,
		.msg_name1 = MSG_SOUNDROM_0D_NAME,
		.msg_name2 = MSG_SOUNDROM_0D_DESC,
	},
	{
		.id = SONG_0F,
		.msg_name1 = MSG_SOUNDROM_0E_NAME,
		.msg_name2 = MSG_SOUNDROM_0E_DESC,
	},
	{
		.id = SONG_10,
		.msg_name1 = MSG_SOUNDROM_0F_NAME,
		.msg_name2 = MSG_SOUNDROM_0F_DESC,
	},
	{
		.id = SONG_11,
		.msg_name1 = MSG_SOUNDROM_10_NAME,
		.msg_name2 = MSG_SOUNDROM_10_DESC,
	},
	{
		.id = SONG_12,
		.msg_name1 = MSG_SOUNDROM_11_NAME,
		.msg_name2 = MSG_SOUNDROM_11_DESC,
	},
	{
		.id = SONG_13,
		.msg_name1 = MSG_SOUNDROM_12_NAME,
		.msg_name2 = MSG_SOUNDROM_12_DESC,
	},
	{
		.id = SONG_14,
		.msg_name1 = MSG_SOUNDROM_13_NAME,
		.msg_name2 = MSG_SOUNDROM_13_DESC,
	},
	{
		.id = SONG_15,
		.msg_name1 = MSG_SOUNDROM_14_NAME,
		.msg_name2 = MSG_SOUNDROM_14_DESC,
	},
	{
		.id = SONG_16,
		.msg_name1 = MSG_SOUNDROM_15_NAME,
		.msg_name2 = MSG_SOUNDROM_15_DESC,
	},
	{
		.id = SONG_17,
		.msg_name1 = MSG_SOUNDROM_16_NAME,
		.msg_name2 = MSG_SOUNDROM_16_DESC,
	},
	{
		.id = SONG_18,
		.msg_name1 = MSG_SOUNDROM_17_NAME,
		.msg_name2 = MSG_SOUNDROM_17_DESC,
	},
	{
		.id = SONG_19,
		.msg_name1 = MSG_SOUNDROM_18_NAME,
		.msg_name2 = MSG_SOUNDROM_18_DESC,
	},
	{
		.id = SONG_1A,
		.msg_name1 = MSG_SOUNDROM_19_NAME,
		.msg_name2 = MSG_SOUNDROM_19_DESC,
	},
	{
		.id = SONG_1B,
		.msg_name1 = MSG_SOUNDROM_1A_NAME,
		.msg_name2 = MSG_SOUNDROM_1A_DESC,
	},
	{
		.id = SONG_1C,
		.msg_name1 = MSG_SOUNDROM_1B_NAME,
		.msg_name2 = MSG_SOUNDROM_1B_DESC,
	},
	{
		.id = SONG_1E,
		.msg_name1 = MSG_SOUNDROM_1C_NAME,
		.msg_name2 = MSG_SOUNDROM_1C_DESC,
	},
	{
		.id = SONG_1F,
		.msg_name1 = MSG_SOUNDROM_1D_NAME,
		.msg_name2 = MSG_SOUNDROM_1D_DESC,
	},
	{
		.id = SONG_20,
		.msg_name1 = MSG_SOUNDROM_1E_NAME,
		.msg_name2 = MSG_SOUNDROM_1E_DESC,
	},
	{
		.id = SONG_21,
		.msg_name1 = MSG_SOUNDROM_1F_NAME,
		.msg_name2 = MSG_SOUNDROM_1F_DESC,
	},
	{
		.id = SONG_22,
		.msg_name1 = MSG_SOUNDROM_20_NAME,
		.msg_name2 = MSG_SOUNDROM_20_DESC,
	},
	{
		.id = SONG_23,
		.msg_name1 = MSG_SOUNDROM_21_NAME,
		.msg_name2 = MSG_SOUNDROM_21_DESC,
	},
	{
		.id = SONG_24,
		.msg_name1 = MSG_SOUNDROM_22_NAME,
		.msg_name2 = MSG_SOUNDROM_22_DESC,
	},
	{
		.id = SONG_25,
		.msg_name1 = MSG_SOUNDROM_23_NAME,
		.msg_name2 = MSG_SOUNDROM_23_DESC,
	},
	{
		.id = SONG_26,
		.msg_name1 = MSG_SOUNDROM_24_NAME,
		.msg_name2 = MSG_SOUNDROM_24_DESC,
	},
	{
		.id = SONG_27,
		.msg_name1 = MSG_SOUNDROM_25_NAME,
		.msg_name2 = MSG_SOUNDROM_25_DESC,
	},
	{
		.id = SONG_28,
		.msg_name1 = MSG_SOUNDROM_26_NAME,
		.msg_name2 = MSG_SOUNDROM_26_DESC,
	},
	{
		.id = SONG_29,
		.msg_name1 = MSG_SOUNDROM_27_NAME,
		.msg_name2 = MSG_SOUNDROM_27_DESC,
	},
	{
		.id = SONG_2A,
		.msg_name1 = MSG_SOUNDROM_28_NAME,
		.msg_name2 = MSG_SOUNDROM_28_DESC,
	},
	{
		.id = SONG_2B,
		.msg_name1 = MSG_SOUNDROM_29_NAME,
		.msg_name2 = MSG_SOUNDROM_29_DESC,
	},
	{
		.id = SONG_2C,
		.msg_name1 = MSG_SOUNDROM_2A_NAME,
		.msg_name2 = MSG_SOUNDROM_2A_DESC,
	},
	{
		.id = SONG_2D,
		.msg_name1 = MSG_SOUNDROM_2B_NAME,
		.msg_name2 = MSG_SOUNDROM_2B_DESC,
	},
	{
		.id = SONG_2E,
		.msg_name1 = MSG_SOUNDROM_2C_NAME,
		.msg_name2 = MSG_SOUNDROM_2C_DESC,
	},
	{
		.id = SONG_31,
		.msg_name1 = MSG_SOUNDROM_2D_NAME,
		.msg_name2 = MSG_SOUNDROM_2D_DESC,
	},
	{
		.id = SONG_32,
		.msg_name1 = MSG_SOUNDROM_2E_NAME,
		.msg_name2 = MSG_SOUNDROM_2E_DESC,
	},
	{
		.id = SONG_33,
		.msg_name1 = MSG_SOUNDROM_2F_NAME,
		.msg_name2 = MSG_SOUNDROM_2F_DESC,
	},
	{
		.id = SONG_34,
		.msg_name1 = MSG_SOUNDROM_30_NAME,
		.msg_name2 = MSG_SOUNDROM_30_DESC,
	},
	{
		.id = SONG_35,
		.msg_name1 = MSG_SOUNDROM_31_NAME,
		.msg_name2 = MSG_SOUNDROM_31_DESC,
	},
	{
		.id = SONG_36,
		.msg_name1 = MSG_SOUNDROM_32_NAME,
		.msg_name2 = MSG_SOUNDROM_32_DESC,
	},
	{
		.id = SONG_37,
		.msg_name1 = MSG_SOUNDROM_33_NAME,
		.msg_name2 = MSG_SOUNDROM_33_DESC,
	},
	{
		.id = SONG_38,
		.msg_name1 = MSG_SOUNDROM_34_NAME,
		.msg_name2 = MSG_SOUNDROM_34_DESC,
	},
	{
		.id = SONG_39,
		.msg_name1 = MSG_SOUNDROM_35_NAME,
		.msg_name2 = MSG_SOUNDROM_35_DESC,
	},
	{
		.id = SONG_3A,
		.msg_name1 = MSG_SOUNDROM_36_NAME,
		.msg_name2 = MSG_SOUNDROM_36_DESC,
	},
	{
		.id = SONG_3B,
		.msg_name1 = MSG_SOUNDROM_37_NAME,
		.msg_name2 = MSG_SOUNDROM_37_DESC,
	},
	{
		.id = SONG_3C,
		.msg_name1 = MSG_SOUNDROM_38_NAME,
		.msg_name2 = MSG_SOUNDROM_38_DESC,
	},
	{
		.id = SONG_3D,
		.msg_name1 = MSG_SOUNDROM_39_NAME,
		.msg_name2 = MSG_SOUNDROM_39_DESC,
	},
	{
		.id = SONG_3E,
		.msg_name1 = MSG_SOUNDROM_3A_NAME,
		.msg_name2 = MSG_SOUNDROM_3A_DESC,
	},
	{
		.id = SONG_3F,
		.msg_name1 = MSG_SOUNDROM_3B_NAME,
		.msg_name2 = MSG_SOUNDROM_3B_DESC,
	},
	{
		.id = SONG_41,
		.msg_name1 = MSG_SOUNDROM_3C_NAME,
		.msg_name2 = MSG_SOUNDROM_3C_DESC,
	},
	{
		.id = SONG_42,
		.msg_name1 = MSG_SOUNDROM_3D_NAME,
		.msg_name2 = MSG_SOUNDROM_3D_DESC,
	},
	{
		.id = SONG_43,
		.msg_name1 = MSG_SOUNDROM_3E_NAME,
		.msg_name2 = MSG_SOUNDROM_3E_DESC,
	},
	{
		.id = SONG_47,
		.msg_name1 = MSG_SOUNDROM_3F_NAME,
		.msg_name2 = MSG_SOUNDROM_3F_DESC,
	},
	{
		.id = SONG_48,
		.msg_name1 = MSG_SOUNDROM_40_NAME,
		.msg_name2 = MSG_SOUNDROM_40_DESC,
	},
	{
		.id = SONG_49,
		.msg_name1 = MSG_SOUNDROM_41_NAME,
		.msg_name2 = MSG_SOUNDROM_41_DESC,
	},
	{
		.id = -1,
	},
};

CONST_DATA u16 Sprite_0868A988[] = {
	2,
	OAM0_SHAPE_8x8, OAM1_SIZE_8x8, OAM2_CHR(0x380) + OAM2_LAYER(1),
	OAM0_SHAPE_8x8 + OAM0_Y(8), OAM1_SIZE_8x8, OAM2_CHR(0x386) + OAM2_LAYER(1),
};

CONST_DATA struct SoundRoomCgInfo gSoundRoomCgInfo[] = {
	{ EndingCG_Img1, EndingCG_Pal1 },
	{ EndingCG_Img2, EndingCG_Pal2 },
	{ EndingCG_Img3, EndingCG_Pal3 },
	{ EndingCG_Img4, EndingCG_Pal4 },
	{ EndingCG_Img5, EndingCG_Pal5 },
	{ EndingCG_Img6, EndingCG_Pal6 },
	{ EndingCG_Img7, EndingCG_Pal7 },
	{ EndingCG_Img8, EndingCG_Pal8 },
	{ EndingCG_Img9, EndingCG_Pal9 },
	{ EndingCG_Img10, EndingCG_Pal10 },
};

int CountTotalSoundRoomSongs(void)
{
	int ret = 0;
	struct SoundRoomInfo *it = gSoundRoomInfo;

	do {
		if (it->id < 0)
			break;

		it++, ret++;
	} while (1);

	return ret;
}
