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
File    : USB_EchoFast.c
Purpose : Fast echo server to test the stack
--------  END-OF-HEADER  ---------------------------------------------
*/

#include "USB.h"
#include "BSP.h"
#include "SEGGER.h"
#include <stdio.h>

/*********************************************************************
*
*       defines, configurable
*
**********************************************************************
*/
#define CMD_ECHO_BULK         0x01


/*********************************************************************
*
*       static data
*
**********************************************************************
*/
static U8  _acBuffer[0x400];

/*********************************************************************
*
*       static code
*
**********************************************************************
*/


/*********************************************************************
*
*       _LoadU16LE
*
*  Function description:
*    Reads a 16 bit little endian from a char array.
*
*  Parameters:
*    pBuffer     - Pointer to a char array.
*
*  Return value:
*    The value as U16 data type
*
*  Notes
*    (1) This cast should not be necessary, but on some compilers (NC30)
*        it is required in higher opt. levels since otherwise the
*        argument promotion to integer size is skipped, leading to wrong result of 0.
*
*/
static U16 _LoadU16LE(const U8 *pBuffer) {
  U16 r;
  r = (U16)(*pBuffer | ((unsigned)*(pBuffer + 1) << 8));
  return r;
}

/*********************************************************************
*
*       _ExecEchoBulk
*
* Function description
*   Execute the echo bulk command.
*/
static void _ExecEchoBulk(void) {
  U16 NumBytes;
  U16 NumBytesAtOnce;


  USB_BULK_Read(&_acBuffer[0], 2);
  NumBytes = _LoadU16LE(&_acBuffer[0]);
  while (NumBytes) {
    NumBytesAtOnce = SEGGER_MIN(NumBytes, sizeof(_acBuffer));
    USB_BULK_Read(_acBuffer,  NumBytesAtOnce);
    USB_BULK_Write(_acBuffer, NumBytesAtOnce);
    NumBytes -= NumBytesAtOnce;
  }
}


/*********************************************************************
*
*       _AddBULK
*
*  Function description
*    Add generic USB BULK interface to USB stack
*/
static void _AddBULK(void) {
  static U8 _abOutBuffer[USB_MAX_PACKET_SIZE*2];
  USB_BULK_INIT_DATA    InitData;

  InitData.EPIn  = USB_AddEP(1, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, NULL, 0);
  InitData.EPOut = USB_AddEP(0, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, _abOutBuffer, USB_MAX_PACKET_SIZE);
  USB_BULK_Add(&InitData);
}



/*********************************************************************
*
*       public code
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
  U8 Cmd = 0;
  USB_Init();
  _AddBULK();
  USB_Start();
  while (1) {
    //
    // Wait for configuration
    //
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(0); // Toggle LED to indicate configuration
      USB_OS_Delay(50);
    }
    BSP_SetLED(0);
    //
    // Receive and handle cmd from host
    //
    if (USB_BULK_Read(&Cmd, 1) == 1) {
      switch (Cmd) {
      case CMD_ECHO_BULK:
        _ExecEchoBulk();
        break;

      }
    }
  }
}

/**************************** end of file ***************************/
