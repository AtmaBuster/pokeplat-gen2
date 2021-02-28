; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - MoveDescriptions (see data/moves/descriptions.asm)
; - BattleAnimations (see data/moves/animations.asm)
	const_def
	const NO_MOVE      ; 000
	const POUND        ; 001
	const KARATE_CHOP  ; 002
	const DOUBLESLAP   ; 003
	const COMET_PUNCH  ; 004
	const MEGA_PUNCH   ; 005
	const PAY_DAY      ; 006
	const FIRE_PUNCH   ; 007
	const ICE_PUNCH    ; 008
	const THUNDERPUNCH ; 009
	const SCRATCH      ; 00a
	const VICEGRIP     ; 00b
	const GUILLOTINE   ; 00c
	const RAZOR_WIND   ; 00d
	const SWORDS_DANCE ; 00e
	const CUT          ; 00f
	const GUST         ; 010
	const WING_ATTACK  ; 011
	const WHIRLWIND    ; 012
	const FLY          ; 013
	const BIND         ; 014
	const SLAM         ; 015
	const VINE_WHIP    ; 016
	const STOMP        ; 017
	const DOUBLE_KICK  ; 018
	const MEGA_KICK    ; 019
	const JUMP_KICK    ; 01a
	const ROLLING_KICK ; 01b
	const SAND_ATTACK  ; 01c
	const HEADBUTT     ; 01d
	const HORN_ATTACK  ; 01e
	const FURY_ATTACK  ; 01f
	const HORN_DRILL   ; 020
	const TACKLE       ; 021
	const BODY_SLAM    ; 022
	const WRAP         ; 023
	const TAKE_DOWN    ; 024
	const THRASH       ; 025
	const DOUBLE_EDGE  ; 026
	const TAIL_WHIP    ; 027
	const POISON_STING ; 028
	const TWINEEDLE    ; 029
	const PIN_MISSILE  ; 02a
	const LEER         ; 02b
	const BITE         ; 02c
	const GROWL        ; 02d
	const ROAR         ; 02e
	const SING         ; 02f
	const SUPERSONIC   ; 030
	const SONICBOOM    ; 031
	const DISABLE      ; 032
	const ACID         ; 033
	const EMBER        ; 034
	const FLAMETHROWER ; 035
	const MIST         ; 036
	const WATER_GUN    ; 037
	const HYDRO_PUMP   ; 038
	const SURF         ; 039
	const ICE_BEAM     ; 03a
	const BLIZZARD     ; 03b
	const PSYBEAM      ; 03c
	const BUBBLEBEAM   ; 03d
	const AURORA_BEAM  ; 03e
	const HYPER_BEAM   ; 03f
	const PECK         ; 040
	const DRILL_PECK   ; 041
	const SUBMISSION   ; 042
	const LOW_KICK     ; 043
	const COUNTER      ; 044
	const SEISMIC_TOSS ; 045
	const STRENGTH     ; 046
	const ABSORB       ; 047
	const MEGA_DRAIN   ; 048
	const LEECH_SEED   ; 049
	const GROWTH       ; 04a
	const RAZOR_LEAF   ; 04b
	const SOLARBEAM    ; 04c
	const POISONPOWDER ; 04d
	const STUN_SPORE   ; 04e
	const SLEEP_POWDER ; 04f
	const PETAL_DANCE  ; 050
	const STRING_SHOT  ; 051
	const DRAGON_RAGE  ; 052
	const FIRE_SPIN    ; 053
	const THUNDERSHOCK ; 054
	const THUNDERBOLT  ; 055
	const THUNDER_WAVE ; 056
	const THUNDER      ; 057
	const ROCK_THROW   ; 058
	const EARTHQUAKE   ; 059
	const FISSURE      ; 05a
	const DIG          ; 05b
	const TOXIC        ; 05c
	const CONFUSION    ; 05d
	const PSYCHIC_M    ; 05e
	const HYPNOSIS     ; 05f
	const MEDITATE     ; 060
	const AGILITY      ; 061
	const QUICK_ATTACK ; 062
	const RAGE         ; 063
	const TELEPORT     ; 064
	const NIGHT_SHADE  ; 065
	const MIMIC        ; 066
	const SCREECH      ; 067
	const DOUBLE_TEAM  ; 068
	const RECOVER      ; 069
	const HARDEN       ; 06a
	const MINIMIZE     ; 06b
	const SMOKESCREEN  ; 06c
	const CONFUSE_RAY  ; 06d
	const WITHDRAW     ; 06e
	const DEFENSE_CURL ; 06f
	const BARRIER      ; 070
	const LIGHT_SCREEN ; 071
	const HAZE         ; 072
	const REFLECT      ; 073
	const FOCUS_ENERGY ; 074
	const BIDE         ; 075
	const METRONOME    ; 076
	const MIRROR_MOVE  ; 077
	const SELFDESTRUCT ; 078
	const EGG_BOMB     ; 079
	const LICK         ; 07a
	const SMOG         ; 07b
	const SLUDGE       ; 07c
	const BONE_CLUB    ; 07d
	const FIRE_BLAST   ; 07e
	const WATERFALL    ; 07f
	const CLAMP        ; 080
	const SWIFT        ; 081
	const SKULL_BASH   ; 082
	const SPIKE_CANNON ; 083
	const CONSTRICT    ; 084
	const AMNESIA      ; 085
	const KINESIS      ; 086
	const SOFTBOILED   ; 087
	const HI_JUMP_KICK ; 088
	const GLARE        ; 089
	const DREAM_EATER  ; 08a
	const POISON_GAS   ; 08b
	const BARRAGE      ; 08c
	const LEECH_LIFE   ; 08d
	const LOVELY_KISS  ; 08e
	const SKY_ATTACK   ; 08f
	const TRANSFORM    ; 090
	const BUBBLE       ; 091
	const DIZZY_PUNCH  ; 092
	const SPORE        ; 093
	const FLASH        ; 094
	const PSYWAVE      ; 095
	const SPLASH       ; 096
	const ACID_ARMOR   ; 097
	const CRABHAMMER   ; 098
	const EXPLOSION    ; 099
	const FURY_SWIPES  ; 09a
	const BONEMERANG   ; 09b
	const REST         ; 09c
	const ROCK_SLIDE   ; 09d
	const HYPER_FANG   ; 09e
	const SHARPEN      ; 09f
	const CONVERSION   ; 0a0
	const TRI_ATTACK   ; 0a1
	const SUPER_FANG   ; 0a2
	const SLASH        ; 0a3
	const SUBSTITUTE   ; 0a4
	const STRUGGLE     ; 0a5
	const SKETCH       ; 0a6
	const TRIPLE_KICK  ; 0a7
	const THIEF        ; 0a8
	const SPIDER_WEB   ; 0a9
	const MIND_READER  ; 0aa
	const NIGHTMARE    ; 0ab
	const FLAME_WHEEL  ; 0ac
	const SNORE        ; 0ad
	const CURSE        ; 0ae
	const FLAIL        ; 0af
	const CONVERSION2  ; 0b0
	const AEROBLAST    ; 0b1
	const COTTON_SPORE ; 0b2
	const REVERSAL     ; 0b3
	const SPITE        ; 0b4
	const POWDER_SNOW  ; 0b5
	const PROTECT      ; 0b6
	const MACH_PUNCH   ; 0b7
	const SCARY_FACE   ; 0b8
	const FAINT_ATTACK ; 0b9
	const SWEET_KISS   ; 0ba
	const BELLY_DRUM   ; 0bb
	const SLUDGE_BOMB  ; 0bc
	const MUD_SLAP     ; 0bd
	const OCTAZOOKA    ; 0be
	const SPIKES       ; 0bf
	const ZAP_CANNON   ; 0c0
	const FORESIGHT    ; 0c1
	const DESTINY_BOND ; 0c2
	const PERISH_SONG  ; 0c3
	const ICY_WIND     ; 0c4
	const DETECT       ; 0c5
	const BONE_RUSH    ; 0c6
	const LOCK_ON      ; 0c7
	const OUTRAGE      ; 0c8
	const SANDSTORM    ; 0c9
	const GIGA_DRAIN   ; 0ca
	const ENDURE       ; 0cb
	const CHARM        ; 0cc
	const ROLLOUT      ; 0cd
	const FALSE_SWIPE  ; 0ce
	const SWAGGER      ; 0cf
	const MILK_DRINK   ; 0d0
	const SPARK        ; 0d1
	const FURY_CUTTER  ; 0d2
	const STEEL_WING   ; 0d3
	const MEAN_LOOK    ; 0d4
	const ATTRACT      ; 0d5
	const SLEEP_TALK   ; 0d6
	const HEAL_BELL    ; 0d7
	const RETURN       ; 0d8
	const PRESENT      ; 0d9
	const FRUSTRATION  ; 0da
	const SAFEGUARD    ; 0db
	const PAIN_SPLIT   ; 0dc
	const SACRED_FIRE  ; 0dd
	const MAGNITUDE    ; 0de
	const DYNAMICPUNCH ; 0df
	const MEGAHORN     ; 0e0
	const DRAGONBREATH ; 0e1
	const BATON_PASS   ; 0e2
	const ENCORE       ; 0e3
	const PURSUIT      ; 0e4
	const RAPID_SPIN   ; 0e5
	const SWEET_SCENT  ; 0e6
	const IRON_TAIL    ; 0e7
	const METAL_CLAW   ; 0e8
	const VITAL_THROW  ; 0e9
	const MORNING_SUN  ; 0ea
	const SYNTHESIS    ; 0eb
	const MOONLIGHT    ; 0ec
	const HIDDEN_POWER ; 0ed
	const CROSS_CHOP   ; 0ee
	const TWISTER      ; 0ef
	const RAIN_DANCE   ; 0f0
	const SUNNY_DAY    ; 0f1
	const CRUNCH       ; 0f2
	const MIRROR_COAT  ; 0f3
	const PSYCH_UP     ; 0f4
	const EXTREMESPEED ; 0f5
	const ANCIENTPOWER ; 0f6
	const SHADOW_BALL  ; 0f7
	const FUTURE_SIGHT ; 0f8
	const ROCK_SMASH   ; 0f9
	const WHIRLPOOL    ; 0fa
	const BEAT_UP      ; 0fb
