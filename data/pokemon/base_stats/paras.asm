	db 0 ; species ID placeholder

	db  35,  70,  55,  25,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/paras/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_PLANT ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SLUDGE_BOMB, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ENERGY_BALL, FALSE_SWIPE, ENDURE, FLASH, SWORDS_DANCE, CAPTIVATE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, CUT, ROCK_SMASH, FURY_CUTTER, KNOCK_OFF, SEED_BOMB, SNORE, SYNTHESIS 
	; end
