#pragma once

#include "prelude.h"
#include "proc.h"
#include "text.h"

#define SIO_MAX_PACKET 0x80

#define SIO_MAX_PENDING_SEND 0x20
#define SIO_MAX_PENDING_RECV 0x10

enum
{
    SIO_MSG_14 = 0x14,
    SIO_MSG_15,
    SIO_MSG_16,
    SIO_MSG_17,
    SIO_MSG_18,
    SIO_MSG_19,
    SIO_MSG_1A,
    SIO_MSG_1B,
    SIO_MSG_1C,
    SIO_MSG_1D,
    SIO_MSG_DATA_ACK,
    SIO_MSG_DATA,
};

enum
{
    PLAYER_STATUS_0 = 0,
    PLAYER_STATUS_1 = 1,
    PLAYER_STATUS_2 = 2,
    PLAYER_STATUS_5 = 5,
};

struct SioBigSendProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ void (* func)(struct SioBigSendProc * proc);
    /* 30 */ void const * data;
    /* 34 */ u8 unk_34;
    /* 35 */ STRUCT_PAD(0x35, 0x36);
    /* 36 */ u16 block_count;
    /* 38 */ u16 current_block;
    /* 3A */ u8 last_block_len;
    /* 3B */ u8 completion_percent;
    /* 3C */ u8 unk_3C;
};

struct SioBigReceiveProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ void (* func)(struct SioBigReceiveProc * proc);
    /* 30 */ void * data;
    /* 34 */ u8 unk_34;
    /* 35 */ STRUCT_PAD(0x35, 0x36);
    /* 36 */ u16 block_count;
    /* 38 */ u16 current_block;
    /* 3A */ u8 last_block_len;
    /* 3B */ u8 completion_percent;
    /* 3C */ u8 unk_3C;
};

struct SioData
{
    /* 00 */ struct SioMessage head;
    /* 04 */ u16 len;
    /* 06 */ u8 bytes[SIO_MAX_PACKET];
    /* 86 */ STRUCT_PAD(0x86, 0x88);
};

struct SioPending
{
    /* 00 */ u8 unk_00;
    /* 01 */ STRUCT_PAD(0x01, 0x04);
    /* 04 */ struct SioData packet;
};

struct SioSt
{
    /* 0000 */ u8 unk_000;
    /* 0001 */ u8 unk_001;
    /* 0002 */ u16 last_sio_cnt;
    /* 0004 */ u16 unk_004;
    /* 0006 */ i8 self_id;
    /* 0007 */ u8 unk_007;
    /* 0008 */ u8 recv_flags;
    /* 0009 */ u8 unk_009;
    /* 000A */ u8 unk_00A;
    /* 000B */ u8 player_status[4];
    /* 000F */ u8 unk_00F;
    /* 0010 */ u8 unk_010;
    /* 0011 */ u8 unk_011;
    /* 0012 */ u16 last_recv[4];
    /* 001A */ u8 timeout_clock[4];
    /* 001E */ u8 unk_01E;
    /* 001F */ u8 unk_01F;
    /* 0020 */ u8 unk_020;
    /* 0021 */ u8 unk_021;
    /* 0022 */ u16 unk_022;
    /* 0024 */ u16 self_seq;
    /* 0026 */ u16 seq[4];
    /* 002E */ u8 unk_02E;
    /* 002F */ STRUCT_PAD(0x02F, 0x030);
    /* 0030 */ u16 unk_030;
    /* 0032 */ u16 buf[SIO_MAX_PACKET];
    /* 0132 */ STRUCT_PAD(0x132, 0x134);
    /* 0134 */ struct SioPending pending_send[SIO_MAX_PENDING_SEND];
    /* 0594 */ struct SioPending pending_recv[SIO_MAX_PENDING_RECV];
    /* 1B74 */ u8 next_pending_send;
    /* 1B75 */ u8 next_pending_write;
    /* 1B76 */ u8 next_pending_read;
    /* 1B77 */ u8 next_pending_recv;
    /* 1B78 */ u16 unk_1B78;
    /* 1B7A */ u16 unk_1B7A;
    /* 1B7C */ u16 unk_1B7C;
    /* 1B7E */ u16 unk_1B7E;
};

