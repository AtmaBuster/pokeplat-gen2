tilecoll: MACRO
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX
;---------------------------------------
Tileset0GFX:
INCBIN "gfx/tilesets/sinnoh_1.2bpp.lz"

Tileset0Meta:
INCBIN "data/tilesets/sinnoh_1_metatiles.bin"

Tileset0Coll:
INCLUDE "data/tilesets/sinnoh_1_collision.asm"
;---------------------------------------
TilesetSinnoh1GFX:
INCBIN "gfx/tilesets/sinnoh_1.2bpp.lz"

TilesetSinnoh1Meta:
INCBIN "data/tilesets/sinnoh_1_metatiles.bin"

TilesetSinnoh1Coll:
INCLUDE "data/tilesets/sinnoh_1_collision.asm"
;---------------------------------------
TilesetSinnoh2GFX:
INCBIN "gfx/tilesets/sinnoh_2.2bpp.lz"

TilesetSinnoh2Meta:
INCBIN "data/tilesets/sinnoh_2_metatiles.bin"

TilesetSinnoh2Coll:
INCLUDE "data/tilesets/sinnoh_2_collision.asm"
;---------------------------------------

SECTION "Tileset Data 2", ROMX
;---------------------------------------
TilesetPlayersRoomGFX:
INCBIN "gfx/tilesets/players_room.2bpp.lz"

TilesetPlayersRoomMeta:
INCBIN "data/tilesets/players_room_metatiles.bin"

TilesetPlayersRoomColl:
INCLUDE "data/tilesets/players_room_collision.asm"
;---------------------------------------
TilesetPlayersHouseGFX:
INCBIN "gfx/tilesets/players_house.2bpp.lz"

TilesetPlayersHouseMeta:
INCBIN "data/tilesets/players_house_metatiles.bin"

TilesetPlayersHouseColl:
INCLUDE "data/tilesets/players_house_collision.asm"
;---------------------------------------
TilesetHouseGFX:
INCBIN "gfx/tilesets/house.2bpp.lz"

TilesetHouseMeta:
INCBIN "data/tilesets/house_metatiles.bin"

TilesetHouseColl:
INCLUDE "data/tilesets/house_collision.asm"
;---------------------------------------
TilesetModernInteriorGFX:
INCBIN "gfx/tilesets/modern_interior.2bpp.lz"

TilesetModernInteriorMeta:
INCBIN "data/tilesets/modern_interior_metatiles.bin"

TilesetModernInteriorColl:
INCLUDE "data/tilesets/modern_interior_collision.asm"
;---------------------------------------
TilesetLakeGFX:
INCBIN "gfx/tilesets/lake.2bpp.lz"

TilesetLakeMeta:
INCBIN "data/tilesets/lake_metatiles.bin"

TilesetLakeColl:
INCLUDE "data/tilesets/lake_collision.asm"
;---------------------------------------
TilesetLabGFX:
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabMeta:
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl:
INCLUDE "data/tilesets/lab_collision.asm"
;---------------------------------------
TilesetPokecenterGFX:
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta:
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl:
INCLUDE "data/tilesets/pokecenter_collision.asm"
;---------------------------------------

SECTION "Tileset Data 3", ROMX

;---------------------------------------
TilesetMartGFX:
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta:
INCBIN "data/tilesets/mart_metatiles.bin"

TilesetMartColl:
INCLUDE "data/tilesets/mart_collision.asm"
;---------------------------------------
TilesetPokeComCenterGFX:
INCBIN "gfx/tilesets/pokecom_center.2bpp.lz"

TilesetPokeComCenterMeta:
INCBIN "data/tilesets/pokecom_center_metatiles.bin"

TilesetPokeComCenterColl:
INCLUDE "data/tilesets/pokecom_center_collision.asm"
;---------------------------------------
TilesetGym1GFX:
INCBIN "gfx/tilesets/gym_1.2bpp.lz"

TilesetGym1Meta:
INCBIN "data/tilesets/gym_1_metatiles.bin"

TilesetGym1Coll:
INCLUDE "data/tilesets/gym_1_collision.asm"
;---------------------------------------
TilesetMuseumGFX:
INCBIN "gfx/tilesets/museum.2bpp.lz"

TilesetMuseumMeta:
INCBIN "data/tilesets/museum_metatiles.bin"

TilesetMuseumColl:
INCLUDE "data/tilesets/museum_collision.asm"
;---------------------------------------
TilesetMansionGFX:
INCBIN "gfx/tilesets/mansion.2bpp.lz"

TilesetMansionMeta:
INCBIN "data/tilesets/mansion_metatiles.bin"

TilesetMansionColl:
INCLUDE "data/tilesets/mansion_collision.asm"
;---------------------------------------

