#include "prelude.h"
#include "hardware.h"
#include "util.h"
#include "banim.h"

CONST_DATA short PosArray_EfxApocalypseBGCtrl[0x140] = {
    0,   0,   0,
    1,   1,   1,
    2,   2,
    3,   3,   3,
    4,   4,
    5,   5,   5,
    6,   6,   6,
    7,   7,   7,
    8,   8,   8,
    9,   9,   9,
    10,  10,  10,
    11,  11,  11, 11,
    12,  12,  12, 12,
    13,  13,  13, 13, 13,
    14,  14,  14, 14, 14, 14,
    15,  15,  15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
    14,  14,  14, 14, 14, 14,
    13,  13,  13, 13, 13,
    12,  12,  12, 12,
    11,  11,  11, 11,
    10,  10,  10,
    9,   9,   9,
    8,   8,   8,
    7,   7,   7,
    6,   6,   6,
    5,   5,   5,
    4,   4,
    3,   3,   3,
    2,   2,
    1,   1,   1,
    0,   0,   0,
    -1,  -1,
    -2,  -2,  -2,
    -3,  -3,
    -4,  -4,  -4,
    -5,  -5,
    -6,  -6,  -6,
    -7,  -7,  -7,
    -8,  -8,  -8,
    -9,  -9,  -9,
    -10, -10, -10,
    -11, -11, -11,
    -12, -12, -12, -12,
    -13, -13, -13, -13,
    -14, -14, -14, -14, -14,
    -15, -15, -15, -15, -15, -15,
    -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16,
    -15, -15, -15, -15, -15, -15,
    -14, -14, -14, -14, -14,
    -13, -13, -13, -13,
    -12, -12, -12, -12,
    -11, -11, -11,
    -10, -10, -10,
    -9,  -9,  -9,
    -8,  -8,  -8,
    -7,  -7,  -7,
    -6,  -6,  -6,
    -5,  -5,
    -4,  -4,  -4,
    -3,  -3,
    -2,  -2,  -2,
    -1,  -1,
    0, 0, 0,
    1, 1, 1,
    2, 2,
    3, 3, 3,
    4, 4,
    5, 5, 5,
    6, 6, 6,
    7, 7, 7,
    8, 8, 8,
    9, 9, 9,
    10, 10, 10,
    11, 11, 11, 11,
    12, 12, 12, 12,
    13, 13, 13, 13, 13,
    14, 14, 14, 14, 14, 14,
    15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
};

void func_fe6_0805B01C(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 tileref, len;
    u16 * _tm = tm;

    for (i = height; i != 0; i--)
    {
        for (j = width; j != 0; j--)
        {
            tileref = *_tm;
            if (pal != -1) tileref = TILEREF(tileref & 0xFFF, pal);
            if (chr != -1) tileref += chr;

            *_tm = tileref;
            _tm++;
        }

        tileref = 0x20 - width;
        _tm += tileref;
    }
}

void FillBGRect(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 * _tm = tm;
    for (i = height; i != 0; i--)
    {
        u16 len = 0x20 - width;

        for (j = width; j != 0; j--)
            *(_tm++) = TILEREF(chr, pal);

        _tm += len;
    }
}

void func_fe6_0805B0D4(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 val;
    u16 * _tm = tm;

    for (i = height; i != 0; i--)
    {
        for (j = width; j != 0; j--)
        {
            val = *_tm;
            if (pal != -1) val = TILEREF(val, pal);
            if (chr != -1) val += chr;

            *_tm = val;
            _tm++;
        }

        val = 0x20 - width;
        _tm += val;
    }
}

CONST_DATA u16 gEfxTmyPalRefs[] = {
    0xB000, 0xC000, 0xD000, 0xE000, 0xF000,
    0xB000, 0xC000, 0xD000, 0xE000, 0xF000,
};

