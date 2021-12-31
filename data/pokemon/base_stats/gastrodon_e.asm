	db 0 ; species ID placeholder

	db 111,  83,  68,  39,  92,  82
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 75 ; catch rate
	db 166 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gastrodon_e/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_WATER_1 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, GIGA_IMPACT, FLASH, STONE_EDGE, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, STRENGTH, ROCK_SMASH, WATERFALL, ANCIENTPOWER, DIVE, EARTH_POWER, ICY_WIND, MUD_SLAP, SNORE 
	; end