; Gen 3
	const FAKE_OUT     ; 0fc
	const UPROAR       ; 0fd
	const STOCKPILE    ; 0fe
	const SPIT_UP      ; 0ff
	const SWALLOW      ; 100
	const HEAT_WAVE    ; 101
	const HAIL         ; 102
	const TORMENT      ; 103
	const FLATTER      ; 104
	const WILL_O_WISP  ; 105
	const MEMENTO      ; 106
	const FACADE       ; 107
	const FOCUS_PUNCH  ; 108
	const SMELLINGSALT ; 109
	const FOLLOW_ME    ; 10a
	const NATURE_POWER ; 10b
	const CHARGE       ; 10c
	const TAUNT        ; 10d
	const HELPING_HAND ; 10e
	const TRICK        ; 10f
	const ROLE_PLAY    ; 110
	const WISH         ; 111
	const ASSIST       ; 112
	const INGRAIN      ; 113
	const SUPERPOWER   ; 114
	const MAGIC_COAT   ; 115
	const RECYCLE      ; 116
	const REVENGE      ; 117
	const BRICK_BREAK  ; 118
	const YAWN         ; 119
	const KNOCK_OFF    ; 11a
	const ENDEAVOR     ; 11b
	const ERUPTION     ; 11c
	const SKILL_SWAP   ; 11d
	const IMPRISON     ; 11e
	const REFRESH      ; 11f
	const GRUDGE       ; 120
	const SNATCH       ; 121
	const SECRET_POWER ; 122
	const DIVE         ; 123
	const ARM_THRUST   ; 124
	const CAMOUFLAGE   ; 125
	const TAIL_GLOW    ; 126
	const LUSTER_PURGE ; 127
	const MIST_BALL    ; 128
	const FEATHERDANCE ; 129
	const TEETER_DANCE ; 12a
	const BLAZE_KICK   ; 12b
	const MUD_SPORT    ; 12c
	const ICE_BALL     ; 12d
	const NEEDLE_ARM   ; 12e
	const SLACK_OFF    ; 12f
	const HYPER_VOICE  ; 130
	const POISON_FANG  ; 131
	const CRUSH_CLAW   ; 132
	const BLAST_BURN   ; 133
	const HYDRO_CANNON ; 134
	const METEOR_MASH  ; 135
	const ASTONISH     ; 136
	const WEATHER_BALL ; 137
	const AROMATHERAPY ; 138
	const FAKE_TEARS   ; 139
	const AIR_CUTTER   ; 13a
	const OVERHEAT     ; 13b
	const ODOR_SLEUTH  ; 13c
	const ROCK_TOMB    ; 13d
	const SILVER_WIND  ; 13e
	const METAL_SOUND  ; 13f
	const GRASSWHISTLE ; 140
	const TICKLE       ; 141
	const COSMIC_POWER ; 142
	const WATER_SPOUT  ; 143
	const SIGNAL_BEAM  ; 144
	const SHADOW_PUNCH ; 145
	const EXTRASENSORY ; 146
	const SKY_UPPERCUT ; 147
	const SAND_TOMB    ; 148
	const SHEER_COLD   ; 149
	const MUDDY_WATER  ; 14a
	const BULLET_SEED  ; 14b
	const AERIAL_ACE   ; 14c
	const ICICLE_SPEAR ; 14d
	const IRON_DEFENSE ; 14e
	const BLOCK        ; 14f
	const HOWL         ; 150
	const DRAGON_CLAW  ; 151
	const FRENZY_PLANT ; 152
	const BULK_UP      ; 153
	const BOUNCE       ; 154
	const MUD_SHOT     ; 155
	const POISON_TAIL  ; 156
	const COVET        ; 157
	const VOLT_TACKLE  ; 158
	const MAGICAL_LEAF ; 159
	const WATER_SPORT  ; 15a
	const CALM_MIND    ; 15b
	const LEAF_BLADE   ; 15c
	const DRAGON_DANCE ; 15d
	const ROCK_BLAST   ; 15e
	const SHOCK_WAVE   ; 15f
	const WATER_PULSE  ; 160
	const DOOM_DESIRE  ; 161
	const PSYCHO_BOOST ; 162
