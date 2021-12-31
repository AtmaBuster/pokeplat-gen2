	db 0 ; species ID placeholder

	db  45,  35,  45,  35,  62,  53
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 190 ; catch rate
	db 55 ; base exp
	db NO_ITEM, MIRACLE_SEED ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cherubi/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SAFEGUARD, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, ENERGY_BALL, ENDURE, FLASH, SWORDS_DANCE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, GRASS_KNOT, SWAGGER, SUBSTITUTE, HELPING_HAND, ROLLOUT, SEED_BOMB, SNORE, SYNTHESIS 
	; end
