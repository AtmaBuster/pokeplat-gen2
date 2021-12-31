	db 0 ; species ID placeholder

	db  70,  94,  50,  66,  94,  50
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 148 ; base exp
	db NO_ITEM, SILVERPOWDER ; items
	db GENDER_F0 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/mothim/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SKILL_SWAP, ROOST, ENERGY_BALL, ENDURE, SILVER_WIND, GIGA_IMPACT, FLASH, PSYCH_UP, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, U_TURN, SUBSTITUTE, DEFOG, AIR_CUTTER, MUD_SLAP, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SWIFT, TWISTER 
	; end
