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

enum { SOUNDROOM_CG_NUM = 10 };

struct SoundRoomCgInfo {
	const u8  *img;
	const u16 *pal;
};
extern CONST_DATA struct SoundRoomCgInfo gSoundRoomCgInfo[SOUNDROOM_CG_NUM];

struct SoundRoomText {
	struct Font font;
	struct Text texts[5];
};
extern EWRAM_OVERLAY(savemenu) struct SoundRoomText gSoundRoomText;

struct ProcSoundRoom {
	PROC_HEADER;

	/* 29 */ u8 unk_29;

	STRUCT_PAD(0x2A, 0x2C);

	/* 2C */ u16 unk_2c;
	/* 2E */ u16 unk_2e;
	/* 30 */ u32 cur_index;
	/* 34 */ u32 unk_34;
	/* 38 */ u8 unk_38;
	/* 39 */ u8 unk_39;

	STRUCT_PAD(0x3A, 0x3C);

	/* 3C */ ProcPtr sprite_proc;
	/* 40 */ u8 unk_40;
	/* 41 */ u8 unk_41;
};

void Soundroom_Init(struct ProcSoundRoom *proc);

// CountTotalSoundRoomSongs
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
