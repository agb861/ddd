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
File    : USB_CompositeDevice_CDC_MSD.c
Purpose : Sample showing a USB device with multiple interfaces (CDC+MSD).
--------  END-OF-HEADER  ---------------------------------------------
*/

#include <stdio.h>
#include <stdio.h>
#include "USB.h"
#include "USB_CDC.h"
#include "BSP.h"
#include "USB_MSD.h"
#include "FS.h"
#include "RTOS.h"

/*********************************************************************
*
*       Const data
*
**********************************************************************
*/

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
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
#if 0
  printf("DTERate=%u, CharFormat=%u, ParityType=%u, DataBits=%u\n",
          pLineCoding->DTERate,
          pLineCoding->CharFormat,
          pLineCoding->ParityType,
          pLineCoding->DataBits);
#endif
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
  return 0x1256;
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
  return "MSD/CDC Composite device";
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
* USB handling task.
*   Modify to implement the desired protocol
*/
void MainTask(void);
void MainTask(void) {

  USB_Init();
  USB_EnableIAD();
  _AddCDC();
  _AddMSD();
  USB_Start();
  BSP_SetLED(0);
  OS_CREATETASK(&_MSDTCB,  "MSDTask",  _MSDTask, 200, _aMSDStack);

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

