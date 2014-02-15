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
File        : USBH_Config_LPC24xx.c
Purpose     :
---------------------------END-OF-HEADER------------------------------
*/

/*********************************************************************
*
*       #include Section
*
**********************************************************************
*/
#include <stdlib.h>
#include "USBH.h"
#include "BSP.h"

/*********************************************************************
*
*       Defines, configurable
*
**********************************************************************
*/
#define ALLOC_SIZE                 0x8000      // Size of memory dedicated to the stack in bytes
#define OHCI_BASE_ADDRESS          0xFFE0C000
#define TRANSFER_MEMORY_BASE       0x7FD00000  // Startaddress of the internal 16k USB SRAM
#define TRANSFER_MEMORY_SIZE       0x00004000  // Size of the internal 16k USB SRAM

#define USB_INT_BASE_ADDR          0xE01FC1C0
#define USB_INT_STAT               (*(volatile unsigned long *)(USB_INT_BASE_ADDR + 0x00))

/* USB interrupt status register USB_INT_STAT */
#define USB_HOST_INT		   (1 << 3)        // USB host interrupt line status. This bit is read only.

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static U32 _aPool[ALLOC_SIZE / 4];             // Memory area used by the stack.

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

/*********************************************************************
*
*       _ISR
*
*  Function description
*/
static void _ISR(void) {
  U32 IntStatus;
	
  IntStatus = USB_INT_STAT;	
  if (IntStatus &  USB_HOST_INT) {
    USBH_ServiceISR(0);
  }
}


/*********************************************************************
*
*       USBH_X_Config
*
*  Function description
*/
void USBH_X_Config(void) {
  USBH_AssignMemory(_aPool, sizeof(_aPool));    // Assigning memory should be the first thing
  USBH_AssignTransferMemory((void*)TRANSFER_MEMORY_BASE, TRANSFER_MEMORY_SIZE);
  //
  // Define log and warn filter
  // Note: The terminal I/O emulation affects the timing
  // of your communication, since the debugger stops the target
  // for every terminal I/O output unless you use DCC!
  //
  USBH_SetWarnFilter(0xFFFFFFFF);               // 0xFFFFFFFF: Do not filter: Output all warnings.
  USBH_SetLogFilter(0
                    | USBH_MTYPE_INIT
  //                  | USBH_MTYPE_CORE
  //                  | USBH_MTYPE_DRIVER
  //                  | USBH_MTYPE_MEM
                    | USBH_MTYPE_APPLICATION
                    | USBH_MTYPE_HID
//                    | USBH_MTYPE_MSD
                    );
//  USBH_SetLogFilter(0xffffffff);
  BSP_USBH_Init();

//extern void HW_Init(void);
//  HW_Init();
  USBH_OHC_Add((void*)OHCI_BASE_ADDRESS);
  BSP_USBH_InstallISR(_ISR);
}

/********************************* EOF ******************************/
