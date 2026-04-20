#ifndef FACE_H
#define FACE_H

#include "prelude.h"

#include "proc.h"

struct FaceInfo
{
    /* 00 */ void const * img;
    /* 04 */ void const * img_chibi;
    /* 08 */ u16 const * pal;
    /* 0C */ u8 x_mouth, y_mouth;
    /* 0E */ u8 unk_0E;
};

struct FaceVramEnt
{
    /* 00 */ u32 chr_off;
    /* 04 */ u16 palid;
};

struct FaceTalkSpriteEnt
{
    i16 chr;
    u16 const * sprite;
};

struct FaceProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2A);
    /* 2A */ u16 disp;
    /* 2C */ i8 slot;
    /* 2D */ i8 sprite_layer;
    /* 2E */ i16 x_disp;
    /* 30 */ i16 y_disp;
    /* 32 */ i16 x_offset_mouth;
    /* 34 */ i16 y_offset_mouth;
    /* 36 */ i8 talk_frame;
    /* 37 */ i8 talk_frame_clock;
    /* 38 */ u16 oam2;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ u16 const * sprite;
    /* 40 */ u8 fid;
};

enum
{
    FACE_64x80,
    FACE_64x80_FLIPPED,
    FACE_96x80,
    FACE_96x80_FLIPPED,
    FACE_64x72,
    FACE_64x72_FLIPPED,
};

enum
{
    FACE_HLAYER_DEFAULT,

    // why shifts?
    FACE_HLAYER_0 = 1 << 0,
    FACE_HLAYER_1 = 1 << 1,
    FACE_HLAYER_2 = 1 << 2,
    FACE_HLAYER_3 = 1 << 3,
};

#define FACE_DISP_FLIPPED (1 << 0)
#define FACE_DISP_KIND(kind) ((kind) & 7)
#define FACE_DISP_KIND_MASK FACE_DISP_KIND(-1)
#define FACE_DISP_SMILE (1 << 3)
#define FACE_DISP_TALK_1 (1 << 4)
#define FACE_DISP_TALK_2 (1 << 5)
#define FACE_DISP_HLAYER(layer) (((layer) & 0xF) << 6)
#define FACE_DISP_HLAYER_MASK FACE_DISP_HLAYER(-1)
#define FACE_DISP_BLEND (1 << 10)

enum { FACE_SLOT_COUNT = 4 };

extern struct FaceVramEnt CONST_DATA DefaultFaceConfig[FACE_SLOT_COUNT];

extern u16 CONST_DATA Sprite_Face64x80[];
extern u16 CONST_DATA Sprite_Face64x80_Flipped[];
extern u16 CONST_DATA Sprite_Face96x80[];
extern u16 CONST_DATA Sprite_Face96x80_Flipped[];
extern u16 CONST_DATA Sprite_Face64x72[];
extern u16 CONST_DATA Sprite_Face64x72_Flipped[];

extern u16 CONST_DATA Sprite_FaceTalkFrameB[];
extern u16 CONST_DATA Sprite_FaceTalkFrameB_Flipped[];
extern u16 CONST_DATA Sprite_FaceTalkFrameA[];
extern u16 CONST_DATA Sprite_FaceTalkFrameA_Flipped[];

extern struct FaceTalkSpriteEnt CONST_DATA FaceTalkFrameSpriteTable[16];

extern struct ProcScr CONST_DATA ProcScr_Face[];

extern u8 CONST_DATA FaceTm_Unk_085C3C18[];
extern u8 CONST_DATA FaceTm_Unk_085C3C92[];

extern struct ProcScr CONST_DATA ProcScr_FaceChibiSpr[];

extern u16 CONST_DATA Sprite_FaceChibi[];
extern u16 CONST_DATA Sprite_FaceChibi_Flipped[];

extern struct ProcScr CONST_DATA ProcScr_FaceEndIn8Frames[];

extern struct FaceProc * gFaces[FACE_SLOT_COUNT];

extern struct FaceVramEnt gFaceConfig[FACE_SLOT_COUNT];

