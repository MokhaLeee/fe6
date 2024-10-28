#include "prelude.h"
#include "proc.h"
#include "item.h"
#include "msg.h"
#include "icon.h"
#include "oam.h"
#include "hardware.h"
#include "banim.h"
#include "constants/songs.h"
#include "constants/msg.h"

bool CheckEkrPopupDone(void)
{
    if (gEkrPopupDone == true)
        return true;
    
    return false;
}

void EndEkrPopup(void)
{
    if (gpProcEkrPopup != NULL)
    {
        Proc_End(gpProcEkrPopup);
        gpProcEkrPopup = NULL;
    }
}

void EfxPlaySound5AVol100(void)
{
    EfxPlaySE(SONG_5A, 0x100);
}

void EfxPlaySound5CVol100(void)
{
    EfxPlaySE(SONG_5C, 0x100);
}

#if NONMATCHING
void MakeBattlePopupTileMap(u16 * tm, u16 width)
{
    u32 i;
    u16 * buf = gEkrTsaBuffer;

    tm[0x00] = buf[0x00] + 0x1100;
    tm[0x20] = buf[0x18] + 0x1100;
    tm[0x40] = buf[0x30] + 0x1100;
    tm[0x60] = buf[0x48] + 0x1100;

    for (i = 0; i < width; i++)
    {
        tm[0x01 + i] = buf[0x01 + i] + 0x1100;
        tm[0x21 + i] = buf[0x19 + i] + 0x1100;
        tm[0x41 + i] = buf[0x31 + i] + 0x1100;
        tm[0x61 + i] = buf[0x49 + i] + 0x1100;
    }

    tm[0x01 + i] = buf[0x17] + 0x1100;
    tm[0x21 + i] = buf[0x2F] + 0x1100;
    tm[0x41 + i] = buf[0x47] + 0x1100;
    tm[0x61 + i] = buf[0x5F] + 0x1100;
}
#else
NAKEDFUNC
void MakeBattlePopupTileMap(u16 * tm, u16 width)
{
asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, sl\n\
	mov r6, sb\n\
	mov r5, r8\n\
	push {r5, r6, r7}\n\
	sub sp, #4\n\
	mov ip, r0\n\
	lsls r1, r1, #0x10\n\
	lsrs r1, r1, #0x10\n\
	mov sb, r1\n\
	ldr r6, .L0805F278 @ =gEkrTsaBuffer\n\
	ldrh r1, [r6]\n\
	movs r2, #0x88\n\
	lsls r2, r2, #5\n\
	adds r0, r1, r2\n\
	mov r3, ip\n\
	strh r0, [r3]\n\
	mov r1, ip\n\
	adds r1, #0x40\n\
	ldrh r7, [r6, #0x30]\n\
	adds r0, r7, r2\n\
	strh r0, [r1]\n\
	adds r1, #0x40\n\
	adds r0, r6, #0\n\
	adds r0, #0x60\n\
	ldrh r0, [r0]\n\
	adds r0, r0, r2\n\
	strh r0, [r1]\n\
	adds r1, #0x40\n\
	adds r0, r6, #0\n\
	adds r0, #0x90\n\
	ldrh r0, [r0]\n\
	adds r0, r0, r2\n\
	strh r0, [r1]\n\
	movs r0, #0\n\
	mov r8, r0\n\
	cmp r8, sb\n\
	bhs .L0805F22C\n\
	adds r3, #0xc2\n\
	str r3, [sp]\n\
	mov r5, ip\n\
	adds r5, #0x82\n\
	adds r4, r6, #0\n\
	adds r4, #0x62\n\
	subs r3, #0x80\n\
	mov r2, ip\n\
	adds r2, #2\n\
	adds r1, r6, #2\n\
.L0805F1F8:\n\
	ldrh r7, [r1]\n\
	movs r0, #0x88\n\
	lsls r0, r0, #5\n\
	adds r7, r7, r0\n\
	strh r7, [r2]\n\
	ldrh r7, [r1, #0x30]\n\
	adds r7, r7, r0\n\
	strh r7, [r3]\n\
	ldrh r7, [r4]\n\
	adds r7, r7, r0\n\
	strh r7, [r5]\n\
	ldrh r7, [r4, #0x30]\n\
	adds r7, r7, r0\n\
	ldr r0, [sp]\n\
	strh r7, [r0]\n\
	adds r0, #2\n\
	str r0, [sp]\n\
	adds r5, #2\n\
	adds r4, #2\n\
	adds r3, #2\n\
	adds r2, #2\n\
	adds r1, #2\n\
	movs r7, #1\n\
	add r8, r7\n\
	cmp r8, sb\n\
	blo .L0805F1F8\n\
.L0805F22C:\n\
	mov r1, r8\n\
	lsls r0, r1, #1\n\
	mov r2, ip\n\
	adds r1, r0, r2\n\
	ldrh r3, [r6, #0x2e]\n\
	movs r7, #0x88\n\
	lsls r7, r7, #5\n\
	adds r0, r3, r7\n\
	strh r0, [r1, #2]\n\
	adds r2, r1, #0\n\
	adds r2, #0x42\n\
	adds r0, r6, #0\n\
	adds r0, #0x5e\n\
	ldrh r0, [r0]\n\
	adds r3, r7, #0\n\
	adds r0, r0, r3\n\
	strh r0, [r2]\n\
	adds r2, #0x40\n\
	adds r0, r6, #0\n\
	adds r0, #0x8e\n\
	ldrh r0, [r0]\n\
	adds r0, r0, r3\n\
	strh r0, [r2]\n\
	adds r1, #0xc2\n\
	adds r0, r6, #0\n\
	adds r0, #0xbe\n\
	ldrh r0, [r0]\n\
	adds r0, r0, r3\n\
	strh r0, [r1]\n\
	add sp, #4\n\
	pop {r3, r4, r5}\n\
	mov r8, r3\n\
	mov sb, r4\n\
	mov sl, r5\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
.L0805F278: .4byte gEkrTsaBuffer\n\
	.syntax divided\n\
");
}
#endif

void DrawBattlePopup(struct ProcEkrPopup * proc, int type, u32 priv)
{
    const char * str;
    int x1, x2, x3, x_cursor, x_bg1, width_box;
    struct Text * text;
    struct Anim * anim;

    LZ77UnCompVram(Img_EkrPopup, (void *)BG_VRAM + 0x2000);
    LZ77UnCompWram(Tsa_EkrPopup, (void *)gEkrTsaBuffer);
    InitTextFont(&gBanimFont, (void *)BG_VRAM + 0x20C0, 0x106, 1);
    SetTextDrawNoClear();
    CpuFastCopy(Pal_EkrPopup, gPal + BGPAL_OFFSET(1), 0x20);

    if (type == 0)
    {
        str = DecodeMsg(MSG_POPUP_WexpLvup1);
        x1 = GetStringTextLen(str);
        x2 = x1 + 0x10;

        str = DecodeMsg(MSG_POPUP_WexpLvup2);
        x3 = GetStringTextLen(str) + x2;
    }
    else
    {
        x1 = 0;
        str = GetItemName(priv);
        x2 = GetStringTextLen(str) + 0x10;

        str = DecodeMsg(MSG_POPUP_WeaponBroken);
        x3 = GetStringTextLen(str) + x2;
    }

    width_box = (x3 + 7) >> 3;

    MakeBattlePopupTileMap(gBg1Tm, width_box);

    text = gBanimText;
    InitText(text, width_box);

    x_cursor = (width_box * 8 - x3) >> 1;
    Text_SetCursor(text, x_cursor);

    LZ77UnCompVram(Img_EkrUnkPopup, (void *)BG_VRAM + 0x20C0);

    if (type == 0)
    {
        str = DecodeMsg(MSG_POPUP_WexpLvup1);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);

        Text_Skip(text, 0x10);

        str = DecodeMsg(MSG_POPUP_WexpLvup2);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }
    else
    {
        Text_Skip(text, 0x10);

        str = GetItemName(priv);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_GRAY);
        Text_DrawString(text, str);

        str = DecodeMsg(MSG_POPUP_WeaponBroken);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }

    x_bg1 = (0xF0 - (width_box + 2) * 8) / 2;
    SetBgOffset(BG_1, -x_bg1, -0x30);
    EnableBgSync(BG1_SYNC_BIT);
    InitIcons();

    if (type == 0)
    {
        ApplyIconPalette(1, 0x12);
        PutIconObjImg(GetItemKind(priv) + 0x70, 0x40);
    }
    else
    {
        ApplyIconPalette(0, 0x12);
        PutIconObjImg(GetItemIcon(priv), 0x40);
    }

    anim = BasCreate(AnimScr_EkrPopup, 0x96);
    proc->anim = anim;
    anim->oam2 = OAM2_PAL(0x2) + OAM2_LAYER(0x1) + OAM2_CHR(0x0800 / 0x20);;

    anim->xPosition = x_bg1 + ({ x_cursor + 0x8; }) + x1;
    anim->yPosition = 0x38;

    EnablePalSync();
    SetBlendNone();
}

struct ProcScr CONST_DATA ProcScr_EkrPopup[] =
{
    PROC_NAME_DEBUG("ekrPopup"),
    PROC_REPEAT(func_fe6_0805F57C),
    PROC_REPEAT(func_fe6_0805F598),
    PROC_REPEAT(func_fe6_0805F5C0),
    PROC_REPEAT(func_fe6_0805F5F8),
    PROC_REPEAT(func_fe6_0805F620),
    PROC_REPEAT(func_fe6_0805F658),
    PROC_REPEAT(func_fe6_0805F680),
    PROC_REPEAT(func_fe6_0805F6B8),
    PROC_REPEAT(func_fe6_0805F6E0),
    PROC_REPEAT(func_fe6_0805F71C),
    PROC_REPEAT(func_fe6_0805F74C),
    PROC_END,
};
