; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/types/type_matchups.asm)
; - TypeBoostItems (see data/types/type_boost_items.asm)
	const_def

	const NORMAL   ; 00
	const FIGHTING ; 01
	const FLYING   ; 02
	const POISON   ; 03
	const GROUND   ; 04
	const ROCK     ; 05
	const BIRD     ; 06
	const BUG      ; 07
	const GHOST    ; 08
	const STEEL    ; 09

UNUSED_TYPES EQU const_value
	const TYPE_10  ; 0a
	const TYPE_11  ; 0b
	const TYPE_12  ; 0c
	const TYPE_13  ; 0d
	const TYPE_14  ; 0e
	const TYPE_15  ; 0f
	const TYPE_16  ; 10
	const TYPE_17  ; 11
	const TYPE_18  ; 12
	const CURSE_T  ; 13
UNUSED_TYPES_END EQU const_value

	const FIRE     ; 14
	const WATER    ; 15
	const GRASS    ; 16
	const ELECTRIC ; 17
	const PSYCHIC  ; 18
	const ICE      ; 19
	const DRAGON   ; 1a
	const DARK     ; 1b
TYPES_END EQU const_value

NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END

TYPE_MASK     EQU %00111111
CATEGORY_MASK EQU %11000000
PHYSICAL      EQU %01000000
SPECIAL       EQU %10000000
STATUS        EQU %11000000
