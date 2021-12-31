	db 0 ; species ID placeholder

	db 100, 100, 100, 100, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 255 ; base exp
	db MIRACLEBERRY, MIRACLEBERRY ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/shaymin/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SAFEGUARD, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ENERGY_BALL, ENDURE, GIGA_IMPACT, FLASH, SWORDS_DANCE, PSYCH_UP, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, EARTH_POWER, ENDEAVOR, LAST_RESORT, MUD_SLAP, SEED_BOMB, SNORE, SWIFT, SYNTHESIS, ZEN_HEADBUTT 
	; end
