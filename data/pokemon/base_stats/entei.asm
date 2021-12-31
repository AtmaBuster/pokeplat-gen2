	db 0 ; species ID placeholder

	db 115, 115,  85, 100,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 3 ; catch rate
	db 217 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/entei/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm CALM_MIND, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLAMETHROWER, SANDSTORM, FIRE_BLAST, FACADE, SECRET_POWER, REST, OVERHEAT, ENDURE, WILL_O_WISP, GIGA_IMPACT, FLASH, STONE_EDGE, PSYCH_UP, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, STRENGTH, ROCK_SMASH, ROCK_CLIMB, HEAT_WAVE, IRON_HEAD, MUD_SLAP, SNORE, SWIFT 
	; end
