#ifndef UNKNOWN_OBJECTS_H
#define UNKNOWN_OBJECTS_H

#include "gba/gba.h"
#include "types.h"

#include "proc.h"
#include "text.h"
#include "menu.h"
#include "mapselect.h"

// some or those are not so much "unknown" as much as they just don't have a home yet

extern struct Font gFont_Unk_02002770;
extern u16 gUiTmScratchA[0x280];
extern u16 gUiTmScratchB[0x280];
extern u16 gUiTmScratchC[0x240];

extern struct Glyph const * CONST_DATA TextGlyphs_Special[];
extern struct Glyph const * CONST_DATA TextGlyphs_System[];
extern struct Glyph const * CONST_DATA TextGlyphs_Talk[];
extern u16 const Pal_Text[]; // 2 palettes (system and talk)
extern u16 const Pal_GreenTextColors[];
extern u8 const Img_FactionMiniCard[];
extern u16 const Pal_FactionMiniCard[];
extern u8 const Img_TalkBubble[];
extern u16 const Pal_TalkBubble[];
extern u8 const Img_TalkBubbleOpeningA[];
extern u8 const Img_TalkBubbleOpeningB[];
extern u8 const Img_TalkBubbleOpeningC[];
extern u8 const Img_TalkBubbleOpeningD[];
extern u8 const Img_TalkBubbleOpeningE[];
extern u8 const Tsa_Unk_08101974[];
extern u8 const Tsa_Unk_08101A2C[];
extern u8 const Img_SystemObjects[];
extern u16 const Pal_SystemObjects[];
extern u8 const Img_LimitViewSquares[];
extern u16 const Pal_LimitViewBlue[];
extern u16 const Pal_LimitViewRed[];
extern u16 const Pal_LimitViewGreen[];
extern u8 const Img_PhaseChangeSquares[];
extern u8 const Img_PhaseChangePlayer[];
extern u16 const Pal_PhaseChangePlayer[];
extern u8 const Img_PhaseChangeEnemy[];
extern u16 const Pal_PhaseChangeEnemy[];
extern u8 const Img_PhaseChangeOther[];
extern u16 const Pal_PhaseChangeOther[];
extern u16 const SpriteAnim_08102450[];
extern u16 const SpriteAnim_GasTrapVertical[];
extern u16 const SpriteAnim_GasTrapHorizontal[];
extern u8 const Img_GasTrapVertical[];
extern u8 const Img_GasTrapHorizontal[];
extern u16 const Pal_GasTrap[];
extern u8 const Img_ArrowTrap[];
extern u16 const Pal_ArrowTrap[];
extern u16 const SpriteAnim_ArrowTrap[];
extern u8 const Img_FireTrap[];
extern u16 const Pal_FireTrap[];
extern u16 const SpriteAnim_FireTrap[];
extern u8 const Img_PikeTrap[];
extern u16 const SpriteAnim_PikeTrap[];
extern u16 const Pal_PikeTrap[];
extern u8 const Img_ChapterIntroFog[];
extern u16 const Pal_ChapterIntroFog[];
extern u8 const Img_ChapterIntroMotif[];
extern u16 const Pal_ChapterIntroMotif[];
extern u8 const Tm_ChapterIntroMotif[];
extern u8 const Img_GameOverText[];
extern u16 const Pal_GameOverText[];
extern u16 const Pal_Unk_0830D95C[];
extern u8 const Tsa_Unk_0830D97C[];
extern u8 const Tsa_Unk_081022FC[];
extern u16 const Pal_UnitSprites[];
extern u16 const Pal_UnitSpritesPurple[];
extern u8 const Img_SandstormParticles[];
extern u8 const Img_SnowstormParticles[];
extern u8 const Img_FlamesParticles[];
extern u16 const Pal_FlamesParticles[];
extern u8 const Img_CloudWeather[];
extern u16 const Pal_CloudWeather[];
extern u8 const Img_MovePath[];
extern u16 const Pal_MovePath[];
extern u8 const Tsa_UnitPanelHeader[];
extern u8 const Img_StatusHealEffect[];
extern u16 const Pal_StatusHealEffect[];
extern u8 const Tsa_StatusHealEffect[];
extern u8 const Tsa_BattlePreviewFrame_Short[];
extern u8 const Tsa_BattlePreviewFrame_Long[];
extern u16 const Pal_BattlePreviewFrame_Blue[];
extern u16 const Pal_BattlePreviewFrame_Red[];
extern u16 const Pal_BattlePreviewFrame_Green[];
extern u16 const Pal_BattlePreviewFrame_Purple[];
extern u8 const Img_BattlePreviewFrame[];
extern u8 const Img_BattlePreviewMultipliers[];
extern u16 const Pal_BattlePreviewMultipliers[];
extern u8 const Img_MuFogBump[];
extern u16 const SpriteAnim_MuFogBump[];
extern u8 const Img_ManimInfoWindowDigits[];
extern u16 const Pal_ManimWindowHpBar[];
extern u8 const Img_ManimInfoFrame[];
extern u8 const Img_ManimHpBar[];
extern u16 const Pal_UiWindowFrame_ThemeBlue[];
extern u16 const Pal_UiWindowFrame_ThemeRed[];
extern u16 const Pal_UiWindowFrame_ThemeGray[];
extern u16 const Pal_UiWindowFrame_ThemeGreen[];
extern u8 const Img_UiWindowFrame_ThemeBlue[];
extern u8 const Img_UiWindowFrame_ThemeRed[];
extern u8 const Img_UiWindowFrame_ThemeGray[];
extern u8 const Img_UiWindowFrame_ThemeGreen[];
extern u16 const Pal_UiStatBar_ThemeBlue[];
extern u16 const Pal_UiStatBar_ThemeRed[];
extern u16 const Pal_UiStatBar_ThemeGray[];
extern u16 const Pal_UiStatBar_ThemeGreen[];
extern u8 const Img_UiUnitNameFrame[];
extern u16 const Pal_UiUnitNameFrame[];

extern u16 const Pal_Unk_081B1710[]; // manim

extern u8 const Tsa_StatusScreen_FactionInfoFrame[]; // tsa
extern u8 const Tsa_StatusScreen_PlaytimeFrame[]; // tsa
extern u8 const gUnk_08309408[]; // compressed tsa
extern u8 const gUnk_0833C6F4[]; // tsa
extern u8 const gUnk_0833C8D8[]; // tsa

