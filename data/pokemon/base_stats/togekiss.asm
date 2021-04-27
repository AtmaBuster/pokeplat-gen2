	db 0 ; species ID placeholder

	db  85,  50,  95,  80, 120, 115
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 30 ; catch rate
	db 245 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/togekiss/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm
	; end
