LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_SNOWPOINT_TEMPLE
	jr z, .snowpoint_temple
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_MODERN_INTERIOR
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_GYM_1
	jr z, .gym_1
	cp TILESET_MUSEUM
	jr z, .museum
	cp TILESET_MANSION
	jr z, .mansion_mobile
	cp TILESET_MEADOW
	jr z, .meadow
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.snowpoint_temple
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadSnowpointTemplePalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret
	
.gym_1
	call LoadGym1Palette
	scf
	ret
	
.museum
	call LoadMuseumPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret
	
.meadow
	call LoadMeadowPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadSnowpointTemplePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, SnowpointTemplePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
	
SnowpointTemplePalette:
INCLUDE "gfx/tilesets/snowpoint_temple.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette1
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

LoadGym1Palette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, Gym1Palette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

Gym1Palette:
INCLUDE "gfx/tilesets/gym_1.pal"

LoadMuseumPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MuseumPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

MuseumPalette:
INCLUDE "gfx/tilesets/museum.pal"

LoadMeadowPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MeadowPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

MeadowPalette:
INCLUDE "gfx/tilesets/meadow.pal"