// extern ??? gUnk_083198CC
// extern ??? Pal_SpinningArrow
// extern ??? gUnk_08319EE8
// extern ??? gUnk_0831A088
// extern ??? gUnk_0831A248
// extern ??? gUnk_0831A268
// extern ??? gUnk_0831AABC
extern u16 const Pal_0831AAFC[];
// extern ??? gUnk_0831AB1C
// extern ??? gUnk_0831B068
extern u8 const Img_MonologueBG[];
extern u8 const Tsa_MonologueBG[];
// extern ??? gUnk_08320436
extern u16 const Pal_MonologueBG[];
// extern ??? Img_SpinningArrow
// extern ??? gUnk_08320EEC
// extern ??? gUnk_08320FCE
// extern ??? gUnk_083210A0
// extern ??? gUnk_083215B8
// extern ??? gUnk_08321EE4
// extern ??? gUnk_08321F24
// extern ??? gUnk_08321FA4
// extern ??? gUnk_08326910
// extern ??? gUnk_08326930
// extern ??? gUnk_08326E64
// extern ??? gUnk_08326EE6
// extern ??? gUnk_08327108

extern struct ProcScr CONST_DATA ProcScr_OpeningSequence[];
extern struct ProcScr CONST_DATA ProcScr_WorldMapIntroEvent[];
extern struct ProcScr CONST_DATA ProcScr_Config[];
extern u16 CONST_DATA Pal_ManimFireDragonMu[];
extern u16 CONST_DATA Pal_ManimDivineDragonMu[];

extern struct ChapterInfo CONST_DATA ChapterInfoTable[];

extern void const * CONST_DATA ChapterAssets[];

extern u16 const Pal_LinkArenaMuralBackground[];
extern u16 const Pal_Unk_083087C8[][0x20];

extern u8 const gUnk_083080D0[]; // compressed img (statscreen misc sprite sheet)
extern u8 const gUnk_08307CEC[]; // compressed tsa (statscreen main window frame)
extern u16 const gUnk_08308050[]; // pal (statscreen equip stats frame)
extern u8 const gUnk_08307ED4[]; // compressed img (statscreen equip stats frame)
extern u8 const gUnk_08308920[]; // compressed img (equipment label)

extern u8 const gUnk_08307D58[]; // tsa (compressed): statscreen page A frame
extern u8 const gUnk_08307DD4[]; // tsa (compressed): statscreen page B frame
extern u8 const gUnk_08307E50[]; // tsa (compressed): statscreen page C frame
extern u8 const gUnk_08308070[]; // tsa (compressed): statscreen page B battle stat box
extern u8 const gUnk_083080AC[]; // tsa: statscreen page B equipped weapon background

