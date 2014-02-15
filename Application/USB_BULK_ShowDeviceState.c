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
File    : USB_BULK_ShowDeviceState.c
Purpose : embOS sample showing the status of the current USB state.
--------  END-OF-HEADER  ---------------------------------------------
*/


#include <stdio.h>
#include "BSP.h"
#include "USB.h"
#include "RTOS.h"


/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_STACKPTR int _aUSBStack[512]; /* Task stacks */
static OS_TASK _USBTCB0;               /* Task-control-blocks */
static U32       _Data32;
static int       _State;
static OS_STACKPTR int _aStatusStack[512]; /* Task stacks */
static OS_TASK _StatusTCB0;               /* Task-control-blocks */
static OS_EVENT _Event;

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/


/*********************************************************************
*
*       _OnStatusChange
*
*/
static void _OnStatusChange(void * pContext) {
  (void)pContext;

  _State = USB_GetState();
  OS_EVENT_Pulse(&_Event);
}


/*********************************************************************
*
*       _StatusTask
*
*/
static void _StatusTask(void) {
  static USB_HOOK  _Hook;

  OS_EVENT_Create(&_Event);
  USB_RegisterSCHook(&_Hook, _OnStatusChange, &_Data32, sizeof(_Data32));
  while(1) {
    printf("Current state = %s %s %s %s %s\n", (_State & USB_STAT_ATTACHED)  ? "Attached  " : "",
                                               (_State & USB_STAT_READY)     ? "Ready     " : "",
                                               (_State & USB_STAT_ADDRESSED) ? "Addressed " : "",
                                               (_State & USB_STAT_CONFIGURED)? "Configured" : "",
                                               (_State & USB_STAT_SUSPENDED) ? "Suspended " : ""
                                           );
    OS_EVENT_Wait(&_Event);
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
  static U8 _abOutBuffer[USB_MAX_PACKET_SIZE];
  USB_BULK_INIT_DATA    InitData;

  InitData.EPIn  = USB_AddEP(1, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, NULL, 0);
  InitData.EPOut = USB_AddEP(0, USB_TRANSFER_TYPE_BULK, USB_MAX_PACKET_SIZE, _abOutBuffer, USB_MAX_PACKET_SIZE);
  USB_BULK_Add(&InitData);
}


/*********************************************************************
*
*       _USBTask
*/
static void _USBTask(void) {
  while(1) {
    //
    // Loop: Receive data byte by byte, send back (data + 1)
    //
    while (1) {
      char c;

      while ((USB_GetState() & (USB_STAT_CONFIGURED | USB_STAT_SUSPENDED)) != USB_STAT_CONFIGURED) {
        BSP_ToggleLED(0);
        USB_OS_Delay(50);
      }
      BSP_SetLED(0);         // LED on to indicate we are waiting for data
      USB_BULK_Read(&c, 1);
      BSP_ClrLED(0);
      c++;
      USB_BULK_Write(&c, 1);
    }
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
  return 0x1234;
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
  return "USB Device";
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
*/
void MainTask(void);
void MainTask(void) {
  USB_Init();
  _AddBULK();
  USB_Start();
  OS_CREATETASK(&_StatusTCB0, "Status Task", _StatusTask, 50, _aStatusStack);
  OS_CREATETASK(&_USBTCB0,    "USB Task",    _USBTask,   150, _aUSBStack);
  OS_Terminate(OS_pCurrentTask);
}

/**************************** end of file ***************************/

