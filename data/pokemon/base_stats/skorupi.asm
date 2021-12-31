	db 0 ; species ID placeholder

	db  40,  50,  90,  65,  30,  55
	;   hp  atk  def  spd  sat  sdf

	db POISON, BUG ; type
	db 120 ; catch rate
	db 66 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/skorupi/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, SLUDGE_BOMB, ROCK_TOMB, AERIAL_ACE, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, FALSE_SWIPE, FLING, ENDURE, PAYBACK, FLASH, SWORDS_DANCE, CAPTIVATE, DARK_PULSE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, SWAGGER, SUBSTITUTE, CUT, STRENGTH, ROCK_SMASH, AQUA_TAIL, FURY_CUTTER, KNOCK_OFF, MUD_SLAP, SNORE 
	; end
