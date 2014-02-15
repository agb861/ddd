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
File    : USB_BULK_Echo1_Timed.c
Purpose : USB BULK sample showing a simply 1-byte echo server.
--------  END-OF-HEADER  ---------------------------------------------
*/

#include <stdlib.h>
#include "USB.h"
#include "BSP.h"

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _AddBULK
*
*  Function description
*    Add generic USB BULK interface to USB stack
*/
static void _AddBULK(void) {
  static U8 _abOutBuffer[USB_MAX_PACKET_SIZE];
  USB_BULK_INIT_DATA    InitData;

  InitData.EPIn  = USB_AddEP(1, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, NULL, 0);
  InitData.EPOut = USB_AddEP(0, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, _abOutBuffer, USB_MAX_PACKET_SIZE);
  USB_BULK_Add(&InitData);
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
  return 0x1234;
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
  return "Bulk device";
}

/*********************************************************************
*
*       USB_GetSerialNumber
*
*  Function description
*    Returns serial number
*/
const char * USB_GetSerialNumber(void) {
  return "13245678";
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
  int r;

  USB_Init();
  _AddBULK();
  USB_Start();
  //
  // Loop: Receive data byte by byte, send back (data + 1)
  //
  while (1) {
    char c;

    //
    // Wait for configuration
    //
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(0);
      USB_OS_Delay(50);
    }
    BSP_SetLED(0);  // LED on to indicate we are waiting for data
    r = USB_BULK_ReadTimed(&c, 1, 1000);
    BSP_ClrLED(0);
    if (r != 0) {   // If we have received data, send data+1 back to the host
      c++;
      USB_BULK_WriteTimed(&c, 1, 1000);
    }
  }
}
