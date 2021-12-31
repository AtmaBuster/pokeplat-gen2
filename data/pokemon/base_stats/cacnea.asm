	db 0 ; species ID placeholder

	db  50,  85,  40,  35,  85,  40
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 190 ; catch rate
	db 97 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cacnea/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_HUMANSHAPE ; egg groups
	db 35 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, BRICK_BREAK, DOUBLE_TEAM, SANDSTORM, REST, ATTRACT, ENERGY_BALL, FLING, ENDURE, DRAIN_PUNCH, PAYBACK, FLASH, SWORDS_DANCE, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, GRASS_KNOT, SWAGGER, SUBSTITUTE, CUT, FURY_CUTTER, MUD_SLAP, SEED_BOMB, SNORE, SPITE, SUCKER_PUNCH, SYNTHESIS, THUNDERPUNCH 
	; end
