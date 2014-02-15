/*********************************************************************
*                SEGGER MICROCONTROLLER GmbH & Co. KG                *
*        Solutions for real time microcontroller applications        *
**********************************************************************
*                                                                    *
*        (c) 2003-2010     SEGGER Microcontroller GmbH & Co KG       *
*                                                                    *
*        Internet: www.segger.com    Support:  support@segger.com    *
*                                                                    *
**********************************************************************

--------  END-OF-HEADER  ---------------------------------------------
*/

#ifndef _IP_CONF_H_
#define _IP_CONF_H_ 1

//
// IAR ARM compiler related macros
//
#ifdef __ICCARM__
  #if ((__TID__ >> 4) & 0x0F) < 6   // For any ARM CPU core < v7, we will use optimized routines
    #include "Util.h"
    #define IP_MEMCPY(pDest, pSrc, NumBytes) ARM_memcpy(pDest, pSrc, NumBytes)    // Speed optimization: Our memcpy is much faster!
    U16 ARM_IP_cksum(void * ptr, unsigned NumHWords);
    #define IP_CKSUM(p, NumItems) ARM_IP_cksum((p), (NumItems))
  #endif
  #define IP_IS_BIG_ENDIAN (1 - __LITTLE_ENDIAN__)
#endif

//
// Change endianess if required, default is IP_IS_BIG_ENDIAN == 0
//
//#define IP_IS_BIG_ENDIAN    1
//#define IP_MEMCPY(pDest, pSrc, NumBytes) UTIL_memcpy(pDest, pSrc, NumBytes)    // Speed optimization: Our memcpy is much faster!

#ifdef DEBUG
  #if DEBUG
    #define IP_DEBUG        2   // Debug level: 1: Support "Panic" checks, 2: Support warn & log
  #endif
#endif

#endif     // Avoid multiple inclusion


