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
File    : OS_IP_SimpleServer.c
Purpose : Sample program for embOS & TCP/IP
          Demonstrates setup of a simple server which simply sends back
          the target system tick for every character received.
          It opens TCP-port 23 (telnet) and waits for a connection.
          To connect to the target, use the command line:
          > telnet <target-ip>
          Where <target-ip> represents the IP address of the target,
          which depends on the configuration and is usually 192.168.1.230
          if DHCP is not enabled.
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
static OS_STACKPTR int _Stack[768/sizeof(int)];         // Define the stack of the IP_Task to 768 bytes
static OS_STACKPTR int _StackTelnet[1024/sizeof(int)];  // Define the stack of the telnet server task to 1024 bytes
//
// Task-control-blocks
//
static OS_TASK         _TCB;
static OS_TASK         _TCBTelnet;

#if USE_RX_TASK
static OS_STACKPTR int _IPRxStack[512/sizeof(int)];     // Define the stack of the IP_RxTask to 512 bytes
static OS_TASK         _IPRxTCB;
#endif

static char acOut[512];
static U8   ac[50];

/*********************************************************************
*
*       _Process
*
*  Function description
*    This is the actual (very simple) server.
*/
static void _Process(long Socket) {
  const char * sHello = "Hello ... Press any key.\n\r";
  int NumBytes;
  unsigned Timeout;
  int Error;

  send(Socket, (char*)sHello, strlen(sHello), 0);
  do {
    Timeout = 30000;
    //
    // recv() is a blocking function. this means it blocks until it
    // receives data. We set a timeout to guarantee that the
    // function returns after the given delay.
    //
    setsockopt(Socket, SOL_SOCKET, SO_RCVTIMEO, &Timeout, sizeof(Timeout));
    NumBytes = recv(Socket, (char*)ac, 1, 0);
    if (NumBytes <= 0) {
      getsockopt(Socket, SOL_SOCKET, SO_ERROR, &Error, sizeof(Error));
      if (Error == ETIMEDOUT) {
        printf("recv() timeout after %d seconds of inactivity!\n", Timeout/1000);
      }
      return;
    }
    sprintf(acOut, "OS_Time = %ld\n\r", OS_Time);
    send(Socket, (char*)acOut, strlen(acOut), 0);
  } while (1);
}


/*********************************************************************
*
*       _ListenAtTcpAddr
*
* Starts listening at the given TCP port.
*/
static long _ListenAtTcpAddr(void) {
  long sock;
  struct sockaddr_in addr;

  sock = socket(AF_INET, SOCK_STREAM, 0);
  if (sock != SOCKET_ERROR) {
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_port = htons(23);
    addr.sin_addr.s_addr = INADDR_ANY;
    bind(sock, (struct sockaddr *)&addr, sizeof(addr));
    listen(sock, 1);
  }
  return sock;
}


/*********************************************************************
*
*       _ServerThread
*
* Purpose
*   The server thread.
*/
static void Telnet_Task(void* pPara) {
  long s, sock;
  struct sockaddr addr;

  //
  // Loop until we get a socket into listening state
  //
  do {
    s = _ListenAtTcpAddr();
    if (s != SOCKET_ERROR) {
      break;
    }
    OS_Delay(100);    // Try again
  } while (1);
  //
  // Loop once per client and call the actual server
  //
  while (1) {
    // Wait for an incoming connection
    int addrlen = sizeof(addr);
    sock = accept(s, &addr, &addrlen);
    if (sock == SOCKET_ERROR) {
      continue;    // Error
    }
    _Process(sock);    // Then process this client
    closesocket(sock);
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
  // Start telnet task if interface ready.
  //
  OS_CREATETASK_EX(&_TCBTelnet, "Telnet",  Telnet_Task, 100, _StackTelnet, NULL);
  while (1) {
    BSP_ToggleLED(1);
    OS_Delay (200);
  }
}




/*************************** End of file ****************************/
