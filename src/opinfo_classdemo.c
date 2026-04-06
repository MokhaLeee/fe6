#include "prelude.h"
#include "proc.h"
#include "banim.h"
#include "sound.h"
#include "oam.h"
#include "sprite.h"
#include "hardware.h"
#include "savemenu.h"
#include "opinfo.h"
#include "unit.h"
#include "item.h"
#include "text.h"
#include "util.h"
#include "talk.h"
#include "armfunc.h"
#include "constants/jids.h"

EWRAM_OVERLAY(opinfo) struct EkrMainMiniDesc OpEkrMiniDesc = {};
EWRAM_OVERLAY(opinfo) u16 OpEkrMini_ImgBuf[0x1000] = {};
EWRAM_OVERLAY(opinfo) u16 OpEkrMini_OamBuf[0x2C00] = {};
EWRAM_OVERLAY(opinfo) u16 OpEkrMini_PalBuf[0x50] = {};
EWRAM_OVERLAY(opinfo) u8  OpEkrMini_ScrBuf[0x2A00] = {};

EWRAM_OVERLAY(opinfo) struct EfxopMagicDesc OpEkrMagiDesc = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrMagi_BgImgBuf[0x2000] = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrMagi_BgTsaBuf[0x800] = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrMagi_ObImgBuf[0x1000] = {};

EWRAM_OVERLAY(opinfo) struct EkrTerrainfxDesc OpEkrTerrainDesc = {};
EWRAM_OVERLAY(opinfo) u8 OpEkrTerrain_ImgBuf[0x2000] = {};

EWRAM_OVERLAY(opinfo) struct Text OpClassDemoTexts[6] = {};

EWRAM_OVERLAY(opinfo) struct Vec1u unk_opinfo_0200FF54[14] = {};

void HBlank_ClassDemoMain(void)
{
	u16 vcount = (REG_VCOUNT + 1);

	if (vcount < 110) {
		REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 2;
		REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 2;
	} else {
		REG_BG0CNT = (0xFFFC & REG_BG0CNT) + 1;
		REG_BG2CNT = (0xFFFC & REG_BG2CNT) + 1;
	}
}

void OpInfo_EfxmagicMiniCallBack(void)
{
	SetBlendConfig(1, 0x10, 0x10, 0);

	SetBlendTargetA(0, 1, 0, 0, 0);
	SetBlendTargetB(0, 0, 1, 1, 1);

	SetWinEnable(1, 0, 0);
	SetWin0Box(0, 0, 240, 160);

	SetWin0Layers(1, 1, 1, 1, 1);
	SetWOutLayers(1, 0, 1, 1, 1);

	gDispIo.win_ct.win0_enable_blend = 1;

#if FE6
	gDispIo.win_ct.wout_enable_blend = 0;
#elif FE8
	gDispIo.win_ct.win1_enable_blend = 0;
#endif

	gDispIo.blend_ct.target2_enable_bd = 1;
}

const char Str_OpInfo_Hp[]  = TEXT("ＨＰ", "HP");
const char Str_OpInfo_Str[] = TEXT("力",   "Str");
const char Str_OpInfo_Skl[] = TEXT("技",   "Skl");
const char Str_OpInfo_Spd[] = TEXT("速さ", "Spd");
const char Str_OpInfo_Def[] = TEXT("守備", "Def");
const char Str_OpInfo_Res[] = TEXT("魔防", "Res");

