	db 0 ; species ID placeholder

	db  45,  60,  30,  65,  80,  50
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db 120 ; catch rate
	db 114 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/houndour/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups
	db 35 ; happiness

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, TAUNT, PROTECT, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SNATCH, OVERHEAT, ENDURE, WILL_O_WISP, EMBARGO, PAYBACK, CAPTIVATE, DARK_PULSE, SLEEP_TALK, NATURAL_GIFT, DREAM_EATER, SWAGGER, SUBSTITUTE, ROCK_SMASH, HEAT_WAVE, MUD_SLAP, SNORE, SPITE, SUCKER_PUNCH, SWIFT, UPROAR 
	; end
