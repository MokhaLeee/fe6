#pragma once

#include "prelude.h"
#include "banim_sprite.h"

extern ProcPtr gUnk_Banim_0201E7AC[2];
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
extern u16 gEkrDragonJid[2];
extern u16 gUnk_Banim_0201E7C4[2];

void ResetEkrDragonStatus(void);
bool EkrDragonIntroDone(struct BaSprite * anim);
void TriggerEkrDragonEnding(struct BaSprite * anim);
bool CheckEkrDragonEndingDone(struct BaSprite * anim);

enum ekr_dragon_status_type_bitfile {
    EDRAGON_TYPE_0 = 1 << 0,
    EDRAGON_TYPE_1 = 1 << 1,
    EDRAGON_TYPE_2 = 1 << 2,
    EDRAGON_TYPE_3 = 1 << 3,
    EDRAGON_TYPE_4 = 1 << 4,
    EDRAGON_TYPE_5 = 1 << 5,
};

u32 GetEkrDragonStatueType(void); /* Different form FE8, this is a bitfile rather than enum */
u32 GetEkrDragonStatueType5370(void);
u32 GetEkrDragonStatueType70(void);
// func_fe6_080589C4
u16 * GetEkrDragonJid(int pos);
u16 * GetEkrDragonStatusIdx(struct BaSprite * anim);
// func_fe6_08058A1C
// func_fe6_08058A34
// func_fe6_08058A50

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

    STRUCT_PAD(0x2A, 0x2C);
    
    /* 2C */ i16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int x;
};

void func_fe6_08058CEC(int x);
void func_fe6_08058D08(struct ProcEkrDragon_086046D8 * proc);
// func_fe6_08058D34
// func_fe6_08058E24
// func_fe6_08058E58
// func_fe6_08058E90
// func_fe6_08058EC8
// func_fe6_08058F00
void InitEkrDragonStatus(void);
// func_fe6_08058F38
void EkrDragonTmCpyExt(int x, int y);
// func_fe6_08058FA8
// func_fe6_08059018
// func_fe6_08059078
// func_fe6_08059090
void func_fe6_080590B8(struct BaSprite * anim);
// func_fe6_080590FC
// func_fe6_08059144
// func_fe6_080591AC
// func_fe6_080591CC
// func_fe6_080592D0
// func_fe6_08059328
// func_fe6_080593D4
// func_fe6_08059400
// func_fe6_08059418
// func_fe6_0805946C
// func_fe6_080594CC
// func_fe6_08059578
// func_fe6_080595EC
// func_fe6_08059614
// func_fe6_0805966C
// func_fe6_08059690
// func_fe6_08059730
// func_fe6_08059758
// func_fe6_0805979C
// func_fe6_080597E0
// func_fe6_08059824
// func_fe6_08059868
// func_fe6_080598AC
// func_fe6_080598F0
// func_fe6_08059928
void func_fe6_080599D0(struct BaSprite * anim);
// func_fe6_08059A28
// func_fe6_08059A44
// func_fe6_08059AD0
// func_fe6_08059B78
// func_fe6_08059BE4
// func_fe6_08059C38
// func_fe6_08059C54
// func_fe6_08059C78
// func_fe6_08059D34
void func_fe6_08059D8C(struct BaSprite * anim);

extern const u16 Pal_081BF434[0xC0];
extern const u8 Img_081BC268[];
extern const u8 Tsa_081BF5B4[];
extern const u8 Img_081BCBDC[];
extern const u8 Tsa_081BF6F4[];
extern const u8 Img_081BD5E8[];
extern const u8 Tsa_081BD5E8[];
