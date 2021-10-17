tilepal: MACRO
; used in gfx/tilesets/*_palette_map.asm
; vram bank, pals
x = \1 << OAM_TILE_BANK
rept _NARG + -1
	db (x | PAL_BG_\2)
	shift
endr
ENDM

Tileset0PalMap:
TilesetSinnoh1PalMap:
INCLUDE "gfx/tilesets/sinnoh_1_palette_map.asm"

TilesetSinnoh2PalMap:
INCLUDE "gfx/tilesets/sinnoh_2_palette_map.asm"

TilesetPlayersRoomPalMap:
INCLUDE "gfx/tilesets/players_room_palette_map.asm"

TilesetPlayersHousePalMap:
INCLUDE "gfx/tilesets/players_house_palette_map.asm"

TilesetHousePalMap:
INCLUDE "gfx/tilesets/house_palette_map.asm"

TilesetLakePalMap:
INCLUDE "gfx/tilesets/lake_palette_map.asm"

TilesetLabPalMap:
INCLUDE "gfx/tilesets/lab_palette_map.asm"

TilesetPokecenterPalMap:
INCLUDE "gfx/tilesets/pokecenter_palette_map.asm"

TilesetMartPalMap:
INCLUDE "gfx/tilesets/mart_palette_map.asm"

TilesetPokeComCenterPalMap:
INCLUDE "gfx/tilesets/pokecom_center_palette_map.asm"

TilesetMansionPalMap:
INCLUDE "gfx/tilesets/mansion_palette_map.asm"

TilesetCavePalMap:
INCLUDE "gfx/tilesets/cave_palette_map.asm"

TilesetGatePalMap:
INCLUDE "gfx/tilesets/gate_palette_map.asm"

TilesetForestPalMap:
INCLUDE "gfx/tilesets/forest_palette_map.asm"

TilesetFacilityPalMap:
INCLUDE "gfx/tilesets/facility_palette_map.asm"

TilesetBikeShopPalMap:
INCLUDE "gfx/tilesets/bike_shop_palette_map.asm"

TilesetParkPalMap:
INCLUDE "gfx/tilesets/park_palette_map.asm"

TilesetRadioTowerPalMap:
INCLUDE "gfx/tilesets/radio_tower_palette_map.asm"

TilesetSolaceonRuinsPalMap:
INCLUDE "gfx/tilesets/solaceon_ruins_palette_map.asm"

TilesetTraditionalHousePalMap:
INCLUDE "gfx/tilesets/traditional_house_palette_map.asm"

TilesetGameCornerPalMap:
INCLUDE "gfx/tilesets/game_corner_palette_map.asm"

TilesetSnowpointTemplePalMap:
INCLUDE "gfx/tilesets/snowpoint_temple_palette_map.asm"

TilesetMtCoronetPalMap:
INCLUDE "gfx/tilesets/mt_coronet_palette_map.asm"

; unused
rept 26
	db $06
endr
