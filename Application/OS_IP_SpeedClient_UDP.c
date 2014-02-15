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
File    : OS_IP_SpeedClient_UDP.c
Purpose : Speed client for TCP/IP stack using UDP.
--------- END-OF-HEADER --------------------------------------------*/

#include "RTOS.h"
#include "BSP.h"
#include "IP.h"
#include <stdio.h>

/*********************************************************************
*
*       Local defines, configurable
*
**********************************************************************
*/
#define SERVER_IP_ADDR    0xC0A8C750              // IP address, for example 192.168.5.1
#define BUFFER_SIZE       1472                    // UDP maximum Packet size
#define PORT              50020
#define TIME_OR_SIZE      2                       // 1 = Time Mode (see TRANSFER_TIME); 2 = Size Mode (see NUMBER_OF_BYTES)
#define NUMBER_OF_BYTES   (4uL * 1024uL * 1024uL) // Number of bytes to transmit
#define TRANSFER_TIME     2000                    // Transferring data for that time in ms

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_TASK         _TCBIP;                        // Task-control-blocks
static OS_STACKPTR int _StackIP[0x200];               // Task stacks
static OS_TASK         _TCBClient;
static OS_STACKPTR int _StackClient[0x300];
static int             _TimeStart;
static int             _TimeEnd;


/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _Client
*/
static void _Client(void * p) {
  long               UDPSockID;
  struct sockaddr_in Addr;
  struct sockaddr_in TargetAddr;
  char               Opt;
  int                NumBytes;
  unsigned char      aData[BUFFER_SIZE];
  int                SendCnt;
  int                ErrorCnt;

  //
  // Wait until link is up and network interface is configured.
  //
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  //
  // Create datagram socket and enable sending of broadcasts over this socket
  //
  Opt = 1;
  while (1) {
    UDPSockID = socket(AF_INET, SOCK_DGRAM, 0);
    if (UDPSockID != SOCKET_ERROR) {
      setsockopt(UDPSockID, SOL_SOCKET, SO_BROADCAST, &Opt, sizeof(Opt));
      //
      // Bind socket to UDP port
      //
      memset(&Addr, 0, sizeof(Addr));
      Addr.sin_family      = AF_INET;
      Addr.sin_port        = htons(PORT);
      Addr.sin_addr.s_addr = INADDR_ANY;
      bind(UDPSockID, (struct sockaddr *)&Addr, sizeof(Addr));
      break;
    }
    OS_Delay(100);    // Try again
  }
  while (1) {
    ErrorCnt  = 0;
    SendCnt   = 0;
    memset(aData, 0, sizeof(aData));
    strcpy((char *)aData, "Dummy Data");
    TargetAddr.sin_family      = AF_INET;
    TargetAddr.sin_port        = htons(PORT);
    TargetAddr.sin_addr.s_addr = htonl(SERVER_IP_ADDR);
    _TimeStart                 = OS_GetTime();
#if TIME_OR_SIZE == 1
    do {
      NumBytes = sendto(UDPSockID, (char const *)&aData[0], sizeof(aData), 0, (struct sockaddr *)&TargetAddr, sizeof(TargetAddr));
      if (NumBytes == -1) {
        ErrorCnt++;
        continue;
      }
      SendCnt += BUFFER_SIZE;
      _TimeEnd = OS_GetTime();
    } while (TRANSFER_TIME > (_TimeEnd - _TimeStart));
#else
    while (SendCnt < NUMBER_OF_BYTES) {
      NumBytes = sendto(UDPSockID, (char const *)&aData[0], sizeof(aData), 0, (struct sockaddr *)&TargetAddr, sizeof(TargetAddr));
      if (NumBytes == -1) {
        ErrorCnt++;
        continue;
      }
      SendCnt += BUFFER_SIZE;
    }
    _TimeEnd = OS_GetTime();
#endif
    printf("%i Bytes sent in %i ms. %i errors have occured.\n", SendCnt, _TimeEnd - _TimeStart, ErrorCnt);
    printf("Average transfer speed: %i Bytes/s\n", (SendCnt / (_TimeEnd - _TimeStart) * 1000));
    OS_Delay(1000);
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
