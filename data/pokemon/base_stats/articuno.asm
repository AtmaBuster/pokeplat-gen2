	db 0 ; species ID placeholder

	db  90,  85, 100,  85,  95, 125
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/articuno/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, ROAR, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, REFLECT, SANDSTORM, AERIAL_ACE, FACADE, SECRET_POWER, REST, STEEL_WING, ROOST, ENDURE, GIGA_IMPACT, AVALANCHE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, PLUCK, U_TURN, SUBSTITUTE, FLY, DEFOG, ROCK_SMASH, AIR_CUTTER, ANCIENTPOWER, ICY_WIND, MUD_SLAP, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SWIFT, TWISTER 
	; end
