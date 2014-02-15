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
File    : USB_MSD_FS_DisconnectOnWrite.c
Purpose : Sample showing how to use the FS and USB mass storage device
          simulateously.
          This sample creates 2 tasks.
          The USB task controls the mass storage device
          On a given timeout the FSTask disables access to storage
          device.
          While it is disabled HOST file system can not access
          the storage device. In this period embedded file system
          can access the storage device.
          After the data has been written to storage device, HOST FS
          gains access to storage device.
----------------------------------------------------------------------
Required products:
          embOS       - embedded real time operating system
          emFile      - embedded file system
          emUSB + MSD - embedded USB device stack with MSD class add on
--------  END-OF-HEADER  ---------------------------------------------
*/


#include <stdio.h>
#include "USB.h"
#include "USB_MSD.h"
#include "FS.h"
#include "RTOS.h"
#include "BSP.h"



/*********************************************************************
*
*       Defines configurable
*
**********************************************************************
*/
#define TIMEOUT_WAIT_HOST    7000     // Max. time to wait for the host to allow disconnection

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_STACKPTR int _aUSBStack[512];   // Task stacks
static OS_TASK         _USBTCB0;                  // Task-control-blocks

/*********************************************************************
*
*       Static ccode
*
**********************************************************************
*/


/*********************************************************************
*
*       _WriteLogFile
*/
static void _WriteLogFile(void) {
  char      ac[30];
  FS_FILE * pFile;

  if (FS_IsVolumeMounted("")) {
    pFile = FS_FOpen("Log.txt", "a+");
    sprintf(ac, "OS_Time = %.8d\r\n", OS_GetTime());
    FS_Write(pFile, ac, 20);
    FS_FClose(pFile);
  }
}

/*********************************************************************
*
*       _FSTask
*/
static void _FSTask(void) {
  int r;
  if (FS_IsLLFormatted("") == 0) {
    printf("Low level formatting");
    FS_FormatLow("");          // Erase & Low-level  format the flash
  }
  if (FS_IsHLFormatted("") == 0) {
    printf("High level formatting\n");
    FS_Format("", NULL);       // High-level format the flash
  }
  FS_SetAutoMount("", 0);
  FS_Mount("");
  while (1) {
    USB_MSD_RequestDisconnect(0);
    BSP_SetLED(2);
    r = USB_MSD_WaitForDisconnection(0, TIMEOUT_WAIT_HOST);
    if (r == 0) {
      USB_MSD_Disconnect(0); // Force disconnection
    }
    BSP_ClrLED(2);
    BSP_SetLED(3);
    FS_Mount("");
    _WriteLogFile();
    FS_Unmount("");
    BSP_ClrLED(3);
    USB_MSD_Connect(0);
    OS_Delay(30000);
  }
}

/*********************************************************************
*
*       _OnPreventAllowRemoval
*
*/
static void _OnPreventAllowRemoval(U8 PreventRemoval) {
  if (PreventRemoval) {
    printf("T%d, Prevent removal\n", USB_OS_GetTickCnt());
    BSP_SetLED(1);
  } else {
    printf("T%d, Allow removal\n", USB_OS_GetTickCnt());
    BSP_ClrLED(1);    
  }
}

/*********************************************************************
*
*       _OnReadWrite
*
*/
static void _OnReadWrite(U8 Lun, U8 IsRead, U8 OnOff, U32 StartLBA, U32 NumBlocks) {
  U32 t;
  t = USB_OS_GetTickCnt();
  if (OnOff) {
    printf("T%d:%d, Start %s operation (StartLBA: %d, NumBlocks: %d)\n", t / 1000, t % 1000 ,IsRead ? "Read" : "Write", StartLBA, NumBlocks);
    BSP_SetLED(3);
  } else {
    printf("T%d:%d, End   %s operation (StartLBA: %d, NumBlocks: %d)\n", t / 1000, t % 1000, IsRead ? "Read" : "Write", StartLBA, NumBlocks);
    BSP_ClrLED(3);    
  }
}

/*********************************************************************
*
*       _AddMSD
*
*  Function description
*    Add mass storage device to USB stack
*
*  Notes:
*   (1)  -   This examples uses the internal driver of the file system.
*            The module intializes the low-level part of the file system if necessary.
*            If FS_Init() was not previously called, none of the high level functions
*            such as FS_FOpen, FS_Write etc will work.
*            Only functions that are driver related will be called.
*            Initialization, sector read/write, retrieve device information.
*            The members of the DriverData are used as follows:
*              DriverData.pStart       = VOLUME_NAME such as "nand:", "mmc:1:".
*              DriverData.NumSectors   = Number of sectors to be used - 0 means auto-detect.
*              DriverData.StartSector  = The first sector that shall be used.
*              DriverData.SectorSize will not be used.
*/
static void _AddMSD(void) {
  static U8 _abOutBuffer[USB_MAX_PACKET_SIZE];
  USB_MSD_INIT_DATA     InitData;
  USB_MSD_INST_DATA     InstData;

  InitData.EPIn  = USB_AddEP(1, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, NULL, 0);
  InitData.EPOut = USB_AddEP(0, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, _abOutBuffer, USB_MAX_PACKET_SIZE);
  USB_MSD_Add(&InitData);
  //
  // Add logical unit 0: Use default device.
  //
  memset(&InstData, 0,  sizeof(InstData));
  InstData.pAPI                    = &USB_MSD_StorageByName;
  InstData.DriverData.pStart       = "";
  USB_MSD_AddUnit(&InstData);
  USB_MSD_SetPreventAllowRemovalHook(0, _OnPreventAllowRemoval);
  USB_MSD_SetReadWriteHook(0, _OnReadWrite);
}

/*********************************************************************
*
*       _USBTask
*/
static void _USBTask(void) {
  _AddMSD();
  USB_Start();
  while(1) {
    //
    // Wait for configuration
    //
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(0);
      USB_OS_Delay(50);
    }
    BSP_SetLED(0);
    FS_Unmount("");
    USB_MSD_Task();    // Task, does only return when device is non-configured mode
    FS_Mount("");
  }
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
  return 0x1000;
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
  return "MSD device";
}

/*********************************************************************
*
*       USB_GetSerialNumber
*
*  Function description
*    Returns serial number
*/
const char * USB_GetSerialNumber(void) {
  return "000013245678";  // Should be 12 character or more for compliance with Mass Storage Device Bootability spec.
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
*  Function description
*    This routine is started as a task from main.
*    It creates a USB task and continues handling the file system.
*/
void MainTask(void);
void MainTask(void) {
  USB_Init();
  FS_Init();
  OS_CREATETASK(&_USBTCB0, "USB Task", _USBTask, 150, _aUSBStack);
  _FSTask();
}

/**************************** end of file ***************************/

