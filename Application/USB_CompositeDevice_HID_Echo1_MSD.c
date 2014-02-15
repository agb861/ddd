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
File    : USB_HID_Echo1.c
Purpose : Fast echo server to test the stack
--------  END-OF-HEADER  ---------------------------------------------
*/

#include "USB.h"
#include "USB_MSD.h"
#include "USB_HID.h"
#include "BSP.h"
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
static char _ac[64];
// Data for MSD Task
static OS_STACKPTR int _aMSDStack[512]; /* Task stacks */
static OS_TASK _MSDTCB;               /* Task-control-blocks */

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _AddMSD
*
*  Function description
*    Add mass storage device to USB stack
*/
static void _AddMSD(void) {
  static U8 _abOutBuffer[USB_MAX_PACKET_SIZE];
  USB_MSD_INIT_DATA     InitData;
  USB_MSD_INST_DATA     InstData;

  InitData.EPIn  = USB_AddEP(1, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, NULL, 0);
  InitData.EPOut = USB_AddEP(0, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, _abOutBuffer, USB_MAX_PACKET_SIZE);
  USB_MSD_Add(&InitData);
  //
  // Add logical unit 0: RAM drive, using SDRAM
  //
  memset(&InstData, 0,  sizeof(InstData));
  InstData.pAPI                    = &USB_MSD_StorageByName;
  InstData.DriverData.pStart       = "";
  USB_MSD_AddUnit(&InstData);
}
/*********************************************************************
*
*       _MSDTask
*
*  Function description
*    Add mass storage device to USB stack
*/
static void _MSDTask(void) {
  while (1) {
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      USB_OS_Delay(50);
    }
    USB_MSD_Task();
  }
}

/*********************************************************************
*
*       _AddHID
*
*  Function description
*    Add HID class to USB stack
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
  return 0x4400;     // Should be unique for this sample
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
  return "HID generic sample";
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
*       String information routines when inquiring the volume
*/
/*********************************************************************
*
*       USB_MSD_GetVendorName
*/
const char * USB_MSD_GetVendorName(U8 Lun) {
  return "Vendor";
}

/*********************************************************************
*
*       USB_MSD_GetProductName
*/
const char * USB_MSD_GetProductName(U8 Lun) {
  return "MSD Volume";
}

/*********************************************************************
*
*       USB_MSD_GetProductVer
*/
const char * USB_MSD_GetProductVer(U8 Lun) {
  return "1.00";
}

/*********************************************************************
*
*       USB_MSD_GetSerialNo
*/
const char * USB_MSD_GetSerialNo(U8 Lun) {
  return "134657890";
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
  _AddHID();
  _AddMSD();
  USB_Start();
  OS_CREATETASK(&_MSDTCB,  "MSDTask",  _MSDTask, 200, _aMSDStack);
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
    BSP_ClrLED(0);
    USB_HID_Read(&_ac[0], OUTPUT_REPORT_SIZE);
    _ac[0]++;
    USB_HID_Write(&_ac[0], INPUT_REPORT_SIZE);
    USB_OS_Delay(50);
  }
}
