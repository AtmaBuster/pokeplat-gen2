MiningItemList:
	dbw REVIVE,       .Revive
	dbw ODD_KEYSTONE, .OddKeystone
	dbw MOON_STONE,   .MoonStone
	dbw LEAF_STONE,   .LeafStone

.Revive
	db 1
	dw .Revive_1

.Revive_1
	dw ReviveGFX
	dw RevivePal
	db 5, 3, 3
	db $ff, $00, $ff
	db $01, $02, $03
	db $ff, $04, $ff

.OddKeystone
	db 1
	dw .OddKeystone_1

.OddKeystone_1
	dw OddKeystoneGFX
	dw OddKeystonePal
	db 16, 4, 4
	db $00, $01, $02, $03
	db $04, $05, $06, $07
	db $08, $09, $0a, $0b
	db $0c, $0d, $0e, $0f

.MoonStone
	db 2
	dw .MoonStone_1
	dw .MoonStone_2

.MoonStone_1
	dw MoonStoneGFX
	dw MoonStonePal
	db 6, 4, 2
	db $ff, $00, $01, $02
	db $03, $04, $05, $ff

.MoonStone_2
	dw MoonStoneGFX_90
	dw MoonStonePal
	db 6, 2, 4
	db $00, $ff
	db $01, $02
	db $03, $04
	db $ff, $05

.LeafStone
	db 2
	dw .LeafStone_1
	dw .LeafStone_2

.LeafStone_1
	dw LeafStoneGFX
	dw LeafStonePal
	db 8, 3, 4
	db $ff, $00, $ff
	db $01, $02, $03
	db $04, $05, $06
	db $ff, $07, $ff

.LeafStone_2
	dw LeafStoneGFX_90
	dw LeafStonePal
	db 8, 4, 3
	db $ff, $00, $01, $ff
	db $02, $03, $04, $05
	db $ff, $06, $07, $ff

ReviveGFX: INCBIN "gfx/underground/items/revive.2bpp"
RevivePal:
	RGB 31, 31, 21
	RGB 28, 27, 16
	RGB 14, 12, 11

OddKeystoneGFX: INCBIN "gfx/underground/items/odd_keystone.2bpp"
OddKeystonePal:
	RGB 22, 21, 17
	RGB 19, 17, 15
	RGB 14, 12, 11

MoonStoneGFX: INCBIN "gfx/underground/items/moon_stone.2bpp"
MoonStoneGFX_90: INCBIN "gfx/underground/items/moon_stone_90.2bpp"
MoonStonePal:
	RGB 17, 19, 21
	RGB 15, 16, 17
	RGB 12, 13, 14

LeafStoneGFX: INCBIN "gfx/underground/items/leaf_stone.2bpp"
LeafStoneGFX_90: INCBIN "gfx/underground/items/leaf_stone_90.2bpp"
LeafStonePal:
	RGB 17, 19, 17
	RGB 09, 17, 12
	RGB 08, 10, 08
