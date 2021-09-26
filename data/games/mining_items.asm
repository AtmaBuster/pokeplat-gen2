MiningItemList:
	dbw REVIVE,       .Revive      ; 01
	dbw ODD_KEYSTONE, .OddKeystone ; 02
	dbw MOON_STONE,   .MoonStone   ; 03
	dbw LEAF_STONE,   .LeafStone   ; 04
	dbw EVERSTONE,    .Everstone   ; 05
	dbw STAR_PIECE,   .StarPiece   ; 06
	dbw HARD_STONE,   .HardStone   ; 07
	dbw HELIX_FOSSIL, .HelixFossil ; 08
	dbw DOME_FOSSIL,  .DomeFossil  ; 09
	dbw MAX_REVIVE,   .MaxRevive   ; 0a
	dbw OLD_AMBER,    .OldAmber    ; 0b
	dbw ROOT_FOSSIL,  .RootFossil  ; 0c
	dbw CLAW_FOSSIL,  .ClawFossil  ; 0d
	dbw ARMOR_FOSSIL, .ArmorFossil ; 0e
	dbw SKULL_FOSSIL, .SkullFossil ; 0f
	dbw POKE_BALL,    .HeartScale  ; 10
	dbw FIRE_STONE,   .FireStone   ; 11
	dbw THICK_CLUB,   .ThickClub   ; 12
	dbw WATER_STONE,  .WaterStone  ; 13

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

.MaxRevive
	db 1
	dw .MaxRevive_1

.MaxRevive_1
	dw MaxReviveGFX
	dw MaxRevivePal
	db 9, 3, 3
	db $00, $01, $02
	db $03, $04, $05
	db $06, $07, $08

.OldAmber
	db 2
	dw .OldAmber_1
	dw .OldAmber_2

.OldAmber_1
	dw OldAmberGFX
	dw OldAmberPal
	db 14, 4, 4
	db $ff, $00, $01, $02
	db $03, $04, $05, $06
	db $07, $08, $09, $0a
	db $0b, $0c, $0d, $ff

.OldAmber_2
	dw OldAmberGFX_90
	dw OldAmberPal
	db 14, 4, 4
	db $00, $01, $02, $ff
	db $03, $04, $05, $06
	db $07, $08, $09, $0a
	db $ff, $0b, $0c, $0d

.RootFossil
	db 4
	dw .RootFossil_1
	dw .RootFossil_2
	dw .RootFossil_3
	dw .RootFossil_4

.RootFossil_1
	dw RootFossilGFX
	dw FossilPal
	db 16, 5, 5
	db $ff, $ff, $00, $01, $02
	db $ff, $ff, $03, $04, $05
	db $06, $ff, $ff, $07, $08
	db $09, $0a, $0b, $0c, $0d
	db $ff, $0e, $0f, $ff, $ff

.RootFossil_2
	dw RootFossilGFX_90
	dw FossilPal
	db 16, 5, 5
	db $ff, $00, $01, $ff, $ff
	db $02, $03, $ff, $ff, $ff
	db $04, $05, $ff, $06, $07
	db $ff, $08, $09, $0a, $0b
	db $ff, $0c, $0d, $0e, $0f

.RootFossil_3
	dw RootFossilGFX_180
	dw FossilPal
	db 16, 5, 5
	db $ff, $ff, $00, $01, $ff
	db $02, $03, $04, $05, $06
	db $07, $08, $ff, $ff, $09
	db $0a, $0b, $0c, $ff, $ff
	db $0d, $0e, $0f, $ff, $ff

.RootFossil_4
	dw RootFossilGFX_270
	dw FossilPal
	db 16, 5, 5
	db $00, $01, $02, $03, $ff
	db $04, $05, $06, $07, $ff
	db $08, $09, $ff, $0a, $0b
	db $ff, $ff, $ff, $0c, $0d
	db $ff, $ff, $0e, $0f, $ff

.ClawFossil
	db 4
	dw .ClawFossil_1
	dw .ClawFossil_2
	dw .ClawFossil_3
	dw .ClawFossil_4

.ClawFossil_1
	dw ClawFossilGFX
	dw FossilPal
	db 13, 4, 5
	db $ff, $ff, $00, $01
	db $ff, $02, $03, $04
	db $ff, $05, $06, $07
	db $08, $09, $0a, $ff
	db $0b, $0c, $ff, $ff

.ClawFossil_2
	dw ClawFossilGFX_90
	dw FossilPal
	db 13, 5, 4
	db $00, $01, $ff, $ff, $ff
	db $02, $03, $04, $05, $ff
	db $ff, $06, $07, $08, $09
	db $ff, $ff, $0a, $0b, $0c

.ClawFossil_3
	dw ClawFossilGFX_180
	dw FossilPal
	db 13, 4, 5
	db $ff, $ff, $00, $01
	db $ff, $02, $03, $04
	db $05, $06, $07, $ff
	db $08, $09, $0a, $ff
	db $0b, $0c, $ff, $ff

.ClawFossil_4
	dw ClawFossilGFX_270
	dw FossilPal
	db 13, 5, 4
	db $00, $01, $02, $ff, $ff
	db $03, $04, $05, $06, $ff
	db $ff, $07, $08, $09, $0a
	db $ff, $ff, $ff, $0b, $0c