void ClassDemoMain_ExecEkrMainMini(struct ProcClassDemoMain *proc)
{
	int i, j;
	register int k asm("r2");
	struct Unk_086905F8 *u_086905F8;

	int use_mag = false;

	char const *msgs[] = {
		Str_OpInfo_Hp,
		Str_OpInfo_Str,
		Str_OpInfo_Skl,
		Str_OpInfo_Spd,
		Str_OpInfo_Def,
		Str_OpInfo_Res
	};

	for (i = ITEM_KIND_STAFF; i <= ITEM_KIND_ELDER; i++) {
		if (GetJInfo(OpClassDemo_JidConfig[proc->index])->wexp[i] != 0) {
			use_mag = true;
			break;
		}
	}

	proc->x = 0;
	proc->unk_2C = 0;
	proc->unk_2E = 0;
	proc->unk_3E = 1;
	proc->anim_x = 0xFA;

	TmFill(gBg0Tm, 0);
	TmFill(gBg1Tm, 0);
	TmFill(gBg2Tm, 0);

	if (proc->index == 0) {
		proc->unk_2E = 0;
		u_086905F8 = gUnk_086905F8;
	} else {
		i = 0;
		k = 0;
		j = 0;

		do {
			do {
				u_086905F8 = &gUnk_086905F8[++j];
				++i;
			} while (u_086905F8->unk_01 != 0);
			k++;
		} while(k != proc->index);
		proc->unk_2E = i + 1;
	}
	proc->unk_30 = gUnk_086905F8[proc->unk_2E].unk_00;

	SetDispEnable(0, 0, 0, 0, 0);
	ResetTextFont();
	ResetText();

	gDispIo.bg0_ct.priority = 2;
	gDispIo.bg1_ct.priority = 2;
	gDispIo.bg2_ct.priority = 2;
	gDispIo.bg3_ct.priority = 3;

	SetBgOffset(BG_0, 0, 0);
	SetBgOffset(BG_1, 0, 0);
	SetBgOffset(BG_2, 0, 0);
	SetBgOffset(BG_3, 0, 0);

	Decompress(Img_MonologueBG, (u8 *)BG_VRAM + GetBgChrOffset(BG_3));
	ApplyPalette(Pal_Op_0835AB08, 0xA);
	TmApplyTsa(gBg3Tm, Tsa_Op_0835AB28, 0xA000);
	Decompress(Img_Op_0835A3E8, (u8 *)BG_VRAM + GetBgChrOffset(BG_2));
	ApplyPalette(Pal_Op_0835A5D0, 0x9);
	TmApplyTsa(gBg2Tm, Tsa_Op_0835A5F0, 0x9000);

	EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

	TmFill(gBg0Tm, 0);

	proc->unit_status[0] = GetJInfo(OpClassDemo_JidConfig[proc->index])->base_hp;
	proc->unit_status[1] = GetJInfo(OpClassDemo_JidConfig[proc->index])->base_pow;
	proc->unit_status[2] = GetJInfo(OpClassDemo_JidConfig[proc->index])->base_skl;
	proc->unit_status[3] = GetJInfo(OpClassDemo_JidConfig[proc->index])->base_spd;
	proc->unit_status[4] = GetJInfo(OpClassDemo_JidConfig[proc->index])->base_def;
	proc->unit_status[5] = GetJInfo(OpClassDemo_JidConfig[proc->index])->base_res;

	for (i = 0; i < 6; i++) {
		InitText(&OpClassDemoTexts[i], 3);
		ClearText(&OpClassDemoTexts[i]);
		Text_SetColor(&OpClassDemoTexts[i], TEXT_COLOR_SYSTEM_GOLD);
		Text_SetCursor(&OpClassDemoTexts[i], 0);

		if (use_mag && i == 1)
			Text_DrawString(&OpClassDemoTexts[1], Str_OpInfo_Mag);
		else
			Text_DrawString(&OpClassDemoTexts[i], msgs[i]);

		PutText(&OpClassDemoTexts[i], gBg0Tm + TM_OFFSET(1, 1 + i * 2));
		PutNumber(gBg0Tm + TM_OFFSET(5, 1 + i * 2), TEXT_COLOR_SYSTEM_WHITE, proc->unit_status[i]);
	}

	proc->procfx = StartClassDemoStatus(proc);

	InitTalk(0x100, 2, 0);
	SetInitTalkTextFont();
	ClearTalkText();
	EndTalk();
	StartTalkMsg(2, 15, OpClassDemo_IntroMsgs[proc->index]);
	SetTalkPrintColor(TEXT_COLOR_SYSTEM_WHITE);
	SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
	SetTalkFlag(TALK_FLAG_NOBUBBLE);
	SetTalkFlag(TALK_FLAG_NOSKIP);
	SetTalkFlag(TALK_FLAG_NOFAST);
	SetTalkFlag(TALK_FLAG_SILENT);
	SetTalkPrintDelay(4);

	OpEkrMiniDesc.x = 0x104;
	OpEkrMiniDesc.y = 0x58;
	OpEkrMiniDesc.bid = OpClassDemo_BIDs[proc->index];
	OpEkrMiniDesc.round_type = ANIM_ROUND_TAKING_HIT_CLOSE;
	OpEkrMiniDesc.faction_pal = BANIMPAL_BLUE;
	OpEkrMiniDesc.pos = POS_R;
	OpEkrMiniDesc.oam2_chr = 0x180;
	OpEkrMiniDesc.oam2_pal = 2;
	OpEkrMiniDesc.img_buf = OpEkrMini_ImgBuf;
	OpEkrMiniDesc.oam_buf = OpEkrMini_OamBuf;
	OpEkrMiniDesc.pal_buf = OpEkrMini_PalBuf;
	OpEkrMiniDesc.scr_buf = OpEkrMini_ScrBuf;
	OpEkrMiniDesc.magicfx_desc = &OpEkrMagiDesc;

	OpEkrMagiDesc.magicFuncIdx = OpClassDemo_MagiConfig[proc->index * 5 + 0];
	OpEkrMagiDesc.xOffsetBg    = OpClassDemo_MagiConfig[proc->index * 5 + 1];
	OpEkrMagiDesc.yOffsetBg    = OpClassDemo_MagiConfig[proc->index * 5 + 2];
	OpEkrMagiDesc.xOffsetObj   = OpClassDemo_MagiConfig[proc->index * 5 + 3];
	OpEkrMagiDesc.yOffsetObj   = OpClassDemo_MagiConfig[proc->index * 5 + 4];
	OpEkrMagiDesc.objChr = 0x280;
	OpEkrMagiDesc.objPalId = 0xF;
	OpEkrMagiDesc.bgPalId = 0xF;
	OpEkrMagiDesc.bgChr = 0x200;
	OpEkrMagiDesc.bgPalId = 0xF;
	OpEkrMagiDesc.bg = BG_1;
	OpEkrMagiDesc.bgTmBuf = gBg1Tm;
	OpEkrMagiDesc.bgImgBuf = OpEkrMagi_BgImgBuf;
	OpEkrMagiDesc.bgTsaBuf = OpEkrMagi_BgTsaBuf;
	OpEkrMagiDesc.objImgBuf = OpEkrMagi_ObImgBuf;
	OpEkrMagiDesc.resetCallback = OpInfo_EfxmagicMiniCallBack;

	NewEkrUnitMainMini(&OpEkrMiniDesc);

	OpEkrTerrainDesc.terrain_l = OpClassDemo_TerrainConfig[proc->index][POS_L];
	OpEkrTerrainDesc.pal_l = 0xA;
	OpEkrTerrainDesc.chr_l = 0x380;
	OpEkrTerrainDesc.terrain_r = OpClassDemo_TerrainConfig[proc->index][POS_R];
	OpEkrTerrainDesc.pal_r = 0xB;
	OpEkrTerrainDesc.chr_r = 0x3C0;
	OpEkrTerrainDesc.distance = EKR_DISTANCE_CLOSE;
	OpEkrTerrainDesc.bg_index = -1;
	OpEkrTerrainDesc.vram_offset = (u32)OBJ_VRAM0;
	OpEkrTerrainDesc.img_buf = OpEkrTerrain_ImgBuf;

	NewEkrTerrainfx(&OpEkrTerrainDesc);
	EkrTerrainfx_SetPosition(&OpEkrTerrainDesc, 0xD0, 0x68, 0x130, 0x68);
	SetOnHBlankA(HBlank_ClassDemoMain);
}

