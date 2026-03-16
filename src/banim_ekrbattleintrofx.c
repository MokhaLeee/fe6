#include "prelude.h"
#include "proc.h"

#include "banim.h"

struct ProcScr CONST_DATA ProcScr_EkrBaseKaiten[] = {
	PROC_19,
	PROC_REPEAT(EkrBaseKaiten_Loop),
	PROC_END,
};

const u8 *CONST_DATA Imgs_EkrBaseKaiten1[] = {
	Img_EkrBaseKaiten2, NULL,
	Img_EkrBaseKaiten2, NULL,
	Img_EkrBaseKaiten1, NULL,
	Img_EkrBaseKaiten2, NULL
};

const u8 *CONST_DATA Imgs_EkrBaseKaiten2[] = {
	Img_EkrBaseKaiten3,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten5,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4,
	Img_EkrBaseKaiten4
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten1[] = {
	AnimScr_EkrBaseKaiten_085CEDF8, NULL,
	AnimScr_EkrBaseKaiten_085CEE18, NULL,
	AnimScr_EkrBaseKaiten_085CE168, NULL,
	AnimScr_EkrBaseKaiten_085CEE3C, NULL,
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten2[] = {
	AnimScr_EkrBaseKaiten_085CF6CC,
	AnimScr_EkrBaseKaiten_085D0530,
	AnimScr_EkrBaseKaiten_085D0530,
	AnimScr_EkrBaseKaiten_085D0530,
	AnimScr_EkrBaseKaiten_085D0D34,
	AnimScr_EkrBaseKaiten_085D0554,
	AnimScr_EkrBaseKaiten_085D0554,
	AnimScr_EkrBaseKaiten_085D0554
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten3[] = {
	AnimScr_EkrBaseKaiten_085CF6A8,
	AnimScr_EkrBaseKaiten_085D04E8,
	AnimScr_EkrBaseKaiten_085D04E8,
	AnimScr_EkrBaseKaiten_085D04E8,
	AnimScr_EkrBaseKaiten_085D0D10,
	AnimScr_EkrBaseKaiten_085D050C,
	AnimScr_EkrBaseKaiten_085D050C,
	AnimScr_EkrBaseKaiten_085D050C
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten4[] = {
	AnimScr_EkrBaseKaiten_085CEE60, NULL,
	AnimScr_EkrBaseKaiten_085CEE80, NULL,
	AnimScr_EkrBaseKaiten_085CE18C, NULL,
	AnimScr_EkrBaseKaiten_085CEEA4, NULL,
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten5[] = {
	AnimScr_EkrBaseKaiten_085CF714,
	AnimScr_EkrBaseKaiten_085D05C0,
	AnimScr_EkrBaseKaiten_085D05C0,
	AnimScr_EkrBaseKaiten_085D05C0,
	AnimScr_EkrBaseKaiten_085D0D7C,
	AnimScr_EkrBaseKaiten_085D05E4,
	AnimScr_EkrBaseKaiten_085D05E4,
	AnimScr_EkrBaseKaiten_085D05E4
};

CONST_DATA AnimScr *AnimScrs_EkrBaseKaiten6[] = {
	AnimScr_EkrBaseKaiten_085CF6F0,
	AnimScr_EkrBaseKaiten_085D0578,
	AnimScr_EkrBaseKaiten_085D0578,
	AnimScr_EkrBaseKaiten_085D0578,
	AnimScr_EkrBaseKaiten_085D0D58,
	AnimScr_EkrBaseKaiten_085D059C,
	AnimScr_EkrBaseKaiten_085D059C,
	AnimScr_EkrBaseKaiten_085D059C
};

const u16 EkrBaseKaiten_RefTable[12][8] = {
	{0xA0, 0xB8, 0xE0, 0xF0, 0x01, 0x30, 0x60, 0xFFFF},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
	{0xC0, 0xD8, 0xF0, 0x01, 0x10, 0x28, 0x40, 0xFFFF},
	{0x40, 0x28, 0x10, 0x01, 0xE8, 0xD0, 0xC0, 0xFFFF},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFFFF},
	{0x40, 0x40, 0x4C, 0x58, 0x64, 0x70, 0x80, 0xFFFF},
	{0x40, 0x30, 0x20, 0x10, 0xE8, 0xD0, 0xC0, 0xFFFF},
	{0xC0, 0xC8, 0xD0, 0xD8, 0xE0, 0xF0, 0xF8, 0xFFFF},
	{0xC8, 0xC0, 0xB8, 0xB0, 0xA0, 0x90, 0x80, 0xFFFF},
	{0xF0, 0xC0, 0x90, 0x60, 0x30, 0x00, 0xD0, 0xFFFF},
	{0x70, 0x40, 0x10, 0xE0, 0xB0, 0x80, 0x50, 0xFFFF}
};

const u16 *CONST_DATA EkrBaseKaiten_Table1[] = {
	EkrBaseKaiten_RefTable[1], NULL,
	EkrBaseKaiten_RefTable[2], NULL,
	EkrBaseKaiten_RefTable[0], NULL,
	EkrBaseKaiten_RefTable[3], NULL,
};

const u16 *CONST_DATA EkrBaseKaiten_Table2[] = {
	EkrBaseKaiten_RefTable[5],
	EkrBaseKaiten_RefTable[8],
	EkrBaseKaiten_RefTable[8],
	EkrBaseKaiten_RefTable[8],
	EkrBaseKaiten_RefTable[11],
	EkrBaseKaiten_RefTable[9],
	EkrBaseKaiten_RefTable[9],
	EkrBaseKaiten_RefTable[9]
};

const u16 *CONST_DATA EkrBaseKaiten_Table3[] = {
	EkrBaseKaiten_RefTable[4],
	EkrBaseKaiten_RefTable[6],
	EkrBaseKaiten_RefTable[6],
	EkrBaseKaiten_RefTable[6],
	EkrBaseKaiten_RefTable[10],
	EkrBaseKaiten_RefTable[7],
	EkrBaseKaiten_RefTable[7],
	EkrBaseKaiten_RefTable[7]
};