.ArmorFossil
	db 1
	dw .ArmorFossil_1

.ArmorFossil_1
	dw ArmorFossilGFX
	dw FossilPal
	db 14, 5, 4
	db $ff, $00, $01, $02, $ff
	db $ff, $03, $04, $05, $ff
	db $06, $07, $08, $09, $0a
	db $ff, $0b, $0c, $0d, $ff

.SkullFossil
	db 1
	dw .SkullFossil_1

.SkullFossil_1
	dw SkullFossilGFX
	dw FossilPal
	db 14, 4, 4
	db $00, $01, $02, $03
	db $04, $05, $06, $07
	db $08, $09, $0a, $0b
	db $ff, $0c, $0d, $ff

.HeartScale
	db 1
	dw .HeartScale_1

.HeartScale_1
	dw HeartScaleGFX
	dw HeartScalePal
	db 3, 2, 2
	db $00, $ff
	db $01, $02

.FireStone
	db 1
	dw .FireStone_1

.FireStone_1
	dw FireStoneGFX
	dw FireStonePal
	db 9, 3, 3
	db $00, $01, $02
	db $03, $04, $05
	db $06, $07, $08

.ThickClub
	db 2
	dw .ThickClub_1
	dw .ThickClub_2

.ThickClub_1
	dw ThickClubGFX
	dw ThickClubPal
	db 10, 6, 3
	db $00, $ff, $ff, $ff, $ff, $01
	db $02, $03, $04, $05, $06, $07
	db $08, $ff, $ff, $ff, $ff, $09

.ThickClub_2
	dw ThickClubGFX_90
	dw ThickClubPal
	db 10, 3, 6
	db $00, $01, $02
	db $ff, $03, $ff
	db $ff, $04, $ff
	db $ff, $05, $ff
	db $ff, $06, $ff
	db $07, $08, $09

.WaterStone
	db 1
	dw .WaterStone_1

.WaterStone_1
	dw WaterStoneGFX
	dw WaterStonePal
	db 8, 3, 3
	db $00, $01, $02
	db $03, $04, $05
	db $06, $07, $ff

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
MaxReviveGFX:       INCBIN "gfx/underground/items/max_revive.2bpp"
OldAmberGFX:        INCBIN "gfx/underground/items/old_amber.2bpp"
OldAmberGFX_90:     INCBIN "gfx/underground/items/old_amber_90.2bpp"
RootFossilGFX:      INCBIN "gfx/underground/items/root_fossil.2bpp"
RootFossilGFX_90:   INCBIN "gfx/underground/items/root_fossil_90.2bpp"
RootFossilGFX_180:  INCBIN "gfx/underground/items/root_fossil_180.2bpp"
RootFossilGFX_270:  INCBIN "gfx/underground/items/root_fossil_270.2bpp"
ClawFossilGFX:      INCBIN "gfx/underground/items/claw_fossil.2bpp"
ClawFossilGFX_90:   INCBIN "gfx/underground/items/claw_fossil_90.2bpp"
ClawFossilGFX_180:  INCBIN "gfx/underground/items/claw_fossil_180.2bpp"
ClawFossilGFX_270:  INCBIN "gfx/underground/items/claw_fossil_270.2bpp"
ArmorFossilGFX:     INCBIN "gfx/underground/items/armor_fossil.2bpp"
SkullFossilGFX:     INCBIN "gfx/underground/items/skull_fossil.2bpp"
HeartScaleGFX:      INCBIN "gfx/underground/items/heart_scale.2bpp"
FireStoneGFX:       INCBIN "gfx/underground/items/fire_stone.2bpp"
ThickClubGFX:       INCBIN "gfx/underground/items/thick_club.2bpp"
ThickClubGFX_90:    INCBIN "gfx/underground/items/thick_club_90.2bpp"
WaterStoneGFX:      INCBIN "gfx/underground/items/water_stone.2bpp"

collast EQUS "PAL_COLOR_SIZE, PAL_COLOR_SIZE * 3"

RevivePal:      INCBIN "gfx/underground/items/revive.gbcpal", collast
OddKeystonePal: INCBIN "gfx/underground/items/odd_keystone.gbcpal", collast
MoonStonePal:   INCBIN "gfx/underground/items/moon_stone.gbcpal", collast
LeafStonePal:   INCBIN "gfx/underground/items/leaf_stone.gbcpal", collast
EverstonePal:   INCBIN "gfx/underground/items/everstone.gbcpal", collast
StarPiecePal:   INCBIN "gfx/underground/items/star_piece.gbcpal", collast
HardStonePal:   INCBIN "gfx/underground/items/hard_stone.gbcpal", collast
FossilPal:      INCBIN "gfx/underground/items/helix_fossil.gbcpal", collast
MaxRevivePal:   INCBIN "gfx/underground/items/max_revive.gbcpal", collast
OldAmberPal:    INCBIN "gfx/underground/items/old_amber.gbcpal", collast
HeartScalePal:  INCBIN "gfx/underground/items/heart_scale.gbcpal", collast
FireStonePal:   INCBIN "gfx/underground/items/fire_stone.gbcpal", collast
ThickClubPal:   INCBIN "gfx/underground/items/thick_club.gbcpal", collast
WaterStonePal:  INCBIN "gfx/underground/items/water_stone.gbcpal", collast
