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
; File    : JLINKDCC_Process_ASM.s
; Purpose : Routines for setting and writing co-processor register CP14 
;           (DCC-communication)
; ---------------------------END-OF-HEADER----------------------------

; /*********************************************************************
; *
; *       MDK ARM
; *
; */
        AREA |C$$code|, CODE, READONLY
        PRESERVE8

        EXPORT  CP14_ReadDCCStat
        EXPORT  CP14_ReadDCC
        EXPORT  CP14_WriteDCC
        CODE32

; /*********************************************************************
; *
; *       Public code
; *
; **********************************************************************
; */

; /*********************************************************************
; *
; *       CP14_ReadDCCStat
; */
CP14_ReadDCCStat
  mrc p14,0,R0,c0,c0
  bx lr


; /*********************************************************************
; *
; *       CP14_ReadDCC
; */
CP14_ReadDCC
  mrc p14,0,R0,c1,c0
  bx lr

; /*********************************************************************
; *
; *       CP14_WriteDCC
; */
CP14_WriteDCC
  mcr p14,0,R0,c1,c0
  bx lr
  
; ********************************************************************

        END
        
; ***** End Of File **************************************************
