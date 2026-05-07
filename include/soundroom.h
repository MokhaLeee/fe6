#pragma once

#include "prelude.h"
#include "proc.h"
#include "text.h"

struct SoundRoomInfo {
	int id;
	int msg_name1;
	int msg_name2;
};
extern CONST_DATA struct SoundRoomInfo gSoundRoomInfo[];

struct SoundRoomCgInfo {
	const u8  *img;
	const u16 *pal;
};
extern CONST_DATA struct SoundRoomCgInfo gSoundRoomCgInfo[];

struct SoundRoomText {
	struct Font font;
	struct Text texts[5];
};
extern EWRAM_OVERLAY(savemenu) struct SoundRoomText gSoundRoomText;

// CountTotalSoundRoomSongs
// Soundroom_Init
// func_fe6_0808BBCC
// func_fe6_0808BCBC
// func_fe6_0808BCF0
// func_fe6_0808BD28
// SaveMenu_ExecSoundroom
// func_fe6_0808BD6C
// func_fe6_0808BD78
// func_fe6_0808BDF8
// NewProc_0868AA80
// func_fe6_0808BE70
// func_fe6_0808BF00
// func_fe6_0808BFF0
// func_fe6_0808C084
// func_fe6_0808C098
// NewProc_0868AAA8

extern CONST_DATA u16 Sprite_0868A988[];
extern CONST_DATA u16 Sprite_0868A9E8[];
extern CONST_DATA u16 Sprite_0868A9F0[];
extern CONST_DATA u16 Sprite_0868A9F8[];
extern struct ProcScr CONST_DATA ProcScr_SoundRoom[];
extern struct ProcScr CONST_DATA ProcScr_0868AA80[];
extern struct ProcScr CONST_DATA ProcScr_0868AAA8[];
