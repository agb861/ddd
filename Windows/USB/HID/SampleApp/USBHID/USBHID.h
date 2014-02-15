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
File    : USBHID.h
Purpose : USB HID functions
---------------------------END-OF-HEADER------------------------------
*/
#ifndef _USBHID_H
#define _USBHID_H
 
#if defined(__cplusplus)
  extern "C" {          /* Make sure we have C-declarations in C++ programs */
#endif


/*********************************************************************
*
*       Defines, configurable
*
**********************************************************************
*/
#ifndef   USB_MAX_DEVICES
  #define USB_MAX_DEVICES              32
#endif

/*********************************************************************
*
*       Defines, non configurable
*
**********************************************************************
*/
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
*       USB HID basic functions
*/
void     USBHID_Close    (unsigned Id);
int      USBHID_Open     (unsigned Id);
void     USBHID_Init     (U8 VendorPage);
void     USBHID_Exit     (void);
        
/*********************************************************************
*
*       USB HID direct input/output functions
*/
int      USBHID_Read     (unsigned Id, void       * pBuffer, unsigned NumBytes);
int      USBHID_Write    (unsigned Id, const void * pBuffer, unsigned NumBytes);

/*********************************************************************
*
*       USB HID control functions
*/
unsigned USBHID_GetNumAvailableDevices (U32 * pMask);
int      USBHID_GetProductName         (unsigned Id, char * pBuffer, unsigned NumBytes);
int      USBHID_GetInputReportSize     (unsigned Id);
int      USBHID_GetOutputReportSize    (unsigned Id);
U16      USBHID_GetProductId           (unsigned Id);
U16      USBHID_GetVendorId            (unsigned Id);
void     USBHID_RefreshList            (void);
void     USBHID_SetVendorPage          (U8 Page);


#if defined(__cplusplus)
  }     /* Make sure we have C-declarations in C++ programs */
#endif


#endif

/*************************** End of file ****************************/
