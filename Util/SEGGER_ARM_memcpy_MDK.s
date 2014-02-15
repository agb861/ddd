; ********************************************************************
; *                SEGGER MICROCONTROLLER GmbH & Co. KG              *
; *        Solutions for real time microcontroller applications      *
; ********************************************************************
; *                                                                  *
; *      (C) 1996-2008    SEGGER Microcontroller Systeme GmbH        *
; *                                                                  *
; *        Internet: www.segger.com    Support:  support@segger.com  *
; *                                                                  *
; ********************************************************************
;
; --------------------------------------------------------------------
; File        : MDK_ARM_memcpy.s
; Purpose     : Efficient implementation of some time critical routines
; ---------------------------END-OF-HEADER----------------------------

; /*********************************************************************
; *
; *       MDK ARM
; *
; */
        AREA |C$$code|, CODE, READONLY
        PRESERVE8

        EXPORT  ARM_memcpy
        CODE32

; /*********************************************************************
; *
; *       Public code
; *
; **********************************************************************
; */
; /*********************************************************************
; *
; *       ARM_memcpy
; *
; * Function description
; *   Copy data in memory from source address to destination address.
; *
; * Register usage:
; *   R0    pDest
; *   R1    pSrc
; *   R2    NumBytes
; *   R3    Used for data transfers
; *   R4    Used for data transfers
; *   R12   Used for data transfers
; *   R13   SP
; *   R14   LR (contains return address)
; *   R15   PC
; */

; __arm int ARM_memcpy(void* pDest, void* pSrc, U32 NumBytes)
ARM_memcpy
        cmp         R2, #+3
        bls         HandleTrailingBytes         ; If we have less than one complete word, use single byte transfer
        ands        R12, R0, #+3
        beq         DestIsAligned               ; Is destination address already word aligned ?

;
; Handle as much bytes as necessary to align destination address
;
        ldrb        R3,  [R1], #+1              ; We need at least one byte to the next word alignment, so we read one.
        cmp         R12, #+2                    ; Set condition codes according to the mis-alignment
        add         R2,  R2, R12                ; Adjust NumBytes
        ldrbls      R12, [R1], #+1              ; Lower or same (LS)? -> We need one or two bytes to the next word aligned address
        strb        R3,  [R0], #+1
        ldrbcc      R3,  [R1], #+1              ; Carry clear (CC)? -> We need one more byte
        strbls      R12, [R0], #+1
        sub         R2,  R2, #+4                ; Adjust NumBytes
        strbcc      R3,  [R0], #+1

;
; Choose best way to transfer data
;
DestIsAligned
        ands        R3,  R1, #+3
        beq         HandleBulkWordData          ; If source and destination are aligned, use bulk word transfer
        subs        R2,  R2, #+4
        bcc         HandleTrailingBytes         ; If we have less than one complete word left, use single byte transfer
        ldr         R12, [R1, -R3]!             ; Read first mis-aligned data word and word align source address
        cmp         R3,  #+2
        beq         Loop16BitShift
        bhi         Loop24BitShift

;
; Handle data in units of word
;
; This is done by reading mis-aligned words from source address and
; shift them into the right alignment. After this the next data word
; will be read to complete the missing data part.
;
Loop8BitShift
        mov         R3,  R12, LSR #+8           ; Shift data word into right position
        ldr         R12, [R1, #+4]!             ; Load next mis-aligned data word
        subs        R2,  R2, #+4                ; Decrement NumBytes
        orr         R3,  R3, R12, LSL #+24      ; Combine missing part of data to build full data word
        str         R3,  [R0], #+4              ; Store complete word
        bcs         Loop8BitShift
        add         R1,  R1, #+1                ; Adjust source address
        b           HandleTrailingBytes         ; Handle trailing bytes
Loop16BitShift
        mov         R3,  R12, LSR #+16          ; Shift data word into right position
        ldr         R12, [R1,#+4]!              ; Load next mis-aligned data word
        subs        R2,  R2, #+4                ; Decrement NumBytes
        orr         R3,  R3, R12, LSL #+16      ; Combine missing part of data to build full data word
        str         R3,  [R0], #+4              ; Store complete word
        bcs         Loop16BitShift
        add         R1,  R1, #+2                ; Adjust source address
        b           HandleTrailingBytes         ; Handle trailing bytes
Loop24BitShift
        mov         R3,  R12, LSR #+24          ; Shift data word into right position
        ldr         R12, [R1, #+4]!             ; Load next mis-aligned data word
        subs        R2,  R2, #+4                ; Decrement NumBytes
        orr         R3,  R3, R12, LSL #+8       ; Combine missing part of data to build full data word
        str         R3,  [R0], #+4              ; Store complete word
        bcs         Loop24BitShift
        add         R1,  R1, #+3                ; Adjust source address
        b           HandleTrailingBytes         ; Handle trailing bytes

;
; Handle large bulk data in blocks of 8 words (32 bytes)
;
HandleBulkWordData
        subs        R2,  R2, #+0x20
        stmdb       SP!, {R4,LR}
        bcc         HandleTrailingWords
LoopHandleBulkWord
        ldm         R1!, {R3,R4,R12,LR}         ; Transfer 16 bytes at once
        stm         R0!, {R3,R4,R12,LR}
        ldm         R1!, {R3,R4,R12,LR}         ; Transfer 16 bytes at once
        stm         R0!, {R3,R4,R12,LR}
        subs        R2,  R2, #+0x20
        bcs         LoopHandleBulkWord

;
; Handle trailing 7 words
;
HandleTrailingWords
        movs        R12, R2, LSL #28            ; Shift NumBytes left to use C and N flag of CPSR to conditional load/store data
        ldmcs       R1!, {R3,R4,R12,LR}         ; C flag contain bit 4 of NumBytes (transfer 16 bytes if it is set)
        stmcs       R0!, {R3,R4,R12,LR}
        ldmmi       R1!, {R3,R4}                ; N flag contain bit 3 of NumBytes (transfer 8 bytes if it is set)
        stmmi       R0!, {R3,R4}
        movs        R12, R2, LSL #+30           ; Shift NumBytes left to use C and N flag of CPSR to conditional load/store data
        ldmia       SP!, {R4,LR}
        ldrcs       R3,  [R1], #+4              ; C flag contain bit 2 of NumBytes (transfer 4 bytes if it is set)
        strcs       R3,  [R0], #+4
        bxeq        LR

;
; Handle trailing 3 bytes
;
HandleTrailingBytes
        movs        R2,  R2, LSL #+31           ; Shift NumBytes left to use C and N flag of CPSR to conditional load/store data
        ldrbmi      R2,  [R1], #+1              ; N flag contain bit 0 of NumBytes (transfer 1 byte if it is set)
        ldrbcs      R3,  [R1], #+1              ; C flag contain bit 1 of NumBytes (transfer 2 bytes if it is set)
        ldrbcs      R12, [R1], #+1
        strbmi      R2,  [R0], #+1
        strbcs      R3,  [R0], #+1
        strbcs      R12, [R0], #+1
        bx          LR


; ********************************************************************

        END
        
; ***** End Of File **************************************************
