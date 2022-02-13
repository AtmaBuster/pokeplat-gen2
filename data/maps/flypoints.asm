flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Sinnoh
	flypoint TWINLEAF, TWINLEAF_TOWN
	flypoint SANDGEM, SANDGEM_TOWN
	flypoint JUBILIFE, JUBILIFE_CITY
	flypoint OREBURGH, OREBURGH_CITY
	flypoint FLOAROMA, FLOAROMA_TOWN

LAST_FLYPOINT EQU const_value - 1
	db -1
