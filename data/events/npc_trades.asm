npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1
	dw \2, \3
	db \4, \5, \6, \7
	shift
	dw \7
	db \8, \9
	db 0, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	npctrade TRADE_DIALOGSET_HILARY,  MACHOP,   ABRA,     "KAZZA@@@@@@", $88, $ad, BERRY,        25643, "HILARY@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NORTON,  BUIZEL,   CHATOT,   "CHARAP@@@@@", $78, $da, MYSTERYBERRY, 44142, "NORTON@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_MINDY,   MEDICHAM, HAUNTER,  "GASPAR@@@@@", $d8, $d8, EVERSTONE,    19248, "MINDY@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_MEISTER, FINNEON,  MAGIKARP, "FOPPA@@@@@@", $78, $aa, MIRACLEBERRY, 53277, "MEISTER@", TRADE_GENDER_EITHER
