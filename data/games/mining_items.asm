MiningItemList:
	dbw REVIVE,       .Revive
	dbw ODD_KEYSTONE, .OddKeystone
	dbw MOON_STONE,   .MoonStone
	dbw LEAF_STONE,   .LeafStone
	dbw EVERSTONE,    .Everstone
	dbw STAR_PIECE,   .StarPiece
	dbw HARD_STONE,   .HardStone
	dbw HELIX_FOSSIL, .HelixFossil
	dbw DOME_FOSSIL,  .DomeFossil

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

.Everstone
	db 1
	dw .Everstone_1

.Everstone_1
	dw EverstoneGFX
	dw EverstonePal
	db 8, 4, 2
	db $00, $01, $02, $03
	db $04, $05, $06, $07

.StarPiece
	db 1
	dw .StarPiece_1

.StarPiece_1
	dw StarPieceGFX
	dw StarPiecePal
	db 5, 3, 3
	db $ff, $00, $ff
	db $01, $02, $03
	db $ff, $04, $ff

.HardStone
	db 1
	dw .HardStone_1

.HardStone_1
	dw HardStoneGFX
	dw HardStonePal
	db 4, 2, 2
	db $00, $01
	db $02, $03

.HelixFossil
	db 4
	dw .HelixFossil_1
	dw .HelixFossil_2
	dw .HelixFossil_3
	dw .HelixFossil_4

.HelixFossil_1
	dw HelixFossilGFX
	dw FossilPal
	db 14, 4, 4
	db $ff, $00, $01, $02
	db $03, $04, $05, $06
	db $07, $08, $09, $0a
	db $0b, $0c, $0d, $ff

.HelixFossil_2
	dw HelixFossilGFX_90
	dw FossilPal
	db 14, 4, 4
	db $00, $01, $02, $ff
	db $03, $04, $05, $06
	db $07, $08, $09, $0a
	db $ff, $0b, $0c, $0d

.HelixFossil_3
	dw HelixFossilGFX_180
	dw FossilPal
	db 14, 4, 4
	db $ff, $00, $01, $02
	db $03, $04, $05, $06
	db $07, $08, $09, $0a
	db $0b, $0c, $0d, $ff

.HelixFossil_4
	dw HelixFossilGFX_270
	dw FossilPal
	db 14, 4, 4
	db $00, $01, $02, $ff
	db $03, $04, $05, $06
	db $07, $08, $09, $0a
	db $ff, $0b, $0c, $0d

.DomeFossil
	db 1
	dw .DomeFossil_1

.DomeFossil_1
	dw DomeFossilGFX
	dw FossilPal
	db 15, 4, 4
	db $00, $01, $02, $03
	db $04, $05, $06, $07
	db $08, $09, $0a, $0b
	db $0c, $0d, $0e, $ff

ReviveGFX:          INCBIN "gfx/underground/items/revive.2bpp"
OddKeystoneGFX:     INCBIN "gfx/underground/items/odd_keystone.2bpp"
MoonStoneGFX:       INCBIN "gfx/underground/items/moon_stone.2bpp"
MoonStoneGFX_90:    INCBIN "gfx/underground/items/moon_stone_90.2bpp"
LeafStoneGFX:       INCBIN "gfx/underground/items/leaf_stone.2bpp"
LeafStoneGFX_90:    INCBIN "gfx/underground/items/leaf_stone_90.2bpp"
EverstoneGFX:       INCBIN "gfx/underground/items/everstone.2bpp"
StarPieceGFX:       INCBIN "gfx/underground/items/star_piece.2bpp"
HardStoneGFX:       INCBIN "gfx/underground/items/hard_stone.2bpp"
HelixFossilGFX:     INCBIN "gfx/underground/items/helix_fossil.2bpp"
HelixFossilGFX_90:  INCBIN "gfx/underground/items/helix_fossil_90.2bpp"
HelixFossilGFX_180: INCBIN "gfx/underground/items/helix_fossil_180.2bpp"
HelixFossilGFX_270: INCBIN "gfx/underground/items/helix_fossil_270.2bpp"
DomeFossilGFX:      INCBIN "gfx/underground/items/dome_fossil.2bpp"

RevivePal:
	RGB 31, 31, 21
	RGB 28, 27, 16
	RGB 14, 12, 11

OddKeystonePal:
	RGB 22, 21, 17
	RGB 19, 17, 15
	RGB 14, 12, 11

MoonStonePal:
	RGB 17, 19, 21
	RGB 15, 16, 17
	RGB 12, 13, 14

LeafStonePal:
	RGB 17, 19, 17
	RGB 09, 17, 12
	RGB 08, 10, 08

EverstonePal:
	RGB 22, 22, 20
	RGB 19, 19, 16
	RGB 14, 12, 11

StarPiecePal:
	RGB 29, 21, 16
	RGB 25, 14, 10
	RGB 14, 12, 11

HardStonePal:
	RGB 25, 25, 25
	RGB 19, 19, 19
	RGB 08, 08, 08

FossilPal:
	RGB 24, 21, 14
	RGB 19, 17, 12
	RGB 14, 12, 11
