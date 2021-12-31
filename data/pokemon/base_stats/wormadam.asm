	db 0 ; species ID placeholder

	db  60,  59,  85,  36,  79, 105
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 45 ; catch rate
	db 148 ; base exp
	db NO_ITEM, SILVERPOWDER ; items
	db GENDER_F100 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/wormadam/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, BULLET_SEED, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SKILL_SWAP, ENERGY_BALL, ENDURE, GIGA_IMPACT, FLASH, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, GRASS_KNOT, SWAGGER, SUBSTITUTE, ENDEAVOR, SEED_BOMB, SIGNAL_BEAM, SNORE, SUCKER_PUNCH, SYNTHESIS, UPROAR 
	; end
