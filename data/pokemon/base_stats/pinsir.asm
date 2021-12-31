	db 0 ; species ID placeholder

	db  65, 125, 100,  85,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/pinsir/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, FOCUS_BLAST, FALSE_SWIPE, FLING, ENDURE, GIGA_IMPACT, STONE_EDGE, SWORDS_DANCE, STEALTH_ROCK, CAPTIVATE, ROCK_SLIDE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, STRENGTH, ROCK_SMASH, ROCK_CLIMB, FURY_CUTTER, IRON_DEFENSE, KNOCK_OFF, SNORE, SUPERPOWER 
	; end
