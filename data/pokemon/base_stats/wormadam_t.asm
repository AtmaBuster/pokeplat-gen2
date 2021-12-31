	db 0 ; species ID placeholder

	db  60,  69,  95,  36,  69,  95
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
	db 45 ; catch rate
	db 148 ; base exp
	db NO_ITEM, SILVERPOWDER ; items
	db GENDER_F100 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/wormadam_t/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SKILL_SWAP, ENDURE, GIGA_IMPACT, FLASH, GYRO_BALL, STEALTH_ROCK, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, SUBSTITUTE, FLASH_CANNON, ENDEAVOR, GUNK_SHOT, IRON_DEFENSE, IRON_HEAD, MAGNET_RISE, SIGNAL_BEAM, SNORE, SUCKER_PUNCH, UPROAR 
	; end