#if NONMATCHING
void EfxTmModifyPal(u16 * tm, u16 width, u16 height)
{
    int i, j;
    u16 tileref;
    u16 * _tm = tm;
    u32 _tileref;
    
    for (i = height; i != 0; i--)
    {
        u16 len = 0x20 - width;

        for (j = width; j != 0; j--)
        {
            tileref = _tileref = *_tm;
            tileref = (tileref & 0xFFF) + gEfxTmyPalRefs[(u16)(((_tileref >> 0xC) & 0xF) - 6)];
            *_tm = tileref;
            _tm++;
        }

        len = 0x20 - width;
        _tm += len;
    }
}
#else
NAKEDFUNC
void EfxTmModifyPal(u16 * tm, u16 width, u16 height)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sb\n\
    mov r6, r8\n\
    push {r6, r7}\n\
    lsls r1, r1, #0x10\n\
    lsrs r1, r1, #0x10\n\
    mov ip, r1\n\
    lsls r2, r2, #0x10\n\
    adds r3, r0, #0\n\
    lsrs r2, r2, #0x10\n\
    cmp r2, #0\n\
    beq .L0805B198\n\
    movs r0, #0x20\n\
    subs r0, r0, r1\n\
    lsls r0, r0, #0x10\n\
    mov r8, r0\n\
    ldr r0, .L0805B1A4 @ =gEfxTmyPalRefs\n\
    mov sb, r0\n\
.L0805B160:\n\
    mov r4, ip\n\
    subs r2, #1\n\
    cmp r4, #0\n\
    beq .L0805B18E\n\
    ldr r7, .L0805B1A8 @ =0x00000FFF\n\
    mov r6, sb\n\
    movs r5, #0xf\n\
.L0805B16E:\n\
    ldrh r0, [r3]\n\
    adds r1, r0, #0\n\
    lsrs r0, r0, #0xc\n\
    ands r0, r5\n\
    subs r0, #6\n\
    lsls r0, r0, #0x10\n\
    ands r1, r7\n\
    lsrs r0, r0, #0xf\n\
    adds r0, r0, r6\n\
    ldrh r0, [r0]\n\
    adds r1, r0, r1\n\
    strh r1, [r3]\n\
    adds r3, #2\n\
    subs r4, #1\n\
    cmp r4, #0\n\
    bne .L0805B16E\n\
.L0805B18E:\n\
    mov r1, r8\n\
    lsrs r0, r1, #0xf\n\
    adds r3, r3, r0\n\
    cmp r2, #0\n\
    bne .L0805B160\n\
.L0805B198:\n\
    pop {r3, r4}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
.L0805B1A4: .4byte gEfxTmyPalRefs\n\
.L0805B1A8: .4byte 0x00000FFF\n\
    .syntax divided\n\
");
}
#endif

void EfxTmCpyBG(const void * ptr1, void * ptr2, u16 width, u16 height, int pal, int chr)
{
    EfxTmCpyExt(ptr1, -1, ptr2, 32, width, height, pal, chr);
}

void EfxTmCpyBgHFlip(const u16 * tsa, u16 * tm, u16 width, u16 height, int pal, int chr)
{
    EfxTmCpyExtHFlip(tsa, -1, tm, 32, width, height, pal, chr);
}

void EfxTmCpyExt(const u16 * src, i16 src_width, u16 * dst, i16 dst_width, u16 width, u16 hight, int pal, int chr)
{
    int i, j;

    for (i = hight; i != 0; i--)
    {
        u16 len1 = 0;
        u16 len2 = 0;

        for (j = width; j != 0; j--)
        {
            u16 val = *src;
            if (pal != -1)
                val = val + (pal << 0xC);

            if (chr != -1)
                val = val + chr;

            *dst = val;

            src++;
            dst++;
        }

        if (src_width != -1)
        {
            len1 = src_width - width;
            src = src + len1;
        }

        if (dst_width != -1)
        {
            len2 = dst_width - width;
            dst = dst + len2;
        }
    }
}

void EfxTmCpyExtHFlip(const u16 * src, i16 src_width, u16 * dst, i16 dst_width, u16 width, u16 hight, int pal, int chr)
{
    int i, j;

    dst += width - 1;

    for (i = hight; i != 0; i--)
    {
        u16 len1 = 0;
        u16 len2 = 0;

        for (j = width; j != 0; j--)
        {
            u16 val = *src;
            if (pal != -1)
                val = val + (pal << 0xC);

            if (chr != -1)
                val = val + chr;

            *dst = val ^ TILE_HFLIP;

            src++;
            dst--;
        }

        if (src_width != -1)
        {
            len1 = src_width - width;
            src = src + len1;
        }

        if (dst_width != -1)
        {
            len2 = width + dst_width;
            dst = dst + len2;
        }
    }
}

