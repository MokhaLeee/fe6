#include "prelude.h"
#include "gamedata.h"
#include "constants/pids.h"

CONST_DATA struct DebugPInfo gPidDebugTable[] = {
    {
        .idx = PID_ROY,
        .pname = "ROY",
        .jname = "LORD",
    },
    {
        .idx = PID_BARTRE_ALT,
        .pname = "CLARINE",
        .jname = "TROUBADOUR_F",
    },
    {
        .idx = PID_GONZALEZ,
        .pname = "FA",
        .jname = "MAMKUTE",
    },
    {
        .idx = PID_LILINA,
        .pname = "SIN",
        .jname = "NOMAD",
    },
    {
        .idx = PID_LILINA,
        .pname = "SUE",
        .jname = "NOMAD",
    },
    {
        .idx = PID_NIIME,
        .pname = "DAYAN_C",
        .jname = "NOMADICTROOPER",
    },
    {
        .idx = PID_NIIME,
        .pname = "DAYAN_D",
        .jname = "NOMADICTROOPER",
    },
    {
        .idx = PID_DOUGLAS_ALT,
        .pname = "BATH",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = PID_DOUGLAS_ALT,
        .pname = "BORS",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = PID_DOUGLAS_ALT,
        .pname = "WENDY",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "DOUGLAS_A",
        .jname = "GENERAL",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "DOUGLAS_B",
        .jname = "GENERAL",
    },
    {
        .idx = PID_SAUL,
        .pname = "WOLT",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "DOROTHY",
        .jname = "ARCHER",
    },
    {
        .idx = PID_YODER,
        .pname = "KLEIN",
        .jname = "SNIPER",
    },
    {
        .idx = PID_CHAD,
        .pname = "SAUL",
        .jname = "PRIEST",
    },
    {
        .idx = PID_CHAD,
        .pname = "ELEN",
        .jname = "PRIEST",
    },
    {
        .idx = PID_FIR,
        .pname = "JODEL_C",
        .jname = "BISHOP",
    },
    {
        .idx = PID_FIR,
        .pname = "JODEL_D",
        .jname = "BISHOP",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "CHAD",
        .jname = "THIEF",
    },
    {
        .idx = PID_BARTHE,
        .pname = "KAREL",
        .jname = "SWORDMASTER",
    },
    {
        .idx = PID_DAYAN,
        .pname = "FIR",
        .jname = "SWORDFIGHTER",
    },
    {
        .idx = PID_DAYAN,
        .pname = "RUTGER",
        .jname = "SWORDFIGHTER",
    },
    {
        .idx = PID_CLARINE,
        .pname = "DIECK",
        .jname = "MERCENARY",
    },
    {
        .idx = PID_CLARINE,
        .pname = "OGIE",
        .jname = "MERCENARY",
    },
    {
        .idx = PID_GALLE,
        .pname = "GARRET",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_ASTOLFO,
        .pname = "ALEN",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = PID_ASTOLFO,
        .pname = "LANCE",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = PID_LOT,
        .pname = "PERCEVAL",
        .jname = "PALADIN",
    },
    {
        .idx = PID_YODER,
        .pname = "IGRENE",
        .jname = "SNIPER",
    },
    {
        .idx = PID_LOT,
        .pname = "MARCUS",
        .jname = "PALADIN",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "ASTORE",
        .jname = "THIEF",
    },
    {
        .idx = PID_GWENDOLYN,
        .pname = "WADE",
        .jname = "FIGHTER",
    },
    {
        .idx = PID_GWENDOLYN,
        .pname = "LOT",
        .jname = "FIGHTER",
    },
    {
        .idx = PID_DOUGLAS,
        .pname = "BARTR_A",
        .jname = "WARRIOR",
    },
    {
        .idx = PID_DOUGLAS,
        .pname = "BARTR_B",
        .jname = "WARRIOR",
    },
    {
        .idx = PID_DIECK,
        .pname = "LUGH",
        .jname = "MAGE",
    },
    {
        .idx = PID_DIECK,
        .pname = "LILINA",
        .jname = "MAGE",
    },
    {
        .idx = PID_DIECK,
        .pname = "HUGH",
        .jname = "MAGE",
    },
    {
        .idx = PID_IGRENE,
        .pname = "NIMUE_C",
        .jname = "DRUID",
    },
    {
        .idx = PID_IGRENE,
        .pname = "NIMUE_D",
        .jname = "DRUID",
    },
    {
        .idx = PID_LANCE,
        .pname = "LLEU",
        .jname = "SHAMAN",
    },
    {
        .idx = PID_MELADY,
        .pname = "LALUM",
        .jname = "DANCER_F",
    },
    {
        .idx = PID_LARUM,
        .pname = "JUNO_C",
        .jname = "FALCONKNIGHT_F",
    },
    {
        .idx = PID_LARUM,
        .pname = "JUNO_D",
        .jname = "FALCONKNIGHT_F",
    },
    {
        .idx = PID_RAIGH,
        .pname = "THITE",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_RAIGH,
        .pname = "THITE_C",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_RAIGH,
        .pname = "THITE_D",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_RAIGH,
        .pname = "THANY",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_JUNO,
        .pname = "ZEISS",
        .jname = "DRAGONKNIGHT",
    },
    {
        .idx = PID_THEA,
        .pname = "GALLE",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = PID_SOPHIA,
        .pname = "ELPHIN",
        .jname = "BARD",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "CATH",
        .jname = "THIEF",
    },
    {
        .idx = PID_LANCE,
        .pname = "SOFIYA",
        .jname = "SHAMAN",
    },
    {
        .idx = PID_JUNO,
        .pname = "MILADY",
        .jname = "DRAGONKNIGHT",
    },
    {
        .idx = PID_SHANNA,
        .pname = "GONZALEZ_A",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_SHANNA,
        .pname = "GONZALEZ_B",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_ASTOLFO,
        .pname = "NOAH",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = PID_ASTOLFO,
        .pname = "TREC",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = PID_LOT,
        .pname = "ZELOTS",
        .jname = "PALADIN",
    },
    {
        .idx = PID_SIN,
        .pname = "EKHIDNA_A",
        .jname = "HERO",
    },
    {
        .idx = PID_SIN,
        .pname = "EKHIDNA_B",
        .jname = "HERO",
    },
    {
        .idx = PID_LUGH,
        .pname = "CECILIA",
        .jname = "VALKYRIA_F",
    },
    {
        .idx = PID_ZEISS,
        .pname = "GEESE_A",
        .jname = "MARINETHIEF",
    },
    {
        .idx = PID_ZEISS,
        .pname = "GEESE_B",
        .jname = "MARINETHIEF",
    },
    {
        .idx = PID_MERLINUS,
        .pname = "MERLINUS",
        .jname = "TRANSPORTER ",
    },
    {
        .idx = PID_LOT,
        .pname = "ELIWOD",
        .jname = "PALADIN",
    },
    {
        .idx = PID_GARRET,
        .pname = "GUINEVERE",
        .jname = "SAGE",
    },
    {
        .idx = PID_SHANNA,
        .pname = "M01_MS1",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_SHANNA,
        .pname = "M01_MS2",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_SHANNA,
        .pname = "M01_MS3",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_SAUL,
        .pname = "M01_AC1",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M01_AC3",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SHANNA,
        .pname = "DAMAS",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_DOUGLAS_ALT,
        .pname = "RUDE",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = PID_DOUGLAS_ALT,
        .pname = "SLATER",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = PID_ASTOLFO,
        .pname = "ELIC",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = PID_SHANNA,
        .pname = "DORIE",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_LANCE,
        .pname = "WAGNER",
        .jname = "SHAMAN",
    },
    {
        .idx = PID_DOUGLAS_ALT,
        .pname = "DEVIUS",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "REIGANS",
        .jname = "GENERAL",
    },
    {
        .idx = PID_GALLE,
        .pname = "SCOTT",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_IGRENE,
        .pname = "NODE",
        .jname = "DRUID",
    },
    {
        .idx = PID_LOT,
        .pname = "WILLIAM",
        .jname = "PALADIN",
    },
    {
        .idx = PID_THEA,
        .pname = "FLAIR",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = PID_FIR,
        .pname = "ORO",
        .jname = "BISHOP",
    },
    {
        .idx = PID_LOT,
        .pname = "ROBERTS",
        .jname = "PALADIN",
    },
    {
        .idx = PID_GONZALEZ,
        .pname = "INE",
        .jname = "MAMKUTE",
    },
    {
        .idx = PID_THEA,
        .pname = "NACIEN",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = PID_SIN,
        .pname = "RANDY",
        .jname = "HERO",
    },
    {
        .idx = PID_GALLE,
        .pname = "ROSE",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_GALLE,
        .pname = "MAGIE",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_THEA,
        .pname = "REITH",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = PID_LOT,
        .pname = "ALCADE",
        .jname = "PALADIN",
    },
    {
        .idx = PID_FIR,
        .pname = "MARTEL",
        .jname = "BISHOP",
    },
    {
        .idx = PID_LARUM,
        .pname = "SIGUNE",
        .jname = "FALCONKNIGHT_F",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "ROAZ",
        .jname = "GENERAL",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "MARDOC",
        .jname = "GENERAL",
    },
    {
        .idx = PID_GARRET,
        .pname = "BRUNNYA",
        .jname = "SAGE",
    },
    {
        .idx = PID_ECHIDNA,
        .pname = "ZEFHYR",
        .jname = "KING",
    },
    {
        .idx = PID_LANCE,
        .pname = "IDUN",
        .jname = "SHAMAN",
    },
    {
        .idx = PID_ZELOT,
        .pname = "IDUN2",
        .jname = "MAGICDRAGON_F",
    },
    {
        .idx = PID_GONZALEZ,
        .pname = "JAHN",
        .jname = "MAMKUTE",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "ZINC",
        .jname = "GENERAL",
    },
    {
        .idx = PID_NIIME,
        .pname = "MANGU",
        .jname = "NOMADICTROOPER",
    },
    {
        .idx = PID_BARTHE,
        .pname = "KELL",
        .jname = "SWORDMASTER",
    },
    {
        .idx = PID_SHANNA,
        .pname = "M01_BORM",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_GWENDOLYN,
        .pname = "M02_BERN",
        .jname = "FIGHTER",
    },
    {
        .idx = PID_THEA_NPC_ALT,
        .pname = "M02_BERN_S",
        .jname = "SOLDIER",
    },
    {
        .idx = PID_CLARINE,
        .pname = "M02_BERN_Y",
        .jname = "MERCENARY",
    },
    {
        .idx = PID_SAUL,
        .pname = "M03_BERN",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M03_BERN_S",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M04_ARAPHEN",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M04_MARINE",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M05_ROBBER",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M06_THRIA",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M07_R_OSTIA",
        .jname = "ARCHER",
    },
    {
        .idx = PID_JUNO,
        .pname = "M07_BERN",
        .jname = "DRAGONKNIGHT",
    },
    {
        .idx = PID_ASTOLFO,
        .pname = "M08_R_OSTIA",
        .jname = "SOCIALKNIGHT",
    },
    {
        .idx = PID_ECHIDNA_ALT,
        .pname = "M08_K_OSTIA",
        .jname = "CIVILIAN",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M08_T_OSTIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M09_EBCRAM",
        .jname = "THIEF",
    },
    {
        .idx = PID_ZEISS,
        .pname = "M09_EBCRAM_MARINE",
        .jname = "MARINETHIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M10A_FIB",
        .jname = "THIEF",
    },
    {
        .idx = PID_ZEISS,
        .pname = "M10A_FIB_MARIN",
        .jname = "MARINETHIEF",
    },
    {
        .idx = PID_GWENDOLYN,
        .pname = "M10A_REGISTANCE",
        .jname = "FIGHTER",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M11A_FIB",
        .jname = "THIEF",
    },
    {
        .idx = PID_SHANNA,
        .pname = "M10B_FIB_ROB",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M10B_FIB",
        .jname = "THIEF",
    },
    {
        .idx = PID_SHANNA,
        .pname = "M11A_FIB_ROB",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_SAUL,
        .pname = "M12_BERN",
        .jname = "ARCHER",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M12_JUTE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M12_FIB",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M13_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M13_ETRURIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M14_BERN_MC",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M14_MIS_BAN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M15_ETRURIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M15_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_RAIGH,
        .pname = "M15_PEG",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M15_BANDIT",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M16_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M16_ETRURIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M16_THIEFT",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M17C_ETRURIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M17C_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_SAUL,
        .pname = "M17C_MARINE",
        .jname = "ARCHER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M17C_MARINE2",
        .jname = "ARCHER",
    },
    {
        .idx = PID_RAIGH,
        .pname = "M18C_PEG",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M18C_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M18C_IRIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M18C_BANDIT",
        .jname = "THIEF",
    },
    {
        .idx = PID_RAIGH,
        .pname = "M19C_PEG",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M19C_IRIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M19C_BANDIT",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20C_IRIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ECHIDNA_ALT,
        .pname = "M20C_CIV",
        .jname = "CIVILIAN",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20C_THIEFT",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M21_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M22_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M22_MAMCUTE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M22_THIEFT",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M11B_FIB",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M11B_CITIZEN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M11B_MARINE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M17D_ETRURIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M17D_SACAE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M17D_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M18D_SACAE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M18D_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M19D_SACAE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M19D_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20D_ETRURIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20D_SACAE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20D_THIEFT",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M23_MAMCUTE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M23_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M25_MAMCUTE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M08x_MERCINARY",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M08x_ZAKO",
        .jname = "THIEF",
    },
    {
        .idx = PID_SIN,
        .pname = "HENNING",
        .jname = "HERO",
    },
    {
        .idx = PID_SHANNA,
        .pname = "SCORLAN",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M12x_BANDDIT",
        .jname = "THIEF",
    },
    {
        .idx = PID_GALLE,
        .pname = "GUERRERO",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_GARRET,
        .pname = "OTS",
        .jname = "SAGE",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "TICK",
        .jname = "GENERAL",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20CX_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20dx_SACAE",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M20Dx_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_NIIME,
        .pname = "TORRIL",
        .jname = "NOMADICTROOPER",
    },
    {
        .idx = PID_IGRENE,
        .pname = "BRACLE",
        .jname = "DRUID",
    },
    {
        .idx = PID_NIIME,
        .pname = "CUDOKE",
        .jname = "NOMADICTROOPER",
    },
    {
        .idx = PID_IGRENE,
        .pname = "MARAL",
        .jname = "DRUID",
    },
    {
        .idx = PID_NIIME,
        .pname = "KBLE",
        .jname = "NOMADICTROOPER",
    },
    {
        .idx = PID_IGRENE,
        .pname = "CHAN",
        .jname = "DRUID",
    },
    {
        .idx = PID_IGRENE,
        .pname = "PEREZ",
        .jname = "DRUID",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M21X_BERN",
        .jname = "THIEF",
    },
    {
        .idx = PID_FIR,
        .pname = "WINDHAM",
        .jname = "BISHOP",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M16X_ETRURIA",
        .jname = "THIEF",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "MORGAN",
        .jname = "GENERAL",
    },
    {
        .idx = PID_LOT,
        .pname = "M07_LEADER_1",
        .jname = "PALADIN",
    },
    {
        .idx = PID_THEA,
        .pname = "M21_BERN_L1",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = PID_THEA,
        .pname = "M21_BERN_L2",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = PID_THEA,
        .pname = "M21_BERN_L3",
        .jname = "DRAGONMASTER",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M11B_CITIZEN2",
        .jname = "THIEF",
    },
    {
        .idx = PID_ECHIDNA_ALT,
        .pname = "M20C_CIV2",
        .jname = "CIVILIAN",
    },
    {
        .idx = PID_DOROTHY,
        .pname = "HECTOR",
        .jname = "GENERAL",
    },
    {
        .idx = PID_DOUGLAS_ALT,
        .pname = "M00_BORS00",
        .jname = "ARMORKNIGHT",
    },
    {
        .idx = PID_THEA_NPC_ALT,
        .pname = "M00_S",
        .jname = "SOLDIER",
    },
    {
        .idx = PID_SAUL,
        .pname = "M00_AC",
        .jname = "ARCHER",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M13_15_PERCIVAL",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M11B_FIB_M",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M13_PERCIVAL_1",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M13_PERCIVAL_2",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M13_PERCIVAL_3",
        .jname = "THIEF",
    },
    {
        .idx = PID_ELFFIN,
        .pname = "M13_ETRURIA2",
        .jname = "THIEF",
    },
    {
        .idx = PID_RAIGH,
        .pname = "M15_PEG2",
        .jname = "PEGASUSKNIGHT_F",
    },
    {
        .idx = PID_GALLE,
        .pname = "EX_BOSS_WEST",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_GALLE,
        .pname = "EX_BOSS_LYCIA",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_GALLE,
        .pname = "EX_BOSS_ETRULIA",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_GALLE,
        .pname = "EX_BOSS_SACUE",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_GALLE,
        .pname = "EX_BOSS_ILIA",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_GALLE,
        .pname = "EX_BOSS_BERN",
        .jname = "BERSERKER",
    },
    {
        .idx = PID_SHANNA,
        .pname = "M01_MS1_T",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_SHANNA,
        .pname = "DUELTARGET",
        .jname = "MOUNTAINTHIEF",
    },
    {
        .idx = PID_SHANNA,
        .pname = "WALLBREAK",
        .jname = "MOUNTAINTHIEF",
    },
};
