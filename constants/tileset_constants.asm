; Tilesets indexes (see data/tilesets.asm)
	const_def 1
	const TILESET_SINNOH_1             ; 01 WEST SINNOH 1 (TWINLEAF, SANDGEM, JUBILIFE)
	const TILESET_SINNOH_2             ; 02 WEST SINNOH 2 (OREBURGH, CANALAVE)
	const TILESET_SINNOH_3             ; 03 WEST SINNOH 3 (FLOAROMA, ETERNA)
	const TILESET_PLAYERS_ROOM         ; 04 TWINLEAF 2F
	const TILESET_PLAYERS_HOUSE        ; 05 TWINLEAF 1F
	const TILESET_HOUSE                ; 06 INTERIOR
	const TILESET_MODERN_INTERIOR      ; 07 CITY APARTMENTS
	const TILESET_LAKE                 ; 08 LAKES & SENDOFF SPRING
	const TILESET_LAB                  ; 09 ROWAN'S LAB
	const TILESET_POKECENTER           ; 0a POKEMON CENTER
	const TILESET_MART                 ; 0b DEPARTMENT STORE
	const TILESET_POKECOM_CENTER       ; 0c GLOBAL TRADE STATION
	const TILESET_GYM_1                ; 0d OREBURGH GYM
	const TILESET_MUSEUM               ; 0e MINING MUSEUM
	const TILESET_MANSION              ; 0f APARTMENT BUILDING
	const TILESET_CAVE                 ; 10 ASSORTED CAVES
	const TILESET_GATE                 ; 11 GATEHOUSES
	const TILESET_MEADOW               ; 12 FLOAROMA MEADOW
	const TILESET_FOREST               ; 13 ETERNA FOREST
	const TILESET_FACILITY             ; 14 GALACTIC HIDEOUT
	const TILESET_BIKE_SHOP            ; 15 BIKE SHOP
	const TILESET_PARK                 ; 16 AMITY SQUARE
	const TILESET_RADIO_TOWER          ; 17 REPLACES CONTEST HALL
	const TILESET_SOLACEON_RUINS       ; 18 SOLACEON RUINS
	const TILESET_TRADITIONAL_HOUSE    ; 19 CELESIC HOUSE
	const TILESET_GAME_CORNER          ; 1a VEILSTONE GAME CORNER
	const TILESET_SNOWPOINT_TEMPLE     ; 1b SNOWPOINT TEMPLE
	const TILESET_MT_CORONET           ; 1c MT. CORONET
	const TILESET_OLD_CHATEAU          ; 1d OLD CHATEAU
	const TILESET_CAVE_2			   ; 1e CAVES #2
	const TILESET_GYM_2				   ; 1f ETERNA GYM

; bg palette values (see gfx/tilesets/*_palette_map.asm)
; TilesetBGPalette indexes (see gfx/tilesets/bg_tiles.pal)
	const_def
	const PAL_BG_GRAY   ; 0
	const PAL_BG_RED    ; 1
	const PAL_BG_GREEN  ; 2
	const PAL_BG_WATER  ; 3
	const PAL_BG_YELLOW ; 4
	const PAL_BG_BROWN  ; 5
	const PAL_BG_ROOF   ; 6
	const PAL_BG_TEXT   ; 7

const_value set $80
	const PAL_BG_PRIORITY_GRAY   ; 80
	const PAL_BG_PRIORITY_RED    ; 81
	const PAL_BG_PRIORITY_GREEN  ; 82
	const PAL_BG_PRIORITY_WATER  ; 83
	const PAL_BG_PRIORITY_YELLOW ; 84
	const PAL_BG_PRIORITY_BROWN  ; 85
	const PAL_BG_PRIORITY_ROOF   ; 86
	const PAL_BG_PRIORITY_TEXT   ; 87