; Gen 4
	const ROOST        ; 163
	const GRAVITY      ; 164
	const MIRACLE_EYE  ; 165
	const WAKE_UP_SLAP ; 166
	const HAMMER_ARM   ; 167
	const GYRO_BALL    ; 168
	const HEALING_WISH ; 169
	const BRINE        ; 16a
	const NATURAL_GIFT ; 16b
	const FEINT        ; 16c
	const PLUCK        ; 16d
	const TAILWIND     ; 16e
	const ACUPRESSURE  ; 16f
	const METAL_BURST  ; 170
	const U_TURN       ; 171
	const CLOSE_COMBAT ; 172
	const PAYBACK      ; 173
	const ASSURANCE    ; 174
	const EMBARGO      ; 175
	const FLING        ; 176
	const PSYCHO_SHIFT ; 177
	const TRUMP_CARD   ; 178
	const HEAL_BLOCK   ; 179
	const WRING_OUT    ; 17a
	const POWER_TRICK  ; 17b
	const GASTRO_ACID  ; 17c
	const LUCKY_CHANT  ; 17d
	const ME_FIRST     ; 17e
	const COPYCAT      ; 17f
	const POWER_SWAP   ; 180
	const GUARD_SWAP   ; 181
	const PUNISHMENT   ; 182
	const LAST_RESORT  ; 183
	const WORRY_SEED   ; 184
	const SUCKER_PUNCH ; 185
	const TOXIC_SPIKES ; 186
	const HEART_SWAP   ; 187
	const AQUA_RING    ; 188
	const MAGNET_RISE  ; 189
	const FLARE_BLITZ  ; 18a
	const FORCE_PALM   ; 18b
	const AURA_SPHERE  ; 18c
	const ROCK_POLISH  ; 18d
	const POISON_JAB   ; 18e
	const DARK_PULSE   ; 18f
	const NIGHT_SLASH  ; 190
	const AQUA_TAIL    ; 191
	const SEED_BOMB    ; 192
	const AIR_SLASH    ; 193
	const X_SCISSOR    ; 194
	const BUG_BUZZ     ; 195
	const DRAGON_PULSE ; 196
	const DRAGON_RUSH  ; 197
	const POWER_GEM    ; 198
	const DRAIN_PUNCH  ; 199
	const VACUUM_WAVE  ; 19a
	const FOCUS_BLAST  ; 19b
	const ENERGY_BALL  ; 19c
	const BRAVE_BIRD   ; 19d
	const EARTH_POWER  ; 19e
	const SWITCHEROO   ; 19f
	const GIGA_IMPACT  ; 1a0
	const NASTY_PLOT   ; 1a1
	const BULLET_PUNCH ; 1a2
	const AVALANCHE    ; 1a3
	const ICE_SHARD    ; 1a4
	const SHADOW_CLAW  ; 1a5
	const THUNDER_FANG ; 1a6
	const ICE_FANG     ; 1a7
	const FIRE_FANG    ; 1a8
	const SHADOW_SNEAK ; 1a9
	const MUD_BOMB     ; 1aa
	const PSYCHO_CUT   ; 1ab
	const ZEN_HEADBUTT ; 1ac
	const MIRROR_SHOT  ; 1ad
	const FLASH_CANNON ; 1ae
	const ROCK_CLIMB   ; 1af
	const DEFOG        ; 1b0
	const TRICK_ROOM   ; 1b1
	const DRACO_METEOR ; 1b2
	const DISCHARGE    ; 1b3
	const LAVA_PLUME   ; 1b4
	const LEAF_STORM   ; 1b5
	const POWER_WHIP   ; 1b6
	const ROCK_WRECKER ; 1b7
	const CROSS_POISON ; 1b8
	const GUNK_SHOT    ; 1b9
	const IRON_HEAD    ; 1ba
	const MAGNET_BOMB  ; 1bb
	const STONE_EDGE   ; 1bc
	const CAPTIVATE    ; 1bd
	const STEALTH_ROCK ; 1be
	const GRASS_KNOT   ; 1bf
	const CHATTER      ; 1c0
	const JUDGMENT     ; 1c1
	const BUG_BITE     ; 1c2
	const CHARGE_BEAM  ; 1c3
	const WOOD_HAMMER  ; 1c4
	const AQUA_JET     ; 1c5
	const ATTACK_ORDER ; 1c6
	const DEFEND_ORDER ; 1c7
	const HEAL_ORDER   ; 1c8
	const HEAD_SMASH   ; 1c9
	const DOUBLE_HIT   ; 1ca
	const ROAR_OF_TIME ; 1cb
	const SPACIAL_REND ; 1cc
	const LUNAR_DANCE  ; 1cd
	const CRUSH_GRIP   ; 1ce
	const MAGMA_STORM  ; 1cf
	const DARK_VOID    ; 1d0
	const SEED_FLARE   ; 1d1
	const OMINOUS_WIND ; 1d2
	const SHADOW_FORCE ; 1d3
