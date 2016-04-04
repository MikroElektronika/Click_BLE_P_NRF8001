#include "stdint.h"
void attachInterrupt (uint8_t* pin, int a, int b);
void detachInterrupt (int pin);
void noInterrupts();
void interrupts();