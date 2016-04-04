#line 1 "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/hal_platform.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 156 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_STORE_INVALID = 0x0,
 ACI_STORE_LOCAL= 0x01,
 ACI_STORE_REMOTE= 0x02
} aci_pipe_store_t;
#line 167 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_TX_BROADCAST = 0x0001,
 ACI_TX = 0x0002,
 ACI_TX_ACK = 0x0004,
 ACI_RX = 0x0008,
 ACI_RX_ACK = 0x0010,
 ACI_TX_REQ = 0x0020,
 ACI_RX_REQ = 0x0040,
 ACI_SET = 0x0080,
 ACI_TX_SIGN = 0x0100,
 ACI_RX_SIGN = 0x0200,
 ACI_RX_ACK_AUTO = 0x0400
} aci_pipe_type_t;

 typedef char aci_pipe_type_t_assert_size_t [-1+10*(sizeof(aci_pipe_type_t) == (2))] ;
#line 188 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_BD_ADDR_TYPE_INVALID = 0x00,
 ACI_BD_ADDR_TYPE_PUBLIC = 0x01,
 ACI_BD_ADDR_TYPE_RANDOM_STATIC = 0x02,
 ACI_BD_ADDR_TYPE_RANDOM_PRIVATE_RESOLVABLE = 0x03,
 ACI_BD_ADDR_TYPE_RANDOM_PRIVATE_UNRESOLVABLE = 0x04
} aci_bd_addr_type_t;
#line 201 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_DEVICE_OUTPUT_POWER_MINUS_18DBM = 0x00,
 ACI_DEVICE_OUTPUT_POWER_MINUS_12DBM = 0x01,
 ACI_DEVICE_OUTPUT_POWER_MINUS_6DBM = 0x02,
 ACI_DEVICE_OUTPUT_POWER_0DBM = 0x03
} aci_device_output_power_t;
#line 213 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_DEVICE_INVALID =0x00,
 ACI_DEVICE_TEST =0x01,
 ACI_DEVICE_SETUP =0x02,
 ACI_DEVICE_STANDBY =0x03,
 ACI_DEVICE_SLEEP =0x04
} aci_device_operation_mode_t;
#line 226 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_REASON_TERMINATE =0x01,
 ACI_REASON_BAD_TIMING =0x02
} aci_disconnect_reason_t;
#line 236 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_TEST_MODE_DTM_UART = 0x01,
 ACI_TEST_MODE_DTM_ACI = 0x02,
 ACI_TEST_MODE_EXIT = 0xFF

} aci_test_mode_change_t;

 typedef char aci_test_mode_change_t_assert_size_t [-1+10*(sizeof(aci_test_mode_change_t) == (1))] ;
#line 250 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_PERMISSIONS_NONE =0x00,
 ACI_PERMISSIONS_LINK_AUTHENTICATED =0x01
} aci_permissions_t;
#line 267 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef struct
{
 uint16_t min_conn_interval;



 uint16_t max_conn_interval;



 uint16_t slave_latency;

 uint16_t timeout_mult;



}  __attribute__((__packed__))  aci_ll_conn_params_t;
#line 344 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef struct
{
 uint8_t pipe_number;
 uint8_t aci_data[ (20) ];
}  __attribute__((__packed__))  aci_tx_data_t;

 typedef char aci_tx_data_t_assert_size_t [-1+10*(sizeof(aci_tx_data_t) == ( (20)  + 1))] ;
#line 356 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef struct
{
 uint8_t pipe_number;
 uint8_t aci_data[ (22) ];
}  __attribute__((__packed__))  aci_rx_data_t;

 typedef char aci_rx_data_t_assert_size_t [-1+10*(sizeof(aci_rx_data_t) == ( (22)  + 1))] ;
