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
File    : USB_MSD_Start_StorageRAM.c
Purpose : Sample startup, using a simple RAM disk driver.
--------  END-OF-HEADER  ---------------------------------------------
*/

#include <string.h>
#include <stdio.h>
#include "USB.h"
#include "USB_MSD.h"
#include "BSP.h"


/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
#ifndef   MSD_RAM_NUM_SECTORS
  #define MSD_RAM_NUM_SECTORS   46
#endif

#ifndef   MSD_RAM_SECTOR_SIZE
  #define MSD_RAM_SECTOR_SIZE  512
#endif

#ifndef MSD_RAM_ADDR
  static U8 _aRAMDisk[MSD_RAM_SECTOR_SIZE * MSD_RAM_NUM_SECTORS];  // RAM disk must be at least 23 KByte otherwise Windows host cannot format the disk.
  #define MSD_RAM_ADDR &_aRAMDisk[0]
#endif

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
*
*  Note:
*   (1)  -     The members of the DriverData are used as follows:
*                DriverData.pStart       = Start address of the RAM disk.
*                DriverData.NumSectors   = Number of sectors to be used.
*                DriverData.StartSector  = Is ignored.
*                DriverData.SectorSize   = Bytes per sector that shall be used.
*
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
  InstData.pAPI                    = &USB_MSD_StorageRAM;
  InstData.DriverData.pStart       = (void*)MSD_RAM_ADDR;
  InstData.DriverData.NumSectors   = MSD_RAM_NUM_SECTORS;
  InstData.DriverData.SectorSize   = MSD_RAM_SECTOR_SIZE;
  USB_MSD_AddUnit(&InstData);
}

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

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
*/
void MainTask(void);
void MainTask(void) {
  USB_Init();
  _AddMSD();
  USB_Start();
  while (1) {
    while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
      BSP_ToggleLED(0);
      USB_OS_Delay(50);
    }
    BSP_SetLED(0);
    USB_MSD_Task();
  }
}

/**************************** end of file ***************************/