extern i16 const gEfxNoDmgBgShakeOff[];
extern i16 const gEfxQuakePureVec1[];
extern i16 const gEfxQuakePureVec2[];
extern i16 const gEfxQuakePureVec3[];
extern i16 const gEfxQuakePureVec4[];
extern i16 const gEfxQuakePureVec5[];
extern i16 const gEfxQuakePureVec6[];
extern i16 const gEfxQuakeVec_08111E14[];
extern i16 const gEfxQuakePureVec7[];
extern i16 const gEfxQuakePureVec8[];
extern i16 const gEfxQuakePureVec9[];
extern i16 const gEfxQuakePureVec10[];
extern i16 const gEfxQuakePureVec11[];
extern i16 const gEfxQuakeVec_08111F30[];
extern i16 const gEfxQuakeVec_08111FC6[];
// extern ??? RoundTypes_NormalPhy
// extern ??? RoundTypes_MissedPhy
// extern ??? RoundTypes_CriticalPhy
// extern ??? RoundTypes_TargetMiss
// extern ??? RoundTypes_TargetHitted
// extern ??? RoundTypes_NormalMag
// extern ??? RoundTypes_CriticalMag
// extern ??? RoundTypes_Dragon1
// extern ??? RoundTypes_Dragon2
// extern ??? RoundTypes_Dragon3
// extern ??? gUnk_08112298
// extern ??? gUnk_081122C0
// extern ??? BanimTypesPosLeft
// extern ??? BanimTypesPosRight
// extern ??? gUnk_081122D0
// extern ??? gUnk_081122DA
// extern ??? gUnk_08112370
// extern ??? gUnk_081125E0
// extern ??? gUnk_081127F0
// extern ??? gUnk_08112840
// extern ??? gUnk_081128AC
// extern ??? gUnk_081128FC
// extern ??? gUnk_08112968
// extern ??? gUnk_08112A1C
extern u8 const gUnk_08112AD0[];
extern u8 const gUnk_08112BA4[];
// extern ??? gUnk_08112C84
// extern ??? gUnk_08112CD4
extern u8 const Img_EfxSideHitDmgCrit[];
extern u8 const Img_EfxArrowWTA[];
extern u16 Img_EkrGaugeNumber[];
extern u16 Pal_EkrGauge_081131A4[];
extern u16 Pal_08113224[];
extern u16 gPalEfxHpBarPurple[];
extern u16 gPalEfxHpBarGreen[];
extern u16 Pal_081134C4[];
extern u16 const Pal_BanimUnitFlashing[];
extern u8 const Img_EkrExpBar[];
extern u8 const Img_EkrExpBarChange[];
extern u8 const Img_BarNumfx[];
extern u8 const Tsa_EkrExpBar[];
extern u16 const Pal_EkrExpBar[];
// extern ??? gUnk_08113D70
extern u16 const Pal_08113F98[];
extern u16 const Pal_08113FB8[];
extern u16 const Pal_08113FD8[];
extern u8 const Img_BanimArcherFBallistaIntro[];
extern u8 const Img_BanimArcherMBallistaIntro[];
extern u8 const Img_BanimSnipperFBallistaIntro[];
extern u8 const Img_LevelUpFrame[]; // img (stat gains)
extern u8 const Tm_LevelUpFrame[]; // tiles (stat gains)
extern u16 const Pal_LevelUpFrame[]; // pal (stat gains)
// extern ??? gUnk_081150E8
// extern ??? gUnk_081152FC
extern u8 const Img_EkrPopup[];
extern u8 const Img_EkrUnkPopup[];
extern u16 const Pal_EkrPopup[];
extern u8 const Tsa_EkrPopup[];
// extern ??? gUnk_08115524
// extern ??? gUnk_08117B90
// extern ??? gUnk_08118330
// extern ??? gUnk_08119CD8
extern u16 const FrameLut_EfxSongBGCOL[];
extern u16 const FrameConf_EfxEckesachsBGCOL[];
extern u16 const gUnk_08119D78[];
extern u16 const FrameConf_EfxDarkbreathBG[];
extern u16 const FrameConf_EfxDarkbreathBGCOL[];
extern u16 const FrameConf_EfxThunderBG[];
extern u16 const FrameConf_EfxThunderBGCOL[];
extern u16 const FrameConf_EfxFireBG[];
extern u16 const FrameConf_EfxFireHITBG[];
extern u16 const FrameConf_EfxElfireBGCOL[];
// extern ??? FrameConf_EfxFimbulvetrBGTR
// extern ??? FrameConf_EfxFimbulvetrBG
// extern ??? FrameConf_EfxThunderstormBG
// extern ??? FrameConf_EfxAlacaliburBG
// extern ??? FrameConf_EfxAlacaliburBGCOL
// extern ??? gUnk_0811A102
// extern ??? gUnk_0811A134
// extern ??? gUnk_0811A1AA
// extern ??? gUnk_0811A218
// extern ??? gUnk_0811A276
// extern ??? gUnk_0811A27C
// extern ??? gUnk_0811A302
// extern ??? FrameConf_EfxForblazeBG1
// extern ??? gUnk_0811A50E
// extern ??? gUnk_0811A520
// extern ??? gUnk_0811A530
// extern ??? gUnk_0811A59E
// extern ??? gUnk_0811A5AC
// extern ??? gUnk_0811A602
// extern ??? gUnk_0811A618
// extern ??? gUnk_0811A62A
// extern ??? gUnk_0811A668
// extern ??? gUnk_0811A67A
// extern ??? gUnk_0811A680
// extern ??? gUnk_0811A722
// extern ??? gUnk_0811A758
// extern ??? gUnk_0811A796
// extern ??? gUnk_0811A898
// extern ??? gUnk_0811A89E
// extern ??? gUnk_0811A8A4
// extern ??? gUnk_0811A8AA
// extern ??? gUnk_0811A8B0
// extern ??? gUnk_0811A8F2
// extern ??? gUnk_0811A934
// extern ??? gUnk_0811A966
// extern ??? gUnk_0811A9A8
// extern ??? gUnk_0811A9BA
// extern ??? gUnk_0811A9C2
// extern ??? gUnk_0811A9CA
// extern ??? gUnk_0811AACC
// extern ??? gUnk_0811AAD2
// extern ??? gUnk_0811ABB0
// extern ??? gUnk_0811ABE6
// extern ??? gUnk_0811AC30
// extern ??? gUnk_0811AD32
// extern ??? gUnk_0811AD68
extern const u16 Frames_EfxCriricalEffectBGCOL[];
extern const u16 FrameConf_EfxNormalEffectBG[];
// extern ??? FrameConfig_EfxMagFcastBg1
// extern ??? FrameConfig_EfxMagFcastBg2
// extern ??? FrameConfig_EfxMagFcastBg3
// extern ??? FrameConfig_EfxMagFcastBg4
// extern ??? FrameConf_EfxMagdhisEffectBG
// extern ??? FrameLut_EfxopFireBG
// extern ??? FrameLut_EfxopThunderBG
// extern ??? FrameLut_EfxopThunderBGCOL
// extern ??? gUnk_0811AF9E
// extern ??? gUnk_0811AFA4
extern const u8 Img_TeonoOBJ[];
extern const u16 Pal_TeonoOBJ[];
extern const u8 Img_EfxArrowOBJ[];
extern const u8 Img_SpellJavelin[];
extern const u16 Pal_SpellJavelin[];
extern const u8 Img_SpellJavelinCavalier[];
extern const u16 Pal_SpellJavelinCavalier[];
extern const u8 Img_SpellJavelinSoldier[];
extern const u16 Pal_SpellJavelinSoldier[];
extern const u8 Img_SpellJavelinPaladin[];
extern const u16 Pal_SpellJavelinPaladin[];
extern const u8 Img_SpellJavelinPrgasusKnight[];
extern const u16 Pal_SpellJavelinPrgasusKnight[];
extern const u8 Img_SpellJavelinFalcon[];
extern const u16 Pal_SpellJavelinFalcon[];
extern const u8 Img_SpellJavelinWyvernRider[];
extern const u16 Pal_SpellJavelinWyvernRider[];
extern const u8 Img_SpellJavelinWyvernLord[];
extern const u16 Pal_SpellJavelinWyvernLord[];
extern const u8 Img_SpellJavelinGenerial[];
extern const u16 Pal_SpellJavelinGenerial[];
extern const u8 Img_EfxSongFE6[];
extern const u16 Pal_EfxSongFE6[];
extern const u8 Img_EfxSongBG[];
extern const u16 Pal_EfxSongBG[];
extern const u16 Tsa_EfxSongBG[];
extern const u8 Img_EfxEckesachsBG[];
extern const u16 Pal_EfxEckesachsBG[];
extern const u16 Tsa_EfxEckesachsBG[];
extern const u8 Img_BreathSprites[];
extern u16 Pal_EfxBindingBlade[];
extern u16 Img_EfxHurtmutEff00OBJ1[];
extern u16 Img_EfxHurtmutEff00OBJ2[];
extern u16 Pal_EfxHurtmutEff00OBJ[];
extern u16 Pal_IceBreathSprites[];
extern u16 Pal_DarkBreathSprites[];
extern u16 Img_EfxDarkbreathBG[];
extern u16 Tsa_EfxDarkbreathBG1[];
extern u16 Tsa_EfxDarkbreathBG2[];
extern u16 Tsa_EfxDarkbreathBG3[];
extern u16 Tsa_EfxDarkbreathBG4[];
extern u16 Tsa_EfxDarkbreathBG5[];
extern u16 Tsa_EfxDarkbreathBG6[];
extern u16 Tsa_EfxDarkbreathBG7[];
extern u16 Tsa_EfxDarkbreathBG8[];
extern u16 Tsa_EfxDarkbreathBG9[];
extern u16 Tsa_EfxDarkbreathBG10[];
extern u16 Tsa_EfxDarkbreathBG11[];
extern u16 Tsa_EfxDarkbreathBG12[];
extern u16 Img_EfxCriricalEffectBG[];
extern u16 Pal_EfxCriricalEffectBG[];
extern u16 Tsa_EfxCriricalEffectBG_L[];
extern u16 Tsa_EfxCriricalEffectBG_R[];
extern u16 Img_EfxSRankWeaponEffectBG[];
extern u16 Pal_EfxSRankWeaponEffectBG[];
extern u16 Tsa_EfxSRankWeaponEffectBG[];
extern u16 Img_EfxNormalEffectBG[];
extern u16 Pal_EfxNormalEffectBG[];
extern u16 Tsa1_EfxNormalEffectBG[];
extern u16 Tsa2_EfxNormalEffectBG[];
extern u16 Tsa3_EfxNormalEffectBG[];
extern u16 Tsa4_EfxNormalEffectBG[];
extern u16 Tsa5_EfxNormalEffectBG[];
extern u16 Tsa6_EfxNormalEffectBG[];
extern u16 Tsa7_EfxNormalEffectBG[];
extern u16 Tsa8_EfxNormalEffectBG[];
extern u16 Tsa9_EfxNormalEffectBG[];
extern u16 TsaA_EfxNormalEffectBG[];
// extern ??? gUnk_08127778
extern u16 Img_EfxMagfcastBG[];
extern u16 Pal_EfxMagfcastBG[];
extern u16 Tsa1_EfxMagfcastBG[];
extern u16 Tsa2_EfxMagfcastBG[];
extern u16 Tsa3_EfxMagfcastBG[];
extern u16 Tsa4_EfxMagfcastBG[];
extern u16 Tsa5_EfxMagfcastBG[];
extern u16 Tsa6_EfxMagfcastBG[];
extern u16 Tsa7_EfxMagfcastBG[];
extern u16 Tsa8_EfxMagfcastBG[];
extern u16 Tsa9_EfxMagfcastBG[];
extern u16 Tsa10_EfxMagfcastBG[];
extern u16 Tsa11_EfxMagfcastBG[];
extern u16 Tsa12_EfxMagfcastBG[];
extern u16 Tsa13_EfxMagfcastBG[];
extern u16 Tsa14_EfxMagfcastBG[];
extern u16 Tsa15_EfxMagfcastBG[];
extern u16 Tsa16_EfxMagfcastBG[];
extern u16 Tsa17_EfxMagfcastBG[];
extern u16 Tsa18_EfxMagfcastBG[];
extern u16 Tsa19_EfxMagfcastBG[];
extern u16 Tsa20_EfxMagfcastBG[];
extern u16 Tsa21_EfxMagfcastBG[];
extern u16 Tsa22_EfxMagfcastBG[];
extern u16 Img_EfxMagdhisEffectBG[];
extern u16 Pal_EfxMagdhisEffectBG[];
extern u16 Tsa1_EfxMagdhisEffectBG[];
extern u16 Tsa2_EfxMagdhisEffectBG[];
extern u16 Tsa3_EfxMagdhisEffectBG[];
extern u16 Tsa4_EfxMagdhisEffectBG[];
extern u16 Img_EfxSunakemuriOBJ[];
extern u16 Pal_EfxSunakemuriOBJ1[];
extern u16 Pal_EfxSunakemuriOBJ2[];
extern u16 Pal_EfxSunakemuriOBJ3[];
extern u16 Img_EfxThunderBG[];
extern u16 Pal_EfxThunderBGCOL[];
extern u16 Tsa_EfxThuderBg1[];
extern u16 Tsa_EfxThuderBg2[];
extern u16 Img_EfxThunderOBJ[];
extern u16 Pal_EfxThunderOBJ[];
extern u16 Img_EfxFireBG[];
extern u16 Pal_EfxFireBG[];
extern u16 Tsa_EfxFireBG_0812E4C4[];
extern u16 Tsa_EfxFireBG_0812E56C[];
extern u16 Tsa_EfxFireBG_0812E614[];
extern u16 Tsa_EfxFireBG_0812E6CC[];
extern u16 Tsa_EfxFireBG_0812E794[];
extern u16 Tsa_EfxFireBG_0812E864[];
extern u16 Tsa_EfxFireBG_0812E964[];
extern u16 Tsa_EfxFireBG_0812EA6C[];
extern u16 Tsa_EfxFireBG_0812EB80[];
extern u16 Tsa_EfxFireBG_0812ECB8[];
extern u16 Tsa_EfxFireBG_0812EDBC[];
extern u16 Tsa_EfxFireBG_0812EE90[];
extern u16 Tsa_EfxFireBG_0812EF50[];
extern u16 Tsa_EfxFireBG_0812EFF8[];
extern u16 Tsa_EfxFireBG_0812F0A0[];
extern u16 Tsa_EfxFireBG_0812F158[];
extern u16 Tsa_EfxFireBG_0812F220[];
extern u16 Tsa_EfxFireBG_0812F2F0[];
extern u16 Tsa_EfxFireBG_0812F3F0[];
extern u16 Tsa_EfxFireBG_0812F4F8[];
extern u16 Tsa_EfxFireBG_0812F60C[];
extern u16 Tsa_EfxFireBG_0812F744[];
extern u16 Tsa_EfxFireBG_0812F848[];
extern u16 Tsa_EfxFireBG_0812F91C[];
extern u16 Img_EfxFireOBJ[];
extern u16 Pal_EfxFireOBJ[];
extern u16 Img_EfxFireHITBG_0812FFF8[];
extern u16 Img_EfxFireHITBG_08130D34[];
extern u16 Img_EfxFireHITBG_08131A10[];
extern u16 Img_EfxFireHITBG_08132838[];
extern u16 Img_EfxFireHITBG_0813382C[];
extern u16 Img_EfxFireHITBG_08134AC8[];
extern u16 Img_EfxFireHITBG_08135694[];
extern u16 Img_EfxFireHITBG_0813628C[];
extern u16 Img_EfxFireHITBG_08136DE4[];
extern u16 Img_EfxFireHITBG_081378E0[];
extern u16 Img_EfxFireHITBG_081382E8[];
extern u16 Tsa_EfxFireHITBG_08138C10[];
extern u16 Tsa_EfxFireHITBG_08138CBC[];
extern u16 Tsa_EfxFireHITBG_08138D74[];
extern u16 Tsa_EfxFireHITBG_08138E40[];
extern u16 Tsa_EfxFireHITBG_08138F20[];
extern u16 Tsa_EfxFireHITBG_08139014[];
extern u16 Tsa_EfxFireHITBG_0813912C[];
extern u16 Tsa_EfxFireHITBG_08139258[];
extern u16 Tsa_EfxFireHITBG_08139390[];
extern u16 Tsa_EfxFireHITBG_081394D4[];
extern u16 Tsa_EfxFireHITBG_08139628[];
extern u16 Tsa_EfxFireHITBG_08139780[];
extern u16 Tsa_EfxFireHITBG_081398E8[];
extern u16 Tsa_EfxFireHITBG_08139A54[];
extern u16 Tsa_EfxFireHITBG_08139BD0[];
extern u16 Tsa_EfxFireHITBG_08139D64[];
extern u16 Tsa_EfxFireHITBG_08139F04[];
extern u16 Tsa_EfxFireHITBG_0813A0A4[];
extern u16 Tsa_EfxFireHITBG_0813A244[];
extern u16 Tsa_EfxFireHITBG_0813A3E4[];
extern u16 Tsa_EfxFireHITBG_0813A574[];
extern u16 Pal_EfxFireHITBG[];
extern u16 Img_EfxElfireBG[];
extern u16 Pal_EfxElfireBGCOL[];
extern u16 Tsa_EfxElfireBG[];
extern u16 Tsa_FireBreathBg[];
extern u16 Img_EfxElfireOBJ[];
extern u16 Pal_EfxElfireOBJ[];
extern u16 Pal_EfxThunderstormBG[];
extern u16 Pal_EfxForblazeBG1[];
// extern ??? gUnk_08141320
// extern ??? gUnk_08142EAC
// extern ??? gUnk_08143A38
// extern ??? gUnk_08143A58
// extern ??? gUnk_08143A78
// extern ??? gUnk_08143A98
// extern ??? gUnk_08143AB8
// extern ??? gUnk_08143DA8
// extern ??? gUnk_08143EE4
// extern ??? gUnk_08144A00
// extern ??? Pal_EfxFimbulvetrBG
// extern ??? Pal_EfxFimbulvetrBGTR
// extern ??? Img_EfxFimbulvetrOBJ
// extern ??? Img_EfxAlacaliburBG
// extern ??? Pal_EfxAlacaliburBGCOL
// extern ??? Img_EfxAlacaliburOBJ
// extern ??? Pal_EfxAlacaliburOBJ
// extern ??? gUnk_0815F880
// extern ??? gUnk_0815F8A0
// extern ??? gUnk_08161DDC
// extern ??? gUnk_081621DC
// extern ??? gUnk_0816261C
// extern ??? gUnk_081629D4
// extern ??? gUnk_0816B328
// extern ??? gUnk_08176A4C
// extern ??? gUnk_08176A6C
// extern ??? gUnk_0817AAC0
// extern ??? gUnk_0817AC2C
// extern ??? gUnk_0817AC4C
// extern ??? gUnk_0817B418
// extern ??? gUnk_0817B438
// extern ??? gUnk_0817B8D0
// extern ??? gUnk_0817BBB4
// extern ??? gUnk_0817BBB6
// extern ??? gUnk_08181E60
// extern ??? gUnk_081830F4
// extern ??? gUnk_0818360C
// extern ??? gUnk_0818BBCC
// extern ??? gUnk_0818BBEC
// extern ??? gUnk_0818DD18
// extern ??? gUnk_0818E1E4
// extern ??? gUnk_0818E67C
// extern ??? gUnk_0818EA78
// extern ??? gUnk_0818EA98
// extern ??? gUnk_0818F1F8
// extern ??? gUnk_0818F3D8
// extern ??? gUnk_08193598
// extern ??? gUnk_081935B8
// extern ??? gUnk_08197BE0
// extern ??? gUnk_0819875C
// extern ??? gUnk_0819877C
// extern ??? gUnk_081AAECC
// extern ??? gUnk_081AB190
// extern ??? gUnk_081AB1B0
// extern ??? gUnk_081AB340
// extern ??? gUnk_081ABCA0
// extern ??? gUnk_081ABEA0
// extern ??? Pal_EfxFimbulvetrOBJ
// extern ??? gUnk_081AC114
// extern ??? gUnk_081AC90C
// extern ??? gUnk_081AD26C
// extern ??? gUnk_081ADBCC
// extern ??? gUnk_081ADDEC
// extern ??? gUnk_081AE88C
// extern ??? gUnk_081AEA8C
// extern ??? gUnk_081AEC8C
extern u16 const Pal_Unk_081B1710[];
// extern ??? gUnk_081B2348
// extern ??? gUnk_081B3D34
// extern ??? gUnk_081B4254
// extern ??? gUnk_081B4274
// extern ??? gUnk_081B4E9C
// extern ??? gUnk_081B4F9C
// extern ??? gUnk_081B57BC
// extern ??? gUnk_081B6688
// extern ??? gUnk_081B7468
// extern ??? gUnk_081B7650
// extern ??? gUnk_081B7670
// extern ??? gUnk_081B7690
// extern ??? gUnk_081B76B0
// extern ??? gUnk_081B7B48
// extern ??? gUnk_081B7F68
// extern ??? gUnk_081B80A8
// extern ??? gUnk_081B8934
// extern ??? gUnk_081B8E44
// extern ??? gUnk_081B8E64
// extern ??? gUnk_081BB35C
// extern ??? gUnk_081BB37C
// extern ??? gUnk_081BB5E4
// extern ??? gUnk_081BBBB4
// extern ??? gUnk_081BC0A8
extern i16 const FrameLut_EkrManaketefxNormalAttack[];
extern i16 const FrameLut_EkrManaketefxCriticalAttack[];
extern i16 const FrameLut_EkrFaefx[];
// extern ??? gUnk_081BC132
// extern ??? gUnk_081BC140
// extern ??? gUnk_081BC15E
// extern ??? gUnk_081BC17C
// extern ??? gUnk_081BC19A
extern u8 const Img_ManaketeBodyIntro2[];
extern u8 const Img_ManaketeBodyIntro1[];
extern u8 const Img_ManaketeBodyStd[];
extern u8 const Img_081BE490[];
extern const u16 Pal_EkrManaketefx[0xC0];
extern u8 const Tsa_ManaketeBodyIntro2[];
extern u8 const Tsa_ManaketeBodyIntro1[];
extern u8 const Tsa_ManaketeBodyStd[];
extern u8 const Tsa_081BFA34[];
extern u8 const Img_ManaketeObjfx1[];
extern u8 const Img_ManaketeObjfx2[];
extern u8 const Img_ManaketeObjfx3[];
extern u16 const Pal_ManaketeBodyStd[];
extern u8 const Img_EkrIdunn_081C1C94[];
extern u16 const Pal_081C4DE8[];
extern u8 const Tsa_EkrIdunn_081C4E28[];
extern u8 const Tsa_EkrIdunn_081C5264[];
extern u8 const Tsa_EkrIdunn_081C5688[];
extern u8 const Tsa_EkrIdunn_081C5AAC[];
extern u8 const Img_EkrFaefx[];
extern u16 const Pal_EkrFaefx[];
extern u16 const Tsa_EkrFaefx1[];
extern u16 const Tsa_EkrFaefx2[];
extern u16 const Tsa_EkrFaefx3[];
extern u16 const Tsa_EkrFaefx4[];
extern u16 const Tsa_EkrFaefx5[];
extern u16 const Tsa_EkrFaefx6[];
extern u16 const Tsa_EkrFaefx7[];
extern u16 const Tsa_EkrFaefx8[];
extern u16 const Tsa_EkrFaefx9[];
extern u16 const Tsa_EkrFaefx10[];
extern u16 const Tsa_EkrFaefx11[];
extern u16 const Tsa_EkrFaefx12[];
// extern ??? gUnk_081C9EF4
// extern ??? gUnk_081C9F14
// extern ??? gUnk_081C9F34
// extern ??? gUnk_081C9FA6
// extern ??? EkrLvupMsgsStr
// extern ??? EkrLvupMsgsMag
// extern ??? sEfxLvupPartsPos
extern const char gMsg_Lv[];
// extern ??? gUnk_081CA054
// extern ??? gUnk_081CA062
// extern ??? gUnk_081CA070
// extern ??? gUnk_081CAA14
// extern ??? gUnk_081CB404
// extern ??? gUnk_081CC428
// extern ??? gUnk_081CCDE0
// extern ??? gUnk_081CD7AC
// extern ??? gUnk_081CE154
// extern ??? gUnk_081CE474
// extern ??? gUnk_081CE848
// extern ??? gUnk_081CEC7C
// extern ??? gUnk_081CF03C
// extern ??? gUnk_081CF574
// extern ??? gUnk_081CFCB0
// extern ??? gUnk_081D043C

