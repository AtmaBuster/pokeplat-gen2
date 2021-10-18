; MapGroupRoofs values; Roofs indexes
	const_def
	const ROOF_TWINLEAF  ; 0
	const ROOF_VIOLET    ; 1
	const ROOF_AZALEA    ; 2
	const ROOF_OLIVINE   ; 3
	const ROOF_GOLDENROD ; 4

MapGroupRoofs:
; entries correspond to map groups
; values are indexes for Roofs (see below)
	db -1
	db -1            ; Link
	db ROOF_TWINLEAF ; Twinleaf
	db ROOF_TWINLEAF ; Sandgem
	db ROOF_TWINLEAF ; Jubilife
	db ROOF_AZALEA   ; Oreburgh

Roofs:
; entries correspond to ROOF_* constants
INCBIN "gfx/tilesets/roofs/new_bark.2bpp"
INCBIN "gfx/tilesets/roofs/violet.2bpp"
INCBIN "gfx/tilesets/roofs/azalea.2bpp"
INCBIN "gfx/tilesets/roofs/olivine.2bpp"
INCBIN "gfx/tilesets/roofs/goldenrod.2bpp"
