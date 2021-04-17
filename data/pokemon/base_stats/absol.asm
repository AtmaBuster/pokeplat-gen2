	db 0 ; species ID placeholder

	db  65, 130,  60,  75,  75,  60
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 30 ; catch rate
	db 174 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/absol/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm
	; end
