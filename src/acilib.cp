#line 1 "C:/Users/Viktor/Desktop/ble_blog_release/src/acilib.c"
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
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
#line 41 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef enum
{
#line 46 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_TEST = 0x01,
#line 50 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_ECHO = 0x02,
#line 54 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_DTM_CMD = 0x03,
#line 58 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SLEEP = 0x04,
#line 62 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_WAKEUP = 0x05,
#line 67 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SETUP = 0x06,
#line 71 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_READ_DYNAMIC_DATA = 0x07,
#line 75 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_WRITE_DYNAMIC_DATA = 0x08,
#line 79 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_GET_DEVICE_VERSION = 0x09,
#line 83 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_GET_DEVICE_ADDRESS = 0x0A,
#line 87 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_GET_BATTERY_LEVEL = 0x0B,
#line 91 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_GET_TEMPERATURE = 0x0C,
#line 95 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SET_LOCAL_DATA = 0x0D,
#line 99 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_RADIO_RESET = 0x0E,
#line 103 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_CONNECT = 0x0F,
#line 107 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_BOND = 0x10,
#line 111 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_DISCONNECT = 0x11,
#line 115 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SET_TX_POWER = 0x12,
#line 119 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_CHANGE_TIMING = 0x13,
#line 123 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_OPEN_REMOTE_PIPE = 0x14,
#line 127 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SEND_DATA = 0x15,
#line 131 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SEND_DATA_ACK = 0x16,
#line 135 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_REQUEST_DATA = 0x17,
#line 139 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SEND_DATA_NACK = 0x18,
#line 143 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SET_APP_LATENCY = 0x19,
#line 147 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_SET_KEY = 0x1A,
#line 151 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_OPEN_ADV_PIPE = 0x1B,
#line 155 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_BROADCAST = 0x1C,
#line 159 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_BOND_SECURITY_REQUEST = 0x1D,
#line 163 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_CONNECT_DIRECT = 0x1E,
#line 167 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_CLOSE_REMOTE_PIPE = 0x1F,
#line 171 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
 ACI_CMD_INVALID = 0xFF

} aci_cmd_opcode_t;

 typedef char aci_cmd_opcode_t_assert_size_t [-1+10*(sizeof(aci_cmd_opcode_t) == (1))] ;
#line 181 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_test_mode_change_t test_mode_change;
}  __attribute__((__packed__))  aci_cmd_params_test_t;

 typedef char aci_cmd_params_test_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_test_t) == (1))] ;
#line 192 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t echo_data[ ( (32)  - 3) ];
}  __attribute__((__packed__))  aci_cmd_params_echo_t;

 typedef char aci_cmd_params_echo_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_echo_t) == ( ( (32)  - 3) ))] ;
#line 203 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t cmd_msb;
 uint8_t cmd_lsb;
}  __attribute__((__packed__))  aci_cmd_params_dtm_cmd_t;
#line 213 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t setup_data[1];
}  __attribute__((__packed__))  aci_cmd_params_setup_t;

 typedef char aci_cmd_params_setup_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_setup_t) == (1))] ;
#line 225 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t seq_no;
 uint8_t dynamic_data[1];
}  __attribute__((__packed__))  aci_cmd_params_write_dynamic_data_t;
#line 235 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_tx_data_t tx_data;
}  __attribute__((__packed__))  aci_cmd_params_set_local_data_t;
#line 244 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint16_t timeout;
 uint16_t adv_interval;
}  __attribute__((__packed__))  aci_cmd_params_connect_t;

 typedef char aci_cmd_params_connect_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_connect_t) == (4))] ;
#line 256 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint16_t timeout;
 uint16_t adv_interval;
}  __attribute__((__packed__))  aci_cmd_params_bond_t;

 typedef char aci_cmd_params_bond_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_bond_t) == (4))] ;
#line 268 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_disconnect_reason_t reason;
}  __attribute__((__packed__))  aci_cmd_params_disconnect_t;

 typedef char aci_cmd_params_disconnect_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_disconnect_t) == (1))] ;
#line 279 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_device_output_power_t device_power;
}  __attribute__((__packed__))  aci_cmd_params_set_tx_power_t;

 typedef char aci_cmd_params_set_tx_power_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_set_tx_power_t) == (1))] ;
#line 289 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_ll_conn_params_t conn_params;
}  __attribute__((__packed__))  aci_cmd_params_change_timing_t;

 typedef char aci_cmd_params_change_timing_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_change_timing_t) == (8))] ;
#line 300 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t pipe_number;
}  __attribute__((__packed__))  aci_cmd_params_open_remote_pipe_t;
#line 309 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_tx_data_t tx_data;
}  __attribute__((__packed__))  aci_cmd_params_send_data_t;
#line 318 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t pipe_number;
}  __attribute__((__packed__))  aci_cmd_params_send_data_ack_t;
#line 327 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t pipe_number;
}  __attribute__((__packed__))  aci_cmd_params_request_data_t;
#line 336 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t pipe_number;
 uint8_t error_code;
}  __attribute__((__packed__))  aci_cmd_params_send_data_nack_t;

 typedef char aci_cmd_params_send_data_nack_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_send_data_nack_t) == (2))] ;
#line 348 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_app_latency_mode_t mode;
 uint16_t latency;
}  __attribute__((__packed__))  aci_cmd_params_set_app_latency_t;

 typedef char aci_cmd_params_set_app_latency_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_set_app_latency_t) == (3))] ;
#line 359 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 aci_key_type_t key_type;
 union
 {
 uint8_t passkey[6];
 uint8_t oob_key[16];
 } key;
}  __attribute__((__packed__))  aci_cmd_params_set_key_t;

 typedef char aci_cmd_params_set_key_t_assert_size_t [-1+10*(sizeof(aci_cmd_params_set_key_t) == (17))] ;
