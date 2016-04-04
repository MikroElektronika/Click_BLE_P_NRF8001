_m_aci_data_print:
;hal_aci_tl.c,65 :: 		void m_aci_data_print(hal_aci_data_t *p_data)
;hal_aci_tl.c,78 :: 		}
L_end_m_aci_data_print:
BX	LR
; end of _m_aci_data_print
hal_aci_tl_m_aci_isr:
;hal_aci_tl.c,85 :: 		static void m_aci_isr(void)
SUB	SP, SP, #72
STR	LR, [SP, #0]
;hal_aci_tl.c,91 :: 		if (!aci_queue_dequeue_from_isr(&aci_tx_q, &data_to_send))
ADD	R0, SP, #4
MOV	R1, R0
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_dequeue_from_isr+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_isr0
;hal_aci_tl.c,94 :: 		data_to_send.status_byte = 0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;hal_aci_tl.c,95 :: 		data_to_send.buffer[0] = 0;
ADD	R1, SP, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;hal_aci_tl.c,96 :: 		}
L_hal_aci_tl_m_aci_isr0:
;hal_aci_tl.c,99 :: 		m_aci_spi_transfer(&data_to_send, &received_data);
ADD	R1, SP, #37
ADD	R0, SP, #4
BL	hal_aci_tl_m_aci_spi_transfer+0
;hal_aci_tl.c,101 :: 		if (!aci_queue_is_full_from_isr(&aci_rx_q) && !aci_queue_is_empty_from_isr(&aci_tx_q))
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full_from_isr+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_isr57
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_is_empty_from_isr+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_isr56
L_hal_aci_tl_m_aci_isr55:
;hal_aci_tl.c,103 :: 		m_aci_reqn_enable();
BL	hal_aci_tl_m_aci_reqn_enable+0
;hal_aci_tl.c,101 :: 		if (!aci_queue_is_full_from_isr(&aci_rx_q) && !aci_queue_is_empty_from_isr(&aci_tx_q))
L_hal_aci_tl_m_aci_isr57:
L_hal_aci_tl_m_aci_isr56:
;hal_aci_tl.c,107 :: 		if (received_data.buffer[0] > 0)
ADD	R0, SP, #38
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_hal_aci_tl_m_aci_isr4
;hal_aci_tl.c,109 :: 		if (!aci_queue_enqueue_from_isr(&aci_rx_q, &received_data))
ADD	R0, SP, #37
MOV	R1, R0
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_enqueue_from_isr+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_isr5
;hal_aci_tl.c,115 :: 		while(1);
L_hal_aci_tl_m_aci_isr6:
IT	AL
BAL	L_hal_aci_tl_m_aci_isr6
;hal_aci_tl.c,116 :: 		}
L_hal_aci_tl_m_aci_isr5:
;hal_aci_tl.c,119 :: 		if (aci_queue_is_full_from_isr(&aci_rx_q))
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full_from_isr+0
CMP	R0, #0
IT	EQ
BEQ	L_hal_aci_tl_m_aci_isr8
;hal_aci_tl.c,121 :: 		detachInterrupt(a_pins_local_ptr->interrupt_number);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, #11
LDRB	R0, [R0, #0]
BL	_detachInterrupt+0
;hal_aci_tl.c,122 :: 		}
L_hal_aci_tl_m_aci_isr8:
;hal_aci_tl.c,123 :: 		}
L_hal_aci_tl_m_aci_isr4:
;hal_aci_tl.c,125 :: 		return;
;hal_aci_tl.c,126 :: 		}
L_end_m_aci_isr:
LDR	LR, [SP, #0]
ADD	SP, SP, #72
BX	LR
; end of hal_aci_tl_m_aci_isr
hal_aci_tl_m_aci_event_check:
;hal_aci_tl.c,131 :: 		static void m_aci_event_check(void)
SUB	SP, SP, #72
STR	LR, [SP, #0]
;hal_aci_tl.c,137 :: 		if (aci_queue_is_full(&aci_rx_q))
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full+0
CMP	R0, #0
IT	EQ
BEQ	L_hal_aci_tl_m_aci_event_check9
;hal_aci_tl.c,139 :: 		return;
IT	AL
BAL	L_end_m_aci_event_check
;hal_aci_tl.c,140 :: 		}
L_hal_aci_tl_m_aci_event_check9:
;hal_aci_tl.c,143 :: 		if (HIGH == digitalRead(a_pins_local_ptr->rdyn_pin))
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #2
LDRB	R0, [R0, #0]
BL	_digitalRead+0
CMP	R0, #1
IT	NE
BNE	L_hal_aci_tl_m_aci_event_check10
;hal_aci_tl.c,145 :: 		if (!aci_queue_is_empty(&aci_tx_q))
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_is_empty+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_event_check11
;hal_aci_tl.c,147 :: 		m_aci_reqn_enable();
BL	hal_aci_tl_m_aci_reqn_enable+0
;hal_aci_tl.c,148 :: 		}
L_hal_aci_tl_m_aci_event_check11:
;hal_aci_tl.c,150 :: 		return;
IT	AL
BAL	L_end_m_aci_event_check
;hal_aci_tl.c,151 :: 		}
L_hal_aci_tl_m_aci_event_check10:
;hal_aci_tl.c,154 :: 		if (!aci_queue_dequeue(&aci_tx_q, &data_to_send))
ADD	R0, SP, #4
MOV	R1, R0
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_dequeue+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_event_check12
;hal_aci_tl.c,157 :: 		data_to_send.status_byte = 0;
MOVS	R0, #0
STRB	R0, [SP, #4]
;hal_aci_tl.c,158 :: 		data_to_send.buffer[0] = 0;
ADD	R1, SP, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;hal_aci_tl.c,159 :: 		}
L_hal_aci_tl_m_aci_event_check12:
;hal_aci_tl.c,162 :: 		m_aci_spi_transfer(&data_to_send, &received_data);
ADD	R1, SP, #37
ADD	R0, SP, #4
BL	hal_aci_tl_m_aci_spi_transfer+0
;hal_aci_tl.c,165 :: 		if (!aci_queue_is_full(&aci_rx_q) && !aci_queue_is_empty(&aci_tx_q))
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_event_check60
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_is_empty+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_event_check59
L_hal_aci_tl_m_aci_event_check58:
;hal_aci_tl.c,167 :: 		m_aci_reqn_enable();
BL	hal_aci_tl_m_aci_reqn_enable+0
;hal_aci_tl.c,165 :: 		if (!aci_queue_is_full(&aci_rx_q) && !aci_queue_is_empty(&aci_tx_q))
L_hal_aci_tl_m_aci_event_check60:
L_hal_aci_tl_m_aci_event_check59:
;hal_aci_tl.c,171 :: 		if (received_data.buffer[0] > 0)
ADD	R0, SP, #38
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_hal_aci_tl_m_aci_event_check16
;hal_aci_tl.c,173 :: 		if (!aci_queue_enqueue(&aci_rx_q, &received_data))
ADD	R0, SP, #37
MOV	R1, R0
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_enqueue+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_event_check17
;hal_aci_tl.c,179 :: 		while(1);
L_hal_aci_tl_m_aci_event_check18:
IT	AL
BAL	L_hal_aci_tl_m_aci_event_check18
;hal_aci_tl.c,180 :: 		}
L_hal_aci_tl_m_aci_event_check17:
;hal_aci_tl.c,181 :: 		}
L_hal_aci_tl_m_aci_event_check16:
;hal_aci_tl.c,183 :: 		return;
;hal_aci_tl.c,184 :: 		}
L_end_m_aci_event_check:
LDR	LR, [SP, #0]
ADD	SP, SP, #72
BX	LR
; end of hal_aci_tl_m_aci_event_check
hal_aci_tl_m_aci_pins_set:
;hal_aci_tl.c,191 :: 		static void m_aci_pins_set(aci_pins_t *a_pins_ptr)
; a_pins_ptr start address is: 0 (R0)
; a_pins_ptr end address is: 0 (R0)
; a_pins_ptr start address is: 0 (R0)
;hal_aci_tl.c,193 :: 		a_pins_local_ptr = a_pins_ptr;
MOVW	R3, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R3, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
STR	R0, [R3, #0]
;hal_aci_tl.c,194 :: 		a_pins_local_ptr->active_pin = ACTIVE_PIN;
ADDW	R2, R0, #8
; a_pins_ptr end address is: 0 (R0)
MOVS	R1, #6
STRB	R1, [R2, #0]
;hal_aci_tl.c,195 :: 		a_pins_local_ptr->rdyn_pin = RDYN_PIN;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #2
MOVS	R1, #1
STRB	R1, [R2, #0]
;hal_aci_tl.c,196 :: 		a_pins_local_ptr->reqn_pin = REQN_PIN;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #1
MOVS	R1, #0
STRB	R1, [R2, #0]
;hal_aci_tl.c,197 :: 		a_pins_local_ptr->reset_pin = RESET_PIN;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #7
MOVS	R1, #5
STRB	R1, [R2, #0]
;hal_aci_tl.c,198 :: 		a_pins_local_ptr->miso_pin = MISO_PIN;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #4
MOVS	R1, #3
STRB	R1, [R2, #0]
;hal_aci_tl.c,199 :: 		a_pins_local_ptr->mosi_pin = MOSI_PIN;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R2, R1, #3
MOVS	R1, #2
STRB	R1, [R2, #0]
;hal_aci_tl.c,200 :: 		}
L_end_m_aci_pins_set:
BX	LR
; end of hal_aci_tl_m_aci_pins_set
hal_aci_tl_m_aci_reqn_disable:
;hal_aci_tl.c,202 :: 		static inline void m_aci_reqn_disable (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,204 :: 		digitalWrite(a_pins_local_ptr->reqn_pin, 1);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
MOVS	R1, #1
BL	_digitalWrite+0
;hal_aci_tl.c,205 :: 		}
L_end_m_aci_reqn_disable:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of hal_aci_tl_m_aci_reqn_disable
hal_aci_tl_m_aci_reqn_enable:
;hal_aci_tl.c,207 :: 		static inline void m_aci_reqn_enable (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,209 :: 		digitalWrite(a_pins_local_ptr->reqn_pin, 0);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #1
LDRB	R0, [R0, #0]
MOVS	R1, #0
BL	_digitalWrite+0
;hal_aci_tl.c,210 :: 		}
L_end_m_aci_reqn_enable:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of hal_aci_tl_m_aci_reqn_enable
hal_aci_tl_m_aci_q_flush:
;hal_aci_tl.c,212 :: 		static void m_aci_q_flush(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,214 :: 		noInterrupts();
BL	_noInterrupts+0
;hal_aci_tl.c,216 :: 		aci_queue_init(&aci_tx_q);
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_init+0
;hal_aci_tl.c,217 :: 		aci_queue_init(&aci_rx_q);
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_init+0
;hal_aci_tl.c,218 :: 		interrupts();
BL	_interrupts+0
;hal_aci_tl.c,219 :: 		}
L_end_m_aci_q_flush:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of hal_aci_tl_m_aci_q_flush
hal_aci_tl_m_aci_spi_transfer:
;hal_aci_tl.c,221 :: 		static bool m_aci_spi_transfer(hal_aci_data_t * data_to_send, hal_aci_data_t * received_data)
SUB	SP, SP, #28
STR	LR, [SP, #0]
STR	R0, [SP, #12]
STR	R1, [SP, #16]
;hal_aci_tl.c,227 :: 		m_aci_reqn_enable();
BL	hal_aci_tl_m_aci_reqn_enable+0
;hal_aci_tl.c,230 :: 		byte_sent_cnt = 0;
MOVS	R2, #0
STRB	R2, [SP, #8]
;hal_aci_tl.c,231 :: 		received_data->status_byte = spi_readwrite(data_to_send->buffer[byte_sent_cnt++]);
LDR	R2, [SP, #16]
STR	R2, [SP, #24]
LDR	R2, [SP, #12]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	hal_aci_tl_spi_readwrite+0
LDR	R2, [SP, #24]
STRB	R0, [R2, #0]
LDRB	R2, [SP, #8]
ADDS	R3, R2, #1
UXTB	R3, R3
STRB	R3, [SP, #8]
;hal_aci_tl.c,233 :: 		received_data->buffer[0] = spi_readwrite(data_to_send->buffer[byte_sent_cnt++]);
LDR	R2, [SP, #16]
ADDS	R2, R2, #1
STR	R2, [SP, #24]
LDR	R2, [SP, #12]
ADDS	R2, R2, #1
ADDS	R2, R2, R3
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	hal_aci_tl_spi_readwrite+0
LDR	R2, [SP, #24]
STRB	R0, [R2, #0]
LDRB	R2, [SP, #8]
ADDS	R2, R2, #1
STRB	R2, [SP, #8]
;hal_aci_tl.c,234 :: 		if (0 == data_to_send->buffer[0])
LDR	R2, [SP, #12]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_hal_aci_tl_m_aci_spi_transfer20
;hal_aci_tl.c,236 :: 		max_bytes = received_data->buffer[0];
LDR	R2, [SP, #16]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [SP, #9]
;hal_aci_tl.c,237 :: 		}
IT	AL
BAL	L_hal_aci_tl_m_aci_spi_transfer21
L_hal_aci_tl_m_aci_spi_transfer20:
;hal_aci_tl.c,241 :: 		max_bytes = (received_data->buffer[0] > (data_to_send->buffer[0] - 1))
LDR	R2, [SP, #16]
ADDS	R2, R2, #1
LDRB	R3, [R2, #0]
LDR	R2, [SP, #12]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
SUBS	R2, R2, #1
SXTH	R2, R2
;hal_aci_tl.c,242 :: 		? received_data->buffer[0]
CMP	R3, R2
IT	LE
BLE	L_hal_aci_tl_m_aci_spi_transfer22
LDR	R2, [SP, #16]
ADDS	R2, R2, #1
LDRB	R3, [R2, #0]
; ?FLOC__hal_aci_tl_m_aci_spi_transfer?T170 start address is: 12 (R3)
UXTB	R3, R3
;hal_aci_tl.c,243 :: 		: (data_to_send->buffer[0] - 1);
SXTH	R0, R3
; ?FLOC__hal_aci_tl_m_aci_spi_transfer?T170 end address is: 12 (R3)
IT	AL
BAL	L_hal_aci_tl_m_aci_spi_transfer23
L_hal_aci_tl_m_aci_spi_transfer22:
LDR	R2, [SP, #12]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
SUBS	R2, R2, #1
; ?FLOC__hal_aci_tl_m_aci_spi_transfer?T170 start address is: 12 (R3)
SXTH	R3, R2
; ?FLOC__hal_aci_tl_m_aci_spi_transfer?T170 end address is: 12 (R3)
SXTH	R0, R3
L_hal_aci_tl_m_aci_spi_transfer23:
; ?FLOC__hal_aci_tl_m_aci_spi_transfer?T170 start address is: 0 (R0)
STRB	R0, [SP, #9]
; ?FLOC__hal_aci_tl_m_aci_spi_transfer?T170 end address is: 0 (R0)
;hal_aci_tl.c,244 :: 		}
L_hal_aci_tl_m_aci_spi_transfer21:
;hal_aci_tl.c,246 :: 		if (max_bytes > HAL_ACI_MAX_LENGTH)
LDRB	R2, [SP, #9]
CMP	R2, #31
IT	LS
BLS	L_hal_aci_tl_m_aci_spi_transfer24
;hal_aci_tl.c,248 :: 		max_bytes = HAL_ACI_MAX_LENGTH;
MOVS	R2, #31
STRB	R2, [SP, #9]
;hal_aci_tl.c,249 :: 		}
L_hal_aci_tl_m_aci_spi_transfer24:
;hal_aci_tl.c,252 :: 		for (byte_cnt = 0; byte_cnt < max_bytes; byte_cnt++)
; byte_cnt start address is: 24 (R6)
MOVS	R6, #0
; byte_cnt end address is: 24 (R6)
UXTB	R1, R6
L_hal_aci_tl_m_aci_spi_transfer25:
; byte_cnt start address is: 4 (R1)
LDRB	R2, [SP, #9]
CMP	R1, R2
IT	CS
BCS	L_hal_aci_tl_m_aci_spi_transfer26
;hal_aci_tl.c,254 :: 		received_data->buffer[byte_cnt+1] = spi_readwrite(data_to_send->buffer[byte_sent_cnt++]);
LDR	R2, [SP, #16]
ADDS	R3, R2, #1
ADDS	R2, R1, #1
SXTH	R2, R2
ADDS	R2, R3, R2
STR	R2, [SP, #24]
LDR	R2, [SP, #12]
ADDS	R3, R2, #1
LDRB	R2, [SP, #8]
ADDS	R2, R3, R2
LDRB	R2, [R2, #0]
STRB	R1, [SP, #4]
UXTB	R0, R2
BL	hal_aci_tl_spi_readwrite+0
LDRB	R1, [SP, #4]
LDR	R2, [SP, #24]
STRB	R0, [R2, #0]
LDRB	R2, [SP, #8]
ADDS	R2, R2, #1
STRB	R2, [SP, #8]
;hal_aci_tl.c,252 :: 		for (byte_cnt = 0; byte_cnt < max_bytes; byte_cnt++)
ADDS	R2, R1, #1
; byte_cnt end address is: 4 (R1)
; byte_cnt start address is: 24 (R6)
UXTB	R6, R2
;hal_aci_tl.c,255 :: 		}
UXTB	R1, R6
; byte_cnt end address is: 24 (R6)
IT	AL
BAL	L_hal_aci_tl_m_aci_spi_transfer25
L_hal_aci_tl_m_aci_spi_transfer26:
;hal_aci_tl.c,258 :: 		m_aci_reqn_disable();
BL	hal_aci_tl_m_aci_reqn_disable+0
;hal_aci_tl.c,260 :: 		return (max_bytes > 0);
LDRB	R2, [SP, #9]
CMP	R2, #0
MOVW	R2, #0
BLS	L_hal_aci_tl_m_aci_spi_transfer81
MOVS	R2, #1
L_hal_aci_tl_m_aci_spi_transfer81:
UXTB	R0, R2
;hal_aci_tl.c,261 :: 		}
L_end_m_aci_spi_transfer:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of hal_aci_tl_m_aci_spi_transfer
_hal_aci_tl_debug_print:
;hal_aci_tl.c,263 :: 		void hal_aci_tl_debug_print(bool enable)
; enable start address is: 0 (R0)
; enable end address is: 0 (R0)
; enable start address is: 0 (R0)
;hal_aci_tl.c,265 :: 		aci_debug_print = enable;
MOVW	R1, #lo_addr(hal_aci_tl_aci_debug_print+0)
MOVT	R1, #hi_addr(hal_aci_tl_aci_debug_print+0)
STRB	R0, [R1, #0]
; enable end address is: 0 (R0)
;hal_aci_tl.c,266 :: 		}
L_end_hal_aci_tl_debug_print:
BX	LR
; end of _hal_aci_tl_debug_print
_hal_aci_tl_pin_reset:
;hal_aci_tl.c,268 :: 		void hal_aci_tl_pin_reset(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,270 :: 		if (UNUSED != a_pins_local_ptr->reset_pin)
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #7
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	EQ
BEQ	L_hal_aci_tl_pin_reset28
;hal_aci_tl.c,275 :: 		if ((REDBEARLAB_SHIELD_V1_1     == a_pins_local_ptr->board_name) ||
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
;hal_aci_tl.c,276 :: 		(REDBEARLAB_SHIELD_V2012_07 == a_pins_local_ptr->board_name))
CMP	R0, #1
IT	EQ
BEQ	L__hal_aci_tl_pin_reset63
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__hal_aci_tl_pin_reset62
IT	AL
BAL	L_hal_aci_tl_pin_reset31
L__hal_aci_tl_pin_reset63:
L__hal_aci_tl_pin_reset62:
;hal_aci_tl.c,280 :: 		digitalWrite(a_pins_local_ptr->reset_pin, 1);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #7
LDRB	R0, [R0, #0]
MOVS	R1, #1
BL	_digitalWrite+0
;hal_aci_tl.c,281 :: 		Delay_ms(100);
MOVW	R7, #13609
MOVT	R7, #71
NOP
NOP
L_hal_aci_tl_pin_reset32:
SUBS	R7, R7, #1
BNE	L_hal_aci_tl_pin_reset32
NOP
NOP
;hal_aci_tl.c,282 :: 		digitalWrite(a_pins_local_ptr->reset_pin, 0);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #7
LDRB	R0, [R0, #0]
MOVS	R1, #0
BL	_digitalWrite+0
;hal_aci_tl.c,283 :: 		}
IT	AL
BAL	L_hal_aci_tl_pin_reset34
L_hal_aci_tl_pin_reset31:
;hal_aci_tl.c,286 :: 		digitalWrite(a_pins_local_ptr->reset_pin, 1);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #7
LDRB	R0, [R0, #0]
MOVS	R1, #1
BL	_digitalWrite+0
;hal_aci_tl.c,287 :: 		digitalWrite(a_pins_local_ptr->reset_pin, 0);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #7
LDRB	R0, [R0, #0]
MOVS	R1, #0
BL	_digitalWrite+0
;hal_aci_tl.c,288 :: 		digitalWrite(a_pins_local_ptr->reset_pin, 1);
MOVW	R0, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R0, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #7
LDRB	R0, [R0, #0]
MOVS	R1, #1
BL	_digitalWrite+0
;hal_aci_tl.c,289 :: 		}
L_hal_aci_tl_pin_reset34:
;hal_aci_tl.c,290 :: 		}
L_hal_aci_tl_pin_reset28:
;hal_aci_tl.c,291 :: 		}
L_end_hal_aci_tl_pin_reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hal_aci_tl_pin_reset
_hal_aci_tl_event_peek:
;hal_aci_tl.c,293 :: 		bool hal_aci_tl_event_peek(hal_aci_data_t *p_aci_data)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R0, [SP, #4]
;hal_aci_tl.c,295 :: 		if (!a_pins_local_ptr->interface_is_interrupt)
MOVW	R1, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R1, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R1, [R1, #0]
ADDS	R1, #10
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_hal_aci_tl_event_peek35
;hal_aci_tl.c,297 :: 		m_aci_event_check();
BL	hal_aci_tl_m_aci_event_check+0
;hal_aci_tl.c,298 :: 		}
L_hal_aci_tl_event_peek35:
;hal_aci_tl.c,300 :: 		if (aci_queue_peek(&aci_rx_q, p_aci_data))
LDR	R1, [SP, #4]
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_peek+0
CMP	R0, #0
IT	EQ
BEQ	L_hal_aci_tl_event_peek36
;hal_aci_tl.c,302 :: 		return true;
MOVS	R0, #1
IT	AL
BAL	L_end_hal_aci_tl_event_peek
;hal_aci_tl.c,303 :: 		}
L_hal_aci_tl_event_peek36:
;hal_aci_tl.c,305 :: 		return false;
MOVS	R0, #0
;hal_aci_tl.c,306 :: 		}
L_end_hal_aci_tl_event_peek:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _hal_aci_tl_event_peek
_hal_aci_tl_event_get:
;hal_aci_tl.c,308 :: 		bool hal_aci_tl_event_get(hal_aci_data_t *p_aci_data)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
;hal_aci_tl.c,312 :: 		if (!a_pins_local_ptr->interface_is_interrupt && !aci_queue_is_full(&aci_rx_q))
MOVW	R1, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R1, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R1, [R1, #0]
ADDS	R1, #10
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L__hal_aci_tl_event_get68
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full+0
CMP	R0, #0
IT	NE
BNE	L__hal_aci_tl_event_get67
L__hal_aci_tl_event_get66:
;hal_aci_tl.c,314 :: 		m_aci_event_check();
BL	hal_aci_tl_m_aci_event_check+0
;hal_aci_tl.c,312 :: 		if (!a_pins_local_ptr->interface_is_interrupt && !aci_queue_is_full(&aci_rx_q))
L__hal_aci_tl_event_get68:
L__hal_aci_tl_event_get67:
;hal_aci_tl.c,317 :: 		was_full = aci_queue_is_full(&aci_rx_q);
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full+0
STRB	R0, [SP, #4]
;hal_aci_tl.c,319 :: 		if (aci_queue_dequeue(&aci_rx_q, p_aci_data))
LDR	R1, [SP, #8]
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_dequeue+0
CMP	R0, #0
IT	EQ
BEQ	L_hal_aci_tl_event_get40
;hal_aci_tl.c,327 :: 		if (was_full && a_pins_local_ptr->interface_is_interrupt)
LDRB	R1, [SP, #4]
CMP	R1, #0
IT	EQ
BEQ	L__hal_aci_tl_event_get70
MOVW	R1, #lo_addr(hal_aci_tl_a_pins_local_ptr+0)
MOVT	R1, #hi_addr(hal_aci_tl_a_pins_local_ptr+0)
LDR	R1, [R1, #0]
ADDS	R1, #10
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__hal_aci_tl_event_get69
L__hal_aci_tl_event_get65:
L__hal_aci_tl_event_get70:
L__hal_aci_tl_event_get69:
;hal_aci_tl.c,335 :: 		if (!aci_queue_is_full(&aci_rx_q) && !aci_queue_is_empty(&aci_tx_q))
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full+0
CMP	R0, #0
IT	NE
BNE	L__hal_aci_tl_event_get72
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_is_empty+0
CMP	R0, #0
IT	NE
BNE	L__hal_aci_tl_event_get71
L__hal_aci_tl_event_get64:
;hal_aci_tl.c,337 :: 		m_aci_reqn_enable();
BL	hal_aci_tl_m_aci_reqn_enable+0
;hal_aci_tl.c,335 :: 		if (!aci_queue_is_full(&aci_rx_q) && !aci_queue_is_empty(&aci_tx_q))
L__hal_aci_tl_event_get72:
L__hal_aci_tl_event_get71:
;hal_aci_tl.c,340 :: 		return true;
MOVS	R0, #1
IT	AL
BAL	L_end_hal_aci_tl_event_get
;hal_aci_tl.c,341 :: 		}
L_hal_aci_tl_event_get40:
;hal_aci_tl.c,343 :: 		return false;
MOVS	R0, #0
;hal_aci_tl.c,344 :: 		}
L_end_hal_aci_tl_event_get:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _hal_aci_tl_event_get
_hal_aci_tl_init:
;hal_aci_tl.c,346 :: 		void hal_aci_tl_init(aci_pins_t *a_pins, bool debug)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R0, [SP, #4]
;hal_aci_tl.c,351 :: 		m_aci_pins_set(a_pins);
LDR	R0, [SP, #4]
BL	hal_aci_tl_m_aci_pins_set+0
;hal_aci_tl.c,369 :: 		aci_queue_init(&aci_tx_q);
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_init+0
;hal_aci_tl.c,370 :: 		aci_queue_init(&aci_rx_q);
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_init+0
;hal_aci_tl.c,377 :: 		if (UNUSED != a_pins->active_pin)
LDR	R2, [SP, #4]
ADDS	R2, #8
LDRB	R2, [R2, #0]
CMP	R2, #255
IT	EQ
BEQ	L_hal_aci_tl_init47
;hal_aci_tl.c,380 :: 		}
L_hal_aci_tl_init47:
;hal_aci_tl.c,382 :: 		hal_aci_tl_pin_reset();
BL	_hal_aci_tl_pin_reset+0
;hal_aci_tl.c,386 :: 		digitalWrite(a_pins->miso_pin, 0);
LDR	R2, [SP, #4]
ADDS	R2, R2, #4
LDRB	R2, [R2, #0]
MOVS	R1, #0
UXTB	R0, R2
BL	_digitalWrite+0
;hal_aci_tl.c,387 :: 		digitalWrite(a_pins->mosi_pin, 0);
LDR	R2, [SP, #4]
ADDS	R2, R2, #3
LDRB	R2, [R2, #0]
MOVS	R1, #0
UXTB	R0, R2
BL	_digitalWrite+0
;hal_aci_tl.c,388 :: 		digitalWrite(a_pins->reqn_pin, 1);
LDR	R2, [SP, #4]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
MOVS	R1, #1
UXTB	R0, R2
BL	_digitalWrite+0
;hal_aci_tl.c,389 :: 		digitalWrite(a_pins->sck_pin,  0);
LDR	R2, [SP, #4]
ADDS	R2, R2, #5
LDRB	R2, [R2, #0]
MOVS	R1, #0
UXTB	R0, R2
BL	_digitalWrite+0
;hal_aci_tl.c,391 :: 		Delay_ms(30); //Wait for the nRF8001 to get hold of its lines - the lines float for a few ms after the reset
MOVW	R7, #23742
MOVT	R7, #21
NOP
NOP
L_hal_aci_tl_init48:
SUBS	R7, R7, #1
BNE	L_hal_aci_tl_init48
NOP
NOP
NOP
;hal_aci_tl.c,395 :: 		if (a_pins->interface_is_interrupt)
LDR	R2, [SP, #4]
ADDS	R2, #10
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_hal_aci_tl_init50
;hal_aci_tl.c,400 :: 		}
L_hal_aci_tl_init50:
;hal_aci_tl.c,401 :: 		}
L_end_hal_aci_tl_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _hal_aci_tl_init
_hal_aci_tl_send:
;hal_aci_tl.c,403 :: 		bool hal_aci_tl_send(hal_aci_data_t *p_aci_cmd)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
;hal_aci_tl.c,405 :: 		uint8_t length = p_aci_cmd->buffer[0];
LDR	R1, [SP, #8]
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
; length start address is: 0 (R0)
UXTB	R0, R1
;hal_aci_tl.c,406 :: 		bool ret_val = false;
;hal_aci_tl.c,408 :: 		if (length > HAL_ACI_MAX_LENGTH)
CMP	R0, #31
IT	LS
BLS	L_hal_aci_tl_send51
; length end address is: 0 (R0)
;hal_aci_tl.c,410 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_hal_aci_tl_send
;hal_aci_tl.c,411 :: 		}
L_hal_aci_tl_send51:
;hal_aci_tl.c,413 :: 		ret_val = aci_queue_enqueue(&aci_tx_q, p_aci_cmd);
LDR	R1, [SP, #8]
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_enqueue+0
STRB	R0, [SP, #4]
;hal_aci_tl.c,414 :: 		if (ret_val)
CMP	R0, #0
IT	EQ
BEQ	L_hal_aci_tl_send52
;hal_aci_tl.c,416 :: 		if(!aci_queue_is_full(&aci_rx_q))
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full+0
CMP	R0, #0
IT	NE
BNE	L_hal_aci_tl_send53
;hal_aci_tl.c,419 :: 		m_aci_reqn_enable();
BL	hal_aci_tl_m_aci_reqn_enable+0
;hal_aci_tl.c,420 :: 		}
L_hal_aci_tl_send53:
;hal_aci_tl.c,422 :: 		if (aci_debug_print)
MOVW	R1, #lo_addr(hal_aci_tl_aci_debug_print+0)
MOVT	R1, #hi_addr(hal_aci_tl_aci_debug_print+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_hal_aci_tl_send54
;hal_aci_tl.c,425 :: 		m_aci_data_print(p_aci_cmd);
LDR	R0, [SP, #8]
BL	_m_aci_data_print+0
;hal_aci_tl.c,426 :: 		}
L_hal_aci_tl_send54:
;hal_aci_tl.c,428 :: 		}
L_hal_aci_tl_send52:
;hal_aci_tl.c,430 :: 		return ret_val;
LDRB	R0, [SP, #4]
;hal_aci_tl.c,431 :: 		}
L_end_hal_aci_tl_send:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _hal_aci_tl_send
hal_aci_tl_spi_readwrite:
;hal_aci_tl.c,433 :: 		static uint8_t spi_readwrite(const uint8_t aci_byte)
; aci_byte start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; aci_byte end address is: 0 (R0)
; aci_byte start address is: 0 (R0)
;hal_aci_tl.c,435 :: 		return blep_hal_transfer( aci_byte );
; aci_byte end address is: 0 (R0)
BL	_blep_hal_transfer+0
;hal_aci_tl.c,436 :: 		}
L_end_spi_readwrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of hal_aci_tl_spi_readwrite
_hal_aci_tl_rx_q_empty:
;hal_aci_tl.c,438 :: 		bool hal_aci_tl_rx_q_empty (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,440 :: 		return aci_queue_is_empty(&aci_rx_q);
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_empty+0
;hal_aci_tl.c,441 :: 		}
L_end_hal_aci_tl_rx_q_empty:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hal_aci_tl_rx_q_empty
_hal_aci_tl_rx_q_full:
;hal_aci_tl.c,443 :: 		bool hal_aci_tl_rx_q_full (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,445 :: 		return aci_queue_is_full(&aci_rx_q);
MOVW	R0, #lo_addr(_aci_rx_q+0)
MOVT	R0, #hi_addr(_aci_rx_q+0)
BL	_aci_queue_is_full+0
;hal_aci_tl.c,446 :: 		}
L_end_hal_aci_tl_rx_q_full:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hal_aci_tl_rx_q_full
_hal_aci_tl_tx_q_empty:
;hal_aci_tl.c,448 :: 		bool hal_aci_tl_tx_q_empty (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,450 :: 		return aci_queue_is_empty(&aci_tx_q);
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_is_empty+0
;hal_aci_tl.c,451 :: 		}
L_end_hal_aci_tl_tx_q_empty:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hal_aci_tl_tx_q_empty
_hal_aci_tl_tx_q_full:
;hal_aci_tl.c,453 :: 		bool hal_aci_tl_tx_q_full (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,455 :: 		return aci_queue_is_full(&aci_tx_q);
MOVW	R0, #lo_addr(_aci_tx_q+0)
MOVT	R0, #hi_addr(_aci_tx_q+0)
BL	_aci_queue_is_full+0
;hal_aci_tl.c,456 :: 		}
L_end_hal_aci_tl_tx_q_full:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hal_aci_tl_tx_q_full
_hal_aci_tl_q_flush:
;hal_aci_tl.c,458 :: 		void hal_aci_tl_q_flush (void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;hal_aci_tl.c,460 :: 		m_aci_q_flush();
BL	hal_aci_tl_m_aci_q_flush+0
;hal_aci_tl.c,461 :: 		}
L_end_hal_aci_tl_q_flush:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hal_aci_tl_q_flush
