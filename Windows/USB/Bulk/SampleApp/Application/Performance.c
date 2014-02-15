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
File    : Performance.c
Purpose : USB BULK performance test application
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
#define CMD_WRITE_TEST         0x01
#define CMD_READ_TEST          0x02

/*********************************************************************
*
*       static data
*
**********************************************************************
*/
static HWND _hWnd = INVALID_HANDLE_VALUE;

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

  if (_hWnd == INVALID_HANDLE_VALUE) {
    char ac[200];
    GetConsoleTitle(ac, sizeof(ac));
    _hWnd = FindWindow("ConsoleWindowClass", ac);
  }
  MessageBox(_hWnd, s, "USB Bulk sample application", MB_OK | MB_APPLMODAL);
}


/*********************************************************************
*
*       _Receive
*
*/
static int _Receive(unsigned DevIndex, U8 * pBuffer, U32 NumBytes2Read) {
  int r;
  r = USBBULK_Read(pBuffer, NumBytes2Read);
  if (r < 1) {
    _MessageBox("Could not read from device");
    return 1;                      // Error
  }
  printf(".");
  return 0;
}

/*********************************************************************
*
*       _Send
*
*/
static int _Send(unsigned DevIndex, U8 * pBuffer, U32 NumBytes2Write) {
  int r;
  r = USBBULK_WriteEx(DevIndex, pBuffer, NumBytes2Write);
  if (r < 1) {
    _MessageBox("Could not write to device");
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
static int _GetNumberFromConsole(const char * s) {
  int  r;
  char ac[100];

  printf(s);
  ac[0] = 96;
  _cgets(ac);
  r = atoi(&ac[2]);
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
static int _PerformanceTest(int DevIndex) {
  U32            PacketSize;
  U8           * pBuffer;
  U16            NumPackets;
  unsigned       i;
  unsigned       t, tWrite, tRead;
  U8             aCmd[7];
  int r = 0;

  if (USBBULK_OpenEx(DevIndex) == NULL) {
    _MessageBox("Unable to connect to USB BULK device");
    return 1;
  }
  _ShowDriverInfo();
  USBBULK_SetTimeoutEx(DevIndex, 3600 * 1000);
  PacketSize    = _GetNumberFromConsole("Enter the packet size in bytes (default: 500): ");
  NumPackets    = _GetNumberFromConsole("Enter the number of packets    (default: 500): ");
  pBuffer       = (unsigned char *)malloc(PacketSize);
  //
  // Prepare write command and send to device
  //
  aCmd[0] = CMD_WRITE_TEST;
  aCmd[1] = (U8)((PacketSize >>  0) & 0xff);
  aCmd[2] = (U8)((PacketSize >>  8) & 0xff);
  aCmd[3] = (U8)((PacketSize >> 16) & 0xff);
  aCmd[4] = (U8)((PacketSize >> 24) & 0xff);
  aCmd[5] = (U8)(NumPackets & 0xff);
  aCmd[6] = (U8)(NumPackets >> 8);
  _Send(DevIndex, &aCmd[0], sizeof(aCmd));
  t = timeGetTime();
  for (i = 0; i < NumPackets; i++) {
    if (_Send(DevIndex, pBuffer, PacketSize)) {
      r = 1;
      break;
    }
  }
  if (r) {
    goto End;
  }
  tWrite = timeGetTime() - t;
  //
  // Prepare read command and send to device
  //
  aCmd[0] = CMD_READ_TEST;
  _Send(DevIndex, &aCmd[0], sizeof(aCmd));
  t = timeGetTime();
  for (i = 0; i < NumPackets; i++) {
    if (_Receive(DevIndex, pBuffer, PacketSize)) {
      r = 1;
      break;
    }
  }
  if (r == 0) {
    tRead = timeGetTime() - t;
    printf ("\n%d packets of %d bytes successfully written in %d msec.", NumPackets, PacketSize, tWrite);
    printf ("\n%d packets of %d bytes successfully read    in %d msec.", NumPackets, PacketSize, tRead);
  }
End:
  free(pBuffer);
  USBBULK_CloseEx(DevIndex);
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
  int      r;
  U32      DeviceMask;
  char     Restart;
  unsigned NumDevices;
  unsigned DeviceId;

  Restart = 'N';
  do {
    char acRepeat[10];

    DeviceId   = 0;
    NumDevices = USBBULK_GetNumAvailableDevices(&DeviceMask);
    if (NumDevices) {
      printf("Serial no of \n");
      for (r = 0; r < 32; r++) {
        char ac[255];
        if ((1 << r) & DeviceMask) {
          USBBULK_GetSN(r, ac, sizeof(ac));
          printf("Device %d: %s\n", r, ac);
        }
      }
    } else {
      _MessageBox("No devices are available.\n");
      r = 1;
      break;
    }
    printf("To which device do you want to connect? ");
    scanf("%d", &DeviceId);
    if (DeviceId < USB_MAX_DEVICES) {
      if ((1 << DeviceId) & DeviceMask) {
        printf("Starting performance test...\n");

        r = _PerformanceTest(DeviceId);
        if (r) {      
          break;
        }
        printf("\nStart again? (y/n): ");
        acRepeat[0] = 6;
        _cgets(acRepeat);
        Restart = toupper(acRepeat[2]);
        if ((Restart != 'Y') && (Restart != 'N')) {
          Restart = 'Y';
        }
      } else {
        printf("Wrong device id selected\n");
        Restart = 'Y';
      }
    } 
  } while (Restart == 'Y');  
  if (r == 0) {
    printf("Communication with an USB BULK device was succesful!");
  }
  return r;
}

/******************************* End of file ************************/