	db 0 ; species ID placeholder

	db  55,  45,  45,  15,  25,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 255 ; catch rate
	db 52 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/wooper/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SLUDGE_BOMB, SANDSTORM, FACADE, SECRET_POWER, REST, ATTRACT, ENDURE, FLASH, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, ROCK_SMASH, WATERFALL, ANCIENTPOWER, AQUA_TAIL, DIVE, EARTH_POWER, ICE_PUNCH, ICY_WIND, MUD_SLAP, ROLLOUT, SNORE 
	; end
