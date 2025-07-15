#pragma once

#include "prelude.h"
#include "proc.h"
#include "banim.h"
#include "banim_sprite.h"
#include "helpbox.h"

enum videoalloc_playrank {
	OBPAL_PLAYRANK_2 = 2,
	OBPAL_PLAYRANK_3 = 3,
	OBPAL_PLAYRANK_4 = 4,
	OBPAL_PLAYRANK_5 = 5,
	OBPAL_PLAYRANK_C = 0xC,

	OBCHR_PLAYRANK_84 = 0x84
};

struct PlayRankSt {
	STRUCT_PAD(0x00, 0x32);

	/* 32 */ u16 unk_32;
	/* 34 */ u16 unk_34;

	STRUCT_PAD(0x36, 0x42);

	/* 42 */ i16 xs[7];
	/* 50 */ i16 ys[7];
	/* 5E */ u16 unk_5E[7];
	/* 6C */ u16 unk_6C[7];
	/* 7A */ u16 unk_7A;
	/* 7C */ u16 *objs[7];
	/* 98 */ u8 unk_98[7];
	/* 9F */ u8 step;
};

void func_fe6_0808DD40(void);
void func_fe6_0808DD78(void);
void func_fe6_0808DE04(int lo, int hi, int x, int pal_bank);

struct Proc_0868B5E8 {
	PROC_HEADER;

	/* 2A */ i16 timer1;
	/* 2C */ i16 step;
	/* 2E */ u16 anim_duration;
	/* 30 */ u16 unk_30;
	/* 32 */ i16 x, y;
	/* 36 */ u16 pal_bank;
};

void func_fe6_0808DE5C(struct Proc_0868B5E8 *proc);
void func_fe6_0808DE70(struct Proc_0868B5E8 *proc);
void func_fe6_0808DEA4(struct Proc_0868B5E8 *proc);
void func_fe6_0808DF3C(u16 pal_bank, int x, int y);
void func_fe6_0808DF78(int a, int b);

void func_fe6_0808DFC4(struct Proc_0868B5E8 *proc);
void func_fe6_0808DFCC(struct Proc_0868B5E8 *proc);
void func_fe6_0808E0DC(struct Proc_0868B5E8 *proc);

struct Proc_0868B648 {
	PROC_HEADER;
};

void func_fe6_0808E1D0(void);
void func_fe6_0808E1E4(void);
void func_fe6_0808E264(struct Proc_0868B648 *proc);
void func_fe6_0808E284(ProcPtr proc);
void func_fe6_0808E2D0(struct Proc_0868B648 *proc);
void func_fe6_0808E2F0(struct Proc_0868B648 *proc);

void func_fe6_0808E2F4(void);
void func_fe6_0808E390(void);

struct Proc_0868B700 {
	PROC_HEADER;

	i16 timer;
	i16 layer;
};

void func_fe6_0808E420(struct Proc_0868B700 *proc);
void func_fe6_0808E434(struct Proc_0868B700 *proc);

struct Proc_0868B730 {
	PROC_HEADER;

	u16 unk_2A;
	i16 timer;
	i16 total_sprites;
};

void func_fe6_0808E4E8(struct Proc_0868B730 *proc);
void func_fe6_0808E5F0(struct Proc_0868B730 *proc);

// func_fe6_0808E6E0
// func_fe6_0808E6FC
// func_fe6_0808E710
// func_fe6_0808E730
// func_fe6_0808E79C
// func_fe6_0808E7CC
// func_fe6_0808E93C
// func_fe6_0808EA74
// func_fe6_0808EB94
// func_fe6_0808EC1C
// func_fe6_0808EC48
// func_fe6_0808EC78
// func_fe6_0808ECD0
// PlayRank_InitDisplay
// func_fe6_0808F060
// PlayRank_Loop
// PlayRank_Idle
// PlayRank_End1
// PlayRank_End2
// PlayRank_End3
// func_fe6_0808F30C
u8 func_fe6_0808F33C(void);
u8 func_fe6_0808F3E8(void);
// func_fe6_0808F470
u8 func_fe6_0808F490(void);
u8 func_fe6_0808F4B8(void);
// func_fe6_0808F4F0
u8 func_fe6_0808F524(void);
u8 func_fe6_0808F550(void);
// func_fe6_0808F59C
u8 func_fe6_0808F5AC(void);
u8 func_fe6_0808F600(void);
// func_fe6_0808F648
u8 func_fe6_0808F68C(void);
u8 func_fe6_0808F6E0(void);
int func_fe6_0808F73C(void);
// PlayRank_InitBgConf
// func_fe6_0808F790
// func_fe6_0808F7B0
// func_fe6_0808F7D0
// func_fe6_0808F838
// func_fe6_0808F844
// func_fe6_0808F8B8
// func_fe6_0808F984
// func_fe6_0808FA14
// func_fe6_0808FD14
// func_fe6_0808FD44
void func_fe6_0808FD6C(ProcPtr parent);

extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B1B0;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B1CC;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B1E8;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B204;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B220;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B23C;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B258;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B274;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B290;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B2AC;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B2C8;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B2E4;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B300;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B31C;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B338;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B354;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B370;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B38C;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B3A8;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B3C4;
extern CONST_DATA struct HelpBoxInfo HelpInfo_0868B3E0;
extern CONST_DATA struct PlayRankSt *gpPlayRankSt;
// extern CONST_DATA ??? Sprite_0868B410
// extern CONST_DATA ??? Sprite_0868B418

struct TotalPlayRankConf {
	/* 00 */ u16 msg;
	/* 04 */ int color;
	/* 08 */ u8 (*func)(void);
	/* 0C */ u8 x;
	/* 0D */ u8 y;
	/* 0E */ u8 unk_0E;
};

extern CONST_DATA struct TotalPlayRankConf gTotalPlayRankConf1[];
extern CONST_DATA struct TotalPlayRankConf gTotalPlayRankConf2[];

struct UnkStruct_0868B4D0 {
	/* 00 */ u16 *obj;
	/* 04 */ u8 unk_04;
};

extern CONST_DATA struct UnkStruct_0868B4D0 Objs_0868B4D0[];

struct UnkStruct_0868b508 {
	i8 chr;
	u8 len, size;
	u8 _pad_;
};
extern CONST_DATA struct UnkStruct_0868b508 Unk_0868b508[];

struct UnkStruct_0868B5B0 {
	struct UnkStruct_0868b508 *unk_00;
	u8 x, y, _pad_[2];
};
extern CONST_DATA struct UnkStruct_0868B5B0 gUnk_0868B5B0[];

extern CONST_DATA struct BaSpriteData BaSprite_0868B5C8[];
extern CONST_DATA u8 gUnk_0868B5E0[];
extern CONST_DATA struct ProcScr ProcScr_0868B5E8[];
extern CONST_DATA struct ProcScr ProcScr_0868B610[];
extern CONST_DATA struct ProcScr ProcScr_0868B648[];
extern CONST_DATA struct ProcScr ProcScr_0868B6D8[];
extern CONST_DATA struct ProcScr ProcScr_0868B700[];
extern CONST_DATA u16 Sprite_0868B720[];
extern CONST_DATA struct ProcScr ProcScr_0868B730[];
extern CONST_DATA struct ProcScr ProcScr_0868B750[];
extern CONST_DATA struct ProcScr ProcScr_0868B768[];
// extern CONST_DATA ??? gUnk_0868B788
// extern CONST_DATA ??? gUnk_0868B79C
// extern CONST_DATA ??? gUnk_0868B7A0
// extern CONST_DATA ??? gUnk_0868B7A4
// extern CONST_DATA ??? gUnk_0868B7A8
// extern CONST_DATA ??? gUnk_0868B7B8
// extern CONST_DATA ??? gUnk_0868B7D6
// extern CONST_DATA ??? gUnk_0868B7E2
// extern CONST_DATA ??? gUnk_0868B7E8
// extern CONST_DATA ??? BgConfig_PlayRank
extern CONST_DATA struct ProcScr ProcScr_0868B80C[];
extern CONST_DATA struct ProcScr ProcScr_0868B88C[];
extern CONST_DATA struct ProcScr ProcScr_0868B8AC[];
extern CONST_DATA struct ProcScr ProcScr_PlayRank[];
extern CONST_DATA struct ProcScr ProcScr_0868B99C[];
// extern CONST_DATA ??? gUnk_0868BA24
// extern CONST_DATA ??? gUnk_0868BA3C
// extern CONST_DATA ??? gUnk_0868BB1C
extern CONST_DATA struct ProcScr ProcScr_0868BB3C[];
extern CONST_DATA struct ProcScr ProcScr_0868BB5C[];
extern CONST_DATA struct ProcScr ProcScr_0868BB7C[];
// extern CONST_DATA ??? gUnk_0868BB9C
// extern CONST_DATA ??? ProcScr_Credit_0868BBEC
extern CONST_DATA struct ProcScr ProcScr_0868BC44[];
// extern CONST_DATA ??? ProcScr_Fin
// extern CONST_DATA ??? gUnk_0868BCE4
extern CONST_DATA struct ProcScr ProcScr_0868BDB4[];
// extern CONST_DATA ??? ProcScr_CharacterEndingsCredit
// extern CONST_DATA ??? ProcScr_GameCredit
// extern CONST_DATA ??? gUnk_0868BE4C
extern CONST_DATA struct ProcScr ProcScr_0868BE74[];
// extern CONST_DATA ??? gUnk_0868BEEC
// extern CONST_DATA ??? gUnk_0868BF14
extern CONST_DATA struct ProcScr ProcScr_CharacterEnding2[];
// extern CONST_DATA ??? gUnk_0868BFAC
// extern CONST_DATA ??? gUnk_0868BFCC
