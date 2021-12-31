	db 0 ; species ID placeholder

	db  60,  70,  65,  90, 125, 105
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 75 ; catch rate
	db 232 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/roserade/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, SHADOW_BALL, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, SECRET_POWER, REST, ATTRACT, ENERGY_BALL, ENDURE, GIGA_IMPACT, FLASH, SWORDS_DANCE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, GRASS_KNOT, SWAGGER, SUBSTITUTE, CUT, FURY_CUTTER, MUD_SLAP, SEED_BOMB, SNORE, SWIFT, SYNTHESIS 
	; end
