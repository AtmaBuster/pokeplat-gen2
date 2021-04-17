	db 0 ; species ID placeholder

	db  80,  80,  80,  80,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 75 ; catch rate
	db 187 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/glalie/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FAIRY, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm
	; end
