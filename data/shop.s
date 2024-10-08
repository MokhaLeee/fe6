	.data

	.global Sprite_ShopGoldBox
Sprite_ShopGoldBox: @ 08691158
	.incbin "fe6-base.gba", 0x691158, (0x691190 - 0x691158) @ length: 0038

	.global ProcScr_GoldBox
ProcScr_GoldBox: @ 08691190
	.incbin "fe6-base.gba", 0x691190, (0x6911A0 - 0x691190) @ length: 0018

	.global ProcScr_ShopDrawHand
ProcScr_ShopDrawHand: @ 086911A0
	.incbin "fe6-base.gba", 0x6911A0, (0x6911A8 - 0x6911A0) @ length: 0004

	.global gpShopSt
gpShopSt: @ 086911A8
	.incbin "fe6-base.gba", 0x6911A8, (0x6911AC - 0x6911A8) @ length: 0004
