_ble_uart_setup:
;ble_uart.c,86 :: 		void ble_uart_setup(uint8_t pin_mosi, uint8_t pin_miso, uint8_t pin_sck, uint8_t pin_reqn, uint8_t pin_rdyn, uint8_t pin_reset)
; pin_reqn start address is: 12 (R3)
; pin_sck start address is: 8 (R2)
; pin_miso start address is: 4 (R1)
; pin_mosi start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
UXTB	R8, R1
UXTB	R9, R2
UXTB	R10, R3
; pin_reqn end address is: 12 (R3)
; pin_sck end address is: 8 (R2)
; pin_miso end address is: 4 (R1)
; pin_mosi end address is: 0 (R0)
; pin_mosi start address is: 28 (R7)
; pin_miso start address is: 32 (R8)
; pin_sck start address is: 36 (R9)
; pin_reqn start address is: 40 (R10)
; pin_rdyn start address is: 44 (R11)
LDRB	R11, [SP, #4]
; pin_reset start address is: 48 (R12)
LDRB	R12, [SP, #8]
;ble_uart.c,88 :: 		UART1_Write_Text("BLE P Click Setup");
MOVW	R4, #lo_addr(?lstr1_ble_uart+0)
MOVT	R4, #hi_addr(?lstr1_ble_uart+0)
MOV	R0, R4
BL	_UART1_Write_Text+0
;ble_uart.c,89 :: 		UART1_Write_Text("Set line ending to newline to send data from the serial monitor");
MOVW	R4, #lo_addr(?lstr2_ble_uart+0)
MOVT	R4, #hi_addr(?lstr2_ble_uart+0)
MOV	R0, R4
BL	_UART1_Write_Text+0
;ble_uart.c,94 :: 		if (NULL != services_pipe_type_mapping)
MOVS	R5, #0
MOVW	R4, #lo_addr(ble_uart_services_pipe_type_mapping+0)
MOVT	R4, #hi_addr(ble_uart_services_pipe_type_mapping+0)
CMP	R5, R4
IT	EQ
BEQ	L_ble_uart_setup0
;ble_uart.c,96 :: 		aci_state.aci_setup_info.services_pipe_type_mapping = &services_pipe_type_mapping[0];
MOVW	R5, #lo_addr(ble_uart_services_pipe_type_mapping+0)
MOVT	R5, #hi_addr(ble_uart_services_pipe_type_mapping+0)
MOVW	R4, #lo_addr(_aci_state+12)
MOVT	R4, #hi_addr(_aci_state+12)
STR	R5, [R4, #0]
;ble_uart.c,97 :: 		}
IT	AL
BAL	L_ble_uart_setup1
L_ble_uart_setup0:
;ble_uart.c,100 :: 		aci_state.aci_setup_info.services_pipe_type_mapping = NULL;
MOVS	R5, #0
MOVW	R4, #lo_addr(_aci_state+12)
MOVT	R4, #hi_addr(_aci_state+12)
STR	R5, [R4, #0]
;ble_uart.c,101 :: 		}
L_ble_uart_setup1:
;ble_uart.c,102 :: 		aci_state.aci_setup_info.number_of_pipes    = NUMBER_OF_PIPES;
MOVS	R5, #12
MOVW	R4, #lo_addr(_aci_state+16)
MOVT	R4, #hi_addr(_aci_state+16)
STRB	R5, [R4, #0]
;ble_uart.c,103 :: 		aci_state.aci_setup_info.setup_msgs         = (hal_aci_data_t*) setup_msgs;
MOVW	R5, #lo_addr(ble_uart_setup_msgs+0)
MOVT	R5, #hi_addr(ble_uart_setup_msgs+0)
MOVW	R4, #lo_addr(_aci_state+20)
MOVT	R4, #hi_addr(_aci_state+20)
STR	R5, [R4, #0]
;ble_uart.c,104 :: 		aci_state.aci_setup_info.num_setup_msgs     = NB_SETUP_MESSAGES;
MOVS	R5, #34
MOVW	R4, #lo_addr(_aci_state+24)
MOVT	R4, #hi_addr(_aci_state+24)
STRB	R5, [R4, #0]
;ble_uart.c,110 :: 		aci_state.aci_pins.board_name = BOARD_DEFAULT; //See board.h for details
MOVS	R5, #0
MOVW	R4, #lo_addr(_aci_state+0)
MOVT	R4, #hi_addr(_aci_state+0)
STRB	R5, [R4, #0]
;ble_uart.c,111 :: 		aci_state.aci_pins.mosi_pin   = pin_mosi;
MOVW	R4, #lo_addr(_aci_state+3)
MOVT	R4, #hi_addr(_aci_state+3)
STRB	R7, [R4, #0]
; pin_mosi end address is: 28 (R7)
;ble_uart.c,112 :: 		aci_state.aci_pins.miso_pin   = pin_miso;
MOVW	R4, #lo_addr(_aci_state+4)
MOVT	R4, #hi_addr(_aci_state+4)
STRB	R8, [R4, #0]
; pin_miso end address is: 32 (R8)
;ble_uart.c,113 :: 		aci_state.aci_pins.reqn_pin   = pin_reqn;
MOVW	R4, #lo_addr(_aci_state+1)
MOVT	R4, #hi_addr(_aci_state+1)
STRB	R10, [R4, #0]
; pin_reqn end address is: 40 (R10)
;ble_uart.c,114 :: 		aci_state.aci_pins.rdyn_pin   = pin_rdyn;
MOVW	R4, #lo_addr(_aci_state+2)
MOVT	R4, #hi_addr(_aci_state+2)
STRB	R11, [R4, #0]
; pin_rdyn end address is: 44 (R11)
;ble_uart.c,115 :: 		aci_state.aci_pins.sck_pin    = pin_sck;
MOVW	R4, #lo_addr(_aci_state+5)
MOVT	R4, #hi_addr(_aci_state+5)
STRB	R9, [R4, #0]
; pin_sck end address is: 36 (R9)
;ble_uart.c,116 :: 		aci_state.aci_pins.reset_pin  = pin_reset;
MOVW	R4, #lo_addr(_aci_state+7)
MOVT	R4, #hi_addr(_aci_state+7)
STRB	R12, [R4, #0]
; pin_reset end address is: 48 (R12)
;ble_uart.c,121 :: 		aci_state.aci_pins.active_pin             = ACTIVE_PIN;
MOVS	R5, #6
MOVW	R4, #lo_addr(_aci_state+8)
MOVT	R4, #hi_addr(_aci_state+8)
STRB	R5, [R4, #0]
;ble_uart.c,124 :: 		aci_state.aci_pins.interface_is_interrupt = false;
MOVS	R5, #0
MOVW	R4, #lo_addr(_aci_state+10)
MOVT	R4, #hi_addr(_aci_state+10)
STRB	R5, [R4, #0]
;ble_uart.c,125 :: 		aci_state.aci_pins.interrupt_number       = 1;
MOVS	R5, #1
MOVW	R4, #lo_addr(_aci_state+11)
MOVT	R4, #hi_addr(_aci_state+11)
STRB	R5, [R4, #0]
;ble_uart.c,131 :: 		lib_aci_init(&aci_state, false);
MOVS	R1, #0
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_lib_aci_init+0
;ble_uart.c,133 :: 		UART1_Write_Text("SETUP DONE");
MOVW	R4, #lo_addr(?lstr3_ble_uart+0)
MOVT	R4, #hi_addr(?lstr3_ble_uart+0)
MOV	R0, R4
BL	_UART1_Write_Text+0
;ble_uart.c,134 :: 		}
L_end_ble_uart_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ble_uart_setup
_ble_uart_name_set:
;ble_uart.c,136 :: 		void ble_uart_name_set(const char* device_name, uint8_t name_length)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #4]
STRB	R1, [SP, #8]
;ble_uart.c,139 :: 		if (lib_aci_set_local_data(&aci_state, PIPE_GAP_DEVICE_NAME_SET, (uint8_t*) device_name, min(name_length, 16)))
MOVS	R1, #16
LDRB	R0, [SP, #8]
BL	_min+0
LDR	R2, [SP, #4]
UXTB	R3, R0
MOVS	R1, #1
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_lib_aci_set_local_data+0
CMP	R0, #0
IT	EQ
BEQ	L_ble_uart_name_set2
;ble_uart.c,141 :: 		UART1_Write_Text("Name set. New name: ");
MOVW	R2, #lo_addr(?lstr4_ble_uart+0)
MOVT	R2, #hi_addr(?lstr4_ble_uart+0)
MOV	R0, R2
BL	_UART1_Write_Text+0
;ble_uart.c,142 :: 		for ( i = 0; i < min(name_length, 16); ++i)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
UXTB	R4, R6
L_ble_uart_name_set3:
; i start address is: 16 (R4)
MOVS	R1, #16
LDRB	R0, [SP, #8]
BL	_min+0
CMP	R4, R0
IT	GE
BGE	L_ble_uart_name_set4
;ble_uart.c,144 :: 		UART1_Write(device_name[i]);
LDR	R2, [SP, #4]
ADDS	R2, R2, R4
LDRB	R2, [R2, #0]
UXTH	R0, R2
BL	_UART1_Write+0
;ble_uart.c,142 :: 		for ( i = 0; i < min(name_length, 16); ++i)
ADDS	R2, R4, #1
; i end address is: 16 (R4)
; i start address is: 24 (R6)
UXTB	R6, R2
;ble_uart.c,145 :: 		}
UXTB	R4, R6
; i end address is: 24 (R6)
IT	AL
BAL	L_ble_uart_name_set3
L_ble_uart_name_set4:
;ble_uart.c,147 :: 		}
IT	AL
BAL	L_ble_uart_name_set6
L_ble_uart_name_set2:
;ble_uart.c,150 :: 		UART1_Write_Text("Name setting failed.");
MOVW	R2, #lo_addr(?lstr5_ble_uart+0)
MOVT	R2, #hi_addr(?lstr5_ble_uart+0)
MOV	R0, R2
BL	_UART1_Write_Text+0
;ble_uart.c,151 :: 		}
L_ble_uart_name_set6:
;ble_uart.c,152 :: 		}
L_end_ble_uart_name_set:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _ble_uart_name_set
_ble_uart_tx:
;ble_uart.c,156 :: 		bool ble_uart_tx(uint8_t *buffer, uint8_t buffer_len)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R0, [SP, #8]
STRB	R1, [SP, #12]
;ble_uart.c,158 :: 		bool status = false;
MOVS	R2, #0
STRB	R2, [SP, #4]
;ble_uart.c,160 :: 		if (lib_aci_is_pipe_available(&aci_state, PIPE_UART_OVER_BTLE_UART_TX_TX) &&
MOVS	R1, #9
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_lib_aci_is_pipe_available+0
;ble_uart.c,161 :: 		(aci_state.data_credit_available >= 1))
CMP	R0, #0
IT	EQ
BEQ	L__ble_uart_tx16
MOVW	R2, #lo_addr(_aci_state+31)
MOVT	R2, #hi_addr(_aci_state+31)
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	CC
BCC	L__ble_uart_tx15
L__ble_uart_tx14:
;ble_uart.c,163 :: 		status = lib_aci_send_data(PIPE_UART_OVER_BTLE_UART_TX_TX, buffer, buffer_len);
LDRB	R2, [SP, #12]
LDR	R1, [SP, #8]
MOVS	R0, #9
BL	_lib_aci_send_data+0
STRB	R0, [SP, #4]
;ble_uart.c,164 :: 		if (status)
CMP	R0, #0
IT	EQ
BEQ	L_ble_uart_tx10
;ble_uart.c,166 :: 		aci_state.data_credit_available--;
MOVW	R3, #lo_addr(_aci_state+31)
MOVT	R3, #hi_addr(_aci_state+31)
LDRB	R2, [R3, #0]
SUBS	R2, R2, #1
STRB	R2, [R3, #0]
;ble_uart.c,167 :: 		}
L_ble_uart_tx10:
;ble_uart.c,161 :: 		(aci_state.data_credit_available >= 1))
L__ble_uart_tx16:
L__ble_uart_tx15:
;ble_uart.c,170 :: 		return status;
LDRB	R0, [SP, #4]
;ble_uart.c,171 :: 		}
L_end_ble_uart_tx:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _ble_uart_tx
_ble_uart_loop:
;ble_uart.c,173 :: 		void ble_uart_loop() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ble_uart.c,176 :: 		aci_loop();
BL	_aci_loop+0
;ble_uart.c,177 :: 		}
L_end_ble_uart_loop:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ble_uart_loop
_ble_uart_rx:
;ble_uart.c,179 :: 		void ble_uart_rx(uint8_t *buffer, uint8_t len)
; len start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R7, R0
UXTB	R8, R1
; len end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 28 (R7)
; len start address is: 32 (R8)
;ble_uart.c,182 :: 		UART1_Write_Text("Received data: ");
MOVW	R2, #lo_addr(?lstr6_ble_uart+0)
MOVT	R2, #hi_addr(?lstr6_ble_uart+0)
MOV	R0, R2
BL	_UART1_Write_Text+0
;ble_uart.c,184 :: 		for (i = 0; i < len; ++i)
; i start address is: 24 (R6)
MOVS	R6, #0
; buffer end address is: 28 (R7)
; len end address is: 32 (R8)
; i end address is: 24 (R6)
MOV	R5, R7
UXTB	R4, R8
L_ble_uart_rx11:
; i start address is: 24 (R6)
; buffer start address is: 20 (R5)
; len start address is: 16 (R4)
; buffer start address is: 20 (R5)
; buffer end address is: 20 (R5)
CMP	R6, R4
IT	CS
BCS	L_ble_uart_rx12
; buffer end address is: 20 (R5)
;ble_uart.c,186 :: 		UART1_Write((char) buffer[i]);
; buffer start address is: 20 (R5)
ADDS	R2, R5, R6
LDRB	R0, [R2, #0]
BL	_UART1_Write+0
;ble_uart.c,184 :: 		for (i = 0; i < len; ++i)
ADDS	R6, R6, #1
UXTB	R6, R6
;ble_uart.c,187 :: 		}
; len end address is: 16 (R4)
; buffer end address is: 20 (R5)
; i end address is: 24 (R6)
IT	AL
BAL	L_ble_uart_rx11
L_ble_uart_rx12:
;ble_uart.c,188 :: 		}
L_end_ble_uart_rx:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ble_uart_rx
