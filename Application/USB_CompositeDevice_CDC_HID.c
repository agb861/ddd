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
File    : USB_CompositeDevice_CDC_HID.c
Purpose : Sample showing a USB device with multiple interfaces (CDC+HID).
          The data received from PC over CDC and HID is echoed back.
--------  END-OF-HEADER  ---------------------------------------------
*/

#include <stdio.h>
#include <stdio.h>
#include "USB.h"
#include "USB_CDC.h"
#include "BSP.h"
#include "USB_HID.h"
#include "RTOS.h"

/*********************************************************************
*
*       Defines configurable
*
**********************************************************************
*/
#define INPUT_REPORT_SIZE   64    // Defines the input (device -> host) report size
#define OUTPUT_REPORT_SIZE  64    // Defines the output (Host -> device) report size
#define VENDOR_PAGE_ID      0x12  // Defines the vendor specific page that
                                  // shall be used, allowed values 0x00 - 0xff
                                  // This value must be identical to HOST application
/*********************************************************************
*
*       Const data
*
**********************************************************************
*/

const U8 _aHIDReport[] = {
    0x06, VENDOR_PAGE_ID, 0xFF,    // USAGE_PAGE (Vendor Defined Page 1)
    0x09, 0x01,                    // USAGE (Vendor Usage 1)
    0xa1, 0x01,                    // COLLECTION (Application)
    0x05, 0x06,                    //   USAGE_PAGE (Generic Device)
    0x09, 0x00,                    //   USAGE (Undefined)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x26, 0xFF, 0x00,              //   LOGICAL_MAXIMUM (255)
    0x95, INPUT_REPORT_SIZE,       //   REPORT_COUNT (64)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x81, 0x02,                    //   INPUT (Data,Var,Abs)
    0x05, 0x06,                    //   USAGE_PAGE (Generic Device)
    0x09, 0x00,                    //   USAGE (Undefined)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x26, 0xFF, 0x00,              //   LOGICAL_MAXIMUM (255)
    0x95, OUTPUT_REPORT_SIZE,      //   REPORT_COUNT (64)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x91, 0x02,                    //   OUTPUT (Data,Var,Abs)
    0xc0                           // END_COLLECTION
};

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
// Data for MSD Task
static OS_STACKPTR int      _aHIDStack[512]; /* Task stacks */
static OS_TASK              _HIDTCB;         /* Task-control-blocks */
static char                 _aHIDData[64];

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
*    Adds mouse over human interface device.
*/
static void _AddHID(void) {
  static U8 _abOutBuffer[64];

  USB_HID_INIT_DATA     InitData;
  U8                    Interval = 1;

  memset(&InitData, 0, sizeof(InitData));
  InitData.EPIn    = USB_AddEP(USB_DIR_IN,  USB_TRANSFER_TYPE_INT, Interval, NULL, 0);
  InitData.EPOut   = USB_AddEP(USB_DIR_OUT, USB_TRANSFER_TYPE_INT, Interval, _abOutBuffer, USB_MAX_PACKET_SIZE);
  InitData.pReport = _aHIDReport;
  InitData.NumBytesReport  = sizeof(_aHIDReport);
  USB_HID_Add(&InitData);
}
/*********************************************************************
*
*       _HIDTask
*
*  Function description
*    Task to make the mouse jump from left to right.
*/
static void _HIDTask(void) {
  //
  // Loop: Receive data byte by byte, send back (data + 1)
  //
  while (1) {
    //
    // Wait for configuration
    //
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(1);
      USB_OS_Delay(50);
    }
    BSP_SetLED(1);
    USB_HID_Read(&_aHIDData[0], OUTPUT_REPORT_SIZE);
    _aHIDData[0]++;
    USB_HID_Write(&_aHIDData[0], INPUT_REPORT_SIZE);
    USB_OS_Delay(50);
  }
}

/*********************************************************************
*
*       _OnLineCoding
*
*  Function description
*    Called whenever a "SetLineCoding" Packet has been received
*
*  Notes
*    (1) Context
*        This function is called directly from an ISR in most cases.
*/
static void _OnLineCoding(USB_CDC_LINE_CODING * pLineCoding) {
  ;
}

/*********************************************************************
*
*       _AddCDC
*
*  Function description
*    Add communication device class to USB stack
*/
static void _AddCDC(void) {
  static U8 _abOutBuffer[USB_MAX_PACKET_SIZE];
  USB_CDC_INIT_DATA     InitData;

  InitData.EPIn  = USB_AddEP(USB_DIR_IN,  USB_TRANSFER_TYPE_BULK, 0, NULL, 0);
  InitData.EPOut = USB_AddEP(USB_DIR_OUT, USB_TRANSFER_TYPE_BULK, 0, _abOutBuffer, USB_MAX_PACKET_SIZE);
  InitData.EPInt = USB_AddEP(USB_DIR_IN,  USB_TRANSFER_TYPE_INT,  8,  NULL, 0);
  USB_CDC_Add(&InitData);
  USB_CDC_SetOnLineCoding(_OnLineCoding);
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
*       USB_GetVendorName
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
*    Returns the product Id
*/
U16 USB_GetProductId(void) {
  return 0x1119;
}

/*********************************************************************
*
*       USB_GetVendorName
*
*  Function description
*    Returns vendor name.
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
  return "HID/CDC Composite device";
}

/*********************************************************************
*
*       USB_GetSerialNumber
*
*  Function description
*    Returns serial number
*/
const char * USB_GetSerialNumber(void) {
  return "1234567890ABCDEF";
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
  USB_EnableIAD();
  _AddCDC();
  _AddHID();
  USB_Start();
  BSP_SetLED(0);
  OS_CREATETASK(&_HIDTCB,  "HIDTask",  _HIDTask, 200, _aHIDStack);

  while (1) {
    char ac[64];
    int  NumBytesReceived;

    //
    // Wait for configuration
    //
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(0);
      USB_OS_Delay(50);
    }
    BSP_SetLED(0);
    NumBytesReceived = USB_CDC_Receive(&ac[0], sizeof(ac));
    if (NumBytesReceived > 0) {
      USB_CDC_Write(&ac[0], NumBytesReceived);
    }
  }
}

/**************************** end of file ***************************/

