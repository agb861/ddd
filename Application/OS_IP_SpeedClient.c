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
File    : OS_IP_SpeedClient.c
Purpose : Speed client for TCP/IP stack.
--------- END-OF-HEADER --------------------------------------------*/

#include "RTOS.h"
#include "BSP.h"
#include "IP.h"
#include "IP_socket.h"

/*********************************************************************
*
*       Local defines, configurable
*
**********************************************************************
*/
#define SERVER_IP_ADDR    0xC0A8C74A              // IP address, for example 192.168.5.1
#define SERVER_PORT       1234                    // Remote destination port
#define NUMBER_OF_BYTES   (4uL * 1024uL * 1024uL) // Number of bytes to transmit
#define BUFFER_SIZE       4000                    // Maximum number of words we can get at once
#define DIRECTION         2                       // 1 for receive, 2 for send, 3 for rx & tx
#define USE_ZERO_COPY     0                       // 0: Use sockets, 1: use zero-copy API
#define USE_RX_TASK       0                       // 0: Packets are read in ISR, 1: Packets are read in a task of its own.

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static char            _aRxTxBuffer[BUFFER_SIZE];
static OS_STACKPTR int _StackIP[0x200];               // Task stacks
static OS_STACKPTR int _StackClient[0x200];
static OS_TASK         _TCBIP;                        // Task-control-blocks
static OS_TASK         _TCBClient;
#if USE_RX_TASK
static OS_TASK         _TCBIPRx;
static OS_STACKPTR int _StackIPRx[0x200];
#endif

//
// Statistics to count all successful transmissions of NUMBER_OF_BYTES
//
static struct {
  U32 RxCnt;
  U32 TxCnt;
  U32 ErrCnt;
} _Statistics;

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _rx_callback
*
*  Function description
*    Sample implementation of a receive callback required by the TCP zero-copy
*    interface to process received packets.
*/
static int _rx_callback(long so, IP_PACKET * pPacket, int code) {
  return IP_OK;
}

/*********************************************************************
*
*       _Receive
*
*  Function description
*    Sends a command to server and receives data from server.
*/
static int _Receive(long TCPSockID) {
  U8  acBuffer[20];
  U8 Flag;
  int NumberOfBytesAtOnce;
  U32 ReceiveCnt;
  int r;

  //
  // Send command and receive data
  //
  acBuffer[0] = 'S';                                       // [0:0]: Command
  IP_StoreU32LE((void*)&acBuffer[1], NUMBER_OF_BYTES);     // [1:4]: Number of bytes
  r = send(TCPSockID, (void *) &acBuffer[0], 5, MSG_DONTWAIT); // Send command
  if (r == SOCKET_ERROR) {
    return SOCKET_ERROR;
  }
  ReceiveCnt = 0;
  do {
    if (USE_ZERO_COPY == 0) {                              // Using the socket interface
      NumberOfBytesAtOnce = recv(TCPSockID, _aRxTxBuffer, 1024, 0);
      if (NumberOfBytesAtOnce == SOCKET_ERROR) {
        return SOCKET_ERROR;
      } else {
        ReceiveCnt += NumberOfBytesAtOnce;
      }
    } else {                                              // Register callback for zero-copy interface
      setsockopt(TCPSockID, SOL_SOCKET, SO_CALLBACK, (void *)_rx_callback, 0);
      OS_Delay(1);
    }
  } while (ReceiveCnt < NUMBER_OF_BYTES);
  Flag = 'X';            // Confirmation
  r = send(TCPSockID, (void *) &Flag, 1, 0);
  if (r == SOCKET_ERROR) {
    return SOCKET_ERROR;
  }
  BSP_ToggleLED(1);
  return 0;
}

/*********************************************************************
*
*       _Send
*
*  Function description
*    Sends a command to server and sends data to server.
*/
static int _Send(long TCPSockID) {
  U8  acBuffer[20];
  int NumBytesAtOnce;
  U32 SendCnt;
  U8  Flag;
  IP_PACKET * pPacket;
  int e;
  int r;

  //
  // Send command and data
  //
  acBuffer[0] = 'R';                                       // [0:0]: Command
  IP_StoreU32LE((void*)&acBuffer[1], NUMBER_OF_BYTES);     // [1:4]: Number of bytes
  r = send(TCPSockID, (void *) &acBuffer[0], 5, MSG_DONTWAIT); // Send command
  if (r == SOCKET_ERROR) {
    return SOCKET_ERROR;
  }
  SendCnt = 0;
  do {
    if (USE_ZERO_COPY == 0) {    // Send using sockets
      NumBytesAtOnce = send(TCPSockID, (void *)&_aRxTxBuffer[0], sizeof(_aRxTxBuffer), 0);
      if (NumBytesAtOnce == SOCKET_ERROR) {
        return NumBytesAtOnce;
      } else {
        SendCnt += NumBytesAtOnce;
      }
    } else {  // Send using Zero-copy
      U8 * pData;
      NumBytesAtOnce = sizeof(_aRxTxBuffer);
      do {
        pPacket = IP_TCP_Alloc(NumBytesAtOnce);
      } while (!pPacket);
      //
      // Fill buffer with data to send
      //
      pData = (U8*)pPacket->pData;
      memcpy(pData, "MyData", 6);
      //
      // Send data. We have to do this in the loop since we may try to send faster than we can transmit.
      //
      for (;;) {
        e = IP_TCP_Send(TCPSockID, pPacket);
        if (e >= 0) {
          break;     // Packet sent succesfully
        }
        OS_Delay(1);
      }
      SendCnt += NumBytesAtOnce;
    }
  } while (SendCnt < NUMBER_OF_BYTES);
  Flag = 0;
  //
  // Wait for response to make sure data has been sent completly
  //
  r = recv(TCPSockID, (void *) &Flag, 1, 0);
  if (r == SOCKET_ERROR) {
    return SOCKET_ERROR;
  }
  BSP_ToggleLED(1);
  return 0;
}

/*********************************************************************
*
*       _Client
*/
static void _Client(void * p) {
  long               TCPSockID;
  struct sockaddr_in ServerAddr;
  int                ConnectStatus;
  int                r;

  //
  // Wait until link is up and network interface is configured.
  //
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  while(1) {
    TCPSockID = socket(AF_INET, SOCK_STREAM, 0);  // Open socket
    if (TCPSockID == 0) {                          // Error, Could not get socket
      while (1) {
        BSP_ToggleLED(0);
        OS_Delay(20);
      }
    } else {
      //
      // Connect to server
      //
      BSP_SetLED(0);
      ServerAddr.sin_family      = AF_INET;
      ServerAddr.sin_port        = htons(SERVER_PORT);
      ServerAddr.sin_addr.s_addr = htonl(SERVER_IP_ADDR);
      ConnectStatus              = connect(TCPSockID, (struct sockaddr *)&ServerAddr, sizeof(struct sockaddr_in));
      if (ConnectStatus != SOCKET_ERROR) {
        while(1) {
          if (DIRECTION & 1) {
            r = _Receive(TCPSockID);
            if (r == -1) {
              break;
            }
            _Statistics.RxCnt++;
          }
          if (DIRECTION & 2) {
            r = _Send(TCPSockID);
            if (r == -1) {
              break;
            }
            _Statistics.TxCnt++;
          }
          OS_Delay(50);
        }
      }
    }
    _Statistics.ErrCnt++;
    closesocket(TCPSockID);
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