extern u8 Img_WmDialogueBox[];
extern u16 Pal_WmDialogueBox[];
extern u8 Pal_Wm_082AADA4[];
extern u8 Pal_Wm_082B2380[];
extern u8 Pal_Wm_082B9E64[];
extern u8 Pal_Wm_082C1224[];
extern u8 Pal_Wm_082C8874[];
extern u8 Pal_Wm_082D1964[];
extern u8 Pal_Wm_082D1BA0[];
extern u8 const Img_WmHighlight_Nation1[];
extern u8 const Img_WmHighlight_Nation2[];
extern u8 const Img_WmHighlight_Nation3[];
extern u8 const Img_WmHighlight_Nation4[];
extern u8 const Img_WmHighlight_Nation5[];
extern u8 const Img_WmHighlight_Nation6[];
extern u8 const Img_WmHighlight_Nation7[];
extern u16 const ApInfo_WmHighlight_Nation1[];
extern u16 const ApInfo_WmHighlight_Nation2[];
extern u16 const ApInfo_WmHighlight_Nation3[];
extern u16 const ApInfo_WmHighlight_Nation4[];
extern u16 const ApInfo_WmHighlight_Nation5[];
extern u16 const ApInfo_WmHighlight_Nation6[];
extern u16 const ApInfo_WmHighlight_Nation7[];
extern u16 const Pal_WmHightlight[];
extern u8 const Img_WorldMapStuff[];
extern u16 const ApInfo_WmDot[];
extern u16 const Pal_WorldMapStuff[];
extern u16 const Pal_WmSpriteDisp2[];
extern u16 const Pal_WmSpriteDisp1[];
extern u16 const Pal_WmMapText[];
extern u16 const ApInfo_WmMapTextDisp[];
extern u8 const Img_WmMapTextDisp_082D3904[];
extern u8 const Img_WmMapTextDisp_082D3C68[];
extern u8 const Img_WmMapTextDisp_082D3E78[];
extern u8 const Img_WmMapTextDisp_082D4120[];
extern u8 const Img_WmMapTextDisp_082D43A4[];
extern u8 const Img_WmMapTextDisp_082D45E0[];
extern u8 const Img_WmMapTextDisp_082D4838[];
extern u8 const Img_WmMapTextDisp_082D4B38[];
extern u8 const Img_WmMapTextDisp_082D4D3C[];
extern u8 const Img_WmMapTextDisp_082D4F9C[];
extern u8 const Img_WmMapTextDisp_082D5254[];
extern u8 const Img_WmMapTextDisp_082D5400[];
extern u8 const Img_WmMapTextDisp_082D55A4[];
extern u8 const Img_WmMapTextDisp_082D5778[];
extern u8 const Img_WmMapTextDisp_082D5844[];
extern u8 const Img_DefaultMapText[];
extern u8 const Img_WmMapTextDisp_082D59DC[];
extern u8 const Img_WmMapTextDisp_082D5B98[];
extern u8 const Img_WmMapTextDisp_082D5D08[];
extern u8 const Img_WmMapTextDisp_082D5EE0[];
extern u8 const Img_WmMapTextDisp_082D60F4[];
extern u8 const Img_WmMapTextDisp_082D6274[];
extern u8 const Img_WmMapTextDisp_082D6408[];
extern u8 const Img_WmMapTextDisp_082D65A8[];
extern u8 const Img_WmMapTextDisp_082D6768[];
extern u8 const Img_WmMapTextDisp_082D6930[];
extern u8 const Img_WmMapTextDisp_082D6AF4[];
extern u8 const Img_WmMapTextDisp_082D6CA8[];
extern u8 const Img_WmMapTextDisp_082D6E44[];
extern u8 const Img_WmMapTextDisp_082D7018[];
extern u8 const Img_WmMapTextDisp_082D720C[];
extern u8 const Img_WmMapTextDisp_082D73D0[];
extern u8 const Img_WmMapTextDisp_082D75D8[];
extern u8 const Img_WmMapTextDisp_082D7774[];
extern u8 const Img_WmMapTextDisp_082D7934[];
extern u8 const Img_WmMapTextDisp_082D7B20[];
extern u8 const Img_WmMapTextDisp_082D7D24[];
extern u8 const Img_WmMapTextDisp_082D7F2C[];
extern u8 const Img_Background_082D80B0[];
extern u8 const Tsa_Background_082DAC8C[];
extern u16 const Pal_Background_082DB140[];
extern u8 const Img_Background_082E28F8[];
extern u8 const Tsa_Background_082E35DC[];
extern u16 const Pal_Background_082E3A90[];
extern u8 const Img_Background_082E3B10[];
extern u8 const Tsa_Background_082E3EC0[];
extern u16 const Pal_Background_082E4374[];
extern u8 const Img_Background_082E4650[];
extern u8 const Tsa_Background_082E6EB4[];
extern u16 const Pal_Background_082E7368[];
extern u8 const Img_Background_082E73E8[];
extern u8 const Tsa_Background_082EADF0[];
extern u16 const Pal_Background_082EB2A4[];
extern u8 const Img_Background_082EB324[];
extern u8 const Tsa_Background_082EDB7C[];
extern u16 const Pal_Background_082EE030[];
extern u8 const Img_Background_082EE0B0[];
extern u8 const Tsa_Background_082EF97C[];
extern u16 const Pal_Background_082EFE30[];
extern u16 const Pal_Background_082EFEB0[];
extern u8 const Img_Background_082EFF30[];
extern u8 const Tsa_Background_082F1490[];
extern u16 const Pal_Background_082F1944[];
extern u8 const Img_Background_082F19C4[];
extern u8 const Tsa_Background_082F3494[];
extern u16 const Pal_Background_082F3948[];
extern u8 const Img_Background_082F39C8[];
extern u8 const Tsa_Background_082F62E0[];
extern u16 const Pal_Background_082F6794[];
extern u16 const Pal_Background_082F6814[];
extern u8 const Img_Background_082F6894[];
extern u8 const Tsa_Background_082F85E8[];
extern u16 const Pal_Background_082F8A9C[];
extern u8 const Img_Background_082F8B1C[];
extern u8 const Tsa_Background_082FBE6C[];
extern u16 const Pal_Background_082FC320[];
extern u8 const Img_Background_082FC3A0[];
extern u8 const Tsa_Background_082FECE0[];
extern u16 const Pal_Background_082FF194[];
extern u8 const Img_Background_082FF214[];
extern u8 const Tsa_Background_08301244[];
extern u16 const Pal_Background_083016F8[];
extern u16 const Pal_Background_08301778[];
extern u16 const Pal_Background_083017F8[];
extern u8 const Img_Background_08301878[];
extern u8 const Tsa_Background_0830491C[];
extern u16 const Pal_Background_08304DD0[];
extern u8 const Img_Background_08304E50[];
extern u8 const Tsa_Background_08306F24[];
extern u16 const Pal_Background_083073D8[];

