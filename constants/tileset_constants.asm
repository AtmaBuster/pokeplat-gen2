; Tilesets indexes (see data/tilesets.asm)
	const_def 1
	const TILESET_SINNOH_1             ; 01 WEST SINNOH 1 (TWINLEAF, SANDGEM, JUBILIFE)
	const TILESET_SINNOH_2             ; 02 WEST SINNOH 2 (OREBURGH, ETERNA)
	const TILESET_PLAYERS_ROOM         ; 03 TWINLEAF 2F
	const TILESET_PLAYERS_HOUSE        ; 04 TWINLEAF 1F
	const TILESET_HOUSE                ; 05 INTERIOR
	const TILESET_MODERN_INTERIOR      ; 06 CITY APARTMENTS
	const TILESET_LAKE                 ; 07 LAKES & SENDOFF SPRING
	const TILESET_LAB                  ; 08 ROWAN'S LAB
	const TILESET_POKECENTER           ; 09 POKEMON CENTER
	const TILESET_MART                 ; 0a DEPARTMENT STORE
	const TILESET_POKECOM_CENTER       ; 0b GLOBAL TRADE STATION
	const TILESET_MANSION              ; 0c APARTMENT BUILDING
	const TILESET_CAVE                 ; 0d ASSORTED CAVES
	const TILESET_GATE                 ; 0e GATEHOUSES
	const TILESET_FOREST               ; 0f ETERNA FOREST
	const TILESET_FACILITY             ; 10 GALACTIC HIDEOUT
	const TILESET_BIKE_SHOP            ; 11 BIKE SHOP
	const TILESET_PARK                 ; 12 AMITY SQUARE
	const TILESET_RADIO_TOWER          ; 13 REPLACES CONTEST HALL
	const TILESET_SOLACEON_RUINS       ; 14 SOLACEON RUINS
	const TILESET_TRADITIONAL_HOUSE    ; 15 CELESIC HOUSE
	const TILESET_GAME_CORNER          ; 16 VEILSTONE GAME CORNER
	const TILESET_SNOWPOINT_TEMPLE     ; 17 SNOWPOINT TEMPLE
	const TILESET_MT_CORONET           ; 18 MT. CORONET

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