void func_fe6_0805B380(u16 * tm, int arg1, int arg2)
{
    int r1, i, flag = 0;

    if (arg2 != 0)
    {
        for (i = 0; i <= 40; i = r1)
        {
            if (arg2 <= i)
            {
                if (flag == 0)
                {
                    flag = 1;
                    *tm++ = 0xE;
                }
                else
                    *tm++ = 0xFF;

                r1 = i + 4;
            }
            else if (arg2 == (i + 1))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0xD;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 1))
                        *tm++ = 0xC;
                }
            }
            else if (arg2 == (i + 2))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0xB;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm++ = 0xA;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 2))
                        *tm++ = 0x9;
                }
            }
            else if (arg2 == (i + 3))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0x8;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm++ = 0x7;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 2))
                {
                    *tm++ = 0x6;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 3))
                        *tm++ = 0x5;
                }
            }
            else if (r1 = i + 4, arg2 >= r1)
            {
                if (arg1 <= i)
                    *tm++ = 0x4;
                else if (arg1 == (i + 1))
                    *tm++ = 0x3;
                else if (arg1 == (i + 2))
                    *tm++ = 0x2;
                else if (arg1 == (i + 3))
                    *tm++ = 0x1;
                else if (arg1 >= r1)
                    *tm++ = 0x0;
            }
        }
    }
}

void EkrModifyBarfx(u16 * tm, int arg)
{
    int i;

    static const u16 conf1[] = {
        0, 1, 2, 3, 4, 5, 6,
    };

    static const u16 conf2[] = {
        8, 9, 10, 11, 12, 13, 14, 15, 16
    };

    static const u16 conf3[] = {
        18, 19, 20, 21, 22, 23
    };

    if (arg > 5)
        *tm = 6;
    else
        *tm = conf1[arg];

    tm = tm + 1;

    for (i = 0; i <= 0x57; i += 8)
    {
        if (arg >= i + 0xE)
            *tm = 0x10;
        else if (arg >= i + 0x6)
            *tm = conf2[arg - (i + 0x6)];
        else
            *tm = 0x7;

        tm = tm + 1;
    }

    if (arg > 0x62)
        *tm = 0x17;
    else if (arg > 0x5D)
        *tm = conf3[arg - 0x5E];
    else
        *tm = 0x11;
}

bool func_fe6_0805B4D8(u16 * pal_start, u16 * pal_end, u16 * dst, u16 amount, u16 start, u16 end)
{
    int i;
    for (i = 0; i < amount; i++)
    {
        int r1 = *pal_start & 0x001F;
        int g1 = *pal_start & 0x03E0;
        int b1 = *pal_start & 0x7C00;

        int r2 = *pal_end & 0x001F;
        int g2 = *pal_end & 0x03E0;
        int b2 = *pal_end & 0x7C00;

        u16 r = Interpolate(0, r1, r2, (i16)start, (i16)end);
        u16 g = Interpolate(0, g1, g2, (i16)start, (i16)end);
        u16 b = Interpolate(0, b1, b2, (i16)start, (i16)end);

        *dst = (b & 0x7C00) | (g & 0x03E0) | (r & 0x001F);

        pal_start++;
        pal_end++;
        dst++;
    }

    if (start == end)
        return true;

    return false;
}

#if NONMATCHING
void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref)
{
    int i, j, _ref = Div(ref * 0x20, 0x10);

    for (i = line; i < (line + length); i++)
    {
        u16 * pal = pal_buf + i * 0x10;
        for (j = 0; j < 0x10; j++)
        {
            int r = RGB_GET_RED(pal[j]);
            int g = RGB_GET_GREEN(pal[j]);
            int b = RGB_GET_BLUE(pal[j]);

            r = r - ((r * _ref) >> 5);
            g = g - ((g * _ref) >> 5);
            b = b - ((b * _ref) >> 5);

            pal[j] = RGB(r, g, b);
        }
    }
}
#else
NAKEDFUNC
void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sb\n\
    mov r6, r8\n\
    push {r6, r7}\n\
    mov sb, r0\n\
    adds r4, r1, #0\n\
    adds r5, r2, #0\n\
    lsls r0, r3, #5\n\
    movs r1, #0x10\n\
    bl Div\n\
    adds r6, r0, #0\n\
    adds r0, r4, r5\n\
    cmp r4, r0\n\
    bge .L0805B638\n\
    mov r8, r0\n\
    movs r0, #0x1f\n\
    mov ip, r0\n\
