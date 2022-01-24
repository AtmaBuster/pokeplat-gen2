; song ids
; Music indexes (see audio/music_pointers.asm)
	const_def

	const MUSIC_NONE                         ; 00
	const MUSIC_PLACEHOLDER                  ; 01 - Placeholder
	const MUSIC_CRYSTAL_OPENING              ; 02 - Change to Platinum Opening
	const MUSIC_TITLE                        ; 03
	const MUSIC_MAIN_MENU                    ; 04
	const MUSIC_SPECIAL_PROGRAM              ; 05
	const MUSIC_TWINLEAF_TOWN                ; 06
	const MUSIC_RIVAL_ENCOUNTER              ; 07
	; lake Theme                             ; 08
	const MUSIC_ROUTE_201                    ; 09
	const MUSIC_PROF_ROWAN                   ; 0a
	const MUSIC_DAWNS_THEME                  ; 0b
	const MUSIC_LUCASS_THEME                 ; 0c
	const MUSIC_RIVAL_BATTLE                 ; 0d
	const MUSIC_TRAINER_VICTORY              ; 0e
	const MUSIC_SINNOH_WILD_BATTLE           ; 0f
	const MUSIC_SINNOH_WILD_BATTLE_NIGHT     ; 10
	; fix numbers below                      ; 11
	const MUSIC_WILD_VICTORY                 ; 12
	const MUSIC_CAPTURE                      ; 13
	const MUSIC_SANDGEM_TOWN                 ; 14 - Replace with Sandgem Town
	const MUSIC_SHOW_ME_AROUND               ; 15
	const MUSIC_POKEMON_CENTER               ; 16
	const MUSIC_HEAL                         ; 17
	const MUSIC_POKE_MART                    ; 18
	const MUSIC_EVOLUTION                    ; 19
	const MUSIC_YOUNGSTER_ENCOUNTER          ; 1a - Update to Platinum
	const MUSIC_SINNOH_TRAINER_BATTLE        ; 1b
	const MUSIC_LASS_ENCOUNTER               ; 1c - Update to Platinum
	const MUSIC_VIOLET_CITY                  ; 1d - Replace with Jubilife
	const MUSIC_MYSTICALMAN_ENCOUNTER        ; 1e - Replace with Looker's Theme
	const MUSIC_ROUTE_203                    ; 1f
	const MUSIC_OREBURGH_GATE                ; 20
	const MUSIC_OREBURGH_CITY                ; 21
	const MUSIC_UNION_CAVE                   ; 22 - Replace with Oreburgh Mine
	const MUSIC_HIKER_ENCOUNTER              ; 23 - Find out what Worker Enc. Theme is
	const MUSIC_GYM                          ; 24
	const MUSIC_SINNOH_GYM_LEADER_BATTLE     ; 25
	const MUSIC_GYM_VICTORY                  ; 26
	const MUSIC_ROCKET_ENCOUNTER             ; 27 - Replace with Galactic Enc. Theme
	const MUSIC_ROCKET_BATTLE                ; 28 - Replace with Galactic Battle Theme
	const MUSIC_ROUTE_206                    ; 29
	const MUSIC_BEAUTY_ENCOUNTER             ; 2a
	const MUSIC_POKEMANIAC_ENCOUNTER         ; 2b
	const MUSIC_SAGE_ENCOUNTER               ; 2c
	const MUSIC_OFFICER_ENCOUNTER            ; 2d - Update to Platinum
	const MUSIC_BICYCLE                      ; 2e - Update to Platinum
	const MUSIC_SURF                         ; 2f - Update to Platinum
	const MUSIC_CHAMPION_BATTLE              ; 30 - Update to Platinum
	const MUSIC_HALL_OF_FAME                 ; 31 - Update to Platinum
	const MUSIC_CREDITS                      ; 32 - Update to Platinum
	const MUSIC_POST_CREDITS                 ; 33 - Update to Platinum
	const MUSIC_PROF_OAK                     ; 34
	const MUSIC_BATTLE_TOWER_THEME           ; 35
	const MUSIC_BATTLE_TOWER_LOBBY           ; 36

	;May not be needed?
	const MUSIC_POKE_FLUTE_CHANNEL           ; 37
	const MUSIC_MOM                          ; 38
	const MUSIC_POKEMON_LULLABY              ; 39
	const MUSIC_POKEMON_MARCH                ; 3a
	const MUSIC_PRINTER                      ; 3b
	const MUSIC_MOBILE_CENTER                ; 3c
	const MUSIC_MOBILE_ADAPTER_MENU          ; 3d
	const MUSIC_MOBILE_ADAPTER               ; 3e
	const MUSIC_RUINS_OF_ALPH_RADIO          ; 3f


; GetMapMusic picks music for this value (see home/map.asm)
MUSIC_MAHOGANY_MART EQU $64

; ExitPokegearRadio_HandleMusic uses these values
RESTART_MAP_MUSIC EQU $fe
ENTER_MAP_MUSIC   EQU $ff

; GetMapMusic picks music for this bit flag
RADIO_TOWER_MUSIC_F EQU 7
RADIO_TOWER_MUSIC EQU 1 << RADIO_TOWER_MUSIC_F
