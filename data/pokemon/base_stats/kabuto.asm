	db 0 ; species ID placeholder

	db  30,  80,  90,  55,  55,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 119 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/kabuto/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, RETURN, DIG, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, BRINE, ENDURE, ROCK_POLISH, STEALTH_ROCK, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, ROCK_SMASH, WATERFALL, ANCIENTPOWER, EARTH_POWER, ICY_WIND, IRON_DEFENSE, KNOCK_OFF, MUD_SLAP, ROLLOUT, SNORE 
	; end
