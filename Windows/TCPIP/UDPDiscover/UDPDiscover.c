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
File    : UDP_Discover.c
Purpose : UDP sample program to demonstrate the usage of UDP 
          broadcasts. The application sends UDP braodcast and checks
          if there are targets which send a reply to the broadcast.
          To keep it simple the application uses only the first 
          available interface, if you have multiple interfaces 
          installed on your host code changes are required.
---------------------------END-OF-HEADER------------------------------
*/

#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <windows.h>

/*********************************************************************
*
*       Defines, configurable
*
**********************************************************************
*/
#define PORT  50020

/*********************************************************************
*
*       Static Variables
*
**********************************************************************
*/
unsigned int BroadcastIP = 0xFFFFFFFF;        // IP address, broadcast

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

/*********************************************************************
*
*       main()
*/
int main(int argc, char* argv[], char* envp[]) {
  WORD wVersionRequested;
  WSADATA wsaData;
  SOCKET sock;
  SOCKADDR_IN LAddr; // connector's address information
  SOCKADDR_IN TargetAddr; // connector's address information
  int NumBytes;
  unsigned char aData[256];
  int Len;
  int t, t0;
  struct in_addr;

  //
  // Initialize winsock. Required to use TCP/IP
  //
  wVersionRequested = MAKEWORD(2, 0);
  if (WSAStartup(wVersionRequested, &wsaData) != 0) {
    printf("Could not init WinSock.\n");
    return 1;
  }
  timeBeginPeriod(1); 
  //
  // Create datagram socket and enable sending of broadcasts over this socket
  //
  sock = socket(AF_INET, SOCK_DGRAM, 0);
  if (sock == -1) {
    printf ("Could not create socket.");
  }
  {
    char Opt = 1;
    setsockopt(sock, SOL_SOCKET, SO_BROADCAST, &Opt, sizeof(Opt));
  }
  {
    unsigned long Opt = 1;
    ioctlsocket(sock, FIONBIO, &Opt);
  }
  memset(&LAddr, 0, sizeof(LAddr));
  LAddr.sin_family      = AF_INET;
  LAddr.sin_port        = htons(50020);
  LAddr.sin_addr.s_addr = INADDR_ANY;
  bind(sock, (struct sockaddr *)&LAddr, sizeof(LAddr));
  while (1) {
    memset(aData, 0, sizeof(aData));
    strcpy(aData, "Discover target");
    TargetAddr.sin_family = AF_INET;
    TargetAddr.sin_port = htons(PORT);
    TargetAddr.sin_addr.s_addr = htonl(BroadcastIP);
    NumBytes = sendto(sock, &aData[0], sizeof(aData), 0, (SOCKADDR*)&TargetAddr, sizeof(TargetAddr));
    if (NumBytes == -1) {
      printf("sendto error\n");
      break;
    }
    printf("\nSending discover - Waiting for replies...\n");
    t0 = timeGetTime();
    do {
      memset(aData, 0, sizeof(aData));
      Len = sizeof(TargetAddr);
      NumBytes = recvfrom(sock, &aData[0], sizeof(aData), 0, (SOCKADDR*)&TargetAddr, &Len);
      if (NumBytes >= 16) {
        if (memcmp(aData, "Found", 5) == 0) {
          //
          // Output reply infos
          //
          printf("%dms: %s, S/N: %s, IP: %d.%d.%d.%d, MAC:%.2X:%.2X:%.2X:%.2X:%.2X:%.2X\n", timeGetTime() - t0, // Reply time
                                                                &aData[0x50],                                               // Product name
                                                                &aData[0x40],                                               // S/N
                                                                aData[0x20], aData[0x21], aData[0x22], aData[0x23],         // IP address
                                                                aData[0x30], aData[0x31], aData[0x32], aData[0x33], aData[0x34], aData[0x35]); // MAC address
        }
      }
      t = timeGetTime();
    } while ((t0 + 100 - t) > 0);
    Sleep(1000);
  }
  closesocket(sock);
  WSACleanup();
  timeEndPeriod(1);
  return 0;
}

/*************************** end of file ****************************/
