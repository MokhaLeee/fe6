#pragma once

#include "prelude.h"
#include "banim_sprite.h"

extern ProcPtr EkrDragonProcs[2];
extern ProcPtr gUnk_Banim_0201E7B4[2];
extern ProcPtr gUnk_Banim_0201E7BC;
extern u16 gEkrDragonIntroDone[2];
extern u16 gUnk_Banim_0201E7C4[2];

enum EkrDragonState_idx {
    DRAGON_STATE_DEFAULT = 0,
    DRAGON_STATE_1 = 1,
    DRAGON_STATE_ENDING = 2,
};

extern u16 gEkrDragonState[2];
extern u16 gUnk_Banim_0201E7CC[];
extern u16 gEkrDragonJid[2];
extern u16 gUnk_Banim_0201E7C4[2];

void ResetEkrDragonStatus(void);
bool EkrDragonIntroDone(struct BaSprite * anim);
void TriggerEkrDragonEnding(struct BaSprite * anim);
bool CheckEkrDragonEndingDone(struct BaSprite * anim);

enum ekr_dragon_status_type_bitfile {
    EDRAGON_TYPE_MANAKETE_L = 1 << 0,
    EDRAGON_TYPE_MANAKETE_R = 1 << 1,
    EDRAGON_TYPE_FAE_L = 1 << 2,
    EDRAGON_TYPE_FAE_R = 1 << 3,
    EDRAGON_TYPE_IDUNN_L = 1 << 4,
    EDRAGON_TYPE_IDUNN_R = 1 << 5,
};

u32 GetEkrDragonStateType(void); /* Different form FE8, this is a bitfile rather than enum */
u32 GetEkrDragonStateTypeIdunnManakete(void);
u32 GetEkrDragonStateTypeIdunn(void);
// CheckEkrDragonStateTypeFae
u16 * GetEkrDragonJid(int pos);
u16 * GetEkrDragonStatusIdx(struct BaSprite * anim);
// GetEkrDragonProc
// func_fe6_08058A34
// SetDragonBasLayer

struct ProcEkrDragon {
    PROC_HEADER;

    /* 29 */ u8 done;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ i16 timer;
    /* 2E */ i16 terminator;
    /* 30 */ i16 timer2;
    /* 32 */ i16 x; 

    STRUCT_PAD(0x34, 0x3A);

    /* 3A */ i16 y_lo;
    /* 3C */ i16 y_hi;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ ProcPtr sproc_flashingobj;
    /* 48 */ ProcPtr sproc_bg2fx;
    /* 4C */ ProcPtr sproc_bg2scroll;
    /* 50 */ ProcPtr mainfxproc;
    /* 54 */ ProcPtr proc54;
    /* 58 */ ProcPtr sproc_bg2scrollhandle;
    /* 5C */ struct BaSprite * anim;
    /* 60 */ ProcPtr sproc1;
    /* 64 */ ProcPtr procfx;
    /* 68 */ ProcPtr sproc_flashingbg;
};

// func_fe6_08058A80
// func_fe6_08058ACC
// func_fe6_08058B84
// func_fe6_08058C3C

struct ProcEkrDragon_086046D8 {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    
    /* 2C */ i16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int x;
};

void func_fe6_08058CEC(int x);
void func_fe6_08058D08(struct ProcEkrDragon_086046D8 * proc);
void func_fe6_08058D34(struct ProcEkrDragon * proc);
void func_fe6_08058E24(void);
void func_fe6_08058E58(int pos);
void func_fe6_08058E90(int pos);
void func_fe6_08058EC8(int pos);
int GetDragonPosition(void);
void InitEkrDragonStatus(void);
// func_fe6_08058F38
void EkrDragonTmCpyExt(int x);
// func_fe6_08058FA8
// func_fe6_08059018
// func_fe6_08059078

struct ProcEkrDragon_086046F0 {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x5C);

    /* 5C */ struct BaSprite * anim;
};

void func_fe6_08059090(struct ProcEkrDragon_086046F0 * proc);
void StartEkrManakete(struct BaSprite * anim);

void EkrManakete_BgFadeIn(struct ProcEkrDragon * proc);
void func_fe6_08059144(struct ProcEkrDragon * proc);
void func_fe6_080591AC(struct ProcEkrDragon * proc);
void func_fe6_080591CC(struct ProcEkrDragon * proc);
void func_fe6_080592D0(struct ProcEkrDragon * proc);
void EkrManakete_EnterPrepareNewBanimfx(struct ProcEkrDragon * proc);
void EkrManakete_BlockingInBattle(struct ProcEkrDragon * proc);
void func_fe6_08059400(struct ProcEkrDragon * proc);
void EkrManakete_StartExit(struct ProcEkrDragon * proc);
void func_fe6_0805946C(struct ProcEkrDragon * proc);
void func_fe6_080594CC(struct ProcEkrDragon * proc);
void func_fe6_08059578(struct ProcEkrDragon * proc);
void func_fe6_080595EC(struct ProcEkrDragon * proc);
void EkrManakete_ReloadBg(struct ProcEkrDragon * proc);
void EkrManakete_TriggerEnding(struct ProcEkrDragon * proc);

struct ProcEkrManaketefx {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ i16 timer;

    STRUCT_PAD(0x2E, 0x5C);

    /* 5C */ struct BaSprite * anim;
    /* 60 */ struct BaSprite * animfx;
};

void StartManaketeTransferAnim(struct BaSprite * anim, int type);
void func_fe6_08059730(struct ProcEkrManaketefx * proc);
void func_fe6_08059758(struct ProcEkrManaketefx * proc);
void func_fe6_0805979C(struct ProcEkrManaketefx * proc);
void func_fe6_080597E0(struct ProcEkrManaketefx * proc);
void func_fe6_08059824(struct ProcEkrManaketefx * proc);
void func_fe6_08059868(struct ProcEkrManaketefx * proc);
void func_fe6_080598AC(struct ProcEkrManaketefx * proc);

void func_fe6_080598F0(struct BaSprite * anim);
// func_fe6_08059928
void StartEkrDragonFae(struct BaSprite * anim);
// func_fe6_08059A28
// func_fe6_08059A44
// func_fe6_08059AD0
// func_fe6_08059B78
// func_fe6_08059BE4
// func_fe6_08059C38
// func_fe6_08059C54
// func_fe6_08059C78
// func_fe6_08059D34
void StartEkrDragonIdunn(struct BaSprite * anim);
