	db 0 ; species ID placeholder

	db 106, 110,  90, 130, 154,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 3 ; catch rate
	db 220 ; base exp
	db NO_ITEM, BERSERK_GENE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/mewtwo/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 0 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, WATER_PULSE, CALM_MIND, TOXIC, HAIL, BULK_UP, HIDDEN_POWER, SUNNY_DAY, TAUNT, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, SOLARBEAM, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, SHOCK_WAVE, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, TORMENT, FACADE, SECRET_POWER, REST, SKILL_SWAP, SNATCH, FOCUS_BLAST, ENERGY_BALL, FLING, CHARGE_BEAM, ENDURE, DRAIN_PUNCH, WILL_O_WISP, EMBARGO, RECYCLE, GIGA_IMPACT, FLASH, STONE_EDGE, AVALANCHE, THUNDER_WAVE, PSYCH_UP, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, DREAM_EATER, GRASS_KNOT, SWAGGER, SUBSTITUTE, TRICK_ROOM, STRENGTH, ROCK_SMASH, ROCK_CLIMB, AQUA_TAIL, FIRE_PUNCH, ICE_PUNCH, ICY_WIND, MUD_SLAP, SIGNAL_BEAM, SNORE, SWIFT, THUNDERPUNCH, TRICK, ZEN_HEADBUTT 
	; end
