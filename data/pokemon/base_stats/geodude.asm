	db 0 ; species ID placeholder

	db  40,  80, 100,  20,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 255 ; catch rate
	db 86 ; base exp
	db NO_ITEM, EVERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/geodude/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, FRUSTRATION, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, FLING, ENDURE, EXPLOSION, ROCK_POLISH, STONE_EDGE, GYRO_BALL, STEALTH_ROCK, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, STRENGTH, ROCK_SMASH, ROCK_CLIMB, ANCIENTPOWER, EARTH_POWER, FIRE_PUNCH, MUD_SLAP, ROLLOUT, SNORE, SUCKER_PUNCH, SUPERPOWER, THUNDERPUNCH 
	; end
