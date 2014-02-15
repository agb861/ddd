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
File    : USB_PrinterClass.c
Purpose : Sample implementation of USB printer device class
----------Literature--------------------------------------------------
Universal Serial Bus Device Class Definition for Printing Devices
Version 1.1 January 2000
--------  END-OF-HEADER  ---------------------------------------------
*/

#include <stdio.h>
#include <string.h>
#include "USB_PrinterClass.h"
#include "BSP.h"


/*********************************************************************
*
*       static data
*
**********************************************************************
*/
static U8 _acData[512];

/*********************************************************************
*
*       static code
*
**********************************************************************
*/


/*********************************************************************
*
*       _GetDeviceIdString
*
*/
static const char * _GetDeviceIdString(void) {
  const char * s = "CLASS:PRINTER;MODEL:HP LaserJet 6MP;MANUFACTURER:Hewlett-Packard;DESCRIPTION:Hewlett-Packard LaserJet 6MP Printer;COMMAND SET:PJL,MLC,PCLXL,PCL,POSTSCRIPT;";
  return s;
}
/*********************************************************************
*
*       _GetHasNoError
*
*/
static U8 _GetHasNoError(void) {
  return 1;
}
/*********************************************************************
*
*       _GetIsSelected
*
*/
static U8 _GetIsSelected(void) {
  return 1;
}

/*********************************************************************
*
*       _GetIsPaperEmpty
*
*/
static U8 _GetIsPaperEmpty(void) {
  return 0;
}

/*********************************************************************
*
*       _OnDataReceived
*
*/
static int _OnDataReceived(const U8 * pData, unsigned NumBytes) {
  memcpy(_acData, pData, NumBytes);
  _acData[NumBytes] = 0;
  printf((const char *)_acData);
  return 0;
}
/*********************************************************************
*
*       _OnReset
*
*/
static void _OnReset(void) {

}

static USB_PRINTER_API _PrinterAPI = {
  _GetDeviceIdString,
  _OnDataReceived,
  _GetHasNoError,
  _GetIsSelected,
  _GetIsPaperEmpty,
  _OnReset
};

/*********************************************************************
*
*       Public code
*
**********************************************************************
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
  return 0x2114;     // Should be unique for this sample
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
  return "Printer";
}

/*********************************************************************
*
*       USB_GetSerialNumber
*
*  Function description
*    Returns serial number
*/
const char * USB_GetSerialNumber(void) {
  return "12345678901234567890";
}


/*********************************************************************
*
*       MainTask
*
* Function description
*   USB handling task.
*   Modify to implement the desired protocol
*/
void MainTask(void);
void MainTask(void) {
  USB_Init();
  USB_PRINTER_Init(&_PrinterAPI);
  USB_Start();
  //
  // Loop: Receive data byte by byte, send back (data + 1)
  //
  while (1) {
    //
    // Wait for configuration
    //
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(0);
      USB_OS_Delay(50);
    }
    USB_PRINTER_Task();
  }
}




/**************************** end of file ***************************/

