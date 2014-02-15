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
File    : OS_IP_Shell.c
Purpose : Sample program for embOS & TCP/IP
          Demonstrates using the IP-shell to diagnose the IP stack.
          It opens TCP-port 23 (telnet) and waits for a connection.
          The actual Shell server is part of the stack, which keep the
          application program nice and small.
          To connect to the target, use the command line:
          > telnet <target-ip>
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
//
// Task stacks
//
static OS_STACKPTR int _Stack[768/sizeof(int)];         // Define the stack of the IP_Task to 768 bytes
static OS_STACKPTR int _StackShell[1024/sizeof(int)];   // Define the stack of the shell server task to 1024 bytes
//
// Task-control-blocks
//
static OS_TASK         _TCB;
static OS_TASK         _TCBShell;

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
  OS_SetPriority(OS_GetTaskID(), 255);                                      // This task has highest prio for real-time application
  OS_CREATETASK(&_TCB     , "IP_Task"  , IP_Task       , 150, _Stack);      // Start the IP task
#if USE_RX_TASK
  OS_CREATETASK(&_IPRxTCB , "IP_RxTask", IP_RxTask     , 140, _IPRxStack);  // Start the IP_RxTask, optional.
#endif
  OS_CREATETASK(&_TCBShell, "Shell"    , IP_ShellServer, 100, _StackShell); // Start the shell server

  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  while (1) {
    BSP_ToggleLED(1);
    OS_Delay (200);
  }
}




/*************************** End of file ****************************/
