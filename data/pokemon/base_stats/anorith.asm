	db 0 ; species ID placeholder

	db  45,  95,  50,  75,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, BUG ; type
	db 45 ; catch rate
	db 119 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/anorith/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm WATER_PULSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, FRUSTRATION, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, FALSE_SWIPE, ENDURE, ROCK_POLISH, SWORDS_DANCE, STEALTH_ROCK, CAPTIVATE, ROCK_SLIDE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, ROCK_SMASH, ANCIENTPOWER, EARTH_POWER, FURY_CUTTER, IRON_DEFENSE, KNOCK_OFF, MUD_SLAP, SNORE 
	; end
