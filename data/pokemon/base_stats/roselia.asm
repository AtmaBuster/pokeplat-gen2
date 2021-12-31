	db 0 ; species ID placeholder

	db  50,  60,  45,  65, 100,  80
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 150 ; catch rate
	db 152 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/roselia/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, SHADOW_BALL, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, SECRET_POWER, FACADE, SECRET_POWER, REST, ATTRACT, ENERGY_BALL, ENDURE, FLASH, SWORDS_DANCE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, GRASS_KNOT, SWAGGER, SUBSTITUTE, CUT, FURY_CUTTER, MUD_SLAP, SEED_BOMB, SNORE, SWIFT, SYNTHESIS 
	; end
