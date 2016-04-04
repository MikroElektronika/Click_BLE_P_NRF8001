_aci_queue_init:
;aci_queue.c,33 :: 		void aci_queue_init(aci_queue_t *aci_q)
; aci_q start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R3, R0
; aci_q end address is: 0 (R0)
; aci_q start address is: 12 (R3)
;aci_queue.c,37 :: 		ble_assert(NULL != aci_q);
CMP	R3, #0
IT	EQ
BEQ	L_aci_queue_init0
IT	AL
BAL	L_aci_queue_init1
L_aci_queue_init0:
MOVW	R1, #lo_addr(?lstr_1_aci_queue+0)
MOVT	R1, #hi_addr(?lstr_1_aci_queue+0)
STR	R3, [SP, #4]
MOV	R0, R1
MOVS	R1, #37
BL	___ble_assert+0
LDR	R3, [SP, #4]
L_aci_queue_init1:
;aci_queue.c,39 :: 		aci_q->head = 0;
ADDW	R2, R3, #132
MOVS	R1, #0
STRB	R1, [R2, #0]
;aci_queue.c,40 :: 		aci_q->tail = 0;
ADDW	R2, R3, #133
MOVS	R1, #0
STRB	R1, [R2, #0]
;aci_queue.c,41 :: 		for(loop=0; loop<ACI_QUEUE_SIZE; loop++)
; loop start address is: 0 (R0)
MOVS	R0, #0
; loop end address is: 0 (R0)
L_aci_queue_init2:
; loop start address is: 0 (R0)
; aci_q start address is: 12 (R3)
; aci_q end address is: 12 (R3)
CMP	R0, #4
IT	CS
BCS	L_aci_queue_init3
; aci_q end address is: 12 (R3)
;aci_queue.c,43 :: 		aci_q->aci_data[loop].buffer[0] = 0x00;
; aci_q start address is: 12 (R3)
MOVS	R1, #33
MULS	R1, R0, R1
ADDS	R1, R3, R1
ADDS	R2, R1, #1
MOVS	R1, #0
STRB	R1, [R2, #0]
;aci_queue.c,44 :: 		aci_q->aci_data[loop].buffer[1] = 0x00;
MOVS	R1, #33
MULS	R1, R0, R1
ADDS	R1, R3, R1
ADDS	R1, R1, #1
ADDS	R2, R1, #1
MOVS	R1, #0
STRB	R1, [R2, #0]
;aci_queue.c,41 :: 		for(loop=0; loop<ACI_QUEUE_SIZE; loop++)
ADDS	R0, R0, #1
UXTB	R0, R0
;aci_queue.c,45 :: 		}
; aci_q end address is: 12 (R3)
; loop end address is: 0 (R0)
IT	AL
BAL	L_aci_queue_init2
L_aci_queue_init3:
;aci_queue.c,46 :: 		}
L_end_aci_queue_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _aci_queue_init
_aci_queue_dequeue:
;aci_queue.c,48 :: 		bool aci_queue_dequeue(aci_queue_t *aci_q, hal_aci_data_t *p_data)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #12]
STR	R1, [SP, #16]
;aci_queue.c,50 :: 		ble_assert(NULL != aci_q);
LDR	R2, [SP, #12]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_dequeue5
IT	AL
BAL	L_aci_queue_dequeue6
L_aci_queue_dequeue5:
MOVW	R2, #lo_addr(?lstr_2_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_2_aci_queue+0)
MOVS	R1, #50
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_dequeue6:
;aci_queue.c,51 :: 		ble_assert(NULL != p_data);
LDR	R2, [SP, #16]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_dequeue7
IT	AL
BAL	L_aci_queue_dequeue8
L_aci_queue_dequeue7:
MOVW	R2, #lo_addr(?lstr_3_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_3_aci_queue+0)
MOVS	R1, #51
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_dequeue8:
;aci_queue.c,53 :: 		if (aci_queue_is_empty(aci_q))
LDR	R0, [SP, #12]
BL	_aci_queue_is_empty+0
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_dequeue9
;aci_queue.c,55 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_aci_queue_dequeue
;aci_queue.c,56 :: 		}
L_aci_queue_dequeue9:
;aci_queue.c,58 :: 		memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head % ACI_QUEUE_SIZE]), sizeof(hal_aci_data_t));
LDR	R2, [SP, #12]
ADDS	R2, #132
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R2, R2, R3
MOV	R1, R2
MOVS	R2, #33
SXTH	R2, R2
LDR	R0, [SP, #16]
BL	_memcpy+0
;aci_queue.c,59 :: 		++aci_q->head;
LDR	R2, [SP, #12]
ADDW	R3, R2, #132
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
;aci_queue.c,61 :: 		return true;
MOVS	R0, #1
;aci_queue.c,62 :: 		}
L_end_aci_queue_dequeue:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _aci_queue_dequeue
_aci_queue_dequeue_from_isr:
;aci_queue.c,64 :: 		bool aci_queue_dequeue_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #12]
STR	R1, [SP, #16]
;aci_queue.c,66 :: 		ble_assert(NULL != aci_q);
LDR	R2, [SP, #12]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_dequeue_from_isr10
IT	AL
BAL	L_aci_queue_dequeue_from_isr11
L_aci_queue_dequeue_from_isr10:
MOVW	R2, #lo_addr(?lstr_4_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_4_aci_queue+0)
MOVS	R1, #66
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_dequeue_from_isr11:
;aci_queue.c,67 :: 		ble_assert(NULL != p_data);
LDR	R2, [SP, #16]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_dequeue_from_isr12
IT	AL
BAL	L_aci_queue_dequeue_from_isr13
L_aci_queue_dequeue_from_isr12:
MOVW	R2, #lo_addr(?lstr_5_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_5_aci_queue+0)
MOVS	R1, #67
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_dequeue_from_isr13:
;aci_queue.c,69 :: 		if (aci_queue_is_empty_from_isr(aci_q))
LDR	R0, [SP, #12]
BL	_aci_queue_is_empty_from_isr+0
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_dequeue_from_isr14
;aci_queue.c,71 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_aci_queue_dequeue_from_isr
;aci_queue.c,72 :: 		}
L_aci_queue_dequeue_from_isr14:
;aci_queue.c,74 :: 		memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head % ACI_QUEUE_SIZE]), sizeof(hal_aci_data_t));
LDR	R2, [SP, #12]
ADDS	R2, #132
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R2, R2, R3
MOV	R1, R2
MOVS	R2, #33
SXTH	R2, R2
LDR	R0, [SP, #16]
BL	_memcpy+0
;aci_queue.c,75 :: 		++aci_q->head;
LDR	R2, [SP, #12]
ADDW	R3, R2, #132
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
;aci_queue.c,77 :: 		return true;
MOVS	R0, #1
;aci_queue.c,78 :: 		}
L_end_aci_queue_dequeue_from_isr:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _aci_queue_dequeue_from_isr
_aci_queue_enqueue:
;aci_queue.c,80 :: 		bool aci_queue_enqueue(aci_queue_t *aci_q, hal_aci_data_t *p_data)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #12]
STR	R1, [SP, #16]
;aci_queue.c,82 :: 		uint8_t length = p_data->buffer[0];
LDR	R2, [SP, #16]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [SP, #9]
;aci_queue.c,84 :: 		ble_assert(NULL != aci_q);
LDR	R2, [SP, #12]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_enqueue15
IT	AL
BAL	L_aci_queue_enqueue16
L_aci_queue_enqueue15:
MOVW	R2, #lo_addr(?lstr_6_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_6_aci_queue+0)
MOVS	R1, #84
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_enqueue16:
;aci_queue.c,85 :: 		ble_assert(NULL != p_data);
LDR	R2, [SP, #16]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_enqueue17
IT	AL
BAL	L_aci_queue_enqueue18
L_aci_queue_enqueue17:
MOVW	R2, #lo_addr(?lstr_7_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_7_aci_queue+0)
MOVS	R1, #85
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_enqueue18:
;aci_queue.c,87 :: 		if (aci_queue_is_full(aci_q))
LDR	R0, [SP, #12]
BL	_aci_queue_is_full+0
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_enqueue19
;aci_queue.c,89 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_aci_queue_enqueue
;aci_queue.c,90 :: 		}
L_aci_queue_enqueue19:
;aci_queue.c,92 :: 		aci_q->aci_data[aci_q->tail % ACI_QUEUE_SIZE].status_byte = 0;
LDR	R2, [SP, #12]
ADDS	R2, #133
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R3, R2, R3
MOVS	R2, #0
STRB	R2, [R3, #0]
;aci_queue.c,93 :: 		memcpy((uint8_t *)&(aci_q->aci_data[aci_q->tail % ACI_QUEUE_SIZE].buffer[0]), (uint8_t *)&p_data->buffer[0], length + 1);
LDRB	R2, [SP, #9]
ADDS	R5, R2, #1
LDR	R2, [SP, #16]
ADDS	R4, R2, #1
LDR	R2, [SP, #12]
ADDS	R2, #133
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R2, R2, R3
ADDS	R2, R2, #1
MOV	R1, R4
MOV	R0, R2
SXTH	R2, R5
BL	_memcpy+0
;aci_queue.c,94 :: 		++aci_q->tail;
LDR	R2, [SP, #12]
ADDW	R3, R2, #133
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
;aci_queue.c,96 :: 		return true;
MOVS	R0, #1
;aci_queue.c,97 :: 		}
L_end_aci_queue_enqueue:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _aci_queue_enqueue
_aci_queue_enqueue_from_isr:
;aci_queue.c,99 :: 		bool aci_queue_enqueue_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #12]
STR	R1, [SP, #16]
;aci_queue.c,101 :: 		uint8_t length = p_data->buffer[0];
LDR	R2, [SP, #16]
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [SP, #9]
;aci_queue.c,103 :: 		ble_assert(NULL != aci_q);
LDR	R2, [SP, #12]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_enqueue_from_isr20
IT	AL
BAL	L_aci_queue_enqueue_from_isr21
L_aci_queue_enqueue_from_isr20:
MOVW	R2, #lo_addr(?lstr_8_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_8_aci_queue+0)
MOVS	R1, #103
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_enqueue_from_isr21:
;aci_queue.c,104 :: 		ble_assert(NULL != p_data);
LDR	R2, [SP, #16]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_enqueue_from_isr22
IT	AL
BAL	L_aci_queue_enqueue_from_isr23
L_aci_queue_enqueue_from_isr22:
MOVW	R2, #lo_addr(?lstr_9_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_9_aci_queue+0)
MOVS	R1, #104
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_enqueue_from_isr23:
;aci_queue.c,106 :: 		if (aci_queue_is_full_from_isr(aci_q))
LDR	R0, [SP, #12]
BL	_aci_queue_is_full_from_isr+0
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_enqueue_from_isr24
;aci_queue.c,108 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_aci_queue_enqueue_from_isr
;aci_queue.c,109 :: 		}
L_aci_queue_enqueue_from_isr24:
;aci_queue.c,111 :: 		aci_q->aci_data[aci_q->tail % ACI_QUEUE_SIZE].status_byte = 0;
LDR	R2, [SP, #12]
ADDS	R2, #133
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R3, R2, R3
MOVS	R2, #0
STRB	R2, [R3, #0]
;aci_queue.c,112 :: 		memcpy((uint8_t *)&(aci_q->aci_data[aci_q->tail % ACI_QUEUE_SIZE].buffer[0]), (uint8_t *)&p_data->buffer[0], length + 1);
LDRB	R2, [SP, #9]
ADDS	R5, R2, #1
LDR	R2, [SP, #16]
ADDS	R4, R2, #1
LDR	R2, [SP, #12]
ADDS	R2, #133
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R2, R2, R3
ADDS	R2, R2, #1
MOV	R1, R4
MOV	R0, R2
SXTH	R2, R5
BL	_memcpy+0
;aci_queue.c,113 :: 		++aci_q->tail;
LDR	R2, [SP, #12]
ADDW	R3, R2, #133
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
;aci_queue.c,115 :: 		return true;
MOVS	R0, #1
;aci_queue.c,116 :: 		}
L_end_aci_queue_enqueue_from_isr:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _aci_queue_enqueue_from_isr
_aci_queue_is_empty:
;aci_queue.c,118 :: 		bool aci_queue_is_empty(aci_queue_t *aci_q)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
;aci_queue.c,120 :: 		bool state = false;
MOVS	R1, #0
STRB	R1, [SP, #5]
;aci_queue.c,122 :: 		ble_assert(NULL != aci_q);
LDR	R1, [SP, #8]
CMP	R1, #0
IT	EQ
BEQ	L_aci_queue_is_empty25
IT	AL
BAL	L_aci_queue_is_empty26
L_aci_queue_is_empty25:
MOVW	R1, #lo_addr(?lstr_10_aci_queue+0)
MOVT	R1, #hi_addr(?lstr_10_aci_queue+0)
MOV	R0, R1
MOVS	R1, #122
BL	___ble_assert+0
L_aci_queue_is_empty26:
;aci_queue.c,125 :: 		noInterrupts();
BL	_noInterrupts+0
;aci_queue.c,126 :: 		if (aci_q->head == aci_q->tail)
LDR	R1, [SP, #8]
ADDS	R1, #132
LDRB	R2, [R1, #0]
LDR	R1, [SP, #8]
ADDS	R1, #133
LDRB	R1, [R1, #0]
CMP	R2, R1
IT	NE
BNE	L_aci_queue_is_empty27
;aci_queue.c,128 :: 		state = true;
MOVS	R1, #1
STRB	R1, [SP, #5]
;aci_queue.c,129 :: 		}
L_aci_queue_is_empty27:
;aci_queue.c,130 :: 		interrupts();
BL	_interrupts+0
;aci_queue.c,132 :: 		return state;
LDRB	R0, [SP, #5]
;aci_queue.c,133 :: 		}
L_end_aci_queue_is_empty:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _aci_queue_is_empty
_aci_queue_is_empty_from_isr:
;aci_queue.c,135 :: 		bool aci_queue_is_empty_from_isr(aci_queue_t *aci_q)
; aci_q start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; aci_q end address is: 0 (R0)
; aci_q start address is: 0 (R0)
;aci_queue.c,137 :: 		ble_assert(NULL != aci_q);
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_is_empty_from_isr28
IT	AL
BAL	L_aci_queue_is_empty_from_isr29
L_aci_queue_is_empty_from_isr28:
MOVW	R1, #lo_addr(?lstr_11_aci_queue+0)
MOVT	R1, #hi_addr(?lstr_11_aci_queue+0)
STR	R0, [SP, #4]
MOV	R0, R1
MOVS	R1, #137
BL	___ble_assert+0
LDR	R0, [SP, #4]
L_aci_queue_is_empty_from_isr29:
;aci_queue.c,139 :: 		return aci_q->head == aci_q->tail;
ADDW	R1, R0, #132
LDRB	R2, [R1, #0]
ADDW	R1, R0, #133
; aci_q end address is: 0 (R0)
LDRB	R1, [R1, #0]
CMP	R2, R1
MOVW	R1, #0
BNE	L__aci_queue_is_empty_from_isr51
MOVS	R1, #1
L__aci_queue_is_empty_from_isr51:
UXTB	R0, R1
;aci_queue.c,140 :: 		}
L_end_aci_queue_is_empty_from_isr:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _aci_queue_is_empty_from_isr
_aci_queue_is_full:
;aci_queue.c,142 :: 		bool aci_queue_is_full(aci_queue_t *aci_q)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
;aci_queue.c,146 :: 		ble_assert(NULL != aci_q);
LDR	R1, [SP, #8]
CMP	R1, #0
IT	EQ
BEQ	L_aci_queue_is_full30
IT	AL
BAL	L_aci_queue_is_full31
L_aci_queue_is_full30:
MOVW	R1, #lo_addr(?lstr_12_aci_queue+0)
MOVT	R1, #hi_addr(?lstr_12_aci_queue+0)
MOV	R0, R1
MOVS	R1, #146
BL	___ble_assert+0
L_aci_queue_is_full31:
;aci_queue.c,149 :: 		noInterrupts();
BL	_noInterrupts+0
;aci_queue.c,151 :: 		state = (aci_q->tail == aci_q->head + ACI_QUEUE_SIZE);
LDR	R1, [SP, #8]
ADDS	R1, #133
LDRB	R2, [R1, #0]
LDR	R1, [SP, #8]
ADDS	R1, #132
LDRB	R1, [R1, #0]
ADDS	R1, R1, #4
SXTH	R1, R1
CMP	R2, R1
MOVW	R1, #0
BNE	L__aci_queue_is_full53
MOVS	R1, #1
L__aci_queue_is_full53:
STRB	R1, [SP, #5]
;aci_queue.c,153 :: 		interrupts();
BL	_interrupts+0
;aci_queue.c,156 :: 		return state;
LDRB	R0, [SP, #5]
;aci_queue.c,157 :: 		}
L_end_aci_queue_is_full:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _aci_queue_is_full
_aci_queue_is_full_from_isr:
;aci_queue.c,159 :: 		bool aci_queue_is_full_from_isr(aci_queue_t *aci_q)
; aci_q start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; aci_q end address is: 0 (R0)
; aci_q start address is: 0 (R0)
;aci_queue.c,161 :: 		ble_assert(NULL != aci_q);
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_is_full_from_isr32
IT	AL
BAL	L_aci_queue_is_full_from_isr33
L_aci_queue_is_full_from_isr32:
MOVW	R1, #lo_addr(?lstr_13_aci_queue+0)
MOVT	R1, #hi_addr(?lstr_13_aci_queue+0)
STR	R0, [SP, #4]
MOV	R0, R1
MOVS	R1, #161
BL	___ble_assert+0
LDR	R0, [SP, #4]
L_aci_queue_is_full_from_isr33:
;aci_queue.c,163 :: 		return (aci_q->tail == aci_q->head + ACI_QUEUE_SIZE);
ADDW	R1, R0, #133
LDRB	R2, [R1, #0]
ADDW	R1, R0, #132
; aci_q end address is: 0 (R0)
LDRB	R1, [R1, #0]
ADDS	R1, R1, #4
SXTH	R1, R1
CMP	R2, R1
MOVW	R1, #0
BNE	L__aci_queue_is_full_from_isr55
MOVS	R1, #1
L__aci_queue_is_full_from_isr55:
UXTB	R0, R1
;aci_queue.c,164 :: 		}
L_end_aci_queue_is_full_from_isr:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _aci_queue_is_full_from_isr
_aci_queue_peek:
;aci_queue.c,166 :: 		bool aci_queue_peek(aci_queue_t *aci_q, hal_aci_data_t *p_data)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #12]
STR	R1, [SP, #16]
;aci_queue.c,168 :: 		ble_assert(NULL != aci_q);
LDR	R2, [SP, #12]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_peek34
IT	AL
BAL	L_aci_queue_peek35
L_aci_queue_peek34:
MOVW	R2, #lo_addr(?lstr_14_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_14_aci_queue+0)
MOVS	R1, #168
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_peek35:
;aci_queue.c,169 :: 		ble_assert(NULL != p_data);
LDR	R2, [SP, #16]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_peek36
IT	AL
BAL	L_aci_queue_peek37
L_aci_queue_peek36:
MOVW	R2, #lo_addr(?lstr_15_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_15_aci_queue+0)
MOVS	R1, #169
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_peek37:
;aci_queue.c,171 :: 		if (aci_queue_is_empty(aci_q))
LDR	R0, [SP, #12]
BL	_aci_queue_is_empty+0
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_peek38
;aci_queue.c,173 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_aci_queue_peek
;aci_queue.c,174 :: 		}
L_aci_queue_peek38:
;aci_queue.c,176 :: 		memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head % ACI_QUEUE_SIZE]), sizeof(hal_aci_data_t));
LDR	R2, [SP, #12]
ADDS	R2, #132
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R2, R2, R3
MOV	R1, R2
MOVS	R2, #33
SXTH	R2, R2
LDR	R0, [SP, #16]
BL	_memcpy+0
;aci_queue.c,178 :: 		return true;
MOVS	R0, #1
;aci_queue.c,179 :: 		}
L_end_aci_queue_peek:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _aci_queue_peek
_aci_queue_peek_from_isr:
;aci_queue.c,181 :: 		bool aci_queue_peek_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #12]
STR	R1, [SP, #16]
;aci_queue.c,183 :: 		ble_assert(NULL != aci_q);
LDR	R2, [SP, #12]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_peek_from_isr39
IT	AL
BAL	L_aci_queue_peek_from_isr40
L_aci_queue_peek_from_isr39:
MOVW	R2, #lo_addr(?lstr_16_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_16_aci_queue+0)
MOVS	R1, #183
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_peek_from_isr40:
;aci_queue.c,184 :: 		ble_assert(NULL != p_data);
LDR	R2, [SP, #16]
CMP	R2, #0
IT	EQ
BEQ	L_aci_queue_peek_from_isr41
IT	AL
BAL	L_aci_queue_peek_from_isr42
L_aci_queue_peek_from_isr41:
MOVW	R2, #lo_addr(?lstr_17_aci_queue+0)
MOVT	R2, #hi_addr(?lstr_17_aci_queue+0)
MOVS	R1, #184
MOV	R0, R2
BL	___ble_assert+0
L_aci_queue_peek_from_isr42:
;aci_queue.c,186 :: 		if (aci_queue_is_empty_from_isr(aci_q))
LDR	R0, [SP, #12]
BL	_aci_queue_is_empty_from_isr+0
CMP	R0, #0
IT	EQ
BEQ	L_aci_queue_peek_from_isr43
;aci_queue.c,188 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_aci_queue_peek_from_isr
;aci_queue.c,189 :: 		}
L_aci_queue_peek_from_isr43:
;aci_queue.c,191 :: 		memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head % ACI_QUEUE_SIZE]), sizeof(hal_aci_data_t));
LDR	R2, [SP, #12]
ADDS	R2, #132
LDRB	R2, [R2, #0]
AND	R3, R2, #3
UXTB	R3, R3
MOVS	R2, #33
MULS	R3, R2, R3
LDR	R2, [SP, #12]
ADDS	R2, R2, R3
MOV	R1, R2
MOVS	R2, #33
SXTH	R2, R2
LDR	R0, [SP, #16]
BL	_memcpy+0
;aci_queue.c,193 :: 		return true;
MOVS	R0, #1
;aci_queue.c,194 :: 		}
L_end_aci_queue_peek_from_isr:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _aci_queue_peek_from_isr
