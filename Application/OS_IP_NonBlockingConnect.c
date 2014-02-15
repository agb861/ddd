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
File    : OS_IP_NonBlockingConnect.c
Purpose : Demonstrates how to connect to a server using non-blocking
          sockets.

Typical output:
  Connecting using non-blocking socket...
  Succesfully connected after 1ms!
  3 of 3 tries were successful.

--------- END-OF-HEADER --------------------------------------------*/

#include "RTOS.h"
#include "BSP.h"
#include "IP.h"
#include "IP_socket.h"
#include <stdio.h>

/*********************************************************************
*
*       Local defines, configurable
*
**********************************************************************
*/
#define SERVER_IP_ADDR    0xC0A80501           // IP address, for example 192.168.5.1
#define SERVER_PORT       1234                 // Remote destination port
#define TIMEOUT           5000
#define USE_RX_TASK       0                    // 0: Packets are read in ISR, 1: Packets are read in a task of its own.

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_STACKPTR int _StackIP[0x100];               // Task stacks
static OS_STACKPTR int _StackClient[0x100];
static OS_TASK         _TCBIP;                        // Task-control-blocks
static OS_TASK         _TCBClient;
#if USE_RX_TASK
static OS_TASK         _TCBIPRx;
static OS_STACKPTR int _StackIPRx[0x100];
#endif

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _Connect
*
*  Function description
*    Tries to connect to TCP server with an non-blocking socket.
*    The 3-way connection handshake takes a while, so it is possible
*    that connect() returns before the handshake has been completed.
*    Therefore, you have to check the socket error to decide about
*    the state of the connecting process.
*
*  Return values
*    1 on timeout
*    0 on success (connection established)
*   -1 on connection failure.
*/
static int _ConnectWithTimeout(long Sock, struct sockaddr_in * pServerAddr, int Timeout) {
  int SoError;
  int t0;
  int t;
  int Status;

  t0 = IP_OS_GetTime32();
  do {
    Status = connect(Sock, (struct sockaddr *)pServerAddr, sizeof(struct sockaddr_in));
    if (Status == 0) {
      return 0;        // Successfully connected
    }
    getsockopt(Sock, SOL_SOCKET, SO_ERROR, &SoError, sizeof(SoError));
    if (SoError != EINPROGRESS) {
      return -1;       // Not in progress and Not successful, error...
    }
    t = IP_OS_GetTime32() - t0;
    if (t >= Timeout) {
      return 1;
    }
    OS_Delay(1);       // Give lower prior tasks some time
  } while (1);
}

/*********************************************************************
*
*       _Client
*/
static void _Client(void * p) {
  struct sockaddr_in ServerAddr;
  int Sock;
  int r;
  int t0;
  int t1;
  int ConnectionCnt;
  int SuccessCnt;

  //
  // Wait until link is up and network interface is configured.
  //
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  //
  // Initialize statistics
  //
  ConnectionCnt = 0;
  SuccessCnt    = 0;
  //
  // Start connect() loop
  //
  while(1) {
    Sock = socket(AF_INET, SOCK_STREAM, 0);      // Open socket
    if (Sock <= 0) {                             // Error, Could not get socket
      while (1) {
        BSP_ToggleLED(0);
        OS_Delay(20);
      }
    } else {
      //
      // Connect to server
      //
      ServerAddr.sin_family      = AF_INET;
      ServerAddr.sin_port        = htons(SERVER_PORT);
      ServerAddr.sin_addr.s_addr = htonl(SERVER_IP_ADDR);
      setsockopt(Sock, SOL_SOCKET, SO_NBIO, NULL, 0); // Set socket non blocking
      printf("Connecting using non-blocking socket...\n");
      ConnectionCnt++;
      t0 = IP_OS_GetTime32();
      r = _ConnectWithTimeout(Sock, &ServerAddr, TIMEOUT);
      t1 = IP_OS_GetTime32() - t0;
      if (r == 0) {
        printf("Succesfully connected after %dms!\n", t1);
        setsockopt(Sock, SOL_SOCKET, SO_NBIO, NULL, 0); // Set socket blocking
        BSP_SetLED(1);
        OS_Delay(500);
        BSP_ClrLED(1);
        SuccessCnt++;
      }
      if (r == -1) {
        printf("connect() failed after %dms!\n", t1);
      }
      if (r == 1) {
        printf("Timeout reached.\n");
      }
    }
    printf("%d of %d tries were successful.\n\n", SuccessCnt, ConnectionCnt);
    closesocket(Sock);
    OS_Delay(2000);
  }
}

/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  BSP_ClrLED(0);
  BSP_ClrLED(1);
  BSP_ClrLED(2);
  IP_Init();
  OS_SetPriority(OS_GetTaskID(), 255);
  OS_CREATETASK(&_TCBIP       , "IP_Task"  , IP_Task  , 150, _StackIP);
#if USE_RX_TASK
  OS_CREATETASK(&_TCBIPRx     , "IP_RxTask", IP_RxTask, 250, _StackIPRx);
#endif
  OS_CREATETASK_EX(&_TCBClient, "Client"   ,  _Client , 100, _StackClient, NULL);
  while (1) {
    BSP_ToggleLED(2);
    OS_Delay (200);
  }
}

/*************************** End of file ****************************/


