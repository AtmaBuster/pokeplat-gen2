	db 0 ; species ID placeholder

	db  60,  79, 105,  36,  59,  85
	;   hp  atk  def  spd  sat  sdf

	db BUG, GROUND ; type
	db 45 ; catch rate
	db 148 ; base exp
	db NO_ITEM, SILVERPOWDER ; items
	db GENDER_F100 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/wormadam_s/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, EARTHQUAKE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SKILL_SWAP, ENDURE, GIGA_IMPACT, FLASH, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, SUBSTITUTE, EARTH_POWER, ENDEAVOR, MUD_SLAP, ROLLOUT, SIGNAL_BEAM, SNORE, SUCKER_PUNCH, UPROAR 
	; end
