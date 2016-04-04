___ble_assert:
;uart_aci.c,63 :: 		void __ble_assert(const char *file, uint16_t line)
; line start address is: 4 (R1)
; file start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R4, R0
UXTH	R5, R1
; line end address is: 4 (R1)
; file end address is: 0 (R0)
; file start address is: 16 (R4)
; line start address is: 20 (R5)
;uart_aci.c,65 :: 		PRINT("BLE UART ERROR");
MOVW	R2, #lo_addr(?lstr_1_uart_aci+0)
UXTH	R0, R2
BL	_UART1_Write+0
;uart_aci.c,66 :: 		PRINT(file);
UXTH	R0, R4
; file end address is: 16 (R4)
BL	_UART1_Write+0
;uart_aci.c,67 :: 		PRINT(": ");
MOVW	R2, #lo_addr(?lstr_2_uart_aci+0)
UXTH	R0, R2
BL	_UART1_Write+0
;uart_aci.c,68 :: 		PRINT(line);
UXTH	R0, R5
; line end address is: 20 (R5)
BL	_UART1_Write+0
;uart_aci.c,69 :: 		PRINT("\n");
MOVW	R2, #lo_addr(?lstr_3_uart_aci+0)
UXTH	R0, R2
BL	_UART1_Write+0
;uart_aci.c,70 :: 		while(1);
L___ble_assert0:
IT	AL
BAL	L___ble_assert0
;uart_aci.c,71 :: 		}
L_end___ble_assert:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ___ble_assert
_uart_process_control_point_rx:
;uart_aci.c,75 :: 		bool uart_process_control_point_rx(uint8_t *byte, uint8_t length)
; status start address is: 12 (R3)
; byte start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
;uart_aci.c,77 :: 		bool status = false;
;uart_aci.c,75 :: 		bool uart_process_control_point_rx(uint8_t *byte, uint8_t length)
;uart_aci.c,77 :: 		bool status = false;
;uart_aci.c,75 :: 		bool uart_process_control_point_rx(uint8_t *byte, uint8_t length)
MOV	R1, R0
; status end address is: 12 (R3)
; byte end address is: 0 (R0)
; byte start address is: 4 (R1)
;uart_aci.c,77 :: 		bool status = false;
; status start address is: 12 (R3)
MOVS	R3, #0
;uart_aci.c,80 :: 		if (lib_aci_is_pipe_available(&aci_state, PIPE_UART_OVER_BTLE_UART_CONTROL_POINT_TX) )
STRB	R3, [SP, #4]
STR	R1, [SP, #8]
MOVS	R1, #10
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_lib_aci_is_pipe_available+0
LDR	R1, [SP, #8]
LDRB	R3, [SP, #4]
CMP	R0, #0
IT	EQ
BEQ	L__uart_process_control_point_rx46
;uart_aci.c,83 :: 		switch(*byte)
IT	AL
BAL	L_uart_process_control_point_rx3
; byte end address is: 4 (R1)
; status end address is: 12 (R3)
;uart_aci.c,89 :: 		case UART_OVER_BLE_DISCONNECT:
L_uart_process_control_point_rx5:
;uart_aci.c,94 :: 		lib_aci_disconnect(&aci_state, ACI_REASON_TERMINATE);
MOVS	R1, #1
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_lib_aci_disconnect+0
;uart_aci.c,95 :: 		status = true;
; status start address is: 0 (R0)
MOVS	R0, #1
;uart_aci.c,96 :: 		break;
; status end address is: 0 (R0)
IT	AL
BAL	L_uart_process_control_point_rx4
;uart_aci.c,102 :: 		case UART_OVER_BLE_LINK_TIMING_REQ:
L_uart_process_control_point_rx6:
;uart_aci.c,112 :: 		conn_params = (aci_ll_conn_params_t *)(byte+1);
; byte start address is: 4 (R1)
ADDS	R6, R1, #1
; byte end address is: 4 (R1)
;uart_aci.c,116 :: 		conn_params->timeout_mult);
ADDS	R2, R6, #6
LDRH	R2, [R2, #0]
UXTH	R5, R2
;uart_aci.c,115 :: 		conn_params->slave_latency,
ADDS	R2, R6, #4
LDRH	R2, [R2, #0]
UXTH	R4, R2
;uart_aci.c,114 :: 		conn_params->max_conn_interval,
ADDS	R2, R6, #2
LDRH	R2, [R2, #0]
UXTH	R3, R2
;uart_aci.c,113 :: 		lib_aci_change_timing( conn_params->min_conn_interval,
LDRH	R2, [R6, #0]
;uart_aci.c,114 :: 		conn_params->max_conn_interval,
UXTH	R1, R3
;uart_aci.c,116 :: 		conn_params->timeout_mult);
UXTH	R3, R5
;uart_aci.c,113 :: 		lib_aci_change_timing( conn_params->min_conn_interval,
UXTH	R0, R2
;uart_aci.c,115 :: 		conn_params->slave_latency,
UXTH	R2, R4
;uart_aci.c,116 :: 		conn_params->timeout_mult);
BL	_lib_aci_change_timing+0
;uart_aci.c,117 :: 		status = true;
; status start address is: 0 (R0)
MOVS	R0, #1
;uart_aci.c,118 :: 		break;
; status end address is: 0 (R0)
IT	AL
BAL	L_uart_process_control_point_rx4
;uart_aci.c,123 :: 		case UART_OVER_BLE_TRANSMIT_STOP:
L_uart_process_control_point_rx7:
;uart_aci.c,128 :: 		uart_over_ble.uart_rts_local = false;
MOVS	R3, #0
MOVW	R2, #lo_addr(uart_aci_uart_over_ble+0)
MOVT	R2, #hi_addr(uart_aci_uart_over_ble+0)
STRB	R3, [R2, #0]
;uart_aci.c,129 :: 		status = true;
; status start address is: 0 (R0)
MOVS	R0, #1
;uart_aci.c,130 :: 		break;
; status end address is: 0 (R0)
IT	AL
BAL	L_uart_process_control_point_rx4
;uart_aci.c,136 :: 		case UART_OVER_BLE_TRANSMIT_OK:
L_uart_process_control_point_rx8:
;uart_aci.c,141 :: 		uart_over_ble.uart_rts_local = true;
MOVS	R3, #1
MOVW	R2, #lo_addr(uart_aci_uart_over_ble+0)
MOVT	R2, #hi_addr(uart_aci_uart_over_ble+0)
STRB	R3, [R2, #0]
;uart_aci.c,142 :: 		status = true;
; status start address is: 0 (R0)
MOVS	R0, #1
;uart_aci.c,143 :: 		break;
; status end address is: 0 (R0)
IT	AL
BAL	L_uart_process_control_point_rx4
;uart_aci.c,144 :: 		}
L_uart_process_control_point_rx3:
; status start address is: 12 (R3)
; byte start address is: 4 (R1)
LDRB	R2, [R1, #0]
CMP	R2, #1
IT	EQ
BEQ	L_uart_process_control_point_rx5
LDRB	R2, [R1, #0]
CMP	R2, #2
IT	EQ
BEQ	L_uart_process_control_point_rx6
LDRB	R2, [R1, #0]
CMP	R2, #3
IT	EQ
BEQ	L_uart_process_control_point_rx7
LDRB	R2, [R1, #0]
; byte end address is: 4 (R1)
CMP	R2, #4
IT	EQ
BEQ	L_uart_process_control_point_rx8
; status end address is: 12 (R3)
UXTB	R0, R3
L_uart_process_control_point_rx4:
;uart_aci.c,145 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_uart_process_control_point_rx2
L__uart_process_control_point_rx46:
;uart_aci.c,80 :: 		if (lib_aci_is_pipe_available(&aci_state, PIPE_UART_OVER_BTLE_UART_CONTROL_POINT_TX) )
UXTB	R0, R3
;uart_aci.c,145 :: 		}
L_uart_process_control_point_rx2:
;uart_aci.c,147 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;uart_aci.c,148 :: 		}
L_end_uart_process_control_point_rx:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _uart_process_control_point_rx
_aci_loop:
;uart_aci.c,150 :: 		void aci_loop()
SUB	SP, SP, #32
STR	LR, [SP, #0]
;uart_aci.c,155 :: 		if (lib_aci_event_get(&aci_state, &aci_data))
MOVW	R1, #lo_addr(uart_aci_aci_data+0)
MOVT	R1, #hi_addr(uart_aci_aci_data+0)
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_lib_aci_event_get+0
CMP	R0, #0
IT	EQ
BEQ	L_aci_loop9
;uart_aci.c,158 :: 		aci_evt = &aci_data.evt;
; aci_evt start address is: 12 (R3)
MOVW	R3, #lo_addr(uart_aci_aci_data+1)
MOVT	R3, #hi_addr(uart_aci_aci_data+1)
;uart_aci.c,159 :: 		switch(aci_evt->evt_opcode)
ADDS	R0, R3, #1
STR	R0, [SP, #28]
IT	AL
BAL	L_aci_loop10
;uart_aci.c,164 :: 		case ACI_EVT_DEVICE_STARTED:
L_aci_loop12:
;uart_aci.c,166 :: 		aci_state.data_credit_total = aci_evt->params.device_started.credit_available;
ADDS	R2, R3, #2
ADDS	R0, R2, #2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_aci_state+29)
MOVT	R0, #hi_addr(_aci_state+29)
STRB	R1, [R0, #0]
;uart_aci.c,167 :: 		switch(aci_evt->params.device_started.device_mode)
MOV	R0, R2
STR	R0, [SP, #24]
IT	AL
BAL	L_aci_loop13
; aci_evt end address is: 12 (R3)
;uart_aci.c,169 :: 		case ACI_DEVICE_SETUP:
L_aci_loop15:
;uart_aci.c,173 :: 		UART1_Write_Text(" Event device started: Setup ");
MOVW	R0, #lo_addr(?lstr4_uart_aci+0)
MOVT	R0, #hi_addr(?lstr4_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,174 :: 		setup_required = true;
MOVS	R1, #1
MOVW	R0, #lo_addr(aci_loop_setup_required_L0+0)
MOVT	R0, #hi_addr(aci_loop_setup_required_L0+0)
STRB	R1, [R0, #0]
;uart_aci.c,175 :: 		break;
IT	AL
BAL	L_aci_loop14
;uart_aci.c,177 :: 		case ACI_DEVICE_STANDBY:
L_aci_loop16:
;uart_aci.c,178 :: 		UART1_Write_Text(" Evt Device Started: Standby ");
; aci_evt start address is: 12 (R3)
MOVW	R0, #lo_addr(?lstr5_uart_aci+0)
MOVT	R0, #hi_addr(?lstr5_uart_aci+0)
STR	R3, [SP, #4]
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,181 :: 		if (aci_evt->params.device_started.hw_error)
ADDS	R0, R3, #2
; aci_evt end address is: 12 (R3)
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_aci_loop17
;uart_aci.c,183 :: 		Delay_ms(20); //Handle the HW error event correctly.
MOVW	R7, #15827
MOVT	R7, #14
NOP
NOP
L_aci_loop18:
SUBS	R7, R7, #1
BNE	L_aci_loop18
NOP
NOP
NOP
NOP
;uart_aci.c,184 :: 		}
IT	AL
BAL	L_aci_loop20
L_aci_loop17:
;uart_aci.c,187 :: 		lib_aci_connect(0/* in seconds : 0 means forever */, 0x0050 /* advertising interval 50ms*/);
MOVS	R1, #80
MOVS	R0, #0
BL	_lib_aci_connect+0
;uart_aci.c,188 :: 		UART1_Write_Text(" Advertising started : Tap Connect on the nRF UART app ");
MOVW	R0, #lo_addr(?lstr6_uart_aci+0)
MOVT	R0, #hi_addr(?lstr6_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,189 :: 		}
L_aci_loop20:
;uart_aci.c,191 :: 		break;
IT	AL
BAL	L_aci_loop14
;uart_aci.c,192 :: 		default:
L_aci_loop21:
;uart_aci.c,193 :: 		break;
IT	AL
BAL	L_aci_loop14
;uart_aci.c,194 :: 		}
L_aci_loop13:
; aci_evt start address is: 12 (R3)
LDR	R1, [SP, #24]
LDRB	R0, [R1, #0]
CMP	R0, #2
IT	EQ
BEQ	L_aci_loop15
LDRB	R0, [R1, #0]
CMP	R0, #3
IT	EQ
BEQ	L_aci_loop16
; aci_evt end address is: 12 (R3)
IT	AL
BAL	L_aci_loop21
L_aci_loop14:
;uart_aci.c,196 :: 		break; //ACI Device Started Event
IT	AL
BAL	L_aci_loop11
;uart_aci.c,198 :: 		case ACI_EVT_CMD_RSP:
L_aci_loop22:
;uart_aci.c,200 :: 		if (ACI_STATUS_SUCCESS != aci_evt->params.cmd_rsp.cmd_status)
; aci_evt start address is: 12 (R3)
ADDS	R0, R3, #2
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_aci_loop23
;uart_aci.c,205 :: 		UART1_Write_Text("ACI Command ");
MOVW	R0, #lo_addr(?lstr7_uart_aci+0)
MOVT	R0, #hi_addr(?lstr7_uart_aci+0)
STR	R3, [SP, #4]
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,206 :: 		sprinti(txt,"%d",aci_evt->params.cmd_rsp.cmd_opcode);
ADDS	R0, R3, #2
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVW	R1, #lo_addr(?lstr_8_uart_aci+0)
MOVT	R1, #hi_addr(?lstr_8_uart_aci+0)
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
STR	R3, [SP, #4]
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
BL	_sprinti+0
ADD	SP, SP, #12
;uart_aci.c,207 :: 		UART1_Write_Text(txt);
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_UART1_Write_Text+0
;uart_aci.c,208 :: 		UART1_Write_Text("Evt Cmd respone: Status ");
MOVW	R0, #lo_addr(?lstr9_uart_aci+0)
MOVT	R0, #hi_addr(?lstr9_uart_aci+0)
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,209 :: 		sprinti(txt,"%d",aci_evt->params.cmd_rsp.cmd_status);
ADDS	R0, R3, #2
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVW	R1, #lo_addr(?lstr_10_uart_aci+0)
MOVT	R1, #hi_addr(?lstr_10_uart_aci+0)
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
STR	R3, [SP, #4]
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
BL	_sprinti+0
ADD	SP, SP, #12
;uart_aci.c,210 :: 		UART1_Write_Text(txt);
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,211 :: 		}
L_aci_loop23:
;uart_aci.c,212 :: 		if (ACI_CMD_GET_DEVICE_VERSION == aci_evt->params.cmd_rsp.cmd_opcode)
ADDS	R0, R3, #2
LDRB	R0, [R0, #0]
CMP	R0, #9
IT	NE
BNE	L_aci_loop24
;uart_aci.c,216 :: 		(uint8_t *)&(aci_evt->params.cmd_rsp.params.get_device_version), sizeof(aci_evt_cmd_rsp_params_get_device_version_t));
ADDS	R0, R3, #2
; aci_evt end address is: 12 (R3)
ADDS	R0, R0, #2
MOVS	R3, #9
MOV	R2, R0
;uart_aci.c,215 :: 		lib_aci_set_local_data(&aci_state, PIPE_DEVICE_INFORMATION_HARDWARE_REVISION_STRING_SET,
MOVS	R1, #3
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
;uart_aci.c,216 :: 		(uint8_t *)&(aci_evt->params.cmd_rsp.params.get_device_version), sizeof(aci_evt_cmd_rsp_params_get_device_version_t));
BL	_lib_aci_set_local_data+0
;uart_aci.c,217 :: 		}
L_aci_loop24:
;uart_aci.c,218 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,220 :: 		case ACI_EVT_CONNECTED:
L_aci_loop25:
;uart_aci.c,221 :: 		UART1_Write_Text(" Evt Connected ");
MOVW	R0, #lo_addr(?lstr11_uart_aci+0)
MOVT	R0, #hi_addr(?lstr11_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,223 :: 		timing_change_done              = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(uart_aci_timing_change_done+0)
MOVT	R0, #hi_addr(uart_aci_timing_change_done+0)
STRB	R1, [R0, #0]
;uart_aci.c,224 :: 		aci_state.data_credit_available = aci_state.data_credit_total;
MOVW	R0, #lo_addr(_aci_state+29)
MOVT	R0, #hi_addr(_aci_state+29)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_aci_state+31)
MOVT	R0, #hi_addr(_aci_state+31)
STRB	R1, [R0, #0]
;uart_aci.c,229 :: 		lib_aci_device_version();
BL	_lib_aci_device_version+0
;uart_aci.c,230 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,232 :: 		case ACI_EVT_PIPE_STATUS:
L_aci_loop26:
;uart_aci.c,233 :: 		UART1_Write_Text(" Evt Pipe Status ");
MOVW	R0, #lo_addr(?lstr12_uart_aci+0)
MOVT	R0, #hi_addr(?lstr12_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,234 :: 		if (lib_aci_is_pipe_available(&aci_state, PIPE_UART_OVER_BTLE_UART_TX_TX) && (false == timing_change_done))
MOVS	R1, #9
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_lib_aci_is_pipe_available+0
CMP	R0, #0
IT	EQ
BEQ	L__aci_loop49
MOVW	R0, #lo_addr(uart_aci_timing_change_done+0)
MOVT	R0, #hi_addr(uart_aci_timing_change_done+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__aci_loop48
L__aci_loop47:
;uart_aci.c,236 :: 		char hello[]="hello android!";
ADD	R11, SP, #8
ADD	R10, R11, #15
MOVW	R12, #lo_addr(?ICSaci_loop_hello_L3+0)
MOVT	R12, #hi_addr(?ICSaci_loop_hello_L3+0)
BL	___CC2DW+0
;uart_aci.c,237 :: 		lib_aci_change_timing_GAP_PPCP(); // change the timing on the link as specified in the nRFgo studio -> nRF8001 conf. -> GAP.
BL	_lib_aci_change_timing_GAP_PPCP+0
;uart_aci.c,239 :: 		timing_change_done = true;
MOVS	R1, #1
MOVW	R0, #lo_addr(uart_aci_timing_change_done+0)
MOVT	R0, #hi_addr(uart_aci_timing_change_done+0)
STRB	R1, [R0, #0]
;uart_aci.c,242 :: 		ble_uart_tx((uint8_t *)&hello[0], strlen(hello));
ADD	R0, SP, #8
BL	_strlen+0
ADD	R1, SP, #8
STR	R1, [SP, #4]
UXTB	R1, R0
LDR	R0, [SP, #4]
BL	_ble_uart_tx+0
;uart_aci.c,243 :: 		UART1_Write_Text(" Sending: ");
MOVW	R0, #lo_addr(?lstr13_uart_aci+0)
MOVT	R0, #hi_addr(?lstr13_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,244 :: 		UART1_Write_Text(hello);
ADD	R0, SP, #8
BL	_UART1_Write_Text+0
;uart_aci.c,234 :: 		if (lib_aci_is_pipe_available(&aci_state, PIPE_UART_OVER_BTLE_UART_TX_TX) && (false == timing_change_done))
L__aci_loop49:
L__aci_loop48:
;uart_aci.c,246 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,248 :: 		case ACI_EVT_TIMING:
L_aci_loop30:
;uart_aci.c,249 :: 		UART1_Write_Text(" Evt link connection interval changed ");
; aci_evt start address is: 12 (R3)
MOVW	R0, #lo_addr(?lstr14_uart_aci+0)
MOVT	R0, #hi_addr(?lstr14_uart_aci+0)
STR	R3, [SP, #4]
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,252 :: 		(uint8_t *)&(aci_evt->params.timing.conn_rf_interval), /* Byte aligned */
ADDS	R0, R3, #2
; aci_evt end address is: 12 (R3)
;uart_aci.c,253 :: 		PIPE_UART_OVER_BTLE_UART_LINK_TIMING_CURRENT_SET_MAX_SIZE);
MOVS	R3, #6
;uart_aci.c,252 :: 		(uint8_t *)&(aci_evt->params.timing.conn_rf_interval), /* Byte aligned */
MOV	R2, R0
;uart_aci.c,251 :: 		PIPE_UART_OVER_BTLE_UART_LINK_TIMING_CURRENT_SET,
MOVS	R1, #12
;uart_aci.c,250 :: 		lib_aci_set_local_data(&aci_state,
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
;uart_aci.c,253 :: 		PIPE_UART_OVER_BTLE_UART_LINK_TIMING_CURRENT_SET_MAX_SIZE);
BL	_lib_aci_set_local_data+0
;uart_aci.c,254 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,256 :: 		case ACI_EVT_DISCONNECTED:
L_aci_loop31:
;uart_aci.c,257 :: 		UART1_Write_Text(" Evt Disconnected/Advertising timed out ");
MOVW	R0, #lo_addr(?lstr15_uart_aci+0)
MOVT	R0, #hi_addr(?lstr15_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,258 :: 		lib_aci_connect(0/* in seconds  : 0 means forever */, 0x0050 /* advertising interval 50ms*/);
MOVS	R1, #80
MOVS	R0, #0
BL	_lib_aci_connect+0
;uart_aci.c,259 :: 		UART1_Write_Text(" Advertising started. Tap Connect on the nRF UART app ");
MOVW	R0, #lo_addr(?lstr16_uart_aci+0)
MOVT	R0, #hi_addr(?lstr16_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,260 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,262 :: 		case ACI_EVT_DATA_RECEIVED:
L_aci_loop32:
;uart_aci.c,263 :: 		if (PIPE_UART_OVER_BTLE_UART_RX_RX == aci_evt->params.data_received.rx_data.pipe_number)
; aci_evt start address is: 12 (R3)
ADDS	R0, R3, #2
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	NE
BNE	L_aci_loop33
;uart_aci.c,266 :: 		ble_uart_rx(&aci_evt->params.data_received.rx_data.aci_data[0], aci_evt->len - 2);
LDRB	R0, [R3, #0]
SUBS	R1, R0, #2
ADDS	R0, R3, #2
ADDS	R0, R0, #1
STR	R3, [SP, #4]
UXTB	R1, R1
BL	_ble_uart_rx+0
LDR	R3, [SP, #4]
;uart_aci.c,267 :: 		}
L_aci_loop33:
;uart_aci.c,268 :: 		if (PIPE_UART_OVER_BTLE_UART_CONTROL_POINT_RX == aci_evt->params.data_received.rx_data.pipe_number)
ADDS	R0, R3, #2
LDRB	R0, [R0, #0]
CMP	R0, #11
IT	NE
BNE	L_aci_loop34
;uart_aci.c,270 :: 		uart_process_control_point_rx(&aci_evt->params.data_received.rx_data.aci_data[0], aci_evt->len - 2); //Subtract for Opcode and Pipe number
LDRB	R0, [R3, #0]
SUBS	R1, R0, #2
ADDS	R0, R3, #2
; aci_evt end address is: 12 (R3)
ADDS	R0, R0, #1
UXTB	R1, R1
BL	_uart_process_control_point_rx+0
;uart_aci.c,271 :: 		}
L_aci_loop34:
;uart_aci.c,272 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,274 :: 		case ACI_EVT_DATA_CREDIT:
L_aci_loop35:
;uart_aci.c,275 :: 		aci_state.data_credit_available = aci_state.data_credit_available + aci_evt->params.data_credit.credit;
; aci_evt start address is: 12 (R3)
ADDS	R0, R3, #2
; aci_evt end address is: 12 (R3)
LDRB	R2, [R0, #0]
MOVW	R1, #lo_addr(_aci_state+31)
MOVT	R1, #hi_addr(_aci_state+31)
LDRB	R0, [R1, #0]
ADDS	R0, R0, R2
STRB	R0, [R1, #0]
;uart_aci.c,276 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,278 :: 		case ACI_EVT_PIPE_ERROR:
L_aci_loop36:
;uart_aci.c,280 :: 		UART1_Write_Text(" ACI Evt Pipe Error: Pipe #: ");
; aci_evt start address is: 12 (R3)
MOVW	R0, #lo_addr(?lstr17_uart_aci+0)
MOVT	R0, #hi_addr(?lstr17_uart_aci+0)
STR	R3, [SP, #4]
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,281 :: 		sprinti(txt,"%d",aci_evt->params.pipe_error.pipe_number);
ADDS	R0, R3, #2
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVW	R1, #lo_addr(?lstr_18_uart_aci+0)
MOVT	R1, #hi_addr(?lstr_18_uart_aci+0)
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
STR	R3, [SP, #4]
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
BL	_sprinti+0
ADD	SP, SP, #12
;uart_aci.c,282 :: 		UART1_Write_Text(txt);
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_UART1_Write_Text+0
;uart_aci.c,283 :: 		UART1_Write_Text("  Pipe Error Code: 0x");
MOVW	R0, #lo_addr(?lstr19_uart_aci+0)
MOVT	R0, #hi_addr(?lstr19_uart_aci+0)
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,284 :: 		sprinti(txt,"%d",aci_evt->params.pipe_error.error_code);
ADDS	R0, R3, #2
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVW	R1, #lo_addr(?lstr_20_uart_aci+0)
MOVT	R1, #hi_addr(?lstr_20_uart_aci+0)
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
STR	R3, [SP, #4]
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
BL	_sprinti+0
ADD	SP, SP, #12
;uart_aci.c,285 :: 		UART1_Write_Text(txt);
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,290 :: 		if (ACI_STATUS_ERROR_PEER_ATT_ERROR != aci_evt->params.pipe_error.error_code)
ADDS	R0, R3, #2
; aci_evt end address is: 12 (R3)
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
CMP	R0, #146
IT	EQ
BEQ	L_aci_loop37
;uart_aci.c,292 :: 		aci_state.data_credit_available++;
MOVW	R1, #lo_addr(_aci_state+31)
MOVT	R1, #hi_addr(_aci_state+31)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;uart_aci.c,293 :: 		}
L_aci_loop37:
;uart_aci.c,294 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,296 :: 		case ACI_EVT_HW_ERROR:
L_aci_loop38:
;uart_aci.c,297 :: 		UART1_Write_Text(" HW error: ");
; aci_evt start address is: 12 (R3)
MOVW	R0, #lo_addr(?lstr21_uart_aci+0)
MOVT	R0, #hi_addr(?lstr21_uart_aci+0)
STR	R3, [SP, #4]
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,298 :: 		sprinti(txt,"%d",aci_evt->params.hw_error.line_num);
ADDS	R0, R3, #2
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVW	R1, #lo_addr(?lstr_22_uart_aci+0)
MOVT	R1, #hi_addr(?lstr_22_uart_aci+0)
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
STR	R3, [SP, #4]
PUSH	(R2)
PUSH	(R1)
PUSH	(R0)
BL	_sprinti+0
ADD	SP, SP, #12
;uart_aci.c,299 :: 		UART1_Write_Text(txt);
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_UART1_Write_Text+0
LDR	R3, [SP, #4]
;uart_aci.c,301 :: 		for(counter = 0; counter <= (aci_evt->len - 3); counter++)
; counter start address is: 16 (R4)
MOVS	R4, #0
; aci_evt end address is: 12 (R3)
; counter end address is: 16 (R4)
MOV	R5, R3
L_aci_loop39:
; counter start address is: 16 (R4)
; aci_evt start address is: 20 (R5)
LDRB	R0, [R5, #0]
SUBS	R0, R0, #3
SXTH	R0, R0
CMP	R4, R0
IT	GT
BGT	L_aci_loop40
;uart_aci.c,303 :: 		PRINT(aci_evt->params.hw_error.file_name[counter]); //uint8_t file_name[20];
ADDS	R0, R5, #2
ADDS	R0, R0, #2
ADDS	R0, R0, R4
LDRB	R0, [R0, #0]
BL	_UART1_Write+0
;uart_aci.c,301 :: 		for(counter = 0; counter <= (aci_evt->len - 3); counter++)
ADDS	R4, R4, #1
UXTB	R4, R4
;uart_aci.c,304 :: 		}
; aci_evt end address is: 20 (R5)
; counter end address is: 16 (R4)
IT	AL
BAL	L_aci_loop39
L_aci_loop40:
;uart_aci.c,305 :: 		UART1_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr23_uart_aci+0)
MOVT	R0, #hi_addr(?lstr23_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,306 :: 		lib_aci_connect(0/* in seconds, 0 means forever */, 0x0050 /* advertising interval 50ms*/);
MOVS	R1, #80
MOVS	R0, #0
BL	_lib_aci_connect+0
;uart_aci.c,307 :: 		UART1_Write_Text(" Advertising started. Tap Connect on the nRF UART app ");
MOVW	R0, #lo_addr(?lstr24_uart_aci+0)
MOVT	R0, #hi_addr(?lstr24_uart_aci+0)
BL	_UART1_Write_Text+0
;uart_aci.c,308 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,309 :: 		default:
L_aci_loop42:
;uart_aci.c,310 :: 		break;
IT	AL
BAL	L_aci_loop11
;uart_aci.c,311 :: 		}
L_aci_loop10:
; aci_evt start address is: 12 (R3)
LDR	R1, [SP, #28]
LDRB	R0, [R1, #0]
CMP	R0, #129
IT	EQ
BEQ	L_aci_loop12
LDRB	R0, [R1, #0]
CMP	R0, #132
IT	EQ
BEQ	L_aci_loop22
LDRB	R0, [R1, #0]
CMP	R0, #133
IT	EQ
BEQ	L_aci_loop25
LDRB	R0, [R1, #0]
CMP	R0, #136
IT	EQ
BEQ	L_aci_loop26
LDRB	R0, [R1, #0]
CMP	R0, #137
IT	EQ
BEQ	L_aci_loop30
LDRB	R0, [R1, #0]
CMP	R0, #134
IT	EQ
BEQ	L_aci_loop31
LDRB	R0, [R1, #0]
CMP	R0, #140
IT	EQ
BEQ	L_aci_loop32
LDRB	R0, [R1, #0]
CMP	R0, #138
IT	EQ
BEQ	L_aci_loop35
LDRB	R0, [R1, #0]
CMP	R0, #141
IT	EQ
BEQ	L_aci_loop36
LDRB	R0, [R1, #0]
CMP	R0, #131
IT	EQ
BEQ	L_aci_loop38
; aci_evt end address is: 12 (R3)
IT	AL
BAL	L_aci_loop42
L_aci_loop11:
;uart_aci.c,312 :: 		}
IT	AL
BAL	L_aci_loop43
L_aci_loop9:
;uart_aci.c,319 :: 		}
L_aci_loop43:
;uart_aci.c,325 :: 		if(setup_required)
MOVW	R0, #lo_addr(aci_loop_setup_required_L0+0)
MOVT	R0, #hi_addr(aci_loop_setup_required_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_aci_loop44
;uart_aci.c,327 :: 		if (SETUP_SUCCESS == do_aci_setup(&aci_state))
MOVW	R0, #lo_addr(_aci_state+0)
MOVT	R0, #hi_addr(_aci_state+0)
BL	_do_aci_setup+0
CMP	R0, #0
IT	NE
BNE	L_aci_loop45
;uart_aci.c,329 :: 		setup_required = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(aci_loop_setup_required_L0+0)
MOVT	R0, #hi_addr(aci_loop_setup_required_L0+0)
STRB	R1, [R0, #0]
;uart_aci.c,330 :: 		}
L_aci_loop45:
;uart_aci.c,331 :: 		}
L_aci_loop44:
;uart_aci.c,332 :: 		}
L_end_aci_loop:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _aci_loop
