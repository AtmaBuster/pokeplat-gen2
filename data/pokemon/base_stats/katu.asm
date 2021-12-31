	db 0 ; species ID placeholder

	db  53,  63,  58,  83,  83,  83
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING ; type
	db 130 ; catch rate
	db 122 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/katu/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
