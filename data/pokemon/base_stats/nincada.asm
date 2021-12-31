	db 0 ; species ID placeholder

	db  31,  45,  90,  40,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db BUG, GROUND ; type
	db 255 ; catch rate
	db 65 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/nincada/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SANDSTORM, AERIAL_ACE, FACADE, SECRET_POWER, REST, FALSE_SWIPE, ENDURE, FLASH, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, SWAGGER, SUBSTITUTE, CUT, FURY_CUTTER, MUD_SLAP, SNORE, SPITE 
	; end
