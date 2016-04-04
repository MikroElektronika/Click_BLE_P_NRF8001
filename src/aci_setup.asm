aci_setup_aci_setup_fill:
;aci_setup.c,51 :: 		static bool aci_setup_fill(aci_state_t *aci_stat, uint8_t *num_cmd_offset)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R0, [SP, #8]
STR	R1, [SP, #12]
;aci_setup.c,53 :: 		bool ret_val = false;
MOVS	R2, #0
STRB	R2, [SP, #4]
;aci_setup.c,55 :: 		while (*num_cmd_offset < aci_stat->aci_setup_info.num_setup_msgs)
L_aci_setup_aci_setup_fill0:
LDR	R2, [SP, #12]
LDRB	R3, [R2, #0]
LDR	R2, [SP, #8]
ADDS	R2, #12
ADDS	R2, #12
LDRB	R2, [R2, #0]
CMP	R3, R2
IT	CS
BCS	L_aci_setup_aci_setup_fill1
;aci_setup.c,70 :: 		(aci_stat->aci_setup_info.setup_msgs[*num_cmd_offset].buffer[0]+2));
LDR	R2, [SP, #8]
ADDS	R2, #12
ADDW	R3, R2, #8
LDR	R2, [SP, #12]
LDRB	R4, [R2, #0]
LDR	R3, [R3, #0]
MOVS	R2, #33
MULS	R2, R4, R2
ADDS	R3, R3, R2
ADDS	R2, R3, #1
LDRB	R2, [R2, #0]
ADDS	R2, R2, #2
;aci_setup.c,69 :: 		memcpy(&msg_to_send, &(aci_stat->aci_setup_info.setup_msgs[*num_cmd_offset]),
MOV	R1, R3
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
;aci_setup.c,70 :: 		(aci_stat->aci_setup_info.setup_msgs[*num_cmd_offset].buffer[0]+2));
BL	_memcpy+0
;aci_setup.c,74 :: 		if (!hal_aci_tl_send(&msg_to_send))
MOVW	R0, #lo_addr(_msg_to_send+0)
MOVT	R0, #hi_addr(_msg_to_send+0)
BL	_hal_aci_tl_send+0
CMP	R0, #0
IT	NE
BNE	L_aci_setup_aci_setup_fill2
;aci_setup.c,78 :: 		return ret_val;
LDRB	R0, [SP, #4]
IT	AL
BAL	L_end_aci_setup_fill
;aci_setup.c,79 :: 		}
L_aci_setup_aci_setup_fill2:
;aci_setup.c,81 :: 		ret_val = true;
MOVS	R2, #1
STRB	R2, [SP, #4]
;aci_setup.c,83 :: 		(*num_cmd_offset)++;
LDR	R2, [SP, #12]
LDRB	R2, [R2, #0]
ADDS	R3, R2, #1
LDR	R2, [SP, #12]
STRB	R3, [R2, #0]
;aci_setup.c,84 :: 		}
IT	AL
BAL	L_aci_setup_aci_setup_fill0
L_aci_setup_aci_setup_fill1:
;aci_setup.c,86 :: 		return ret_val;
LDRB	R0, [SP, #4]
;aci_setup.c,87 :: 		}
L_end_aci_setup_fill:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of aci_setup_aci_setup_fill
_do_aci_setup:
;aci_setup.c,89 :: 		uint8_t do_aci_setup(aci_state_t *aci_stat)
SUB	SP, SP, #24
STR	LR, [SP, #0]
STR	R0, [SP, #20]
;aci_setup.c,91 :: 		uint8_t setup_offset         = 0;
ADD	R11, SP, #4
ADD	R10, R11, #16
MOVW	R12, #lo_addr(?ICSdo_aci_setup_setup_offset_L0+0)
MOVT	R12, #hi_addr(?ICSdo_aci_setup_setup_offset_L0+0)
BL	___CC2DW+0
;aci_setup.c,92 :: 		uint32_t i                   = 0x0000;
;aci_setup.c,93 :: 		aci_evt_t * aci_evt          = NULL;
;aci_setup.c,94 :: 		aci_status_code_t cmd_status = ACI_STATUS_ERROR_CRC_MISMATCH;
;aci_setup.c,100 :: 		hal_aci_evt_t  *aci_data = (hal_aci_evt_t *)&msg_to_send;
;aci_setup.c,106 :: 		if (!lib_aci_command_queue_empty())
BL	_lib_aci_command_queue_empty+0
CMP	R0, #0
IT	NE
BNE	L_do_aci_setup3
;aci_setup.c,108 :: 		return SETUP_FAIL_COMMAND_QUEUE_NOT_EMPTY;
MOVS	R0, #1
IT	AL
BAL	L_end_do_aci_setup
;aci_setup.c,109 :: 		}
L_do_aci_setup3:
;aci_setup.c,115 :: 		if (lib_aci_event_peek(aci_data))
LDR	R0, [SP, #16]
BL	_lib_aci_event_peek+0
CMP	R0, #0
IT	EQ
BEQ	L_do_aci_setup4
;aci_setup.c,117 :: 		return SETUP_FAIL_EVENT_QUEUE_NOT_EMPTY;
MOVS	R0, #2
IT	AL
BAL	L_end_do_aci_setup
;aci_setup.c,118 :: 		}
L_do_aci_setup4:
;aci_setup.c,121 :: 		aci_setup_fill(aci_stat, &setup_offset);
ADD	R1, SP, #4
LDR	R0, [SP, #20]
BL	aci_setup_aci_setup_fill+0
;aci_setup.c,123 :: 		while (cmd_status != ACI_STATUS_TRANSACTION_COMPLETE)
L_do_aci_setup5:
LDRB	R1, [SP, #12]
CMP	R1, #2
IT	EQ
BEQ	L_do_aci_setup6
;aci_setup.c,129 :: 		if (i++ > 0xFFFFE)
LDR	R2, [SP, #8]
LDR	R1, [SP, #8]
ADDS	R1, R1, #1
STR	R1, [SP, #8]
MOVW	R1, #65534
MOVT	R1, #15
CMP	R2, R1
IT	LS
BLS	L_do_aci_setup7
;aci_setup.c,131 :: 		return SETUP_FAIL_TIMEOUT;
MOVS	R0, #3
IT	AL
BAL	L_end_do_aci_setup
;aci_setup.c,132 :: 		}
L_do_aci_setup7:
;aci_setup.c,134 :: 		if (lib_aci_event_peek(aci_data))
LDR	R0, [SP, #16]
BL	_lib_aci_event_peek+0
CMP	R0, #0
IT	EQ
BEQ	L_do_aci_setup8
;aci_setup.c,136 :: 		aci_evt = &(aci_data->evt);
LDR	R1, [SP, #16]
ADDS	R1, R1, #1
; aci_evt start address is: 0 (R0)
MOV	R0, R1
;aci_setup.c,138 :: 		if (ACI_EVT_CMD_RSP != aci_evt->evt_opcode)
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
CMP	R1, #132
IT	EQ
BEQ	L_do_aci_setup9
; aci_evt end address is: 0 (R0)
;aci_setup.c,141 :: 		return SETUP_FAIL_NOT_COMMAND_RESPONSE;
MOVS	R0, #5
IT	AL
BAL	L_end_do_aci_setup
;aci_setup.c,142 :: 		}
L_do_aci_setup9:
;aci_setup.c,144 :: 		cmd_status = (aci_status_code_t) aci_evt->params.cmd_rsp.cmd_status;
; aci_evt start address is: 0 (R0)
ADDS	R1, R0, #2
; aci_evt end address is: 0 (R0)
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
STRB	R1, [SP, #12]
;aci_setup.c,145 :: 		switch (cmd_status)
IT	AL
BAL	L_do_aci_setup10
;aci_setup.c,147 :: 		case ACI_STATUS_TRANSACTION_CONTINUE:
L_do_aci_setup12:
;aci_setup.c,149 :: 		i = 0;
MOVS	R1, #0
STR	R1, [SP, #8]
;aci_setup.c,154 :: 		aci_setup_fill(aci_stat, &setup_offset);
ADD	R1, SP, #4
LDR	R0, [SP, #20]
BL	aci_setup_aci_setup_fill+0
;aci_setup.c,155 :: 		break;
IT	AL
BAL	L_do_aci_setup11
;aci_setup.c,157 :: 		case ACI_STATUS_TRANSACTION_COMPLETE:
L_do_aci_setup13:
;aci_setup.c,159 :: 		break;
IT	AL
BAL	L_do_aci_setup11
;aci_setup.c,161 :: 		default:
L_do_aci_setup14:
;aci_setup.c,163 :: 		return SETUP_FAIL_NOT_SETUP_EVENT;
MOVS	R0, #4
IT	AL
BAL	L_end_do_aci_setup
;aci_setup.c,164 :: 		}
L_do_aci_setup10:
LDRB	R1, [SP, #12]
CMP	R1, #1
IT	EQ
BEQ	L_do_aci_setup12
LDRB	R1, [SP, #12]
CMP	R1, #2
IT	EQ
BEQ	L_do_aci_setup13
IT	AL
BAL	L_do_aci_setup14
L_do_aci_setup11:
;aci_setup.c,170 :: 		lib_aci_event_get (aci_stat, aci_data);
LDR	R1, [SP, #16]
LDR	R0, [SP, #20]
BL	_lib_aci_event_get+0
;aci_setup.c,171 :: 		}
L_do_aci_setup8:
;aci_setup.c,172 :: 		}
IT	AL
BAL	L_do_aci_setup5
L_do_aci_setup6:
;aci_setup.c,174 :: 		return SETUP_SUCCESS;
MOVS	R0, #0
;aci_setup.c,175 :: 		}
L_end_do_aci_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _do_aci_setup
