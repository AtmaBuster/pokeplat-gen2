	db 0 ; species ID placeholder
	
	db  69,  69,  69,  69,  69,  69
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/glacihare/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, CUT, DEFENSE_CURL, DOUBLE_TEAM, ENDURE, FLASH, FURY_CUTTER, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, MUD_SLAP, PROTECT, REST, RETURN,	SLEEP_TALK, SOLARBEAM, SUNNY_DAY, SWAGGER, SWEET_SCENT, TOXIC
	; end
