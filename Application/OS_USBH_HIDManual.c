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
File    : OS_USBH_Start.c
Purpose : Sample program for embOS & USBH USB host stack.
          Demonstrates use of the USBH stack.
--------- END-OF-HEADER --------------------------------------------*/


#include <stdio.h>
#include "RTOS.h"
#include "BSP.h"
#include "USBH.h"

/*********************************************************************
*
*       Defines configurable
*
**********************************************************************
*/
#define MAX_DATA_ITEMS        6

/*********************************************************************
*
*       Defines non-configurable
*
**********************************************************************
*/
#define COUNTOF(a)  (sizeof(a)/sizeof(a[0]))

/*********************************************************************
*
*       Local data definitions
*
**********************************************************************
*/
enum {
  TASK_PRIO_APP,
  TASK_PRIO_USBH_MAIN,
  TASK_PRIO_USBH_ISR
};

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_STACKPTR int         _StackMain[768/sizeof(int)];
static OS_TASK                 _TCBMain;
static OS_STACKPTR int         _StackIsr[768/sizeof(int)];
static OS_TASK                 _TCBIsr;
static USBH_HID_REPORT_INFO    _aReportInfo[200];
static U8                      _aReport[64];

/*********************************************************************
*
*       Static Code
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
*       MainTask
*/
void MainTask(void);
void MainTask(void) {

  USBH_Init();
  OS_SetPriority(OS_GetTaskID(), TASK_PRIO_APP);                                       // This task has highest prio for real-time application
  OS_CREATETASK(&_TCBMain, "USBH_Task", USBH_Task, TASK_PRIO_USBH_MAIN, _StackMain);   // Start USBH main task
  OS_CREATETASK(&_TCBIsr, "USBH_isr", USBH_ISRTask, TASK_PRIO_USBH_ISR, _StackIsr);    // Start USBH main task
  USBH_HID_Init();
  while (1) {
    BSP_ToggleLED(1);
    if (USBH_HID_GetNumDevices(NULL, 0)) {
      USBH_HID_HANDLE hDevice;
      USBH_HID_DEVICE_INFO aDevInfo[20];
      unsigned NumItems = COUNTOF(_aReportInfo);

      USBH_HID_GetNumDevices(aDevInfo, COUNTOF(aDevInfo));
      hDevice = USBH_HID_Open("hid000");
      if (hDevice) {
        USBH_HID_GetReportDescriptorParsed(hDevice, &_aReportInfo[0], &NumItems);
        USBH_HID_GetReport(hDevice, _aReport, sizeof(_aReport), NULL, NULL);
        USBH_HID_Close(hDevice);
      }
    }
    OS_Delay(100);
  }
}
/*************************** End of file ****************************/
