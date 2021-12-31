	db 0 ; species ID placeholder

	db   1,  90,  45,  40,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db BUG, GHOST ; type
	db 45 ; catch rate
	db 95 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/shedinja/front.dimensions"
	db GROWTH_ERRATIC ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, SANDSTORM, AERIAL_ACE, FACADE, SECRET_POWER, REST, THIEF, FALSE_SWIPE, ENDURE, WILL_O_WISP, SHADOW_CLAW, GIGA_IMPACT, FLASH, X_SCISSOR, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, SUBSTITUTE, CUT, FURY_CUTTER, MUD_SLAP, SNORE, SPITE, SUCKER_PUNCH, TRICK 
	; end