#line 374 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t pipes[8];
}  __attribute__((__packed__))  aci_cmd_params_open_adv_pipe_t;
#line 383 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint16_t timeout;
 uint16_t adv_interval;
}  __attribute__((__packed__))  aci_cmd_params_broadcast_t;
#line 393 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t pipe_number;
}  __attribute__((__packed__))  aci_cmd_params_close_remote_pipe_t;
#line 402 "c:/users/viktor/desktop/ble_blog_release/include/aci_cmds.h"
typedef struct
{
 uint8_t len;
 aci_cmd_opcode_t cmd_opcode;
 union
 {
 aci_cmd_params_test_t test;
 aci_cmd_params_echo_t echo;
 aci_cmd_params_dtm_cmd_t dtm_cmd;
 aci_cmd_params_setup_t setup;
 aci_cmd_params_write_dynamic_data_t write_dynamic_data;
 aci_cmd_params_set_local_data_t set_local_data;
 aci_cmd_params_connect_t connect;
 aci_cmd_params_bond_t bond;
 aci_cmd_params_disconnect_t disconnect;
 aci_cmd_params_set_tx_power_t set_tx_power;
 aci_cmd_params_change_timing_t change_timing;
 aci_cmd_params_open_remote_pipe_t open_remote_pipe;
 aci_cmd_params_send_data_t send_data;
 aci_cmd_params_send_data_ack_t send_data_ack;
 aci_cmd_params_request_data_t request_data;
 aci_cmd_params_send_data_nack_t send_data_nack;
 aci_cmd_params_set_app_latency_t set_app_latency;
 aci_cmd_params_set_key_t set_key;
 aci_cmd_params_open_adv_pipe_t open_adv_pipe;
 aci_cmd_params_broadcast_t broadcast;
 aci_cmd_params_close_remote_pipe_t close_remote_pipe;

 } params;
}  __attribute__((__packed__))  aci_cmd_t;
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci.h"
#line 39 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef enum
{
#line 44 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_INVALID = 0x00,
#line 48 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_DEVICE_STARTED = 0x81,
#line 52 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_ECHO = 0x82,
#line 56 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_HW_ERROR = 0x83,
#line 60 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_CMD_RSP = 0x84,
#line 64 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_CONNECTED = 0x85,
#line 68 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_DISCONNECTED = 0x86,
#line 72 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_BOND_STATUS = 0x87,
#line 76 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_PIPE_STATUS = 0x88,
#line 81 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_TIMING = 0x89,
#line 86 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_DATA_CREDIT = 0x8A,
#line 90 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_DATA_ACK = 0x8B,
#line 94 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_DATA_RECEIVED = 0x8C,
#line 98 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_PIPE_ERROR = 0x8D,
#line 102 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_DISPLAY_PASSKEY = 0x8E,
#line 106 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
 ACI_EVT_KEY_REQUEST = 0x8F

} aci_evt_opcode_t;

 typedef char aci_evt_opcode_t_assert_size_t [-1+10*(sizeof(aci_evt_opcode_t) == (1))] ;
#line 116 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 aci_device_operation_mode_t device_mode;
 aci_hw_error_t hw_error;
 uint8_t credit_available;
}  __attribute__((__packed__))  aci_evt_params_device_started_t;

 typedef char aci_evt_params_device_started_t_assert_size_t [-1+10*(sizeof(aci_evt_params_device_started_t) == (3))] ;
#line 129 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint16_t line_num;
 uint8_t file_name[20];
}  __attribute__((__packed__))  aci_evt_params_hw_error_t;

 typedef char aci_evt_params_hw_error_t_assert_size_t [-1+10*(sizeof(aci_evt_params_hw_error_t) == (22))] ;
#line 141 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t evt_msb;
 uint8_t evt_lsb;
}  __attribute__((__packed__))  aci_evt_cmd_rsp_params_dtm_cmd_t;
#line 152 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t seq_no;
 uint8_t dynamic_data[1];
}  __attribute__((__packed__))  aci_evt_cmd_rsp_read_dynamic_data_t;
#line 162 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint16_t configuration_id;
 uint8_t aci_version;
 uint8_t setup_format;
 uint32_t setup_id;
 uint8_t setup_status;
}  __attribute__((__packed__))  aci_evt_cmd_rsp_params_get_device_version_t;

 typedef char aci_evt_cmd_rsp_params_get_device_version_t_assert_size_t [-1+10*(sizeof(aci_evt_cmd_rsp_params_get_device_version_t) == (9))] ;
#line 177 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t bd_addr_own[ (6) ];
 aci_bd_addr_type_t bd_addr_type;
}  __attribute__((__packed__))  aci_evt_cmd_rsp_params_get_device_address_t;

 typedef char aci_evt_cmd_rsp_params_get_device_address_t_assert_size_t [-1+10*(sizeof(aci_evt_cmd_rsp_params_get_device_address_t) == ( (6)  + 1))] ;
#line 189 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint16_t battery_level;
}  __attribute__((__packed__))  aci_evt_cmd_rsp_params_get_battery_level_t;
#line 198 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 int16_t temperature_value;
}  __attribute__((__packed__))  aci_evt_cmd_rsp_params_get_temperature_t;
#line 207 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 aci_cmd_opcode_t cmd_opcode;
 aci_status_code_t cmd_status;
 union
 {
 aci_evt_cmd_rsp_params_dtm_cmd_t dtm_cmd;
 aci_evt_cmd_rsp_read_dynamic_data_t read_dynamic_data;
 aci_evt_cmd_rsp_params_get_device_version_t get_device_version;
 aci_evt_cmd_rsp_params_get_device_address_t get_device_address;
 aci_evt_cmd_rsp_params_get_battery_level_t get_battery_level;
 aci_evt_cmd_rsp_params_get_temperature_t get_temperature;
 uint8_t padding[29];
 } params;
}  __attribute__((__packed__))  aci_evt_params_cmd_rsp_t;

 typedef char aci_evt_params_cmd_rsp_t_assert_size_t [-1+10*(sizeof(aci_evt_params_cmd_rsp_t) == (31))] ;
#line 229 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 aci_bd_addr_type_t dev_addr_type;
 uint8_t dev_addr[ (6) ];
 uint16_t conn_rf_interval;
 uint16_t conn_slave_rf_latency;
 uint16_t conn_rf_timeout;
 aci_clock_accuracy_t master_clock_accuracy;
}  __attribute__((__packed__))  aci_evt_params_connected_t;

 typedef char aci_evt_params_connected_t_assert_size_t [-1+10*(sizeof(aci_evt_params_connected_t) == (14))] ;
#line 245 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 aci_status_code_t aci_status;
 uint8_t btle_status;
}  __attribute__((__packed__))  aci_evt_params_disconnected_t;

 typedef char aci_evt_params_disconnected_t_assert_size_t [-1+10*(sizeof(aci_evt_params_disconnected_t) == (2))] ;
#line 257 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 aci_bond_status_code_t status_code;
 aci_bond_status_source_t status_source;
 uint8_t secmode1_bitmap;
 uint8_t secmode2_bitmap;
 uint8_t keys_exchanged_slave;
 uint8_t keys_exchanged_master;
}  __attribute__((__packed__))  aci_evt_params_bond_status_t;

 typedef char aci_evt_params_bond_status_t_assert_size_t [-1+10*(sizeof(aci_evt_params_bond_status_t) == (6))] ;
#line 273 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t pipes_open_bitmap[8];
 uint8_t pipes_closed_bitmap[8];
}  __attribute__((__packed__))  aci_evt_params_pipe_status_t;

 typedef char aci_evt_params_pipe_status_t_assert_size_t [-1+10*(sizeof(aci_evt_params_pipe_status_t) == (16))] ;