void ClassDemoMain_Loop_Intro(struct ProcClassDemoMain *proc)
{
	proc->anim_x = proc->anim_x - 1 - (0x50 - proc->x) / 14;

	if (proc->anim_x < 180)
		proc->anim_x = 180;

	SetDispEnable(1, 1, 1, 1, 1);
	SetWinEnable(1, 0, 0);
	SetWin0Box(0, 80 - proc->x, 240, proc->x + 80);
	SetWin0Layers(1, 1, 1, 1, 1);
	SetWOutLayers(0, 0, 0, 0, 0);

	if (proc->x == 80) {
		proc->anim_x = 180;
		proc->x = 0;
		Proc_Break(proc);
		func_fe6_08095D48(proc->procfx);
	} else
		proc->x += 4;

	EkrMainMini_SetAnimPosition(&OpEkrMiniDesc, proc->anim_x, 88);
	EkrTerrainfx_SetPosition(&OpEkrTerrainDesc, proc->anim_x - 48, 104, proc->anim_x + 48, 104);
	SetOpClassDemoStatusPos(proc->procfx, 0x78);
}

void ClassDemoMain_Loop_Main(struct ProcClassDemoMain *proc)
{
	int ret = false;

	if (proc->unk_2C > 0x18F) {
		proc->opinfo->mode = OPINFO_STATE_2;
		goto goto_judge_ret;
	}

	proc->x++;
	proc->unk_2C++;

	if (gUnk_086905F8[proc->unk_2E].unk_01 == 0)
		goto goto_judge_ret;

	if (proc->x > gUnk_086905F8[proc->unk_2E].unk_01)
		goto goto_ret_0;

	if (gUnk_086905F8[proc->unk_2E].unk_01 != 0xFF)
		goto goto_judge_ret;

	if (proc->unk_3E != 0)
		if (EkrMainMini_CheckBlocking(&OpEkrMiniDesc) != false)
			goto goto_ret_0;

	if (proc->unk_3E == 0)
		if (EkrMainMini_CheckDone(&OpEkrMiniDesc) != false)
			ret = 1;

goto_judge_ret:

	if (ret == 0)
		return;

goto_ret_0:

	proc->unk_2E++;

	if (gUnk_086905F8[proc->unk_2E].unk_01 == 0)
		return;

	if (gUnk_086905F8[proc->unk_2E].unk_00 == 0xFF) {
		EkrMainMini_EndBlock(&OpEkrMiniDesc);
		proc->unk_3E = 0;
	} else if (proc->unk_30 != gUnk_086905F8[proc->unk_2E].unk_00) {
		OpEkrMiniDesc.round_type = gUnk_086905F8[proc->unk_2E].unk_00;
		EkrMainMini_UpdateAnim(&OpEkrMiniDesc);

		if (gUnk_086905F8[proc->unk_2E].unk_00 == 4)
			EkrMainMini_EndBlock(&OpEkrMiniDesc);

		proc->unk_3E = 1;
	}

	proc->unk_30 = gUnk_086905F8[proc->unk_2E].unk_00;
	proc->x = 0;
}

