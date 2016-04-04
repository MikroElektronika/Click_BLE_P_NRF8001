#line 1 "C:/Users/Viktor/Desktop/ble_blog_release/src/mikroc_interrupts.c"
#line 1 "c:/users/viktor/desktop/ble_blog_release/include/mikroc_interrupts.h"
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
#line 2 "c:/users/viktor/desktop/ble_blog_release/include/mikroc_interrupts.h"
void attachInterrupt (uint8_t* pin, int a, int b);
void detachInterrupt (int pin);
void noInterrupts();
void interrupts();
#line 3 "C:/Users/Viktor/Desktop/ble_blog_release/src/mikroc_interrupts.c"
void attachInterrupt (uint8_t* pin, int a, int b)
{}
void detachInterrupt (int pin)
{}
void noInterrupts()
{}
void interrupts()
{}
