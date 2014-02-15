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
File    : USB_HID_Mouse.c
Purpose : Demonstrates usage of the HID component of the USB stack as mouse.
          Makes the mouse jump left & right.
--------  END-OF-HEADER  ---------------------------------------------
*/


#include <string.h>
#include <stdio.h>
#include "USB.h"
#include "USB_HID.h"
#include "BSP.h"

/*********************************************************************
*
*       Const data
*
**********************************************************************
*/

/*********************************************************************
*
*       _aHIDReport
*
*  This report is generated according to HID spec and
*  HID Usage Tables specifications.
*/
const U8 _aHIDReport[] = {
  USB_HID_GLOBAL_USAGE_PAGE + 1, USB_HID_USAGE_PAGE_GENERIC_DESKTOP,
  USB_HID_LOCAL_USAGE + 1, USB_HID_USAGE_MOUSE,
  USB_HID_MAIN_COLLECTION + 1, USB_HID_COLLECTION_APPLICATION,
    USB_HID_LOCAL_USAGE + 1, USB_HID_USAGE_POINTER,
    USB_HID_MAIN_COLLECTION + 1, USB_HID_COLLECTION_PHYSICAL,
      USB_HID_GLOBAL_USAGE_PAGE + 1, USB_HID_USAGE_PAGE_BUTTON,
      USB_HID_LOCAL_USAGE_MINIMUM + 1, 1,
      USB_HID_LOCAL_USAGE_MAXIMUM + 1, 3,
      USB_HID_GLOBAL_LOGICAL_MINIMUM + 1, 0,
      USB_HID_GLOBAL_LOGICAL_MAXIMUM + 1, 1,
      USB_HID_GLOBAL_REPORT_COUNT + 1, 3,
      USB_HID_GLOBAL_REPORT_SIZE + 1, 1,
      USB_HID_MAIN_INPUT + 1, USB_HID_VARIABLE,  // 3 button bits
      USB_HID_GLOBAL_REPORT_COUNT + 1, 1,
      USB_HID_GLOBAL_REPORT_SIZE + 1, 5,
      USB_HID_MAIN_INPUT + 1, USB_HID_CONSTANT,  // 5 bit padding
      USB_HID_GLOBAL_USAGE_PAGE + 1, USB_HID_USAGE_PAGE_GENERIC_DESKTOP,
      USB_HID_LOCAL_USAGE + 1, USB_HID_USAGE_X,
      USB_HID_LOCAL_USAGE + 1, USB_HID_USAGE_Y,
      USB_HID_GLOBAL_LOGICAL_MINIMUM + 1, (unsigned char) -127,
      USB_HID_GLOBAL_LOGICAL_MAXIMUM + 1, 127,
      USB_HID_GLOBAL_REPORT_SIZE + 1, 8,
      USB_HID_GLOBAL_REPORT_COUNT + 1, 2,
      USB_HID_MAIN_INPUT + 1, USB_HID_VARIABLE | USB_HID_RELATIVE,
    USB_HID_MAIN_ENDCOLLECTION,
  USB_HID_MAIN_ENDCOLLECTION
};

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _AddHID
*
*  Function description
*    Add HID mouse class to USB stack
*/
static void _AddHID(void) {
  USB_HID_INIT_DATA InitData;
  U8                Interval = 10;
  static U8  acBuffer[64];

  memset(&InitData, 0, sizeof(InitData));
  InitData.EPIn    = USB_AddEP(USB_DIR_IN,  USB_TRANSFER_TYPE_INT, Interval, NULL, 0);
  // Note: Next line is optional. EPOut is not required!
  InitData.EPOut    = USB_AddEP(USB_DIR_OUT,  USB_TRANSFER_TYPE_INT, Interval, &acBuffer[0], sizeof(acBuffer));
  InitData.pReport = _aHIDReport;
  InitData.NumBytesReport = sizeof(_aHIDReport);
  USB_HID_Add(&InitData);
}

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

/*********************************************************************
*
*       Get information that are used during enumeration
*/

/*********************************************************************
*
*       USB_GetVendorId
*
*  Function description
*    Returns vendor Id
*/
U16 USB_GetVendorId(void) {
  return 0x8765;
}

/*********************************************************************
*
*       USB_GetProductId
*
*  Function description
*    Returns product Id
*/
U16 USB_GetProductId(void) {
  return 0x1112;     // Should be unique for this sample
}

/*********************************************************************
*
*       USB_GetVendorName
*
*  Function description
*    Returns vendor name
*/
const char * USB_GetVendorName(void) {
  return "Vendor";
}

/*********************************************************************
*
*       USB_GetProductName
*
*  Function description
*    Returns product name
*/
const char * USB_GetProductName(void) {
  return "HID mouse sample";
}

/*********************************************************************
*
*       USB_GetSerialNumber
*
*  Function description
*    Returns serial number
*/
const char * USB_GetSerialNumber(void) {
  return "12345678";
}

/*********************************************************************
*
*       MainTask
*
* USB handling task.
*   Modify to implement the desired protocol
*/
void MainTask(void);
void MainTask(void) {
  USB_Init();
  _AddHID();
  USB_Start();
  while (1) {
    U8 ac[3];

    //
    // Wait for configuration
    //
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(0);
      USB_OS_Delay(50);
    }
    BSP_ClrLED(0);
    memset (ac, 0, sizeof(ac));
ac[1] = 20;   // To the left !
    USB_HID_Write(&ac[0], 3);      // Make sure we send the number of bytes defined in REPORT
    USB_OS_Delay(500);
ac[1] = (U8)-20;  // To the rightt !
    USB_HID_Write(&ac[0], 3);      // Make sure we send the number of bytes defined in REPORT
    USB_OS_Delay(100);
  }
}

/**************************** end of file ***************************/