#line 368 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_HW_ERROR_NONE = 0x00,
 ACI_HW_ERROR_FATAL = 0x01
} aci_hw_error_t;
#line 378 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_CLOCK_ACCURACY_500_PPM = 0x00,
 ACI_CLOCK_ACCURACY_250_PPM = 0x01,
 ACI_CLOCK_ACCURACY_150_PPM = 0x02,
 ACI_CLOCK_ACCURACY_100_PPM = 0x03,
 ACI_CLOCK_ACCURACY_75_PPM = 0x04,
 ACI_CLOCK_ACCURACY_50_PPM = 0x05,
 ACI_CLOCK_ACCURACY_30_PPM = 0x06,
 ACI_CLOCK_ACCURACY_20_PPM = 0x07
}aci_clock_accuracy_t;
#line 394 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_APP_LATENCY_DISABLE = 0,
 ACI_APP_LATENCY_ENABLE = 1
}aci_app_latency_mode_t;
#line 404 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_GATT_FORMAT_NONE = 0x00,
 ACI_GATT_FORMAT_BOOLEAN = 0x01,
 ACI_GATT_FORMAT_2BIT = 0x02,
 ACI_GATT_FORMAT_NIBBLE = 0x03,
 ACI_GATT_FORMAT_UINT8 = 0x04,
 ACI_GATT_FORMAT_UINT12 = 0x05,
 ACI_GATT_FORMAT_UINT16 = 0x06,
 ACI_GATT_FORMAT_UINT24 = 0x07,
 ACI_GATT_FORMAT_UINT32 = 0x08,
 ACI_GATT_FORMAT_UINT48 = 0x09,
 ACI_GATT_FORMAT_UINT64 = 0x0A,
 ACI_GATT_FORMAT_UINT128 = 0x0B,
 ACI_GATT_FORMAT_SINT8 = 0x0C,
 ACI_GATT_FORMAT_SINT12 = 0x0D,
 ACI_GATT_FORMAT_SINT16 = 0x0E,
 ACI_GATT_FORMAT_SINT24 = 0x0F,
 ACI_GATT_FORMAT_SINT32 = 0x10,
 ACI_GATT_FORMAT_SINT48 = 0x11,
 ACI_GATT_FORMAT_SINT64 = 0x12,
 ACI_GATT_FORMAT_SINT128 = 0x13,
 ACI_GATT_FORMAT_FLOAT32 = 0x14,
 ACI_GATT_FORMAT_FLOAT64 = 0x15,
 ACI_GATT_FORMAT_SFLOAT = 0x16,
 ACI_GATT_FORMAT_FLOAT = 0x17,
 ACI_GATT_FORMAT_DUINT16 = 0x18,
 ACI_GATT_FORMAT_UTF8S = 0x19,
 ACI_GATT_FORMAT_UTF16S = 0x1A,
 ACI_GATT_FORMAT_STRUCT = 0x1B
} aci_gatt_format_t;
#line 439 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_GATT_NAMESPACE_INVALID = 0x00,
 ACI_GATT_NAMESPACE_BTSIG = 0x01
}aci_gatt_namespace_t;
#line 448 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_KEY_TYPE_INVALID = 0x00,
 ACI_KEY_TYPE_PASSKEY = 0x01
} aci_key_type_t;
#line 458 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
#line 463 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_SUCCESS = 0x00,
#line 467 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED = 0x01,
#line 471 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_TIMED_OUT = 0x02,
#line 475 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_PASSKEY_ENTRY_FAILED = 0x81,
#line 479 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_OOB_UNAVAILABLE = 0x82,
#line 483 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_AUTHENTICATION_REQ = 0x83,
#line 487 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_CONFIRM_VALUE = 0x84,
#line 491 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_PAIRING_UNSUPPORTED = 0x85,
#line 495 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_ENCRYPTION_KEY_SIZE = 0x86,
#line 499 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_SMP_CMD_UNSUPPORTED = 0x87,
#line 503 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_UNSPECIFIED_REASON = 0x88,
#line 507 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_REPEATED_ATTEMPTS = 0x89,
#line 511 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_BOND_STATUS_FAILED_INVALID_PARAMETERS = 0x8A

} aci_bond_status_code_t;

 typedef char aci_bond_status_code_t_assert_size_t [-1+10*(sizeof(aci_bond_status_code_t) == (1))] ;