SECTION "Tileset Data 4", ROMX

;---------------------------------------
TilesetCaveGFX:
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveMeta:
INCBIN "data/tilesets/cave_metatiles.bin"

TilesetCaveColl:
INCLUDE "data/tilesets/cave_collision.asm"
;---------------------------------------
TilesetGateGFX:
INCBIN "gfx/tilesets/gate.2bpp.lz"

TilesetGateMeta:
INCBIN "data/tilesets/gate_metatiles.bin"

TilesetGateColl:
INCLUDE "data/tilesets/gate_collision.asm"
;---------------------------------------
TilesetFacilityGFX:
INCBIN "gfx/tilesets/facility.2bpp.lz"

TilesetFacilityMeta:
INCBIN "data/tilesets/facility_metatiles.bin"

TilesetFacilityColl:
INCLUDE "data/tilesets/facility_collision.asm"
;---------------------------------------
TilesetBikeShopGFX:
INCBIN "gfx/tilesets/bike_shop.2bpp.lz"

TilesetBikeShopMeta:
INCBIN "data/tilesets/bike_shop_metatiles.bin"

TilesetBikeShopColl:
INCLUDE "data/tilesets/bike_shop_collision.asm"
;---------------------------------------
TilesetParkGFX:
INCBIN "gfx/tilesets/park.2bpp.lz"

TilesetParkMeta:
INCBIN "data/tilesets/park_metatiles.bin"

TilesetParkColl:
INCLUDE "data/tilesets/park_collision.asm"
;---------------------------------------
TilesetRadioTowerGFX:
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"

TilesetRadioTowerMeta:
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl:
INCLUDE "data/tilesets/radio_tower_collision.asm"
;---------------------------------------

SECTION "Tileset Data 5", ROMX

;---------------------------------------
TilesetSolaceonRuinsGFX:
INCBIN "gfx/tilesets/solaceon_ruins.2bpp.lz"

TilesetSolaceonRuinsMeta:
INCBIN "data/tilesets/solaceon_ruins_metatiles.bin"

TilesetSolaceonRuinsColl:
INCLUDE "data/tilesets/solaceon_ruins_collision.asm"
;---------------------------------------
TilesetTraditionalHouseGFX:
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseMeta:
INCBIN "data/tilesets/traditional_house_metatiles.bin"

TilesetTraditionalHouseColl:
INCLUDE "data/tilesets/traditional_house_collision.asm"
;---------------------------------------

TilesetGameCornerGFX:
INCBIN "gfx/tilesets/game_corner.2bpp.lz"

TilesetGameCornerMeta:
INCBIN "data/tilesets/game_corner_metatiles.bin"

TilesetGameCornerColl:
INCLUDE "data/tilesets/game_corner_collision.asm"
;---------------------------------------
TilesetSnowpointTempleGFX:
INCBIN "gfx/tilesets/snowpoint_temple.2bpp.lz"

TilesetSnowpointTempleMeta:
INCBIN "data/tilesets/snowpoint_temple_metatiles.bin"

TilesetSnowpointTempleColl:
INCLUDE "data/tilesets/snowpoint_temple_collision.asm"
;---------------------------------------
TilesetMtCoronetGFX:
INCBIN "gfx/tilesets/mt_coronet.2bpp.lz"

TilesetMtCoronetMeta:
INCBIN "data/tilesets/mt_coronet_metatiles.bin"

TilesetMtCoronetColl:
INCLUDE "data/tilesets/mt_coronet_collision.asm"
;---------------------------------------
TilesetForestGFX:
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetForestMeta:
INCBIN "data/tilesets/forest_metatiles.bin"

TilesetForestColl:
INCLUDE "data/tilesets/forest_collision.asm"
;---------------------------------------


SECTION "Tileset Data 5", ROMX


SECTION "Tileset Data 6", ROMX
;---------------------------------------
TilesetSinnoh3GFX:
INCBIN "gfx/tilesets/sinnoh_3.2bpp.lz"

TilesetSinnoh3Coll:
INCLUDE "data/tilesets/sinnoh_3_collision.asm"

TilesetSinnoh3Meta:
INCBIN "data/tilesets/sinnoh_3_metatiles.bin"
;---------------------------------------
TilesetMeadowGFX:
INCBIN "gfx/tilesets/meadow.2bpp.lz"

TilesetMeadowColl:
INCLUDE "data/tilesets/meadow_collision.asm"

TilesetMeadowMeta:
INCBIN "data/tilesets/meadow_metatiles.bin"
;---------------------------------------

;SECTION "Tileset Data 7", ROMX
;SECTION "Tileset Data 8", ROMX
;SECTION "Tileset Data 9", ROMX

