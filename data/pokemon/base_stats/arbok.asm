	db 0 ; species ID placeholder

	db  60,  85,  69,  80,  65,  79
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 90 ; catch rate
	db 147 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/arbok/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SLUDGE_BOMB, ROCK_TOMB, TORMENT, FACADE, SECRET_POWER, REST, ATTRACT, THIEF, SNATCH, ENDURE, PAYBACK, GIGA_IMPACT, CAPTIVATE, DARK_PULSE, ROCK_SLIDE, SLEEP_TALK, NATURAL_GIFT, POISON_JAB, SWAGGER, SUBSTITUTE, STRENGTH, AQUA_TAIL, GASTRO_ACID, GUNK_SHOT, SEED_BOMB, SNORE, SPITE 
	; end
