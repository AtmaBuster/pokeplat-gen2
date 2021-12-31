	db 0 ; species ID placeholder

	db  70,  80, 102,  40,  80, 102
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 166 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F100 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/vespiquen/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ROOST, FLING, ENDURE, SILVER_WIND, GIGA_IMPACT, FLASH, CAPTIVATE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, SWAGGER, U_TURN, SUBSTITUTE, CUT, DEFOG, AIR_CUTTER, ENDEAVOR, FURY_CUTTER, MUD_SLAP, OMINOUS_WIND, SIGNAL_BEAM, SNORE, SWIFT 
	; end