extern u16 const Pal_Unk_08309474[];
extern u16 const Pal_Unk_083094F4[];
extern u16 const Pal_Unk_0830D5E4[];

extern u8 const Img_MapUiElements[];

extern u16 const Pal_UnitMapUiFrame_Blue[];
extern u16 const Pal_UnitMapUiFrame_Red[];
extern u16 const Pal_UnitMapUiFrame_Green[];

extern u8 const Tsa_UnitMapUi_Frame[];
extern u8 const Tsa_TerrainMapUi_Labels[];
extern u8 const Tsa_TerrainMapUi_BallistaLabels[];
extern u8 const Tsa_TerrainMapUi_ObstacleLabels[];
extern u8 const Tsa_TerrainMapUi_ObstacleFullHp[];
extern u8 const Tsa_TerrainMapUi_Frame[];
extern u8 const Tsa_UnitBurstMapUi_Frame0[];
extern u8 const Tsa_UnitBurstMapUi_Frame1[];
extern u8 const Tsa_UnitBurstMapUi_Frame2[];
extern u8 const Tsa_UnitBurstMapUi_Frame3[];
extern u8 const Tsa_UnitBurstMapUi_Frame4[];
extern u8 const Tsa_UnitBurstMapUi_Frame5[];

extern u8 const Img_Unk_083092CC[];