#line 285 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint16_t conn_rf_interval;
 uint16_t conn_slave_rf_latency;
 uint16_t conn_rf_timeout;
}  __attribute__((__packed__))  aci_evt_params_timing_t;

 typedef char aci_evt_params_timing_t_assert_size_t [-1+10*(sizeof(aci_evt_params_timing_t) == (6))] ;
#line 298 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t credit;
}  __attribute__((__packed__))  aci_evt_params_data_credit_t;
#line 307 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t pipe_number;
}  __attribute__((__packed__))  aci_evt_params_data_ack_t;
#line 316 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 aci_rx_data_t rx_data;
}  __attribute__((__packed__))  aci_evt_params_data_received_t;

typedef struct
{
 uint8_t content[1];
}  __attribute__((__packed__))  error_data_t;
#line 330 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t pipe_number;
 uint8_t error_code;
 union
 {
 error_data_t error_data;
 } params;
}  __attribute__((__packed__))  aci_evt_params_pipe_error_t;
#line 344 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t passkey[6];
}  __attribute__((__packed__))  aci_evt_params_display_passkey_t;
#line 353 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 aci_key_type_t key_type;
}  __attribute__((__packed__))  aci_evt_params_key_request_t;
#line 362 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t echo_data[ ( (32)  - 3) ];
}  __attribute__((__packed__))  aci_evt_params_echo_t;
#line 371 "c:/users/viktor/desktop/ble_blog_release/include/aci_evts.h"
typedef struct
{
 uint8_t len;
 aci_evt_opcode_t evt_opcode;
 union
 {
 aci_evt_params_device_started_t device_started;
 aci_evt_params_echo_t echo;
 aci_evt_params_hw_error_t hw_error;
 aci_evt_params_cmd_rsp_t cmd_rsp;
 aci_evt_params_connected_t connected;
 aci_evt_params_disconnected_t disconnected;
 aci_evt_params_bond_status_t bond_status;
 aci_evt_params_pipe_status_t pipe_status;
 aci_evt_params_timing_t timing;
 aci_evt_params_data_credit_t data_credit;
 aci_evt_params_data_ack_t data_ack;
 aci_evt_params_data_received_t data_received;
 aci_evt_params_pipe_error_t pipe_error;
 aci_evt_params_display_passkey_t display_passkey;
 aci_evt_params_key_request_t key_request;
 } params;
}  __attribute__((__packed__))  aci_evt_t;

 typedef char aci_evt_t_assert_size_t [-1+10*(sizeof(aci_evt_t) == (33))] ;
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/acilib.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/aci_protocol_defines.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/acilib_defs.h"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 43 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_set_test_mode(uint8_t *buffer, aci_cmd_params_test_t *p_aci_cmd_params_test);
#line 51 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_sleep(uint8_t *buffer);
#line 59 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_get_device_version(uint8_t *buffer);
#line 69 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_set_local_data(uint8_t *buffer, aci_cmd_params_set_local_data_t *p_aci_cmd_params_set_local_data, uint8_t data_size);
#line 78 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_connect(uint8_t *buffer, aci_cmd_params_connect_t *p_aci_cmd_params_connect);
#line 87 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_bond(uint8_t *buffer, aci_cmd_params_bond_t *p_aci_cmd_params_bond);
#line 96 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_disconnect(uint8_t *buffer, aci_cmd_params_disconnect_t *p_aci_cmd_params_disconnect);
#line 104 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
 void acil_encode_baseband_reset(uint8_t *buffer);
#line 112 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
 void acil_encode_direct_connect(uint8_t *buffer);
#line 120 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_wakeup(uint8_t *buffer);
#line 129 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_set_radio_tx_power(uint8_t *buffer, aci_cmd_params_set_tx_power_t *p_aci_cmd_params_set_tx_power);
#line 137 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_get_address(uint8_t *buffer);
#line 147 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_send_data(uint8_t *buffer, aci_cmd_params_send_data_t *p_aci_cmd_params_send_data_t, uint8_t data_size);
#line 156 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_request_data(uint8_t *buffer, aci_cmd_params_request_data_t *p_aci_cmd_params_request_data);
#line 165 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_open_remote_pipe(uint8_t *buffer, aci_cmd_params_open_remote_pipe_t *p_aci_cmd_params_open_remote_pipe);
#line 174 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_close_remote_pipe(uint8_t *buffer, aci_cmd_params_close_remote_pipe_t *p_aci_cmd_params_close_remote_pipe);
#line 184 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_echo_msg(uint8_t *buffer, aci_cmd_params_echo_t *p_cmd_params_echo, uint8_t msg_size);
#line 192 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_battery_level(uint8_t *buffer);
#line 200 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_temparature(uint8_t *buffer);
#line 208 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_read_dynamic_data(uint8_t *buffer);
#line 217 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_change_timing_req(uint8_t *buffer, aci_cmd_params_change_timing_t *p_aci_cmd_params_change_timing);
#line 226 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_change_timing_req_GAP_PPCP(uint8_t *buffer);
#line 238 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_write_dynamic_data(uint8_t *buffer, uint8_t seq_no, uint8_t* dynamic_data, uint8_t dynamic_data_size);
#line 247 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_send_data_ack(uint8_t *buffer, const uint8_t pipe_number);
#line 257 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_send_data_nack(uint8_t *buffer, const uint8_t pipe_number,const uint8_t error_code);
#line 266 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_set_app_latency(uint8_t *buffer, aci_cmd_params_set_app_latency_t *p_aci_cmd_params_set_app_latency);
#line 276 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_setup(uint8_t *buffer, aci_cmd_params_setup_t *p_aci_cmd_params_setup, uint8_t setup_data_size);
#line 285 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_dtm_cmd(uint8_t *buffer, aci_cmd_params_dtm_cmd_t *p_aci_cmd_params_dtm_cmd);
#line 293 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_set_key(uint8_t *buffer, aci_cmd_params_set_key_t *p_aci_cmd_params_set_key);
#line 301 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_bond_security_request(uint8_t *buffer);
#line 311 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
 _Bool  acil_encode_cmd(uint8_t *buffer, aci_cmd_t *p_aci_cmd);
