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
          broadcasts to the UDP port and waits for an answer from the
          target(s) which are available in the subnet.
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
#define PORT              50020
#define PACKET_SIZE       256

enum {
  TASK_PRIO_IP,
  TASK_PRIO_BLINK
};

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_STACKPTR int _Stack[768/sizeof(int)];          // Define the stack of the IP_Task to 768 bytes
static OS_TASK         _TCB;


/*********************************************************************
*
*       _OnRx
*
*  Function descrition
*    Discover client UDP callback. Called from stack
*    whenever we get a discover request.
*
*  Return value
*    IP_RX_ERROR  if packet is invalid for some reason
*    IP_OK        if packet is valid
*
*  Note
*    (1) Freeing In packet
*        With either return value, the IN-packet is freed by the stack
*/
static int _OnRx(IP_PACKET * pInPacket, void * pContext) {
  U32         IPAddr;
  unsigned    TargetAddr;
  char *      pOutData;
  char *      pInData;
  IP_PACKET * pOutPacket;

  pInData = IP_UDP_GetDataPtr(pInPacket);
  if (memcmp(pInData, "Discover target", 16) == 0) {
    //
    // Alloc packet
    //
    pOutPacket = IP_UDP_Alloc(PACKET_SIZE);
    if (pOutPacket) {
      pOutData = IP_UDP_GetDataPtr(pOutPacket);
  //    IP_UDP_GetSrcAddr(pInPacket, &TargetAddr, sizeof(TargetAddr));    // Send back Unicast
      TargetAddr = 0xFFFFFFFF;       // send back as Broadcast
      //
      // Fill packet with data, containing IPAddr, MacAddr, S/N, Name
      //
      IPAddr = htonl(IP_GetIPAddr(0));
      memset(pOutData, 0, PACKET_SIZE);
      strcpy(pOutData + 0x00, "Found");
      memcpy(pOutData + 0x20, (void*)&IPAddr, 4);     // 0x20: IP address
      IP_GetHWAddr(0, (U8*)pOutData + 0x30, 6);       // 0x30: MAC address
      memcpy(pOutData + 0x40, "12345678", 8);         // 0x40: S/N
      strcpy(pOutData + 0x50, "MyTarget");            // 0x50: Product name
      //
      // Send packet
      //
      IP_UDP_SendAndFree(0, htonl(TargetAddr), PORT, PORT, pOutPacket);
    }
  }
  return IP_OK;
}

/*********************************************************************
*
*       _Init()
*
*  Function description
*    Register receive function
*/
static void _Init(void) {
  IP_UDP_Open(0L /* any foreign host */,  PORT, PORT, _OnRx, 0L /* any tag */);
}

/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  IP_Init();
  OS_CREATETASK(&_TCB, "IP_Task", IP_Task, TASK_PRIO_IP, _Stack);
  _Init();        // Register receive function
  //
  //
  // Use this task to toggle an LED so we can see that target program is running
  //
  OS_SetPriority(OS_GetTaskID(), TASK_PRIO_BLINK);
  while (1) {
    BSP_ToggleLED(1);
    OS_Delay (200);
  }
}




/*************************** End of file ****************************/
