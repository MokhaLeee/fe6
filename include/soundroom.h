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
	u16 oam2[2];
};
extern EWRAM_OVERLAY(savemenu) struct SoundRoomText gSoundRoomText;

enum {
	PL_SOUNDROOM_MAIN = 0,
	PL_SOUNDROOM_SLIDE = 2,
	PL_SOUNDROOM_EXIT = 3,
};

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

struct ProcSoundRoomConfirm {
	PROC_HEADER_EXT(struct ProcSoundRoom);

	STRUCT_PAD(0x29, 0x2C);

	/* 2C */ u16 unk_2c;

	STRUCT_PAD(0x2E, 0x30);

	/* 30 */ u32 cur_index;
};

void Soundroom_Init(struct ProcSoundRoom *proc);
void func_fe6_0808BBCC(struct ProcSoundRoom *proc);
void func_fe6_0808BCBC(struct ProcSoundRoom *proc);
void func_fe6_0808BCF0(struct ProcSoundRoom *proc);
void func_fe6_0808BD28(struct ProcSoundRoom *proc);
void func_fe6_0808BD6C(struct ProcSoundRoomConfirm *proc);
void func_fe6_0808BD78(struct ProcSoundRoomConfirm *proc);
void func_fe6_0808BDF8(struct ProcSoundRoomConfirm *proc);
void func_fe6_0808C084(struct ProcSoundRoom *proc);
void func_fe6_0808C098(struct ProcSoundRoom *proc);

int CountTotalSoundRoomSongs(void);

ProcPtr SaveMenu_ExecSoundroom(ProcPtr parent);
void PutSoundRoomCG(void);
void func_fe6_0808BE70(void);
void func_fe6_0808BF00(struct ProcSoundRoom *proc);
void func_fe6_0808BFF0(void);
ProcPtr NewProc_0868AA80(struct ProcSoundRoom *proc);
ProcPtr NewProc_0868AAA8(struct ProcSoundRoom *proc);

extern CONST_DATA u16 Sprite_0868A988[];
extern CONST_DATA u16 Sprite_0868A9E8[];
extern CONST_DATA u16 Sprite_0868A9F0[];
extern CONST_DATA u16 Sprite_0868A9F8[];
extern struct ProcScr CONST_DATA ProcScr_SoundRoom[];
extern struct ProcScr CONST_DATA ProcScr_0868AA80[];
extern struct ProcScr CONST_DATA ProcScr_0868AAA8[];
