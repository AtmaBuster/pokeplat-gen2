	db 0 ; species ID placeholder

	db  40,  20,  30,  55,  40,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ledyba/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm FOCUS_PUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, SAFEGUARD, FRUSTRATION, SOLARBEAM, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, REFLECT, AERIAL_ACE, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, ROOST, FLING, ENDURE, DRAIN_PUNCH, SILVER_WIND, FLASH, SWORDS_DANCE, CAPTIVATE, SLEEP_TALK, NATURAL_GIFT, SWAGGER, U_TURN, SUBSTITUTE, AIR_CUTTER, ICE_PUNCH, KNOCK_OFF, OMINOUS_WIND, ROLLOUT, SNORE, SWIFT, THUNDERPUNCH, UPROAR 
	; end
