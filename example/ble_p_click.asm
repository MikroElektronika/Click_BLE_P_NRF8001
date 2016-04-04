ble_p_click_clear_serial_buffer:
;ble_p_click.c,22 :: 		static void clear_serial_buffer()
;ble_p_click.c,24 :: 		for (i = 0; i < SERIAL_BUFFER_LENGTH; ++i)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_ble_p_click_clear_serial_buffer0:
; i start address is: 8 (R2)
CMP	R2, #32
IT	CS
BCS	L_ble_p_click_clear_serial_buffer1
;ble_p_click.c,26 :: 		serial_buffer[i] = ' ';
MOVW	R0, #lo_addr(ble_p_click_serial_buffer+0)
MOVT	R0, #hi_addr(ble_p_click_serial_buffer+0)
ADDS	R1, R0, R2
MOVS	R0, #32
STRB	R0, [R1, #0]
;ble_p_click.c,24 :: 		for (i = 0; i < SERIAL_BUFFER_LENGTH; ++i)
ADDS	R2, R2, #1
UXTB	R2, R2
;ble_p_click.c,27 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_ble_p_click_clear_serial_buffer0
L_ble_p_click_clear_serial_buffer1:
;ble_p_click.c,28 :: 		}
L_end_clear_serial_buffer:
BX	LR
; end of ble_p_click_clear_serial_buffer
_setup:
;ble_p_click.c,33 :: 		void setup(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ble_p_click.c,37 :: 		ble_uart_setup(MOSI_PIN, MISO_PIN, SCK_PIN, REQN_PIN, RDYN_PIN, RESET_PIN);
MOVS	R1, #5
MOVS	R0, #1
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #4
MOVS	R1, #3
MOVS	R0, #2
BL	_ble_uart_setup+0
ADD	SP, SP, #8
;ble_p_click.c,40 :: 		clear_serial_buffer();
BL	ble_p_click_clear_serial_buffer+0
;ble_p_click.c,42 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_handle_serial_input:
;ble_p_click.c,50 :: 		void handle_serial_input()
SUB	SP, SP, #112
STR	LR, [SP, #0]
;ble_p_click.c,53 :: 		char name_buf[100] = {0};
ADD	R11, SP, #4
ADD	R10, R11, #100
MOVW	R12, #lo_addr(?ICShandle_serial_input_name_buf_L0+0)
MOVT	R12, #hi_addr(?ICShandle_serial_input_name_buf_L0+0)
BL	___CC2DW+0
;ble_p_click.c,56 :: 		while (UART1_Data_Ready())
L_handle_serial_input3:
BL	_UART1_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_handle_serial_input4
;ble_p_click.c,58 :: 		serial_buffer[msg_length++] = (uint8_t) UART1_Read();
MOVW	R0, #lo_addr(handle_serial_input_msg_length_L0+0)
MOVT	R0, #hi_addr(handle_serial_input_msg_length_L0+0)
STR	R0, [SP, #108]
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(ble_p_click_serial_buffer+0)
MOVT	R0, #hi_addr(ble_p_click_serial_buffer+0)
ADDS	R0, R0, R1
STR	R0, [SP, #104]
BL	_UART1_Read+0
UXTB	R1, R0
LDR	R0, [SP, #104]
STRB	R1, [R0, #0]
LDR	R1, [SP, #108]
MOV	R0, R1
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;ble_p_click.c,62 :: 		if ('\n' == serial_buffer[msg_length - 1] ||
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(ble_p_click_serial_buffer+0)
MOVT	R0, #hi_addr(ble_p_click_serial_buffer+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
;ble_p_click.c,63 :: 		SERIAL_BUFFER_LENGTH == msg_length)
CMP	R0, #10
IT	EQ
BEQ	L__handle_serial_input14
MOVW	R0, #lo_addr(handle_serial_input_msg_length_L0+0)
MOVT	R0, #hi_addr(handle_serial_input_msg_length_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #32
IT	EQ
BEQ	L__handle_serial_input13
IT	AL
BAL	L_handle_serial_input7
L__handle_serial_input14:
L__handle_serial_input13:
;ble_p_click.c,66 :: 		if (IS_NAME_SETTING(serial_buffer))
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #lo_addr(?lstr1_ble_p_click+0)
MOVT	R1, #hi_addr(?lstr1_ble_p_click+0)
MOVW	R0, #lo_addr(ble_p_click_serial_buffer+0)
MOVT	R0, #hi_addr(ble_p_click_serial_buffer+0)
BL	_memcmp+0
CMP	R0, #0
IT	NE
BNE	L_handle_serial_input8
;ble_p_click.c,70 :: 		memcpy(name_buf, &serial_buffer[5], msg_length - 6);
MOVW	R0, #lo_addr(handle_serial_input_msg_length_L0+0)
MOVT	R0, #hi_addr(handle_serial_input_msg_length_L0+0)
LDRB	R0, [R0, #0]
SUBS	R1, R0, #6
ADD	R0, SP, #4
SXTH	R2, R1
MOVW	R1, #lo_addr(ble_p_click_serial_buffer+5)
MOVT	R1, #hi_addr(ble_p_click_serial_buffer+5)
BL	_memcpy+0
;ble_p_click.c,73 :: 		ble_uart_name_set(name_buf, msg_length - 6);
MOVW	R0, #lo_addr(handle_serial_input_msg_length_L0+0)
MOVT	R0, #hi_addr(handle_serial_input_msg_length_L0+0)
LDRB	R0, [R0, #0]
SUBS	R1, R0, #6
ADD	R0, SP, #4
UXTB	R1, R1
BL	_ble_uart_name_set+0
;ble_p_click.c,74 :: 		}
IT	AL
BAL	L_handle_serial_input9
L_handle_serial_input8:
;ble_p_click.c,78 :: 		ble_uart_tx(serial_buffer, msg_length - 1);
MOVW	R0, #lo_addr(handle_serial_input_msg_length_L0+0)
MOVT	R0, #hi_addr(handle_serial_input_msg_length_L0+0)
LDRB	R0, [R0, #0]
SUBS	R0, R0, #1
UXTB	R1, R0
MOVW	R0, #lo_addr(ble_p_click_serial_buffer+0)
MOVT	R0, #hi_addr(ble_p_click_serial_buffer+0)
BL	_ble_uart_tx+0
;ble_p_click.c,79 :: 		}
L_handle_serial_input9:
;ble_p_click.c,82 :: 		clear_serial_buffer();
BL	ble_p_click_clear_serial_buffer+0
;ble_p_click.c,83 :: 		msg_length = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(handle_serial_input_msg_length_L0+0)
MOVT	R0, #hi_addr(handle_serial_input_msg_length_L0+0)
STRB	R1, [R0, #0]
;ble_p_click.c,84 :: 		}
L_handle_serial_input7:
;ble_p_click.c,85 :: 		}
IT	AL
BAL	L_handle_serial_input3
L_handle_serial_input4:
;ble_p_click.c,86 :: 		}
L_end_handle_serial_input:
LDR	LR, [SP, #0]
ADD	SP, SP, #112
BX	LR
; end of _handle_serial_input
_main:
;ble_p_click.c,89 :: 		void main() {
;ble_p_click.c,90 :: 		UART1_Init(57600);
MOVW	R0, #57600
BL	_UART1_Init+0
;ble_p_click.c,91 :: 		UART1_Write_Text("Uart initialized");
MOVW	R0, #lo_addr(?lstr2_ble_p_click+0)
MOVT	R0, #hi_addr(?lstr2_ble_p_click+0)
BL	_UART1_Write_Text+0
;ble_p_click.c,92 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;ble_p_click.c,93 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;ble_p_click.c,94 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;ble_p_click.c,95 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;ble_p_click.c,96 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_10);
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;ble_p_click.c,97 :: 		GPIO_Digital_Output(&GPIOC_ODR, _GPIO_PINMASK_2);                             // Set PC2 (RST) as digital output
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;ble_p_click.c,98 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0);                            // Set PA0 (CONN)
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;ble_p_click.c,105 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;ble_p_click.c,104 :: 		_SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #900
;ble_p_click.c,101 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV128,
MOVS	R0, #6
;ble_p_click.c,105 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;ble_p_click.c,107 :: 		blep_hal_init();
BL	_blep_hal_init+0
;ble_p_click.c,108 :: 		setup();
BL	_setup+0
;ble_p_click.c,110 :: 		while(1)
L_main10:
;ble_p_click.c,114 :: 		ble_uart_loop();
BL	_ble_uart_loop+0
;ble_p_click.c,117 :: 		handle_serial_input();
BL	_handle_serial_input+0
;ble_p_click.c,118 :: 		}
IT	AL
BAL	L_main10
;ble_p_click.c,120 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
