	db 0 ; species ID placeholder

	db  45,  75,  37,  83,  70,  55
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 117 ; base exp
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/magby/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, FRUSTRATION, IRON_TAIL, RETURN, PSYCHIC_M, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, OVERHEAT, FLING, ENDURE, WILL_O_WISP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, ROCK_SMASH, FIRE_PUNCH, HEAT_WAVE, HELPING_HAND, MUD_SLAP, SNORE, THUNDERPUNCH, UPROAR 
	; end
