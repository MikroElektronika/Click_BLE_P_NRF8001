_blep_hal_init:
;blep_hal.c,83 :: 		void blep_hal_init()
;blep_hal.c,90 :: 		write_spi_p = SPI_Wr_Ptr;
MOVW	R0, #lo_addr(_SPI_Wr_Ptr+0)
MOVT	R0, #hi_addr(_SPI_Wr_Ptr+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(blep_hal_write_spi_p+0)
MOVT	R0, #hi_addr(blep_hal_write_spi_p+0)
STR	R1, [R0, #0]
;blep_hal.c,91 :: 		read_spi_p = SPI_Rd_Ptr;
MOVW	R0, #lo_addr(_SPI_Rd_Ptr+0)
MOVT	R0, #hi_addr(_SPI_Rd_Ptr+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(blep_hal_read_spi_p+0)
MOVT	R0, #hi_addr(blep_hal_read_spi_p+0)
STR	R1, [R0, #0]
;blep_hal.c,104 :: 		}
L_end_blep_hal_init:
BX	LR
; end of _blep_hal_init
_blep_hal_transfer:
;blep_hal.c,106 :: 		uint8_t blep_hal_transfer (uint8_t _payload)
; _payload start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; _payload end address is: 0 (R0)
; _payload start address is: 0 (R0)
;blep_hal.c,109 :: 		return read_spi_p(_payload);
; _payload end address is: 0 (R0)
MOVW	R4, #lo_addr(blep_hal_read_spi_p+0)
MOVT	R4, #hi_addr(blep_hal_read_spi_p+0)
LDR	R4, [R4, #0]
BLX	R4
UXTB	R0, R0
;blep_hal.c,110 :: 		}
L_end_blep_hal_transfer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _blep_hal_transfer
_digitalWrite:
;blep_hal.c,112 :: 		void digitalWrite (uint8_t pin_num, uint8_t level)
; level start address is: 4 (R1)
; pin_num start address is: 0 (R0)
; level end address is: 4 (R1)
; pin_num end address is: 0 (R0)
; pin_num start address is: 0 (R0)
; level start address is: 4 (R1)
;blep_hal.c,114 :: 		switch ( pin_num)
IT	AL
BAL	L_digitalWrite0
; pin_num end address is: 0 (R0)
;blep_hal.c,116 :: 		case REQN_PIN:
L_digitalWrite2:
;blep_hal.c,117 :: 		CS = level;
MOVW	R2, #lo_addr(CS+0)
MOVT	R2, #hi_addr(CS+0)
STR	R1, [R2, #0]
; level end address is: 4 (R1)
;blep_hal.c,118 :: 		break;
IT	AL
BAL	L_digitalWrite1
;blep_hal.c,119 :: 		case RDYN_PIN:
L_digitalWrite3:
;blep_hal.c,120 :: 		RDYN = level;
; level start address is: 4 (R1)
MOVW	R2, #lo_addr(RDYN+0)
MOVT	R2, #hi_addr(RDYN+0)
STR	R1, [R2, #0]
; level end address is: 4 (R1)
;blep_hal.c,121 :: 		break;
IT	AL
BAL	L_digitalWrite1
;blep_hal.c,122 :: 		case RESET_PIN:
L_digitalWrite4:
;blep_hal.c,123 :: 		RST = level;
; level start address is: 4 (R1)
MOVW	R2, #lo_addr(RST+0)
MOVT	R2, #hi_addr(RST+0)
STR	R1, [R2, #0]
; level end address is: 4 (R1)
;blep_hal.c,124 :: 		break;
IT	AL
BAL	L_digitalWrite1
;blep_hal.c,125 :: 		case ACTIVE_PIN:
L_digitalWrite5:
;blep_hal.c,126 :: 		ACT = level;
; level start address is: 4 (R1)
MOVW	R2, #lo_addr(ACT+0)
MOVT	R2, #hi_addr(ACT+0)
STR	R1, [R2, #0]
; level end address is: 4 (R1)
;blep_hal.c,127 :: 		break;
IT	AL
BAL	L_digitalWrite1
;blep_hal.c,128 :: 		}
L_digitalWrite0:
; level start address is: 4 (R1)
; pin_num start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_digitalWrite2
CMP	R0, #1
IT	EQ
BEQ	L_digitalWrite3
CMP	R0, #5
IT	EQ
BEQ	L_digitalWrite4
CMP	R0, #6
IT	EQ
BEQ	L_digitalWrite5
; pin_num end address is: 0 (R0)
; level end address is: 4 (R1)
L_digitalWrite1:
;blep_hal.c,129 :: 		}
L_end_digitalWrite:
BX	LR
; end of _digitalWrite
_digitalRead:
;blep_hal.c,131 :: 		uint8_t digitalRead(uint8_t pin_num)
; pin_num start address is: 0 (R0)
SUB	SP, SP, #4
; pin_num end address is: 0 (R0)
; pin_num start address is: 0 (R0)
;blep_hal.c,134 :: 		switch ( pin_num)
IT	AL
BAL	L_digitalRead6
; pin_num end address is: 0 (R0)
;blep_hal.c,136 :: 		case REQN_PIN:
L_digitalRead8:
;blep_hal.c,137 :: 		temp = (uint8_t)CS;
MOVW	R2, #lo_addr(CS+0)
MOVT	R2, #hi_addr(CS+0)
LDR	R1, [R2, #0]
STRB	R1, [SP, #0]
;blep_hal.c,138 :: 		break;
IT	AL
BAL	L_digitalRead7
;blep_hal.c,139 :: 		case RDYN_PIN:
L_digitalRead9:
;blep_hal.c,140 :: 		temp = (uint8_t)RDYN;
MOVW	R2, #lo_addr(RDYN+0)
MOVT	R2, #hi_addr(RDYN+0)
LDR	R1, [R2, #0]
STRB	R1, [SP, #0]
;blep_hal.c,141 :: 		break;
IT	AL
BAL	L_digitalRead7
;blep_hal.c,142 :: 		case RESET_PIN:
L_digitalRead10:
;blep_hal.c,143 :: 		temp = (uint8_t)RST;
MOVW	R2, #lo_addr(RST+0)
MOVT	R2, #hi_addr(RST+0)
LDR	R1, [R2, #0]
STRB	R1, [SP, #0]
;blep_hal.c,144 :: 		break;
IT	AL
BAL	L_digitalRead7
;blep_hal.c,145 :: 		case ACTIVE_PIN:
L_digitalRead11:
;blep_hal.c,146 :: 		temp = (uint8_t)ACT;
MOVW	R2, #lo_addr(ACT+0)
MOVT	R2, #hi_addr(ACT+0)
LDR	R1, [R2, #0]
STRB	R1, [SP, #0]
;blep_hal.c,147 :: 		break;
IT	AL
BAL	L_digitalRead7
;blep_hal.c,148 :: 		}
L_digitalRead6:
; pin_num start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_digitalRead8
CMP	R0, #1
IT	EQ
BEQ	L_digitalRead9
CMP	R0, #5
IT	EQ
BEQ	L_digitalRead10
CMP	R0, #6
IT	EQ
BEQ	L_digitalRead11
; pin_num end address is: 0 (R0)
L_digitalRead7:
;blep_hal.c,149 :: 		return temp;
LDRB	R0, [SP, #0]
;blep_hal.c,150 :: 		}
L_end_digitalRead:
ADD	SP, SP, #4
BX	LR
; end of _digitalRead