#line 320 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_broadcast(uint8_t *buffer, aci_cmd_params_broadcast_t * p_aci_cmd_params_broadcast);
#line 329 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_encode_cmd_open_adv_pipes(uint8_t *buffer, aci_cmd_params_open_adv_pipe_t * p_aci_cmd_params_set_adv_svc_data);
#line 338 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_command_response(uint8_t *buffer_in, aci_evt_params_cmd_rsp_t *p_evt_params_cmd_rsp);
#line 347 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_device_started(uint8_t *buffer_in, aci_evt_params_device_started_t *p_evt_params_device_started);
#line 356 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_pipe_status(uint8_t *buffer_in, aci_evt_params_pipe_status_t *p_aci_evt_params_pipe_status);
#line 365 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_disconnected(uint8_t *buffer_in, aci_evt_params_disconnected_t *p_aci_evt_params_disconnected);
#line 374 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_bond_status(uint8_t *buffer_in, aci_evt_params_bond_status_t *p_aci_evt_params_bond_status);
#line 383 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
uint8_t acil_decode_evt_data_received(uint8_t *buffer_in, aci_evt_params_data_received_t *p_evt_params_data_received);
#line 392 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_data_ack(uint8_t *buffer_in, aci_evt_params_data_ack_t *p_evt_params_data_ack);
#line 401 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
uint8_t acil_decode_evt_hw_error(uint8_t *buffer_in, aci_evt_params_hw_error_t *p_aci_evt_params_hw_error);
#line 410 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_credit(uint8_t *buffer_in, aci_evt_params_data_credit_t *p_evt_params_data_credit);
#line 419 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_connected(uint8_t *buffer_in, aci_evt_params_connected_t *p_aci_evt_params_connected);
#line 428 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_timing(uint8_t *buffer_in, aci_evt_params_timing_t *p_evt_params_timing);
#line 436 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_pipe_error(uint8_t *buffer_in, aci_evt_params_pipe_error_t *p_evt_params_pipe_error);
#line 445 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_key_request(uint8_t *buffer_in, aci_evt_params_key_request_t *p_evt_params_key_request);
#line 454 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
uint8_t acil_decode_evt_echo(uint8_t *buffer_in, aci_evt_params_echo_t *buffer_out);
#line 463 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
 _Bool  acil_decode_evt(uint8_t *buffer_in, aci_evt_t *p_aci_evt);
#line 472 "c:/users/viktor/desktop/ble_blog_release/include/acilib_if.h"
void acil_decode_evt_display_passkey(uint8_t *buffer_in, aci_evt_params_display_passkey_t *p_aci_evt_params_display_passkey);
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/acilib_types.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 45 "C:/Users/Viktor/Desktop/ble_blog_release/src/acilib.c"
void acil_encode_cmd_set_test_mode(uint8_t *buffer, aci_cmd_params_test_t *p_aci_cmd_params_test)
{
 *(buffer +  0 ) = 2;
 *(buffer +  1 ) = ACI_CMD_TEST;
 *(buffer +  2  +  0 ) = p_aci_cmd_params_test->test_mode_change;
}

void acil_encode_cmd_sleep(uint8_t *buffer)
{
 *(buffer +  0 ) = 1;
 *(buffer +  1 ) = ACI_CMD_SLEEP;
}

void acil_encode_cmd_get_device_version(uint8_t *buffer)
{
 *(buffer +  0 ) = 1;
 *(buffer +  1 ) = ACI_CMD_GET_DEVICE_VERSION;
}

void acil_encode_cmd_set_local_data(uint8_t *buffer, aci_cmd_params_set_local_data_t *p_aci_cmd_params_set_local_data, uint8_t data_size)
{
 *(buffer +  0 ) =  2  + data_size;
 *(buffer +  1 ) = ACI_CMD_SET_LOCAL_DATA;
 *(buffer +  2  +  0  +  0 ) = p_aci_cmd_params_set_local_data->tx_data.pipe_number;
 memcpy(buffer +  2  +  0  +  1 , &(p_aci_cmd_params_set_local_data->tx_data.aci_data[0]), data_size);
}

void acil_encode_cmd_connect(uint8_t *buffer, aci_cmd_params_connect_t *p_aci_cmd_params_connect)
{
 *(buffer +  0 ) =  5 ;
 *(buffer +  1 ) = ACI_CMD_CONNECT;
 *(buffer +  2  +  1 ) = (uint8_t)(p_aci_cmd_params_connect->timeout >> 8);
 *(buffer +  2  +  0 ) = (uint8_t)(p_aci_cmd_params_connect->timeout);
 *(buffer +  2  +  3 ) = (uint8_t)(p_aci_cmd_params_connect->adv_interval >> 8);
 *(buffer +  2  +  2 ) = (uint8_t)(p_aci_cmd_params_connect->adv_interval);
}

void acil_encode_cmd_bond(uint8_t *buffer, aci_cmd_params_bond_t *p_aci_cmd_params_bond)
{
 *(buffer +  0 ) =  5 ;
 *(buffer +  1 ) = ACI_CMD_BOND;
 *(buffer +  2  +  1 ) = (uint8_t)(p_aci_cmd_params_bond->timeout >> 8);
 *(buffer +  2  +  0 ) = (uint8_t)(p_aci_cmd_params_bond->timeout);
 *(buffer +  2  +  3 ) = (uint8_t)(p_aci_cmd_params_bond->adv_interval >> 8);
 *(buffer +  2  +  2 ) = (uint8_t)(p_aci_cmd_params_bond->adv_interval);
}

void acil_encode_cmd_disconnect(uint8_t *buffer, aci_cmd_params_disconnect_t *p_aci_cmd_params_disconnect)
{
 *(buffer +  0 ) =  2 ;
 *(buffer +  1 ) = ACI_CMD_DISCONNECT;
 *(buffer +  2  +  0 ) = (uint8_t)(p_aci_cmd_params_disconnect->reason);
}

void acil_encode_baseband_reset(uint8_t *buffer)
{
 *(buffer +  0 ) =  1 ;
 *(buffer +  1 ) = ACI_CMD_RADIO_RESET;
}

void acil_encode_direct_connect(uint8_t *buffer)
{
 *(buffer +  0 ) =  1 ;
 *(buffer +  1 ) = ACI_CMD_CONNECT_DIRECT;
}

void acil_encode_cmd_wakeup(uint8_t *buffer)
{
 *(buffer +  0 ) =  1 ;
 *(buffer +  1 ) = ACI_CMD_WAKEUP;
}

void acil_encode_cmd_set_radio_tx_power(uint8_t *buffer, aci_cmd_params_set_tx_power_t *p_aci_cmd_params_set_tx_power)
{
 *(buffer +  0 ) =  2 ;
 *(buffer +  1 ) = ACI_CMD_SET_TX_POWER;
 *(buffer +  2  +  0 ) = (uint8_t)p_aci_cmd_params_set_tx_power->device_power;
}

void acil_encode_cmd_get_address(uint8_t *buffer)
{
 *(buffer +  0 ) =  1 ;
 *(buffer +  1 ) = ACI_CMD_GET_DEVICE_ADDRESS;
}

void acil_encode_cmd_send_data(uint8_t *buffer, aci_cmd_params_send_data_t *p_aci_cmd_params_send_data_t, uint8_t data_size)
{
 *(buffer +  0 ) =  2  + data_size;
 *(buffer +  1 ) = ACI_CMD_SEND_DATA;
 *(buffer +  2  +  0  +  0 ) = p_aci_cmd_params_send_data_t->tx_data.pipe_number;
 memcpy((buffer +  2  +  0  +  1 ), &(p_aci_cmd_params_send_data_t->tx_data.aci_data[0]), data_size);
}

