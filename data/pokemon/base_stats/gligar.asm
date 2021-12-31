	db 0 ; species ID placeholder

	db  65,  75, 105,  85,  35,  65
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FLYING ; type
	db 60 ; catch rate
	db 108 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gligar/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, AERIAL_ACE, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, STEEL_WING, ROOST, FALSE_SWIPE, FLING, ENDURE, PAYBACK, ROCK_POLISH, STONE_EDGE, SWORDS_DANCE, STEALTH_ROCK, CAPTIVATE, DARK_PULSE, ROCK_SLIDE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, SWAGGER, U_TURN, SUBSTITUTE, CUT, STRENGTH, DEFOG, ROCK_SMASH, AQUA_TAIL, EARTH_POWER, FURY_CUTTER, KNOCK_OFF, SNORE, SWIFT 
	; end
