/*********************************************************************
*                SEGGER MICROCONTROLLER GmbH & Co. KG                *
*        Solutions for real time microcontroller applications        *
**********************************************************************
*                                                                    *
*        (c) 2003-2012     SEGGER Microcontroller GmbH & Co KG       *
*                                                                    *
*        Internet: www.segger.com    Support:  support@segger.com    *
*                                                                    *
**********************************************************************

----------------------------------------------------------------------
File    : USBBULK.h
Purpose : USB functions
---------------------------END-OF-HEADER------------------------------
*/
#ifndef _USBBULK_H
#define _USBBULK_H

#if defined(__cplusplus)
  extern "C" {          /* Make sure we have C-declarations in C++ programs */
#endif


/*********************************************************************
*
*       Defines, configurable
*
**********************************************************************
*/
#define USBBULK_BUFFERSIZE            (64*1024)
#ifndef   USB_MAX_DEVICES
  #define USB_MAX_DEVICES              32
#endif

/*********************************************************************
*
*       Defines, non configurable
*
**********************************************************************
*/
#define USBBULK_MODE_BIT_ALLOW_SHORT_READ            (1 << 0)
#define USBBULK_MODE_BIT_ALLOW_SHORT_WRITE           (1 << 1)

#define U8    unsigned char
#define U16   unsigned short
#define U32   unsigned long
#define I8    signed char
#define I16   signed short
#define I32   signed long

/*********************************************************************
*
*       Function prototypes
*
**********************************************************************
*/

/*********************************************************************
*
*       USB-Bulk basic functions
*/
void     USBBULK_Close     (void);
void     USBBULK_CloseEx   (unsigned Id);
void *   USBBULK_Open      (void);
void *   USBBULK_OpenEx    (unsigned Id);
        
/*********************************************************************
*
*       USB-Bulk direct input/output functions
*/
int      USBBULK_Read        (             void       * pBuffer,   int NumBytes);
int      USBBULK_ReadEx      (unsigned Id, void       * pBuffer,   int NumBytes);
int      USBBULK_Write       (             const void * pBuffer,   int NumBytes);
int      USBBULK_WriteEx     (unsigned Id, const void * pBuffer,   int NumBytes);
int      USBBULK_WriteRead   (             const void * pWrBuffer, int WrNumBytes, void *  pRdBuffer, int RdNumBytes);
int      USBBULK_WriteReadEx (unsigned Id, const void * pWrBuffer, int WrNumBytes, void *  pRdBuffer, int RdNumBytes);
void     USBBULK_CancelRead  (void);
void     USBBULK_CancelReadEx(unsigned Id);


/*********************************************************************
*
*       USB-Bulk control functions
*/
unsigned USBBULK_GetDriverCompileDate     (char * s, unsigned Size);
unsigned USBBULK_GetDriverVersion         (void);

unsigned USBBULK_GetNumAvailableDevices   (U32 * pMask);
int      USBBULK_GetConfigDescriptor      (void * pBuffer, int Size);
int      USBBULK_GetConfigDescriptorEx    (unsigned Id, void * pBuffer, int Size);
unsigned USBBULK_GetMode                  (void);
unsigned USBBULK_GetModeEx                (unsigned Id);
unsigned USBBULK_GetReadMaxTransferSize   (void);
unsigned USBBULK_GetReadMaxTransferSizeEx (unsigned Id);
int      USBBULK_GetSN                    (unsigned Id, char * pBuffer, unsigned NumBytes);
unsigned USBBULK_GetWriteMaxTransferSize  (void);
unsigned USBBULK_GetWriteMaxTransferSizeEx(unsigned Id);
int      USBBULK_ResetPipe                (void);
int      USBBULK_ResetPipeEx              (unsigned Id);
int      USBBULK_ResetDevice              (void);
int      USBBULK_ResetDeviceEx            (unsigned Id);
unsigned USBBULK_SetMode                  (unsigned Mode);
unsigned USBBULK_SetModeEx                (unsigned Id, unsigned Mode);
void     USBBULK_SetTimeout               (int    Timeout);
void     USBBULK_SetTimeoutEx             (unsigned Id, int    Timeout);
void     USBBULK_SetUSBId                 (U16 VendorId, U16 ProductId);
U32      USBBULK_GetEnumTickCount         (unsigned Id);

/*********************************************************************
*
*       obsolete functions, types
*
**********************************************************************
*/

/*********************************************************************
*
*       Typedefs
*/

typedef enum {
  UsbResetPipe,
  UsbResetDevice,
  UsbGetConfigDescriptor,
} USBBULK_CONTROL;

/*
 * USBBULK_Control:
 * send request control message to driver.
 * pBuffer & Size are only usefull when Action == UsbGetConfigDescriptor.
 * returned information is a USB_CONFIGURATION_DESCRIPTOR structure
 */
int      USBBULK_Control                (USBBULK_CONTROL Action, void* pBuffer, int Size);




#if defined(__cplusplus)
  }     /* Make sure we have C-declarations in C++ programs */
#endif


#endif

/*************************** End of file ****************************/