void acil_encode_cmd_request_data(uint8_t *buffer, aci_cmd_params_request_data_t *p_aci_cmd_params_request_data)
{
 *(buffer +  0 ) =  2 ;
 *(buffer +  1 ) = ACI_CMD_REQUEST_DATA;
 *(buffer +  2  +  0 ) = p_aci_cmd_params_request_data->pipe_number;
}

void acil_encode_cmd_open_remote_pipe(uint8_t *buffer, aci_cmd_params_open_remote_pipe_t *p_aci_cmd_params_open_remote_pipe)
{
 *(buffer +  0 ) =  2 ;
 *(buffer +  1 ) = ACI_CMD_OPEN_REMOTE_PIPE;
 *(buffer +  2  +  0 ) = p_aci_cmd_params_open_remote_pipe->pipe_number;
}

void acil_encode_cmd_close_remote_pipe(uint8_t *buffer, aci_cmd_params_close_remote_pipe_t *p_aci_cmd_params_close_remote_pipe)
{
 *(buffer +  0 ) =  2 ;
 *(buffer +  1 ) = ACI_CMD_CLOSE_REMOTE_PIPE;
 *(buffer +  2  +  0 ) = p_aci_cmd_params_close_remote_pipe->pipe_number;
}

void acil_encode_cmd_echo_msg(uint8_t *buffer, aci_cmd_params_echo_t *p_cmd_params_echo, uint8_t msg_size)
{
 *(buffer +  0 ) =  1  + msg_size;
 *(buffer +  1 ) = ACI_CMD_ECHO;
 memcpy((buffer +  2  +  0 ), &(p_cmd_params_echo->echo_data[0]), msg_size);
}

void acil_encode_cmd_battery_level(uint8_t *buffer)
{
 *(buffer +  0 ) = 1;
 *(buffer +  1 ) = ACI_CMD_GET_BATTERY_LEVEL;
}

void acil_encode_cmd_temparature(uint8_t *buffer)
{
 *(buffer +  0 ) = 1;
 *(buffer +  1 ) = ACI_CMD_GET_TEMPERATURE;
}

void acil_encode_cmd_read_dynamic_data(uint8_t *buffer)
{
 *(buffer +  0 ) = 1;
 *(buffer +  1 ) = ACI_CMD_READ_DYNAMIC_DATA;
}

void acil_encode_cmd_write_dynamic_data(uint8_t *buffer, uint8_t seq_no, uint8_t* dynamic_data, uint8_t dynamic_data_size)
{
 *(buffer +  0 ) =  2  + dynamic_data_size;
 *(buffer +  1 ) = ACI_CMD_WRITE_DYNAMIC_DATA;
 *(buffer +  2  +  0 ) = seq_no;
 memcpy((buffer +  2  +  1 ), dynamic_data, dynamic_data_size);
}

void acil_encode_cmd_change_timing_req(uint8_t *buffer, aci_cmd_params_change_timing_t *p_aci_cmd_params_change_timing)
{
 *(buffer +  0 ) =  9 ;
 *(buffer +  1 ) = ACI_CMD_CHANGE_TIMING;
 *(buffer +  2  +  0  +  1 ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.min_conn_interval >> 8);
 *(buffer +  2  +  0  +  0 ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.min_conn_interval);
 *(buffer +  2  +  0  +  3 ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.max_conn_interval >> 8);
 *(buffer +  2  +  0  +  2 ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.max_conn_interval);
 *(buffer +  2  +  0  +  5  ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.slave_latency >> 8);
 *(buffer +  2  +  0  +  4  ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.slave_latency);
 *(buffer +  2  +  0  +  7  ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.timeout_mult >> 8);
 *(buffer +  2  +  0  +  6  ) = (uint8_t)(p_aci_cmd_params_change_timing->conn_params.timeout_mult);
}

void acil_encode_cmd_set_app_latency(uint8_t *buffer, aci_cmd_params_set_app_latency_t *p_aci_cmd_params_set_app_latency)
{
 *(buffer +  0 ) =  4 ;
 *(buffer +  1 ) = ACI_CMD_SET_APP_LATENCY;
 *(buffer +  2  +  0 ) = (uint8_t)( p_aci_cmd_params_set_app_latency->mode);
 *(buffer +  2  +  2 ) = (uint8_t)( p_aci_cmd_params_set_app_latency->latency>>8);
 *(buffer +  2  +  1 ) = (uint8_t)( p_aci_cmd_params_set_app_latency->latency);
}

void acil_encode_cmd_change_timing_req_GAP_PPCP(uint8_t *buffer)
{
 *(buffer +  0 ) =  1 ;
 *(buffer +  1 ) = ACI_CMD_CHANGE_TIMING;
}


void acil_encode_cmd_setup(uint8_t *buffer, aci_cmd_params_setup_t *p_aci_cmd_params_setup, uint8_t setup_data_size)
{
 *(buffer +  0 ) = setup_data_size +  1 ;
 *(buffer +  1 ) = ACI_CMD_SETUP;
 memcpy((buffer +  2 ), &(p_aci_cmd_params_setup->setup_data[0]), setup_data_size);
}

void acil_encode_cmd_dtm_cmd(uint8_t *buffer, aci_cmd_params_dtm_cmd_t *p_aci_cmd_params_dtm_cmd)
{
 *(buffer +  0 ) =  3 ;
 *(buffer +  1 ) = ACI_CMD_DTM_CMD;
 *(buffer +  2 ) = p_aci_cmd_params_dtm_cmd->cmd_msb;
 *(buffer +  2  + 1) = p_aci_cmd_params_dtm_cmd->cmd_lsb;
}

void acil_encode_cmd_send_data_ack(uint8_t *buffer, const uint8_t pipe_number )
{
 *(buffer +  0 ) =  2 ;
 *(buffer +  1 ) = ACI_CMD_SEND_DATA_ACK;
 *(buffer +  2  +  0 ) = pipe_number;
}

void acil_encode_cmd_send_data_nack(uint8_t *buffer, const uint8_t pipe_number, const uint8_t err_code )
{
 *(buffer +  0 ) =  3 ;
 *(buffer +  1 ) = ACI_CMD_SEND_DATA_NACK;
 *(buffer +  2  +  0 ) = pipe_number;
 *(buffer +  2  +  1 ) = err_code;
}

void acil_encode_cmd_bond_security_request(uint8_t *buffer)
{
 *(buffer +  0 ) = 1;
 *(buffer +  1 ) = ACI_CMD_BOND_SECURITY_REQUEST;
}

