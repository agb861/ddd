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
File    : USB_CDC.h
Purpose : Public header of the communication device class
--------  END-OF-HEADER  ---------------------------------------------
*/

#ifndef CDC_H          /* Avoid multiple inclusion */
#define CDC_H

#include "Global.h"

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif


/*********************************************************************
*
*       Config defaults
*
**********************************************************************
*/

#ifndef   CDC_DEBUG_LEVEL
  #define CDC_DEBUG_LEVEL 0
#endif

#ifndef   CDC_USE_PARA
  #define CDC_USE_PARA(para) para = para
#endif

#define CDC_USB_CLASS     2         // 2: Communication Device Class
#define CDC_USB_SUBCLASS  0x00      //
#define CDC_USB_PROTOCOL  0x00      //


/*********************************************************************
*
*       Types
*
**********************************************************************
*/


typedef struct {
  U32 DTERate;
  U8  CharFormat;
  U8  ParityType;
  U8  DataBits;
} USB_CDC_LINE_CODING;


typedef void USB_CDC_ON_SET_LINE_CODING(USB_CDC_LINE_CODING * pLineCoding);


/*********************************************************************
*
*       Communication interface
*/
typedef struct {
  U8 EPIn;
  U8 EPOut;
  U8 EPInt;
} USB_CDC_INIT_DATA;

/*********************************************************************
*
*       API functions
*
**********************************************************************
*/
void USB_CDC_Add            (const USB_CDC_INIT_DATA * pInitData);
void USB_CDC_CancelRead     (void);
void USB_CDC_CancelWrite    (void);
int  USB_CDC_Read           (      void * pData, unsigned NumBytes);
int  USB_CDC_ReadOverlapped (      void * pData, unsigned NumBytes);
int  USB_CDC_ReadTimed      (      void * pData, unsigned NumBytes, unsigned ms);
int  USB_CDC_Receive        (      void * pData, unsigned NumBytes);
int  USB_CDC_ReceiveTimed   (      void * pData, unsigned NumBytes, unsigned ms);
void USB_CDC_Write          (const void * pData, unsigned NumBytes);
int  USB_CDC_WriteOverlapped(const void * pData, unsigned NumBytes);
int  USB_CDC_WriteTimed     (const void* pData, unsigned NumBytes, unsigned ms);
void USB_CDC_SetOnLineCoding(USB_CDC_ON_SET_LINE_CODING * pf);
void USB_CDC_WaitForTX      (void);
void USB_CDC_WaitForRX      (void);

#if defined(__cplusplus)
  }              /* Make sure we have C-declarations in C++ programs */
#endif

#endif                 /* Avoid multiple inclusion */

/**************************** end of file ***************************/
