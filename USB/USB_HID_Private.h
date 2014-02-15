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
File    : USB_HID_Private.h
Purpose : Private HID header
--------  END-OF-HEADER  ---------------------------------------------
*/

#ifndef USB_HID_PRIVATE_H
#define USB_HID_PRIVATE_H

#include "USB_HID.h"

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

/*********************************************************************
*
*       defines, fixed
*/

#if USB_HID_DEBUG_LEVEL == 2
  #define USB_HID_DPRINT(_s) printf _s  /* Debug output */
  #define USB_HID_DERROR(_s) printf _s  /* Error output */
#elif USB_HID_DEBUG_LEVEL == 1
  #define USB_HID_DPRINT(_s)
  #define USB_HID_DERROR(_s) printf _s  /* Error output */
#else
  #define USB_HID_DPRINT(_s)
  #define USB_HID_DERROR(_s)
#endif

#if defined(__cplusplus)
  }              /* Make sure we have C-declarations in C++ programs */
#endif

#endif                 /* Avoid multiple inclusion */

/**************************** end of file ***************************/
