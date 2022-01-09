tileset: MACRO
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
	dw NULL
	dw \1PalMap
ENDM

; Associated data:
; - The *GFX, *Meta, and *Coll are defined in gfx/tilesets.asm
; - The *PalMap are defined in gfx/tileset_palette_maps.asm
; - The *Anim are defined in engine/tilesets/tileset_anims.asm

Tilesets::
; entries correspond to TILESET_* constants
	tileset Tileset0
	tileset TilesetSinnoh1
	tileset TilesetSinnoh2
	tileset TilesetPlayersRoom
	tileset TilesetPlayersHouse
	tileset TilesetHouse
	tileset TilesetModernInterior
	tileset TilesetLake
	tileset TilesetLab
	tileset TilesetPokecenter
	tileset TilesetMart
	tileset TilesetPokeComCenter
	tileset TilesetGym1
	tileset TilesetMansion
	tileset TilesetCave
	tileset TilesetGate
	tileset TilesetForest
	tileset TilesetFacility
	tileset TilesetBikeShop
	tileset TilesetPark
	tileset TilesetRadioTower
	tileset TilesetSolaceonRuins
	tileset TilesetTraditionalHouse
	tileset TilesetGameCorner
	tileset TilesetSnowpointTemple
	tileset TilesetMtCoronet

	
