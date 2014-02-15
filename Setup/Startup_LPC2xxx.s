; This module performs ROM/RAM remapping (if required), initializes stack 
; pointers and interrupts for each mode, and finally branches to __main in 
; the C library (which eventually calls main()).
;
; On reset, the ARM core starts up in Supervisor (SVC) mode, in ARM state, 
; with IRQ and FIQ disabled.


        PRESERVE8        
        AREA    Init, CODE, READONLY
; --- ensure no functions that use semihosting SWIs are linked in from the C library
        IMPORT __use_no_semihosting_swi
      
; --- Standard definitions of mode bits and interrupt (I & F) flags in PSRs

Mode_USR    EQU     0x10
Mode_FIQ    EQU     0x11
Mode_IRQ    EQU     0x12
Mode_SVC    EQU     0x13
Mode_ABT    EQU     0x17
Mode_UND    EQU     0x1B
Mode_SYS    EQU     0x1F ; available on ARM Arch 4 and later

I_Bit       EQU     0x80 ; when I bit is set, IRQ is disabled
F_Bit       EQU     0x40 ; when F bit is set, FIQ is disabled

MAMCR       EQU     0xE01FC000    ; MAM Control Register
MAMTIM      EQU     0xE01FC004    ; MAM Timing register

        ENTRY

        EXPORT  Reset_Handler

Reset_Handler
; Execution starts here

; LPC2148 Errata
; Date: August 5, 2005
; Document Release: Version 1.0
; Device Affected: LPC2148
; Incorrect read of data from SRAM after Reset and MAM is not enabled or partially enabled MAM.1
; Init MAM before acsses to SRAM

        ldr     r0,=MAMCR
        ldr     r1,=MAMTIM
        ldr     r2,=0
        str     r2,[r0]
        ldr     r2,=3
        str     r2,[r1]
        ldr     r2,=2
        str     r2,[r0]


; --- Initialize stack pointer registers

; Enter each mode in turn and set up the stack pointer

        IMPORT  ||Image$$CSTACK$$ZI$$Limit||       ; defined in scatter file
        IMPORT  ||Image$$IRQ_STACK$$ZI$$Limit||    ; defined in scatter file

        msr     CPSR_c, #Mode_IRQ:OR:I_Bit:OR:F_Bit ; No interrupts
        ldr     sp, =||Image$$IRQ_STACK$$ZI$$Limit||
        and     sp, sp, #0xFFFFFFF8

        msr     CPSR_c, #Mode_SVC:OR:I_Bit:OR:F_Bit ; No interrupts
        ldr     sp, =||Image$$CSTACK$$ZI$$Limit||
        and     sp, sp, #0xFFFFFFF8

        IMPORT  __main
        IMPORT  __low_level_init

; --- Initialize critical IO devices
        ; Call  __low_level_init
        bl      __low_level_init        

; --- Now enter the C code
        b       __main   ; note use B not BL, because an application will never return this way

        END
        
; ----  EOF --------------------------------------------------------------------
        