#line 521 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
 ACI_BOND_STATUS_SOURCE_INVALID = 0x00,
 ACI_BOND_STATUS_SOURCE_LOCAL = 0x01,
 ACI_BOND_STATUS_SOURCE_REMOTE = 0x02

}aci_bond_status_source_t;
#line 533 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
typedef enum
{
#line 538 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_SUCCESS = 0x00,
#line 542 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_TRANSACTION_CONTINUE = 0x01,
#line 546 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_TRANSACTION_COMPLETE = 0x02,
#line 550 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_EXTENDED = 0x03,
#line 554 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_UNKNOWN = 0x80,
#line 558 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_INTERNAL = 0x81,
#line 562 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_CMD_UNKNOWN = 0x82,
#line 566 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_DEVICE_STATE_INVALID = 0x83,
#line 570 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_INVALID_LENGTH = 0x84,
#line 574 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_INVALID_PARAMETER = 0x85,
#line 578 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_BUSY = 0x86,
#line 582 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_INVALID_DATA = 0x87,
#line 586 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_CRC_MISMATCH = 0x88,
#line 590 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_UNSUPPORTED_SETUP_FORMAT = 0x89,
#line 594 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_INVALID_SEQ_NO = 0x8A,
#line 598 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_SETUP_LOCKED = 0x8B,
#line 602 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_LOCK_FAILED = 0x8C,
#line 606 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_BOND_REQUIRED = 0x8D,
#line 610 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_REJECTED = 0x8E,
#line 614 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_DATA_SIZE = 0x8F,
#line 618 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_PIPE_INVALID = 0x90,
#line 622 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_CREDIT_NOT_AVAILABLE = 0x91,
#line 626 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_PEER_ATT_ERROR = 0x92,
#line 630 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_ADVT_TIMEOUT = 0x93,
#line 634 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_PEER_SMP_ERROR = 0x94,
#line 638 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_PIPE_TYPE_INVALID = 0x95,
#line 642 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_PIPE_STATE_INVALID = 0x96,
#line 646 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_INVALID_KEY_SIZE = 0x97,
#line 650 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_ERROR_INVALID_KEY_DATA = 0x98,
#line 654 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_RESERVED_START = 0xF0,
#line 658 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
 ACI_STATUS_RESERVED_END = 0xFF

} aci_status_code_t;

 typedef char aci_status_code_t_assert_size_t [-1+10*(sizeof(aci_status_code_t) == (1))] ;
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/boards.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 60 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
typedef struct {
 uint8_t status_byte;
 uint8_t buffer[ 31 +1];
}  __attribute__((__packed__))  hal_aci_data_t;

 typedef char hal_aci_data_t_assert_size_t [-1+10*(sizeof(hal_aci_data_t) == ( 31  + 2))] ;


typedef struct aci_pins_t
{
 uint8_t board_name;
 uint8_t reqn_pin;
 uint8_t rdyn_pin;
 uint8_t mosi_pin;
 uint8_t miso_pin;
 uint8_t sck_pin;

 uint8_t spi_clock_divider;

 uint8_t reset_pin;
 uint8_t active_pin;
 uint8_t optional_chip_sel_pin;

  _Bool  interface_is_interrupt;

 uint8_t interrupt_number;
} aci_pins_t;
#line 95 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
void hal_aci_tl_init(aci_pins_t *a_pins,  _Bool  debug);
#line 106 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
 _Bool  hal_aci_tl_send(hal_aci_data_t *aci_buffer);
#line 115 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
hal_aci_data_t * hal_aci_tl_poll_get(void);
#line 122 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
 _Bool  hal_aci_tl_event_get(hal_aci_data_t *p_aci_data);
#line 129 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
 _Bool  hal_aci_tl_event_peek(hal_aci_data_t *p_aci_data);
#line 137 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
void hal_aci_tl_debug_print( _Bool  enable);
#line 147 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
void hal_aci_tl_pin_reset(void);
#line 153 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
  _Bool  hal_aci_tl_rx_q_full(void);
#line 159 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
  _Bool  hal_aci_tl_rx_q_empty(void);
#line 165 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
  _Bool  hal_aci_tl_tx_q_full(void);
#line 171 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
  _Bool  hal_aci_tl_tx_q_empty(void);
#line 177 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
void hal_aci_tl_q_flush(void);
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci_queue.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/hal_aci_tl.h"
#line 52 "c:/users/viktor/desktop/ble_blog_release/include/aci_queue.h"
typedef struct {
 hal_aci_data_t aci_data[ 4 ];
 uint8_t head;
 uint8_t tail;
} aci_queue_t;

