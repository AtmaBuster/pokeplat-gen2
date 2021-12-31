	db 0 ; species ID placeholder

	db 100,  50,  80,  50,  50,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 153 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, FOCUS_BLAST, FLING, ENDURE, GIGA_IMPACT, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, SURF, STRENGTH, ROCK_SMASH, WATERFALL, AQUA_TAIL, DIVE, HELPING_HAND, ICE_PUNCH, ICY_WIND, KNOCK_OFF, MUD_SLAP, ROLLOUT, SNORE, SUPERPOWER, SWIFT 
	; end
