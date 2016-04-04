_lib_aci_is_pipe_available:
;lib_aci.c,72 :: 		bool lib_aci_is_pipe_available(aci_state_t *aci_stat, uint8_t pipe)
; pipe start address is: 4 (R1)
; aci_stat start address is: 0 (R0)
; pipe end address is: 4 (R1)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
; pipe start address is: 4 (R1)
;lib_aci.c,76 :: 		byte_idx = pipe / 8;
LSRS	R3, R1, #3
UXTB	R3, R3
;lib_aci.c,77 :: 		if (aci_stat->pipes_open_bitmap[byte_idx] & (0x01 << (pipe % 8)))
ADDW	R2, R0, #38
; aci_stat end address is: 0 (R0)
ADDS	R2, R2, R3
LDRB	R4, [R2, #0]
AND	R3, R1, #7
UXTB	R3, R3
; pipe end address is: 4 (R1)
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R3
SXTH	R2, R2
AND	R2, R4, R2, LSL #0
SXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_lib_aci_is_pipe_available0
;lib_aci.c,79 :: 		return(true);
MOVS	R0, #1
IT	AL
BAL	L_end_lib_aci_is_pipe_available
;lib_aci.c,80 :: 		}
L_lib_aci_is_pipe_available0:
;lib_aci.c,81 :: 		return(false);
MOVS	R0, #0
;lib_aci.c,82 :: 		}
L_end_lib_aci_is_pipe_available:
BX	LR
; end of _lib_aci_is_pipe_available
_lib_aci_is_pipe_closed:
;lib_aci.c,85 :: 		bool lib_aci_is_pipe_closed(aci_state_t *aci_stat, uint8_t pipe)
; pipe start address is: 4 (R1)
; aci_stat start address is: 0 (R0)
; pipe end address is: 4 (R1)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
; pipe start address is: 4 (R1)
;lib_aci.c,89 :: 		byte_idx = pipe / 8;
LSRS	R3, R1, #3
UXTB	R3, R3
;lib_aci.c,90 :: 		if (aci_stat->pipes_closed_bitmap[byte_idx] & (0x01 << (pipe % 8)))
ADDW	R2, R0, #46
; aci_stat end address is: 0 (R0)
ADDS	R2, R2, R3
LDRB	R4, [R2, #0]
AND	R3, R1, #7
UXTB	R3, R3
; pipe end address is: 4 (R1)
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R3
SXTH	R2, R2
AND	R2, R4, R2, LSL #0
SXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_lib_aci_is_pipe_closed1
;lib_aci.c,92 :: 		return(true);
MOVS	R0, #1
IT	AL
BAL	L_end_lib_aci_is_pipe_closed
;lib_aci.c,93 :: 		}
L_lib_aci_is_pipe_closed1:
;lib_aci.c,94 :: 		return(false);
MOVS	R0, #0
;lib_aci.c,95 :: 		}
L_end_lib_aci_is_pipe_closed:
BX	LR
; end of _lib_aci_is_pipe_closed
_lib_aci_is_discovery_finished:
;lib_aci.c,98 :: 		bool lib_aci_is_discovery_finished(aci_state_t *aci_stat)
; aci_stat start address is: 0 (R0)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
;lib_aci.c,100 :: 		return(aci_stat->pipes_open_bitmap[0]&0x01);
ADDW	R1, R0, #38
; aci_stat end address is: 0 (R0)
LDRB	R1, [R1, #0]
AND	R1, R1, #1
UXTB	R0, R1
;lib_aci.c,101 :: 		}
L_end_lib_aci_is_discovery_finished:
BX	LR
; end of _lib_aci_is_discovery_finished
_lib_aci_board_init:
;lib_aci.c,103 :: 		void lib_aci_board_init(aci_state_t *aci_stat)
; aci_stat start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
;lib_aci.c,105 :: 		hal_aci_evt_t *aci_data = NULL;
;lib_aci.c,106 :: 		aci_data = (hal_aci_evt_t *)&msg_to_send;
; aci_data start address is: 8 (R2)
MOVW	R2, #lo_addr(_msg_to_send+0)
MOVT	R2, #hi_addr(_msg_to_send+0)
;lib_aci.c,108 :: 		if (REDBEARLAB_SHIELD_V1_1 == aci_stat->aci_pins.board_name)
LDRB	R1, [R0, #0]
CMP	R1, #1
IT	NE
BNE	L_lib_aci_board_init2
;lib_aci.c,114 :: 		Delay_ms(100);
MOVW	R7, #13609
MOVT	R7, #71
NOP
NOP
L_lib_aci_board_init3:
SUBS	R7, R7, #1
BNE	L_lib_aci_board_init3
NOP
NOP
;lib_aci.c,119 :: 		lib_aci_radio_reset();
STR	R2, [SP, #4]
; aci_stat end address is: 0 (R0)
; aci_data end address is: 8 (R2)
STR	R0, [SP, #8]
BL	_lib_aci_radio_reset+0
LDR	R0, [SP, #8]
LDR	R2, [SP, #4]
MOV	R3, R0
;lib_aci.c,121 :: 		while (1)
L_lib_aci_board_init5:
;lib_aci.c,128 :: 		if (true == lib_aci_event_get(aci_stat, aci_data))
; aci_data start address is: 8 (R2)
; aci_stat start address is: 12 (R3)
STR	R3, [SP, #4]
STR	R2, [SP, #8]
MOV	R1, R2
MOV	R0, R3
BL	_lib_aci_event_get+0
LDR	R2, [SP, #8]
LDR	R3, [SP, #4]
CMP	R0, #1
IT	NE
BNE	L_lib_aci_board_init7
;lib_aci.c,131 :: 		aci_evt = &(aci_data->evt);
ADDS	R1, R2, #1
STR	R1, [SP, #12]
;lib_aci.c,133 :: 		if (ACI_EVT_CMD_RSP == aci_evt->evt_opcode)
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
CMP	R1, #132
IT	NE
BNE	L_lib_aci_board_init8
; aci_data end address is: 8 (R2)
; aci_stat end address is: 12 (R3)
;lib_aci.c,135 :: 		if (ACI_STATUS_ERROR_DEVICE_STATE_INVALID == aci_evt->params.cmd_rsp.cmd_status) //in SETUP
LDR	R1, [SP, #12]
ADDS	R1, R1, #2
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
CMP	R1, #131
IT	NE
BNE	L_lib_aci_board_init9
;lib_aci.c,138 :: 		msg_to_send.buffer[0] = 4;    //Length
MOVS	R2, #4
MOVW	R1, #lo_addr(_msg_to_send+1)
MOVT	R1, #hi_addr(_msg_to_send+1)
STRB	R2, [R1, #0]
;lib_aci.c,139 :: 		msg_to_send.buffer[1] = 0x81; //Device Started Event
MOVS	R2, #129
MOVW	R1, #lo_addr(_msg_to_send+2)
MOVT	R1, #hi_addr(_msg_to_send+2)
STRB	R2, [R1, #0]
;lib_aci.c,140 :: 		msg_to_send.buffer[2] = 0x02; //Setup
MOVS	R2, #2
MOVW	R1, #lo_addr(_msg_to_send+3)
MOVT	R1, #hi_addr(_msg_to_send+3)
STRB	R2, [R1, #0]
;lib_aci.c,141 :: 		msg_to_send.buffer[3] = 0;    //Hardware Error -> None
MOVS	R2, #0
MOVW	R1, #lo_addr(_msg_to_send+4)
MOVT	R1, #hi_addr(_msg_to_send+4)
STRB	R2, [R1, #0]
;lib_aci.c,142 :: 		msg_to_send.buffer[4] = 2;    //Data Credit Available
MOVS	R2, #2
MOVW	R1, #lo_addr(_msg_to_send+5)
MOVT	R1, #hi_addr(_msg_to_send+5)
STRB	R2, [R1, #0]
;lib_aci.c,143 :: 		aci_queue_enqueue(&aci_rx_q, &msg_to_send);
MOVW	R1, #lo_addr(_msg_to_send+0)
MOVT	R1, #hi_addr(_msg_to_send+0)
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_enqueue+0
;lib_aci.c,144 :: 		}
IT	AL
BAL	L_lib_aci_board_init10
L_lib_aci_board_init9:
;lib_aci.c,145 :: 		else if (ACI_STATUS_SUCCESS == aci_evt->params.cmd_rsp.cmd_status) //We are now in STANDBY
LDR	R1, [SP, #12]
ADDS	R1, R1, #2
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_lib_aci_board_init11
;lib_aci.c,148 :: 		msg_to_send.buffer[0] = 4;    //Length
MOVS	R2, #4
MOVW	R1, #lo_addr(_msg_to_send+1)
MOVT	R1, #hi_addr(_msg_to_send+1)
STRB	R2, [R1, #0]
;lib_aci.c,149 :: 		msg_to_send.buffer[1] = 0x81; //Device Started Event
MOVS	R2, #129
MOVW	R1, #lo_addr(_msg_to_send+2)
MOVT	R1, #hi_addr(_msg_to_send+2)
STRB	R2, [R1, #0]
;lib_aci.c,150 :: 		msg_to_send.buffer[2] = 0x03; //Standby
MOVS	R2, #3
MOVW	R1, #lo_addr(_msg_to_send+3)
MOVT	R1, #hi_addr(_msg_to_send+3)
STRB	R2, [R1, #0]
;lib_aci.c,151 :: 		msg_to_send.buffer[3] = 0;    //Hardware Error -> None
MOVS	R2, #0
MOVW	R1, #lo_addr(_msg_to_send+4)
MOVT	R1, #hi_addr(_msg_to_send+4)
STRB	R2, [R1, #0]
;lib_aci.c,152 :: 		msg_to_send.buffer[4] = 2;    //Data Credit Available
MOVS	R2, #2
MOVW	R1, #lo_addr(_msg_to_send+5)
MOVT	R1, #hi_addr(_msg_to_send+5)
STRB	R2, [R1, #0]
;lib_aci.c,153 :: 		aci_queue_enqueue(&aci_rx_q, &msg_to_send);
MOVW	R1, #lo_addr(_msg_to_send+0)
MOVT	R1, #hi_addr(_msg_to_send+0)
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_enqueue+0
;lib_aci.c,154 :: 		}
IT	AL
BAL	L_lib_aci_board_init12
L_lib_aci_board_init11:
;lib_aci.c,155 :: 		else if (ACI_STATUS_ERROR_CMD_UNKNOWN == aci_evt->params.cmd_rsp.cmd_status) //We are now in TEST
LDR	R1, [SP, #12]
ADDS	R1, R1, #2
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
CMP	R1, #130
IT	NE
BNE	L_lib_aci_board_init13
;lib_aci.c,158 :: 		msg_to_send.buffer[0] = 4;    //Length
MOVS	R2, #4
MOVW	R1, #lo_addr(_msg_to_send+1)
MOVT	R1, #hi_addr(_msg_to_send+1)
STRB	R2, [R1, #0]
;lib_aci.c,159 :: 		msg_to_send.buffer[1] = 0x81; //Device Started Event
MOVS	R2, #129
MOVW	R1, #lo_addr(_msg_to_send+2)
MOVT	R1, #hi_addr(_msg_to_send+2)
STRB	R2, [R1, #0]
;lib_aci.c,160 :: 		msg_to_send.buffer[2] = 0x01; //Test
MOVS	R2, #1
MOVW	R1, #lo_addr(_msg_to_send+3)
MOVT	R1, #hi_addr(_msg_to_send+3)
STRB	R2, [R1, #0]
;lib_aci.c,161 :: 		msg_to_send.buffer[3] = 0;    //Hardware Error -> None
MOVS	R2, #0
MOVW	R1, #lo_addr(_msg_to_send+4)
MOVT	R1, #hi_addr(_msg_to_send+4)
STRB	R2, [R1, #0]
;lib_aci.c,162 :: 		msg_to_send.buffer[4] = 0;    //Data Credit Available
MOVS	R2, #0
MOVW	R1, #lo_addr(_msg_to_send+5)
MOVT	R1, #hi_addr(_msg_to_send+5)
STRB	R2, [R1, #0]
;lib_aci.c,163 :: 		aci_queue_enqueue(&aci_rx_q, &msg_to_send);
MOVW	R1, #lo_addr(_msg_to_send+0)
MOVT	R1, #hi_addr(_msg_to_send+0)
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_enqueue+0
;lib_aci.c,164 :: 		}
L_lib_aci_board_init13:
L_lib_aci_board_init12:
L_lib_aci_board_init10:
;lib_aci.c,167 :: 		break;
IT	AL
BAL	L_lib_aci_board_init6
;lib_aci.c,168 :: 		}
L_lib_aci_board_init8:
;lib_aci.c,174 :: 		}
; aci_stat start address is: 12 (R3)
; aci_data start address is: 8 (R2)
L_lib_aci_board_init7:
;lib_aci.c,175 :: 		}
; aci_data end address is: 8 (R2)
; aci_stat end address is: 12 (R3)
IT	AL
BAL	L_lib_aci_board_init5
L_lib_aci_board_init6:
;lib_aci.c,176 :: 		}
L_lib_aci_board_init2:
;lib_aci.c,177 :: 		}
L_end_lib_aci_board_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _lib_aci_board_init
_lib_aci_init:
;lib_aci.c,180 :: 		void lib_aci_init(aci_state_t *aci_stat, bool debug)
; debug start address is: 4 (R1)
; aci_stat start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; debug end address is: 4 (R1)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
; debug start address is: 4 (R1)
;lib_aci.c,184 :: 		for (i = 0; i < PIPES_ARRAY_SIZE; i++)
; i start address is: 16 (R4)
MOVS	R4, #0
; aci_stat end address is: 0 (R0)
; debug end address is: 4 (R1)
; i end address is: 16 (R4)
STRB	R1, [SP, #4]
MOV	R1, R0
LDRB	R0, [SP, #4]
L_lib_aci_init15:
; i start address is: 16 (R4)
; debug start address is: 0 (R0)
; aci_stat start address is: 4 (R1)
CMP	R4, #8
IT	CS
BCS	L_lib_aci_init16
;lib_aci.c,186 :: 		aci_stat->pipes_open_bitmap[i]          = 0;
ADDW	R2, R1, #38
ADDS	R3, R2, R4
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,187 :: 		aci_stat->pipes_closed_bitmap[i]        = 0;
ADDW	R2, R1, #46
ADDS	R3, R2, R4
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,188 :: 		aci_cmd_params_open_adv_pipe.pipes[i]   = 0;
MOVW	R2, #lo_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
MOVT	R2, #hi_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
ADDS	R3, R2, R4
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,184 :: 		for (i = 0; i < PIPES_ARRAY_SIZE; i++)
ADDS	R4, R4, #1
UXTB	R4, R4
;lib_aci.c,189 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_lib_aci_init15
L_lib_aci_init16:
;lib_aci.c,194 :: 		is_request_operation_pending     = false;
MOVS	R3, #0
MOVW	R2, #lo_addr(lib_aci_is_request_operation_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_request_operation_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,195 :: 		is_indicate_operation_pending    = false;
MOVS	R3, #0
MOVW	R2, #lo_addr(lib_aci_is_indicate_operation_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_indicate_operation_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,196 :: 		is_open_remote_pipe_pending      = false;
MOVS	R3, #0
MOVW	R2, #lo_addr(lib_aci_is_open_remote_pipe_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_open_remote_pipe_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,197 :: 		is_close_remote_pipe_pending     = false;
MOVS	R3, #0
MOVW	R2, #lo_addr(lib_aci_is_close_remote_pipe_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_close_remote_pipe_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,203 :: 		request_operation_pipe           = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(lib_aci_request_operation_pipe+0)
MOVT	R2, #hi_addr(lib_aci_request_operation_pipe+0)
STRB	R3, [R2, #0]
;lib_aci.c,204 :: 		indicate_operation_pipe          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(lib_aci_indicate_operation_pipe+0)
MOVT	R2, #hi_addr(lib_aci_indicate_operation_pipe+0)
STRB	R3, [R2, #0]
;lib_aci.c,208 :: 		p_services_pipe_type_map = aci_stat->aci_setup_info.services_pipe_type_mapping;
ADDW	R4, R1, #12
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
STR	R3, [R2, #0]
;lib_aci.c,210 :: 		p_setup_msgs             = aci_stat->aci_setup_info.setup_msgs;
ADDW	R2, R4, #8
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(lib_aci_p_setup_msgs+0)
MOVT	R2, #hi_addr(lib_aci_p_setup_msgs+0)
STR	R3, [R2, #0]
;lib_aci.c,213 :: 		hal_aci_tl_init(&aci_stat->aci_pins, debug);
STR	R1, [SP, #4]
; debug end address is: 0 (R0)
STR	R1, [SP, #8]
UXTB	R1, R0
LDR	R0, [SP, #8]
BL	_hal_aci_tl_init+0
LDR	R1, [SP, #4]
;lib_aci.c,215 :: 		lib_aci_board_init(aci_stat);
MOV	R0, R1
; aci_stat end address is: 4 (R1)
BL	_lib_aci_board_init+0
;lib_aci.c,216 :: 		}
L_end_lib_aci_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _lib_aci_init
_lib_aci_get_nb_available_credits:
;lib_aci.c,219 :: 		uint8_t lib_aci_get_nb_available_credits(aci_state_t *aci_stat)
; aci_stat start address is: 0 (R0)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
;lib_aci.c,221 :: 		return aci_stat->data_credit_available;
ADDW	R1, R0, #31
; aci_stat end address is: 0 (R0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
;lib_aci.c,222 :: 		}
L_end_lib_aci_get_nb_available_credits:
BX	LR
; end of _lib_aci_get_nb_available_credits
_lib_aci_get_cx_interval_ms:
;lib_aci.c,224 :: 		uint16_t lib_aci_get_cx_interval_ms(aci_state_t *aci_stat)
; aci_stat start address is: 0 (R0)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
;lib_aci.c,229 :: 		cx_rf_interval_ms_32bits  = aci_stat->connection_interval;
ADDW	R1, R0, #32
; aci_stat end address is: 0 (R0)
LDRH	R1, [R1, #0]
; cx_rf_interval_ms_32bits start address is: 0 (R0)
UXTH	R0, R1
;lib_aci.c,230 :: 		cx_rf_interval_ms_32bits *= 125;                      // the connection interval is given in multiples of 0.125 milliseconds
MOVS	R1, #125
MUL	R2, R0, R1
; cx_rf_interval_ms_32bits end address is: 0 (R0)
;lib_aci.c,231 :: 		cx_rf_interval_ms         = cx_rf_interval_ms_32bits / 100;
MOVS	R1, #100
UDIV	R1, R2, R1
;lib_aci.c,233 :: 		return cx_rf_interval_ms;
UXTH	R0, R1
;lib_aci.c,234 :: 		}
L_end_lib_aci_get_cx_interval_ms:
BX	LR
; end of _lib_aci_get_cx_interval_ms
_lib_aci_get_cx_interval:
;lib_aci.c,237 :: 		uint16_t lib_aci_get_cx_interval(aci_state_t *aci_stat)
; aci_stat start address is: 0 (R0)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
;lib_aci.c,239 :: 		return aci_stat->connection_interval;
ADDW	R1, R0, #32
; aci_stat end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;lib_aci.c,240 :: 		}
L_end_lib_aci_get_cx_interval:
BX	LR
; end of _lib_aci_get_cx_interval
_lib_aci_get_slave_latency:
;lib_aci.c,243 :: 		uint16_t lib_aci_get_slave_latency(aci_state_t *aci_stat)
; aci_stat start address is: 0 (R0)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 0 (R0)
;lib_aci.c,245 :: 		return aci_stat->slave_latency;
ADDW	R1, R0, #34
; aci_stat end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
;lib_aci.c,246 :: 		}
L_end_lib_aci_get_slave_latency:
BX	LR
; end of _lib_aci_get_slave_latency
_lib_aci_set_app_latency:
;lib_aci.c,249 :: 		bool lib_aci_set_app_latency(uint16_t latency, aci_app_latency_mode_t latency_mode)
; latency_mode start address is: 4 (R1)
; latency start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; latency_mode end address is: 4 (R1)
; latency end address is: 0 (R0)
; latency start address is: 0 (R0)
; latency_mode start address is: 4 (R1)
;lib_aci.c,253 :: 		aci_set_app_latency.mode    = latency_mode;
STRB	R1, [SP, #4]
; latency_mode end address is: 4 (R1)
;lib_aci.c,254 :: 		aci_set_app_latency.latency = latency;
STRH	R0, [SP, #5]
; latency end address is: 0 (R0)
;lib_aci.c,255 :: 		acil_encode_cmd_set_app_latency(&(msg_to_send.buffer[0]), &aci_set_app_latency);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_set_app_latency+0
;lib_aci.c,257 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,258 :: 		}
L_end_lib_aci_set_app_latency:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_set_app_latency
_lib_aci_test:
;lib_aci.c,261 :: 		bool lib_aci_test(aci_test_mode_change_t enter_exit_test_mode)
; enter_exit_test_mode start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; enter_exit_test_mode end address is: 0 (R0)
; enter_exit_test_mode start address is: 0 (R0)
;lib_aci.c,264 :: 		aci_cmd_params_test.test_mode_change = enter_exit_test_mode;
STRB	R0, [SP, #4]
; enter_exit_test_mode end address is: 0 (R0)
;lib_aci.c,265 :: 		acil_encode_cmd_set_test_mode(&(msg_to_send.buffer[0]), &aci_cmd_params_test);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_set_test_mode+0
;lib_aci.c,266 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,267 :: 		}
L_end_lib_aci_test:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_test
_lib_aci_sleep:
;lib_aci.c,270 :: 		bool lib_aci_sleep()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,272 :: 		acil_encode_cmd_sleep(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_sleep+0
;lib_aci.c,273 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,274 :: 		}
L_end_lib_aci_sleep:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_sleep
_lib_aci_radio_reset:
;lib_aci.c,277 :: 		bool lib_aci_radio_reset()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,279 :: 		acil_encode_baseband_reset(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_baseband_reset+0
;lib_aci.c,280 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,281 :: 		}
L_end_lib_aci_radio_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_radio_reset
_lib_aci_direct_connect:
;lib_aci.c,284 :: 		bool lib_aci_direct_connect()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,286 :: 		acil_encode_direct_connect(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_direct_connect+0
;lib_aci.c,287 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,288 :: 		}
L_end_lib_aci_direct_connect:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_direct_connect
_lib_aci_device_version:
;lib_aci.c,291 :: 		bool lib_aci_device_version()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,293 :: 		acil_encode_cmd_get_device_version(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_get_device_version+0
;lib_aci.c,294 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,295 :: 		}
L_end_lib_aci_device_version:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_device_version
_lib_aci_set_local_data:
;lib_aci.c,298 :: 		bool lib_aci_set_local_data(aci_state_t *aci_stat, uint8_t pipe, uint8_t *p_value, uint8_t size)
; size start address is: 12 (R3)
; p_value start address is: 8 (R2)
; pipe start address is: 4 (R1)
SUB	SP, SP, #28
STR	LR, [SP, #0]
UXTB	R6, R3
; size end address is: 12 (R3)
; p_value end address is: 8 (R2)
; pipe end address is: 4 (R1)
; pipe start address is: 4 (R1)
; p_value start address is: 8 (R2)
; size start address is: 24 (R6)
;lib_aci.c,302 :: 		if ((p_services_pipe_type_map[pipe-1].location != ACI_STORE_LOCAL)
SUBS	R4, R1, #1
SXTH	R4, R4
LSLS	R5, R4, #2
MOVW	R4, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R4, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R4, [R4, #0]
ADDS	R4, R4, R5
LDRB	R4, [R4, #0]
;lib_aci.c,304 :: 		(size > ACI_PIPE_TX_DATA_MAX_LEN))
CMP	R4, #1
IT	NE
BNE	L__lib_aci_set_local_data68
CMP	R6, #20
IT	HI
BHI	L__lib_aci_set_local_data67
IT	AL
BAL	L_lib_aci_set_local_data20
; pipe end address is: 4 (R1)
; p_value end address is: 8 (R2)
; size end address is: 24 (R6)
L__lib_aci_set_local_data68:
L__lib_aci_set_local_data67:
;lib_aci.c,306 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_set_local_data
;lib_aci.c,307 :: 		}
L_lib_aci_set_local_data20:
;lib_aci.c,309 :: 		aci_cmd_params_set_local_data.tx_data.pipe_number = pipe;
; size start address is: 24 (R6)
; p_value start address is: 8 (R2)
; pipe start address is: 4 (R1)
STRB	R1, [SP, #4]
; pipe end address is: 4 (R1)
;lib_aci.c,310 :: 		memcpy(&(aci_cmd_params_set_local_data.tx_data.aci_data[0]), p_value, size);
ADD	R4, SP, #5
MOV	R1, R2
UXTB	R2, R6
; p_value end address is: 8 (R2)
MOV	R0, R4
BL	_memcpy+0
;lib_aci.c,311 :: 		acil_encode_cmd_set_local_data(&(msg_to_send.buffer[0]), &aci_cmd_params_set_local_data, size);
ADD	R4, SP, #4
UXTB	R2, R6
; size end address is: 24 (R6)
MOV	R1, R4
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_set_local_data+0
;lib_aci.c,312 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,313 :: 		}
L_end_lib_aci_set_local_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _lib_aci_set_local_data
_lib_aci_connect:
;lib_aci.c,315 :: 		bool lib_aci_connect(uint16_t run_timeout, uint16_t adv_interval)
; adv_interval start address is: 4 (R1)
; run_timeout start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; adv_interval end address is: 4 (R1)
; run_timeout end address is: 0 (R0)
; run_timeout start address is: 0 (R0)
; adv_interval start address is: 4 (R1)
;lib_aci.c,318 :: 		aci_cmd_params_connect.timeout      = run_timeout;
STRH	R0, [SP, #4]
; run_timeout end address is: 0 (R0)
;lib_aci.c,319 :: 		aci_cmd_params_connect.adv_interval = adv_interval;
STRH	R1, [SP, #6]
; adv_interval end address is: 4 (R1)
;lib_aci.c,320 :: 		acil_encode_cmd_connect(&(msg_to_send.buffer[0]), &aci_cmd_params_connect);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_connect+0
;lib_aci.c,321 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,322 :: 		}
L_end_lib_aci_connect:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_connect
_lib_aci_disconnect:
;lib_aci.c,325 :: 		bool lib_aci_disconnect(aci_state_t *aci_stat, aci_disconnect_reason_t reason)
; reason start address is: 4 (R1)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
UXTB	R0, R1
; reason end address is: 4 (R1)
; reason start address is: 0 (R0)
;lib_aci.c,330 :: 		aci_cmd_params_disconnect.reason = reason;
STRB	R0, [SP, #5]
; reason end address is: 0 (R0)
;lib_aci.c,331 :: 		acil_encode_cmd_disconnect(&(msg_to_send.buffer[0]), &aci_cmd_params_disconnect);
ADD	R2, SP, #5
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_disconnect+0
;lib_aci.c,332 :: 		ret_val = hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
STRB	R0, [SP, #4]
;lib_aci.c,334 :: 		if (ret_val)
CMP	R0, #0
IT	EQ
BEQ	L_lib_aci_disconnect21
;lib_aci.c,340 :: 		for (i=0; i < PIPES_ARRAY_SIZE; i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; i end address is: 0 (R0)
L_lib_aci_disconnect22:
; i start address is: 0 (R0)
CMP	R0, #8
IT	CS
BCS	L_lib_aci_disconnect23
;lib_aci.c,342 :: 		aci_stat->pipes_open_bitmap[i] = 0;
LDR	R2, [SP, #8]
ADDS	R2, #38
ADDS	R3, R2, R0
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,343 :: 		aci_stat->pipes_closed_bitmap[i] = 0;
LDR	R2, [SP, #8]
ADDS	R2, #46
ADDS	R3, R2, R0
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,340 :: 		for (i=0; i < PIPES_ARRAY_SIZE; i++)
ADDS	R2, R0, #1
; i end address is: 0 (R0)
; i start address is: 4 (R1)
UXTB	R1, R2
;lib_aci.c,344 :: 		}
UXTB	R0, R1
; i end address is: 4 (R1)
IT	AL
BAL	L_lib_aci_disconnect22
L_lib_aci_disconnect23:
;lib_aci.c,345 :: 		}
L_lib_aci_disconnect21:
;lib_aci.c,346 :: 		return ret_val;
LDRB	R0, [SP, #4]
;lib_aci.c,347 :: 		}
L_end_lib_aci_disconnect:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _lib_aci_disconnect
_lib_aci_bond:
;lib_aci.c,350 :: 		bool lib_aci_bond(uint16_t run_timeout, uint16_t adv_interval)
; adv_interval start address is: 4 (R1)
; run_timeout start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; adv_interval end address is: 4 (R1)
; run_timeout end address is: 0 (R0)
; run_timeout start address is: 0 (R0)
; adv_interval start address is: 4 (R1)
;lib_aci.c,353 :: 		aci_cmd_params_bond.timeout = run_timeout;
STRH	R0, [SP, #4]
; run_timeout end address is: 0 (R0)
;lib_aci.c,354 :: 		aci_cmd_params_bond.adv_interval = adv_interval;
STRH	R1, [SP, #6]
; adv_interval end address is: 4 (R1)
;lib_aci.c,355 :: 		acil_encode_cmd_bond(&(msg_to_send.buffer[0]), &aci_cmd_params_bond);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_bond+0
;lib_aci.c,356 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,357 :: 		}
L_end_lib_aci_bond:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_bond
_lib_aci_wakeup:
;lib_aci.c,360 :: 		bool lib_aci_wakeup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,362 :: 		acil_encode_cmd_wakeup(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_wakeup+0
;lib_aci.c,363 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,364 :: 		}
L_end_lib_aci_wakeup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_wakeup
_lib_aci_set_tx_power:
;lib_aci.c,367 :: 		bool lib_aci_set_tx_power(aci_device_output_power_t tx_power)
; tx_power start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; tx_power end address is: 0 (R0)
; tx_power start address is: 0 (R0)
;lib_aci.c,370 :: 		aci_cmd_params_set_tx_power.device_power = tx_power;
STRB	R0, [SP, #4]
; tx_power end address is: 0 (R0)
;lib_aci.c,371 :: 		acil_encode_cmd_set_radio_tx_power(&(msg_to_send.buffer[0]), &aci_cmd_params_set_tx_power);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_set_radio_tx_power+0
;lib_aci.c,372 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,373 :: 		}
L_end_lib_aci_set_tx_power:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_set_tx_power
_lib_aci_get_address:
;lib_aci.c,376 :: 		bool lib_aci_get_address()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,378 :: 		acil_encode_cmd_get_address(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_get_address+0
;lib_aci.c,379 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,380 :: 		}
L_end_lib_aci_get_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_get_address
_lib_aci_get_temperature:
;lib_aci.c,383 :: 		bool lib_aci_get_temperature()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,385 :: 		acil_encode_cmd_temparature(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_temparature+0
;lib_aci.c,386 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,387 :: 		}
L_end_lib_aci_get_temperature:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_get_temperature
_lib_aci_get_battery_level:
;lib_aci.c,390 :: 		bool lib_aci_get_battery_level()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,392 :: 		acil_encode_cmd_battery_level(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_battery_level+0
;lib_aci.c,393 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,394 :: 		}
L_end_lib_aci_get_battery_level:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_get_battery_level
_lib_aci_send_data:
;lib_aci.c,397 :: 		bool lib_aci_send_data(uint8_t pipe, uint8_t *p_value, uint8_t size)
; size start address is: 8 (R2)
; p_value start address is: 4 (R1)
; pipe start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
UXTB	R6, R2
; size end address is: 8 (R2)
; p_value end address is: 4 (R1)
; pipe end address is: 0 (R0)
; pipe start address is: 0 (R0)
; p_value start address is: 4 (R1)
; size start address is: 24 (R6)
;lib_aci.c,399 :: 		bool ret_val = false;
;lib_aci.c,403 :: 		if(!((p_services_pipe_type_map[pipe-1].pipe_type == ACI_TX) ||
SUBS	R3, R0, #1
SXTH	R3, R3
LSLS	R4, R3, #2
MOVW	R3, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R3, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, R4
ADDS	R3, R3, #2
LDRSH	R3, [R3, #0]
;lib_aci.c,404 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_TX_ACK)))
CMP	R3, #2
IT	EQ
BEQ	L_lib_aci_send_data26
SUBS	R3, R0, #1
SXTH	R3, R3
LSLS	R4, R3, #2
MOVW	R3, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R3, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, R4
ADDS	R3, R3, #2
LDRSH	R3, [R3, #0]
CMP	R3, #4
IT	EQ
BEQ	L_lib_aci_send_data26
MOVS	R3, #0
IT	AL
BAL	L_lib_aci_send_data25
L_lib_aci_send_data26:
MOVS	R3, #1
L_lib_aci_send_data25:
CMP	R3, #0
IT	NE
BNE	L_lib_aci_send_data27
; pipe end address is: 0 (R0)
; p_value end address is: 4 (R1)
; size end address is: 24 (R6)
;lib_aci.c,406 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_send_data
;lib_aci.c,407 :: 		}
L_lib_aci_send_data27:
;lib_aci.c,409 :: 		if (size > ACI_PIPE_TX_DATA_MAX_LEN)
; size start address is: 24 (R6)
; p_value start address is: 4 (R1)
; pipe start address is: 0 (R0)
CMP	R6, #20
IT	LS
BLS	L_lib_aci_send_data28
; pipe end address is: 0 (R0)
; p_value end address is: 4 (R1)
; size end address is: 24 (R6)
;lib_aci.c,411 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_send_data
;lib_aci.c,412 :: 		}
L_lib_aci_send_data28:
;lib_aci.c,414 :: 		aci_cmd_params_send_data.tx_data.pipe_number = pipe;
; size start address is: 24 (R6)
; p_value start address is: 4 (R1)
; pipe start address is: 0 (R0)
STRB	R0, [SP, #4]
; pipe end address is: 0 (R0)
;lib_aci.c,415 :: 		memcpy(&(aci_cmd_params_send_data.tx_data.aci_data[0]), p_value, size);
ADD	R3, SP, #5
UXTB	R2, R6
; p_value end address is: 4 (R1)
MOV	R0, R3
BL	_memcpy+0
;lib_aci.c,416 :: 		acil_encode_cmd_send_data(&(msg_to_send.buffer[0]), &aci_cmd_params_send_data, size);
ADD	R3, SP, #4
UXTB	R2, R6
; size end address is: 24 (R6)
MOV	R1, R3
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_send_data+0
;lib_aci.c,418 :: 		ret_val = hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,420 :: 		return ret_val;
;lib_aci.c,421 :: 		}
L_end_lib_aci_send_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _lib_aci_send_data
_lib_aci_request_data:
;lib_aci.c,424 :: 		bool lib_aci_request_data(aci_state_t *aci_stat, uint8_t pipe)
; pipe start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R0, R1
; pipe end address is: 4 (R1)
; pipe start address is: 0 (R0)
;lib_aci.c,426 :: 		bool ret_val = false;
;lib_aci.c,429 :: 		if(!((p_services_pipe_type_map[pipe-1].location == ACI_STORE_REMOTE)&&(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_REQ)))
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
LDRB	R2, [R2, #0]
CMP	R2, #2
IT	NE
BNE	L_lib_aci_request_data30
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
ADDS	R2, R2, #2
LDRSH	R2, [R2, #0]
CMP	R2, #64
IT	NE
BNE	L_lib_aci_request_data30
MOVS	R2, #1
IT	AL
BAL	L_lib_aci_request_data29
L_lib_aci_request_data30:
MOVS	R2, #0
L_lib_aci_request_data29:
CMP	R2, #0
IT	NE
BNE	L_lib_aci_request_data31
; pipe end address is: 0 (R0)
;lib_aci.c,431 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_request_data
;lib_aci.c,432 :: 		}
L_lib_aci_request_data31:
;lib_aci.c,441 :: 		aci_cmd_params_request_data.pipe_number = pipe;
; pipe start address is: 0 (R0)
STRB	R0, [SP, #4]
; pipe end address is: 0 (R0)
;lib_aci.c,442 :: 		acil_encode_cmd_request_data(&(msg_to_send.buffer[0]), &aci_cmd_params_request_data);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_request_data+0
;lib_aci.c,444 :: 		ret_val = hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,447 :: 		return ret_val;
;lib_aci.c,448 :: 		}
L_end_lib_aci_request_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_request_data
_lib_aci_change_timing:
;lib_aci.c,451 :: 		bool lib_aci_change_timing(uint16_t minimun_cx_interval, uint16_t maximum_cx_interval, uint16_t slave_latency, uint16_t timeout)
; timeout start address is: 12 (R3)
; slave_latency start address is: 8 (R2)
; maximum_cx_interval start address is: 4 (R1)
; minimun_cx_interval start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; timeout end address is: 12 (R3)
; slave_latency end address is: 8 (R2)
; maximum_cx_interval end address is: 4 (R1)
; minimun_cx_interval end address is: 0 (R0)
; minimun_cx_interval start address is: 0 (R0)
; maximum_cx_interval start address is: 4 (R1)
; slave_latency start address is: 8 (R2)
; timeout start address is: 12 (R3)
;lib_aci.c,454 :: 		aci_cmd_params_change_timing.conn_params.min_conn_interval = minimun_cx_interval;
STRH	R0, [SP, #4]
; minimun_cx_interval end address is: 0 (R0)
;lib_aci.c,455 :: 		aci_cmd_params_change_timing.conn_params.max_conn_interval = maximum_cx_interval;
STRH	R1, [SP, #6]
; maximum_cx_interval end address is: 4 (R1)
;lib_aci.c,456 :: 		aci_cmd_params_change_timing.conn_params.slave_latency     = slave_latency;
STRH	R2, [SP, #8]
; slave_latency end address is: 8 (R2)
;lib_aci.c,457 :: 		aci_cmd_params_change_timing.conn_params.timeout_mult      = timeout;
STRH	R3, [SP, #10]
; timeout end address is: 12 (R3)
;lib_aci.c,458 :: 		acil_encode_cmd_change_timing_req(&(msg_to_send.buffer[0]), &aci_cmd_params_change_timing);
ADD	R4, SP, #4
MOV	R1, R4
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_change_timing_req+0
;lib_aci.c,459 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,460 :: 		}
L_end_lib_aci_change_timing:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _lib_aci_change_timing
_lib_aci_change_timing_GAP_PPCP:
;lib_aci.c,463 :: 		bool lib_aci_change_timing_GAP_PPCP()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,465 :: 		acil_encode_cmd_change_timing_req_GAP_PPCP(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_change_timing_req_GAP_PPCP+0
;lib_aci.c,466 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,467 :: 		}
L_end_lib_aci_change_timing_GAP_PPCP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_change_timing_GAP_PPCP
_lib_aci_open_remote_pipe:
;lib_aci.c,470 :: 		bool lib_aci_open_remote_pipe(aci_state_t *aci_stat, uint8_t pipe)
; pipe start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R0, R1
; pipe end address is: 4 (R1)
; pipe start address is: 0 (R0)
;lib_aci.c,472 :: 		bool ret_val = false;
;lib_aci.c,475 :: 		if(!((p_services_pipe_type_map[pipe-1].location == ACI_STORE_REMOTE)&&
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
LDRB	R2, [R2, #0]
;lib_aci.c,478 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK))))
CMP	R2, #2
IT	NE
BNE	L_lib_aci_open_remote_pipe35
;lib_aci.c,476 :: 		((p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX)||
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
ADDS	R2, R2, #2
LDRSH	R2, [R2, #0]
;lib_aci.c,477 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK_AUTO)||
CMP	R2, #8
IT	EQ
BEQ	L__lib_aci_open_remote_pipe72
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
ADDS	R2, R2, #2
LDRSH	R2, [R2, #0]
CMP	R2, #1024
IT	EQ
BEQ	L__lib_aci_open_remote_pipe71
;lib_aci.c,478 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK))))
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
ADDS	R2, R2, #2
LDRSH	R2, [R2, #0]
CMP	R2, #16
IT	EQ
BEQ	L__lib_aci_open_remote_pipe70
IT	AL
BAL	L_lib_aci_open_remote_pipe35
;lib_aci.c,477 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK_AUTO)||
L__lib_aci_open_remote_pipe72:
L__lib_aci_open_remote_pipe71:
;lib_aci.c,478 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK))))
L__lib_aci_open_remote_pipe70:
MOVS	R2, #1
IT	AL
BAL	L_lib_aci_open_remote_pipe34
L_lib_aci_open_remote_pipe35:
MOVS	R2, #0
L_lib_aci_open_remote_pipe34:
CMP	R2, #0
IT	NE
BNE	L_lib_aci_open_remote_pipe36
; pipe end address is: 0 (R0)
;lib_aci.c,480 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_open_remote_pipe
;lib_aci.c,481 :: 		}
L_lib_aci_open_remote_pipe36:
;lib_aci.c,486 :: 		is_request_operation_pending = true;
; pipe start address is: 0 (R0)
MOVS	R3, #1
MOVW	R2, #lo_addr(lib_aci_is_request_operation_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_request_operation_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,487 :: 		is_open_remote_pipe_pending = true;
MOVS	R3, #1
MOVW	R2, #lo_addr(lib_aci_is_open_remote_pipe_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_open_remote_pipe_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,488 :: 		request_operation_pipe = pipe;
MOVW	R2, #lo_addr(lib_aci_request_operation_pipe+0)
MOVT	R2, #hi_addr(lib_aci_request_operation_pipe+0)
STRB	R0, [R2, #0]
;lib_aci.c,489 :: 		aci_cmd_params_open_remote_pipe.pipe_number = pipe;
STRB	R0, [SP, #4]
; pipe end address is: 0 (R0)
;lib_aci.c,490 :: 		acil_encode_cmd_open_remote_pipe(&(msg_to_send.buffer[0]), &aci_cmd_params_open_remote_pipe);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_open_remote_pipe+0
;lib_aci.c,491 :: 		ret_val = hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,493 :: 		return ret_val;
;lib_aci.c,494 :: 		}
L_end_lib_aci_open_remote_pipe:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_open_remote_pipe
_lib_aci_close_remote_pipe:
;lib_aci.c,497 :: 		bool lib_aci_close_remote_pipe(aci_state_t *aci_stat, uint8_t pipe)
; pipe start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R0, R1
; pipe end address is: 4 (R1)
; pipe start address is: 0 (R0)
;lib_aci.c,499 :: 		bool ret_val = false;
;lib_aci.c,502 :: 		if(!((p_services_pipe_type_map[pipe-1].location == ACI_STORE_REMOTE)&&
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
LDRB	R2, [R2, #0]
;lib_aci.c,505 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK))))
CMP	R2, #2
IT	NE
BNE	L_lib_aci_close_remote_pipe40
;lib_aci.c,503 :: 		((p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX)||
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
ADDS	R2, R2, #2
LDRSH	R2, [R2, #0]
;lib_aci.c,504 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK_AUTO)||
CMP	R2, #8
IT	EQ
BEQ	L__lib_aci_close_remote_pipe76
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
ADDS	R2, R2, #2
LDRSH	R2, [R2, #0]
CMP	R2, #1024
IT	EQ
BEQ	L__lib_aci_close_remote_pipe75
;lib_aci.c,505 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK))))
SUBS	R2, R0, #1
SXTH	R2, R2
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(lib_aci_p_services_pipe_type_map+0)
MOVT	R2, #hi_addr(lib_aci_p_services_pipe_type_map+0)
LDR	R2, [R2, #0]
ADDS	R2, R2, R3
ADDS	R2, R2, #2
LDRSH	R2, [R2, #0]
CMP	R2, #16
IT	EQ
BEQ	L__lib_aci_close_remote_pipe74
IT	AL
BAL	L_lib_aci_close_remote_pipe40
;lib_aci.c,504 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK_AUTO)||
L__lib_aci_close_remote_pipe76:
L__lib_aci_close_remote_pipe75:
;lib_aci.c,505 :: 		(p_services_pipe_type_map[pipe-1].pipe_type == ACI_RX_ACK))))
L__lib_aci_close_remote_pipe74:
MOVS	R2, #1
IT	AL
BAL	L_lib_aci_close_remote_pipe39
L_lib_aci_close_remote_pipe40:
MOVS	R2, #0
L_lib_aci_close_remote_pipe39:
CMP	R2, #0
IT	NE
BNE	L_lib_aci_close_remote_pipe41
; pipe end address is: 0 (R0)
;lib_aci.c,507 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_close_remote_pipe
;lib_aci.c,508 :: 		}
L_lib_aci_close_remote_pipe41:
;lib_aci.c,513 :: 		is_request_operation_pending = true;
; pipe start address is: 0 (R0)
MOVS	R3, #1
MOVW	R2, #lo_addr(lib_aci_is_request_operation_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_request_operation_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,514 :: 		is_close_remote_pipe_pending = true;
MOVS	R3, #1
MOVW	R2, #lo_addr(lib_aci_is_close_remote_pipe_pending+0)
MOVT	R2, #hi_addr(lib_aci_is_close_remote_pipe_pending+0)
STRB	R3, [R2, #0]
;lib_aci.c,515 :: 		request_operation_pipe = pipe;
MOVW	R2, #lo_addr(lib_aci_request_operation_pipe+0)
MOVT	R2, #hi_addr(lib_aci_request_operation_pipe+0)
STRB	R0, [R2, #0]
;lib_aci.c,516 :: 		aci_cmd_params_close_remote_pipe.pipe_number = pipe;
STRB	R0, [SP, #4]
; pipe end address is: 0 (R0)
;lib_aci.c,517 :: 		acil_encode_cmd_close_remote_pipe(&(msg_to_send.buffer[0]), &aci_cmd_params_close_remote_pipe);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_close_remote_pipe+0
;lib_aci.c,518 :: 		ret_val = hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,520 :: 		return ret_val;
;lib_aci.c,521 :: 		}
L_end_lib_aci_close_remote_pipe:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_close_remote_pipe
_lib_aci_set_key:
;lib_aci.c,524 :: 		bool lib_aci_set_key(aci_key_type_t key_rsp_type, uint8_t *key, uint8_t len)
; len start address is: 8 (R2)
; key start address is: 4 (R1)
; key_rsp_type start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
; len end address is: 8 (R2)
; key end address is: 4 (R1)
; key_rsp_type end address is: 0 (R0)
; key_rsp_type start address is: 0 (R0)
; key start address is: 4 (R1)
; len start address is: 8 (R2)
;lib_aci.c,527 :: 		aci_cmd_params_set_key.key_type = key_rsp_type;
STRB	R0, [SP, #4]
; key_rsp_type end address is: 0 (R0)
;lib_aci.c,528 :: 		memcpy((uint8_t*)&(aci_cmd_params_set_key.key), key, len);
ADD	R3, SP, #5
; len end address is: 8 (R2)
; key end address is: 4 (R1)
MOV	R0, R3
BL	_memcpy+0
;lib_aci.c,529 :: 		acil_encode_cmd_set_key(&(msg_to_send.buffer[0]), &aci_cmd_params_set_key);
ADD	R3, SP, #4
MOV	R1, R3
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_set_key+0
;lib_aci.c,530 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,531 :: 		}
L_end_lib_aci_set_key:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _lib_aci_set_key
_lib_aci_echo_msg:
;lib_aci.c,534 :: 		bool lib_aci_echo_msg(uint8_t msg_size, uint8_t *p_msg_data)
; p_msg_data start address is: 4 (R1)
; msg_size start address is: 0 (R0)
SUB	SP, SP, #36
STR	LR, [SP, #0]
; p_msg_data end address is: 4 (R1)
; msg_size end address is: 0 (R0)
; msg_size start address is: 0 (R0)
; p_msg_data start address is: 4 (R1)
;lib_aci.c,537 :: 		if(msg_size > (ACI_ECHO_DATA_MAX_LEN))
CMP	R0, #29
IT	LS
BLS	L_lib_aci_echo_msg42
; p_msg_data end address is: 4 (R1)
; msg_size end address is: 0 (R0)
;lib_aci.c,539 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_echo_msg
;lib_aci.c,540 :: 		}
L_lib_aci_echo_msg42:
;lib_aci.c,542 :: 		if (msg_size > (ACI_ECHO_DATA_MAX_LEN))
; msg_size start address is: 0 (R0)
; p_msg_data start address is: 4 (R1)
CMP	R0, #29
IT	LS
BLS	L__lib_aci_echo_msg77
;lib_aci.c,544 :: 		msg_size = ACI_ECHO_DATA_MAX_LEN;
MOVS	R0, #29
; msg_size end address is: 0 (R0)
UXTB	R6, R0
;lib_aci.c,545 :: 		}
IT	AL
BAL	L_lib_aci_echo_msg43
L__lib_aci_echo_msg77:
;lib_aci.c,542 :: 		if (msg_size > (ACI_ECHO_DATA_MAX_LEN))
UXTB	R6, R0
;lib_aci.c,545 :: 		}
L_lib_aci_echo_msg43:
;lib_aci.c,547 :: 		memcpy(&(aci_cmd_params_echo.echo_data[0]), p_msg_data, msg_size);
; msg_size start address is: 24 (R6)
ADD	R2, SP, #4
MOV	R0, R2
; p_msg_data end address is: 4 (R1)
UXTB	R2, R6
BL	_memcpy+0
;lib_aci.c,548 :: 		acil_encode_cmd_echo_msg(&(msg_to_send.buffer[0]), &aci_cmd_params_echo, msg_size);
ADD	R2, SP, #4
MOV	R1, R2
; msg_size end address is: 24 (R6)
UXTB	R2, R6
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_echo_msg+0
;lib_aci.c,550 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,551 :: 		}
L_end_lib_aci_echo_msg:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _lib_aci_echo_msg
_lib_aci_bond_request:
;lib_aci.c,554 :: 		bool lib_aci_bond_request()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,556 :: 		acil_encode_cmd_bond_security_request(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_bond_security_request+0
;lib_aci.c,557 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,558 :: 		}
L_end_lib_aci_bond_request:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_bond_request
_lib_aci_event_peek:
;lib_aci.c,560 :: 		bool lib_aci_event_peek(hal_aci_evt_t *p_aci_evt_data)
; p_aci_evt_data start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; p_aci_evt_data end address is: 0 (R0)
; p_aci_evt_data start address is: 0 (R0)
;lib_aci.c,562 :: 		return hal_aci_tl_event_peek((hal_aci_data_t *)p_aci_evt_data);
; p_aci_evt_data end address is: 0 (R0)
BL	_hal_aci_tl_event_peek+0
;lib_aci.c,563 :: 		}
L_end_lib_aci_event_peek:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_event_peek
_lib_aci_event_get:
;lib_aci.c,565 :: 		bool lib_aci_event_get(aci_state_t *aci_stat, hal_aci_evt_t *p_aci_evt_data)
; p_aci_evt_data start address is: 4 (R1)
; aci_stat start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R5, R0
MOV	R3, R1
; p_aci_evt_data end address is: 4 (R1)
; aci_stat end address is: 0 (R0)
; aci_stat start address is: 20 (R5)
; p_aci_evt_data start address is: 12 (R3)
;lib_aci.c,567 :: 		bool status = false;
;lib_aci.c,569 :: 		status = hal_aci_tl_event_get((hal_aci_data_t *)p_aci_evt_data);
STR	R3, [SP, #4]
STR	R5, [SP, #8]
MOV	R0, R3
BL	_hal_aci_tl_event_get+0
LDR	R5, [SP, #8]
LDR	R3, [SP, #4]
; status start address is: 4 (R1)
UXTB	R1, R0
;lib_aci.c,575 :: 		if (true == status)
CMP	R0, #1
IT	NE
BNE	L__lib_aci_event_get65
;lib_aci.c,579 :: 		aci_evt = &p_aci_evt_data->evt;
ADDS	R2, R3, #1
; p_aci_evt_data end address is: 12 (R3)
; aci_evt start address is: 24 (R6)
MOV	R6, R2
;lib_aci.c,581 :: 		switch(aci_evt->evt_opcode)
ADDS	R4, R2, #1
IT	AL
BAL	L_lib_aci_event_get45
;lib_aci.c,583 :: 		case ACI_EVT_PIPE_STATUS:
L_lib_aci_event_get47:
;lib_aci.c,585 :: 		uint8_t i=0;
;lib_aci.c,587 :: 		for (i=0; i < PIPES_ARRAY_SIZE; i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; aci_evt end address is: 24 (R6)
; aci_stat end address is: 20 (R5)
; i end address is: 0 (R0)
; status end address is: 4 (R1)
STRB	R0, [SP, #4]
MOV	R0, R6
MOV	R6, R5
LDRB	R5, [SP, #4]
L_lib_aci_event_get48:
; i start address is: 20 (R5)
; aci_stat start address is: 24 (R6)
; aci_evt start address is: 0 (R0)
; aci_evt start address is: 0 (R0)
; aci_evt end address is: 0 (R0)
; status start address is: 4 (R1)
; aci_stat start address is: 24 (R6)
; aci_stat end address is: 24 (R6)
CMP	R5, #8
IT	CS
BCS	L_lib_aci_event_get49
; aci_evt end address is: 0 (R0)
; aci_stat end address is: 24 (R6)
;lib_aci.c,589 :: 		aci_stat->pipes_open_bitmap[i]   = aci_evt->params.pipe_status.pipes_open_bitmap[i];
; aci_stat start address is: 24 (R6)
; aci_evt start address is: 0 (R0)
ADDW	R2, R6, #38
ADDS	R3, R2, R5
ADDS	R2, R0, #2
ADDS	R2, R2, R5
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;lib_aci.c,590 :: 		aci_stat->pipes_closed_bitmap[i] = aci_evt->params.pipe_status.pipes_closed_bitmap[i];
ADDW	R2, R6, #46
ADDS	R3, R2, R5
ADDS	R2, R0, #2
ADDS	R2, #8
ADDS	R2, R2, R5
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;lib_aci.c,587 :: 		for (i=0; i < PIPES_ARRAY_SIZE; i++)
ADDS	R5, R5, #1
UXTB	R5, R5
;lib_aci.c,591 :: 		}
; aci_evt end address is: 0 (R0)
; aci_stat end address is: 24 (R6)
; i end address is: 20 (R5)
IT	AL
BAL	L_lib_aci_event_get48
L_lib_aci_event_get49:
;lib_aci.c,593 :: 		break;
UXTB	R0, R1
IT	AL
BAL	L_lib_aci_event_get46
;lib_aci.c,595 :: 		case ACI_EVT_DISCONNECTED:
L_lib_aci_event_get51:
;lib_aci.c,597 :: 		uint8_t i=0;
; aci_stat start address is: 20 (R5)
;lib_aci.c,599 :: 		for (i=0; i < PIPES_ARRAY_SIZE; i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; aci_stat end address is: 20 (R5)
; i end address is: 0 (R0)
; status end address is: 4 (R1)
L_lib_aci_event_get52:
; i start address is: 0 (R0)
; status start address is: 4 (R1)
; aci_stat start address is: 20 (R5)
CMP	R0, #8
IT	CS
BCS	L_lib_aci_event_get53
;lib_aci.c,601 :: 		aci_stat->pipes_open_bitmap[i] = 0;
ADDW	R2, R5, #38
ADDS	R3, R2, R0
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,602 :: 		aci_stat->pipes_closed_bitmap[i] = 0;
ADDW	R2, R5, #46
ADDS	R3, R2, R0
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,599 :: 		for (i=0; i < PIPES_ARRAY_SIZE; i++)
ADDS	R0, R0, #1
UXTB	R0, R0
;lib_aci.c,603 :: 		}
; i end address is: 0 (R0)
IT	AL
BAL	L_lib_aci_event_get52
L_lib_aci_event_get53:
;lib_aci.c,604 :: 		aci_stat->confirmation_pending = false;
ADDW	R3, R5, #54
MOVS	R2, #0
STRB	R2, [R3, #0]
;lib_aci.c,605 :: 		aci_stat->data_credit_available = aci_stat->data_credit_total;
ADDW	R3, R5, #31
ADDW	R2, R5, #29
; aci_stat end address is: 20 (R5)
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;lib_aci.c,608 :: 		break;
UXTB	R0, R1
IT	AL
BAL	L_lib_aci_event_get46
;lib_aci.c,610 :: 		case ACI_EVT_TIMING:
L_lib_aci_event_get55:
;lib_aci.c,611 :: 		aci_stat->connection_interval = aci_evt->params.timing.conn_rf_interval;
; aci_stat start address is: 20 (R5)
; aci_evt start address is: 24 (R6)
ADDW	R3, R5, #32
ADDS	R2, R6, #2
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;lib_aci.c,612 :: 		aci_stat->slave_latency       = aci_evt->params.timing.conn_slave_rf_latency;
ADDW	R3, R5, #34
ADDS	R2, R6, #2
ADDS	R2, R2, #2
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;lib_aci.c,613 :: 		aci_stat->supervision_timeout = aci_evt->params.timing.conn_rf_timeout;
ADDW	R3, R5, #36
; aci_stat end address is: 20 (R5)
ADDS	R2, R6, #2
; aci_evt end address is: 24 (R6)
ADDS	R2, R2, #4
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;lib_aci.c,614 :: 		break;
UXTB	R0, R1
IT	AL
BAL	L_lib_aci_event_get46
;lib_aci.c,616 :: 		case ACI_EVT_CONNECTED:
L_lib_aci_event_get56:
;lib_aci.c,617 :: 		aci_stat->connection_interval = aci_evt->params.connected.conn_rf_interval;
; aci_stat start address is: 20 (R5)
; aci_evt start address is: 24 (R6)
ADDW	R3, R5, #32
ADDS	R2, R6, #2
ADDS	R2, R2, #7
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;lib_aci.c,618 :: 		aci_stat->slave_latency       = aci_evt->params.connected.conn_slave_rf_latency;
ADDW	R3, R5, #34
ADDS	R2, R6, #2
ADDS	R2, #9
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;lib_aci.c,619 :: 		aci_stat->supervision_timeout = aci_evt->params.connected.conn_rf_timeout;
ADDW	R3, R5, #36
; aci_stat end address is: 20 (R5)
ADDS	R2, R6, #2
; aci_evt end address is: 24 (R6)
ADDS	R2, #11
LDRH	R2, [R2, #0]
STRH	R2, [R3, #0]
;lib_aci.c,620 :: 		break;
UXTB	R0, R1
IT	AL
BAL	L_lib_aci_event_get46
;lib_aci.c,622 :: 		default:
L_lib_aci_event_get57:
;lib_aci.c,626 :: 		break;
UXTB	R0, R1
IT	AL
BAL	L_lib_aci_event_get46
;lib_aci.c,630 :: 		}
L_lib_aci_event_get45:
; aci_stat start address is: 20 (R5)
; aci_evt start address is: 24 (R6)
LDRB	R2, [R4, #0]
CMP	R2, #136
IT	EQ
BEQ	L_lib_aci_event_get47
LDRB	R2, [R4, #0]
CMP	R2, #134
IT	EQ
BEQ	L_lib_aci_event_get51
LDRB	R2, [R4, #0]
CMP	R2, #137
IT	EQ
BEQ	L_lib_aci_event_get55
LDRB	R2, [R4, #0]
CMP	R2, #133
IT	EQ
BEQ	L_lib_aci_event_get56
; aci_evt end address is: 24 (R6)
; aci_stat end address is: 20 (R5)
IT	AL
BAL	L_lib_aci_event_get57
; status end address is: 4 (R1)
L_lib_aci_event_get46:
;lib_aci.c,631 :: 		}
; status start address is: 0 (R0)
; status end address is: 0 (R0)
IT	AL
BAL	L_lib_aci_event_get44
L__lib_aci_event_get65:
;lib_aci.c,575 :: 		if (true == status)
UXTB	R0, R1
;lib_aci.c,631 :: 		}
L_lib_aci_event_get44:
;lib_aci.c,632 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;lib_aci.c,633 :: 		}
L_end_lib_aci_event_get:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _lib_aci_event_get
_lib_aci_send_ack:
;lib_aci.c,636 :: 		bool lib_aci_send_ack(aci_state_t *aci_stat, const uint8_t pipe)
; pipe start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; pipe end address is: 4 (R1)
; pipe start address is: 4 (R1)
;lib_aci.c,638 :: 		bool ret_val = false;
;lib_aci.c,640 :: 		acil_encode_cmd_send_data_ack(&(msg_to_send.buffer[0]), pipe);
; pipe end address is: 4 (R1)
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_send_data_ack+0
;lib_aci.c,642 :: 		ret_val = hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,644 :: 		return ret_val;
;lib_aci.c,645 :: 		}
L_end_lib_aci_send_ack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_send_ack
_lib_aci_send_nack:
;lib_aci.c,648 :: 		bool lib_aci_send_nack(aci_state_t *aci_stat, const uint8_t pipe, const uint8_t error_code)
; error_code start address is: 8 (R2)
; pipe start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; error_code end address is: 8 (R2)
; pipe end address is: 4 (R1)
; pipe start address is: 4 (R1)
; error_code start address is: 8 (R2)
;lib_aci.c,650 :: 		bool ret_val = false;
;lib_aci.c,654 :: 		acil_encode_cmd_send_data_nack(&(msg_to_send.buffer[0]), pipe, error_code);
; error_code end address is: 8 (R2)
; pipe end address is: 4 (R1)
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_send_data_nack+0
;lib_aci.c,655 :: 		ret_val = hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,657 :: 		return ret_val;
;lib_aci.c,658 :: 		}
L_end_lib_aci_send_nack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_send_nack
_lib_aci_broadcast:
;lib_aci.c,661 :: 		bool lib_aci_broadcast(const uint16_t timeout, const uint16_t adv_interval)
; adv_interval start address is: 4 (R1)
; timeout start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; adv_interval end address is: 4 (R1)
; timeout end address is: 0 (R0)
; timeout start address is: 0 (R0)
; adv_interval start address is: 4 (R1)
;lib_aci.c,664 :: 		if (timeout > 16383)
MOVW	R2, #16383
CMP	R0, R2
IT	LS
BLS	L_lib_aci_broadcast58
; timeout end address is: 0 (R0)
; adv_interval end address is: 4 (R1)
;lib_aci.c,666 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_broadcast
;lib_aci.c,667 :: 		}
L_lib_aci_broadcast58:
;lib_aci.c,671 :: 		if ((160 > adv_interval) || (adv_interval > 16384))
; adv_interval start address is: 4 (R1)
; timeout start address is: 0 (R0)
CMP	R1, #160
IT	CC
BCC	L__lib_aci_broadcast80
CMP	R1, #16384
IT	HI
BHI	L__lib_aci_broadcast79
IT	AL
BAL	L_lib_aci_broadcast61
; timeout end address is: 0 (R0)
; adv_interval end address is: 4 (R1)
L__lib_aci_broadcast80:
L__lib_aci_broadcast79:
;lib_aci.c,673 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_lib_aci_broadcast
;lib_aci.c,674 :: 		}
L_lib_aci_broadcast61:
;lib_aci.c,676 :: 		aci_cmd_params_broadcast.timeout = timeout;
; adv_interval start address is: 4 (R1)
; timeout start address is: 0 (R0)
STRH	R0, [SP, #4]
; timeout end address is: 0 (R0)
;lib_aci.c,677 :: 		aci_cmd_params_broadcast.adv_interval = adv_interval;
STRH	R1, [SP, #6]
; adv_interval end address is: 4 (R1)
;lib_aci.c,678 :: 		acil_encode_cmd_broadcast(&(msg_to_send.buffer[0]), &aci_cmd_params_broadcast);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_broadcast+0
;lib_aci.c,679 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,680 :: 		}
L_end_lib_aci_broadcast:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_broadcast
_lib_aci_open_adv_pipes:
;lib_aci.c,683 :: 		bool lib_aci_open_adv_pipes(const uint8_t * const adv_service_data_pipes)
; adv_service_data_pipes start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; adv_service_data_pipes end address is: 0 (R0)
; adv_service_data_pipes start address is: 0 (R0)
;lib_aci.c,687 :: 		for (i = 0; i < PIPES_ARRAY_SIZE; i++)
; i start address is: 12 (R3)
MOVS	R3, #0
; i end address is: 12 (R3)
L_lib_aci_open_adv_pipes62:
; i start address is: 12 (R3)
; adv_service_data_pipes start address is: 0 (R0)
; adv_service_data_pipes end address is: 0 (R0)
CMP	R3, #8
IT	CS
BCS	L_lib_aci_open_adv_pipes63
; adv_service_data_pipes end address is: 0 (R0)
;lib_aci.c,689 :: 		aci_cmd_params_open_adv_pipe.pipes[i] = adv_service_data_pipes[i];
; adv_service_data_pipes start address is: 0 (R0)
MOVW	R1, #lo_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
MOVT	R1, #hi_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
ADDS	R2, R1, R3
ADDS	R1, R0, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;lib_aci.c,687 :: 		for (i = 0; i < PIPES_ARRAY_SIZE; i++)
ADDS	R3, R3, #1
UXTB	R3, R3
;lib_aci.c,690 :: 		}
; adv_service_data_pipes end address is: 0 (R0)
; i end address is: 12 (R3)
IT	AL
BAL	L_lib_aci_open_adv_pipes62
L_lib_aci_open_adv_pipes63:
;lib_aci.c,692 :: 		acil_encode_cmd_open_adv_pipes(&(msg_to_send.buffer[0]), &aci_cmd_params_open_adv_pipe);
MOVW	R1, #lo_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
MOVT	R1, #hi_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_open_adv_pipes+0
;lib_aci.c,693 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,694 :: 		}
L_end_lib_aci_open_adv_pipes:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_open_adv_pipes
_lib_aci_open_adv_pipe:
;lib_aci.c,696 :: 		bool lib_aci_open_adv_pipe(const uint8_t pipe)
; pipe start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; pipe end address is: 0 (R0)
; pipe start address is: 0 (R0)
;lib_aci.c,698 :: 		uint8_t byte_idx = pipe / 8;
LSRS	R2, R0, #3
UXTB	R2, R2
;lib_aci.c,700 :: 		aci_cmd_params_open_adv_pipe.pipes[byte_idx] |= (0x01 << (pipe % 8));
MOVW	R1, #lo_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
MOVT	R1, #hi_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
ADDS	R3, R1, R2
AND	R2, R0, #7
UXTB	R2, R2
; pipe end address is: 0 (R0)
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R2
SXTH	R2, R2
LDRB	R1, [R3, #0]
ORRS	R1, R2
STRB	R1, [R3, #0]
;lib_aci.c,701 :: 		acil_encode_cmd_open_adv_pipes(&(msg_to_send.buffer[0]), &aci_cmd_params_open_adv_pipe);
MOVW	R1, #lo_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
MOVT	R1, #hi_addr(lib_aci_aci_cmd_params_open_adv_pipe+0)
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_open_adv_pipes+0
;lib_aci.c,702 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,703 :: 		}
L_end_lib_aci_open_adv_pipe:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_open_adv_pipe
_lib_aci_read_dynamic_data:
;lib_aci.c,706 :: 		bool lib_aci_read_dynamic_data()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,708 :: 		acil_encode_cmd_read_dynamic_data(&(msg_to_send.buffer[0]));
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_read_dynamic_data+0
;lib_aci.c,709 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,710 :: 		}
L_end_lib_aci_read_dynamic_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_read_dynamic_data
_lib_aci_write_dynamic_data:
;lib_aci.c,713 :: 		bool lib_aci_write_dynamic_data(uint8_t sequence_number, uint8_t* dynamic_data, uint8_t length)
; length start address is: 8 (R2)
; dynamic_data start address is: 4 (R1)
; sequence_number start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; length end address is: 8 (R2)
; dynamic_data end address is: 4 (R1)
; sequence_number end address is: 0 (R0)
; sequence_number start address is: 0 (R0)
; dynamic_data start address is: 4 (R1)
; length start address is: 8 (R2)
;lib_aci.c,715 :: 		acil_encode_cmd_write_dynamic_data(&(msg_to_send.buffer[0]), sequence_number, dynamic_data, length);
UXTB	R3, R2
; length end address is: 8 (R2)
MOV	R2, R1
; dynamic_data end address is: 4 (R1)
UXTB	R1, R0
; sequence_number end address is: 0 (R0)
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_write_dynamic_data+0
;lib_aci.c,716 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,717 :: 		}
L_end_lib_aci_write_dynamic_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_write_dynamic_data
_lib_aci_dtm_command:
;lib_aci.c,719 :: 		bool lib_aci_dtm_command(uint8_t dtm_command_msbyte, uint8_t dtm_command_lsbyte)
; dtm_command_lsbyte start address is: 4 (R1)
; dtm_command_msbyte start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; dtm_command_lsbyte end address is: 4 (R1)
; dtm_command_msbyte end address is: 0 (R0)
; dtm_command_msbyte start address is: 0 (R0)
; dtm_command_lsbyte start address is: 4 (R1)
;lib_aci.c,722 :: 		aci_cmd_params_dtm_cmd.cmd_msb = dtm_command_msbyte;
STRB	R0, [SP, #4]
; dtm_command_msbyte end address is: 0 (R0)
;lib_aci.c,723 :: 		aci_cmd_params_dtm_cmd.cmd_lsb = dtm_command_lsbyte;
STRB	R1, [SP, #5]
; dtm_command_lsbyte end address is: 4 (R1)
;lib_aci.c,724 :: 		acil_encode_cmd_dtm_cmd(&(msg_to_send.buffer[0]), &aci_cmd_params_dtm_cmd);
ADD	R2, SP, #4
MOV	R1, R2
MOVW	R0, #lo_addr(_msg_to_send+1)
MOVT	R0, #hi_addr(_msg_to_send+1)
BL	_acil_encode_cmd_dtm_cmd+0
;lib_aci.c,725 :: 		return hal_aci_tl_send(&msg_to_send);
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
;lib_aci.c,726 :: 		}
L_end_lib_aci_dtm_command:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lib_aci_dtm_command
_lib_aci_flush:
;lib_aci.c,728 :: 		void lib_aci_flush(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,730 :: 		hal_aci_tl_q_flush();
BL	_hal_aci_tl_q_flush+0
;lib_aci.c,731 :: 		}
L_end_lib_aci_flush:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_flush
_lib_aci_debug_print:
;lib_aci.c,733 :: 		void lib_aci_debug_print(bool enable)
; enable start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;lib_aci.c,735 :: 		hal_aci_tl_debug_print(enable);
; enable end address is: 0 (R0)
BL	_hal_aci_tl_debug_print+0
;lib_aci.c,737 :: 		}
L_end_lib_aci_debug_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_debug_print
_lib_aci_pin_reset:
;lib_aci.c,739 :: 		void lib_aci_pin_reset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,741 :: 		hal_aci_tl_pin_reset();
BL	_hal_aci_tl_pin_reset+0
;lib_aci.c,742 :: 		}
L_end_lib_aci_pin_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_pin_reset
_lib_aci_event_queue_empty:
;lib_aci.c,744 :: 		bool lib_aci_event_queue_empty(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,746 :: 		return hal_aci_tl_rx_q_empty();
BL	_hal_aci_tl_rx_q_empty+0
;lib_aci.c,747 :: 		}
L_end_lib_aci_event_queue_empty:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_event_queue_empty
_lib_aci_event_queue_full:
;lib_aci.c,749 :: 		bool lib_aci_event_queue_full(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,751 :: 		return hal_aci_tl_rx_q_full();
BL	_hal_aci_tl_rx_q_full+0
;lib_aci.c,752 :: 		}
L_end_lib_aci_event_queue_full:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_event_queue_full
_lib_aci_command_queue_empty:
;lib_aci.c,754 :: 		bool lib_aci_command_queue_empty(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,756 :: 		return hal_aci_tl_tx_q_empty();
BL	_hal_aci_tl_tx_q_empty+0
;lib_aci.c,757 :: 		}
L_end_lib_aci_command_queue_empty:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_command_queue_empty
_lib_aci_command_queue_full:
;lib_aci.c,759 :: 		bool lib_aci_command_queue_full(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lib_aci.c,761 :: 		return hal_aci_tl_tx_q_full();
BL	_hal_aci_tl_tx_q_full+0
;lib_aci.c,762 :: 		}
L_end_lib_aci_command_queue_full:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lib_aci_command_queue_full
