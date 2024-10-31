#include "prelude.h"
#include "support.h"
#include "constants/pids.h"

struct SupportInfo CONST_DATA SupportInfo_Roy = {
    .pids = {
        PID_LILINA,
        PID_MARCUS,
        PID_WOLT,
        PID_CECILIA,
        PID_SOPHIA,
        PID_SUE,
        PID_SHANNA,
        PID_LARUM,
        PID_ALEN,
        PID_LANCE,
    },
    .exp_base = {
        56,
        30,
        30,
        20,
        1,
        1,
        1,
        1,
        20,
        20,
    },
    .exp_growth = {
        4,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        2,
        2,
    },
    .count = 10,
};

struct SupportInfo CONST_DATA SupportInfo_Clarine = {
    .pids = {
        PID_KLEIN,
        PID_RUTGER,
        PID_DIECK,
        PID_LANCE,
        PID_DOROTHY,
    },
    .exp_base = {
        40,
        10,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Fae = {
    .pids = {
        PID_SOPHIA,
        PID_IGRENE,
        PID_SUE,
        PID_NIIME,
        PID_ELFFIN,
    },
    .exp_base = {
        30,
        30,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        3,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Sin = {
    .pids = {
        PID_DAYAN,
        PID_SUE,
        PID_FIR,
        PID_DOROTHY,
        PID_ZEISS,
    },
    .exp_base = {
        40,
        30,
        1,
        1,
        1,
    },
    .exp_growth = {
        2,
        2,
        2,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Sue = {
    .pids = {
        PID_DAYAN,
        PID_SIN,
        PID_FAE,
        PID_WOLT,
        PID_ROY,
    },
    .exp_base = {
        40,
        30,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Dayan = {
    .pids = {
        PID_SIN,
        PID_SUE,
        PID_YODER,
        PID_GONZALEZ,
        PID_RUTGER,
    },
    .exp_base = {
        40,
        40,
        1,
        1,
        1,
    },
    .exp_growth = {
        2,
        3,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Barthe = {
    .pids = {
        PID_LILINA,
        PID_OGIER,
        PID_BORS,
        PID_GWENDOLYN,
        PID_ASTOLFO,
    },
    .exp_base = {
        30,
        10,
        20,
        20,
        10,
    },
    .exp_growth = {
        2,
        2,
        2,
        2,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Bors = {
    .pids = {
        PID_LILINA,
        PID_BARTHE,
        PID_GWENDOLYN,
        PID_ASTOLFO,
        PID_OGIER,
    },
    .exp_base = {
        30,
        20,
        35,
        1,
        1,
    },
    .exp_growth = {
        2,
        2,
        3,
        2,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Gwendolyn = {
    .pids = {
        PID_LILINA,
        PID_BORS,
        PID_BARTHE,
        PID_OGIER,
        PID_ASTOLFO,
    },
    .exp_base = {
        30,
        35,
        20,
        10,
        1,
    },
    .exp_growth = {
        2,
        3,
        2,
        2,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Douglas = {
    .pids = {
        PID_ELFFIN,
        PID_GEESE,
        PID_IGRENE,
        PID_PERCEVAL,
        PID_CECILIA,
        PID_LARUM,
    },
    .exp_base = {
        30,
        1,
        1,
        30,
        30,
        30,
    },
    .exp_growth = {
        2,
        1,
        1,
        2,
        2,
        3,
    },
    .count = 6,
};

struct SupportInfo CONST_DATA SupportInfo_Wolt = {
    .pids = {
        PID_ROY,
        PID_MARCUS,
        PID_ALEN,
        PID_LANCE,
        PID_SUE,
    },
    .exp_base = {
        30,
        20,
        20,
        20,
        1,
    },
    .exp_growth = {
        2,
        2,
        2,
        2,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Dorothy = {
    .pids = {
        PID_SAUL,
        PID_PERCEVAL,
        PID_YODER,
        PID_SIN,
        PID_CLARINE,
    },
    .exp_base = {
        20,
        1,
        40,
        1,
        1,
    },
    .exp_growth = {
        2,
        1,
        2,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Klein = {
    .pids = {
        PID_CLARINE,
        PID_PERCEVAL,
        PID_DIECK,
        PID_ELFFIN,
        PID_THEA,
    },
    .exp_base = {
        40,
        20,
        40,
        10,
        30,
    },
    .exp_growth = {
        3,
        2,
        1,
        2,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Saul = {
    .pids = {
        PID_DOROTHY,
        PID_YODER,
        PID_CECILIA,
        PID_IGRENE,
        PID_ELEN,
    },
    .exp_base = {
        20,
        40,
        1,
        1,
        1,
    },
    .exp_growth = {
        2,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Elen = {
    .pids = {
        PID_MELADY,
        PID_ZEISS,
        PID_SAUL,
        PID_LUGH,
        PID_CHAD,
    },
    .exp_base = {
        20,
        10,
        1,
        30,
        1,
    },
    .exp_growth = {
        2,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Yoder = {
    .pids = {
        PID_NIIME,
        PID_SAUL,
        PID_DOROTHY,
        PID_DAYAN,
        PID_MELADY,
    },
    .exp_base = {
        40,
        40,
        40,
        1,
        1,
    },
    .exp_growth = {
        1,
        2,
        2,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Chad = {
    .pids = {
        PID_LUGH,
        PID_RAIGH,
        PID_CATH,
        PID_ELEN,
        PID_HUGH,
    },
    .exp_base = {
        30,
        1,
        1,
        1,
        1,
    },
    .exp_growth = {
        2,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Karel = {
    .pids = {
        PID_FIR,
        PID_BARTRE,
        PID_RUTGER,
        PID_ZEISS,
        PID_NOAH,
    },
    .exp_base = {
        30,
        20,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Fir = {
    .pids = {
        PID_BARTRE,
        PID_NOAH,
        PID_KAREL,
        PID_RUTGER,
        PID_SIN,
    },
    .exp_base = {
        40,
        10,
        30,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        3,
        1,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Rutger = {
    .pids = {
        PID_CLARINE,
        PID_DAYAN,
        PID_DIECK,
        PID_KAREL,
        PID_FIR,
    },
    .exp_base = {
        10,
        1,
        10,
        1,
        1,
    },
    .exp_growth = {
        2,
        1,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Dieck = {
    .pids = {
        PID_WARD,
        PID_LOT,
        PID_SHANNA,
        PID_CLARINE,
        PID_KLEIN,
        PID_RUTGER,
    },
    .exp_base = {
        10,
        10,
        10,
        1,
        40,
        10,
    },
    .exp_growth = {
        2,
        2,
        2,
        1,
        1,
        1,
    },
    .count = 6,
};

struct SupportInfo CONST_DATA SupportInfo_Ogier = {
    .pids = {
        PID_LILINA,
        PID_BARTHE,
        PID_LARUM,
        PID_GWENDOLYN,
        PID_BORS,
    },
    .exp_base = {
        10,
        10,
        1,
        10,
        1,
    },
    .exp_growth = {
        2,
        2,
        1,
        2,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Garret = {
    .pids = {
        PID_LILINA,
        PID_GEESE,
        PID_LARUM,
        PID_CATH,
        PID_GONZALEZ,
    },
    .exp_base = {
        10,
        1,
        1,
        1,
        20,
    },
    .exp_growth = {
        2,
        1,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Alen = {
    .pids = {
        PID_THEA,
        PID_MARCUS,
        PID_WOLT,
        PID_LANCE,
        PID_WARD,
        PID_ROY,
    },
    .exp_base = {
        1,
        20,
        20,
        30,
        1,
        20,
    },
    .exp_growth = {
        1,
        2,
        2,
        2,
        1,
        2,
    },
    .count = 6,
};

struct SupportInfo CONST_DATA SupportInfo_Lance = {
    .pids = {
        PID_MARCUS,
        PID_WOLT,
        PID_ALEN,
        PID_LOT,
        PID_ROY,
        PID_CLARINE,
    },
    .exp_base = {
        20,
        20,
        30,
        1,
        20,
        1,
    },
    .exp_growth = {
        2,
        2,
        2,
        1,
        2,
        1,
    },
    .count = 6,
};

struct SupportInfo CONST_DATA SupportInfo_Perceval = {
    .pids = {
        PID_KLEIN,
        PID_CECILIA,
        PID_DOROTHY,
        PID_ELFFIN,
        PID_DOUGLAS,
        PID_LARUM,
    },
    .exp_base = {
        20,
        30,
        1,
        20,
        30,
        1,
    },
    .exp_growth = {
        2,
        2,
        1,
        2,
        2,
        2,
    },
    .count = 6,
};

struct SupportInfo CONST_DATA SupportInfo_Igrene = {
    .pids = {
        PID_FAE,
        PID_SOPHIA,
        PID_SAUL,
        PID_ASTOLFO,
        PID_DOUGLAS,
    },
    .exp_base = {
        30,
        30,
        1,
        10,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Marcus = {
    .pids = {
        PID_ROY,
        PID_ALEN,
        PID_LANCE,
        PID_WOLT,
        PID_LILINA,
    },
    .exp_base = {
        30,
        20,
        20,
        20,
        1,
    },
    .exp_growth = {
        2,
        2,
        2,
        2,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Astolfo = {
    .pids = {
        PID_LILINA,
        PID_BORS,
        PID_BARTHE,
        PID_GWENDOLYN,
        PID_IGRENE,
    },
    .exp_base = {
        30,
        1,
        10,
        1,
        10,
    },
    .exp_growth = {
        2,
        2,
        2,
        2,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Ward = {
    .pids = {
        PID_DIECK,
        PID_SHANNA,
        PID_LOT,
        PID_ECHIDNA,
        PID_ALEN,
    },
    .exp_base = {
        10,
        10,
        40,
        1,
        1,
    },
    .exp_growth = {
        2,
        2,
        2,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Lot = {
    .pids = {
        PID_DIECK,
        PID_SHANNA,
        PID_WARD,
        PID_ECHIDNA,
        PID_LANCE,
    },
    .exp_base = {
        10,
        10,
        40,
        1,
        1,
    },
    .exp_growth = {
        2,
        2,
        2,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Bartre = {
    .pids = {
        PID_FIR,
        PID_KAREL,
        PID_GONZALEZ,
        PID_ZEISS,
        PID_CATH,
    },
    .exp_base = {
        40,
        20,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Lugh = {
    .pids = {
        PID_RAIGH,
        PID_CHAD,
        PID_ELEN,
        PID_HUGH,
        PID_MELADY,
    },
    .exp_base = {
        20,
        30,
        30,
        5,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Lilina = {
    .pids = {
        PID_ROY,
        PID_BORS,
        PID_BARTHE,
        PID_OGIER,
        PID_GONZALEZ,
        PID_MARCUS,
        PID_GWENDOLYN,
        PID_GARRET,
        PID_ASTOLFO,
        PID_CECILIA,
    },
    .exp_base = {
        56,
        30,
        30,
        10,
        30,
        1,
        30,
        10,
        30,
        50,
    },
    .exp_growth = {
        4,
        2,
        2,
        2,
        2,
        1,
        2,
        2,
        2,
        1,
    },
    .count = 10,
};

struct SupportInfo CONST_DATA SupportInfo_Hugh = {
    .pids = {
        PID_NIIME,
        PID_RAIGH,
        PID_CATH,
        PID_CHAD,
        PID_LUGH,
    },
    .exp_base = {
        40,
        5,
        1,
        1,
        5,
    },
    .exp_growth = {
        1,
        1,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Niime = {
    .pids = {
        PID_HUGH,
        PID_YODER,
        PID_RAIGH,
        PID_SOPHIA,
        PID_FAE,
    },
    .exp_base = {
        40,
        40,
        1,
        1,
        1,
    },
    .exp_growth = {
        1,
        1,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Raigh = {
    .pids = {
        PID_LUGH,
        PID_CHAD,
        PID_HUGH,
        PID_NIIME,
        PID_SOPHIA,
    },
    .exp_base = {
        20,
        1,
        5,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Larum = {
    .pids = {
        PID_ECHIDNA,
        PID_GARRET,
        PID_OGIER,
        PID_GEESE,
        PID_ROY,
        PID_DOUGLAS,
        PID_PERCEVAL,
    },
    .exp_base = {
        20,
        1,
        1,
        1,
        1,
        30,
        1,
    },
    .exp_growth = {
        2,
        1,
        1,
        1,
        1,
        3,
        2,
    },
    .count = 7,
};

struct SupportInfo CONST_DATA SupportInfo_Juno = {
    .pids = {
        PID_THEA,
        PID_SHANNA,
        PID_ZELOT,
        PID_TREC,
        PID_NOAH,
    },
    .exp_base = {
        30,
        30,
        40,
        20,
        20,
    },
    .exp_growth = {
        3,
        3,
        3,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Thea = {
    .pids = {
        PID_JUNO,
        PID_SHANNA,
        PID_ALEN,
        PID_ZELOT,
        PID_KLEIN,
    },
    .exp_base = {
        30,
        30,
        1,
        30,
        30,
    },
    .exp_growth = {
        3,
        3,
        1,
        1,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Shanna = {
    .pids = {
        PID_DIECK,
        PID_WARD,
        PID_LOT,
        PID_JUNO,
        PID_THEA,
        PID_ROY,
        PID_ZELOT,
    },
    .exp_base = {
        10,
        10,
        10,
        30,
        30,
        1,
        30,
    },
    .exp_growth = {
        2,
        2,
        2,
        3,
        3,
        1,
        1,
    },
    .count = 7,
};

struct SupportInfo CONST_DATA SupportInfo_Zeiss = {
    .pids = {
        PID_MELADY,
        PID_ELEN,
        PID_KAREL,
        PID_BARTRE,
        PID_SIN,
    },
    .exp_base = {
        20,
        10,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Elffin = {
    .pids = {
        PID_PERCEVAL,
        PID_FAE,
        PID_DOUGLAS,
        PID_KLEIN,
        PID_CECILIA,
    },
    .exp_base = {
        20,
        1,
        30,
        10,
        20,
    },
    .exp_growth = {
        2,
        1,
        2,
        2,
        2,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Cath = {
    .pids = {
        PID_GEESE,
        PID_CHAD,
        PID_GARRET,
        PID_HUGH,
        PID_BARTRE,
    },
    .exp_base = {
        20,
        1,
        1,
        1,
        1,
    },
    .exp_growth = {
        1,
        1,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Sophia = {
    .pids = {
        PID_FAE,
        PID_IGRENE,
        PID_RAIGH,
        PID_ROY,
        PID_NIIME,
    },
    .exp_base = {
        30,
        30,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Melady = {
    .pids = {
        PID_ZEISS,
        PID_ELEN,
        PID_LUGH,
        PID_YODER,
        PID_TREC,
    },
    .exp_base = {
        20,
        20,
        1,
        1,
        1,
    },
    .exp_growth = {
        3,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Gonzalez = {
    .pids = {
        PID_LILINA,
        PID_ECHIDNA,
        PID_DAYAN,
        PID_TREC,
        PID_GARRET,
        PID_BARTRE,
    },
    .exp_base = {
        30,
        1,
        1,
        1,
        20,
        1,
    },
    .exp_growth = {
        2,
        1,
        1,
        1,
        1,
        1,
    },
    .count = 6,
};

struct SupportInfo CONST_DATA SupportInfo_Noah = {
    .pids = {
        PID_FIR,
        PID_ZELOT,
        PID_TREC,
        PID_JUNO,
        PID_KAREL,
    },
    .exp_base = {
        10,
        10,
        10,
        20,
        1,
    },
    .exp_growth = {
        2,
        2,
        2,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Trec = {
    .pids = {
        PID_ZELOT,
        PID_NOAH,
        PID_MELADY,
        PID_GONZALEZ,
        PID_JUNO,
    },
    .exp_base = {
        10,
        10,
        1,
        1,
        20,
    },
    .exp_growth = {
        2,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Zelot = {
    .pids = {
        PID_NOAH,
        PID_TREC,
        PID_JUNO,
        PID_THEA,
        PID_SHANNA,
    },
    .exp_base = {
        10,
        10,
        40,
        30,
        30,
    },
    .exp_growth = {
        2,
        2,
        3,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Echidna = {
    .pids = {
        PID_GEESE,
        PID_LARUM,
        PID_GONZALEZ,
        PID_WARD,
        PID_LOT,
    },
    .exp_base = {
        1,
        20,
        1,
        1,
        1,
    },
    .exp_growth = {
        1,
        2,
        1,
        1,
        1,
    },
    .count = 5,
};

struct SupportInfo CONST_DATA SupportInfo_Cecilia = {
    .pids = {
        PID_ROY,
        PID_PERCEVAL,
        PID_SAUL,
        PID_ELFFIN,
        PID_DOUGLAS,
        PID_LILINA,
    },
    .exp_base = {
        20,
        30,
        1,
        20,
        30,
        50,
    },
    .exp_growth = {
        2,
        2,
        1,
        2,
        2,
        1,
    },
    .count = 6,
};

struct SupportInfo CONST_DATA SupportInfo_Geese = {
    .pids = {
        PID_ECHIDNA,
        PID_CATH,
        PID_DOUGLAS,
        PID_LARUM,
        PID_GARRET,
    },
    .exp_base = {
        1,
        20,
        1,
        1,
        1,
    },
    .exp_growth = {
        1,
        1,
        1,
        1,
        1,
    },
    .count = 5,
};
