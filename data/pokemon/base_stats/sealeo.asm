	db 0 ; species ID placeholder

	db  90,  60,  70,  45,  75,  70
	;   hp  atk  def  spd  sat  sdf

	db ICE, WATER ; type
	db 120 ; catch rate
	db 128 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sealeo/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, ROAR, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DOUBLE_TEAM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, BRINE, ENDURE, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, SURF, STRENGTH, ROCK_SMASH, WATERFALL, AQUA_TAIL, DIVE, ICY_WIND, MUD_SLAP, ROLLOUT, SIGNAL_BEAM, SNORE 
	; end
