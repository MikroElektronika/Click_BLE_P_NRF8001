_attachInterrupt:
;mikroc_interrupts.c,3 :: 		void attachInterrupt (uint8_t* pin, int a, int b)
;mikroc_interrupts.c,4 :: 		{}
L_end_attachInterrupt:
BX	LR
; end of _attachInterrupt
_detachInterrupt:
;mikroc_interrupts.c,5 :: 		void detachInterrupt (int pin)
;mikroc_interrupts.c,6 :: 		{}
L_end_detachInterrupt:
BX	LR
; end of _detachInterrupt
_noInterrupts:
;mikroc_interrupts.c,7 :: 		void noInterrupts()
;mikroc_interrupts.c,8 :: 		{}
L_end_noInterrupts:
BX	LR
; end of _noInterrupts
_interrupts:
;mikroc_interrupts.c,9 :: 		void interrupts()
;mikroc_interrupts.c,10 :: 		{}
L_end_interrupts:
BX	LR
; end of _interrupts