.L0805B5EC:\n\
    lsls r0, r4, #5\n\
    adds r7, r4, #1\n\
    mov r1, sb\n\
    adds r5, r1, r0\n\
    movs r4, #0xf\n\
.L0805B5F6:\n\
    ldrh r1, [r5]\n\
    movs r2, #0x1f\n\
    ands r2, r1\n\
    lsls r1, r1, #0x10\n\
    lsrs r3, r1, #0x15\n\
    mov r0, ip\n\
    ands r3, r0\n\
    lsrs r1, r1, #0x1a\n\
    ands r1, r0\n\
    adds r0, r2, #0\n\
    muls r0, r6, r0\n\
    asrs r0, r0, #5\n\
    subs r2, r2, r0\n\
    adds r0, r3, #0\n\
    muls r0, r6, r0\n\
    asrs r0, r0, #5\n\
    subs r3, r3, r0\n\
    adds r0, r1, #0\n\
    muls r0, r6, r0\n\
    asrs r0, r0, #5\n\
    subs r1, r1, r0\n\
    lsls r3, r3, #5\n\
    orrs r2, r3\n\
    lsls r1, r1, #0xa\n\
    orrs r2, r1\n\
    strh r2, [r5]\n\
    adds r5, #2\n\
    subs r4, #1\n\
    cmp r4, #0\n\
    bge .L0805B5F6\n\
    adds r4, r7, #0\n\
    cmp r4, r8\n\
    blt .L0805B5EC\n\
.L0805B638:\n\
    pop {r3, r4}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
");
}
#endif

#if NONMATCHING
void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref)
{
    int i, j, _ref = Div(ref * 0x20, 0x10);

    for (i = line; i < (line + length); i++)
    {
        u16 * pal = pal_buf + i * 0x10;
        for (j = 0; j < 0x10; j++)
        {
            int r = RGB_GET_RED(pal[j]);
            int g = RGB_GET_GREEN(pal[j]);
            int b = RGB_GET_BLUE(pal[j]);

            r = r + (((0x1F - r) * _ref) >> 5);
            g = g + (((0x1F - g) * _ref) >> 5);
            b = b + (((0x1F - b) * _ref) >> 5);

            pal[j] = RGB(r, g, b);
        }
    }
}
#else
NAKEDFUNC
void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref)
{
asm("\
    .syntax unified\n\
    push {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, sb\n\
    mov r5, r8\n\
    push {r5, r6, r7}\n\
    mov sl, r0\n\
    adds r4, r1, #0\n\
    adds r5, r2, #0\n\
    lsls r0, r3, #5\n\
    movs r1, #0x10\n\
    bl Div\n\
    adds r6, r0, #0\n\
    adds r0, r4, r5\n\
    cmp r4, r0\n\
    bge .L0805B6BA\n\
    mov sb, r0\n\
    movs r0, #0x1f\n\
    mov r8, r0\n\
    movs r7, #0x1f\n\
.L0805B66C:\n\
    lsls r0, r4, #5\n\
    adds r4, #1\n\
    mov ip, r4\n\
    mov r1, sl\n\
    adds r5, r1, r0\n\
    movs r4, #0xf\n\
.L0805B678:\n\
    ldrh r1, [r5]\n\
    adds r2, r7, #0\n\
    ands r2, r1\n\
    lsls r1, r1, #0x10\n\
    lsrs r3, r1, #0x15\n\
    mov r0, r8\n\
    ands r3, r0\n\
    lsrs r1, r1, #0x1a\n\
    ands r1, r0\n\
    subs r0, r7, r2\n\
    muls r0, r6, r0\n\
    asrs r0, r0, #5\n\
    adds r2, r2, r0\n\
    subs r0, r7, r3\n\
    muls r0, r6, r0\n\
    asrs r0, r0, #5\n\
    adds r3, r3, r0\n\
    subs r0, r7, r1\n\
    muls r0, r6, r0\n\
    asrs r0, r0, #5\n\
    adds r1, r1, r0\n\
    lsls r3, r3, #5\n\
    orrs r2, r3\n\
    lsls r1, r1, #0xa\n\
    orrs r2, r1\n\
    strh r2, [r5]\n\
    adds r5, #2\n\
    subs r4, #1\n\
    cmp r4, #0\n\
    bge .L0805B678\n\
    mov r4, ip\n\
    cmp r4, sb\n\
    blt .L0805B66C\n\
.L0805B6BA:\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov sb, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n\
");
}
#endif
