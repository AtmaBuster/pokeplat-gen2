	db 0 ; species ID placeholder

	db  66,  41,  77,  23,  61,  87
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GRASS ; type
	db 45 ; catch rate
	db 121 ; base exp
	db NO_ITEM, MIRACLE_SEED ; items
	db GENDER_F12_5 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/lileep/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, ENERGY_BALL, ENDURE, ROCK_POLISH, FLASH, SWORDS_DANCE, STEALTH_ROCK, CAPTIVATE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, ANCIENTPOWER, EARTH_POWER, GASTRO_ACID, MUD_SLAP, SEED_BOMB, SNORE, SYNTHESIS 
	; end
