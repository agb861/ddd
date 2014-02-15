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
File    : OS_IP_UDPDiscover.c
Purpose : Sample program for embOS & TCP/IP
          Demonstrates setup of a simple UDP application which waits
          for messages on a UDP port and answers if a discover packet
          has been received. The related host application sends UDP
          broadcasts to the UDP port and waits for the feedback of the
          target which are available in the subnet.
--------- END-OF-HEADER --------------------------------------------*/

#include <stdio.h>
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
#define PORT              50020

/*********************************************************************
*
*       static data
*/
/*********************************************************************
*
*       static data
*/
//
// Task stacks
//
static OS_STACKPTR int _Stack[768/sizeof(int)];          // Define the stack of the IP_Task to 768 bytes
static OS_STACKPTR int _StackDiscover[1024/sizeof(int)]; // Define the stack of the discover task to 1024 bytes
//
// Task-control-blocks
//
static OS_TASK         _TCB;
static OS_TASK         _TCBDiscover;

#if USE_RX_TASK
static OS_STACKPTR int _IPRxStack[512/sizeof(int)];     // Define the stack of the IP_RxTask to 512 bytes
static OS_TASK         _IPRxTCB;
#endif


/*********************************************************************
*
*       _ServerThread
*
* Purpose
*   The server thread.
*/
static void Discover_Task(void* pPara) {
  long sock;
  char acBuffer[256];
  struct sockaddr_in addr;
  struct sockaddr_in TargetAddr;
  U16 ServerPort = PORT;
  U32 TargetIP   = 0xFFFFFFFF;
  int Len;
  U32 IPAddr;

  //
  // Loop until we get a socket
  //
  do {
    sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock != SOCKET_ERROR) {
      //
      // Bind socket to UDP port
      //
      memset(&addr, 0, sizeof(addr));
      addr.sin_family      = AF_INET;
      addr.sin_port        = htons(PORT);
      addr.sin_addr.s_addr = INADDR_ANY;
      bind(sock, (struct sockaddr *)&addr, sizeof(addr));
      break;
    }
    OS_Delay(100);    // Try again
  } while (1);
  //
  // Wait for incoming UDP discover packets
  //
  TargetAddr.sin_family = AF_INET;
  TargetAddr.sin_port = htons(ServerPort);
  TargetAddr.sin_addr.s_addr = htonl(TargetIP);

  while (1) {
    Len = sizeof(TargetAddr);
    Len = recvfrom(sock, &acBuffer[0], sizeof(acBuffer), 0, (struct sockaddr*)&TargetAddr, &Len);
    if (Len > 0) {
      if (memcmp(acBuffer, "Discover target", 16) == 0) {
        //
        // Create answer packet, containing IPAddr, MacAddr, S/N, Name
        //
        IPAddr = htonl(IP_GetIPAddr(0));
        memset(acBuffer, 0, sizeof(acBuffer));
        strcpy(acBuffer, "Found");
        memcpy((void*)&acBuffer[0x20], (void*)&IPAddr, 4);    // 0x20: IP address
        IP_GetHWAddr(0, (U8*)&acBuffer[0x30], 6);             // 0x30: MAC address
        memcpy((void*)&acBuffer[0x40], "12345678", 8);        // 0x40: S/N
        strcpy((void*)&acBuffer[0x50], "MyTarget");           // 0x50: Product name
        sendto(sock, acBuffer, sizeof(acBuffer), 0, (struct sockaddr*)&TargetAddr, sizeof(TargetAddr));
      }
    }
  }
}

/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  IP_Init();
  OS_SetPriority(OS_GetTaskID(), 255);                                  // This task has highest prio!
  OS_CREATETASK(&_TCB,       "IP_Task", IP_Task, 150, _Stack);
#if USE_RX_TASK
  OS_CREATETASK(&_IPRxTCB, "IP_RxTask", IP_RxTask, 140, _IPRxStack);   // Start the IP_RxTask, optional.
#endif
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  //
  // Start discover task if interface ready.
  //
  OS_CREATETASK_EX(&_TCBDiscover, "Discover",  Discover_Task, 100, _StackDiscover, NULL);
  while (1) {
    BSP_ToggleLED(1);
    OS_Delay (200);
  }
}




/*************************** End of file ****************************/
