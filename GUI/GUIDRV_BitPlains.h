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
File        : GUIDRV_Bitplains.h
Purpose     : Interface definition for GUIDRV_Bitplains driver
---------------------------END-OF-HEADER------------------------------
*/

#ifndef GUIDRV_Bitplains_H
#define GUIDRV_Bitplains_H

/*********************************************************************
*
*       Configuration structure
*/
typedef struct {
  U8 * apVRAM[8];
} CONFIG_BITPLAINS;

/*********************************************************************
*
*       Display drivers
*/
//
// Addresses
//
extern const GUI_DEVICE_API GUIDRV_Win_API;

extern const GUI_DEVICE_API GUIDRV_BitPlains_API;

//
// Macros to be used in configuration files
//
#if defined(WIN32) && !defined(LCD_SIMCONTROLLER)

  #define GUIDRV_BITPLAINS        &GUIDRV_Win_API

#else

  #define GUIDRV_BITPLAINS        &GUIDRV_BitPlains_API

#endif

#endif

/*************************** End of file ****************************/
