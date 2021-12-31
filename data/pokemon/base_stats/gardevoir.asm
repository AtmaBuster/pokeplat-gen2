	db 0 ; species ID placeholder

	db  68,  65,  65,  80, 125, 115
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 45 ; catch rate
	db 208 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gardevoir/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, THUNDERBOLT, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SHOCK_WAVE, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SKILL_SWAP, SNATCH, FOCUS_BLAST, ENERGY_BALL, FLING, CHARGE_BEAM, ENDURE, RECYCLE, GIGA_IMPACT, FLASH, THUNDER_WAVE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, GRASS_KNOT, SWAGGER, SUBSTITUTE, TRICK_ROOM, FIRE_PUNCH, HELPING_HAND, ICE_PUNCH, ICY_WIND, MUD_SLAP, SIGNAL_BEAM, SNORE, SWIFT, THUNDERPUNCH, TRICK, ZEN_HEADBUTT 
	; end