void acil_encode_cmd_broadcast(uint8_t *buffer, aci_cmd_params_broadcast_t * p_aci_cmd_params_broadcast)
{
 *(buffer +  0 ) =  5 ;
 *(buffer +  1 ) = ACI_CMD_BROADCAST;
 *(buffer +  2  +  0 ) = (p_aci_cmd_params_broadcast->timeout & 0xff);
 *(buffer +  2  +  1 ) = (uint8_t)(p_aci_cmd_params_broadcast->timeout >> 8);
 *(buffer +  2  +  2 ) = (p_aci_cmd_params_broadcast->adv_interval & 0xff);
 *(buffer +  2  +  3 ) = (uint8_t)(p_aci_cmd_params_broadcast->adv_interval >> 8);
}

void acil_encode_cmd_open_adv_pipes(uint8_t *buffer, aci_cmd_params_open_adv_pipe_t * p_aci_cmd_params_open_adv_pipe)
{
 *(buffer +  0 ) =  9 ;
 *(buffer +  1 ) = ACI_CMD_OPEN_ADV_PIPE;
 memcpy(buffer +  2  +  0 , p_aci_cmd_params_open_adv_pipe->pipes, 8);
}


void acil_encode_cmd_set_key(uint8_t *buffer, aci_cmd_params_set_key_t *p_aci_cmd_params_set_key)
{
#line 283 "C:/Users/Viktor/Desktop/ble_blog_release/src/acilib.c"
 uint8_t len;

 switch (p_aci_cmd_params_set_key->key_type)
 {
 case ACI_KEY_TYPE_INVALID:
 len =  2 ;
 break;
 case ACI_KEY_TYPE_PASSKEY:
 len =  8 ;
 break;
 default:
 len=0;
 break;
 }
 *(buffer +  0 ) = len;
 *(buffer +  1 ) = ACI_CMD_SET_KEY;
 *(buffer +  2  +  0 ) = p_aci_cmd_params_set_key->key_type;
 memcpy((buffer +  2  +  1 ), (uint8_t * )&(p_aci_cmd_params_set_key->key), len-2);
}

 _Bool  acil_encode_cmd(uint8_t *buffer, aci_cmd_t *p_aci_cmd)
{
  _Bool  ret_val =  0 ;

 switch(p_aci_cmd->cmd_opcode)
 {
 case ACI_CMD_TEST:
 acil_encode_cmd_set_test_mode(buffer, &(p_aci_cmd->params.test));
 break;
 case ACI_CMD_SLEEP:
 acil_encode_cmd_sleep(buffer);
 break;
 case ACI_CMD_GET_DEVICE_VERSION:
 acil_encode_cmd_get_device_version(buffer);
 break;
 case ACI_CMD_WAKEUP:
 acil_encode_cmd_wakeup(buffer);
 break;
 case ACI_CMD_ECHO:
 acil_encode_cmd_echo_msg(buffer, &(p_aci_cmd->params.echo), (p_aci_cmd->len -  1 ));
 break;
 case ACI_CMD_GET_BATTERY_LEVEL:
 acil_encode_cmd_battery_level(buffer);
 break;
 case ACI_CMD_GET_TEMPERATURE:
 acil_encode_cmd_temparature(buffer);
 break;
 case ACI_CMD_GET_DEVICE_ADDRESS:
 acil_encode_cmd_get_address(buffer);
 break;
 case ACI_CMD_SET_TX_POWER:
 acil_encode_cmd_set_radio_tx_power(buffer, &(p_aci_cmd->params.set_tx_power));
 break;
 case ACI_CMD_CONNECT:
 acil_encode_cmd_connect(buffer, &(p_aci_cmd->params.connect));
 break;
 case ACI_CMD_BOND:
 acil_encode_cmd_bond(buffer, &(p_aci_cmd->params.bond));
 break;
 case ACI_CMD_DISCONNECT:
 acil_encode_cmd_disconnect(buffer, &(p_aci_cmd->params.disconnect));
 break;
 case ACI_CMD_RADIO_RESET:
 acil_encode_baseband_reset(buffer);
 break;
 case ACI_CMD_CHANGE_TIMING:
 acil_encode_cmd_change_timing_req(buffer, &(p_aci_cmd->params.change_timing));
 break;
 case ACI_CMD_SETUP:
 acil_encode_cmd_setup(buffer, &(p_aci_cmd->params.setup), (p_aci_cmd->len -  1 ));
 break;
 case ACI_CMD_DTM_CMD:
 acil_encode_cmd_dtm_cmd(buffer, &(p_aci_cmd->params.dtm_cmd));
 break;
 case ACI_CMD_READ_DYNAMIC_DATA:
 acil_encode_cmd_read_dynamic_data(buffer);
 break;
 case ACI_CMD_WRITE_DYNAMIC_DATA:
 acil_encode_cmd_write_dynamic_data(buffer, p_aci_cmd->params.write_dynamic_data.seq_no, &(p_aci_cmd->params.write_dynamic_data.dynamic_data[0]), (p_aci_cmd->len -  2 ));
 break;
 case ACI_CMD_OPEN_REMOTE_PIPE:
 acil_encode_cmd_open_remote_pipe(buffer, &(p_aci_cmd->params.open_remote_pipe));
 break;
 case ACI_CMD_SEND_DATA:
 acil_encode_cmd_send_data(buffer, &(p_aci_cmd->params.send_data), (p_aci_cmd->len -  2 ));
 break;
 case ACI_CMD_SEND_DATA_ACK:
 acil_encode_cmd_send_data_ack(buffer, p_aci_cmd->params.send_data_ack.pipe_number );
 break;
 case ACI_CMD_REQUEST_DATA:
 acil_encode_cmd_request_data(buffer, &(p_aci_cmd->params.request_data));
 break;
 case ACI_CMD_SET_LOCAL_DATA:
 acil_encode_cmd_set_local_data(buffer, (aci_cmd_params_set_local_data_t *)(&(p_aci_cmd->params.send_data)), (p_aci_cmd->len -  2 ));
 break;
 case ACI_CMD_BOND_SECURITY_REQUEST:
 acil_encode_cmd_bond_security_request(buffer);
 break;
 default:
 break;
 }
 return ret_val;
}

