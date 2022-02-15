MAJOR EQU 0
MINOR EQU 4
PATCH EQU 1

wrong_rgbds: MACRO
	fail "requires rgbds v0.4.1 for best results."
ENDM

IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	wrong_rgbds
ELSE
IF (__RGBDS_MAJOR__ != MAJOR) || (__RGBDS_MINOR__ != MINOR) || (__RGBDS_PATCH__ != PATCH)
	wrong_rgbds
ENDC
ENDC
