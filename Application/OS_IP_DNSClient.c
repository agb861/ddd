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
File    : OS_IP_DNSCLient.c
Purpose : Sample program for embOS & TCP/IP
          Demonstrates use ofthe integrated DNS client.
--------- END-OF-HEADER --------------------------------------------*/

#include "RTOS.h"
#include "BSP.h"
#include "IP.h"
#include <stdio.h>

OS_STACKPTR int _Stack[768/sizeof(int)];        // Task stacks
OS_TASK         _TCB;                 // Task-control-blocks
OS_STACKPTR int _StackDNS[0x100];     // Task stacks
OS_TASK         _TCBDNS;              // Task-control-blocks


/*********************************************************************
*
*       _DNSClient
*/
static void _DNSClient() {
  struct hostent *pHostEnt;
  char **ps;
  char **ppAddr;

  //
  // Wait until link is up. This can take 2-3 seconds if PHY has been reset.
  //
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(100);
  }
  while(1) {
    pHostEnt = gethostbyname("srv.segger.com");
    if (pHostEnt == NULL) {
      printf("Could not resolve host addr.\n");
      break;
    }
    printf("h_name: %s\n", pHostEnt->h_name);
    //
    // Show aliases
    //
    ps = pHostEnt->h_aliases;
    for (;;) {
      char * s;
      s = *ps++;
      if (s == NULL) {
        break;
      }
      printf("h_aliases: %s\n", s);
    }
    //
    // Show IP addresses
    //
    ppAddr = pHostEnt->h_addr_list;
    for (;;) {
      U32 IPAddr;
      char * pAddr;
      char ac[16];

      pAddr = *ppAddr++;
      if (pAddr == NULL) {
        break;
      }
      IPAddr = htonl(*(U32*)pAddr);
      IP_PrintIPAddr(ac, IPAddr, sizeof(ac));
      printf("IP Addr: %s\n", ac);
    }
    OS_Delay(1000);    // One check per second is enough.
  }
}

/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  IP_Init();
  OS_SetPriority(OS_GetTaskID(), 255);                                    // This task has highest prio for real-time application
  OS_CREATETASK(&_TCB,       "IP_Task", IP_Task   , 150, _Stack);         // Start the IP task
  OS_CREATETASK(&_TCBDNS, "DNSClient",  _DNSClient, 100, _StackDNS);      // Start the DNS client

  while (1) {
    BSP_ToggleLED(1);
    if (IP_GetCurrentLinkSpeed() == 0) {
      OS_Delay(50);
    } else {
      OS_Delay (200);
    }
  }
}

/*************************** End of file ****************************/
