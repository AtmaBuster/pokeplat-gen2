	db 0 ; species ID placeholder

	db  96,  48,  48, 104,  48,  48
	;   hp  atk  def  spd  sat  sdf

	db STEEL, STEEL ; type
	db 35 ; catch rate
	db 146 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/metto/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_DITTO, EGG_DITTO ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end

