#include "prelude.h"
#include "face.h"
#include "constants/faces.h"

struct FaceInfo CONST_DATA FaceInfoTable[] = {
	[FID_01 - 1] = {
		.img = Img_Portrait_0860D0D8,
		.img_chibi = Img_Portrait_0860D474,
		.pal = Img_Portrait_0860D474,
		.x_mouth = 2,
		.y_mouth = 4,
		.unk_0E = 1
	},
	[FID_02 - 1] = {
		.img = Img_Portrait_0860D494,
		.img_chibi = Img_Portrait_0860DBC0,
		.pal = Pal_Portrait_0860DDC0,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_03 - 1] = {
		.img = Img_Portrait_0860DDE0,
		.img_chibi = Img_Portrait_0860E538,
		.pal = Pal_Portrait_0860E738,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_04 - 1] = {
		.img = Img_Portrait_0860E758,
		.img_chibi = Img_Portrait_0860EE20,
		.pal = Pal_Portrait_0860F020,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_05 - 1] = {
		.img = Img_Portrait_0860F040,
		.img_chibi = Img_Portrait_0860F7DC,
		.pal = Pal_Portrait_0860F9DC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_06 - 1] = {
		.img = Img_Portrait_0860F9FC,
		.img_chibi = Img_Portrait_08610180,
		.pal = Pal_Portrait_08610380,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_07 - 1] = {
		.img = Img_Portrait_086103A0,
		.img_chibi = Img_Portrait_08610C7C,
		.pal = Pal_Portrait_08610E7C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_08 - 1] = {
		.img = Img_Portrait_08610E9C,
		.img_chibi = Img_Portrait_086115FC,
		.pal = Pal_Portrait_086117FC,
		.x_mouth = 2,
		.y_mouth = 4,
		.unk_0E = 0
	},
	[FID_09 - 1] = {
		.img = Img_Portrait_0861181C,
		.img_chibi = Img_Portrait_086120C0,
		.pal = Pal_Portrait_086122C0,
		.x_mouth = 2,
		.y_mouth = 4,
		.unk_0E = 0
	},
	[FID_0A - 1] = {
		.img = Img_Portrait_086122E0,
		.img_chibi = Img_Portrait_08612CF0,
		.pal = Pal_Portrait_08612EF0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_0B - 1] = {
		.img = Img_Portrait_08612F10,
		.img_chibi = Img_Portrait_086136D4,
		.pal = Pal_Portrait_086138D4,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_0C - 1] = {
		.img = Img_Portrait_086138F4,
		.img_chibi = Img_Portrait_08613FC0,
		.pal = Pal_Portrait_086141C0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_0D - 1] = {
		.img = Img_Portrait_086141E0,
		.img_chibi = Img_Portrait_08614A88,
		.pal = Pal_Portrait_08614C88,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_0E - 1] = {
		.img = Img_Portrait_08614CA8,
		.img_chibi = Img_Portrait_08615400,
		.pal = Pal_Portrait_08615600,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_0F - 1] = {
		.img = Img_Portrait_08615620,
		.img_chibi = Img_Portrait_08615D5C,
		.pal = Pal_Portrait_08615F5C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_10 - 1] = {
		.img = Img_Portrait_08615F7C,
		.img_chibi = Img_Portrait_08616688,
		.pal = Pal_Portrait_08616888,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_11 - 1] = {
		.img = Img_Portrait_086168A8,
		.img_chibi = Img_Portrait_08616F88,
		.pal = Pal_Portrait_08617188,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_12 - 1] = {
		.img = Img_Portrait_086171A8,
		.img_chibi = Img_Portrait_086179A0,
		.pal = Pal_Portrait_08617BA0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_13 - 1] = {
		.img = Img_Portrait_08617BC0,
		.img_chibi = Img_Portrait_08618390,
		.pal = Pal_Portrait_08618590,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_14 - 1] = {
		.img = Img_Portrait_086185B0,
		.img_chibi = Img_Portrait_08618D98,
		.pal = Pal_Portrait_08618F98,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_15 - 1] = {
		.img = Img_Portrait_08618FB8,
		.img_chibi = Img_Portrait_086197C4,
		.pal = Pal_Portrait_086199C4,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_16 - 1] = {
		.img = Img_Portrait_086199E4,
		.img_chibi = Img_Portrait_0861A184,
		.pal = Pal_Portrait_0861A384,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_17 - 1] = {
		.img = Img_Portrait_0861A3A4,
		.img_chibi = Img_Portrait_0861AB6C,
		.pal = Pal_Portrait_0861AD6C,
		.x_mouth = 2,
		.y_mouth = 4,
		.unk_0E = 0
	},
	[FID_18 - 1] = {
		.img = Img_Portrait_0861AD8C,
		.img_chibi = Img_Portrait_0861B5A4,
		.pal = Pal_Portrait_0861B7A4,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_19 - 1] = {
		.img = Img_Portrait_0861B7C4,
		.img_chibi = Img_Portrait_0861BF90,
		.pal = Pal_Portrait_0861C190,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_1A - 1] = {
		.img = Img_Portrait_0861C1B0,
		.img_chibi = Img_Portrait_0861CA1C,
		.pal = Pal_Portrait_0861CC1C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_1B - 1] = {
		.img = Img_Portrait_0861CC3C,
		.img_chibi = Img_Portrait_0861D474,
		.pal = Pal_Portrait_0861D674,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_1C - 1] = {
		.img = Img_Portrait_0861D694,
		.img_chibi = Img_Portrait_0861DF1C,
		.pal = Pal_Portrait_0861E11C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_1D - 1] = {
		.img = Img_Portrait_0861E13C,
		.img_chibi = Img_Portrait_0861E86C,
		.pal = Pal_Portrait_0861EA6C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_1E - 1] = {
		.img = Img_Portrait_0861EA8C,
		.img_chibi = Img_Portrait_0861F310,
		.pal = Pal_Portrait_0861F510,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_1F - 1] = {
		.img = Img_Portrait_0861F530,
		.img_chibi = Img_Portrait_0861FD28,
		.pal = Pal_Portrait_0861FF28,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_20 - 1] = {
		.img = Img_Portrait_0861FF48,
		.img_chibi = Img_Portrait_08620868,
		.pal = Pal_Portrait_08620A68,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_21 - 1] = {
		.img = Img_Portrait_08620A88,
		.img_chibi = Img_Portrait_08621170,
		.pal = Pal_Portrait_08621370,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_22 - 1] = {
		.img = Img_Portrait_08621390,
		.img_chibi = Img_Portrait_08621B3C,
		.pal = Pal_Portrait_08621D3C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_23 - 1] = {
		.img = Img_Portrait_08621D5C,
		.img_chibi = Img_Portrait_0862259C,
		.pal = Pal_Portrait_0862279C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_24 - 1] = {
		.img = Img_Portrait_086227BC,
		.img_chibi = Img_Portrait_08622F28,
		.pal = Pal_Portrait_08623128,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_25 - 1] = {
		.img = Img_Portrait_08623148,
		.img_chibi = Img_Portrait_08623804,
		.pal = Pal_Portrait_08623A04,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_26 - 1] = {
		.img = Img_Portrait_08623A24,
		.img_chibi = Img_Portrait_0862422C,
		.pal = Pal_Portrait_0862442C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_27 - 1] = {
		.img = Img_Portrait_0862444C,
		.img_chibi = Img_Portrait_08624C14,
		.pal = Pal_Portrait_08624E14,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_28 - 1] = {
		.img = Img_Portrait_08624E34,
		.img_chibi = Img_Portrait_0862556C,
		.pal = Pal_Portrait_0862576C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_29 - 1] = {
		.img = Img_Portrait_0862578C,
		.img_chibi = Img_Portrait_08625ED4,
		.pal = Pal_Portrait_086260D4,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_2A - 1] = {
		.img = Img_Portrait_086260F4,
		.img_chibi = Img_Portrait_086268B8,
		.pal = Pal_Portrait_08626AB8,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_2B - 1] = {
		.img = Img_Portrait_08626AD8,
		.img_chibi = Img_Portrait_086272C0,
		.pal = Pal_Portrait_086274C0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_2C - 1] = {
		.img = Img_Portrait_086274E0,
		.img_chibi = Img_Portrait_08627C40,
		.pal = Pal_Portrait_08627E40,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_2D - 1] = {
		.img = Img_Portrait_08627E60,
		.img_chibi = Img_Portrait_086285C4,
		.pal = Pal_Portrait_086287C4,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_2E - 1] = {
		.img = Img_Portrait_086287E4,
		.img_chibi = Img_Portrait_08628F8C,
		.pal = Pal_Portrait_0862918C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_2F - 1] = {
		.img = Img_Portrait_086291AC,
		.img_chibi = Img_Portrait_08629A5C,
		.pal = Pal_Portrait_08629C5C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_30 - 1] = {
		.img = Img_Portrait_08629C7C,
		.img_chibi = Img_Portrait_0862A454,
		.pal = Pal_Portrait_0862A654,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_31 - 1] = {
		.img = Img_Portrait_0862A674,
		.img_chibi = Img_Portrait_0862AE2C,
		.pal = Pal_Portrait_0862B02C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_32 - 1] = {
		.img = Img_Portrait_0862B04C,
		.img_chibi = Img_Portrait_0862B850,
		.pal = Pal_Portrait_0862BA50,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_33 - 1] = {
		.img = Img_Portrait_0862BA70,
		.img_chibi = Img_Portrait_0862C39C,
		.pal = Pal_Portrait_0862C59C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_34 - 1] = {
		.img = Img_Portrait_0862C5BC,
		.img_chibi = Img_Portrait_0862CE08,
		.pal = Pal_Portrait_0862D008,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_35 - 1] = {
		.img = Img_Portrait_0862D028,
		.img_chibi = Img_Portrait_0862D9D0,
		.pal = Pal_Portrait_0862DBD0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_36 - 1] = {
		.img = Img_Portrait_0862DBF0,
		.img_chibi = Img_Portrait_0862E4EC,
		.pal = Pal_Portrait_0862E6EC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_37 - 1] = {
		.img = Img_Portrait_0862E70C,
		.img_chibi = Img_Portrait_0862EEE8,
		.pal = Pal_Portrait_0862F0E8,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_38 - 1] = {
		.img = Img_Portrait_0862F108,
		.img_chibi = Img_Portrait_0862F988,
		.pal = Pal_Portrait_0862FB88,
		.x_mouth = 3,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_39 - 1] = {
		.img = Img_Portrait_0862FBA8,
		.img_chibi = Img_Portrait_08630414,
		.pal = Pal_Portrait_08630614,
		.x_mouth = 3,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_3A - 1] = {
		.img = Img_Portrait_08630634,
		.img_chibi = Img_Portrait_08630E60,
		.pal = Pal_Portrait_08631060,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_3B - 1] = {
		.img = Img_Portrait_08631080,
		.img_chibi = Img_Portrait_08631974,
		.pal = Pal_Portrait_08631B74,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_3C - 1] = {
		.img = Img_Portrait_08631B94,
		.img_chibi = Img_Portrait_0863238C,
		.pal = Pal_Portrait_0863258C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_3D - 1] = {
		.img = Img_Portrait_086325AC,
		.img_chibi = Img_Portrait_08632D64,
		.pal = Pal_Portrait_08632F64,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_3E - 1] = {
		.img = Img_Portrait_08632F84,
		.img_chibi = Img_Portrait_08633768,
		.pal = Pal_Portrait_08633968,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_3F - 1] = {
		.img = Img_Portrait_08633988,
		.img_chibi = Img_Portrait_08634188,
		.pal = Pal_Portrait_08634388,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_40 - 1] = {
		.img = Img_Portrait_086343A8,
		.img_chibi = Img_Portrait_08634B04,
		.pal = Pal_Portrait_08634D04,
		.x_mouth = 3,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_41 - 1] = {
		.img = Img_Portrait_08634D24,
		.img_chibi = Img_Portrait_0863554C,
		.pal = Pal_Portrait_0863574C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_42 - 1] = {
		.img = Img_Portrait_0863576C,
		.img_chibi = Img_Portrait_08635FF8,
		.pal = Pal_Portrait_086361F8,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_43 - 1] = {
		.img = Img_Portrait_08636218,
		.img_chibi = Img_Portrait_086369A0,
		.pal = Pal_Portrait_08636BA0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_44 - 1] = {
		.img = Img_Portrait_08636BC0,
		.img_chibi = Img_Portrait_0863740C,
		.pal = Pal_Portrait_0863760C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_45 - 1] = {
		.img = Img_Portrait_0863762C,
		.img_chibi = Img_Portrait_08637D3C,
		.pal = Pal_Portrait_08637F3C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_46 - 1] = {
		.img = Img_Portrait_08637F5C,
		.img_chibi = Img_Portrait_0863882C,
		.pal = Pal_Portrait_08638A2C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_47 - 1] = {
		.img = Img_Portrait_08638A4C,
		.img_chibi = Img_Portrait_086393C8,
		.pal = Pal_Portrait_086395C8,
		.x_mouth = 2,
		.y_mouth = 4,
		.unk_0E = 0
	},
	[FID_48 - 1] = {
		.img = Img_Portrait_086395E8,
		.img_chibi = Img_Portrait_08639E68,
		.pal = Pal_Portrait_0863A068,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_49 - 1] = {
		.img = Img_Portrait_0863A088,
		.img_chibi = Img_Portrait_0863AAEC,
		.pal = Pal_Portrait_0863ACEC,
		.x_mouth = 4,
		.y_mouth = 4,
		.unk_0E = 0
	},
	[FID_4A - 1] = {
		.img = Img_Portrait_0863AD0C,
		.img_chibi = Img_Portrait_0863B424,
		.pal = Pal_Portrait_0863B624,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_4B - 1] = {
		.img = Img_Portrait_0863B644,
		.img_chibi = Img_Portrait_0863BCA0,
		.pal = Pal_Portrait_0863BEA0,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_4C - 1] = {
		.img = Img_Portrait_0863BEC0,
		.img_chibi = Img_Portrait_0863C74C,
		.pal = Pal_Portrait_0863C94C,
		.x_mouth = 3,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_4D - 1] = {
		.img = Img_Portrait_0863C96C,
		.img_chibi = Img_Portrait_0863D168,
		.pal = Pal_Portrait_0863D368,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_4E - 1] = {
		.img = Img_Portrait_0863D388,
		.img_chibi = Img_Portrait_0863DB2C,
		.pal = Pal_Portrait_0863DD2C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_4F - 1] = {
		.img = Img_Portrait_0863DD4C,
		.img_chibi = Img_Portrait_0863E530,
		.pal = Pal_Portrait_0863E730,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_50 - 1] = {
		.img = Img_Portrait_0863E750,
		.img_chibi = Img_Portrait_0863ED74,
		.pal = Img_Portrait_0863ED74,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_51 - 1] = {
		.img = Img_Portrait_0863ED94,
		.img_chibi = Img_Portrait_0863F5C8,
		.pal = Pal_Portrait_0863F7C8,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_52 - 1] = {
		.img = Img_Portrait_0863F7E8,
		.img_chibi = Img_Portrait_0863FED0,
		.pal = Img_Portrait_0863FED0,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_53 - 1] = {
		.img = Img_Portrait_0863FEF0,
		.img_chibi = Img_Portrait_08640568,
		.pal = Img_Portrait_08640568,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_54 - 1] = {
		.img = Img_Portrait_08640588,
		.img_chibi = Img_Portrait_08640D20,
		.pal = Pal_Portrait_08640F20,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_55 - 1] = {
		.img = Img_Portrait_08640F40,
		.img_chibi = Img_Portrait_08641498,
		.pal = Img_Portrait_08641498,
		.x_mouth = 3,
		.y_mouth = 3,
		.unk_0E = 0
	},
	[FID_56 - 1] = {
		.img = Img_Portrait_086414B8,
		.img_chibi = Img_Portrait_08641CA0,
		.pal = Pal_Portrait_08641EA0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_57 - 1] = {
		.img = Img_Portrait_08641EC0,
		.img_chibi = Img_Portrait_086426E4,
		.pal = Pal_Portrait_086428E4,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_58 - 1] = {
		.img = Img_Portrait_08642904,
		.img_chibi = Img_Portrait_086432E0,
		.pal = Pal_Portrait_086434E0,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_59 - 1] = {
		.img = Img_Portrait_08643500,
		.img_chibi = Img_Portrait_08643D2C,
		.pal = Img_Portrait_08643D2C,
		.x_mouth = 3,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_5A - 1] = {
		.img = Img_Portrait_08643D4C,
		.img_chibi = Img_Portrait_0864439C,
		.pal = Img_Portrait_0864439C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_5B - 1] = {
		.img = Img_Portrait_086443BC,
		.img_chibi = Img_Portrait_08644990,
		.pal = Img_Portrait_08644990,
		.x_mouth = 2,
		.y_mouth = 7,
		.unk_0E = 1
	},
	[FID_5C - 1] = {
		.img = Img_Portrait_086449B0,
		.img_chibi = Img_Portrait_0864505C,
		.pal = Img_Portrait_0864505C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_5D - 1] = {
		.img = Img_Portrait_0864507C,
		.img_chibi = Img_Portrait_0864579C,
		.pal = Img_Portrait_0864579C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_5E - 1] = {
		.img = Img_Portrait_086457BC,
		.img_chibi = Img_Portrait_08645E20,
		.pal = Img_Portrait_08645E20,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_5F - 1] = {
		.img = Img_Portrait_08645E40,
		.img_chibi = Img_Portrait_08646498,
		.pal = Img_Portrait_08646498,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_60 - 1] = {
		.img = Img_Portrait_086464B8,
		.img_chibi = Img_Portrait_08646B84,
		.pal = Img_Portrait_08646B84,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_61 - 1] = {
		.img = Img_Portrait_08646BA4,
		.img_chibi = Img_Portrait_086472B4,
		.pal = Img_Portrait_086472B4,
		.x_mouth = 2,
		.y_mouth = 7,
		.unk_0E = 1
	},
	[FID_62 - 1] = {
		.img = Img_Portrait_086472D4,
		.img_chibi = Img_Portrait_08647A28,
		.pal = Img_Portrait_08647A28,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_63 - 1] = {
		.img = Img_Portrait_08647A48,
		.img_chibi = Img_Portrait_086480FC,
		.pal = Img_Portrait_086480FC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_64 - 1] = {
		.img = Img_Portrait_0864811C,
		.img_chibi = Img_Portrait_086487AC,
		.pal = Img_Portrait_086487AC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_65 - 1] = {
		.img = Img_Portrait_086487CC,
		.img_chibi = Img_Portrait_08648E58,
		.pal = Img_Portrait_08648E58,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_66 - 1] = {
		.img = Img_Portrait_08648E78,
		.img_chibi = Img_Portrait_08649494,
		.pal = Img_Portrait_08649494,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_67 - 1] = {
		.img = Img_Portrait_086494B4,
		.img_chibi = Img_Portrait_08649AC8,
		.pal = Img_Portrait_08649AC8,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_68 - 1] = {
		.img = Img_Portrait_08649AE8,
		.img_chibi = Img_Portrait_0864A1CC,
		.pal = Img_Portrait_0864A1CC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_69 - 1] = {
		.img = Img_Portrait_086449B0,
		.img_chibi = Img_Portrait_0864505C,
		.pal = Pal_Portrait_0864A1EC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_6A - 1] = {
		.img = Img_Portrait_0864507C,
		.img_chibi = Img_Portrait_0864579C,
		.pal = Pal_Portrait_0864A20C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_6B - 1] = {
		.img = Img_Portrait_086457BC,
		.img_chibi = Img_Portrait_08645E20,
		.pal = Pal_Portrait_0864A22C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_6C - 1] = {
		.img = Img_Portrait_08645E40,
		.img_chibi = Img_Portrait_08646498,
		.pal = Pal_Portrait_0864A24C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_6D - 1] = {
		.img = Img_Portrait_086464B8,
		.img_chibi = Img_Portrait_08646B84,
		.pal = Pal_Portrait_0864A26C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_6E - 1] = {
		.img = Img_Portrait_08646BA4,
		.img_chibi = Img_Portrait_086472B4,
		.pal = Pal_Portrait_0864A28C,
		.x_mouth = 2,
		.y_mouth = 7,
		.unk_0E = 0
	},
	[FID_6F - 1] = {
		.img = Img_Portrait_086472D4,
		.img_chibi = Img_Portrait_08647A28,
		.pal = Pal_Portrait_0864A2AC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_70 - 1] = {
		.img = Img_Portrait_08647A48,
		.img_chibi = Img_Portrait_086480FC,
		.pal = Pal_Portrait_0864A2CC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_71 - 1] = {
		.img = Img_Portrait_0864811C,
		.img_chibi = Img_Portrait_086487AC,
		.pal = Pal_Portrait_0864A2EC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_72 - 1] = {
		.img = Img_Portrait_086487CC,
		.img_chibi = Img_Portrait_08648E58,
		.pal = Pal_Portrait_0864A30C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_73 - 1] = {
		.img = Img_Portrait_08648E78,
		.img_chibi = Img_Portrait_08649494,
		.pal = Pal_Portrait_0864A32C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_74 - 1] = {
		.img = Img_Portrait_086494B4,
		.img_chibi = Img_Portrait_08649AC8,
		.pal = Pal_Portrait_0864A34C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_75 - 1] = {
		.img = Img_Portrait_086449B0,
		.img_chibi = Img_Portrait_0864505C,
		.pal = Pal_Portrait_0864A36C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_76 - 1] = {
		.img = Img_Portrait_0864507C,
		.img_chibi = Img_Portrait_0864579C,
		.pal = Pal_Portrait_0864A38C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_77 - 1] = {
		.img = Img_Portrait_086457BC,
		.img_chibi = Img_Portrait_08645E20,
		.pal = Pal_Portrait_0864A3AC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_78 - 1] = {
		.img = Img_Portrait_08645E40,
		.img_chibi = Img_Portrait_08646498,
		.pal = Pal_Portrait_0864A3CC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_79 - 1] = {
		.img = Img_Portrait_086464B8,
		.img_chibi = Img_Portrait_08646B84,
		.pal = Pal_Portrait_0864A3EC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_7A - 1] = {
		.img = Img_Portrait_08646BA4,
		.img_chibi = Img_Portrait_086472B4,
		.pal = Pal_Portrait_0864A40C,
		.x_mouth = 2,
		.y_mouth = 7,
		.unk_0E = 0
	},
	[FID_7B - 1] = {
		.img = Img_Portrait_086472D4,
		.img_chibi = Img_Portrait_08647A28,
		.pal = Pal_Portrait_0864A42C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_7C - 1] = {
		.img = Img_Portrait_08647A48,
		.img_chibi = Img_Portrait_086480FC,
		.pal = Pal_Portrait_0864A44C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_7D - 1] = {
		.img = Img_Portrait_0864811C,
		.img_chibi = Img_Portrait_086487AC,
		.pal = Pal_Portrait_0864A46C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_7E - 1] = {
		.img = Img_Portrait_086487CC,
		.img_chibi = Img_Portrait_08648E58,
		.pal = Pal_Portrait_0864A48C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_7F - 1] = {
		.img = Img_Portrait_08648E78,
		.img_chibi = Img_Portrait_08649494,
		.pal = Pal_Portrait_0864A4AC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_80 - 1] = {
		.img = Img_Portrait_086494B4,
		.img_chibi = Img_Portrait_08649AC8,
		.pal = Pal_Portrait_0864A4CC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_81 - 1] = {
		.img = Img_Portrait_086449B0,
		.img_chibi = Img_Portrait_0864505C,
		.pal = Pal_Portrait_0864A4EC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_82 - 1] = {
		.img = Img_Portrait_0864507C,
		.img_chibi = Img_Portrait_0864579C,
		.pal = Pal_Portrait_0864A50C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_83 - 1] = {
		.img = Img_Portrait_086457BC,
		.img_chibi = Img_Portrait_08645E20,
		.pal = Pal_Portrait_0864A52C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_84 - 1] = {
		.img = Img_Portrait_08645E40,
		.img_chibi = Img_Portrait_08646498,
		.pal = Pal_Portrait_0864A54C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_85 - 1] = {
		.img = Img_Portrait_086464B8,
		.img_chibi = Img_Portrait_08646B84,
		.pal = Pal_Portrait_0864A56C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_86 - 1] = {
		.img = Img_Portrait_08646BA4,
		.img_chibi = Img_Portrait_086472B4,
		.pal = Pal_Portrait_0864A58C,
		.x_mouth = 2,
		.y_mouth = 7,
		.unk_0E = 0
	},
	[FID_87 - 1] = {
		.img = Img_Portrait_086472D4,
		.img_chibi = Img_Portrait_08647A28,
		.pal = Pal_Portrait_0864A5AC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_88 - 1] = {
		.img = Img_Portrait_08647A48,
		.img_chibi = Img_Portrait_086480FC,
		.pal = Pal_Portrait_0864A5CC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_89 - 1] = {
		.img = Img_Portrait_0864811C,
		.img_chibi = Img_Portrait_086487AC,
		.pal = Pal_Portrait_0864A5EC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_8A - 1] = {
		.img = Img_Portrait_086487CC,
		.img_chibi = Img_Portrait_08648E58,
		.pal = Pal_Portrait_0864A60C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_8B - 1] = {
		.img = Img_Portrait_08648E78,
		.img_chibi = Img_Portrait_08649494,
		.pal = Pal_Portrait_0864A62C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_8C - 1] = {
		.img = Img_Portrait_086494B4,
		.img_chibi = Img_Portrait_08649AC8,
		.pal = Pal_Portrait_0864A64C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_8D - 1] = {
		.img = Img_Portrait_086449B0,
		.img_chibi = Img_Portrait_0864505C,
		.pal = Pal_Portrait_0864A66C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_8E - 1] = {
		.img = Img_Portrait_0864507C,
		.img_chibi = Img_Portrait_0864579C,
		.pal = Pal_Portrait_0864A68C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_8F - 1] = {
		.img = Img_Portrait_086457BC,
		.img_chibi = Img_Portrait_08645E20,
		.pal = Pal_Portrait_0864A6AC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_90 - 1] = {
		.img = Img_Portrait_08645E40,
		.img_chibi = Img_Portrait_08646498,
		.pal = Pal_Portrait_0864A6CC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_91 - 1] = {
		.img = Img_Portrait_086464B8,
		.img_chibi = Img_Portrait_08646B84,
		.pal = Pal_Portrait_0864A6EC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_92 - 1] = {
		.img = Img_Portrait_08646BA4,
		.img_chibi = Img_Portrait_086472B4,
		.pal = Pal_Portrait_0864A70C,
		.x_mouth = 2,
		.y_mouth = 7,
		.unk_0E = 0
	},
	[FID_93 - 1] = {
		.img = Img_Portrait_086472D4,
		.img_chibi = Img_Portrait_08647A28,
		.pal = Pal_Portrait_0864A72C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_94 - 1] = {
		.img = Img_Portrait_08647A48,
		.img_chibi = Img_Portrait_086480FC,
		.pal = Pal_Portrait_0864A74C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_95 - 1] = {
		.img = Img_Portrait_0864811C,
		.img_chibi = Img_Portrait_086487AC,
		.pal = Pal_Portrait_0864A76C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_96 - 1] = {
		.img = Img_Portrait_086487CC,
		.img_chibi = Img_Portrait_08648E58,
		.pal = Pal_Portrait_0864A78C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_97 - 1] = {
		.img = Img_Portrait_08648E78,
		.img_chibi = Img_Portrait_08649494,
		.pal = Pal_Portrait_0864A7AC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_98 - 1] = {
		.img = Img_Portrait_086494B4,
		.img_chibi = Img_Portrait_08649AC8,
		.pal = Pal_Portrait_0864A7CC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_99 - 1] = {
		.img = Img_Portrait_0864A7EC,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864ADB4,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_9A - 1] = {
		.img = Img_Portrait_0864ADD4,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864B32C,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_9B - 1] = {
		.img = Img_Portrait_0864B34C,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864BA94,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_9C - 1] = {
		.img = Img_Portrait_0864BAB4,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864C294,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_9D - 1] = {
		.img = Img_Portrait_0864C2B4,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864CA08,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_9E - 1] = {
		.img = Img_Portrait_0864CA28,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864D244,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_9F - 1] = {
		.img = Img_Portrait_0864D264,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864D82C,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A0 - 1] = {
		.img = Img_Portrait_0864D84C,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864DE68,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A1 - 1] = {
		.img = Img_Portrait_0864DE88,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864E470,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A2 - 1] = {
		.img = Img_Portrait_0864E490,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864EB18,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A3 - 1] = {
		.img = Img_Portrait_0864EB38,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864F1F8,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A4 - 1] = {
		.img = Img_Portrait_0864F218,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864F8AC,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A5 - 1] = {
		.img = Img_Portrait_0864F8CC,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0864FF40,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A6 - 1] = {
		.img = Img_Portrait_0864FF60,
		.img_chibi = NULL,
		.pal = Pal_Portrait_086506D4,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A7 - 1] = {
		.img = Img_Portrait_086506F4,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08650F94,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A8 - 1] = {
		.img = Img_Portrait_08650FB4,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0865189C,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_A9 - 1] = {
		.img = Img_Portrait_086518BC,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08652010,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_AA - 1] = {
		.img = Img_Portrait_08652030,
		.img_chibi = NULL,
		.pal = Pal_Portrait_086527E4,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_AB - 1] = {
		.img = Img_Portrait_08652804,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08652F5C,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_AC - 1] = {
		.img = Img_Portrait_08652F7C,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08653700,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_AD - 1] = {
		.img = Img_Portrait_08653720,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08653FFC,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_AE - 1] = {
		.img = Img_Portrait_0865401C,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08654928,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_AF - 1] = {
		.img = Img_Portrait_08654948,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0865514C,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B0 - 1] = {
		.img = Img_Portrait_0865516C,
		.img_chibi = NULL,
		.pal = Pal_Portrait_086559C0,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B1 - 1] = {
		.img = Img_Portrait_086559E0,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08655FF4,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B2 - 1] = {
		.img = Img_Portrait_08656014,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08656748,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B3 - 1] = {
		.img = Img_Portrait_08656768,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08656F90,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B4 - 1] = {
		.img = Img_Portrait_08656FB0,
		.img_chibi = NULL,
		.pal = Pal_Portrait_0865779C,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B5 - 1] = {
		.img = Img_Portrait_086577BC,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08657D28,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B6 - 1] = {
		.img = Img_Portrait_08657D48,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08658684,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B7 - 1] = {
		.img = Img_Portrait_086586A4,
		.img_chibi = NULL,
		.pal = Pal_Portrait_08658C7C,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B8 - 1] = {
		.img = Img_Portrait_08658C9C,
		.img_chibi = NULL,
		.pal = Pal_Portrait_086592AC,
		.x_mouth = 0,
		.y_mouth = 0,
		.unk_0E = 0
	},
	[FID_B9 - 1] = {
		.img = Img_Portrait_086592CC,
		.img_chibi = Img_Portrait_086598FC,
		.pal = Img_Portrait_086598FC,
		.x_mouth = 3,
		.y_mouth = 2,
		.unk_0E = 0
	},
	[FID_BA - 1] = {
		.img = Img_Portrait_0865991C,
		.img_chibi = Img_Portrait_08659F08,
		.pal = Img_Portrait_08659F08,
		.x_mouth = 3,
		.y_mouth = 2,
		.unk_0E = 0
	},
	[FID_BB - 1] = {
		.img = Img_Portrait_08659F28,
		.img_chibi = Img_Portrait_0865A57C,
		.pal = Img_Portrait_0865A57C,
		.x_mouth = 3,
		.y_mouth = 3,
		.unk_0E = 0
	},
	[FID_BC - 1] = {
		.img = Img_Portrait_0865A59C,
		.img_chibi = Img_Portrait_0865ABF4,
		.pal = Img_Portrait_0865ABF4,
		.x_mouth = 3,
		.y_mouth = 3,
		.unk_0E = 0
	},
	[FID_BD - 1] = {
		.img = Img_Portrait_0865AC14,
		.img_chibi = Img_Portrait_0865B3F4,
		.pal = Pal_Portrait_0865B5F4,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_BE - 1] = {
		.img = Img_Portrait_0865B614,
		.img_chibi = Img_Portrait_0865C064,
		.pal = Pal_Portrait_0865C264,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_BF - 1] = {
		.img = Img_Portrait_0865C284,
		.img_chibi = Img_Portrait_0865CCA8,
		.pal = Img_Portrait_0865CCA8,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_C0 - 1] = {
		.img = Img_Portrait_0865CCC8,
		.img_chibi = Img_Portrait_0865D46C,
		.pal = Img_Portrait_0865D46C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_C1 - 1] = {
		.img = Img_Portrait_0865D48C,
		.img_chibi = Img_Portrait_0865DB2C,
		.pal = Img_Portrait_0865DB2C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 1
	},
	[FID_C2 - 1] = {
		.img = Img_Portrait_0865D48C,
		.img_chibi = Img_Portrait_0865DB2C,
		.pal = Pal_Portrait_0865DB4C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_C3 - 1] = {
		.img = Img_Portrait_0865D48C,
		.img_chibi = Img_Portrait_0865DB2C,
		.pal = Pal_Portrait_0865DB6C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_C4 - 1] = {
		.img = Img_Portrait_0865D48C,
		.img_chibi = Img_Portrait_0865DB2C,
		.pal = Pal_Portrait_0865DB8C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_C5 - 1] = {
		.img = Img_Portrait_0865DBAC,
		.img_chibi = Img_Portrait_0865E390,
		.pal = Pal_Portrait_0865E590,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 1
	},
	[FID_C6 - 1] = {
		.img = Img_Portrait_0865DBAC,
		.img_chibi = Img_Portrait_0865E390,
		.pal = Pal_Portrait_0865E5B0,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_C7 - 1] = {
		.img = Img_Portrait_0865DBAC,
		.img_chibi = Img_Portrait_0865E390,
		.pal = Pal_Portrait_0865E5D0,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_C8 - 1] = {
		.img = Img_Portrait_0865DBAC,
		.img_chibi = Img_Portrait_0865E390,
		.pal = Pal_Portrait_0865E5F0,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_C9 - 1] = {
		.img = Img_Portrait_0865E610,
		.img_chibi = Img_Portrait_0865EEAC,
		.pal = Pal_Portrait_0865F0AC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_CA - 1] = {
		.img = Img_Portrait_0865E610,
		.img_chibi = Img_Portrait_0865EEAC,
		.pal = Pal_Portrait_0865F0CC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_CB - 1] = {
		.img = Img_Portrait_0865E610,
		.img_chibi = Img_Portrait_0865EEAC,
		.pal = Pal_Portrait_0865F0EC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_CC - 1] = {
		.img = Img_Portrait_0865E610,
		.img_chibi = Img_Portrait_0865EEAC,
		.pal = Pal_Portrait_0865F10C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_CD - 1] = {
		.img = Img_Portrait_0865F12C,
		.img_chibi = Img_Portrait_0865F8DC,
		.pal = Pal_Portrait_0865FADC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_CE - 1] = {
		.img = Img_Portrait_0865F12C,
		.img_chibi = Img_Portrait_0865F8DC,
		.pal = Pal_Portrait_0865FAFC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_CF - 1] = {
		.img = Img_Portrait_0865F12C,
		.img_chibi = Img_Portrait_0865F8DC,
		.pal = Pal_Portrait_0865FB1C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D0 - 1] = {
		.img = Img_Portrait_0865F12C,
		.img_chibi = Img_Portrait_0865F8DC,
		.pal = Pal_Portrait_0865FB3C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D1 - 1] = {
		.img = Img_Portrait_08632F84,
		.img_chibi = Img_Portrait_08633768,
		.pal = Pal_Portrait_0865FB5C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D2 - 1] = {
		.img = Img_Portrait_08632F84,
		.img_chibi = Img_Portrait_08633768,
		.pal = Pal_Portrait_0865FB7C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D3 - 1] = {
		.img = Img_Portrait_08632F84,
		.img_chibi = Img_Portrait_08633768,
		.pal = Pal_Portrait_0865FB9C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D4 - 1] = {
		.img = Img_Portrait_086343A8,
		.img_chibi = Img_Portrait_08634B04,
		.pal = Pal_Portrait_0865FBBC,
		.x_mouth = 3,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D5 - 1] = {
		.img = Img_Portrait_086343A8,
		.img_chibi = Img_Portrait_08634B04,
		.pal = Pal_Portrait_0865FBDC,
		.x_mouth = 3,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D6 - 1] = {
		.img = Img_Portrait_086343A8,
		.img_chibi = Img_Portrait_08634B04,
		.pal = Pal_Portrait_0865FBFC,
		.x_mouth = 3,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_D7 - 1] = {
		.img = Img_Portrait_0863F7E8,
		.img_chibi = Img_Portrait_0863FED0,
		.pal = Pal_Portrait_0865FC1C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_D8 - 1] = {
		.img = Img_Portrait_0863F7E8,
		.img_chibi = Img_Portrait_0863FED0,
		.pal = Pal_Portrait_0865FC3C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_D9 - 1] = {
		.img = Img_Portrait_0863F7E8,
		.img_chibi = Img_Portrait_0863FED0,
		.pal = Pal_Portrait_0865FC5C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_DA - 1] = {
		.img = Img_Portrait_0863F7E8,
		.img_chibi = Img_Portrait_0863FED0,
		.pal = Pal_Portrait_0865FC7C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_DB - 1] = {
		.img = Img_Portrait_0863F7E8,
		.img_chibi = Img_Portrait_0863FED0,
		.pal = Pal_Portrait_0865FC9C,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_DC - 1] = {
		.img = Img_Portrait_0863F7E8,
		.img_chibi = Img_Portrait_0863FED0,
		.pal = Pal_Portrait_0865FCBC,
		.x_mouth = 4,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_DD - 1] = {
		.img = Img_Portrait_08636BC0,
		.img_chibi = Img_Portrait_0863740C,
		.pal = Pal_Portrait_0865FCDC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_DE - 1] = {
		.img = Img_Portrait_08636BC0,
		.img_chibi = Img_Portrait_0863740C,
		.pal = Pal_Portrait_0865FCFC,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_DF - 1] = {
		.img = Img_Portrait_08636BC0,
		.img_chibi = Img_Portrait_0863740C,
		.pal = Pal_Portrait_0865FD1C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_E0 - 1] = {
		.img = Img_Portrait_08636218,
		.img_chibi = Img_Portrait_086369A0,
		.pal = Pal_Portrait_0865FD3C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_E1 - 1] = {
		.img = Img_Portrait_08636218,
		.img_chibi = Img_Portrait_086369A0,
		.pal = Pal_Portrait_0865FD5C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_E2 - 1] = {
		.img = Img_Portrait_08636218,
		.img_chibi = Img_Portrait_086369A0,
		.pal = Pal_Portrait_0865FD7C,
		.x_mouth = 2,
		.y_mouth = 5,
		.unk_0E = 0
	},
	[FID_E3 - 1] = {
		.img = Img_Portrait_0865FD9C,
		.img_chibi = Img_Portrait_086604DC,
		.pal = Pal_Portrait_086606DC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_E4 - 1] = {
		.img = Img_Portrait_0865FD9C,
		.img_chibi = Img_Portrait_086604DC,
		.pal = Pal_Portrait_086606FC,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_E5 - 1] = {
		.img = Img_Portrait_0865FD9C,
		.img_chibi = Img_Portrait_086604DC,
		.pal = Pal_Portrait_0866071C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
	[FID_E6 - 1] = {
		.img = Img_Portrait_0865FD9C,
		.img_chibi = Img_Portrait_086604DC,
		.pal = Pal_Portrait_0866073C,
		.x_mouth = 2,
		.y_mouth = 6,
		.unk_0E = 0
	},
};
