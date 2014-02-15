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

----------------------------------------------------------------------
File    : USB_CDC_Private.h
Purpose : Private MSD header
--------  END-OF-HEADER  ---------------------------------------------
*/

#ifndef CDC_PRIVATE_H
#define CDC_PRIVATE_H

#include "USB_CDC.h"

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

/*********************************************************************
*
*       defines, fixed
*/

#if CDC_DEBUG_LEVEL == 2
  #define CDC_DPRINT(_s) printf _s  /* Debug output */
  #define CDC_DERROR(_s) printf _s  /* Error output */
#elif CDC_DEBUG_LEVEL == 1
  #define CDC_DPRINT(_s)
  #define CDC_DERROR(_s) printf _s  /* Error output */
#else
  #define CDC_DPRINT(_s)
  #define CDC_DERROR(_s)
#endif

#if defined(__cplusplus)
  }              /* Make sure we have C-declarations in C++ programs */
#endif

#endif                 /* Avoid multiple inclusion */

/**************************** end of file ***************************/