#define SIO_MAX_DATA (SIO_MAX_PACKET - 6)

struct LinkArenaSt
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ STRUCT_PAD(0x02, 0x03);
    /* 03 */ u8 unk_03;
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ u8 unk_06[4];
    /* 0A */ u8 unk_0A;
    /* 0B */ u8 unk_0B;
    /* 0C */ struct Text texts[11];
    /* 64 */ struct Text unk_64[7];
    /* 9C */ u8 linking_status[4];
    /* A0 */ u8 unk_A0;
    /* A1 */ u8 unk_A1[4][15];
};

extern struct SioSt EWRAM_DATA gSioStInstance;
extern struct SioSt * SHOULD_BE_CONST gSioSt;

extern u16 EWRAM_DATA gSioOutgoing[0x200];
extern u16 EWRAM_DATA gSioIncoming[0x200][4];

extern u32 gSioStateId;
extern struct SioMessage gSioMsgBuf;
extern int gUnk_Sio_030044D0;
extern int gUnk_Sio_030044D4;
extern u8 gUnk_Sio_03004580[SIO_MAX_PACKET];

extern struct LinkArenaSt gLinkArenaSt;

extern struct ProcScr CONST_DATA ProcScr_SioBigSend[];
extern struct ProcScr CONST_DATA ProcScr_SioBigReceive[];

int SioPollingMsg(void);
int GetSioIndex(void);
void func_fe6_080351F4(u16 arg_0, u16 sio_cnt, u16 arg_2);
void ResetSioSW(void);
void SioInit_SW(void);
void SioInit_HW(void);
void SioReleaseIrq(void);
void func_fe6_080354F0(void);
void func_fe6_08035734(void);
void func_fe6_08035880(void);
void func_fe6_080358A4(int num);
void func_fe6_080358DC(void);
void func_fe6_08035C54(void);
int func_fe6_08035C58(void);
int func_fe6_08035C84(void);
bool func_fe6_08035CB0(u8 player_id);
bool func_fe6_08035CD4(u8 player_id);
bool func_fe6_08035CF8(void);
int func_fe6_08035D4C(void);
bool func_fe6_08035D7C(void);
i16 SioSend(void const * src, u16 len);
i16 func_fe6_08035EC0(i8 player_id, void * dst);
int SioSend16(u16 * word, int arg_1);
int func_fe6_080360C4(int unused_0, u16 * arg_1);
void func_fe6_08036130(struct SioData * data);
struct SioData * func_fe6_080361A4(u32 * out);
int SioEmitData(u8 const * src, u16 len);
int SioReceiveData(void * dst, u8 * out_sender_id, bool (* verify)(void * dst));
void func_fe6_08036440(void);
void SetXmapTransferState(int state);
void func_fe6_080364A4(void);
void func_fe6_08036518(void);
void XMapTransfer_08036590(void);
void func_fe6_08036608(void);
void func_fe6_0803661C(struct SioBigSendProc * proc);
void func_fe6_0803667C(struct SioBigSendProc * proc);
void func_fe6_080366EC(struct SioBigReceiveProc * proc);
void func_fe6_08036714(struct SioBigReceiveProc * proc);
void func_fe6_08036758(struct SioBigReceiveProc * proc);
int StartSioBigSend(void * data, u32 len, void (* func)(struct SioBigSendProc * proc), u8 arg_3, ProcPtr parent);
void StartSioBigReceive(void * data, void (* func)(struct SioBigReceiveProc * proc), ProcPtr parent);
bool IsSioBigTransferActive(void);
