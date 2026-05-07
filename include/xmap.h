#pragma once

#include "prelude.h"
#include "proc.h"

enum videoalloc_xmap {
    OBCHR_XMAP = 0x80,
	OBPAL_XMAP = 4,
};

enum proc_label_xmap {
	PL_XMAP_0,
	PL_XMAP_1,
	PL_XMAP_2,
	PL_XMAP_3
};

struct ProcXmap {
	PROC_HEADER;

	/* 29 */ u8 unk_29;
	/* 2A */ u8 unk_2A;
	/* 2B */ u8 unk_2B;
	/* 2C */ u8 unk_2C;
	/* 2D */ u8 unk_2D;
	/* 2E */ u8 unk_2E;

	STRUCT_PAD(0x2F, 0x38);

	i8 avaliable_trials[8];
};

extern EWRAM_DATA struct Text gXmapTexts[6];

void Xmap_Init(struct ProcXmap *proc);
// func_fe6_0808AEFC
// func_fe6_0808AF4C
void func_fe6_0808B028(struct ProcXmap *proc);
void func_fe6_0808B194(struct ProcXmap *proc);
void func_fe6_0808B2BC(struct ProcXmap *proc);
void func_fe6_0808B378(struct ProcXmap *proc);
void func_fe6_0808B3B8(struct ProcXmap *proc);
void func_fe6_0808B40C(struct ProcXmap *proc);
void func_fe6_0808B430(struct ProcXmap *proc);
void Xmap_End(struct ProcXmap *proc);
void Xmap_TextEnd(struct ProcXmap *proc);
// SaveMenu_ExecXmap
// func_fe6_0808B598
// func_fe6_0808B628
// func_fe6_0808B640
// func_fe6_0808B7A0
// func_fe6_0808B7B4
// func_fe6_0808B854
// func_fe6_0808B928
// PutSoundRoomCG

extern struct ProcScr CONST_DATA ProcScr_Xmap[];
extern struct ProcScr CONST_DATA ProcScr_0868A634[];
extern struct ProcScr CONST_DATA ProcScr_0868A644[];
