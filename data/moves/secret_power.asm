secretpowerdata: MACRO
	db \1
	dw \2
	dba \3
ENDM

SecretPowerTypeData:
	secretpowerdata NORMAL, BODY_SLAM, BattleCommand_paralyzetarget
	secretpowerdata GROUND, MUD_SLAP, SecretPowerLowerAccuracy
	secretpowerdata ROCK,   ROCK_THROW, BattleCommand_flinchtarget
	secretpowerdata GRASS,  NEEDLE_ARM, SecretPowerSleep
	secretpowerdata WATER,  WATER_PULSE, SecretPowerLowerAttack
	secretpowerdata ICE,    AVALANCHE, BattleCommand_freezetarget
	db -1
