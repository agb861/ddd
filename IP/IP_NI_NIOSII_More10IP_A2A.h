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
File        : IP_Config_NIOSII_More10IP_A2A.h
Purpose     : Driver specific header file for MoreThanIP A2A bridge
---------------------------END-OF-HEADER------------------------------
*/

#ifndef IP_DRIVER_NIOSII_MORE10IP_A2A_H  // Avoid multiple inclusion
#define IP_DRIVER_NIOSII_MORE10IP_A2A_H

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif


/*********************************************************************
*
*       Public data
*
**********************************************************************
*/

extern const IP_HW_DRIVER IP_Driver_NIOSII_More10IP_A2A;

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

void IP_NI_NIOSII_More10IP_A2A_ConfigBaseAddr (unsigned Unit, void* pBaseCtrl, void* pBaseFIFO, unsigned IrqNumber);

/********************************************************************/

#endif  // Avoid multiple inclusion

/*************************** End of file ****************************/
