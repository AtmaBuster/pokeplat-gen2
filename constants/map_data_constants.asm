GROUP_N_A  EQU -1
MAP_N_A    EQU -1
GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map struct members (see data/maps/maps.asm)
	const_def
	const MAP_MAPATTRIBUTES_BANK ; 0
	const MAP_TILESET            ; 1
	const MAP_ENVIRONMENT        ; 2
	const MAP_MAPATTRIBUTES      ; 3
	const MAP_MAPATTRIBUTES_HI   ; 4
	const MAP_LOCATION           ; 5
	const MAP_MUSIC              ; 6
	const MAP_PALETTE            ; 7
	const MAP_FISHGROUP          ; 8

; map environments (wEnvironment)
	const_def 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const ENVIRONMENT_5
	const GATE
	const DUNGEON

; map palettes (wEnvironment)
	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK

; FishGroups indexes (see data/wild/fish.asm)
	const_def
	const FISHGROUP_NONE
	const FISHGROUP_TWINLEAF
	const FISHGROUP_LAKE_VERITY
	const FISHGROUP_ROUTE_203
	const FISHGROUP_ROUTE_218
	const FISHGROUP_ROUTE_219
	const FISHGROUP_OREBURGH_GATE

; connection directions (see data/maps/data.asm)
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

; wMapConnections
	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; SpawnPoints indexes (see data/maps/spawn_points.asm)
const_value = -1
	const SPAWN_N_A
	const SPAWN_HOME
	const SPAWN_DEBUG
; kanto
	const SPAWN_TWINLEAF
	const SPAWN_SANDGEM
	const SPAWN_JUBILIFE
	const SPAWN_OREBURGH
	const SPAWN_FLOAROMA
	const SPAWN_ETERNA
	const SPAWN_HEARTHOME
	const SPAWN_SOLACEON
	const SPAWN_VEILSTONE
	const SPAWN_PASTORIA
	const SPAWN_CELESTIC
	const SPAWN_CANALAVE
	const SPAWN_SNOWPOINT
	const SPAWN_SUNYSHORE
	const SPAWN_LEAGUE_S
	const SPAWN_LEAGUE_N
	const SPAWN_FIGHT_AREA
	const SPAWN_SURVIVAL_AREA
	const SPAWN_RESORT_AREA
	const SPAWN_PAL_PARK
NUM_SPAWNS EQU const_value
