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
File    : OS_IP_Start.c
Purpose : Sample program for embOS & TCP/IP
          Demonstrates use of the IP stack without any server or
          client program.
          To ping the target, use the command line:
          > ping <target-ip>
          Where <target-ip> represents the IP address of the target,
          which depends on the configuration and is usually 192.168.5.5.
--------- END-OF-HEADER --------------------------------------------*/


#include "RTOS.h"
#include "BSP.h"
#include "IP.h"

/*********************************************************************
*
*       Local defines, configurable
*
**********************************************************************
*/
#define USE_RX_TASK       0                    // 0: Packets are read in ISR, 1: Packets are read in a task of its own.

/*********************************************************************
*
*       static data
*/
static OS_STACKPTR int _IPStack[768/sizeof(int)];       // Define the stack of the IP_Task to 768 bytes
static OS_TASK         _TCB;                            // Task-control-block

#if USE_RX_TASK
static OS_STACKPTR int _IPRxStack[512/sizeof(int)];     // Define the stack of the IP_RxTask to 512 bytes
static OS_TASK         _IPRxTCB;
#endif

/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  IP_Init();
  OS_SetPriority(OS_GetTaskID(), 255);                                   // This task has highest prio for real-time application
  OS_CREATETASK(&_TCB, "IP_Task", IP_Task  , 150, _IPStack);             // Start the IP_Task
#if USE_RX_TASK
  OS_CREATETASK(&_IPRxTCB, "IP_RxTask", IP_RxTask, 140, _IPRxStack);     // Start the IP_RxTask, optional.
#endif
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  while (1) {
    BSP_ToggleLED(1);
    OS_Delay (200);
  }
}




/*************************** End of file ****************************/
