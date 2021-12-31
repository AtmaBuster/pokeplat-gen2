	db 0 ; species ID placeholder

	db  74, 100,  72,  46,  90,  72
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 200 ; catch rate
	db 159 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/carnivine/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ENERGY_BALL, FLING, ENDURE, PAYBACK, GIGA_IMPACT, FLASH, SWORDS_DANCE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, CUT, FURY_CUTTER, GASTRO_ACID, KNOCK_OFF, MUD_SLAP, SEED_BOMB, SNORE, SYNTHESIS 
	; end
