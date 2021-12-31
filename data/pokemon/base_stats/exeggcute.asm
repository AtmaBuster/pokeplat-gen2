	db 0 ; species ID placeholder

	db  60,  40,  80,  40,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC ; type
	db 90 ; catch rate
	db 98 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggcute/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SKILL_SWAP, ENERGY_BALL, ENDURE, EXPLOSION, FLASH, SWORDS_DANCE, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, GRASS_KNOT, SWAGGER, SUBSTITUTE, TRICK_ROOM, STRENGTH, ANCIENTPOWER, ROLLOUT, SEED_BOMB, SNORE, SYNTHESIS, UPROAR 
	; end
