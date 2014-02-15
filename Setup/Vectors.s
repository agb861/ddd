;;; Copyright ARM Ltd 2001. All rights reserved.

        AREA Vect, CODE, READONLY
        PRESERVE8        

; These are example exception vectors and exception handlers
;
; Where there is ROM fixed at 0x0 (build_b), these are hard-coded at 0x0.
; Where ROM/RAM remapping occurs (build_c), these are copied from ROM to RAM.
; The copying is done automatically by the C library code inside __main.
;
; This version puts a branch to an Interrupt Handler (IRQ_Handler in int_handler.c) 
; in its exception vector table.


; *****************
; Exception Vectors
; *****************

; Note: LDR PC instructions are used here, though branch (B) instructions
; could also be used, unless the ROM is at an address >32MB.

ENTRY
        IMPORT  IRQ_Handler             ; In RTOSVECT.s
        IMPORT  Reset_Handler           ; In init_*.s
        EXPORT __program_start
        EXPORT __vector_end
        
__program_start
        LDR     PC, =Reset_Handler
Undefined_Handler
        LDR     PC, =Undefined_Handler
SWI_Handler
        LDR     PC, =SWI_Handler
Prefetch_Handler        
        LDR     PC, =Prefetch_Handler
Abort_Handler
        LDR     PC, Abort_Handler
        NOP                             ; Reserved vector

        LDR     PC, =IRQ_Handler
FIQ_Handler
        LDR     PC, =FIQ_Handler

        
        LTORG
__vector_end

        END

