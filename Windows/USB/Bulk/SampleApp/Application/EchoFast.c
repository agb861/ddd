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
File    : EchoFast.c
Purpose : USB BULK fast echo application
---------------------------END-OF-HEADER------------------------------
*/

#include <stdio.h>
#include <conio.h>
#include <windows.h>
#include "USBBULK.h"

/*********************************************************************
*
*       defines, configurable
*
**********************************************************************
*/
#define CMD_ECHO_BULK         0x01

/*********************************************************************
*
*       static data
*
**********************************************************************
*/

/*********************************************************************
*
*       static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _MessageBox
*
*/
static void _MessageBox(const char * s) {
  MessageBox(NULL, s, "USB Bulk sample application", MB_OK);
}


/*********************************************************************
*
*       _SendReceive
*
*/
static int _SendReceive(unsigned char * pBufferTx, unsigned short NumBytes2Write,
                        unsigned char * pBufferRx, unsigned short NumBytes2Read) {
  int r;
  r = USBBULK_WriteRead(pBufferTx, NumBytes2Write, pBufferRx, NumBytes2Read);
  if (r < 1) {
    _MessageBox("Could not write to device");
    return 1;                      // Error
  }
  if (memcmp(pBufferTx + 3, pBufferRx, NumBytes2Read)) {
    _MessageBox("Wrong data read");
    return 1;                      // Error
  }
  printf(".");
  return 0;
}

/*********************************************************************
*
*       _ShowDriverInfo
*
*/
static void _ShowDriverInfo(void) {
  char ac[200];
  unsigned Ver;
  USBBULK_GetDriverCompileDate(ac, sizeof(ac));
  Ver = USBBULK_GetDriverVersion();
  printf("USB BULK driver version: %d.%.2d%c, compiled: %s\n", Ver / 10000, (Ver / 100) % 100, (Ver % 100) + 'a', ac);
}

/*********************************************************************
*
*       _GetNumberFromConsole
*
*/
static unsigned short _GetNumberFromConsole(const char * s) {
  unsigned short  r;
  char            ac[100];

  printf(s);
  ac[0] = 96;
  _cgets(ac);
  r = (unsigned short)atoi(&ac[2]);
  if (r <= 0) {
    r = 500;
  }
  return r;
}

/*********************************************************************
*
*       _FillBuffer
*
*/
static void _FillBuffer(unsigned char * pBuffer, unsigned NumBytes) {
  unsigned i;
  for (i = 0; i < NumBytes; i++) {
    *(pBuffer + i) = (unsigned char )(i % 255);
  }
}


/*********************************************************************
*
*       _EchoFast
*
*/
static int _EchoFast(void) {
  unsigned short  NumBytes2Send;
  unsigned short  NumBytes2Read;
  unsigned short  PacketSize;
  unsigned        NumPackets;
  unsigned        i;
  unsigned char * pBufferTx;
  unsigned char * pBufferRx;
  unsigned        t;
  int r = 0;
  PacketSize    = _GetNumberFromConsole("Enter the packet size in bytes (default: 500): ");
  NumPackets    = _GetNumberFromConsole("Enter the number of packets    (default: 500): ");

  NumBytes2Read  = PacketSize;
  NumBytes2Send  = PacketSize + 3; 
  pBufferTx = (unsigned char *)malloc(NumBytes2Send);
  pBufferRx = (unsigned char *)malloc(NumBytes2Read);

  *(pBufferTx + 0) = CMD_ECHO_BULK;
  *(pBufferTx + 1) = PacketSize & 0xff;
  *(pBufferTx + 2) = PacketSize>> 8;

  _FillBuffer((pBufferTx + 3), PacketSize);
  t = timeGetTime();
  for (i = 0; i < NumPackets; i++) {
    if (_SendReceive(pBufferTx, NumBytes2Send, pBufferRx, NumBytes2Read)) {
      r = 1;
      break;
    }
  }
  if (r == 0) {
    t = timeGetTime() - t;
    printf ("\n2 * %d packets of %d bytes successfully transferred in %d msec.", NumPackets, PacketSize, t);
  }
  free(pBufferTx);
  free(pBufferRx);
  return r;
}

/*********************************************************************
*
*       public code
*
**********************************************************************
*/

/*********************************************************************
*
*       main
*
*/
int main(int argc, char* argv[]) {
  int  r;
  char Restart;
  char ac[10];

  if (USBBULK_Open() == NULL) {
    _MessageBox("Unable to connect to USB BULK device");
    return 1;
  }
  _ShowDriverInfo();
  USBBULK_SetTimeout(3600 * 1000);
  Restart = 'N';
  do {
    printf("Starting Echo...\n");
    r = _EchoFast();
    if (r) {      
      break;
    }
    printf("\nStart again? (y/n): ");
    ac[0] = 6;
    _cgets(ac);
    Restart = toupper(ac[2]);
    if ((Restart != 'Y') && (Restart != 'N')) {
      Restart = 'Y';
    }
  } while (Restart == 'Y');
  
  USBBULK_Close();
  if (r == 0) {
    printf("Communication with USB BULK device succesful!");
  }
  return r;
}

/******************************* End of file ************************/