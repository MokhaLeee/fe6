#ifndef BMIO_H
#define BMIO_H

#include "prelude.h"

struct TsImgAnim {
	/* 00 */ u16 time;
	/* 02 */ u16 size;
	/* 04 */ void const * data;
};

struct TsPalAnim {
	/* 00 */ void const * data;
	/* 04 */ u8 time;
	/* 05 */ u8 colorCount;
	/* 06 */ u8 colorStart;
};

struct WeatherParticle {
	/* 00 */ short x;
	/* 02 */ short y;

	/* 04 */ short x_speed;
	/* 06 */ short y_speed;

	/* 08 */ u8 chr;
	/* 09 */ u8 kind;
};

union WeatherEffect {
	/**
	 * Array of weather particles
	 */
	struct WeatherParticle particles[0x40];

	/**
	 * Buffer for cloud graphics
	 */
	u32 imgCloud[0xC0];
};

extern EWRAM_OVERLAY(0) union WeatherEffect gWeatherEffect;

union WeatherGradient {
	/**
	 * Buffer holding colors for vertical gradient.
	 */
	u16 lines[320];

	/**
	 * Buffer holding 8 different variations of the tileset palette
	 * Variations have increasing amounts of red; used for flames weather effect
	 */
	u16 fireGradient[8][0x40];
};

extern EWRAM_OVERLAY(0) union WeatherGradient gWeatherGradient;

struct BmVSyncProc {
	PROC_HEADER;

	/* 2C */ struct TsImgAnim const * imgAnimStart;
	/* 30 */ struct TsImgAnim const * imgAnimCurrent;

	/* 34 */ short imgAnimClock;
	/* 36 */ short palAnimClock;

	/* 38 */ struct TsPalAnim const * palAnimStart;
	/* 3C */ struct TsPalAnim const * palAnimCurrent;
};

void StartBmVSync(void);
void EndBmVSync(void);
void LockBmDisplay(void);
void UnlockBmDisplay(void);
void AllocWeatherParticles(int weather);
void ApplyFlamesWeatherGradient(void);
void WeatherInit(void);
void WeatherVBlank(void);
void WeatherUpdate(void);
void DisableTilesetPalAnim(void);
void EnableTilesetPalAnim(void);
void SetWeather(int weather);

extern struct ProcScr CONST_DATA ProcScr_BmVSync[];
extern struct ProcScr CONST_DATA ProcScr_MapTask[];

extern struct TsImgAnim CONST_DATA MapAsset01_Anims[];
extern struct TsImgAnim CONST_DATA TilesetImgAnim_085C7914[];
extern struct TsImgAnim CONST_DATA TilesetImgAnim_085C799C[];
extern struct TsImgAnim CONST_DATA TilesetImgAnim_085C79D4[];
extern struct TsPalAnim CONST_DATA TilesetPalAnim_085C7A1C[];
extern struct TsPalAnim CONST_DATA TilesetPalAnim_085C7A64[];
extern struct TsPalAnim CONST_DATA TilesetPalAnim_085C7ADC[];
extern struct TsPalAnim CONST_DATA TilesetPalAnim_085C7B5C[];

#endif // BMIO_H
