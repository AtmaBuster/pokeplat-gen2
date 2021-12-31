	db 0 ; species ID placeholder

	db  50,  64,  50,  41,  45,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 67 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/larvitar/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, ENDURE, PAYBACK, ROCK_POLISH, STONE_EDGE, STEALTH_ROCK, CAPTIVATE, DARK_PULSE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, ROCK_SMASH, ANCIENTPOWER, EARTH_POWER, IRON_HEAD, MUD_SLAP, SNORE, SPITE, SUPERPOWER, UPROAR 
	; end
