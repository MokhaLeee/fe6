#pragma once

#include "prelude.h"

struct ChapterTitleFxSt {
	u16 chr_bg;
	u16 chr_text;
};

extern struct ChapterTitleFxSt EWRAM_DATA gChapterTitleFxSt;

#define CHAPTER_TITLE(x) (x)

enum chapter_title_indx {

	CHAPTER_TITLE_MAX = 41
};

extern u16 const *CONST_DATA gChapterTitleData[];