NUM_ATTACKS EQU const_value + -1

	if NUM_ATTACKS > $3fff
		fail "Too many moves defined!"
	endc

; Battle animations use the same constants as the moves
	const ANIM_SWEET_SCENT_2     ; 1d9
; Animations with negative IDs will play even when animations are disabled
const_value = -$16 ;fix if more negative values are added
	const ANIM_THROW_POKE_BALL   ; -16 (ffea)
	const ANIM_SEND_OUT_MON      ; -15 (ffeb)
	const ANIM_RETURN_MON        ; -14 (ffec)
	const ANIM_CONFUSED          ; -13 (ffed)
	const ANIM_SLP               ; -12 (ffee)
	const ANIM_BRN               ; -11 (ffef)
	const ANIM_PSN               ; -10 (fff0)
	const ANIM_SAP               ;  -f (fff1)
	const ANIM_FRZ               ;  -e (fff2)
	const ANIM_PAR               ;  -d (fff3)
	const ANIM_IN_LOVE           ;  -c (fff4)
	const ANIM_IN_SANDSTORM      ;  -b (fff5)
	const ANIM_IN_NIGHTMARE      ;  -a (fff6)
	const ANIM_IN_WHIRLPOOL      ;  -9 (fff7)
; battle anims
	const ANIM_MISS              ;  -8 (fff8)
	const ANIM_ENEMY_DAMAGE      ;  -7 (fff9)
	const ANIM_ENEMY_STAT_DOWN   ;  -6 (fffa)
	const ANIM_PLAYER_STAT_DOWN  ;  -5 (fffb)
	const ANIM_PLAYER_DAMAGE     ;  -4 (fffc)
	const ANIM_WOBBLE            ;  -3 (fffd)
	const ANIM_SHAKE             ;  -2 (fffe)
	const ANIM_HIT_CONFUSION     ;  -1 (ffff)

	if const_value
		fail "Please adjust the initial constant value to ensure that the last animation constant has a value of -1"
	endc

; wNumHits uses offsets from ANIM_MISS
	const_def
	const BATTLEANIM_NONE
	const BATTLEANIM_ENEMY_DAMAGE
	const BATTLEANIM_ENEMY_STAT_DOWN
	const BATTLEANIM_PLAYER_STAT_DOWN
	const BATTLEANIM_PLAYER_DAMAGE
	const BATTLEANIM_WOBBLE
	const BATTLEANIM_SHAKE
	const BATTLEANIM_HIT_CONFUSION

	const_def
	const CAT_PHYSICAL
	const CAT_SPECIAL
	const CAT_STATUS