extern struct FaceInfo CONST_DATA FaceInfoTable[];

struct FaceInfo const * GetFaceInfo(int fid);
int GetFace_Unk(int fid);
void InitFaces(void);
void SetFaceConfig(struct FaceVramEnt const * config);
int GetFreeFaceSlot(void);
void UpdateFaceTalk(struct FaceProc * proc);
void Face_OnIdle(struct FaceProc * proc);
struct FaceProc * StartFaceAuto(int fid, int x, int y, int disp);
struct FaceProc * StartFace(int slot, int fid, int x, int y, int disp);
void EndFace(struct FaceProc * proc);
void EndFaceById(int slot);
u32 SetFaceDisp(struct FaceProc * proc, u32 disp);
u32 SetFaceDispById(int slot, u32 disp);
u32 GetFaceDisp(struct FaceProc * proc);
u32 GetFaceDispById(int slot);
void FaceRefreshSprite(struct FaceProc * proc);
void UnpackFaceGraphics(int fid, int chr, int pal);
void PutFaceTm(u16 * tm, u8 const * data, int tileref, bool is_flipped);
void PutFullFaceTm(u16 * tm, int unused_1, int unused_2, int tileref, bool is_flipped);
void func_fe6_08008874(u16 * tm, int tileref);
void UnpackFaceChibiGraphics(int fid, int chr, int pal);
void PutFaceChibi(int fid, u16 * tm, int chr, int pal, bool is_flipped);
void UnpackFaceChibiSprGraphics(int fid, int chr, int pal);
void FaceChibiSpr_OnIdle(struct FaceProc * proc);
void StartFaceChibiStr(int x, int y, int fid, int chr, int pal, bool is_flipped, ProcPtr parent);
void EndFaceChibiSpr(void);
void PutFace80x72(u16 * tm, int fid, int chr, int pal);
void EndFacePtr(struct Proc * proc);
void EndFaceIn8Frames(struct FaceProc * proc);
void StartFaceFadeIn(struct FaceProc * proc);
void StartFaceFadeOut(struct FaceProc * proc);
u8 const * GetFactionFaceImg(int fid);
void ApplyFactionFacePal(int fid, int pal);

