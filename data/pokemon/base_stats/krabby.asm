	db 0 ; species ID placeholder

	db  30, 105,  90,  50,  25,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 225 ; catch rate
	db 115 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/krabby/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, FALSE_SWIPE, BRINE, FLING, ENDURE, SWORDS_DANCE, CAPTIVATE, ROCK_SLIDE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, SURF, STRENGTH, ROCK_SMASH, ANCIENTPOWER, DIVE, FURY_CUTTER, ICY_WIND, IRON_DEFENSE, KNOCK_OFF, MUD_SLAP, SNORE, SUPERPOWER 
	; end
