_acil_encode_cmd_set_test_mode:
;acilib.c,45 :: 		void acil_encode_cmd_set_test_mode(uint8_t *buffer, aci_cmd_params_test_t *p_aci_cmd_params_test)
; p_aci_cmd_params_test start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_test end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_test start address is: 4 (R1)
;acilib.c,47 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = 2;
MOVS	R2, #2
STRB	R2, [R0, #0]
;acilib.c,48 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_TEST;
ADDS	R3, R0, #1
MOVS	R2, #1
STRB	R2, [R3, #0]
;acilib.c,49 :: 		*(buffer + OFFSET_ACI_CMD_T_TEST + OFFSET_ACI_CMD_PARAMS_TEST_T_TEST_MODE_CHANGE) = p_aci_cmd_params_test->test_mode_change;
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
LDRB	R2, [R1, #0]
; p_aci_cmd_params_test end address is: 4 (R1)
STRB	R2, [R3, #0]
;acilib.c,50 :: 		}
L_end_acil_encode_cmd_set_test_mode:
BX	LR
; end of _acil_encode_cmd_set_test_mode
_acil_encode_cmd_sleep:
;acilib.c,52 :: 		void acil_encode_cmd_sleep(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,54 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = 1;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,55 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SLEEP;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #4
STRB	R1, [R2, #0]
;acilib.c,56 :: 		}
L_end_acil_encode_cmd_sleep:
BX	LR
; end of _acil_encode_cmd_sleep
_acil_encode_cmd_get_device_version:
;acilib.c,58 :: 		void acil_encode_cmd_get_device_version(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,60 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = 1;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,61 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_GET_DEVICE_VERSION;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #9
STRB	R1, [R2, #0]
;acilib.c,62 :: 		}
L_end_acil_encode_cmd_get_device_version:
BX	LR
; end of _acil_encode_cmd_get_device_version
_acil_encode_cmd_set_local_data:
;acilib.c,64 :: 		void acil_encode_cmd_set_local_data(uint8_t *buffer, aci_cmd_params_set_local_data_t *p_aci_cmd_params_set_local_data, uint8_t data_size)
; data_size start address is: 8 (R2)
; p_aci_cmd_params_set_local_data start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; data_size end address is: 8 (R2)
; p_aci_cmd_params_set_local_data end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_set_local_data start address is: 4 (R1)
; data_size start address is: 8 (R2)
;acilib.c,66 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_SET_LOCAL_DATA_BASE_LEN + data_size;
ADDS	R3, R2, #2
STRB	R3, [R0, #0]
;acilib.c,67 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SET_LOCAL_DATA;
ADDS	R4, R0, #1
MOVS	R3, #13
STRB	R3, [R4, #0]
;acilib.c,68 :: 		*(buffer + OFFSET_ACI_CMD_T_SET_LOCAL_DATA + OFFSET_ACI_CMD_PARAMS_SEND_DATA_T_TX_DATA + OFFSET_ACI_TX_DATA_T_PIPE_NUMBER) = p_aci_cmd_params_set_local_data->tx_data.pipe_number;
ADDS	R4, R0, #2
LDRB	R3, [R1, #0]
STRB	R3, [R4, #0]
;acilib.c,69 :: 		memcpy(buffer + OFFSET_ACI_CMD_T_SET_LOCAL_DATA + OFFSET_ACI_CMD_PARAMS_SEND_DATA_T_TX_DATA + OFFSET_ACI_TX_DATA_T_ACI_DATA,  &(p_aci_cmd_params_set_local_data->tx_data.aci_data[0]), data_size);
ADDS	R4, R1, #1
; p_aci_cmd_params_set_local_data end address is: 4 (R1)
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R3, #1
; data_size end address is: 8 (R2)
MOV	R1, R4
MOV	R0, R3
BL	_memcpy+0
;acilib.c,70 :: 		}
L_end_acil_encode_cmd_set_local_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_encode_cmd_set_local_data
_acil_encode_cmd_connect:
;acilib.c,72 :: 		void acil_encode_cmd_connect(uint8_t *buffer, aci_cmd_params_connect_t *p_aci_cmd_params_connect)
; p_aci_cmd_params_connect start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_connect end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_connect start address is: 4 (R1)
;acilib.c,74 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_CONNECT_LEN;
MOVS	R2, #5
STRB	R2, [R0, #0]
;acilib.c,75 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_CONNECT;
ADDS	R3, R0, #1
MOVS	R2, #15
STRB	R2, [R3, #0]
;acilib.c,76 :: 		*(buffer + OFFSET_ACI_CMD_T_CONNECT + OFFSET_ACI_CMD_PARAMS_CONNECT_T_TIMEOUT_MSB) = (uint8_t)(p_aci_cmd_params_connect->timeout >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #1
LDRH	R2, [R1, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,77 :: 		*(buffer + OFFSET_ACI_CMD_T_CONNECT + OFFSET_ACI_CMD_PARAMS_CONNECT_T_TIMEOUT_LSB) = (uint8_t)(p_aci_cmd_params_connect->timeout);
ADDS	R3, R0, #2
LDRH	R2, [R1, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,78 :: 		*(buffer + OFFSET_ACI_CMD_T_CONNECT + OFFSET_ACI_CMD_PARAMS_CONNECT_T_ADV_INTERVAL_MSB) = (uint8_t)(p_aci_cmd_params_connect->adv_interval >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #3
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,79 :: 		*(buffer + OFFSET_ACI_CMD_T_CONNECT + OFFSET_ACI_CMD_PARAMS_CONNECT_T_ADV_INTERVAL_LSB) = (uint8_t)(p_aci_cmd_params_connect->adv_interval);
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R2, #2
ADDS	R2, R1, #2
; p_aci_cmd_params_connect end address is: 4 (R1)
LDRH	R2, [R2, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,80 :: 		}
L_end_acil_encode_cmd_connect:
BX	LR
; end of _acil_encode_cmd_connect
_acil_encode_cmd_bond:
;acilib.c,82 :: 		void acil_encode_cmd_bond(uint8_t *buffer, aci_cmd_params_bond_t *p_aci_cmd_params_bond)
; p_aci_cmd_params_bond start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_bond end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_bond start address is: 4 (R1)
;acilib.c,84 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_BOND_LEN;
MOVS	R2, #5
STRB	R2, [R0, #0]
;acilib.c,85 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_BOND;
ADDS	R3, R0, #1
MOVS	R2, #16
STRB	R2, [R3, #0]
;acilib.c,86 :: 		*(buffer + OFFSET_ACI_CMD_T_BOND + OFFSET_ACI_CMD_PARAMS_BOND_T_TIMEOUT_MSB) = (uint8_t)(p_aci_cmd_params_bond->timeout >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #1
LDRH	R2, [R1, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,87 :: 		*(buffer + OFFSET_ACI_CMD_T_BOND + OFFSET_ACI_CMD_PARAMS_BOND_T_TIMEOUT_LSB) = (uint8_t)(p_aci_cmd_params_bond->timeout);
ADDS	R3, R0, #2
LDRH	R2, [R1, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,88 :: 		*(buffer + OFFSET_ACI_CMD_T_BOND + OFFSET_ACI_CMD_PARAMS_BOND_T_ADV_INTERVAL_MSB) = (uint8_t)(p_aci_cmd_params_bond->adv_interval >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #3
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,89 :: 		*(buffer + OFFSET_ACI_CMD_T_BOND + OFFSET_ACI_CMD_PARAMS_BOND_T_ADV_INTERVAL_LSB) = (uint8_t)(p_aci_cmd_params_bond->adv_interval);
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R2, #2
ADDS	R2, R1, #2
; p_aci_cmd_params_bond end address is: 4 (R1)
LDRH	R2, [R2, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,90 :: 		}
L_end_acil_encode_cmd_bond:
BX	LR
; end of _acil_encode_cmd_bond
_acil_encode_cmd_disconnect:
;acilib.c,92 :: 		void acil_encode_cmd_disconnect(uint8_t *buffer, aci_cmd_params_disconnect_t *p_aci_cmd_params_disconnect)
; p_aci_cmd_params_disconnect start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_disconnect end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_disconnect start address is: 4 (R1)
;acilib.c,94 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_DISCONNECT_LEN;
MOVS	R2, #2
STRB	R2, [R0, #0]
;acilib.c,95 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_DISCONNECT;
ADDS	R3, R0, #1
MOVS	R2, #17
STRB	R2, [R3, #0]
;acilib.c,96 :: 		*(buffer + OFFSET_ACI_CMD_T_DISCONNECT + OFFSET_ACI_CMD_PARAMS_DISCONNECT_T_REASON) = (uint8_t)(p_aci_cmd_params_disconnect->reason);
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
LDRB	R2, [R1, #0]
; p_aci_cmd_params_disconnect end address is: 4 (R1)
STRB	R2, [R3, #0]
;acilib.c,97 :: 		}
L_end_acil_encode_cmd_disconnect:
BX	LR
; end of _acil_encode_cmd_disconnect
_acil_encode_baseband_reset:
;acilib.c,99 :: 		void acil_encode_baseband_reset(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,101 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_BASEBAND_RESET_LEN;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,102 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_RADIO_RESET;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #14
STRB	R1, [R2, #0]
;acilib.c,103 :: 		}
L_end_acil_encode_baseband_reset:
BX	LR
; end of _acil_encode_baseband_reset
_acil_encode_direct_connect:
;acilib.c,105 :: 		void acil_encode_direct_connect(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,107 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_DIRECT_CONNECT_LEN;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,108 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_CONNECT_DIRECT;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #30
STRB	R1, [R2, #0]
;acilib.c,109 :: 		}
L_end_acil_encode_direct_connect:
BX	LR
; end of _acil_encode_direct_connect
_acil_encode_cmd_wakeup:
;acilib.c,111 :: 		void acil_encode_cmd_wakeup(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,113 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_WAKEUP_LEN;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,114 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_WAKEUP;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #5
STRB	R1, [R2, #0]
;acilib.c,115 :: 		}
L_end_acil_encode_cmd_wakeup:
BX	LR
; end of _acil_encode_cmd_wakeup
_acil_encode_cmd_set_radio_tx_power:
;acilib.c,117 :: 		void acil_encode_cmd_set_radio_tx_power(uint8_t *buffer, aci_cmd_params_set_tx_power_t *p_aci_cmd_params_set_tx_power)
; p_aci_cmd_params_set_tx_power start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_set_tx_power end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_set_tx_power start address is: 4 (R1)
;acilib.c,119 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_SET_RADIO_TX_POWER_LEN;
MOVS	R2, #2
STRB	R2, [R0, #0]
;acilib.c,120 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SET_TX_POWER;
ADDS	R3, R0, #1
MOVS	R2, #18
STRB	R2, [R3, #0]
;acilib.c,121 :: 		*(buffer + OFFSET_ACI_CMD_T_SET_TX_POWER + OFFSET_ACI_CMD_PARAMS_SET_TX_POWER_T_DEVICE_POWER) = (uint8_t)p_aci_cmd_params_set_tx_power->device_power;
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
LDRB	R2, [R1, #0]
; p_aci_cmd_params_set_tx_power end address is: 4 (R1)
STRB	R2, [R3, #0]
;acilib.c,122 :: 		}
L_end_acil_encode_cmd_set_radio_tx_power:
BX	LR
; end of _acil_encode_cmd_set_radio_tx_power
_acil_encode_cmd_get_address:
;acilib.c,124 :: 		void acil_encode_cmd_get_address(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,126 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_GET_DEVICE_ADDR_LEN;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,127 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_GET_DEVICE_ADDRESS;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #10
STRB	R1, [R2, #0]
;acilib.c,128 :: 		}
L_end_acil_encode_cmd_get_address:
BX	LR
; end of _acil_encode_cmd_get_address
_acil_encode_cmd_send_data:
;acilib.c,130 :: 		void acil_encode_cmd_send_data(uint8_t *buffer, aci_cmd_params_send_data_t *p_aci_cmd_params_send_data_t, uint8_t data_size)
; data_size start address is: 8 (R2)
; p_aci_cmd_params_send_data_t start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; data_size end address is: 8 (R2)
; p_aci_cmd_params_send_data_t end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_send_data_t start address is: 4 (R1)
; data_size start address is: 8 (R2)
;acilib.c,132 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_SEND_DATA_BASE_LEN + data_size;
ADDS	R3, R2, #2
STRB	R3, [R0, #0]
;acilib.c,133 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SEND_DATA;
ADDS	R4, R0, #1
MOVS	R3, #21
STRB	R3, [R4, #0]
;acilib.c,134 :: 		*(buffer + OFFSET_ACI_CMD_T_SEND_DATA + OFFSET_ACI_CMD_PARAMS_SEND_DATA_T_TX_DATA + OFFSET_ACI_TX_DATA_T_PIPE_NUMBER) = p_aci_cmd_params_send_data_t->tx_data.pipe_number;
ADDS	R4, R0, #2
LDRB	R3, [R1, #0]
STRB	R3, [R4, #0]
;acilib.c,135 :: 		memcpy((buffer + OFFSET_ACI_CMD_T_SEND_DATA + OFFSET_ACI_CMD_PARAMS_SEND_DATA_T_TX_DATA + OFFSET_ACI_TX_DATA_T_ACI_DATA), &(p_aci_cmd_params_send_data_t->tx_data.aci_data[0]), data_size);
ADDS	R4, R1, #1
; p_aci_cmd_params_send_data_t end address is: 4 (R1)
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R3, #1
; data_size end address is: 8 (R2)
MOV	R1, R4
MOV	R0, R3
BL	_memcpy+0
;acilib.c,136 :: 		}
L_end_acil_encode_cmd_send_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_encode_cmd_send_data
_acil_encode_cmd_request_data:
;acilib.c,138 :: 		void acil_encode_cmd_request_data(uint8_t *buffer, aci_cmd_params_request_data_t *p_aci_cmd_params_request_data)
; p_aci_cmd_params_request_data start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_request_data end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_request_data start address is: 4 (R1)
;acilib.c,140 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_DATA_REQUEST_LEN;
MOVS	R2, #2
STRB	R2, [R0, #0]
;acilib.c,141 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_REQUEST_DATA;
ADDS	R3, R0, #1
MOVS	R2, #23
STRB	R2, [R3, #0]
;acilib.c,142 :: 		*(buffer + OFFSET_ACI_CMD_T_REQUEST_DATA + OFFSET_ACI_CMD_PARAMS_REQUEST_DATA_T_PIPE_NUMBER) = p_aci_cmd_params_request_data->pipe_number;
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
LDRB	R2, [R1, #0]
; p_aci_cmd_params_request_data end address is: 4 (R1)
STRB	R2, [R3, #0]
;acilib.c,143 :: 		}
L_end_acil_encode_cmd_request_data:
BX	LR
; end of _acil_encode_cmd_request_data
_acil_encode_cmd_open_remote_pipe:
;acilib.c,145 :: 		void acil_encode_cmd_open_remote_pipe(uint8_t *buffer, aci_cmd_params_open_remote_pipe_t *p_aci_cmd_params_open_remote_pipe)
; p_aci_cmd_params_open_remote_pipe start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_open_remote_pipe end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_open_remote_pipe start address is: 4 (R1)
;acilib.c,147 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_OPEN_REMOTE_PIPE_LEN;
MOVS	R2, #2
STRB	R2, [R0, #0]
;acilib.c,148 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_OPEN_REMOTE_PIPE;
ADDS	R3, R0, #1
MOVS	R2, #20
STRB	R2, [R3, #0]
;acilib.c,149 :: 		*(buffer + OFFSET_ACI_CMD_T_OPEN_REMOTE_PIPE + OFFSET_ACI_CMD_PARAMS_OPEN_REMOTE_PIPE_T_PIPE_NUMBER) = p_aci_cmd_params_open_remote_pipe->pipe_number;
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
LDRB	R2, [R1, #0]
; p_aci_cmd_params_open_remote_pipe end address is: 4 (R1)
STRB	R2, [R3, #0]
;acilib.c,150 :: 		}
L_end_acil_encode_cmd_open_remote_pipe:
BX	LR
; end of _acil_encode_cmd_open_remote_pipe
_acil_encode_cmd_close_remote_pipe:
;acilib.c,152 :: 		void acil_encode_cmd_close_remote_pipe(uint8_t *buffer, aci_cmd_params_close_remote_pipe_t *p_aci_cmd_params_close_remote_pipe)
; p_aci_cmd_params_close_remote_pipe start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_close_remote_pipe end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_close_remote_pipe start address is: 4 (R1)
;acilib.c,154 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_CLOSE_REMOTE_PIPE_LEN;
MOVS	R2, #2
STRB	R2, [R0, #0]
;acilib.c,155 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_CLOSE_REMOTE_PIPE;
ADDS	R3, R0, #1
MOVS	R2, #31
STRB	R2, [R3, #0]
;acilib.c,156 :: 		*(buffer + OFFSET_ACI_CMD_T_CLOSE_REMOTE_PIPE + OFFSET_ACI_CMD_PARAMS_CLOSE_REMOTE_PIPE_T_PIPE_NUMBER) = p_aci_cmd_params_close_remote_pipe->pipe_number;
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
LDRB	R2, [R1, #0]
; p_aci_cmd_params_close_remote_pipe end address is: 4 (R1)
STRB	R2, [R3, #0]
;acilib.c,157 :: 		}
L_end_acil_encode_cmd_close_remote_pipe:
BX	LR
; end of _acil_encode_cmd_close_remote_pipe
_acil_encode_cmd_echo_msg:
;acilib.c,159 :: 		void acil_encode_cmd_echo_msg(uint8_t *buffer, aci_cmd_params_echo_t *p_cmd_params_echo, uint8_t msg_size)
; msg_size start address is: 8 (R2)
; p_cmd_params_echo start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; msg_size end address is: 8 (R2)
; p_cmd_params_echo end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_cmd_params_echo start address is: 4 (R1)
; msg_size start address is: 8 (R2)
;acilib.c,161 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_ECHO_MSG_CMD_BASE_LEN + msg_size;
ADDS	R3, R2, #1
STRB	R3, [R0, #0]
;acilib.c,162 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_ECHO;
ADDS	R4, R0, #1
MOVS	R3, #2
STRB	R3, [R4, #0]
;acilib.c,163 :: 		memcpy((buffer + OFFSET_ACI_CMD_T_ECHO + OFFSET_ACI_CMD_PARAMS_ECHO_T_ECHO_DATA), &(p_cmd_params_echo->echo_data[0]), msg_size);
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
; msg_size end address is: 8 (R2)
; p_cmd_params_echo end address is: 4 (R1)
MOV	R0, R3
BL	_memcpy+0
;acilib.c,164 :: 		}
L_end_acil_encode_cmd_echo_msg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_encode_cmd_echo_msg
_acil_encode_cmd_battery_level:
;acilib.c,166 :: 		void acil_encode_cmd_battery_level(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,168 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = 1;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,169 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_GET_BATTERY_LEVEL;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #11
STRB	R1, [R2, #0]
;acilib.c,170 :: 		}
L_end_acil_encode_cmd_battery_level:
BX	LR
; end of _acil_encode_cmd_battery_level
_acil_encode_cmd_temparature:
;acilib.c,172 :: 		void acil_encode_cmd_temparature(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,174 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = 1;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,175 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_GET_TEMPERATURE;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #12
STRB	R1, [R2, #0]
;acilib.c,176 :: 		}
L_end_acil_encode_cmd_temparature:
BX	LR
; end of _acil_encode_cmd_temparature
_acil_encode_cmd_read_dynamic_data:
;acilib.c,178 :: 		void acil_encode_cmd_read_dynamic_data(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,180 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = 1;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,181 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_READ_DYNAMIC_DATA;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #7
STRB	R1, [R2, #0]
;acilib.c,182 :: 		}
L_end_acil_encode_cmd_read_dynamic_data:
BX	LR
; end of _acil_encode_cmd_read_dynamic_data
_acil_encode_cmd_write_dynamic_data:
;acilib.c,184 :: 		void acil_encode_cmd_write_dynamic_data(uint8_t *buffer, uint8_t seq_no, uint8_t* dynamic_data, uint8_t dynamic_data_size)
; dynamic_data_size start address is: 12 (R3)
; dynamic_data start address is: 8 (R2)
; seq_no start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dynamic_data_size end address is: 12 (R3)
; dynamic_data end address is: 8 (R2)
; seq_no end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; seq_no start address is: 4 (R1)
; dynamic_data start address is: 8 (R2)
; dynamic_data_size start address is: 12 (R3)
;acilib.c,186 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_WRITE_DYNAMIC_DATA_BASE_LEN + dynamic_data_size;
ADDS	R4, R3, #2
STRB	R4, [R0, #0]
;acilib.c,187 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_WRITE_DYNAMIC_DATA;
ADDS	R5, R0, #1
MOVS	R4, #8
STRB	R4, [R5, #0]
;acilib.c,188 :: 		*(buffer + OFFSET_ACI_CMD_T_WRITE_DYNAMIC_DATA + OFFSET_ACI_CMD_PARAMS_WRITE_DYNAMIC_DATA_T_SEQ_NO) = seq_no;
ADDS	R4, R0, #2
STRB	R1, [R4, #0]
; seq_no end address is: 4 (R1)
;acilib.c,189 :: 		memcpy((buffer + OFFSET_ACI_CMD_T_WRITE_DYNAMIC_DATA + OFFSET_ACI_CMD_PARAMS_WRITE_DYNAMIC_DATA_T_DYNAMIC_DATA), dynamic_data, dynamic_data_size);
ADDS	R4, R0, #2
; buffer end address is: 0 (R0)
ADDS	R4, R4, #1
MOV	R1, R2
; dynamic_data_size end address is: 12 (R3)
UXTB	R2, R3
; dynamic_data end address is: 8 (R2)
MOV	R0, R4
BL	_memcpy+0
;acilib.c,190 :: 		}
L_end_acil_encode_cmd_write_dynamic_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_encode_cmd_write_dynamic_data
_acil_encode_cmd_change_timing_req:
;acilib.c,192 :: 		void acil_encode_cmd_change_timing_req(uint8_t *buffer, aci_cmd_params_change_timing_t *p_aci_cmd_params_change_timing)
; p_aci_cmd_params_change_timing start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_change_timing end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_change_timing start address is: 4 (R1)
;acilib.c,194 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_CHANGE_TIMING_LEN;
MOVS	R2, #9
STRB	R2, [R0, #0]
;acilib.c,195 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_CHANGE_TIMING;
ADDS	R3, R0, #1
MOVS	R2, #19
STRB	R2, [R3, #0]
;acilib.c,196 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_MIN_CONN_INTERVAL_MSB) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.min_conn_interval >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #1
LDRH	R2, [R1, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,197 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_MIN_CONN_INTERVAL_LSB) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.min_conn_interval);
ADDS	R3, R0, #2
LDRH	R2, [R1, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,198 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_MAX_CONN_INTERVAL_MSB) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.max_conn_interval >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #3
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,199 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_MAX_CONN_INTERVAL_LSB) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.max_conn_interval);
ADDS	R2, R0, #2
ADDS	R3, R2, #2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,200 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_SLAVE_LATENCY_MSB    ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.slave_latency >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #5
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,201 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_SLAVE_LATENCY_LSB    ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.slave_latency);
ADDS	R2, R0, #2
ADDS	R3, R2, #4
ADDS	R2, R1, #4
LDRH	R2, [R2, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,202 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_TIMEOUT_MULT_MSB     ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.timeout_mult >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #7
ADDS	R2, R1, #6
LDRH	R2, [R2, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,203 :: 		*(buffer + OFFSET_ACI_CMD_T_CHANGE_TIMING + OFFSET_ACI_CMD_PARAMS_CHANGE_TIMING_T_CONN_PARAMS + OFFSET_ACI_LL_CONN_PARAMS_T_TIMEOUT_MULT_LSB     ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.timeout_mult);
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R2, #6
ADDS	R2, R1, #6
; p_aci_cmd_params_change_timing end address is: 4 (R1)
LDRH	R2, [R2, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,204 :: 		}
L_end_acil_encode_cmd_change_timing_req:
BX	LR
; end of _acil_encode_cmd_change_timing_req
_acil_encode_cmd_set_app_latency:
;acilib.c,206 :: 		void acil_encode_cmd_set_app_latency(uint8_t *buffer, aci_cmd_params_set_app_latency_t *p_aci_cmd_params_set_app_latency)
; p_aci_cmd_params_set_app_latency start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_set_app_latency end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_set_app_latency start address is: 4 (R1)
;acilib.c,208 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_SET_APP_LATENCY_LEN;
MOVS	R2, #4
STRB	R2, [R0, #0]
;acilib.c,209 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SET_APP_LATENCY;
ADDS	R3, R0, #1
MOVS	R2, #25
STRB	R2, [R3, #0]
;acilib.c,210 :: 		*(buffer + OFFSET_ACI_CMD_T_SET_APP_LATENCY + OFFSET_ACI_CMD_PARAMS_SET_APP_LATENCY_T_MODE) = (uint8_t)( p_aci_cmd_params_set_app_latency->mode);
ADDS	R3, R0, #2
LDRB	R2, [R1, #0]
STRB	R2, [R3, #0]
;acilib.c,211 :: 		*(buffer + OFFSET_ACI_CMD_T_SET_APP_LATENCY + OFFSET_ACI_CMD_PARAMS_SET_APP_LATENCY_T_LATENCY_MSB) = (uint8_t)( p_aci_cmd_params_set_app_latency->latency>>8);
ADDS	R2, R0, #2
ADDS	R3, R2, #2
ADDS	R2, R1, #1
LDRH	R2, [R2, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,212 :: 		*(buffer + OFFSET_ACI_CMD_T_SET_APP_LATENCY + OFFSET_ACI_CMD_PARAMS_SET_APP_LATENCY_T_LATENCY_LSB) = (uint8_t)( p_aci_cmd_params_set_app_latency->latency);
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R2, #1
ADDS	R2, R1, #1
; p_aci_cmd_params_set_app_latency end address is: 4 (R1)
LDRH	R2, [R2, #0]
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,213 :: 		}
L_end_acil_encode_cmd_set_app_latency:
BX	LR
; end of _acil_encode_cmd_set_app_latency
_acil_encode_cmd_change_timing_req_GAP_PPCP:
;acilib.c,215 :: 		void acil_encode_cmd_change_timing_req_GAP_PPCP(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,217 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_CHANGE_TIMING_LEN_GAP_PPCP;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,218 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_CHANGE_TIMING;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #19
STRB	R1, [R2, #0]
;acilib.c,219 :: 		}
L_end_acil_encode_cmd_change_timing_req_GAP_PPCP:
BX	LR
; end of _acil_encode_cmd_change_timing_req_GAP_PPCP
_acil_encode_cmd_setup:
;acilib.c,222 :: 		void acil_encode_cmd_setup(uint8_t *buffer, aci_cmd_params_setup_t *p_aci_cmd_params_setup, uint8_t setup_data_size)
; setup_data_size start address is: 8 (R2)
; p_aci_cmd_params_setup start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; setup_data_size end address is: 8 (R2)
; p_aci_cmd_params_setup end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_setup start address is: 4 (R1)
; setup_data_size start address is: 8 (R2)
;acilib.c,224 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = setup_data_size + MSG_SETUP_CMD_BASE_LEN;
ADDS	R3, R2, #1
STRB	R3, [R0, #0]
;acilib.c,225 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SETUP;
ADDS	R4, R0, #1
MOVS	R3, #6
STRB	R3, [R4, #0]
;acilib.c,226 :: 		memcpy((buffer + OFFSET_ACI_CMD_T_SETUP), &(p_aci_cmd_params_setup->setup_data[0]), setup_data_size);
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
; setup_data_size end address is: 8 (R2)
; p_aci_cmd_params_setup end address is: 4 (R1)
MOV	R0, R3
BL	_memcpy+0
;acilib.c,227 :: 		}
L_end_acil_encode_cmd_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_encode_cmd_setup
_acil_encode_cmd_dtm_cmd:
;acilib.c,229 :: 		void acil_encode_cmd_dtm_cmd(uint8_t *buffer, aci_cmd_params_dtm_cmd_t *p_aci_cmd_params_dtm_cmd)
; p_aci_cmd_params_dtm_cmd start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_dtm_cmd end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_dtm_cmd start address is: 4 (R1)
;acilib.c,231 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_DTM_CMD;
MOVS	R2, #3
STRB	R2, [R0, #0]
;acilib.c,232 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_DTM_CMD;
ADDS	R3, R0, #1
MOVS	R2, #3
STRB	R2, [R3, #0]
;acilib.c,233 :: 		*(buffer + OFFSET_ACI_CMD_T_DTM_CMD) = p_aci_cmd_params_dtm_cmd->cmd_msb;
ADDS	R3, R0, #2
LDRB	R2, [R1, #0]
STRB	R2, [R3, #0]
;acilib.c,234 :: 		*(buffer + OFFSET_ACI_CMD_T_DTM_CMD + 1) = p_aci_cmd_params_dtm_cmd->cmd_lsb;
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R2, #1
ADDS	R2, R1, #1
; p_aci_cmd_params_dtm_cmd end address is: 4 (R1)
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,235 :: 		}
L_end_acil_encode_cmd_dtm_cmd:
BX	LR
; end of _acil_encode_cmd_dtm_cmd
_acil_encode_cmd_send_data_ack:
;acilib.c,237 :: 		void acil_encode_cmd_send_data_ack(uint8_t *buffer, const uint8_t pipe_number )
; pipe_number start address is: 4 (R1)
; buffer start address is: 0 (R0)
; pipe_number end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; pipe_number start address is: 4 (R1)
;acilib.c,239 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_ACK_LEN;
MOVS	R2, #2
STRB	R2, [R0, #0]
;acilib.c,240 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SEND_DATA_ACK;
ADDS	R3, R0, #1
MOVS	R2, #22
STRB	R2, [R3, #0]
;acilib.c,241 :: 		*(buffer + OFFSET_ACI_CMD_T_SEND_DATA_ACK + OFFSET_ACI_CMD_PARAMS_SEND_DATA_ACK_T_PIPE_NUMBER) = pipe_number;
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
STRB	R1, [R2, #0]
; pipe_number end address is: 4 (R1)
;acilib.c,242 :: 		}
L_end_acil_encode_cmd_send_data_ack:
BX	LR
; end of _acil_encode_cmd_send_data_ack
_acil_encode_cmd_send_data_nack:
;acilib.c,244 :: 		void acil_encode_cmd_send_data_nack(uint8_t *buffer, const uint8_t pipe_number, const uint8_t err_code )
; err_code start address is: 8 (R2)
; pipe_number start address is: 4 (R1)
; buffer start address is: 0 (R0)
; err_code end address is: 8 (R2)
; pipe_number end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; pipe_number start address is: 4 (R1)
; err_code start address is: 8 (R2)
;acilib.c,246 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_NACK_LEN;
MOVS	R3, #3
STRB	R3, [R0, #0]
;acilib.c,247 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SEND_DATA_NACK;
ADDS	R4, R0, #1
MOVS	R3, #24
STRB	R3, [R4, #0]
;acilib.c,248 :: 		*(buffer + OFFSET_ACI_CMD_T_SEND_DATA_NACK + OFFSET_ACI_CMD_PARAMS_SEND_DATA_NACK_T_PIPE_NUMBER) = pipe_number;
ADDS	R3, R0, #2
STRB	R1, [R3, #0]
; pipe_number end address is: 4 (R1)
;acilib.c,249 :: 		*(buffer + OFFSET_ACI_CMD_T_SEND_DATA_NACK + OFFSET_ACI_CMD_PARAMS_SEND_DATA_NACK_T_ERROR_CODE) = err_code;
ADDS	R3, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R3, #1
STRB	R2, [R3, #0]
; err_code end address is: 8 (R2)
;acilib.c,250 :: 		}
L_end_acil_encode_cmd_send_data_nack:
BX	LR
; end of _acil_encode_cmd_send_data_nack
_acil_encode_cmd_bond_security_request:
;acilib.c,252 :: 		void acil_encode_cmd_bond_security_request(uint8_t *buffer)
; buffer start address is: 0 (R0)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;acilib.c,254 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = 1;
MOVS	R1, #1
STRB	R1, [R0, #0]
;acilib.c,255 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_BOND_SECURITY_REQUEST;
ADDS	R2, R0, #1
; buffer end address is: 0 (R0)
MOVS	R1, #29
STRB	R1, [R2, #0]
;acilib.c,256 :: 		}
L_end_acil_encode_cmd_bond_security_request:
BX	LR
; end of _acil_encode_cmd_bond_security_request
_acil_encode_cmd_broadcast:
;acilib.c,258 :: 		void acil_encode_cmd_broadcast(uint8_t *buffer, aci_cmd_params_broadcast_t * p_aci_cmd_params_broadcast)
; p_aci_cmd_params_broadcast start address is: 4 (R1)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_broadcast end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_broadcast start address is: 4 (R1)
;acilib.c,260 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_BROADCAST_LEN;
MOVS	R2, #5
STRB	R2, [R0, #0]
;acilib.c,261 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_BROADCAST;
ADDS	R3, R0, #1
MOVS	R2, #28
STRB	R2, [R3, #0]
;acilib.c,262 :: 		*(buffer + OFFSET_ACI_CMD_T_BROADCAST + OFFSET_ACI_CMD_PARAMS_BROADCAST_T_TIMEOUT_LSB) = (p_aci_cmd_params_broadcast->timeout & 0xff);
ADDS	R3, R0, #2
LDRH	R2, [R1, #0]
AND	R2, R2, #255
STRB	R2, [R3, #0]
;acilib.c,263 :: 		*(buffer + OFFSET_ACI_CMD_T_BROADCAST + OFFSET_ACI_CMD_PARAMS_BROADCAST_T_TIMEOUT_MSB) = (uint8_t)(p_aci_cmd_params_broadcast->timeout >> 8);
ADDS	R2, R0, #2
ADDS	R3, R2, #1
LDRH	R2, [R1, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,264 :: 		*(buffer + OFFSET_ACI_CMD_T_BROADCAST + OFFSET_ACI_CMD_PARAMS_BROADCAST_T_ADV_INTERVAL_LSB) = (p_aci_cmd_params_broadcast->adv_interval & 0xff);
ADDS	R2, R0, #2
ADDS	R3, R2, #2
ADDS	R2, R1, #2
LDRH	R2, [R2, #0]
AND	R2, R2, #255
STRB	R2, [R3, #0]
;acilib.c,265 :: 		*(buffer + OFFSET_ACI_CMD_T_BROADCAST + OFFSET_ACI_CMD_PARAMS_BROADCAST_T_ADV_INTERVAL_MSB) = (uint8_t)(p_aci_cmd_params_broadcast->adv_interval >> 8);
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
ADDS	R3, R2, #3
ADDS	R2, R1, #2
; p_aci_cmd_params_broadcast end address is: 4 (R1)
LDRH	R2, [R2, #0]
LSRS	R2, R2, #8
UXTB	R2, R2
STRB	R2, [R3, #0]
;acilib.c,266 :: 		}
L_end_acil_encode_cmd_broadcast:
BX	LR
; end of _acil_encode_cmd_broadcast
_acil_encode_cmd_open_adv_pipes:
;acilib.c,268 :: 		void acil_encode_cmd_open_adv_pipes(uint8_t *buffer, aci_cmd_params_open_adv_pipe_t * p_aci_cmd_params_open_adv_pipe)
; p_aci_cmd_params_open_adv_pipe start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; p_aci_cmd_params_open_adv_pipe end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_open_adv_pipe start address is: 4 (R1)
;acilib.c,270 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = MSG_OPEN_ADV_PIPES_LEN;
MOVS	R2, #9
STRB	R2, [R0, #0]
;acilib.c,271 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_OPEN_ADV_PIPE;
ADDS	R3, R0, #1
MOVS	R2, #27
STRB	R2, [R3, #0]
;acilib.c,272 :: 		memcpy(buffer + OFFSET_ACI_CMD_T_OPEN_ADV_PIPE + OFFSET_ACI_CMD_PARAMS_OPEN_ADV_PIPE_T_PIPES, p_aci_cmd_params_open_adv_pipe->pipes, 8);
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
MOV	R0, R2
; p_aci_cmd_params_open_adv_pipe end address is: 4 (R1)
MOVS	R2, #8
SXTH	R2, R2
BL	_memcpy+0
;acilib.c,273 :: 		}
L_end_acil_encode_cmd_open_adv_pipes:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_encode_cmd_open_adv_pipes
_acil_encode_cmd_set_key:
;acilib.c,276 :: 		void acil_encode_cmd_set_key(uint8_t *buffer, aci_cmd_params_set_key_t *p_aci_cmd_params_set_key)
; p_aci_cmd_params_set_key start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; p_aci_cmd_params_set_key end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; p_aci_cmd_params_set_key start address is: 4 (R1)
;acilib.c,285 :: 		switch (p_aci_cmd_params_set_key->key_type)
MOV	R3, R1
IT	AL
BAL	L_acil_encode_cmd_set_key0
;acilib.c,287 :: 		case ACI_KEY_TYPE_INVALID:
L_acil_encode_cmd_set_key2:
;acilib.c,288 :: 		len = MSG_SET_KEY_REJECT_LEN;
; len start address is: 20 (R5)
MOVS	R5, #2
;acilib.c,289 :: 		break;
; len end address is: 20 (R5)
IT	AL
BAL	L_acil_encode_cmd_set_key1
;acilib.c,290 :: 		case ACI_KEY_TYPE_PASSKEY:
L_acil_encode_cmd_set_key3:
;acilib.c,291 :: 		len = MSG_SET_KEY_PASSKEY_LEN;
; len start address is: 20 (R5)
MOVS	R5, #8
;acilib.c,292 :: 		break;
; len end address is: 20 (R5)
IT	AL
BAL	L_acil_encode_cmd_set_key1
;acilib.c,293 :: 		default:
L_acil_encode_cmd_set_key4:
;acilib.c,294 :: 		len=0;
; len start address is: 20 (R5)
MOVS	R5, #0
;acilib.c,295 :: 		break;
; len end address is: 20 (R5)
IT	AL
BAL	L_acil_encode_cmd_set_key1
;acilib.c,296 :: 		}
L_acil_encode_cmd_set_key0:
LDRB	R2, [R3, #0]
CMP	R2, #0
IT	EQ
BEQ	L_acil_encode_cmd_set_key2
LDRB	R2, [R3, #0]
CMP	R2, #1
IT	EQ
BEQ	L_acil_encode_cmd_set_key3
IT	AL
BAL	L_acil_encode_cmd_set_key4
L_acil_encode_cmd_set_key1:
;acilib.c,297 :: 		*(buffer + OFFSET_ACI_CMD_T_LEN) = len;
; len start address is: 20 (R5)
STRB	R5, [R0, #0]
;acilib.c,298 :: 		*(buffer + OFFSET_ACI_CMD_T_CMD_OPCODE) = ACI_CMD_SET_KEY;
ADDS	R3, R0, #1
MOVS	R2, #26
STRB	R2, [R3, #0]
;acilib.c,299 :: 		*(buffer + OFFSET_ACI_CMD_T_SET_KEY + OFFSET_ACI_CMD_PARAMS_SET_KEY_T_KEY_TYPE) = p_aci_cmd_params_set_key->key_type;
ADDS	R3, R0, #2
LDRB	R2, [R1, #0]
STRB	R2, [R3, #0]
;acilib.c,300 :: 		memcpy((buffer + OFFSET_ACI_CMD_T_SET_KEY + OFFSET_ACI_CMD_PARAMS_SET_KEY_T_PASSKEY), (uint8_t * )&(p_aci_cmd_params_set_key->key), len-2);//Reducing 2 for the opcode byte and type
SUBS	R4, R5, #2
; len end address is: 20 (R5)
ADDS	R3, R1, #1
; p_aci_cmd_params_set_key end address is: 4 (R1)
ADDS	R2, R0, #2
; buffer end address is: 0 (R0)
ADDS	R2, R2, #1
MOV	R1, R3
MOV	R0, R2
SXTH	R2, R4
BL	_memcpy+0
;acilib.c,301 :: 		}
L_end_acil_encode_cmd_set_key:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_encode_cmd_set_key
_acil_encode_cmd:
;acilib.c,303 :: 		bool acil_encode_cmd(uint8_t *buffer, aci_cmd_t *p_aci_cmd)
; p_aci_cmd start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R6, R0
MOV	R7, R1
; p_aci_cmd end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 24 (R6)
; p_aci_cmd start address is: 28 (R7)
;acilib.c,305 :: 		bool ret_val = false;
; ret_val start address is: 32 (R8)
MOVW	R8, #0
;acilib.c,307 :: 		switch(p_aci_cmd->cmd_opcode)
ADDS	R2, R7, #1
STR	R2, [SP, #4]
IT	AL
BAL	L_acil_encode_cmd5
;acilib.c,309 :: 		case ACI_CMD_TEST:
L_acil_encode_cmd7:
;acilib.c,310 :: 		acil_encode_cmd_set_test_mode(buffer, &(p_aci_cmd->params.test));
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_set_test_mode+0
;acilib.c,311 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,312 :: 		case ACI_CMD_SLEEP:
L_acil_encode_cmd8:
;acilib.c,313 :: 		acil_encode_cmd_sleep(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_sleep+0
;acilib.c,314 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,315 :: 		case ACI_CMD_GET_DEVICE_VERSION:
L_acil_encode_cmd9:
;acilib.c,316 :: 		acil_encode_cmd_get_device_version(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_get_device_version+0
;acilib.c,317 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,318 :: 		case ACI_CMD_WAKEUP:
L_acil_encode_cmd10:
;acilib.c,319 :: 		acil_encode_cmd_wakeup(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_wakeup+0
;acilib.c,320 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,321 :: 		case ACI_CMD_ECHO:
L_acil_encode_cmd11:
;acilib.c,322 :: 		acil_encode_cmd_echo_msg(buffer, &(p_aci_cmd->params.echo), (p_aci_cmd->len - MSG_ECHO_MSG_CMD_BASE_LEN));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
LDRB	R2, [R7, #0]
SUBS	R3, R2, #1
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
UXTB	R2, R3
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_echo_msg+0
;acilib.c,323 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,324 :: 		case ACI_CMD_GET_BATTERY_LEVEL:
L_acil_encode_cmd12:
;acilib.c,325 :: 		acil_encode_cmd_battery_level(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_battery_level+0
;acilib.c,326 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,327 :: 		case ACI_CMD_GET_TEMPERATURE:
L_acil_encode_cmd13:
;acilib.c,328 :: 		acil_encode_cmd_temparature(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_temparature+0
;acilib.c,329 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,330 :: 		case ACI_CMD_GET_DEVICE_ADDRESS:
L_acil_encode_cmd14:
;acilib.c,331 :: 		acil_encode_cmd_get_address(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_get_address+0
;acilib.c,332 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,333 :: 		case ACI_CMD_SET_TX_POWER:
L_acil_encode_cmd15:
;acilib.c,334 :: 		acil_encode_cmd_set_radio_tx_power(buffer, &(p_aci_cmd->params.set_tx_power));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_set_radio_tx_power+0
;acilib.c,335 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,336 :: 		case ACI_CMD_CONNECT:
L_acil_encode_cmd16:
;acilib.c,337 :: 		acil_encode_cmd_connect(buffer, &(p_aci_cmd->params.connect));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_connect+0
;acilib.c,338 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,339 :: 		case ACI_CMD_BOND:
L_acil_encode_cmd17:
;acilib.c,340 :: 		acil_encode_cmd_bond(buffer, &(p_aci_cmd->params.bond));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_bond+0
;acilib.c,341 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,342 :: 		case ACI_CMD_DISCONNECT:
L_acil_encode_cmd18:
;acilib.c,343 :: 		acil_encode_cmd_disconnect(buffer, &(p_aci_cmd->params.disconnect));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_disconnect+0
;acilib.c,344 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,345 :: 		case ACI_CMD_RADIO_RESET:
L_acil_encode_cmd19:
;acilib.c,346 :: 		acil_encode_baseband_reset(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_baseband_reset+0
;acilib.c,347 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,348 :: 		case ACI_CMD_CHANGE_TIMING:
L_acil_encode_cmd20:
;acilib.c,349 :: 		acil_encode_cmd_change_timing_req(buffer, &(p_aci_cmd->params.change_timing));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_change_timing_req+0
;acilib.c,350 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,351 :: 		case ACI_CMD_SETUP:
L_acil_encode_cmd21:
;acilib.c,352 :: 		acil_encode_cmd_setup(buffer, &(p_aci_cmd->params.setup), (p_aci_cmd->len - MSG_SETUP_CMD_BASE_LEN));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
LDRB	R2, [R7, #0]
SUBS	R3, R2, #1
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
UXTB	R2, R3
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_setup+0
;acilib.c,353 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,354 :: 		case ACI_CMD_DTM_CMD:
L_acil_encode_cmd22:
;acilib.c,355 :: 		acil_encode_cmd_dtm_cmd(buffer, &(p_aci_cmd->params.dtm_cmd));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_dtm_cmd+0
;acilib.c,356 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,357 :: 		case ACI_CMD_READ_DYNAMIC_DATA:
L_acil_encode_cmd23:
;acilib.c,358 :: 		acil_encode_cmd_read_dynamic_data(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_read_dynamic_data+0
;acilib.c,359 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,360 :: 		case ACI_CMD_WRITE_DYNAMIC_DATA:
L_acil_encode_cmd24:
;acilib.c,361 :: 		acil_encode_cmd_write_dynamic_data(buffer, p_aci_cmd->params.write_dynamic_data.seq_no, &(p_aci_cmd->params.write_dynamic_data.dynamic_data[0]), (p_aci_cmd->len - MSG_WRITE_DYNAMIC_DATA_BASE_LEN));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
LDRB	R2, [R7, #0]
SUBS	R4, R2, #2
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
ADDS	R3, R2, #1
LDRB	R2, [R2, #0]
UXTB	R1, R2
MOV	R2, R3
UXTB	R3, R4
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_write_dynamic_data+0
;acilib.c,362 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,363 :: 		case ACI_CMD_OPEN_REMOTE_PIPE:
L_acil_encode_cmd25:
;acilib.c,364 :: 		acil_encode_cmd_open_remote_pipe(buffer, &(p_aci_cmd->params.open_remote_pipe));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_open_remote_pipe+0
;acilib.c,365 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,366 :: 		case ACI_CMD_SEND_DATA:
L_acil_encode_cmd26:
;acilib.c,367 :: 		acil_encode_cmd_send_data(buffer, &(p_aci_cmd->params.send_data), (p_aci_cmd->len - MSG_SEND_DATA_BASE_LEN));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
LDRB	R2, [R7, #0]
SUBS	R3, R2, #2
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
UXTB	R2, R3
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_send_data+0
;acilib.c,368 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,369 :: 		case ACI_CMD_SEND_DATA_ACK:
L_acil_encode_cmd27:
;acilib.c,370 :: 		acil_encode_cmd_send_data_ack(buffer, p_aci_cmd->params.send_data_ack.pipe_number );
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
LDRB	R2, [R2, #0]
UXTB	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_send_data_ack+0
;acilib.c,371 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,372 :: 		case ACI_CMD_REQUEST_DATA:
L_acil_encode_cmd28:
;acilib.c,373 :: 		acil_encode_cmd_request_data(buffer, &(p_aci_cmd->params.request_data));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_request_data+0
;acilib.c,374 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,375 :: 		case ACI_CMD_SET_LOCAL_DATA:
L_acil_encode_cmd29:
;acilib.c,376 :: 		acil_encode_cmd_set_local_data(buffer, (aci_cmd_params_set_local_data_t *)(&(p_aci_cmd->params.send_data)), (p_aci_cmd->len - MSG_SET_LOCAL_DATA_BASE_LEN));
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
LDRB	R2, [R7, #0]
SUBS	R3, R2, #2
ADDS	R2, R7, #2
; p_aci_cmd end address is: 28 (R7)
MOV	R1, R2
UXTB	R2, R3
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_set_local_data+0
;acilib.c,377 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,378 :: 		case ACI_CMD_BOND_SECURITY_REQUEST:
L_acil_encode_cmd30:
;acilib.c,379 :: 		acil_encode_cmd_bond_security_request(buffer);
; buffer start address is: 24 (R6)
MOV	R0, R6
; buffer end address is: 24 (R6)
BL	_acil_encode_cmd_bond_security_request+0
;acilib.c,380 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,381 :: 		default:
L_acil_encode_cmd31:
;acilib.c,382 :: 		break;
IT	AL
BAL	L_acil_encode_cmd6
;acilib.c,383 :: 		}
L_acil_encode_cmd5:
; p_aci_cmd start address is: 28 (R7)
; buffer start address is: 24 (R6)
LDR	R3, [SP, #4]
LDRB	R2, [R3, #0]
CMP	R2, #1
IT	EQ
BEQ	L_acil_encode_cmd7
LDRB	R2, [R3, #0]
CMP	R2, #4
IT	EQ
BEQ	L_acil_encode_cmd8
LDRB	R2, [R3, #0]
CMP	R2, #9
IT	EQ
BEQ	L_acil_encode_cmd9
LDRB	R2, [R3, #0]
CMP	R2, #5
IT	EQ
BEQ	L_acil_encode_cmd10
LDRB	R2, [R3, #0]
CMP	R2, #2
IT	EQ
BEQ	L_acil_encode_cmd11
LDRB	R2, [R3, #0]
CMP	R2, #11
IT	EQ
BEQ	L_acil_encode_cmd12
LDRB	R2, [R3, #0]
CMP	R2, #12
IT	EQ
BEQ	L_acil_encode_cmd13
LDRB	R2, [R3, #0]
CMP	R2, #10
IT	EQ
BEQ	L_acil_encode_cmd14
LDRB	R2, [R3, #0]
CMP	R2, #18
IT	EQ
BEQ	L_acil_encode_cmd15
LDRB	R2, [R3, #0]
CMP	R2, #15
IT	EQ
BEQ	L_acil_encode_cmd16
LDRB	R2, [R3, #0]
CMP	R2, #16
IT	EQ
BEQ	L_acil_encode_cmd17
LDRB	R2, [R3, #0]
CMP	R2, #17
IT	EQ
BEQ	L_acil_encode_cmd18
LDRB	R2, [R3, #0]
CMP	R2, #14
IT	EQ
BEQ	L_acil_encode_cmd19
LDRB	R2, [R3, #0]
CMP	R2, #19
IT	EQ
BEQ	L_acil_encode_cmd20
LDRB	R2, [R3, #0]
CMP	R2, #6
IT	EQ
BEQ	L_acil_encode_cmd21
LDRB	R2, [R3, #0]
CMP	R2, #3
IT	EQ
BEQ	L_acil_encode_cmd22
LDRB	R2, [R3, #0]
CMP	R2, #7
IT	EQ
BEQ	L_acil_encode_cmd23
LDRB	R2, [R3, #0]
CMP	R2, #8
IT	EQ
BEQ	L_acil_encode_cmd24
LDRB	R2, [R3, #0]
CMP	R2, #20
IT	EQ
BEQ	L_acil_encode_cmd25
LDRB	R2, [R3, #0]
CMP	R2, #21
IT	EQ
BEQ	L_acil_encode_cmd26
LDRB	R2, [R3, #0]
CMP	R2, #22
IT	EQ
BEQ	L_acil_encode_cmd27
LDRB	R2, [R3, #0]
CMP	R2, #23
IT	EQ
BEQ	L_acil_encode_cmd28
LDRB	R2, [R3, #0]
CMP	R2, #13
IT	EQ
BEQ	L_acil_encode_cmd29
; p_aci_cmd end address is: 28 (R7)
LDRB	R2, [R3, #0]
CMP	R2, #29
IT	EQ
BEQ	L_acil_encode_cmd30
; buffer end address is: 24 (R6)
IT	AL
BAL	L_acil_encode_cmd31
L_acil_encode_cmd6:
;acilib.c,384 :: 		return ret_val;
UXTB	R0, R8
; ret_val end address is: 32 (R8)
;acilib.c,385 :: 		}
L_end_acil_encode_cmd:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _acil_encode_cmd
_acil_decode_evt_command_response:
;acilib.c,387 :: 		void acil_decode_evt_command_response(uint8_t *buffer_in, aci_evt_params_cmd_rsp_t *p_evt_params_cmd_rsp)
; p_evt_params_cmd_rsp start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R6, R0
MOV	R7, R1
; p_evt_params_cmd_rsp end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 24 (R6)
; p_evt_params_cmd_rsp start address is: 28 (R7)
;acilib.c,396 :: 		p_evt_params_cmd_rsp->cmd_opcode = (aci_cmd_opcode_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_CMD_OPCODE);
ADDS	R2, R6, #2
LDRB	R2, [R2, #0]
STRB	R2, [R7, #0]
;acilib.c,397 :: 		p_evt_params_cmd_rsp->cmd_status = (aci_status_code_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_CMD_STATUS);
ADDS	R3, R7, #1
ADDS	R2, R6, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,399 :: 		switch (p_evt_params_cmd_rsp->cmd_opcode)
MOV	R2, R7
STR	R2, [SP, #4]
IT	AL
BAL	L_acil_decode_evt_command_response32
;acilib.c,401 :: 		case ACI_CMD_GET_DEVICE_VERSION:
L_acil_decode_evt_command_response34:
;acilib.c,402 :: 		p_device_version = &(p_evt_params_cmd_rsp->params.get_device_version);
ADDS	R3, R7, #2
; p_evt_params_cmd_rsp end address is: 28 (R7)
; p_device_version start address is: 0 (R0)
MOV	R0, R3
;acilib.c,403 :: 		p_device_version->configuration_id  = (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_CONFIGURATION_ID_LSB);
ADDS	R2, R6, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRH	R2, [R3, #0]
;acilib.c,404 :: 		p_device_version->configuration_id |= (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_CONFIGURATION_ID_MSB) << 8;
ADDS	R2, R6, #2
ADDS	R2, R2, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
LSLS	R3, R2, #8
UXTH	R3, R3
LDRH	R2, [R0, #0]
ORRS	R2, R3
STRH	R2, [R0, #0]
;acilib.c,405 :: 		p_device_version->aci_version       = *(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_ACI_VERSION);
ADDS	R3, R0, #2
ADDS	R2, R6, #2
ADDS	R2, R2, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,406 :: 		p_device_version->setup_format      = *(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_SETUP_FORMAT);
ADDS	R3, R0, #3
ADDS	R2, R6, #2
ADDS	R2, R2, #2
ADDS	R2, R2, #3
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,407 :: 		p_device_version->setup_id          = (uint32_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_SETUP_ID_LSB0);
ADDS	R3, R0, #4
ADDS	R2, R6, #2
ADDS	R2, R2, #2
ADDS	R2, R2, #4
LDRB	R2, [R2, #0]
STR	R2, [R3, #0]
;acilib.c,408 :: 		p_device_version->setup_id         |= (uint32_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_SETUP_ID_LSB1) << 8;
ADDS	R4, R0, #4
ADDS	R2, R6, #2
ADDS	R2, R2, #2
ADDS	R2, R2, #5
LDRB	R2, [R2, #0]
LSLS	R3, R2, #8
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;acilib.c,409 :: 		p_device_version->setup_id         |= (uint32_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_SETUP_ID_MSB0) << 16;
ADDS	R4, R0, #4
ADDS	R2, R6, #2
ADDS	R2, R2, #2
ADDS	R2, R2, #6
LDRB	R2, [R2, #0]
LSLS	R3, R2, #16
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;acilib.c,410 :: 		p_device_version->setup_id         |= (uint32_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_SETUP_ID_MSB1) << 24;
ADDS	R4, R0, #4
ADDS	R2, R6, #2
ADDS	R2, R2, #2
ADDS	R2, R2, #7
LDRB	R2, [R2, #0]
LSLS	R3, R2, #24
LDR	R2, [R4, #0]
ORRS	R2, R3
STR	R2, [R4, #0]
;acilib.c,411 :: 		p_device_version->setup_status      = *(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_VERSION + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_VERSION_T_SETUP_STATUS);
ADDW	R3, R0, #8
; p_device_version end address is: 0 (R0)
ADDS	R2, R6, #2
; buffer_in end address is: 24 (R6)
ADDS	R2, R2, #2
ADDS	R2, #8
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,412 :: 		break;
IT	AL
BAL	L_acil_decode_evt_command_response33
;acilib.c,414 :: 		case ACI_CMD_GET_DEVICE_ADDRESS:
L_acil_decode_evt_command_response35:
;acilib.c,415 :: 		p_device_address = &(p_evt_params_cmd_rsp->params.get_device_address);
; p_evt_params_cmd_rsp start address is: 28 (R7)
; buffer_in start address is: 24 (R6)
ADDS	R3, R7, #2
; p_evt_params_cmd_rsp end address is: 28 (R7)
; p_device_address start address is: 28 (R7)
MOV	R7, R3
;acilib.c,416 :: 		memcpy((uint8_t *)(p_device_address->bd_addr_own), (buffer_in + OFFSET_ACI_EVT_T_CMD_RSP+OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_ADDRESS+OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_ADDRESS_T_BD_ADDR_OWN), BTLE_DEVICE_ADDRESS_SIZE);
ADDS	R2, R6, #2
ADDS	R2, R2, #2
MOV	R1, R2
MOVS	R2, #6
SXTH	R2, R2
MOV	R0, R3
BL	_memcpy+0
;acilib.c,417 :: 		p_device_address->bd_addr_type = (aci_bd_addr_type_t) *(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP+OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_DEVICE_ADDRESS+OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_DEVICE_ADDRESS_T_BD_ADDR_TYPE);
ADDS	R3, R7, #6
; p_device_address end address is: 28 (R7)
ADDS	R2, R6, #2
; buffer_in end address is: 24 (R6)
ADDS	R2, R2, #2
ADDS	R2, R2, #6
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,418 :: 		break;
IT	AL
BAL	L_acil_decode_evt_command_response33
;acilib.c,420 :: 		case ACI_CMD_GET_TEMPERATURE:
L_acil_decode_evt_command_response36:
;acilib.c,421 :: 		p_temperature = &(p_evt_params_cmd_rsp->params.get_temperature);
; p_evt_params_cmd_rsp start address is: 28 (R7)
; buffer_in start address is: 24 (R6)
ADDS	R3, R7, #2
; p_evt_params_cmd_rsp end address is: 28 (R7)
; p_temperature start address is: 0 (R0)
MOV	R0, R3
;acilib.c,422 :: 		p_temperature->temperature_value =  (int16_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_TEMPERATURE + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_TEMPERATURE_T_TEMPERATURE_VALUE_LSB);
ADDS	R2, R6, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRH	R2, [R3, #0]
;acilib.c,423 :: 		p_temperature->temperature_value |= (int16_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_TEMPERATURE + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_TEMPERATURE_T_TEMPERATURE_VALUE_MSB) << 8;
ADDS	R2, R6, #2
; buffer_in end address is: 24 (R6)
ADDS	R2, R2, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
LSLS	R3, R2, #8
SXTH	R3, R3
LDRSH	R2, [R0, #0]
ORRS	R2, R3
STRH	R2, [R0, #0]
; p_temperature end address is: 0 (R0)
;acilib.c,424 :: 		break;
IT	AL
BAL	L_acil_decode_evt_command_response33
;acilib.c,426 :: 		case ACI_CMD_GET_BATTERY_LEVEL:
L_acil_decode_evt_command_response37:
;acilib.c,427 :: 		p_batt_lvl = &(p_evt_params_cmd_rsp->params.get_battery_level);
; p_evt_params_cmd_rsp start address is: 28 (R7)
; buffer_in start address is: 24 (R6)
ADDS	R3, R7, #2
; p_evt_params_cmd_rsp end address is: 28 (R7)
; p_batt_lvl start address is: 0 (R0)
MOV	R0, R3
;acilib.c,428 :: 		p_batt_lvl->battery_level =  (int16_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_BATTERY_LEVEL + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_BATTERY_LEVEL_T_BATTERY_LEVEL_LSB);
ADDS	R2, R6, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRH	R2, [R3, #0]
;acilib.c,429 :: 		p_batt_lvl->battery_level |= (int16_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_GET_BATTERY_LEVEL + OFFSET_ACI_EVT_CMD_RSP_PARAMS_GET_BATTERY_LEVEL_T_BATTERY_LEVEL_MSB) << 8;
ADDS	R2, R6, #2
; buffer_in end address is: 24 (R6)
ADDS	R2, R2, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
LSLS	R3, R2, #8
SXTH	R3, R3
LDRH	R2, [R0, #0]
ORRS	R2, R3
STRH	R2, [R0, #0]
; p_batt_lvl end address is: 0 (R0)
;acilib.c,430 :: 		break;
IT	AL
BAL	L_acil_decode_evt_command_response33
;acilib.c,432 :: 		case ACI_CMD_READ_DYNAMIC_DATA:
L_acil_decode_evt_command_response38:
;acilib.c,433 :: 		p_read_dyn_data = &(p_evt_params_cmd_rsp->params.read_dynamic_data);
; p_evt_params_cmd_rsp start address is: 28 (R7)
; buffer_in start address is: 24 (R6)
ADDS	R3, R7, #2
; p_evt_params_cmd_rsp end address is: 28 (R7)
; p_read_dyn_data start address is: 0 (R0)
MOV	R0, R3
;acilib.c,434 :: 		p_read_dyn_data->seq_no =  (uint8_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_READ_DYNAMIC_DATA + OFFSET_ACI_EVT_CMD_RSP_READ_DYNAMIC_DATA_T_SEQ_NO);
ADDS	R2, R6, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,435 :: 		memcpy((uint8_t *)(p_read_dyn_data->dynamic_data), (buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_READ_DYNAMIC_DATA + OFFSET_ACI_CMD_PARAMS_WRITE_DYNAMIC_DATA_T_DYNAMIC_DATA), ACIL_DECODE_EVT_GET_LENGTH(buffer_in) - 3); // 3 bytes subtracted account for EventCode, CommandOpCode and Status bytes.
LDRB	R2, [R6, #0]
SUBS	R4, R2, #3
ADDS	R2, R6, #2
; buffer_in end address is: 24 (R6)
ADDS	R2, R2, #2
ADDS	R3, R2, #1
ADDS	R2, R0, #1
; p_read_dyn_data end address is: 0 (R0)
MOV	R1, R3
MOV	R0, R2
SXTH	R2, R4
BL	_memcpy+0
;acilib.c,437 :: 		break;
IT	AL
BAL	L_acil_decode_evt_command_response33
;acilib.c,439 :: 		case ACI_CMD_DTM_CMD:
L_acil_decode_evt_command_response39:
;acilib.c,440 :: 		p_dtm_evt = &(p_evt_params_cmd_rsp->params.dtm_cmd);
; p_evt_params_cmd_rsp start address is: 28 (R7)
; buffer_in start address is: 24 (R6)
ADDS	R3, R7, #2
; p_evt_params_cmd_rsp end address is: 28 (R7)
; p_dtm_evt start address is: 0 (R0)
MOV	R0, R3
;acilib.c,441 :: 		p_dtm_evt->evt_msb = (uint8_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_DTM_CMD + OFFSET_ACI_EVT_CMD_RSP_PARAMS_DTM_CMD_T_EVT_MSB);
ADDS	R2, R6, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,442 :: 		p_dtm_evt->evt_lsb = (uint8_t)*(buffer_in + OFFSET_ACI_EVT_T_CMD_RSP + OFFSET_ACI_EVT_PARAMS_CMD_RSP_T_DTM_CMD + OFFSET_ACI_EVT_CMD_RSP_PARAMS_DTM_CMD_T_EVT_LSB);
ADDS	R3, R0, #1
; p_dtm_evt end address is: 0 (R0)
ADDS	R2, R6, #2
; buffer_in end address is: 24 (R6)
ADDS	R2, R2, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,443 :: 		break;
IT	AL
BAL	L_acil_decode_evt_command_response33
;acilib.c,444 :: 		}
L_acil_decode_evt_command_response32:
; p_evt_params_cmd_rsp start address is: 28 (R7)
; buffer_in start address is: 24 (R6)
LDR	R3, [SP, #4]
LDRB	R2, [R3, #0]
CMP	R2, #9
IT	EQ
BEQ	L_acil_decode_evt_command_response34
LDRB	R2, [R3, #0]
CMP	R2, #10
IT	EQ
BEQ	L_acil_decode_evt_command_response35
LDRB	R2, [R3, #0]
CMP	R2, #12
IT	EQ
BEQ	L_acil_decode_evt_command_response36
LDRB	R2, [R3, #0]
CMP	R2, #11
IT	EQ
BEQ	L_acil_decode_evt_command_response37
LDRB	R2, [R3, #0]
CMP	R2, #7
IT	EQ
BEQ	L_acil_decode_evt_command_response38
LDRB	R2, [R3, #0]
CMP	R2, #3
IT	EQ
BEQ	L_acil_decode_evt_command_response39
; buffer_in end address is: 24 (R6)
; p_evt_params_cmd_rsp end address is: 28 (R7)
L_acil_decode_evt_command_response33:
;acilib.c,445 :: 		}
L_end_acil_decode_evt_command_response:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _acil_decode_evt_command_response
_acil_decode_evt_device_started:
;acilib.c,447 :: 		void acil_decode_evt_device_started(uint8_t *buffer_in, aci_evt_params_device_started_t *p_evt_params_device_started)
; p_evt_params_device_started start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_evt_params_device_started end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_evt_params_device_started start address is: 4 (R1)
;acilib.c,449 :: 		p_evt_params_device_started->device_mode = (aci_device_operation_mode_t) *(buffer_in + OFFSET_ACI_EVT_T_DEVICE_STARTED+OFFSET_ACI_EVT_PARAMS_DEVICE_STARTED_T_DEVICE_MODE);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
;acilib.c,450 :: 		p_evt_params_device_started->hw_error = (aci_hw_error_t) *(buffer_in + OFFSET_ACI_EVT_T_DEVICE_STARTED+OFFSET_ACI_EVT_PARAMS_DEVICE_STARTED_T_HW_ERROR);
ADDS	R3, R1, #1
ADDS	R2, R0, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,451 :: 		p_evt_params_device_started->credit_available = *(buffer_in + OFFSET_ACI_EVT_T_DEVICE_STARTED+OFFSET_ACI_EVT_PARAMS_DEVICE_STARTED_T_CREDIT_AVAILABLE);
ADDS	R3, R1, #2
; p_evt_params_device_started end address is: 4 (R1)
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,452 :: 		}
L_end_acil_decode_evt_device_started:
BX	LR
; end of _acil_decode_evt_device_started
_acil_decode_evt_pipe_status:
;acilib.c,454 :: 		void acil_decode_evt_pipe_status(uint8_t *buffer_in, aci_evt_params_pipe_status_t *p_aci_evt_params_pipe_status)
; p_aci_evt_params_pipe_status start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R7, R0
MOV	R6, R1
; p_aci_evt_params_pipe_status end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 28 (R7)
; p_aci_evt_params_pipe_status start address is: 24 (R6)
;acilib.c,456 :: 		memcpy((uint8_t *)p_aci_evt_params_pipe_status->pipes_open_bitmap, (buffer_in + OFFSET_ACI_EVT_T_PIPE_STATUS + OFFSET_ACI_EVT_PARAMS_PIPE_STATUS_T_PIPES_OPEN_BITMAP), 8);
ADDS	R2, R7, #2
MOV	R1, R2
MOVS	R2, #8
SXTH	R2, R2
MOV	R0, R6
BL	_memcpy+0
;acilib.c,457 :: 		memcpy((uint8_t *)p_aci_evt_params_pipe_status->pipes_closed_bitmap, (buffer_in + OFFSET_ACI_EVT_T_PIPE_STATUS + OFFSET_ACI_EVT_PARAMS_PIPE_STATUS_T_PIPES_CLOSED_BITMAP), 8);
ADDS	R2, R7, #2
; buffer_in end address is: 28 (R7)
ADDW	R3, R2, #8
ADDW	R2, R6, #8
; p_aci_evt_params_pipe_status end address is: 24 (R6)
MOV	R1, R3
MOV	R0, R2
MOVS	R2, #8
SXTH	R2, R2
BL	_memcpy+0
;acilib.c,458 :: 		}
L_end_acil_decode_evt_pipe_status:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_decode_evt_pipe_status
_acil_decode_evt_disconnected:
;acilib.c,460 :: 		void acil_decode_evt_disconnected(uint8_t *buffer_in, aci_evt_params_disconnected_t *p_aci_evt_params_disconnected)
; p_aci_evt_params_disconnected start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_aci_evt_params_disconnected end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_aci_evt_params_disconnected start address is: 4 (R1)
;acilib.c,462 :: 		p_aci_evt_params_disconnected->aci_status = (aci_status_code_t)*(buffer_in + OFFSET_ACI_EVT_T_DISCONNECTED + OFFSET_ACI_EVT_PARAMS_DISCONNECTED_T_ACI_STATUS);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
;acilib.c,463 :: 		p_aci_evt_params_disconnected->btle_status = *(buffer_in + OFFSET_ACI_EVT_T_DISCONNECTED + OFFSET_ACI_EVT_PARAMS_DISCONNECTED_T_BTLE_STATUS);
ADDS	R3, R1, #1
; p_aci_evt_params_disconnected end address is: 4 (R1)
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,464 :: 		}
L_end_acil_decode_evt_disconnected:
BX	LR
; end of _acil_decode_evt_disconnected
_acil_decode_evt_bond_status:
;acilib.c,466 :: 		void acil_decode_evt_bond_status(uint8_t *buffer_in, aci_evt_params_bond_status_t *p_aci_evt_params_bond_status)
; p_aci_evt_params_bond_status start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_aci_evt_params_bond_status end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_aci_evt_params_bond_status start address is: 4 (R1)
;acilib.c,468 :: 		p_aci_evt_params_bond_status->status_code = (aci_bond_status_code_t)*(buffer_in + OFFSET_ACI_EVT_T_BOND_STATUS + OFFSET_ACI_EVT_PARAMS_BOND_STATUS_T_STATUS_CODE);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
;acilib.c,469 :: 		p_aci_evt_params_bond_status->status_source = (aci_bond_status_source_t)*(buffer_in + OFFSET_ACI_EVT_T_BOND_STATUS + OFFSET_ACI_EVT_PARAMS_BOND_STATUS_T_STATUS_SOURCE);
ADDS	R3, R1, #1
ADDS	R2, R0, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,470 :: 		p_aci_evt_params_bond_status->secmode1_bitmap = *(buffer_in + OFFSET_ACI_EVT_T_BOND_STATUS + OFFSET_ACI_EVT_PARAMS_BOND_STATUS_T_SECMODE1_BITMAP);
ADDS	R3, R1, #2
ADDS	R2, R0, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,471 :: 		p_aci_evt_params_bond_status->secmode2_bitmap = *(buffer_in + OFFSET_ACI_EVT_T_BOND_STATUS + OFFSET_ACI_EVT_PARAMS_BOND_STATUS_T_SECMODE2_BITMAP);
ADDS	R3, R1, #3
ADDS	R2, R0, #2
ADDS	R2, R2, #3
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,472 :: 		p_aci_evt_params_bond_status->keys_exchanged_slave = *(buffer_in + OFFSET_ACI_EVT_T_BOND_STATUS + OFFSET_ACI_EVT_PARAMS_BOND_STATUS_T_KEYS_EXCHANGED_SLAVE);
ADDS	R3, R1, #4
ADDS	R2, R0, #2
ADDS	R2, R2, #4
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,473 :: 		p_aci_evt_params_bond_status->keys_exchanged_master = *(buffer_in + OFFSET_ACI_EVT_T_BOND_STATUS + OFFSET_ACI_EVT_PARAMS_BOND_STATUS_T_KEYS_EXCHANGED_MASTER);
ADDS	R3, R1, #5
; p_aci_evt_params_bond_status end address is: 4 (R1)
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R2, R2, #5
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,474 :: 		}
L_end_acil_decode_evt_bond_status:
BX	LR
; end of _acil_decode_evt_bond_status
_acil_decode_evt_data_received:
;acilib.c,476 :: 		uint8_t acil_decode_evt_data_received(uint8_t *buffer_in, aci_evt_params_data_received_t *p_evt_params_data_received)
; p_evt_params_data_received start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; p_evt_params_data_received end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_evt_params_data_received start address is: 4 (R1)
;acilib.c,478 :: 		uint8_t size = *( buffer_in + OFFSET_ACI_EVT_T_LEN) - (OFFSET_ACI_EVT_T_DATA_RECEIVED + OFFSET_ACI_RX_DATA_T_ACI_DATA) + 1 ;
LDRB	R2, [R0, #0]
SUBS	R2, R2, #3
SXTH	R2, R2
ADDS	R2, R2, #1
; size start address is: 24 (R6)
UXTB	R6, R2
;acilib.c,479 :: 		p_evt_params_data_received->rx_data.pipe_number = *(buffer_in + OFFSET_ACI_EVT_T_DATA_RECEIVED + OFFSET_ACI_RX_DATA_T_PIPE_NUMBER);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
;acilib.c,480 :: 		memcpy((uint8_t *)p_evt_params_data_received->rx_data.aci_data, (buffer_in + OFFSET_ACI_EVT_T_DATA_RECEIVED + OFFSET_ACI_RX_DATA_T_ACI_DATA), size);
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R3, R2, #1
ADDS	R2, R1, #1
; p_evt_params_data_received end address is: 4 (R1)
MOV	R1, R3
MOV	R0, R2
UXTB	R2, R6
BL	_memcpy+0
;acilib.c,481 :: 		return size;
UXTB	R0, R6
; size end address is: 24 (R6)
;acilib.c,482 :: 		}
L_end_acil_decode_evt_data_received:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_decode_evt_data_received
_acil_decode_evt_data_ack:
;acilib.c,484 :: 		void acil_decode_evt_data_ack(uint8_t *buffer_in, aci_evt_params_data_ack_t *p_evt_params_data_ack)
; p_evt_params_data_ack start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_evt_params_data_ack end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_evt_params_data_ack start address is: 4 (R1)
;acilib.c,486 :: 		p_evt_params_data_ack->pipe_number = *(buffer_in + OFFSET_ACI_EVT_T_DATA_ACK + OFFSET_ACI_EVT_PARAMS_DATA_ACK_T_PIPE_NUMBER);
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
; p_evt_params_data_ack end address is: 4 (R1)
;acilib.c,487 :: 		}
L_end_acil_decode_evt_data_ack:
BX	LR
; end of _acil_decode_evt_data_ack
_acil_decode_evt_hw_error:
;acilib.c,489 :: 		uint8_t acil_decode_evt_hw_error(uint8_t *buffer_in, aci_evt_params_hw_error_t *p_aci_evt_params_hw_error)
; p_aci_evt_params_hw_error start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; p_aci_evt_params_hw_error end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_aci_evt_params_hw_error start address is: 4 (R1)
;acilib.c,491 :: 		uint8_t size = *(buffer_in + OFFSET_ACI_EVT_T_LEN) - (OFFSET_ACI_EVT_T_HW_ERROR + OFFSET_ACI_EVT_PARAMS_HW_ERROR_T_FILE_NAME) + 1;
LDRB	R2, [R0, #0]
SUBS	R2, R2, #4
SXTH	R2, R2
ADDS	R2, R2, #1
; size start address is: 24 (R6)
UXTB	R6, R2
;acilib.c,492 :: 		p_aci_evt_params_hw_error->line_num = (uint16_t)(*(buffer_in + OFFSET_ACI_EVT_T_HW_ERROR + OFFSET_ACI_EVT_PARAMS_HW_ERROR_T_LINE_NUM_MSB)) << 8;
ADDS	R2, R0, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
STRH	R2, [R1, #0]
;acilib.c,493 :: 		p_aci_evt_params_hw_error->line_num |= (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_HW_ERROR + OFFSET_ACI_EVT_PARAMS_HW_ERROR_T_LINE_NUM_LSB);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
UXTB	R3, R2
LDRH	R2, [R1, #0]
ORRS	R2, R3
STRH	R2, [R1, #0]
;acilib.c,494 :: 		memcpy((uint8_t *)p_aci_evt_params_hw_error->file_name, (buffer_in + OFFSET_ACI_EVT_T_HW_ERROR + OFFSET_ACI_EVT_PARAMS_HW_ERROR_T_FILE_NAME), size);
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R3, R2, #2
ADDS	R2, R1, #2
; p_aci_evt_params_hw_error end address is: 4 (R1)
MOV	R1, R3
MOV	R0, R2
UXTB	R2, R6
BL	_memcpy+0
;acilib.c,495 :: 		return size;
UXTB	R0, R6
; size end address is: 24 (R6)
;acilib.c,496 :: 		}
L_end_acil_decode_evt_hw_error:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_decode_evt_hw_error
_acil_decode_evt_credit:
;acilib.c,498 :: 		void acil_decode_evt_credit(uint8_t *buffer_in, aci_evt_params_data_credit_t *p_evt_params_data_credit)
; p_evt_params_data_credit start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_evt_params_data_credit end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_evt_params_data_credit start address is: 4 (R1)
;acilib.c,500 :: 		p_evt_params_data_credit->credit = *(buffer_in + OFFSET_ACI_EVT_T_DATA_CREDIT + OFFSET_ACI_EVT_PARAMS_DATA_CREDIT_T_CREDIT);
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
; p_evt_params_data_credit end address is: 4 (R1)
;acilib.c,501 :: 		}
L_end_acil_decode_evt_credit:
BX	LR
; end of _acil_decode_evt_credit
_acil_decode_evt_connected:
;acilib.c,503 :: 		void acil_decode_evt_connected(uint8_t *buffer_in, aci_evt_params_connected_t *p_aci_evt_params_connected)
; p_aci_evt_params_connected start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R6, R0
MOV	R7, R1
; p_aci_evt_params_connected end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 24 (R6)
; p_aci_evt_params_connected start address is: 28 (R7)
;acilib.c,505 :: 		p_aci_evt_params_connected->dev_addr_type = (aci_bd_addr_type_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_DEV_ADDR_TYPE);
ADDS	R2, R6, #2
LDRB	R2, [R2, #0]
STRB	R2, [R7, #0]
;acilib.c,506 :: 		memcpy(&(p_aci_evt_params_connected->dev_addr[0]), (buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_DEV_ADDR), BTLE_DEVICE_ADDRESS_SIZE);
ADDS	R2, R6, #2
ADDS	R3, R2, #1
ADDS	R2, R7, #1
MOV	R1, R3
MOV	R0, R2
MOVS	R2, #6
SXTH	R2, R2
BL	_memcpy+0
;acilib.c,507 :: 		p_aci_evt_params_connected->conn_rf_interval       = (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_CONN_RF_INTERVAL_MSB) << 8;
ADDS	R3, R7, #7
ADDS	R2, R6, #2
ADDS	R2, #8
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
STRH	R2, [R3, #0]
;acilib.c,508 :: 		p_aci_evt_params_connected->conn_rf_interval      |= (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_CONN_RF_INTERVAL_LSB);
ADDS	R4, R7, #7
ADDS	R2, R6, #2
ADDS	R2, R2, #7
LDRB	R2, [R2, #0]
UXTB	R3, R2
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;acilib.c,509 :: 		p_aci_evt_params_connected->conn_slave_rf_latency  = (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_CONN_SLAVE_RF_LATENCY_MSB) << 8;
ADDW	R3, R7, #9
ADDS	R2, R6, #2
ADDS	R2, #10
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
STRH	R2, [R3, #0]
;acilib.c,510 :: 		p_aci_evt_params_connected->conn_slave_rf_latency |= (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_CONN_SLAVE_RF_LATENCY_LSB);
ADDW	R4, R7, #9
ADDS	R2, R6, #2
ADDS	R2, #9
LDRB	R2, [R2, #0]
UXTB	R3, R2
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;acilib.c,511 :: 		p_aci_evt_params_connected->conn_rf_timeout        = (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_CONN_RF_TIMEOUT_MSB) << 8;
ADDW	R3, R7, #11
ADDS	R2, R6, #2
ADDS	R2, #12
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
STRH	R2, [R3, #0]
;acilib.c,512 :: 		p_aci_evt_params_connected->conn_rf_timeout       |= (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_CONN_RF_TIMEOUT_LSB);
ADDW	R4, R7, #11
ADDS	R2, R6, #2
ADDS	R2, #11
LDRB	R2, [R2, #0]
UXTB	R3, R2
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;acilib.c,513 :: 		p_aci_evt_params_connected->master_clock_accuracy  = (aci_clock_accuracy_t)*(buffer_in + OFFSET_ACI_EVT_T_CONNECTED + OFFSET_ACI_EVT_PARAMS_CONNECTED_T_MASTER_CLOCK_ACCURACY);
ADDW	R3, R7, #13
; p_aci_evt_params_connected end address is: 28 (R7)
ADDS	R2, R6, #2
; buffer_in end address is: 24 (R6)
ADDS	R2, #13
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,515 :: 		}
L_end_acil_decode_evt_connected:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_decode_evt_connected
_acil_decode_evt_timing:
;acilib.c,517 :: 		void acil_decode_evt_timing(uint8_t *buffer_in, aci_evt_params_timing_t *p_evt_params_timing)
; p_evt_params_timing start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_evt_params_timing end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_evt_params_timing start address is: 4 (R1)
;acilib.c,519 :: 		p_evt_params_timing->conn_rf_interval       = *(buffer_in + OFFSET_ACI_EVT_T_TIMING + OFFSET_ACI_EVT_PARAMS_TIMING_T_CONN_RF_INTERVAL_MSB) << 8;
ADDS	R2, R0, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
STRH	R2, [R1, #0]
;acilib.c,520 :: 		p_evt_params_timing->conn_rf_interval      |= (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_TIMING + OFFSET_ACI_EVT_PARAMS_TIMING_T_CONN_RF_INTERVAL_LSB);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
UXTB	R3, R2
LDRH	R2, [R1, #0]
ORRS	R2, R3
STRH	R2, [R1, #0]
;acilib.c,521 :: 		p_evt_params_timing->conn_slave_rf_latency  = (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_TIMING + OFFSET_ACI_EVT_PARAMS_TIMING_T_CONN_SLAVE_RF_LATENCY_MSB) << 8;
ADDS	R3, R1, #2
ADDS	R2, R0, #2
ADDS	R2, R2, #3
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
STRH	R2, [R3, #0]
;acilib.c,522 :: 		p_evt_params_timing->conn_slave_rf_latency |= (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_TIMING + OFFSET_ACI_EVT_PARAMS_TIMING_T_CONN_SLAVE_RF_LATENCY_LSB);
ADDS	R4, R1, #2
ADDS	R2, R0, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
UXTB	R3, R2
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;acilib.c,523 :: 		p_evt_params_timing->conn_rf_timeout        = (uint16_t)*(buffer_in + OFFSET_ACI_EVT_T_TIMING + OFFSET_ACI_EVT_PARAMS_TIMING_T_CONN_RF_TIMEOUT_MSB) << 8;
ADDS	R3, R1, #4
ADDS	R2, R0, #2
ADDS	R2, R2, #5
LDRB	R2, [R2, #0]
LSLS	R2, R2, #8
STRH	R2, [R3, #0]
;acilib.c,524 :: 		p_evt_params_timing->conn_rf_timeout       |= *(buffer_in + OFFSET_ACI_EVT_T_TIMING + OFFSET_ACI_EVT_PARAMS_TIMING_T_CONN_RF_TIMEOUT_LSB);
ADDS	R4, R1, #4
; p_evt_params_timing end address is: 4 (R1)
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
LDRH	R2, [R4, #0]
ORRS	R2, R3
STRH	R2, [R4, #0]
;acilib.c,525 :: 		}
L_end_acil_decode_evt_timing:
BX	LR
; end of _acil_decode_evt_timing
_acil_decode_evt_pipe_error:
;acilib.c,527 :: 		void acil_decode_evt_pipe_error(uint8_t *buffer_in, aci_evt_params_pipe_error_t *p_evt_params_pipe_error)
; p_evt_params_pipe_error start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_evt_params_pipe_error end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_evt_params_pipe_error start address is: 4 (R1)
;acilib.c,530 :: 		p_evt_params_pipe_error->pipe_number = *(buffer_in + OFFSET_ACI_EVT_T_PIPE_ERROR + OFFSET_ACI_EVT_PARAMS_PIPE_ERROR_T_PIPE_NUMBER);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
;acilib.c,531 :: 		p_evt_params_pipe_error->error_code = *(buffer_in + OFFSET_ACI_EVT_T_PIPE_ERROR + OFFSET_ACI_EVT_PARAMS_PIPE_ERROR_T_ERROR_CODE);
ADDS	R3, R1, #1
ADDS	R2, R0, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,532 :: 		p_evt_params_pipe_error->params.error_data.content[0] = *(buffer_in + OFFSET_ACI_EVT_T_PIPE_ERROR + OFFSET_ACI_EVT_PARAMS_PIPE_ERROR_T_ERROR_DATA + OFFSET_ERROR_DATA_T_CONTENT);
ADDS	R3, R1, #2
; p_evt_params_pipe_error end address is: 4 (R1)
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,533 :: 		}
L_end_acil_decode_evt_pipe_error:
BX	LR
; end of _acil_decode_evt_pipe_error
_acil_decode_evt_key_request:
;acilib.c,535 :: 		void acil_decode_evt_key_request(uint8_t *buffer_in, aci_evt_params_key_request_t *p_evt_params_key_request)
; p_evt_params_key_request start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_evt_params_key_request end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_evt_params_key_request start address is: 4 (R1)
;acilib.c,537 :: 		p_evt_params_key_request->key_type = (aci_key_type_t)*(buffer_in + OFFSET_ACI_EVT_T_KEY_REQUEST + OFFSET_ACI_EVT_PARAMS_KEY_REQUEST_T_KEY_TYPE);
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
; p_evt_params_key_request end address is: 4 (R1)
;acilib.c,538 :: 		}
L_end_acil_decode_evt_key_request:
BX	LR
; end of _acil_decode_evt_key_request
_acil_decode_evt_echo:
;acilib.c,540 :: 		uint8_t acil_decode_evt_echo(uint8_t *buffer_in, aci_evt_params_echo_t *aci_evt_params_echo)
; aci_evt_params_echo start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; aci_evt_params_echo end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; aci_evt_params_echo start address is: 4 (R1)
;acilib.c,542 :: 		uint8_t size = *(buffer_in + OFFSET_ACI_EVT_T_LEN) - 1;
LDRB	R2, [R0, #0]
SUBS	R3, R2, #1
; size start address is: 24 (R6)
UXTB	R6, R3
;acilib.c,543 :: 		memcpy(&aci_evt_params_echo->echo_data[0], (buffer_in + OFFSET_ACI_EVT_T_EVT_OPCODE + 1), size);
ADDS	R2, R0, #1
; buffer_in end address is: 0 (R0)
ADDS	R2, R2, #1
MOV	R0, R1
MOV	R1, R2
UXTB	R2, R3
; aci_evt_params_echo end address is: 4 (R1)
BL	_memcpy+0
;acilib.c,544 :: 		return size;
UXTB	R0, R6
; size end address is: 24 (R6)
;acilib.c,545 :: 		}
L_end_acil_decode_evt_echo:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _acil_decode_evt_echo
_acil_decode_evt_display_passkey:
;acilib.c,547 :: 		void acil_decode_evt_display_passkey(uint8_t *buffer_in, aci_evt_params_display_passkey_t *p_aci_evt_params_display_passkey)
; p_aci_evt_params_display_passkey start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
; p_aci_evt_params_display_passkey end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 0 (R0)
; p_aci_evt_params_display_passkey start address is: 4 (R1)
;acilib.c,549 :: 		p_aci_evt_params_display_passkey->passkey[0] = *(buffer_in + OFFSET_ACI_EVT_T_DISPLAY_PASSKEY +  OFFSET_ACI_EVT_PARAMS_DISPLAY_PASSKEY_T_PASSKEY + 0);
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
STRB	R2, [R1, #0]
;acilib.c,550 :: 		p_aci_evt_params_display_passkey->passkey[1] = *(buffer_in + OFFSET_ACI_EVT_T_DISPLAY_PASSKEY +  OFFSET_ACI_EVT_PARAMS_DISPLAY_PASSKEY_T_PASSKEY + 1);
ADDS	R3, R1, #1
ADDS	R2, R0, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,551 :: 		p_aci_evt_params_display_passkey->passkey[2] = *(buffer_in + OFFSET_ACI_EVT_T_DISPLAY_PASSKEY +  OFFSET_ACI_EVT_PARAMS_DISPLAY_PASSKEY_T_PASSKEY + 2);
ADDS	R3, R1, #2
ADDS	R2, R0, #2
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,552 :: 		p_aci_evt_params_display_passkey->passkey[3] = *(buffer_in + OFFSET_ACI_EVT_T_DISPLAY_PASSKEY +  OFFSET_ACI_EVT_PARAMS_DISPLAY_PASSKEY_T_PASSKEY + 3);
ADDS	R3, R1, #3
ADDS	R2, R0, #2
ADDS	R2, R2, #3
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,553 :: 		p_aci_evt_params_display_passkey->passkey[4] = *(buffer_in + OFFSET_ACI_EVT_T_DISPLAY_PASSKEY +  OFFSET_ACI_EVT_PARAMS_DISPLAY_PASSKEY_T_PASSKEY + 4);
ADDS	R3, R1, #4
ADDS	R2, R0, #2
ADDS	R2, R2, #4
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,554 :: 		p_aci_evt_params_display_passkey->passkey[5] = *(buffer_in + OFFSET_ACI_EVT_T_DISPLAY_PASSKEY +  OFFSET_ACI_EVT_PARAMS_DISPLAY_PASSKEY_T_PASSKEY + 5);
ADDS	R3, R1, #5
; p_aci_evt_params_display_passkey end address is: 4 (R1)
ADDS	R2, R0, #2
; buffer_in end address is: 0 (R0)
ADDS	R2, R2, #5
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,555 :: 		}
L_end_acil_decode_evt_display_passkey:
BX	LR
; end of _acil_decode_evt_display_passkey
_acil_decode_evt:
;acilib.c,557 :: 		bool acil_decode_evt(uint8_t *buffer_in, aci_evt_t *p_aci_evt)
; p_aci_evt start address is: 4 (R1)
; buffer_in start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
MOV	R8, R0
MOV	R9, R1
; p_aci_evt end address is: 4 (R1)
; buffer_in end address is: 0 (R0)
; buffer_in start address is: 32 (R8)
; p_aci_evt start address is: 36 (R9)
;acilib.c,559 :: 		bool ret_val = true;
MOVS	R2, #1
STRB	R2, [SP, #4]
;acilib.c,561 :: 		p_aci_evt->len = ACIL_DECODE_EVT_GET_LENGTH(buffer_in);
LDRB	R2, [R8, #0]
STRB	R2, [R9, #0]
;acilib.c,562 :: 		p_aci_evt->evt_opcode = (aci_evt_opcode_t)ACIL_DECODE_EVT_GET_OPCODE(buffer_in);
ADD	R3, R9, #1
ADD	R2, R8, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;acilib.c,564 :: 		switch(p_aci_evt->evt_opcode)
ADD	R2, R9, #1
STR	R2, [SP, #12]
IT	AL
BAL	L_acil_decode_evt40
;acilib.c,566 :: 		case ACI_EVT_DEVICE_STARTED:
L_acil_decode_evt42:
;acilib.c,567 :: 		acil_decode_evt_device_started(buffer_in, &(p_aci_evt->params.device_started));
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_device_started+0
;acilib.c,568 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,569 :: 		case ACI_EVT_HW_ERROR:
L_acil_decode_evt43:
;acilib.c,570 :: 		acil_decode_evt_hw_error(buffer_in, &(p_aci_evt->params.hw_error));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_hw_error+0
;acilib.c,571 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,572 :: 		case ACI_EVT_CMD_RSP:
L_acil_decode_evt44:
;acilib.c,573 :: 		acil_decode_evt_command_response(buffer_in, &(p_aci_evt->params.cmd_rsp));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_command_response+0
;acilib.c,574 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,575 :: 		case ACI_EVT_DATA_CREDIT:
L_acil_decode_evt45:
;acilib.c,576 :: 		acil_decode_evt_credit(buffer_in, &(p_aci_evt->params.data_credit));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_credit+0
;acilib.c,577 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,578 :: 		case ACI_EVT_CONNECTED:
L_acil_decode_evt46:
;acilib.c,579 :: 		acil_decode_evt_connected(buffer_in, &(p_aci_evt->params.connected));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_connected+0
;acilib.c,580 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,581 :: 		case ACI_EVT_PIPE_STATUS:
L_acil_decode_evt47:
;acilib.c,582 :: 		acil_decode_evt_pipe_status(buffer_in, &(p_aci_evt->params.pipe_status));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_pipe_status+0
;acilib.c,583 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,584 :: 		case ACI_EVT_DISCONNECTED:
L_acil_decode_evt48:
;acilib.c,585 :: 		acil_decode_evt_disconnected(buffer_in, &(p_aci_evt->params.disconnected));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_disconnected+0
;acilib.c,586 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,587 :: 		case ACI_EVT_BOND_STATUS:
L_acil_decode_evt49:
;acilib.c,588 :: 		acil_decode_evt_bond_status(buffer_in, &(p_aci_evt->params.bond_status));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_bond_status+0
;acilib.c,589 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,590 :: 		case ACI_EVT_TIMING:
L_acil_decode_evt50:
;acilib.c,591 :: 		acil_decode_evt_timing(buffer_in, &(p_aci_evt->params.timing));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_timing+0
;acilib.c,592 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,593 :: 		case ACI_EVT_DATA_ACK:
L_acil_decode_evt51:
;acilib.c,594 :: 		acil_decode_evt_data_ack(buffer_in, &(p_aci_evt->params.data_ack));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_data_ack+0
;acilib.c,595 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,596 :: 		case ACI_EVT_DATA_RECEIVED:
L_acil_decode_evt52:
;acilib.c,597 :: 		acil_decode_evt_data_received(buffer_in, &(p_aci_evt->params.data_received));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_data_received+0
;acilib.c,598 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,599 :: 		case ACI_EVT_PIPE_ERROR:
L_acil_decode_evt53:
;acilib.c,600 :: 		acil_decode_evt_pipe_error(buffer_in, &(p_aci_evt->params.pipe_error));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_pipe_error+0
;acilib.c,601 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,602 :: 		case ACI_EVT_KEY_REQUEST:
L_acil_decode_evt54:
;acilib.c,603 :: 		acil_decode_evt_key_request(buffer_in, &(p_aci_evt->params.key_request));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_key_request+0
;acilib.c,604 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,605 :: 		case ACI_EVT_DISPLAY_PASSKEY:
L_acil_decode_evt55:
;acilib.c,606 :: 		acil_decode_evt_display_passkey(buffer_in, &(p_aci_evt->params.display_passkey));
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
ADD	R2, R9, #2
; p_aci_evt end address is: 36 (R9)
MOV	R1, R2
MOV	R0, R8
; buffer_in end address is: 32 (R8)
BL	_acil_decode_evt_display_passkey+0
;acilib.c,607 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,608 :: 		default:
L_acil_decode_evt56:
;acilib.c,609 :: 		ret_val = false;
MOVS	R2, #0
STRB	R2, [SP, #4]
;acilib.c,610 :: 		break;
IT	AL
BAL	L_acil_decode_evt41
;acilib.c,611 :: 		}
L_acil_decode_evt40:
; p_aci_evt start address is: 36 (R9)
; buffer_in start address is: 32 (R8)
LDR	R3, [SP, #12]
LDRB	R2, [R3, #0]
CMP	R2, #129
IT	EQ
BEQ	L_acil_decode_evt42
LDRB	R2, [R3, #0]
CMP	R2, #131
IT	EQ
BEQ	L_acil_decode_evt43
LDRB	R2, [R3, #0]
CMP	R2, #132
IT	EQ
BEQ	L_acil_decode_evt44
LDRB	R2, [R3, #0]
CMP	R2, #138
IT	EQ
BEQ	L_acil_decode_evt45
LDRB	R2, [R3, #0]
CMP	R2, #133
IT	EQ
BEQ	L_acil_decode_evt46
LDRB	R2, [R3, #0]
CMP	R2, #136
IT	EQ
BEQ	L_acil_decode_evt47
LDRB	R2, [R3, #0]
CMP	R2, #134
IT	EQ
BEQ	L_acil_decode_evt48
LDRB	R2, [R3, #0]
CMP	R2, #135
IT	EQ
BEQ	L_acil_decode_evt49
LDRB	R2, [R3, #0]
CMP	R2, #137
IT	EQ
BEQ	L_acil_decode_evt50
LDRB	R2, [R3, #0]
CMP	R2, #139
IT	EQ
BEQ	L_acil_decode_evt51
LDRB	R2, [R3, #0]
CMP	R2, #140
IT	EQ
BEQ	L_acil_decode_evt52
LDRB	R2, [R3, #0]
CMP	R2, #141
IT	EQ
BEQ	L_acil_decode_evt53
LDRB	R2, [R3, #0]
CMP	R2, #143
IT	EQ
BEQ	L_acil_decode_evt54
LDRB	R2, [R3, #0]
CMP	R2, #142
IT	EQ
BEQ	L_acil_decode_evt55
; buffer_in end address is: 32 (R8)
; p_aci_evt end address is: 36 (R9)
IT	AL
BAL	L_acil_decode_evt56
L_acil_decode_evt41:
;acilib.c,612 :: 		return ret_val;
LDRB	R0, [SP, #4]
;acilib.c,613 :: 		}
L_end_acil_decode_evt:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _acil_decode_evt
