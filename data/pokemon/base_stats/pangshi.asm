	db 0 ; species ID placeholder

	db  75,  107,  80,  65, 65,  68
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 189 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/pangshi/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups
	db 70 ; happiness

	; tm/hm learnset
	tmhm 
	; end
