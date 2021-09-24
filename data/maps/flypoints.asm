flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint TWINLEAF, TWINLEAF_TOWN
	flypoint SANDGEM, SANDGEM_TOWN
	flypoint JUBILIFE, JUBILIFE_CITY

LAST_FLYPOINT EQU const_value - 1
	db -1