extern const u16 Img_Portrait_0860D0D8[];
extern const u16 Img_Portrait_0860D474[];
extern const u16 Img_Portrait_0860D494[];
extern const u16 Img_Portrait_0860DBC0[];
extern const u16 Pal_Portrait_0860DDC0[];
extern const u16 Img_Portrait_0860DDE0[];
extern const u16 Img_Portrait_0860E538[];
extern const u16 Pal_Portrait_0860E738[];
extern const u16 Img_Portrait_0860E758[];
extern const u16 Img_Portrait_0860EE20[];
extern const u16 Pal_Portrait_0860F020[];
extern const u16 Img_Portrait_0860F040[];
extern const u16 Img_Portrait_0860F7DC[];
extern const u16 Pal_Portrait_0860F9DC[];
extern const u16 Img_Portrait_0860F9FC[];
extern const u16 Img_Portrait_08610180[];
extern const u16 Pal_Portrait_08610380[];
extern const u16 Img_Portrait_086103A0[];
extern const u16 Img_Portrait_08610C7C[];
extern const u16 Pal_Portrait_08610E7C[];
extern const u16 Img_Portrait_08610E9C[];
extern const u16 Img_Portrait_086115FC[];
extern const u16 Pal_Portrait_086117FC[];
extern const u16 Img_Portrait_0861181C[];
extern const u16 Img_Portrait_086120C0[];
extern const u16 Pal_Portrait_086122C0[];
extern const u16 Img_Portrait_086122E0[];
extern const u16 Img_Portrait_08612CF0[];
extern const u16 Pal_Portrait_08612EF0[];
extern const u16 Img_Portrait_08612F10[];
extern const u16 Img_Portrait_086136D4[];
extern const u16 Pal_Portrait_086138D4[];
extern const u16 Img_Portrait_086138F4[];
extern const u16 Img_Portrait_08613FC0[];
extern const u16 Pal_Portrait_086141C0[];
extern const u16 Img_Portrait_086141E0[];
extern const u16 Img_Portrait_08614A88[];
extern const u16 Pal_Portrait_08614C88[];
extern const u16 Img_Portrait_08614CA8[];
extern const u16 Img_Portrait_08615400[];
extern const u16 Pal_Portrait_08615600[];
extern const u16 Img_Portrait_08615620[];
extern const u16 Img_Portrait_08615D5C[];
extern const u16 Pal_Portrait_08615F5C[];
extern const u16 Img_Portrait_08615F7C[];
extern const u16 Img_Portrait_08616688[];
extern const u16 Pal_Portrait_08616888[];
extern const u16 Img_Portrait_086168A8[];
extern const u16 Img_Portrait_08616F88[];
extern const u16 Pal_Portrait_08617188[];
extern const u16 Img_Portrait_086171A8[];
extern const u16 Img_Portrait_086179A0[];
extern const u16 Pal_Portrait_08617BA0[];
extern const u16 Img_Portrait_08617BC0[];
extern const u16 Img_Portrait_08618390[];
extern const u16 Pal_Portrait_08618590[];
extern const u16 Img_Portrait_086185B0[];
extern const u16 Img_Portrait_08618D98[];
extern const u16 Pal_Portrait_08618F98[];
extern const u16 Img_Portrait_08618FB8[];
extern const u16 Img_Portrait_086197C4[];
extern const u16 Pal_Portrait_086199C4[];
extern const u16 Img_Portrait_086199E4[];
extern const u16 Img_Portrait_0861A184[];
extern const u16 Pal_Portrait_0861A384[];
extern const u16 Img_Portrait_0861A3A4[];
extern const u16 Img_Portrait_0861AB6C[];
extern const u16 Pal_Portrait_0861AD6C[];
extern const u16 Img_Portrait_0861AD8C[];
extern const u16 Img_Portrait_0861B5A4[];
extern const u16 Pal_Portrait_0861B7A4[];
extern const u16 Img_Portrait_0861B7C4[];
extern const u16 Img_Portrait_0861BF90[];
extern const u16 Pal_Portrait_0861C190[];
extern const u16 Img_Portrait_0861C1B0[];
extern const u16 Img_Portrait_0861CA1C[];
extern const u16 Pal_Portrait_0861CC1C[];
extern const u16 Img_Portrait_0861CC3C[];
extern const u16 Img_Portrait_0861D474[];
extern const u16 Pal_Portrait_0861D674[];
extern const u16 Img_Portrait_0861D694[];
extern const u16 Img_Portrait_0861DF1C[];
extern const u16 Pal_Portrait_0861E11C[];
extern const u16 Img_Portrait_0861E13C[];
extern const u16 Img_Portrait_0861E86C[];
extern const u16 Pal_Portrait_0861EA6C[];
extern const u16 Img_Portrait_0861EA8C[];
extern const u16 Img_Portrait_0861F310[];
extern const u16 Pal_Portrait_0861F510[];
extern const u16 Img_Portrait_0861F530[];
extern const u16 Img_Portrait_0861FD28[];
extern const u16 Pal_Portrait_0861FF28[];
extern const u16 Img_Portrait_0861FF48[];
extern const u16 Img_Portrait_08620868[];
extern const u16 Pal_Portrait_08620A68[];
extern const u16 Img_Portrait_08620A88[];
extern const u16 Img_Portrait_08621170[];
extern const u16 Pal_Portrait_08621370[];
extern const u16 Img_Portrait_08621390[];
extern const u16 Img_Portrait_08621B3C[];
extern const u16 Pal_Portrait_08621D3C[];
extern const u16 Img_Portrait_08621D5C[];
extern const u16 Img_Portrait_0862259C[];
extern const u16 Pal_Portrait_0862279C[];
extern const u16 Img_Portrait_086227BC[];
extern const u16 Img_Portrait_08622F28[];
extern const u16 Pal_Portrait_08623128[];
extern const u16 Img_Portrait_08623148[];
extern const u16 Img_Portrait_08623804[];
extern const u16 Pal_Portrait_08623A04[];
extern const u16 Img_Portrait_08623A24[];
extern const u16 Img_Portrait_0862422C[];
extern const u16 Pal_Portrait_0862442C[];
extern const u16 Img_Portrait_0862444C[];
extern const u16 Img_Portrait_08624C14[];
extern const u16 Pal_Portrait_08624E14[];
extern const u16 Img_Portrait_08624E34[];
extern const u16 Img_Portrait_0862556C[];
extern const u16 Pal_Portrait_0862576C[];
extern const u16 Img_Portrait_0862578C[];
extern const u16 Img_Portrait_08625ED4[];
extern const u16 Pal_Portrait_086260D4[];
extern const u16 Img_Portrait_086260F4[];
extern const u16 Img_Portrait_086268B8[];
extern const u16 Pal_Portrait_08626AB8[];
extern const u16 Img_Portrait_08626AD8[];
extern const u16 Img_Portrait_086272C0[];
extern const u16 Pal_Portrait_086274C0[];
extern const u16 Img_Portrait_086274E0[];
extern const u16 Img_Portrait_08627C40[];
extern const u16 Pal_Portrait_08627E40[];
extern const u16 Img_Portrait_08627E60[];
extern const u16 Img_Portrait_086285C4[];
extern const u16 Pal_Portrait_086287C4[];
extern const u16 Img_Portrait_086287E4[];
extern const u16 Img_Portrait_08628F8C[];
extern const u16 Pal_Portrait_0862918C[];
extern const u16 Img_Portrait_086291AC[];
extern const u16 Img_Portrait_08629A5C[];
extern const u16 Pal_Portrait_08629C5C[];
extern const u16 Img_Portrait_08629C7C[];
extern const u16 Img_Portrait_0862A454[];
extern const u16 Pal_Portrait_0862A654[];
extern const u16 Img_Portrait_0862A674[];
extern const u16 Img_Portrait_0862AE2C[];
extern const u16 Pal_Portrait_0862B02C[];
extern const u16 Img_Portrait_0862B04C[];
extern const u16 Img_Portrait_0862B850[];
extern const u16 Pal_Portrait_0862BA50[];
extern const u16 Img_Portrait_0862BA70[];
extern const u16 Img_Portrait_0862C39C[];
extern const u16 Pal_Portrait_0862C59C[];
extern const u16 Img_Portrait_0862C5BC[];
extern const u16 Img_Portrait_0862CE08[];
extern const u16 Pal_Portrait_0862D008[];
extern const u16 Img_Portrait_0862D028[];
extern const u16 Img_Portrait_0862D9D0[];
extern const u16 Pal_Portrait_0862DBD0[];
extern const u16 Img_Portrait_0862DBF0[];
extern const u16 Img_Portrait_0862E4EC[];
extern const u16 Pal_Portrait_0862E6EC[];
extern const u16 Img_Portrait_0862E70C[];
extern const u16 Img_Portrait_0862EEE8[];
extern const u16 Pal_Portrait_0862F0E8[];
extern const u16 Img_Portrait_0862F108[];
extern const u16 Img_Portrait_0862F988[];
extern const u16 Pal_Portrait_0862FB88[];
extern const u16 Img_Portrait_0862FBA8[];
extern const u16 Img_Portrait_08630414[];
extern const u16 Pal_Portrait_08630614[];
extern const u16 Img_Portrait_08630634[];
extern const u16 Img_Portrait_08630E60[];
extern const u16 Pal_Portrait_08631060[];
extern const u16 Img_Portrait_08631080[];
extern const u16 Img_Portrait_08631974[];
extern const u16 Pal_Portrait_08631B74[];
extern const u16 Img_Portrait_08631B94[];
extern const u16 Img_Portrait_0863238C[];
extern const u16 Pal_Portrait_0863258C[];
extern const u16 Img_Portrait_086325AC[];
extern const u16 Img_Portrait_08632D64[];
extern const u16 Pal_Portrait_08632F64[];
extern const u16 Img_Portrait_08632F84[];
extern const u16 Img_Portrait_08633768[];
extern const u16 Pal_Portrait_08633968[];
extern const u16 Img_Portrait_08633988[];
extern const u16 Img_Portrait_08634188[];
extern const u16 Pal_Portrait_08634388[];
extern const u16 Img_Portrait_086343A8[];
extern const u16 Img_Portrait_08634B04[];
extern const u16 Pal_Portrait_08634D04[];
extern const u16 Img_Portrait_08634D24[];
extern const u16 Img_Portrait_0863554C[];
extern const u16 Pal_Portrait_0863574C[];
extern const u16 Img_Portrait_0863576C[];
extern const u16 Img_Portrait_08635FF8[];
extern const u16 Pal_Portrait_086361F8[];
extern const u16 Img_Portrait_08636218[];
extern const u16 Img_Portrait_086369A0[];
extern const u16 Pal_Portrait_08636BA0[];
extern const u16 Img_Portrait_08636BC0[];
extern const u16 Img_Portrait_0863740C[];
extern const u16 Pal_Portrait_0863760C[];
extern const u16 Img_Portrait_0863762C[];
extern const u16 Img_Portrait_08637D3C[];
extern const u16 Pal_Portrait_08637F3C[];
extern const u16 Img_Portrait_08637F5C[];
extern const u16 Img_Portrait_0863882C[];
extern const u16 Pal_Portrait_08638A2C[];
extern const u16 Img_Portrait_08638A4C[];
extern const u16 Img_Portrait_086393C8[];
extern const u16 Pal_Portrait_086395C8[];
extern const u16 Img_Portrait_086395E8[];
extern const u16 Img_Portrait_08639E68[];
extern const u16 Pal_Portrait_0863A068[];
extern const u16 Img_Portrait_0863A088[];
extern const u16 Img_Portrait_0863AAEC[];
extern const u16 Pal_Portrait_0863ACEC[];
extern const u16 Img_Portrait_0863AD0C[];
extern const u16 Img_Portrait_0863B424[];
extern const u16 Pal_Portrait_0863B624[];
extern const u16 Img_Portrait_0863B644[];
extern const u16 Img_Portrait_0863BCA0[];
extern const u16 Pal_Portrait_0863BEA0[];
extern const u16 Img_Portrait_0863BEC0[];
extern const u16 Img_Portrait_0863C74C[];
extern const u16 Pal_Portrait_0863C94C[];
extern const u16 Img_Portrait_0863C96C[];
extern const u16 Img_Portrait_0863D168[];
extern const u16 Pal_Portrait_0863D368[];
extern const u16 Img_Portrait_0863D388[];
extern const u16 Img_Portrait_0863DB2C[];
extern const u16 Pal_Portrait_0863DD2C[];
extern const u16 Img_Portrait_0863DD4C[];
extern const u16 Img_Portrait_0863E530[];
extern const u16 Pal_Portrait_0863E730[];
extern const u16 Img_Portrait_0863E750[];
extern const u16 Img_Portrait_0863ED74[];
extern const u16 Img_Portrait_0863ED94[];
extern const u16 Img_Portrait_0863F5C8[];
extern const u16 Pal_Portrait_0863F7C8[];
extern const u16 Img_Portrait_0863F7E8[];
extern const u16 Img_Portrait_0863FED0[];
extern const u16 Img_Portrait_0863FEF0[];
extern const u16 Img_Portrait_08640568[];
extern const u16 Img_Portrait_08640588[];
extern const u16 Img_Portrait_08640D20[];
extern const u16 Pal_Portrait_08640F20[];
extern const u16 Img_Portrait_08640F40[];
extern const u16 Img_Portrait_08641498[];
extern const u16 Img_Portrait_086414B8[];
extern const u16 Img_Portrait_08641CA0[];
extern const u16 Pal_Portrait_08641EA0[];
extern const u16 Img_Portrait_08641EC0[];
extern const u16 Img_Portrait_086426E4[];
extern const u16 Pal_Portrait_086428E4[];
extern const u16 Img_Portrait_08642904[];
extern const u16 Img_Portrait_086432E0[];
extern const u16 Pal_Portrait_086434E0[];
extern const u16 Img_Portrait_08643500[];
extern const u16 Img_Portrait_08643D2C[];
extern const u16 Img_Portrait_08643D4C[];
extern const u16 Img_Portrait_0864439C[];
extern const u16 Img_Portrait_086443BC[];
extern const u16 Img_Portrait_08644990[];
extern const u16 Img_Portrait_086449B0[];
extern const u16 Img_Portrait_0864505C[];
extern const u16 Img_Portrait_0864507C[];
extern const u16 Img_Portrait_0864579C[];
extern const u16 Img_Portrait_086457BC[];
extern const u16 Img_Portrait_08645E20[];
extern const u16 Img_Portrait_08645E40[];
extern const u16 Img_Portrait_08646498[];
extern const u16 Img_Portrait_086464B8[];
extern const u16 Img_Portrait_08646B84[];
extern const u16 Img_Portrait_08646BA4[];
extern const u16 Img_Portrait_086472B4[];
extern const u16 Img_Portrait_086472D4[];
extern const u16 Img_Portrait_08647A28[];
extern const u16 Img_Portrait_08647A48[];
extern const u16 Img_Portrait_086480FC[];
extern const u16 Img_Portrait_0864811C[];
extern const u16 Img_Portrait_086487AC[];
extern const u16 Img_Portrait_086487CC[];
extern const u16 Img_Portrait_08648E58[];
extern const u16 Img_Portrait_08648E78[];
extern const u16 Img_Portrait_08649494[];
extern const u16 Img_Portrait_086494B4[];
extern const u16 Img_Portrait_08649AC8[];
extern const u16 Img_Portrait_08649AE8[];
extern const u16 Img_Portrait_0864A1CC[];
extern const u16 Pal_Portrait_0864A1EC[];
extern const u16 Pal_Portrait_0864A20C[];
extern const u16 Pal_Portrait_0864A22C[];
extern const u16 Pal_Portrait_0864A24C[];
extern const u16 Pal_Portrait_0864A26C[];
extern const u16 Pal_Portrait_0864A28C[];
extern const u16 Pal_Portrait_0864A2AC[];
extern const u16 Pal_Portrait_0864A2CC[];
extern const u16 Pal_Portrait_0864A2EC[];
extern const u16 Pal_Portrait_0864A30C[];
extern const u16 Pal_Portrait_0864A32C[];
extern const u16 Pal_Portrait_0864A34C[];
extern const u16 Pal_Portrait_0864A36C[];
extern const u16 Pal_Portrait_0864A38C[];
extern const u16 Pal_Portrait_0864A3AC[];
extern const u16 Pal_Portrait_0864A3CC[];
extern const u16 Pal_Portrait_0864A3EC[];
extern const u16 Pal_Portrait_0864A40C[];
extern const u16 Pal_Portrait_0864A42C[];
extern const u16 Pal_Portrait_0864A44C[];
extern const u16 Pal_Portrait_0864A46C[];
extern const u16 Pal_Portrait_0864A48C[];
extern const u16 Pal_Portrait_0864A4AC[];
extern const u16 Pal_Portrait_0864A4CC[];
extern const u16 Pal_Portrait_0864A4EC[];
extern const u16 Pal_Portrait_0864A50C[];
extern const u16 Pal_Portrait_0864A52C[];
extern const u16 Pal_Portrait_0864A54C[];
extern const u16 Pal_Portrait_0864A56C[];
extern const u16 Pal_Portrait_0864A58C[];
extern const u16 Pal_Portrait_0864A5AC[];
extern const u16 Pal_Portrait_0864A5CC[];
extern const u16 Pal_Portrait_0864A5EC[];
extern const u16 Pal_Portrait_0864A60C[];
extern const u16 Pal_Portrait_0864A62C[];
extern const u16 Pal_Portrait_0864A64C[];
extern const u16 Pal_Portrait_0864A66C[];
extern const u16 Pal_Portrait_0864A68C[];
extern const u16 Pal_Portrait_0864A6AC[];
extern const u16 Pal_Portrait_0864A6CC[];
extern const u16 Pal_Portrait_0864A6EC[];
extern const u16 Pal_Portrait_0864A70C[];
extern const u16 Pal_Portrait_0864A72C[];
extern const u16 Pal_Portrait_0864A74C[];
extern const u16 Pal_Portrait_0864A76C[];
extern const u16 Pal_Portrait_0864A78C[];
extern const u16 Pal_Portrait_0864A7AC[];
extern const u16 Pal_Portrait_0864A7CC[];
extern const u16 Img_Portrait_0864A7EC[];
extern const u16 Pal_Portrait_0864ADB4[];
extern const u16 Img_Portrait_0864ADD4[];
extern const u16 Pal_Portrait_0864B32C[];
extern const u16 Img_Portrait_0864B34C[];
extern const u16 Pal_Portrait_0864BA94[];
extern const u16 Img_Portrait_0864BAB4[];
extern const u16 Pal_Portrait_0864C294[];
extern const u16 Img_Portrait_0864C2B4[];
extern const u16 Pal_Portrait_0864CA08[];
extern const u16 Img_Portrait_0864CA28[];
extern const u16 Pal_Portrait_0864D244[];
extern const u16 Img_Portrait_0864D264[];
extern const u16 Pal_Portrait_0864D82C[];
extern const u16 Img_Portrait_0864D84C[];
extern const u16 Pal_Portrait_0864DE68[];
extern const u16 Img_Portrait_0864DE88[];
extern const u16 Pal_Portrait_0864E470[];
extern const u16 Img_Portrait_0864E490[];
extern const u16 Pal_Portrait_0864EB18[];
extern const u16 Img_Portrait_0864EB38[];
extern const u16 Pal_Portrait_0864F1F8[];
extern const u16 Img_Portrait_0864F218[];
extern const u16 Pal_Portrait_0864F8AC[];
extern const u16 Img_Portrait_0864F8CC[];
extern const u16 Pal_Portrait_0864FF40[];
extern const u16 Img_Portrait_0864FF60[];
extern const u16 Pal_Portrait_086506D4[];
extern const u16 Img_Portrait_086506F4[];
extern const u16 Pal_Portrait_08650F94[];
extern const u16 Img_Portrait_08650FB4[];
extern const u16 Pal_Portrait_0865189C[];
extern const u16 Img_Portrait_086518BC[];
extern const u16 Pal_Portrait_08652010[];
extern const u16 Img_Portrait_08652030[];
extern const u16 Pal_Portrait_086527E4[];
extern const u16 Img_Portrait_08652804[];
extern const u16 Pal_Portrait_08652F5C[];
extern const u16 Img_Portrait_08652F7C[];
extern const u16 Pal_Portrait_08653700[];
extern const u16 Img_Portrait_08653720[];
extern const u16 Pal_Portrait_08653FFC[];
extern const u16 Img_Portrait_0865401C[];
extern const u16 Pal_Portrait_08654928[];
extern const u16 Img_Portrait_08654948[];
extern const u16 Pal_Portrait_0865514C[];
extern const u16 Img_Portrait_0865516C[];
extern const u16 Pal_Portrait_086559C0[];
extern const u16 Img_Portrait_086559E0[];
extern const u16 Pal_Portrait_08655FF4[];
extern const u16 Img_Portrait_08656014[];
extern const u16 Pal_Portrait_08656748[];
extern const u16 Img_Portrait_08656768[];
extern const u16 Pal_Portrait_08656F90[];
extern const u16 Img_Portrait_08656FB0[];
extern const u16 Pal_Portrait_0865779C[];
extern const u16 Img_Portrait_086577BC[];
extern const u16 Pal_Portrait_08657D28[];
extern const u16 Img_Portrait_08657D48[];
extern const u16 Pal_Portrait_08658684[];
extern const u16 Img_Portrait_086586A4[];
extern const u16 Pal_Portrait_08658C7C[];
extern const u16 Img_Portrait_08658C9C[];
extern const u16 Pal_Portrait_086592AC[];
extern const u16 Img_Portrait_086592CC[];
extern const u16 Img_Portrait_086598FC[];
extern const u16 Img_Portrait_0865991C[];
extern const u16 Img_Portrait_08659F08[];
extern const u16 Img_Portrait_08659F28[];
extern const u16 Img_Portrait_0865A57C[];
extern const u16 Img_Portrait_0865A59C[];
extern const u16 Img_Portrait_0865ABF4[];
extern const u16 Img_Portrait_0865AC14[];
extern const u16 Img_Portrait_0865B3F4[];
extern const u16 Pal_Portrait_0865B5F4[];
extern const u16 Img_Portrait_0865B614[];
extern const u16 Img_Portrait_0865C064[];
extern const u16 Pal_Portrait_0865C264[];
extern const u16 Img_Portrait_0865C284[];
extern const u16 Img_Portrait_0865CCA8[];
extern const u16 Img_Portrait_0865CCC8[];
extern const u16 Img_Portrait_0865D46C[];
extern const u16 Img_Portrait_0865D48C[];
extern const u16 Img_Portrait_0865DB2C[];
extern const u16 Pal_Portrait_0865DB4C[];
extern const u16 Pal_Portrait_0865DB6C[];
extern const u16 Pal_Portrait_0865DB8C[];
extern const u16 Img_Portrait_0865DBAC[];
extern const u16 Img_Portrait_0865E390[];
extern const u16 Pal_Portrait_0865E590[];
extern const u16 Pal_Portrait_0865E5B0[];
extern const u16 Pal_Portrait_0865E5D0[];
extern const u16 Pal_Portrait_0865E5F0[];
extern const u16 Img_Portrait_0865E610[];
extern const u16 Img_Portrait_0865EEAC[];
extern const u16 Pal_Portrait_0865F0AC[];
extern const u16 Pal_Portrait_0865F0CC[];
extern const u16 Pal_Portrait_0865F0EC[];
extern const u16 Pal_Portrait_0865F10C[];
extern const u16 Img_Portrait_0865F12C[];
extern const u16 Img_Portrait_0865F8DC[];
extern const u16 Pal_Portrait_0865FADC[];
extern const u16 Pal_Portrait_0865FAFC[];
extern const u16 Pal_Portrait_0865FB1C[];
extern const u16 Pal_Portrait_0865FB3C[];
extern const u16 Pal_Portrait_0865FB5C[];
extern const u16 Pal_Portrait_0865FB7C[];
extern const u16 Pal_Portrait_0865FB9C[];
extern const u16 Pal_Portrait_0865FBBC[];
extern const u16 Pal_Portrait_0865FBDC[];
extern const u16 Pal_Portrait_0865FBFC[];
extern const u16 Pal_Portrait_0865FC1C[];
extern const u16 Pal_Portrait_0865FC3C[];
extern const u16 Pal_Portrait_0865FC5C[];
extern const u16 Pal_Portrait_0865FC7C[];
extern const u16 Pal_Portrait_0865FC9C[];
extern const u16 Pal_Portrait_0865FCBC[];
extern const u16 Pal_Portrait_0865FCDC[];
extern const u16 Pal_Portrait_0865FCFC[];
extern const u16 Pal_Portrait_0865FD1C[];
extern const u16 Pal_Portrait_0865FD3C[];
extern const u16 Pal_Portrait_0865FD5C[];
extern const u16 Pal_Portrait_0865FD7C[];
extern const u16 Img_Portrait_0865FD9C[];
extern const u16 Img_Portrait_086604DC[];
extern const u16 Pal_Portrait_086606DC[];
extern const u16 Pal_Portrait_086606FC[];
extern const u16 Pal_Portrait_0866071C[];
extern const u16 Pal_Portrait_0866073C[];

#endif // FACE_H
