#line 1 "C:/Users/Viktor/Desktop/ble_blog_release/src/blep_hal.c"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/blep_hal.h"
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
#line 56 "c:/users/viktor/desktop/ble_blog_release/include/blep_hal.h"
typedef enum
{
 REQN_PIN = 0,
 RDYN_PIN,
 MOSI_PIN,
 MISO_PIN,
 SCK_PIN,
 RESET_PIN,
 ACTIVE_PIN,
 OPTIONAL_CS,
}pin_t;
#line 78 "c:/users/viktor/desktop/ble_blog_release/include/blep_hal.h"
void blep_hal_init();
uint8_t blep_hal_transfer (uint8_t _payload);
void digitalWrite(uint8_t pin, uint8_t mode);
uint8_t digitalRead(uint8_t pin_num);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 38 "C:/Users/Viktor/Desktop/ble_blog_release/src/blep_hal.c"
static void ( *write_spi_p )( unsigned int data_out );
static unsigned int ( *read_spi_p )( unsigned int buffer );
#line 68 "C:/Users/Viktor/Desktop/ble_blog_release/src/blep_hal.c"
extern sfr sbit CS;
extern sfr sbit RDYN;
extern sfr sbit ACT;
extern sfr sbit RST;
#line 83 "C:/Users/Viktor/Desktop/ble_blog_release/src/blep_hal.c"
void blep_hal_init()
{
#line 90 "C:/Users/Viktor/Desktop/ble_blog_release/src/blep_hal.c"
 write_spi_p = SPI_Wr_Ptr;
 read_spi_p = SPI_Rd_Ptr;
#line 104 "C:/Users/Viktor/Desktop/ble_blog_release/src/blep_hal.c"
}

uint8_t blep_hal_transfer (uint8_t _payload)
{

 return read_spi_p(_payload);
}

void digitalWrite (uint8_t pin_num, uint8_t level)
{
 switch ( pin_num)
 {
 case REQN_PIN:
 CS = level;
 break;
 case RDYN_PIN:
 RDYN = level;
 break;
 case RESET_PIN:
 RST = level;
 break;
 case ACTIVE_PIN:
 ACT = level;
 break;
 }
}

uint8_t digitalRead(uint8_t pin_num)
{
 uint8_t temp;
 switch ( pin_num)
 {
 case REQN_PIN:
 temp = (uint8_t)CS;
 break;
 case RDYN_PIN:
 temp = (uint8_t)RDYN;
 break;
 case RESET_PIN:
 temp = (uint8_t)RST;
 break;
 case ACTIVE_PIN:
 temp = (uint8_t)ACT;
 break;
 }
 return temp;
}
