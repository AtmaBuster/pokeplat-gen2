	db 0 ; species ID placeholder

	db  61,  90,  45, 160,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 120 ; catch rate
	db 155 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ninjask/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SANDSTORM, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ROOST, FALSE_SWIPE, ENDURE, SILVER_WIND, GIGA_IMPACT, FLASH, SWORDS_DANCE, CAPTIVATE, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, SWAGGER, U_TURN, SUBSTITUTE, CUT, DEFOG, AIR_CUTTER, FURY_CUTTER, MUD_SLAP, OMINOUS_WIND, SNORE, SPITE, SWIFT, UPROAR 
	; end
