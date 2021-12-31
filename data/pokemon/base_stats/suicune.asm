	db 0 ; species ID placeholder

	db 100,  75, 115,  85,  90, 115
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 3 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/suicune/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, CALM_MIND, ROAR, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SANDSTORM, FACADE, SECRET_POWER, REST, BRINE, ENDURE, GIGA_IMPACT, AVALANCHE, PSYCH_UP, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, SURF, ROCK_SMASH, WATERFALL, ROCK_CLIMB, DIVE, ICY_WIND, IRON_HEAD, MUD_SLAP, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SWIFT 
	; end