void acil_decode_evt_command_response(uint8_t *buffer_in, aci_evt_params_cmd_rsp_t *p_evt_params_cmd_rsp)
{
 aci_evt_cmd_rsp_params_get_device_version_t *p_device_version;
 aci_evt_cmd_rsp_params_get_device_address_t *p_device_address;
 aci_evt_cmd_rsp_params_get_temperature_t *p_temperature;
 aci_evt_cmd_rsp_params_get_battery_level_t *p_batt_lvl;
 aci_evt_cmd_rsp_read_dynamic_data_t *p_read_dyn_data;
 aci_evt_cmd_rsp_params_dtm_cmd_t *p_dtm_evt;

 p_evt_params_cmd_rsp->cmd_opcode = (aci_cmd_opcode_t)*(buffer_in +  2  +  0 );
 p_evt_params_cmd_rsp->cmd_status = (aci_status_code_t)*(buffer_in +  2  +  1 );

 switch (p_evt_params_cmd_rsp->cmd_opcode)
 {
 case ACI_CMD_GET_DEVICE_VERSION:
 p_device_version = &(p_evt_params_cmd_rsp->params.get_device_version);
 p_device_version->configuration_id = (uint16_t)*(buffer_in +  2  +  2  +  0 );
 p_device_version->configuration_id |= (uint16_t)*(buffer_in +  2  +  2  +  1 ) << 8;
 p_device_version->aci_version = *(buffer_in +  2  +  2  +  2 );
 p_device_version->setup_format = *(buffer_in +  2  +  2  +  3 );
 p_device_version->setup_id = (uint32_t)*(buffer_in +  2  +  2  +  4 );
 p_device_version->setup_id |= (uint32_t)*(buffer_in +  2  +  2  +  5 ) << 8;
 p_device_version->setup_id |= (uint32_t)*(buffer_in +  2  +  2  +  6 ) << 16;
 p_device_version->setup_id |= (uint32_t)*(buffer_in +  2  +  2  +  7 ) << 24;
 p_device_version->setup_status = *(buffer_in +  2  +  2  +  8 );
 break;

 case ACI_CMD_GET_DEVICE_ADDRESS:
 p_device_address = &(p_evt_params_cmd_rsp->params.get_device_address);
 memcpy((uint8_t *)(p_device_address->bd_addr_own), (buffer_in +  2 + 2 + 0 ),  (6) );
 p_device_address->bd_addr_type = (aci_bd_addr_type_t) *(buffer_in +  2 + 2 + 6 );
 break;

 case ACI_CMD_GET_TEMPERATURE:
 p_temperature = &(p_evt_params_cmd_rsp->params.get_temperature);
 p_temperature->temperature_value = (int16_t)*(buffer_in +  2  +  2  +  0 );
 p_temperature->temperature_value |= (int16_t)*(buffer_in +  2  +  2  +  1 ) << 8;
 break;

 case ACI_CMD_GET_BATTERY_LEVEL:
 p_batt_lvl = &(p_evt_params_cmd_rsp->params.get_battery_level);
 p_batt_lvl->battery_level = (int16_t)*(buffer_in +  2  +  2  +  0 );
 p_batt_lvl->battery_level |= (int16_t)*(buffer_in +  2  +  2  +  1 ) << 8;
 break;

 case ACI_CMD_READ_DYNAMIC_DATA:
 p_read_dyn_data = &(p_evt_params_cmd_rsp->params.read_dynamic_data);
 p_read_dyn_data->seq_no = (uint8_t)*(buffer_in +  2  +  2  +  0 );
 memcpy((uint8_t *)(p_read_dyn_data->dynamic_data), (buffer_in +  2  +  2  +  1 ),  (*(buffer_in + 0 ))  - 3);

 break;

 case ACI_CMD_DTM_CMD:
 p_dtm_evt = &(p_evt_params_cmd_rsp->params.dtm_cmd);
 p_dtm_evt->evt_msb = (uint8_t)*(buffer_in +  2  +  2  +  0 );
 p_dtm_evt->evt_lsb = (uint8_t)*(buffer_in +  2  +  2  +  1 );
 break;
 }
}

void acil_decode_evt_device_started(uint8_t *buffer_in, aci_evt_params_device_started_t *p_evt_params_device_started)
{
 p_evt_params_device_started->device_mode = (aci_device_operation_mode_t) *(buffer_in +  2 + 0 );
 p_evt_params_device_started->hw_error = (aci_hw_error_t) *(buffer_in +  2 + 1 );
 p_evt_params_device_started->credit_available = *(buffer_in +  2 + 2 );
}

void acil_decode_evt_pipe_status(uint8_t *buffer_in, aci_evt_params_pipe_status_t *p_aci_evt_params_pipe_status)
{
 memcpy((uint8_t *)p_aci_evt_params_pipe_status->pipes_open_bitmap, (buffer_in +  2  +  0 ), 8);
 memcpy((uint8_t *)p_aci_evt_params_pipe_status->pipes_closed_bitmap, (buffer_in +  2  +  8 ), 8);
}

void acil_decode_evt_disconnected(uint8_t *buffer_in, aci_evt_params_disconnected_t *p_aci_evt_params_disconnected)
{
 p_aci_evt_params_disconnected->aci_status = (aci_status_code_t)*(buffer_in +  2  +  0 );
 p_aci_evt_params_disconnected->btle_status = *(buffer_in +  2  +  1 );
}

void acil_decode_evt_bond_status(uint8_t *buffer_in, aci_evt_params_bond_status_t *p_aci_evt_params_bond_status)
{
 p_aci_evt_params_bond_status->status_code = (aci_bond_status_code_t)*(buffer_in +  2  +  0 );
 p_aci_evt_params_bond_status->status_source = (aci_bond_status_source_t)*(buffer_in +  2  +  1 );
 p_aci_evt_params_bond_status->secmode1_bitmap = *(buffer_in +  2  +  2 );
 p_aci_evt_params_bond_status->secmode2_bitmap = *(buffer_in +  2  +  3 );
 p_aci_evt_params_bond_status->keys_exchanged_slave = *(buffer_in +  2  +  4 );
 p_aci_evt_params_bond_status->keys_exchanged_master = *(buffer_in +  2  +  5 );
}

uint8_t acil_decode_evt_data_received(uint8_t *buffer_in, aci_evt_params_data_received_t *p_evt_params_data_received)
{
 uint8_t size = *( buffer_in +  0 ) - ( 2  +  1 ) + 1 ;
 p_evt_params_data_received->rx_data.pipe_number = *(buffer_in +  2  +  0 );
 memcpy((uint8_t *)p_evt_params_data_received->rx_data.aci_data, (buffer_in +  2  +  1 ), size);
 return size;
}

void acil_decode_evt_data_ack(uint8_t *buffer_in, aci_evt_params_data_ack_t *p_evt_params_data_ack)
{
 p_evt_params_data_ack->pipe_number = *(buffer_in +  2  +  0 );
}

uint8_t acil_decode_evt_hw_error(uint8_t *buffer_in, aci_evt_params_hw_error_t *p_aci_evt_params_hw_error)
{
 uint8_t size = *(buffer_in +  0 ) - ( 2  +  2 ) + 1;
 p_aci_evt_params_hw_error->line_num = (uint16_t)(*(buffer_in +  2  +  1 )) << 8;
 p_aci_evt_params_hw_error->line_num |= (uint16_t)*(buffer_in +  2  +  0 );
 memcpy((uint8_t *)p_aci_evt_params_hw_error->file_name, (buffer_in +  2  +  2 ), size);
 return size;
}

