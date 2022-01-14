TIME_GROUP EQU 0 ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	dbwww \1, \2, \3, \4
ENDM

startfishsets: MACRO
fish_total = 100
ENDM

newfishset: MACRO
if fish_total != 100
	fail "Total percent for fish set is not 100%"
endc
fish_total = 0
ENDM

fishmon: MACRO
fish_total = fish_total + \1
if fish_total > 100
	fail "Fish set reached over 100%"
endc
	db fish_total percent
	db \2, \3 ; min level, max level
	dw \4 ; mon
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	fishgroup 50 percent + 1, .Default_Old, .Twinleaf_Good, .Twinleaf_Super
	fishgroup 50 percent + 1, .Default_Old, .Verity_Good, .Verity_Super
	fishgroup 50 percent + 1, .Default_Old, .Route203_Good, .Route203_Super
	fishgroup 50 percent + 1, .Default_Old, .Route218_Good, .Route218_Super
	fishgroup 50 percent + 1, .Default_Old, .Route219_Good, .Route219_Super
	fishgroup 50 percent + 1, .Default_Old, .OreburghGate_Good, .OreburghGate_Super

	startfishsets

.Default_Old:
	newfishset
	fishmon 100, 3, 15, MAGIKARP

.Twinleaf_Good:
	newfishset
	fishmon 55, 10, 25, MAGIKARP
	fishmon 45, 15, 35, GOLDEEN

.Twinleaf_Super:
.Verity_Super:
.Route203_Super:
	newfishset
	fishmon 55, 30, 55, GYARADOS
	fishmon 45, 30, 55, SEAKING

.Verity_Good:
	newfishset
	fishmon 55, 10, 25, MAGIKARP
	fishmon 40, 15, 20, GOLDEEN
	fishmon  5, 25, 35, SEAKING

.Route203_Good:
	newfishset
	fishmon 55, 10, 25, MAGIKARP
	fishmon 45, 10, 25, GOLDEEN

.Route218_Good:
	newfishset
	fishmon 55, 10, 25, MAGIKARP
	fishmon 45, 15, 25, FINNEON

.Route218_Super:
.Route219_Super:
	newfishset
	fishmon 55, 30, 55, GYARADOS
	fishmon 45, 30, 55, LUMINEON

.Route219_Good:
	newfishset
	fishmon 55, 10, 25, MAGIKARP
	fishmon 40, 15, 20, FINNEON
	fishmon  5, 25, 35, LUMINEON

.OreburghGate_Good:
	newfishset
	fishmon 55, 10, 25, MAGIKARP
	fishmon 45, 10, 25, BARBOACH

.OreburghGate_Super:
	newfishset
	fishmon 55, 30, 55, GYARADOS
	fishmon 45, 30, 55, WHISCASH

TimeFishGroups:
	;     day             nite
	dbwbw 20, CORSOLA,    20, STARYU     ; 0
	dbwbw 40, CORSOLA,    40, STARYU     ; 1
	dbwbw 20, SHELLDER,   20, SHELLDER   ; 2
	dbwbw 40, SHELLDER,   40, SHELLDER   ; 3
	dbwbw 20, GOLDEEN,    20, GOLDEEN    ; 4
	dbwbw 40, GOLDEEN,    40, GOLDEEN    ; 5
	dbwbw 20, POLIWAG,    20, POLIWAG    ; 6
	dbwbw 40, POLIWAG,    40, POLIWAG    ; 7
	dbwbw 20, DRATINI,    20, DRATINI    ; 8
	dbwbw 40, DRATINI,    40, DRATINI    ; 9
	dbwbw 20, QWILFISH,   20, QWILFISH   ; 10
	dbwbw 40, QWILFISH,   40, QWILFISH   ; 11
	dbwbw 20, REMORAID,   20, REMORAID   ; 12
	dbwbw 40, REMORAID,   40, REMORAID   ; 13
	dbwbw 20, GYARADOS,   20, GYARADOS   ; 14
	dbwbw 40, GYARADOS,   40, GYARADOS   ; 15
	dbwbw 10, DRATINI,    10, DRATINI    ; 16
	dbwbw 10, DRATINI,    10, DRATINI    ; 17
	dbwbw 20, HORSEA,     20, HORSEA     ; 18
	dbwbw 40, HORSEA,     40, HORSEA     ; 19
	dbwbw 20, TENTACOOL,  20, TENTACOOL  ; 20
	dbwbw 40, TENTACOOL,  40, TENTACOOL  ; 21

	newfishset ; to help catch errors
