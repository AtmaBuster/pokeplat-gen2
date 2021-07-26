MiningObstacleList:
	dw .v_1x4
	dw .v_2x4
	dw .h_4x1
	dw .h_4x2
	dw .s_2x2
	dw .s_3x3
	dw .z_2x3_1
	dw .z_2x3_2
	dw .z_3x2_1
	dw .z_3x2_2
	dw .t_1
	dw .t_2
	dw .t_3
	dw .t_4

.v_1x4
	db 1, 4
	db $0a
	db $1a
	db $1a
	db $12

.v_2x4
	db 2, 4
	db $0b, $0c
	db $1b, $1c
	db $1b, $1c
	db $13, $14

.h_4x1
	db 4, 1
	db $07, $08, $08, $09

.h_4x2
	db 4, 2
	db $0b, $18, $18, $0c
	db $13, $19, $19, $14

.s_2x2
	db 2, 2
	db $0b, $0c
	db $13, $14

.s_3x3
	db 3, 3
	db $0b, $18, $0c
	db $1b, $0d, $1c
	db $13, $19, $14

.z_2x3_1
	db 2, 3
	db $0a, $00
	db $0e, $0f
	db $00, $12

.z_2x3_2
	db 2, 3
	db $00, $0a
	db $1e, $1f
	db $12, $00

.z_3x2_1
	db 3, 2
	db $07, $0f, $00
	db $00, $0e, $09

.z_3x2_2
	db 3, 2
	db $00, $1e, $09
	db $07, $1f, $00

.t_1
	db 2, 3
	db $0a, $00
	db $1d, $09
	db $12, $00

.t_2
	db 2, 3
	db $00, $0a
	db $07, $17
	db $00, $12

.t_3
	db 3, 2
	db $00, $0a, $00
	db $07, $15, $09

.t_4
	db 3, 2
	db $07, $16, $09
	db $00, $12, $00