void ClassDemoMain_Block(struct ProcClassDemoMain *proc) {}

void ClassDemoMain_OnEnd(struct ProcClassDemoMain *proc)
{
	SetOnHBlankA(NULL);
	EndTalk();
	EndActiveClassReelBgColorProc();
	EndEkrTerrainfx(&OpEkrTerrainDesc);
	EndActiveClassReelSpell();
	EndEkrMainMini(&OpEkrMiniDesc);

	if (proc->procfx)
		Proc_Goto(proc->procfx, 4);

	proc->opinfo->anim_proc = NULL;
}

ProcPtr StartClassAnimDisplay(struct ProcOpInfo *parent, u8 index)
{
	struct ProcClassDemoMain *proc;

	proc = SpawnProc(ProcScr_ClassDemoMain, parent);
	proc->index = index;
	proc->opinfo = parent;
	proc->procfx = NULL;

	return proc;
}

#if NONMATCHING
void ClassDemoStatus_Init(struct ProcClassDemoStatus *proc)
{
	int i;
	struct ProcClassDemoMain *parent = proc->gauge;

	proc->timer = 0;
	proc->unk_42 = 0;
	proc->unk_43 = 250;

	for (i = 0; i < 14; i++) {
		char ch;
		int j;
		const struct ClassDisplayFont *font;

		unk_opinfo_0200FF54[i].x = 0;
		unk_opinfo_0200FF54[i].y = 0;

		ch = gClassDemoNames[parent->index][i];
		if (ch == '\0') {
			proc->ch_pos[i] = 0xFF;
			break;
		}

		for (j = 0, font = gClassDisplayFont1; ; j++) {
			if (font->sprite && font->ch == ch) {
				proc->ch_pos[i] = j;
				proc->unk_42 += font->width - font->x_start;
			}
		}
	}

	Decompress(Img_ClassDemoStatus_Fonts, OBJ_VRAM0);
	ApplyPalettes(Pal_ClassDemoStatus_Fonts, 0x14, 2);
}
#else
NAKEDFUNC
void ClassDemoStatus_Init(struct ProcClassDemoStatus *proc)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, sl\n\
	mov r6, sb\n\
	mov r5, r8\n\
	push {r5, r6, r7}\n\
	mov ip, r0				@ ip = proc\n\
	ldr r0, [r0, #0x14]\n\
	mov r1, ip\n\
	str r0, [r1, #0x30]		@ r1+30 = parent\n\
	movs r1, #0\n\
	movs r0, #0\n\
	mov r2, ip\n\
	strh r0, [r2, #0x2a]\n\
	adds r2, #0x42\n\
	strb r1, [r2]\n\
	mov r1, ip\n\
	adds r1, #0x43\n\
	movs r0, #0xfa\n\
	strb r0, [r1]\n\
	movs r4, #0\n\
	ldr r0, .L08095B48 @ =gClassDemoNames\n\
	mov sb, r0\n\
	movs r1, #0x34\n\
	add r1, ip\n\
	mov r8, r1\n\
	adds r7, r2, #0\n\
	mov sl, sb\n\
.L08095B16:\n\
	lsls r0, r4, #2\n\
	ldr r2, .L08095B4C @ =unk_opinfo_0200FF54\n\
	adds r0, r0, r2\n\
	movs r1, #0\n\
	strb r1, [r0]\n\
	strb r1, [r0, #1]\n\
	mov r1, ip\n\
	ldr r0, [r1, #0x30]\n\
	adds r0, #0x31\n\
	ldrb r0, [r0]\n\
	lsls r3, r0, #2\n\
	mov r2, sb\n\
	adds r0, r3, r2\n\
	ldr r0, [r0]\n\
	adds r0, r0, r4\n\
	ldrb r0, [r0]\n\
	lsls r0, r0, #0x18\n\
	asrs r0, r0, #0x18\n\
	cmp r0, #0\n\
	bne .L08095B64\n\
	mov r0, r8\n\
	adds r1, r0, r4\n\
	movs r0, #0xff\n\
	strb r0, [r1]\n\
	b .L08095B98\n\
	.align 2, 0\n\
.L08095B48: .4byte gClassDemoNames\n\
.L08095B4C: .4byte unk_opinfo_0200FF54\n\
.L08095B50:\n\
	mov r1, r8\n\
	adds r0, r1, r4\n\
	strb r5, [r0]\n\
	ldrb r2, [r3, #6]\n\
	ldrb r1, [r3, #5]\n\
	subs r0, r2, r1\n\
	ldrb r2, [r7]\n\
	adds r0, r2, r0\n\
	strb r0, [r7]\n\
	b .L08095B92\n\
.L08095B64:\n\
	movs r5, #0\n\
	ldr r1, .L08095BBC @ =gClassDisplayFont1\n\
	ldr r0, [r1]\n\
	adds r6, r4, #1\n\
	cmp r0, #0\n\
	beq .L08095B92\n\
	mov r2, sl\n\
	adds r0, r3, r2\n\
	ldr r0, [r0]\n\
	adds r0, r0, r4\n\
	movs r2, #0\n\
	ldrsb r2, [r0, r2]\n\
	adds r3, r1, #0\n\
.L08095B7E:\n\
	movs r0, #4\n\
	ldrsb r0, [r3, r0]\n\
	cmp r0, r2\n\
	beq .L08095B50\n\
	adds r1, #8\n\
	adds r3, #8\n\
	adds r5, #1\n\
	ldr r0, [r1]\n\
	cmp r0, #0\n\
	bne .L08095B7E\n\
.L08095B92:\n\
	adds r4, r6, #0\n\
	cmp r4, #0xd\n\
	ble .L08095B16\n\
.L08095B98:\n\
	ldr r1, .L08095BC0 @ =0x06010000\n\
	ldr r0, .L08095BC4 @ =Img_ClassDemoStatus_Fonts\n\
	bl Decompress\n\
	ldr r0, .L08095BC8 @ =Pal_ClassDemoStatus_Fonts\n\
	movs r1, #0xa0\n\
	lsls r1, r1, #2\n\
	movs r2, #0x40\n\
	bl ApplyPaletteExt\n\
	pop {r3, r4, r5}\n\
	mov r8, r3\n\
	mov sb, r4\n\
	mov sl, r5\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L08095BBC: .4byte gClassDisplayFont1\n\
.L08095BC0: .4byte 0x06010000\n\
.L08095BC4: .4byte Img_ClassDemoStatus_Fonts\n\
.L08095BC8: .4byte Pal_ClassDemoStatus_Fonts\n\
	.syntax divided\n\
");
}
#endif

const char Str_OpInfo_Mag[] = TEXT("魔力", "Res");
const u8 gUnk_0835C829[0xC] = { 2, 2, 3, 3, 3, 3, 2, 2, 2, 3, 3, 4 };

u16 CONST_DATA Sprite_ClassDemoFont_0[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xD6) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_1[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xD7) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_2[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xD8) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_3[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x10D) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_4[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xD9) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_5[] = {
	2,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x106) + OAM2_LAYER(3),
	OAM0_SHAPE_8x8 + OAM0_Y(16), OAM1_SIZE_8x8, OAM2_CHR(0x146) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_6[] = {
	2,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x107) + OAM2_LAYER(3),
	OAM0_SHAPE_16x8 + OAM0_Y(16), OAM1_SIZE_16x8, OAM2_CHR(0x147) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_7[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xDA) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_8[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xDB) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_9[] = {
	2,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x109) + OAM2_LAYER(3),
	OAM0_SHAPE_8x8 + OAM0_Y(16), OAM1_SIZE_8x8, OAM2_CHR(0x149) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_10[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xDC) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_11[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xDD) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_12[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x10F) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_13[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xDE) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_14[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0xDF) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_15[] = {
	2,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x10A) + OAM2_LAYER(3),
	OAM0_SHAPE_16x8 + OAM0_Y(16), OAM1_SIZE_16x8, OAM2_CHR(0x14A) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_16[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x111) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_17[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x112) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_18[] = {
	1,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x113) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_19[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x114) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_20[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x116) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_21[] = {
	2,
	OAM0_SHAPE_8x16, OAM1_SIZE_8x16, OAM2_CHR(0x10C) + OAM2_LAYER(3),
	OAM0_SHAPE_8x8 + OAM0_Y(16), OAM1_SIZE_8x8, OAM2_CHR(0x14C) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_22[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x90) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_23[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x92) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_24[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x94) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_25[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x96) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_26[] = {
	2,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x100) + OAM2_LAYER(3),
	OAM0_SHAPE_16x8 + OAM0_Y(16), OAM1_SIZE_16x8, OAM2_CHR(0x140) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_27[] = {
	2,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x102) + OAM2_LAYER(3),
	OAM0_SHAPE_16x8 + OAM0_Y(16), OAM1_SIZE_16x8, OAM2_CHR(0x142) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_28[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x118) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_29[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x98) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_30[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x9A) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_31[] = {
	2,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x104) + OAM2_LAYER(3),
	OAM0_SHAPE_16x8 + OAM0_Y(16), OAM1_SIZE_16x8, OAM2_CHR(0x144) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_32[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x9C) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_33[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0x9E) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_34[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0xD0) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_35[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0xD2) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_ClassDemoFont_36[] = {
	1,
	OAM0_SHAPE_16x16, OAM1_SIZE_16x16, OAM2_CHR(0xD4) + OAM2_LAYER(3),
};

CONST_DATA struct ClassDisplayFont gClassDisplayFont1[] = {
	{ Sprite_ClassDemoFont_0,  'a', 0, 8,  0 },
	{ Sprite_ClassDemoFont_1,  'b', 0, 8,  0 },
	{ Sprite_ClassDemoFont_2,  'c', 0, 7,  0 },
	{ Sprite_ClassDemoFont_3,  'd', 0, 8,  0 },
	{ Sprite_ClassDemoFont_4,  'e', 0, 7,  0 },
	{ Sprite_ClassDemoFont_5,  'f', 1, 7,  0 },
	{ Sprite_ClassDemoFont_6,  'g', 1, 10, 0 },
	{ Sprite_ClassDemoFont_7,  'h', 0, 8,  0 },
	{ Sprite_ClassDemoFont_8,  'i', 0, 7,  0 },
	{ Sprite_ClassDemoFont_9,  'j', 1, 8,  0 },
	{ Sprite_ClassDemoFont_10, 'k', 0, 8, 0  },
	{ Sprite_ClassDemoFont_11, 'l', 0, 6, 0  },
	{ Sprite_ClassDemoFont_12, 'm', 0, 14, 0 },
	{ Sprite_ClassDemoFont_13, 'n', 0, 8, 0  },
	{ Sprite_ClassDemoFont_14, 'o', 0, 8, 0  },
	{ Sprite_ClassDemoFont_15, 'p', 2, 12, 0 },
	{ Sprite_ClassDemoFont_16, 'r', 0, 6, 0  },
	{ Sprite_ClassDemoFont_17, 's', 0, 6, 0  },
	{ Sprite_ClassDemoFont_18, 't', 0, 7, 0  },
	{ Sprite_ClassDemoFont_19, 'u', 0, 9, 0  },
	{ Sprite_ClassDemoFont_20, 'w', 0, 12, 0 },
	{ Sprite_ClassDemoFont_21, 'y', 0, 8, 0  },
	{ Sprite_ClassDemoFont_22, 'A', 1, 15, 0 },
	{ Sprite_ClassDemoFont_23, 'B', 1, 14, 0 },
	{ Sprite_ClassDemoFont_24, 'D', 1, 15, 0 },
	{ Sprite_ClassDemoFont_25, 'F', 1, 15, 0 },
	{ Sprite_ClassDemoFont_26, 'G', 1, 13, 0 },
	{ Sprite_ClassDemoFont_27, 'H', 0, 15, 6 },
	{ Sprite_ClassDemoFont_28, 'K', 1, 15, 0 },
	{ Sprite_ClassDemoFont_29, 'L', 0, 12, 0 },
	{ Sprite_ClassDemoFont_30, 'M', 0, 15, 0 },
	{ Sprite_ClassDemoFont_31, 'N', 0, 14, 6 },
	{ Sprite_ClassDemoFont_32, 'P', 2, 12, 0 },
	{ Sprite_ClassDemoFont_33, 'S', 2, 12, 0 },
	{ Sprite_ClassDemoFont_34, 'T', 1, 14, 0 },
	{ Sprite_ClassDemoFont_35, 'V', 1, 15, 0 },
	{ Sprite_ClassDemoFont_36, 'W', 0, 16, 0 },
	{ NULL, 0, 0, 0, 0 },
};

const char * CONST_DATA gClassDemoNames[] = {
	"Lord",
	"Socialknight",
	"Paladin",
	"Archer",
	"Armorknight",
	"Priest",
	"Thief",
	"Mercenary",
	"Fighter",
	"Torubadour",
	"Myrmidon",
	"Mage",
	"Nomad",
	"Bandit",
	"Pirate",
	"Shaman",
	"Bard",
	"Dancer",
	"Pegasusknight",
	"Dragonknight",
	"Warrior",
	"Druid",
	"Valkyuria",
	"Hero",
	"Falconknight",
	"Berserker",
	"Sage",
	"Bishop",
	"Swordmaster",
	"Nomadictrooper",
	"Sniper",
	"General",
	"Dragonmaster",
	"Mamkute",
	"King"
};

u16 CONST_DATA Sprite_08690DD0[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690DD8[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x4) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690DE0[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x8) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690DE8[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0xC) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690DF0[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x10) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690DF8[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x14) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690E00[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x18) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690E08[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x1C) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690E10[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x80) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690E18[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x84) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690E20[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x88) + OAM2_LAYER(3),
};

u16 CONST_DATA Sprite_08690E28[] = {
	1,
	OAM0_SHAPE_32x32, OAM1_SIZE_32x32, OAM2_CHR(0x8C) + OAM2_LAYER(3),
};

CONST_DATA u16 * CONST_DATA Sprites_ClassDemo_Unused[] = {
	Sprite_08690DD0, Sprite_08690DD8, Sprite_08690DE0, Sprite_08690DE8,
	Sprite_08690DF0, Sprite_08690DF8, Sprite_08690E00, Sprite_08690E08,
	Sprite_08690E10, Sprite_08690E18, Sprite_08690E20, Sprite_08690E28,
};