// extern const ??? gUnk_08336CD0
// extern const ??? gUnk_08336CF0
// extern const ??? gUnk_08336CF8
// extern const ??? gUnk_08336D00
// extern const ??? gUnk_08336D3C
// extern const ??? gUnk_08336D48
// extern const ??? gUnk_08336D54
extern u8 const Img_MuralBackground[];
extern u8 const Img_0833B958[];
extern u8 const Img_0833BB14[];
extern u8 const Img_0833BB28[];
extern u8 const Tsa_0833BE84[];
extern u8 const Tsa_0833BF08[];
extern u16 const Pal_MuralBackground[];
extern u16 const Pal_0833C01C[];
extern u16 const Pal_0833C03C[];
extern u8 const Img_0833C09C[];
extern u8 const Tsa_0833C1D8[];
extern u8 const Tsa_0833C234[];
extern u8 const Img_Unk_0833C378[];
// extern const ??? gUnk_0833C6F4
// extern const ??? gUnk_0833C8D8
extern u16 const Pal_Unk_0833C944[];
extern u8 const Img_WorldMap_PlayRank[];
extern u8 const Tsa_08340ED8[];
extern u16 const Pal_0834138C[];
extern u8 const Img_PlayRank_083413CC[];
extern u16 const Pal_08341DA0[];
extern u8 const Img_PlayRank[];
extern u8 const Img_PlayRankCharacters[];
extern u16 const Pal_08342A98[];
extern u16 const Pal_08342AB8[];
extern u16 const Pal_08342AD8[];
extern u8 const Tsa_08342AF8[];
// extern const ??? gUnk_08342B54
extern const u16 Pal_08343358[];
extern u8 const Img_08343398[];
extern u8 const Img_08343A80[];
extern u8 const Img_08343FAC[];
// extern const ??? gUnk_083442C4
// extern const ??? gUnk_08344304
extern u8 const Img_Fin[];
extern u16 const Pal_Fin[];
extern u8 const Img_Credit_08344CD0[];
extern u16 const Tsa_Credit_0834523C[];
extern u16 const Pal_Credit_08345420[];
// extern const ??? gUnk_08345440
// extern const ??? gUnk_08345934
// extern const ??? gUnk_08346184
// extern const ??? gUnk_083461C4
// extern const ??? gUnk_08346330
// extern const ??? gUnk_083463B4
// extern const ??? gUnk_083463F4
// extern const ??? gUnk_08346574
extern u8 const Img_MonologueText[];
extern u16 const Pal_MonologueText[];
extern u8 const Img_EndingMonologueText3[];
extern u8 const Img_EndingMonologueText1[];
extern u8 const Img_EndingMonologueText4[];
extern u8 const Img_08352160[];
extern u16 const Pal_EndingMonologueText[];
extern const int gUnk_08353328[];
// extern const ??? gUnk_08354728
// extern const ??? gUnk_08354760
// extern const ??? gUnk_08354780
// extern const ??? gUnk_08357140
// extern const ??? gUnk_083599AC
// extern const ??? gUnk_0835A368
// extern const ??? gUnk_0835A3E8
// extern const ??? gUnk_0835A5D0
// extern const ??? gUnk_0835A5F0
// extern const ??? gUnk_0835AB08
// extern const ??? gUnk_0835AB28
// extern const ??? gUnk_0835B040
// extern const ??? gUnk_0835C034
// extern const ??? gUnk_0835C80C
// extern const ??? gUnk_0835C824
// extern const ??? gUnk_0835C829
// extern const ??? String_ShopGoldG
// extern const ??? gUnk_0835CA78
extern u16 const Pal_Title_BG[];
extern u8 const Img_Title_BG[];
extern u8 const Img_Title_Sprites[];
extern u16 const SpriteAnim_0835F2C8[];
extern u16 const Pal_Title_0835F388[];
extern u8 const Tsa_Title_BG2[];
extern u8 const Tsa_Title_BG0[];
extern u8 const Tsa_Title_BG1[];
extern u8 const Img_Title_BG3[];
extern u16 const Pal_Title_BG3[];
extern u8 const Img_Title_08364438[];
extern u16 const Pal_Title_08364A94[];
// extern const ??? gUnk_08364AB4
// extern const ??? gUnk_083674BC
// extern const ??? gUnk_08367B30
// extern const ??? gUnk_0836A094
// extern const ??? gUnk_0836A494
// extern const ??? gUnk_0836A888
// extern const ??? gUnk_0836A9AC
// extern const ??? gUnk_0836EEFC
// extern const ??? gUnk_0836F610
// extern const ??? Img_EndingMonologue
// extern const ??? Tsa_EndingMonologue
// extern const ??? Zpal_EndingMonologue
// extern const ??? gUnk_083747A4
// extern const ??? gUnk_08375888
// extern const ??? gUnk_083758A8
// extern const ??? gUnk_08375908
// extern const ??? gUnk_08375ADC
// extern const ??? gUnk_08375B64
// extern const ??? gUnk_08375B84
// extern const ??? gUnk_08376B70
// extern const ??? gUnk_08376DF4
// extern const ??? gUnk_08376FDC
// extern const ??? gUnk_08378C60
// extern const ??? gUnk_08378F54
// extern const ??? gUnk_08379D0C
// extern const ??? gUnk_08379D2C
// extern const ??? gUnk_08379DCC
// extern const ??? gUnk_08379F8C
// extern const ??? gUnk_0837AA68
// extern const ??? gUnk_0837AAC8
// extern const ??? gUnk_0837AAE8
// extern const ??? gUnk_0837AB18
// extern const ??? gUnk_0837ACB0
// extern const ??? gUnk_0837ACD0
// extern const ??? gUnk_0837C844
// extern const ??? gUnk_0837CB0C
// extern const ??? gUnk_0837CB2C
// extern const ??? gUnk_0837CB4C
// extern const ??? gUnk_0837CB6C
// extern const ??? gUnk_0837CB8C
// extern const ??? gUnk_0837EEB4
// extern const ??? gUnk_0837F418
// extern const ??? gUnk_0837F478
// extern const ??? gUnk_08380ECC
// extern const ??? gUnk_08380F4C
// extern const ??? gUnk_08380F54
// extern const ??? gUnk_08380F5A
// extern const ??? gUnk_08380F62