void aci_queue_init(aci_queue_t *aci_q);

 _Bool  aci_queue_dequeue(aci_queue_t *aci_q, hal_aci_data_t *p_data);
 _Bool  aci_queue_dequeue_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data);

 _Bool  aci_queue_enqueue(aci_queue_t *aci_q, hal_aci_data_t *p_data);
 _Bool  aci_queue_enqueue_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data);

 _Bool  aci_queue_is_empty(aci_queue_t *aci_q);
 _Bool  aci_queue_is_empty_from_isr(aci_queue_t *aci_q);

 _Bool  aci_queue_is_full(aci_queue_t *aci_q);
 _Bool  aci_queue_is_full_from_isr(aci_queue_t *aci_q);

 _Bool  aci_queue_peek(aci_queue_t *aci_q, hal_aci_data_t *p_data);
 _Bool  aci_queue_peek_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data);
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/ble_assert.h"
#line 29 "c:/users/viktor/desktop/ble_blog_release/include/ble_assert.h"
extern void __ble_assert(const char *file, uint16_t line);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/mikroc_interrupts.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 2 "c:/users/viktor/desktop/ble_blog_release/include/mikroc_interrupts.h"
void attachInterrupt (uint8_t* pin, int a, int b);
void detachInterrupt (int pin);
void noInterrupts();
void interrupts();
#line 33 "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c"
void aci_queue_init(aci_queue_t *aci_q)
{
 uint8_t loop;

  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 37 )) ;

 aci_q->head = 0;
 aci_q->tail = 0;
 for(loop=0; loop< 4 ; loop++)
 {
 aci_q->aci_data[loop].buffer[0] = 0x00;
 aci_q->aci_data[loop].buffer[1] = 0x00;
 }
}

 _Bool  aci_queue_dequeue(aci_queue_t *aci_q, hal_aci_data_t *p_data)
{
  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 50 )) ;
  (( ((void *)0)  != p_data) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 51 )) ;

 if (aci_queue_is_empty(aci_q))
 {
 return  0 ;
 }

 memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head %  4 ]), sizeof(hal_aci_data_t));
 ++aci_q->head;

 return  1 ;
}

 _Bool  aci_queue_dequeue_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data)
{
  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 66 )) ;
  (( ((void *)0)  != p_data) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 67 )) ;

 if (aci_queue_is_empty_from_isr(aci_q))
 {
 return  0 ;
 }

 memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head %  4 ]), sizeof(hal_aci_data_t));
 ++aci_q->head;

 return  1 ;
}

 _Bool  aci_queue_enqueue(aci_queue_t *aci_q, hal_aci_data_t *p_data)
{
 uint8_t length = p_data->buffer[0];

  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 84 )) ;
  (( ((void *)0)  != p_data) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 85 )) ;

 if (aci_queue_is_full(aci_q))
 {
 return  0 ;
 }

 aci_q->aci_data[aci_q->tail %  4 ].status_byte = 0;
 memcpy((uint8_t *)&(aci_q->aci_data[aci_q->tail %  4 ].buffer[0]), (uint8_t *)&p_data->buffer[0], length + 1);
 ++aci_q->tail;

 return  1 ;
}

 _Bool  aci_queue_enqueue_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data)
{
 uint8_t length = p_data->buffer[0];

  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 103 )) ;
  (( ((void *)0)  != p_data) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 104 )) ;

 if (aci_queue_is_full_from_isr(aci_q))
 {
 return  0 ;
 }

 aci_q->aci_data[aci_q->tail %  4 ].status_byte = 0;
 memcpy((uint8_t *)&(aci_q->aci_data[aci_q->tail %  4 ].buffer[0]), (uint8_t *)&p_data->buffer[0], length + 1);
 ++aci_q->tail;

 return  1 ;
}

 _Bool  aci_queue_is_empty(aci_queue_t *aci_q)
{
  _Bool  state =  0 ;

  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 122 )) ;


 noInterrupts();
 if (aci_q->head == aci_q->tail)
 {
 state =  1 ;
 }
 interrupts();

 return state;
}

 _Bool  aci_queue_is_empty_from_isr(aci_queue_t *aci_q)
{
  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 137 )) ;

 return aci_q->head == aci_q->tail;
}

 _Bool  aci_queue_is_full(aci_queue_t *aci_q)
{
  _Bool  state;

  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 146 )) ;


 noInterrupts();

 state = (aci_q->tail == aci_q->head +  4 );

 interrupts();


 return state;
}

 _Bool  aci_queue_is_full_from_isr(aci_queue_t *aci_q)
{
  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 161 )) ;

 return (aci_q->tail == aci_q->head +  4 );
}

 _Bool  aci_queue_peek(aci_queue_t *aci_q, hal_aci_data_t *p_data)
{
  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 168 )) ;
  (( ((void *)0)  != p_data) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 169 )) ;

 if (aci_queue_is_empty(aci_q))
 {
 return  0 ;
 }

 memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head %  4 ]), sizeof(hal_aci_data_t));

 return  1 ;
}

 _Bool  aci_queue_peek_from_isr(aci_queue_t *aci_q, hal_aci_data_t *p_data)
{
  (( ((void *)0)  != aci_q) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 183 )) ;
  (( ((void *)0)  != p_data) ? ((void) 0) : __ble_assert ( "C:/Users/Viktor/Desktop/ble_blog_release/src/aci_queue.c" , 184 )) ;

 if (aci_queue_is_empty_from_isr(aci_q))
 {
 return  0 ;
 }

 memcpy((uint8_t *)p_data, (uint8_t *)&(aci_q->aci_data[aci_q->head %  4 ]), sizeof(hal_aci_data_t));

 return  1 ;
}
