; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to map groups
	dw CableClubGroupSprites
	dw TwinleafGroupSprites
	dw SandgemGroupSprites
	dw JubilifeGroupSprites
	dw OreburghGroupSprites
	dw LakeGroupSprites

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0 ; end

TwinleafGroupSprites: ; TwinleafTown, Route201
SandgemGroupSprites:  ; SandgemTown, Route202
JubilifeGroupSprites: ; JubilifeCity, Route203
	db SPRITE_POKEFAN_M
	db SPRITE_TEACHER
	db SPRITE_SILVER
	db SPRITE_OAK
	db SPRITE_KRIS
	; 5 of max 9 walking sprites
	db SPRITE_FAMICOM
	db 0 ; end

OreburghGroupSprites: ; OreburghCity
	; 0 of max 9 walking sprites
	db 0 ; end
	
LakeGroupSprites: ; LakeVerityLow, LakeVerityHigh
	; 0 of max 9 walking sprites
	db 0 ; end
