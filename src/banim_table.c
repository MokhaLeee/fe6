#include "prelude.h"
#include "banim_data.h"
#include "constants/banims.h"

CONST_DATA long long gBanimTableCount = BANIM_MAX;

CONST_DATA struct BattleAnim gBanimTable[BANIM_MAX] = {
    [BANIM_00] = 
    {
        .abbr = "armm_sp1",
        .modes = BANIM_MODE_armm_sp1,
        .script = BANIM_SCR_armm_sp1,
        .oam_r = BANIM_OAMR_armm_sp1,
        .oam_l = BANIM_OAML_armm_sp1,
        .pal = BANIM_PAL_armm_sp1,
    },

    [BANIM_01] = 
    {
        .abbr = "pirm_ax1",
        .modes = BANIM_MODE_pirm_ax1,
        .script = BANIM_SCR_pirm_ax1,
        .oam_r = BANIM_OAMR_pirm_ax1,
        .oam_l = BANIM_OAML_pirm_ax1,
        .pal = BANIM_PAL_pirm_ax1,
    },

    [BANIM_02] = 
    {
        .abbr = "berm_ax1",
        .modes = BANIM_MODE_berm_ax1,
        .script = BANIM_SCR_berm_ax1,
        .oam_r = BANIM_OAMR_berm_ax1,
        .oam_l = BANIM_OAML_berm_ax1,
        .pal = BANIM_PAL_berm_ax1,
    },

    [BANIM_03] = 
    {
        .abbr = "banm_ax1",
        .modes = BANIM_MODE_banm_ax1,
        .script = BANIM_SCR_banm_ax1,
        .oam_r = BANIM_OAMR_banm_ax1,
        .oam_l = BANIM_OAML_banm_ax1,
        .pal = BANIM_PAL_banm_ax1,
    },

    [BANIM_04] = 
    {
        .abbr = "snim_ar1",
        .modes = BANIM_MODE_snim_ar1,
        .script = BANIM_SCR_snim_ar1,
        .oam_r = BANIM_OAMR_snim_ar1,
        .oam_l = BANIM_OAML_snim_ar1,
        .pal = BANIM_PAL_snim_ar1,
    },

    [BANIM_05] = 
    {
        .abbr = "snif_ar1",
        .modes = BANIM_MODE_snif_ar1,
        .script = BANIM_SCR_snif_ar1,
        .oam_r = BANIM_OAMR_snif_ar1,
        .oam_l = BANIM_OAML_snif_ar1,
        .pal = BANIM_PAL_snif_ar1,
    },

    [BANIM_06] = 
    {
        .abbr = "merm_sw1",
        .modes = BANIM_MODE_merm_sw1,
        .script = BANIM_SCR_merm_sw1,
        .oam_r = BANIM_OAMR_merm_sw1,
        .oam_l = BANIM_OAML_merm_sw1,
        .pal = BANIM_PAL_merm_sw1,
    },

    [BANIM_07] = 
    {
        .abbr = "merm_sw1",
        .modes = BANIM_MODE_merm_sw1_2,
        .script = BANIM_SCR_merm_sw1_2,
        .oam_r = BANIM_OAMR_merm_sw1_2,
        .oam_l = BANIM_OAML_merm_sw1_2,
        .pal = BANIM_PAL_merm_sw1_2,
    },

    [BANIM_08] = 
    {
        .abbr = "sokm_sp1",
        .modes = BANIM_MODE_sokm_sp1,
        .script = BANIM_SCR_sokm_sp1,
        .oam_r = BANIM_OAMR_sokm_sp1,
        .oam_l = BANIM_OAML_sokm_sp1,
        .pal = BANIM_PAL_sokm_sp1,
    },

    [BANIM_09] = 
    {
        .abbr = "sokm_sp1",
        .modes = BANIM_MODE_sokm_sp1_2,
        .script = BANIM_SCR_sokm_sp1_2,
        .oam_r = BANIM_OAMR_sokm_sp1_2,
        .oam_l = BANIM_OAML_sokm_sp1_2,
        .pal = BANIM_PAL_sokm_sp1_2,
    },

    [BANIM_0A] = 
    {
        .abbr = "sokm_sp1",
        .modes = BANIM_MODE_sokm_sp1_3,
        .script = BANIM_SCR_sokm_sp1_3,
        .oam_r = BANIM_OAMR_sokm_sp1_3,
        .oam_l = BANIM_OAML_sokm_sp1_3,
        .pal = BANIM_PAL_sokm_sp1_3,
    },

    [BANIM_0B] = 
    {
        .abbr = "fakf_sp1",
        .modes = BANIM_MODE_fakf_sp1,
        .script = BANIM_SCR_fakf_sp1,
        .oam_r = BANIM_OAMR_fakf_sp1,
        .oam_l = BANIM_OAML_fakf_sp1,
        .pal = BANIM_PAL_fakf_sp1,
    },

    [BANIM_0C] = 
    {
        .abbr = "magm_mg1",
        .modes = BANIM_MODE_magm_mg1,
        .script = BANIM_SCR_magm_mg1,
        .oam_r = BANIM_OAMR_magm_mg1,
        .oam_l = BANIM_OAML_magm_mg1,
        .pal = BANIM_PAL_magm_mg1,
    },

    [BANIM_0D] = 
    {
        .abbr = "magf_mg1",
        .modes = BANIM_MODE_magf_mg1,
        .script = BANIM_SCR_magf_mg1,
        .oam_r = BANIM_OAMR_magf_mg1,
        .oam_l = BANIM_OAML_magf_mg1,
        .pal = BANIM_PAL_magf_mg1,
    },

    [BANIM_0E] = 
    {
        .abbr = "arcm_ar1",
        .modes = BANIM_MODE_arcm_ar1,
        .script = BANIM_SCR_arcm_ar1,
        .oam_r = BANIM_OAMR_arcm_ar1,
        .oam_l = BANIM_OAML_arcm_ar1,
        .pal = BANIM_PAL_arcm_ar1,
    },

    [BANIM_0F] = 
    {
        .abbr = "arcf_ar1",
        .modes = BANIM_MODE_arcf_ar1,
        .script = BANIM_SCR_arcf_ar1,
        .oam_r = BANIM_OAMR_arcf_ar1,
        .oam_l = BANIM_OAML_arcf_ar1,
        .pal = BANIM_PAL_arcf_ar1_2,
    },

    [BANIM_10] = 
    {
        .abbr = "lorm_sw1",
        .modes = BANIM_MODE_lorm_sw1,
        .script = BANIM_SCR_lorm_sw1,
        .oam_r = BANIM_OAMR_lorm_sw1,
        .oam_l = BANIM_OAML_lorm_sw1,
        .pal = BANIM_PAL_lorm_sw1,
    },

    [BANIM_11] = 
    {
        .abbr = "sagf_mg1",
        .modes = BANIM_MODE_sagf_mg1,
        .script = BANIM_SCR_sagf_mg1,
        .oam_r = BANIM_OAMR_sagf_mg1,
        .oam_l = BANIM_OAML_sagf_mg1,
        .pal = BANIM_PAL_sagf_mg1,
    },

    [BANIM_12] = 
    {
        .abbr = "solm_sp1",
        .modes = BANIM_MODE_solm_sp1,
        .script = BANIM_SCR_solm_sp1,
        .oam_r = BANIM_OAMR_solm_sp1,
        .oam_l = BANIM_OAML_solm_sp1,
        .pal = BANIM_PAL_solm_sp1,
    },

    [BANIM_13] = 
    {
        .abbr = "drum_mg1",
        .modes = BANIM_MODE_drum_mg1,
        .script = BANIM_SCR_drum_mg1,
        .oam_r = BANIM_OAMR_drum_mg1,
        .oam_l = BANIM_OAML_drum_mg1,
        .pal = BANIM_PAL_drum_mg1,
    },

    [BANIM_14] = 
    {
        .abbr = "lorm_sw1",
        .modes = BANIM_MODE_lorm_sw1_2,
        .script = BANIM_SCR_lorm_sw1_2,
        .oam_r = BANIM_OAMR_lorm_sw1_2,
        .oam_l = BANIM_OAML_lorm_sw1_2,
        .pal = BANIM_PAL_lorm_sw1_2,
    },

    [BANIM_15] = 
    {
        .abbr = "bram_sw1",
        .modes = BANIM_MODE_bram_sw1,
        .script = BANIM_SCR_bram_sw1,
        .oam_r = BANIM_OAMR_bram_sw1,
        .oam_l = BANIM_OAML_bram_sw1,
        .pal = BANIM_PAL_bram_sw1,
    },

    [BANIM_16] = 
    {
        .abbr = "danf_no1",
        .modes = BANIM_MODE_danf_no1,
        .script = BANIM_SCR_danf_no1,
        .oam_r = BANIM_OAMR_danf_no1,
        .oam_l = BANIM_OAML_danf_no1,
        .pal = BANIM_PAL_danf_no1,
    },

    [BANIM_17] = 
    {
        .abbr = "brdm_mg1",
        .modes = BANIM_MODE_brdm_mg1,
        .script = BANIM_SCR_brdm_mg1,
        .oam_r = BANIM_OAMR_brdm_mg1,
        .oam_l = BANIM_OAML_brdm_mg1,
        .pal = BANIM_PAL_brdm_mg1,
    },

    [BANIM_18] = 
    {
        .abbr = "prif_mg1",
        .modes = BANIM_MODE_prif_mg1,
        .script = BANIM_SCR_prif_mg1,
        .oam_r = BANIM_OAMR_prif_mg1,
        .oam_l = BANIM_OAML_prif_mg1,
        .pal = BANIM_PAL_prif_mg1,
    },

    [BANIM_19] = 
    {
        .abbr = "prim_mg1",
        .modes = BANIM_MODE_prim_mg1,
        .script = BANIM_SCR_prim_mg1,
        .oam_r = BANIM_OAMR_prim_mg1,
        .oam_l = BANIM_OAML_prim_mg1,
        .pal = BANIM_PAL_prim_mg1,
    },

    [BANIM_1A] = 
    {
        .abbr = "pakm_sw1",
        .modes = BANIM_MODE_pakm_sw1,
        .script = BANIM_SCR_pakm_sw1,
        .oam_r = BANIM_OAMR_pakm_sw1,
        .oam_l = BANIM_OAML_pakm_sw1,
        .pal = BANIM_PAL_pakm_sw1,
    },

    [BANIM_1B] = 
    {
        .abbr = "nomm_ar1",
        .modes = BANIM_MODE_nomm_ar1,
        .script = BANIM_SCR_nomm_ar1,
        .oam_r = BANIM_OAMR_nomm_ar1,
        .oam_l = BANIM_OAML_nomm_ar1,
        .pal = BANIM_PAL_nomm_ar1,
    },

    [BANIM_1C] = 
    {
        .abbr = "nomm_ar1",
        .modes = BANIM_MODE_nomm_ar1_2,
        .script = BANIM_SCR_nomm_ar1_2,
        .oam_r = BANIM_OAMR_nomm_ar1_2,
        .oam_l = BANIM_OAML_nomm_ar1_2,
        .pal = BANIM_PAL_nomm_ar1_2,
    },

    [BANIM_1D] = 
    {
        .abbr = "nomf_ar1",
        .modes = BANIM_MODE_nomf_ar1,
        .script = BANIM_SCR_nomf_ar1,
        .oam_r = BANIM_OAMR_nomf_ar1,
        .oam_l = BANIM_OAML_nomf_ar1,
        .pal = BANIM_PAL_nomf_ar1,
    },

    [BANIM_1E] = 
    {
        .abbr = "nomf_ar1",
        .modes = BANIM_MODE_nomf_ar1_2,
        .script = BANIM_SCR_nomf_ar1_2,
        .oam_r = BANIM_OAMR_nomf_ar1_2,
        .oam_l = BANIM_OAML_nomf_ar1_2,
        .pal = BANIM_PAL_nomf_ar1_2,
    },

    [BANIM_1F] = 
    {
        .abbr = "armm_sp1",
        .modes = BANIM_MODE_armm_sp1_2,
        .script = BANIM_SCR_armm_sp1_2,
        .oam_r = BANIM_OAMR_armm_sp1_2,
        .oam_l = BANIM_OAML_armm_sp1_2,
        .pal = BANIM_PAL_armm_sp1_2,
    },

    [BANIM_20] = 
    {
        .abbr = "prif_mg1",
        .modes = BANIM_MODE_prif_mg1_2,
        .script = BANIM_SCR_prif_mg1_2,
        .oam_r = BANIM_OAMR_prif_mg1_2,
        .oam_l = BANIM_OAML_prif_mg1_2,
        .pal = BANIM_PAL_prif_mg1_2,
    },

    [BANIM_21] = 
    {
        .abbr = "prim_mg1",
        .modes = BANIM_MODE_prim_mg1_2,
        .script = BANIM_SCR_prim_mg1_2,
        .oam_r = BANIM_OAMR_prim_mg1_2,
        .oam_l = BANIM_OAML_prim_mg1_2,
        .pal = BANIM_PAL_prim_mg1_2,
    },

    [BANIM_22] = 
    {
        .abbr = "figm_ax1",
        .modes = BANIM_MODE_figm_ax1,
        .script = BANIM_SCR_figm_ax1,
        .oam_r = BANIM_OAMR_figm_ax1,
        .oam_l = BANIM_OAML_figm_ax1,
        .pal = BANIM_PAL_figm_ax1,
    },

    [BANIM_23] = 
    {
        .abbr = "figm_ax1",
        .modes = BANIM_MODE_figm_ax1_2,
        .script = BANIM_SCR_figm_ax1_2,
        .oam_r = BANIM_OAMR_figm_ax1_2,
        .oam_l = BANIM_OAML_figm_ax1_2,
        .pal = BANIM_PAL_figm_ax1_2,
    },

    [BANIM_24] = 
    {
        .abbr = "bism_mg1",
        .modes = BANIM_MODE_bism_mg1,
        .script = BANIM_SCR_bism_mg1,
        .oam_r = BANIM_OAMR_bism_mg1,
        .oam_l = BANIM_OAML_bism_mg1,
        .pal = BANIM_PAL_bism_mg1,
    },

    [BANIM_25] = 
    {
        .abbr = "bism_mg1",
        .modes = BANIM_MODE_bism_mg1_2,
        .script = BANIM_SCR_bism_mg1_2,
        .oam_r = BANIM_OAMR_bism_mg1_2,
        .oam_l = BANIM_OAML_bism_mg1_2,
        .pal = BANIM_PAL_bism_mg1_2,
    },

    [BANIM_26] = 
    {
        .abbr = "bisf_mg1",
        .modes = BANIM_MODE_bisf_mg1,
        .script = BANIM_SCR_bisf_mg1,
        .oam_r = BANIM_OAMR_bisf_mg1,
        .oam_l = BANIM_OAML_bisf_mg1,
        .pal = BANIM_PAL_bisf_mg1,
    },

    [BANIM_27] = 
    {
        .abbr = "bisf_mg1",
        .modes = BANIM_MODE_bisf_mg1_2,
        .script = BANIM_SCR_bisf_mg1_2,
        .oam_r = BANIM_OAMR_bisf_mg1_2,
        .oam_l = BANIM_OAML_bisf_mg1_2,
        .pal = BANIM_PAL_bisf_mg1_2,
    },

    [BANIM_28] = 
    {
        .abbr = "mamm_no1",
        .modes = BANIM_MODE_mamm_no1,
        .script = BANIM_SCR_mamm_no1,
        .oam_r = BANIM_OAMR_mamm_no1,
        .oam_l = BANIM_OAML_mamm_no1,
        .pal = BANIM_PAL_mamm_no1,
    },

    [BANIM_29] = 
    {
        .abbr = "mamf_no1",
        .modes = BANIM_MODE_mamf_no1,
        .script = BANIM_SCR_mamf_no1,
        .oam_r = BANIM_OAMR_mamf_no1,
        .oam_l = BANIM_OAML_mamf_no1,
        .pal = BANIM_PAL_mamf_no1,
    },

    [BANIM_2A] = 
    {
        .abbr = "banm_ax1",
        .modes = BANIM_MODE_banm_ax1_2,
        .script = BANIM_SCR_banm_ax1_2,
        .oam_r = BANIM_OAMR_banm_ax1_2,
        .oam_l = BANIM_OAML_banm_ax1_2,
        .pal = BANIM_PAL_banm_ax1_2,
    },

    [BANIM_2B] = 
    {
        .abbr = "berm_ax1",
        .modes = BANIM_MODE_berm_ax1_2,
        .script = BANIM_SCR_berm_ax1_2,
        .oam_r = BANIM_OAMR_berm_ax1_2,
        .oam_l = BANIM_OAML_berm_ax1_2,
        .pal = BANIM_PAL_berm_ax1_2,
    },

    [BANIM_2C] = 
    {
        .abbr = "sham_mg1",
        .modes = BANIM_MODE_sham_mg1,
        .script = BANIM_SCR_sham_mg1,
        .oam_r = BANIM_OAMR_sham_mg1,
        .oam_l = BANIM_OAML_sham_mg1,
        .pal = BANIM_PAL_sham_mg1,
    },

    [BANIM_2D] = 
    {
        .abbr = "shaf_mg1",
        .modes = BANIM_MODE_shaf_mg1,
        .script = BANIM_SCR_shaf_mg1,
        .oam_r = BANIM_OAMR_shaf_mg1,
        .oam_l = BANIM_OAML_shaf_mg1,
        .pal = BANIM_PAL_shaf_mg1,
    },

    [BANIM_2E] = 
    {
        .abbr = "warm_ax1",
        .modes = BANIM_MODE_warm_ax1,
        .script = BANIM_SCR_warm_ax1,
        .oam_r = BANIM_OAMR_warm_ax1,
        .oam_l = BANIM_OAML_warm_ax1,
        .pal = BANIM_PAL_warm_ax1,
    },

    [BANIM_2F] = 
    {
        .abbr = "warm_ax1",
        .modes = BANIM_MODE_warm_ax1_2,
        .script = BANIM_SCR_warm_ax1_2,
        .oam_r = BANIM_OAMR_warm_ax1_2,
        .oam_l = BANIM_OAML_warm_ax1_2,
        .pal = BANIM_PAL_warm_ax1_2,
    },

    [BANIM_30] = 
    {
        .abbr = "pirm_ax1",
        .modes = BANIM_MODE_pirm_ax1_2,
        .script = BANIM_SCR_pirm_ax1_2,
        .oam_r = BANIM_OAMR_pirm_ax1_2,
        .oam_l = BANIM_OAML_pirm_ax1_2,
        .pal = BANIM_PAL_pirm_ax1_2,
    },

    [BANIM_31] = 
    {
        .abbr = "trof_ro1",
        .modes = BANIM_MODE_trof_ro1,
        .script = BANIM_SCR_trof_ro1,
        .oam_r = BANIM_OAMR_trof_ro1,
        .oam_l = BANIM_OAML_trof_ro1,
        .pal = BANIM_PAL_trof_ro1,
    },

    [BANIM_32] = 
    {
        .abbr = "trof_ro1",
        .modes = BANIM_MODE_trof_ro1_2,
        .script = BANIM_SCR_trof_ro1_2,
        .oam_r = BANIM_OAMR_trof_ro1_2,
        .oam_l = BANIM_OAML_trof_ro1_2,
        .pal = BANIM_PAL_trof_ro1_2,
    },

    [BANIM_33] = 
    {
        .abbr = "valf_mg1",
        .modes = BANIM_MODE_valf_mg1,
        .script = BANIM_SCR_valf_mg1,
        .oam_r = BANIM_OAMR_valf_mg1,
        .oam_l = BANIM_OAML_valf_mg1,
        .pal = BANIM_PAL_valf_mg1,
    },

    [BANIM_34] = 
    {
        .abbr = "valf_mg1",
        .modes = BANIM_MODE_valf_mg1_2,
        .script = BANIM_SCR_valf_mg1_2,
        .oam_r = BANIM_OAMR_valf_mg1_2,
        .oam_l = BANIM_OAML_valf_mg1_2,
        .pal = BANIM_PAL_valf_mg1_2,
    },

    [BANIM_35] = 
    {
        .abbr = "sagm_mg1",
        .modes = BANIM_MODE_sagm_mg1,
        .script = BANIM_SCR_sagm_mg1,
        .oam_r = BANIM_OAMR_sagm_mg1,
        .oam_l = BANIM_OAML_sagm_mg1,
        .pal = BANIM_PAL_sagm_mg1,
    },

    [BANIM_36] = 
    {
        .abbr = "bram_sw1",
        .modes = BANIM_MODE_bram_sw1_2,
        .script = BANIM_SCR_bram_sw1_2,
        .oam_r = BANIM_OAMR_bram_sw1_2,
        .oam_l = BANIM_OAML_bram_sw1_2,
        .pal = BANIM_PAL_bram_sw1_2,
    },

    [BANIM_37] = 
    {
        .abbr = "pekf_sp1",
        .modes = BANIM_MODE_pekf_sp1,
        .script = BANIM_SCR_pekf_sp1,
        .oam_r = BANIM_OAMR_pekf_sp1,
        .oam_l = BANIM_OAML_pekf_sp1,
        .pal = BANIM_PAL_pekf_sp1,
    },

    [BANIM_38] = 
    {
        .abbr = "pekf_sp1",
        .modes = BANIM_MODE_pekf_sp1_2,
        .script = BANIM_SCR_pekf_sp1_2,
        .oam_r = BANIM_OAMR_pekf_sp1_2,
        .oam_l = BANIM_OAML_pekf_sp1_2,
        .pal = BANIM_PAL_pekf_sp1_2,
    },

    [BANIM_39] = 
    {
        .abbr = "thim_sw1",
        .modes = BANIM_MODE_thim_sw1,
        .script = BANIM_SCR_thim_sw1,
        .oam_r = BANIM_OAMR_thim_sw1,
        .oam_l = BANIM_OAML_thim_sw1,
        .pal = BANIM_PAL_thim_sw1,
    },

    [BANIM_3A] = 
    {
        .abbr = "thim_sw1",
        .modes = BANIM_MODE_thim_sw1_2,
        .script = BANIM_SCR_thim_sw1_2,
        .oam_r = BANIM_OAMR_thim_sw1_2,
        .oam_l = BANIM_OAML_thim_sw1_2,
        .pal = BANIM_PAL_thim_sw1_2,
    },

    [BANIM_3B] = 
    {
        .abbr = "thif_sw1",
        .modes = BANIM_MODE_thif_sw1,
        .script = BANIM_SCR_thif_sw1,
        .oam_r = BANIM_OAMR_thif_sw1,
        .oam_l = BANIM_OAML_thif_sw1,
        .pal = BANIM_PAL_thif_sw1,
    },

    [BANIM_3C] = 
    {
        .abbr = "thif_sw1",
        .modes = BANIM_MODE_thif_sw1_2,
        .script = BANIM_SCR_thif_sw1_2,
        .oam_r = BANIM_OAMR_thif_sw1_2,
        .oam_l = BANIM_OAML_thif_sw1_2,
        .pal = BANIM_PAL_thif_sw1_2,
    },

    [BANIM_3D] = 
    {
        .abbr = "braf_sw1",
        .modes = BANIM_MODE_braf_sw1,
        .script = BANIM_SCR_braf_sw1,
        .oam_r = BANIM_OAMR_braf_sw1,
        .oam_l = BANIM_OAML_braf_sw1,
        .pal = BANIM_PAL_braf_sw1,
    },

    [BANIM_3E] = 
    {
        .abbr = "braf_sw1",
        .modes = BANIM_MODE_braf_sw1_2,
        .script = BANIM_SCR_braf_sw1_2,
        .oam_r = BANIM_OAMR_braf_sw1_2,
        .oam_l = BANIM_OAML_braf_sw1_2,
        .pal = BANIM_PAL_braf_sw1_2,
    },

    [BANIM_3F] = 
    {
        .abbr = "myrm_sw1",
        .modes = BANIM_MODE_myrm_sw1,
        .script = BANIM_SCR_myrm_sw1,
        .oam_r = BANIM_OAMR_myrm_sw1,
        .oam_l = BANIM_OAML_myrm_sw1,
        .pal = BANIM_PAL_myrm_sw1,
    },

    [BANIM_40] = 
    {
        .abbr = "myrm_sw1",
        .modes = BANIM_MODE_myrm_sw1_2,
        .script = BANIM_SCR_myrm_sw1_2,
        .oam_r = BANIM_OAMR_myrm_sw1_2,
        .oam_l = BANIM_OAML_myrm_sw1_2,
        .pal = BANIM_PAL_myrm_sw1_2,
    },

    [BANIM_41] = 
    {
        .abbr = "pakm_sw1",
        .modes = BANIM_MODE_pakm_sw1_2,
        .script = BANIM_SCR_pakm_sw1_2,
        .oam_r = BANIM_OAMR_pakm_sw1_2,
        .oam_l = BANIM_OAML_pakm_sw1_2,
        .pal = BANIM_PAL_pakm_sw1_2,
    },

    [BANIM_42] = 
    {
        .abbr = "pakm_sw1",
        .modes = BANIM_MODE_pakm_sw1_3,
        .script = BANIM_SCR_pakm_sw1_3,
        .oam_r = BANIM_OAMR_pakm_sw1_3,
        .oam_l = BANIM_OAML_pakm_sw1_3,
        .pal = BANIM_PAL_pakm_sw1_3,
    },

    [BANIM_43] = 
    {
        .abbr = "pakm_sw1",
        .modes = BANIM_MODE_pakm_sw1_4,
        .script = BANIM_SCR_pakm_sw1_4,
        .oam_r = BANIM_OAMR_pakm_sw1_4,
        .oam_l = BANIM_OAML_pakm_sw1_4,
        .pal = BANIM_PAL_pakm_sw1_4,
    },

    [BANIM_44] = 
    {
        .abbr = "arcm_ar1",
        .modes = BANIM_MODE_arcm_ar1_2,
        .script = BANIM_SCR_arcm_ar1_2,
        .oam_r = BANIM_OAMR_arcm_ar1_2,
        .oam_l = BANIM_OAML_arcm_ar1_2,
        .pal = BANIM_PAL_arcm_ar1_2,
    },

    [BANIM_45] = 
    {
        .abbr = "arcf_ar1",
        .modes = BANIM_MODE_arcf_ar1_2,
        .script = BANIM_SCR_arcf_ar1_2,
        .oam_r = BANIM_OAMR_arcf_ar1_2,
        .oam_l = BANIM_OAML_arcf_ar1_2,
        .pal = BANIM_PAL_arcf_ar1,
    },

    [BANIM_46] = 
    {
        .abbr = "solm_sp1",
        .modes = BANIM_MODE_solm_sp1_2,
        .script = BANIM_SCR_solm_sp1_2,
        .oam_r = BANIM_OAMR_solm_sp1_2,
        .oam_l = BANIM_OAML_solm_sp1_2,
        .pal = BANIM_PAL_solm_sp1_2,
    },

    [BANIM_47] = 
    {
        .abbr = "warm_ar1",
        .modes = BANIM_MODE_warm_ar1,
        .script = BANIM_SCR_warm_ar1,
        .oam_r = BANIM_OAMR_warm_ar1,
        .oam_l = BANIM_OAML_warm_ar1,
        .pal = BANIM_PAL_warm_ar1,
    },

    [BANIM_48] = 
    {
        .abbr = "myrf_sw1",
        .modes = BANIM_MODE_myrf_sw1,
        .script = BANIM_SCR_myrf_sw1,
        .oam_r = BANIM_OAMR_myrf_sw1,
        .oam_l = BANIM_OAML_myrf_sw1,
        .pal = BANIM_PAL_myrf_sw1,
    },

    [BANIM_49] = 
    {
        .abbr = "myrf_sw1",
        .modes = BANIM_MODE_myrf_sw1_2,
        .script = BANIM_SCR_myrf_sw1_2,
        .oam_r = BANIM_OAMR_myrf_sw1_2,
        .oam_l = BANIM_OAML_myrf_sw1_2,
        .pal = BANIM_PAL_myrf_sw1_2,
    },

    [BANIM_4A] = 
    {
        .abbr = "bram_sw1",
        .modes = BANIM_MODE_bram_sw1_3,
        .script = BANIM_SCR_bram_sw1_3,
        .oam_r = BANIM_OAMR_bram_sw1_3,
        .oam_l = BANIM_OAML_bram_sw1_3,
        .pal = BANIM_PAL_bram_sw1_3,
    },

    [BANIM_4B] = 
    {
        .abbr = "braf_sw1",
        .modes = BANIM_MODE_braf_sw1_3,
        .script = BANIM_SCR_braf_sw1_3,
        .oam_r = BANIM_OAMR_braf_sw1_3,
        .oam_l = BANIM_OAML_braf_sw1_3,
        .pal = BANIM_PAL_braf_sw1_3,
    },

    [BANIM_4C] = 
    {
        .abbr = "drkm_sp1",
        .modes = BANIM_MODE_drkm_sp1,
        .script = BANIM_SCR_drkm_sp1,
        .oam_r = BANIM_OAMR_drkm_sp1,
        .oam_l = BANIM_OAML_drkm_sp1,
        .pal = BANIM_PAL_drkm_sp1,
    },

    [BANIM_4D] = 
    {
        .abbr = "drkm_sp1",
        .modes = BANIM_MODE_drkm_sp1_2,
        .script = BANIM_SCR_drkm_sp1_2,
        .oam_r = BANIM_OAMR_drkm_sp1_2,
        .oam_l = BANIM_OAML_drkm_sp1_2,
        .pal = BANIM_PAL_drkm_sp1_2,
    },

    [BANIM_4E] = 
    {
        .abbr = "roym_sw1",
        .modes = BANIM_MODE_roym_sw1,
        .script = BANIM_SCR_roym_sw1,
        .oam_r = BANIM_OAMR_roym_sw1,
        .oam_l = BANIM_OAML_roym_sw1,
        .pal = BANIM_PAL_roym_sw1,
    },

    [BANIM_4F] = 
    {
        .abbr = "notm_sw1",
        .modes = BANIM_MODE_notm_sw1,
        .script = BANIM_SCR_notm_sw1,
        .oam_r = BANIM_OAMR_notm_sw1,
        .oam_l = BANIM_OAML_notm_sw1,
        .pal = BANIM_PAL_notm_sw1,
    },

    [BANIM_50] = 
    {
        .abbr = "notf_sw1",
        .modes = BANIM_MODE_notf_sw1,
        .script = BANIM_SCR_notf_sw1,
        .oam_r = BANIM_OAMR_notf_sw1,
        .oam_l = BANIM_OAML_notf_sw1,
        .pal = BANIM_PAL_notf_sw1,
    },

    [BANIM_51] = 
    {
        .abbr = "notm_ar1",
        .modes = BANIM_MODE_notm_ar1,
        .script = BANIM_SCR_notm_ar1,
        .oam_r = BANIM_OAMR_notm_ar1,
        .oam_l = BANIM_OAML_notm_ar1,
        .pal = BANIM_PAL_notm_ar1,
    },

    [BANIM_52] = 
    {
        .abbr = "notf_ar1",
        .modes = BANIM_MODE_notf_ar1,
        .script = BANIM_SCR_notf_ar1,
        .oam_r = BANIM_OAMR_notf_ar1,
        .oam_l = BANIM_OAML_notf_ar1,
        .pal = BANIM_PAL_notf_ar1,
    },

    [BANIM_53] = 
    {
        .abbr = "notm_ar1",
        .modes = BANIM_MODE_notm_ar1_2,
        .script = BANIM_SCR_notm_ar1_2,
        .oam_r = BANIM_OAMR_notm_ar1_2,
        .oam_l = BANIM_OAML_notm_ar1_2,
        .pal = BANIM_PAL_notf_ar1_2,
    },

    [BANIM_54] = 
    {
        .abbr = "notf_ar1",
        .modes = BANIM_MODE_notf_ar1_2,
        .script = BANIM_SCR_notf_ar1_2,
        .oam_r = BANIM_OAMR_notf_ar1_2,
        .oam_l = BANIM_OAML_notf_ar1_2,
        .pal = BANIM_PAL_notm_ar1_2,
    },

    [BANIM_55] = 
    {
        .abbr = "fifd_mg1",
        .modes = BANIM_MODE_fifd_mg1,
        .script = BANIM_SCR_fifd_mg1,
        .oam_r = BANIM_OAMR_fifd_mg1,
        .oam_l = BANIM_OAML_fifd_mg1,
        .pal = BANIM_PAL_fifd_mg1,
    },

    [BANIM_56] = 
    {
        .abbr = "swmm_sw1",
        .modes = BANIM_MODE_swmm_sw1,
        .script = BANIM_SCR_swmm_sw1,
        .oam_r = BANIM_OAMR_swmm_sw1,
        .oam_l = BANIM_OAML_swmm_sw1,
        .pal = BANIM_PAL_swmm_sw1,
    },

    [BANIM_57] = 
    {
        .abbr = "swmm_sw1",
        .modes = BANIM_MODE_swmm_sw1_2,
        .script = BANIM_SCR_swmm_sw1_2,
        .oam_r = BANIM_OAMR_swmm_sw1_2,
        .oam_l = BANIM_OAML_swmm_sw1_2,
        .pal = BANIM_PAL_swmm_sw1_2,
    },

    [BANIM_58] = 
    {
        .abbr = "swmf_sw1",
        .modes = BANIM_MODE_swmf_sw1,
        .script = BANIM_SCR_swmf_sw1,
        .oam_r = BANIM_OAMR_swmf_sw1,
        .oam_l = BANIM_OAML_swmf_sw1,
        .pal = BANIM_PAL_swmf_sw1,
    },

    [BANIM_59] = 
    {
        .abbr = "swmf_sw1",
        .modes = BANIM_MODE_swmf_sw1_2,
        .script = BANIM_SCR_swmf_sw1_2,
        .oam_r = BANIM_OAMR_swmf_sw1_2,
        .oam_l = BANIM_OAML_swmf_sw1_2,
        .pal = BANIM_PAL_swmf_sw1_2,
    },

    [BANIM_5A] = 
    {
        .abbr = "drum_mg1",
        .modes = BANIM_MODE_drum_mg1_2,
        .script = BANIM_SCR_drum_mg1_2,
        .oam_r = BANIM_OAMR_drum_mg1_2,
        .oam_l = BANIM_OAML_drum_mg1_2,
        .pal = BANIM_PAL_drum_mg1_2,
    },

    [BANIM_5B] = 
    {
        .abbr = "godd_mg1",
        .modes = BANIM_MODE_godd_mg1,
        .script = BANIM_SCR_godd_mg1,
        .oam_r = BANIM_OAMR_godd_mg1,
        .oam_l = BANIM_OAML_godd_mg1,
        .pal = BANIM_PAL_godd_mg1,
    },

    [BANIM_5C] = 
    {
        .abbr = "pirm_ax1",
        .modes = BANIM_MODE_pirm_ax1_3,
        .script = BANIM_SCR_pirm_ax1_3,
        .oam_r = BANIM_OAMR_pirm_ax1_3,
        .oam_l = BANIM_OAML_pirm_ax1_3,
        .pal = BANIM_PAL_pirm_ax1_3,
    },

    [BANIM_5D] = 
    {
        .abbr = "berm_ax1",
        .modes = BANIM_MODE_berm_ax1_3,
        .script = BANIM_SCR_berm_ax1_3,
        .oam_r = BANIM_OAMR_berm_ax1_3,
        .oam_l = BANIM_OAML_berm_ax1_3,
        .pal = BANIM_PAL_berm_ax1_3,
    },

    [BANIM_5E] = 
    {
        .abbr = "banm_ax1",
        .modes = BANIM_MODE_banm_ax1_3,
        .script = BANIM_SCR_banm_ax1_3,
        .oam_r = BANIM_OAMR_banm_ax1_3,
        .oam_l = BANIM_OAML_banm_ax1_3,
        .pal = BANIM_PAL_banm_ax1_3,
    },

    [BANIM_5F] = 
    {
        .abbr = "figm_ax1",
        .modes = BANIM_MODE_figm_ax1_3,
        .script = BANIM_SCR_figm_ax1_3,
        .oam_r = BANIM_OAMR_figm_ax1_3,
        .oam_l = BANIM_OAML_figm_ax1_3,
        .pal = BANIM_PAL_figm_ax1_3,
    },

    [BANIM_60] = 
    {
        .abbr = "bram_sw1",
        .modes = BANIM_MODE_bram_sw1_4,
        .script = BANIM_SCR_bram_sw1_4,
        .oam_r = BANIM_OAMR_bram_sw1_4,
        .oam_l = BANIM_OAML_bram_sw1_4,
        .pal = BANIM_PAL_bram_sw1_4,
    },

    [BANIM_61] = 
    {
        .abbr = "braf_sw1",
        .modes = BANIM_MODE_braf_sw1_4,
        .script = BANIM_SCR_braf_sw1_4,
        .oam_r = BANIM_OAMR_braf_sw1_4,
        .oam_l = BANIM_OAML_braf_sw1_4,
        .pal = BANIM_PAL_braf_sw1_4,
    },

    [BANIM_62] = 
    {
        .abbr = "pakm_sw1",
        .modes = BANIM_MODE_pakm_sw1_5,
        .script = BANIM_SCR_pakm_sw1_5,
        .oam_r = BANIM_OAMR_pakm_sw1_5,
        .oam_l = BANIM_OAML_pakm_sw1_5,
        .pal = BANIM_PAL_pakm_sw1_5,
    },

    [BANIM_63] = 
    {
        .abbr = "warm_ax1",
        .modes = BANIM_MODE_warm_ax1_3,
        .script = BANIM_SCR_warm_ax1_3,
        .oam_r = BANIM_OAMR_warm_ax1_3,
        .oam_l = BANIM_OAML_warm_ax1_3,
        .pal = BANIM_PAL_warm_ax1_3,
    },

    [BANIM_64] = 
    {
        .abbr = "drmm_sp1",
        .modes = BANIM_MODE_drmm_sp1,
        .script = BANIM_SCR_drmm_sp1,
        .oam_r = BANIM_OAMR_drmm_sp1,
        .oam_l = BANIM_OAML_drmm_sp1,
        .pal = BANIM_PAL_drmm_sp1,
    },

    [BANIM_65] = 
    {
        .abbr = "drmm_sp1",
        .modes = BANIM_MODE_drmm_sp1_2,
        .script = BANIM_SCR_drmm_sp1_2,
        .oam_r = BANIM_OAMR_drmm_sp1_2,
        .oam_l = BANIM_OAML_drmm_sp1_2,
        .pal = BANIM_PAL_drmm_sp1_2,
    },

    [BANIM_66] = 
    {
        .abbr = "drmm_sp1",
        .modes = BANIM_MODE_drmm_sp1_3,
        .script = BANIM_SCR_drmm_sp1_3,
        .oam_r = BANIM_OAMR_drmm_sp1_3,
        .oam_l = BANIM_OAML_drmm_sp1_3,
        .pal = BANIM_PAL_drmm_sp1_3,
    },

    [BANIM_67] = 
    {
        .abbr = "stam_ar1",
        .modes = BANIM_MODE_stam_ar1,
        .script = BANIM_SCR_stam_ar1,
        .oam_r = BANIM_OAMR_stam_ar1,
        .oam_l = BANIM_OAML_stam_ar1,
        .pal = BANIM_PAL_stam_ar1,
    },

    [BANIM_68] = 
    {
        .abbr = "genm_al1",
        .modes = BANIM_MODE_genm_al1,
        .script = BANIM_SCR_genm_al1,
        .oam_r = BANIM_OAMR_genm_al1,
        .oam_l = BANIM_OAML_genm_al1,
        .pal = BANIM_PAL_genm_al1,
    },

    [BANIM_69] = 
    {
        .abbr = "bism_mg1",
        .modes = BANIM_MODE_bism_mg1_3,
        .script = BANIM_SCR_bism_mg1_3,
        .oam_r = BANIM_OAMR_bism_mg1_3,
        .oam_l = BANIM_OAML_bism_mg1_3,
        .pal = BANIM_PAL_bism_mg1_3,
    },

    [BANIM_6A] = 
    {
        .abbr = "bisf_mg1",
        .modes = BANIM_MODE_bisf_mg1_3,
        .script = BANIM_SCR_bisf_mg1_3,
        .oam_r = BANIM_OAMR_bisf_mg1_3,
        .oam_l = BANIM_OAML_bisf_mg1_3,
        .pal = BANIM_PAL_bisf_mg1_3,
    },

    [BANIM_6B] = 
    {
        .abbr = "godd_he1",
        .modes = BANIM_MODE_godd_he1,
        .script = BANIM_SCR_godd_he1,
        .oam_r = BANIM_OAMR_godd_he1,
        .oam_l = BANIM_OAML_godd_he1,
        .pal = BANIM_PAL_godd_he1,
    },

    [BANIM_6C] = 
    {
        .abbr = "godd_hk1",
        .modes = BANIM_MODE_godd_hk1,
        .script = BANIM_SCR_godd_hk1,
        .oam_r = BANIM_OAMR_godd_hk1,
        .oam_l = BANIM_OAML_godd_hk1,
        .pal = BANIM_PAL_godd_hk1,
    },

    [BANIM_6D] = 
    {
        .abbr = "genm_al1",
        .modes = BANIM_MODE_genm_al1_2,
        .script = BANIM_SCR_genm_al1_2,
        .oam_r = BANIM_OAMR_genm_al1_2,
        .oam_l = BANIM_OAML_genm_al1_2,
        .pal = BANIM_PAL_genm_al1_2,
    },

    [BANIM_6E] = 
    {
        .abbr = "genm_al1",
        .modes = BANIM_MODE_genm_al1_3,
        .script = BANIM_SCR_genm_al1_3,
        .oam_r = BANIM_OAMR_genm_al1_3,
        .oam_l = BANIM_OAML_genm_al1_3,
        .pal = BANIM_PAL_genm_al1_3,
    },

    [BANIM_6F] = 
    {
        .abbr = "genm_al1",
        .modes = BANIM_MODE_genm_al1_4,
        .script = BANIM_SCR_genm_al1_4,
        .oam_r = BANIM_OAMR_genm_al1_4,
        .oam_l = BANIM_OAML_genm_al1_4,
        .pal = BANIM_PAL_genm_al1_4,
    },

    [BANIM_70] = 
    {
        .abbr = "druf_mg1",
        .modes = BANIM_MODE_druf_mg1,
        .script = BANIM_SCR_druf_mg1,
        .oam_r = BANIM_OAMR_druf_mg1,
        .oam_l = BANIM_OAML_druf_mg1,
        .pal = BANIM_PAL_druf_mg1,
    },

    [BANIM_71] = 
    {
        .abbr = "druf_mg1",
        .modes = BANIM_MODE_druf_mg1_2,
        .script = BANIM_SCR_druf_mg1_2,
        .oam_r = BANIM_OAMR_druf_mg1_2,
        .oam_l = BANIM_OAML_druf_mg1_2,
        .pal = BANIM_PAL_druf_mg1_3,
    },

    [BANIM_72] = 
    {
        .abbr = "fakf_sp1",
        .modes = BANIM_MODE_fakf_sp1_2,
        .script = BANIM_SCR_fakf_sp1_2,
        .oam_r = BANIM_OAMR_fakf_sp1_2,
        .oam_l = BANIM_OAML_fakf_sp1_2,
        .pal = BANIM_PAL_fakf_sp1_2,
    },

    [BANIM_73] = 
    {
        .abbr = "fakf_sp1",
        .modes = BANIM_MODE_fakf_sp1_3,
        .script = BANIM_SCR_fakf_sp1_3,
        .oam_r = BANIM_OAMR_fakf_sp1_3,
        .oam_l = BANIM_OAML_fakf_sp1_3,
        .pal = BANIM_PAL_fakf_sp1_3,
    },

    [BANIM_74] = 
    {
        .abbr = "magdd_mg1",
        .modes = BANIM_MODE_magdd_mg1,
        .script = BANIM_SCR_magdd_mg1,
        .oam_r = BANIM_OAMR_magdd_mg1,
        .oam_l = BANIM_OAML_magdd_mg1,
        .pal = BANIM_PAL_magdd_mg1,
    },

    [BANIM_75] = 
    {
        .abbr = "kinm_al1",
        .modes = BANIM_MODE_kinm_al1,
        .script = BANIM_SCR_kinm_al1,
        .oam_r = BANIM_OAMR_kinm_al1,
        .oam_l = BANIM_OAML_kinm_al1,
        .pal = BANIM_PAL_kinm_al1,
    },

    [BANIM_76] = 
    {
        .abbr = "snim_ar1",
        .modes = BANIM_MODE_snim_ar1_2,
        .script = BANIM_SCR_snim_ar1_2,
        .oam_r = BANIM_OAMR_snim_ar1_2,
        .oam_l = BANIM_OAML_snim_ar1_2,
        .pal = BANIM_PAL_snim_ar1_2,
    },

    [BANIM_77] = 
    {
        .abbr = "snif_ar1",
        .modes = BANIM_MODE_snif_ar1_2,
        .script = BANIM_SCR_snif_ar1_2,
        .oam_r = BANIM_OAMR_snif_ar1_2,
        .oam_l = BANIM_OAML_snif_ar1_2,
        .pal = BANIM_PAL_snif_ar1_2,
    },

    [BANIM_78] = 
    {
        .abbr = "sagm_mg1",
        .modes = BANIM_MODE_sagm_mg1_2,
        .script = BANIM_SCR_sagm_mg1_2,
        .oam_r = BANIM_OAMR_sagm_mg1_2,
        .oam_l = BANIM_OAML_sagm_mg1_2,
        .pal = BANIM_PAL_sagm_mg1_2,
    },

    [BANIM_79] = 
    {
        .abbr = "sagf_mg1",
        .modes = BANIM_MODE_sagf_mg1_2,
        .script = BANIM_SCR_sagf_mg1_2,
        .oam_r = BANIM_OAMR_sagf_mg1_2,
        .oam_l = BANIM_OAML_sagf_mg1_2,
        .pal = BANIM_PAL_sagf_mg1_2,
    },
};