void acil_decode_evt_credit(uint8_t *buffer_in, aci_evt_params_data_credit_t *p_evt_params_data_credit)
{
 p_evt_params_data_credit->credit = *(buffer_in +  2  +  0 );
}

void acil_decode_evt_connected(uint8_t *buffer_in, aci_evt_params_connected_t *p_aci_evt_params_connected)
{
 p_aci_evt_params_connected->dev_addr_type = (aci_bd_addr_type_t)*(buffer_in +  2  +  0 );
 memcpy(&(p_aci_evt_params_connected->dev_addr[0]), (buffer_in +  2  +  1 ),  (6) );
 p_aci_evt_params_connected->conn_rf_interval = (uint16_t)*(buffer_in +  2  +  8 ) << 8;
 p_aci_evt_params_connected->conn_rf_interval |= (uint16_t)*(buffer_in +  2  +  7 );
 p_aci_evt_params_connected->conn_slave_rf_latency = (uint16_t)*(buffer_in +  2  +  10 ) << 8;
 p_aci_evt_params_connected->conn_slave_rf_latency |= (uint16_t)*(buffer_in +  2  +  9 );
 p_aci_evt_params_connected->conn_rf_timeout = (uint16_t)*(buffer_in +  2  +  12 ) << 8;
 p_aci_evt_params_connected->conn_rf_timeout |= (uint16_t)*(buffer_in +  2  +  11 );
 p_aci_evt_params_connected->master_clock_accuracy = (aci_clock_accuracy_t)*(buffer_in +  2  +  13 );

}

void acil_decode_evt_timing(uint8_t *buffer_in, aci_evt_params_timing_t *p_evt_params_timing)
{
 p_evt_params_timing->conn_rf_interval = *(buffer_in +  2  +  1 ) << 8;
 p_evt_params_timing->conn_rf_interval |= (uint16_t)*(buffer_in +  2  +  0 );
 p_evt_params_timing->conn_slave_rf_latency = (uint16_t)*(buffer_in +  2  +  3 ) << 8;
 p_evt_params_timing->conn_slave_rf_latency |= (uint16_t)*(buffer_in +  2  +  2 );
 p_evt_params_timing->conn_rf_timeout = (uint16_t)*(buffer_in +  2  +  5 ) << 8;
 p_evt_params_timing->conn_rf_timeout |= *(buffer_in +  2  +  4 );
}

void acil_decode_evt_pipe_error(uint8_t *buffer_in, aci_evt_params_pipe_error_t *p_evt_params_pipe_error)
{

 p_evt_params_pipe_error->pipe_number = *(buffer_in +  2  +  0 );
 p_evt_params_pipe_error->error_code = *(buffer_in +  2  +  1 );
 p_evt_params_pipe_error->params.error_data.content[0] = *(buffer_in +  2  +  2  +  0 );
}

void acil_decode_evt_key_request(uint8_t *buffer_in, aci_evt_params_key_request_t *p_evt_params_key_request)
{
 p_evt_params_key_request->key_type = (aci_key_type_t)*(buffer_in +  2  +  0 );
}

uint8_t acil_decode_evt_echo(uint8_t *buffer_in, aci_evt_params_echo_t *aci_evt_params_echo)
{
 uint8_t size = *(buffer_in +  0 ) - 1;
 memcpy(&aci_evt_params_echo->echo_data[0], (buffer_in +  1  + 1), size);
 return size;
}

void acil_decode_evt_display_passkey(uint8_t *buffer_in, aci_evt_params_display_passkey_t *p_aci_evt_params_display_passkey)
{
 p_aci_evt_params_display_passkey->passkey[0] = *(buffer_in +  2  +  0  + 0);
 p_aci_evt_params_display_passkey->passkey[1] = *(buffer_in +  2  +  0  + 1);
 p_aci_evt_params_display_passkey->passkey[2] = *(buffer_in +  2  +  0  + 2);
 p_aci_evt_params_display_passkey->passkey[3] = *(buffer_in +  2  +  0  + 3);
 p_aci_evt_params_display_passkey->passkey[4] = *(buffer_in +  2  +  0  + 4);
 p_aci_evt_params_display_passkey->passkey[5] = *(buffer_in +  2  +  0  + 5);
}

 _Bool  acil_decode_evt(uint8_t *buffer_in, aci_evt_t *p_aci_evt)
{
  _Bool  ret_val =  1 ;

 p_aci_evt->len =  (*(buffer_in + 0 )) ;
 p_aci_evt->evt_opcode = (aci_evt_opcode_t) (*(buffer_in + 1 )) ;

 switch(p_aci_evt->evt_opcode)
 {
 case ACI_EVT_DEVICE_STARTED:
 acil_decode_evt_device_started(buffer_in, &(p_aci_evt->params.device_started));
 break;
 case ACI_EVT_HW_ERROR:
 acil_decode_evt_hw_error(buffer_in, &(p_aci_evt->params.hw_error));
 break;
 case ACI_EVT_CMD_RSP:
 acil_decode_evt_command_response(buffer_in, &(p_aci_evt->params.cmd_rsp));
 break;
 case ACI_EVT_DATA_CREDIT:
 acil_decode_evt_credit(buffer_in, &(p_aci_evt->params.data_credit));
 break;
 case ACI_EVT_CONNECTED:
 acil_decode_evt_connected(buffer_in, &(p_aci_evt->params.connected));
 break;
 case ACI_EVT_PIPE_STATUS:
 acil_decode_evt_pipe_status(buffer_in, &(p_aci_evt->params.pipe_status));
 break;
 case ACI_EVT_DISCONNECTED:
 acil_decode_evt_disconnected(buffer_in, &(p_aci_evt->params.disconnected));
 break;
 case ACI_EVT_BOND_STATUS:
 acil_decode_evt_bond_status(buffer_in, &(p_aci_evt->params.bond_status));
 break;
 case ACI_EVT_TIMING:
 acil_decode_evt_timing(buffer_in, &(p_aci_evt->params.timing));
 break;
 case ACI_EVT_DATA_ACK:
 acil_decode_evt_data_ack(buffer_in, &(p_aci_evt->params.data_ack));
 break;
 case ACI_EVT_DATA_RECEIVED:
 acil_decode_evt_data_received(buffer_in, &(p_aci_evt->params.data_received));
 break;
 case ACI_EVT_PIPE_ERROR:
 acil_decode_evt_pipe_error(buffer_in, &(p_aci_evt->params.pipe_error));
 break;
 case ACI_EVT_KEY_REQUEST:
 acil_decode_evt_key_request(buffer_in, &(p_aci_evt->params.key_request));
 break;
 case ACI_EVT_DISPLAY_PASSKEY:
 acil_decode_evt_display_passkey(buffer_in, &(p_aci_evt->params.display_passkey));
 break;
 default:
 ret_val =  0 ;
 break;
 }
 return ret_val;
}