// extern CONST_DATA ??? gUnk_0868A4F8
// extern CONST_DATA ??? gUnk_0868A518
// extern CONST_DATA ??? gUnk_0868A550
// extern CONST_DATA ??? gUnk_0868A55C
// extern CONST_DATA ??? Sprite_0868A568
// extern CONST_DATA ??? Sprite_0868A570

extern const u16 gUnk_083278AC[];
extern const u8 gUnk_083278EC[];
extern const u16 gUnk_083280B0[];
extern const u8 gUnk_0832A130[];
extern const u8 gUnk_0832A29C[];
extern const u8 gUnk_0832B554[];
extern const u16 gUnk_0832BDE8[];
extern const u16 Img_XmapObj[];
extern const u16 Pal_XmapObj[];
extern const u16 gUnk_0832C35C[];
extern const u16 gUnk_0832C39C[];
extern const u16 gUnk_0832C5E8[];
extern const u16 gUnk_0832CA9C[];
extern const u16 gUnk_0832CAFC[];
extern const u16 gUnk_0832CC90[];

/* xmap.h */
/* config.h */
/* augury.h */
/* worldmap.h */
/* monologue.h */
/* shop.h */
/* arena_ui.h */
/* suspend_ui.h */
/* opanim.h */
/* titlescreen.h */

#endif // UNKNOWN_OBJECTS_H
