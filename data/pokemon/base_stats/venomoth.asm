	db 0 ; species ID placeholder

	db  70,  65,  60,  90,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/venomoth/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, SLUDGE_BOMB, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SKILL_SWAP, ROOST, ENERGY_BALL, ENDURE, SILVER_WIND, GIGA_IMPACT, FLASH, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, U_TURN, SUBSTITUTE, DEFOG, AIR_CUTTER, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SWIFT, TWISTER, ZEN_HEADBUTT 
	; end
