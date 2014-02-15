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
File    : Echo1.c
Purpose : USB BULK One byte echo application
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
*       _SendReceive1
*
*/
static int _SendReceive1(unsigned DeviceId, unsigned char DataTx) {
  unsigned char DataRx;
  int r;

  r = USBBULK_WriteReadEx(DeviceId, &DataTx, 1, &DataRx, 1);
  if (r < 1) {
    _MessageBox("Could not write to device");
    return 1;                      // Error
  }
  if (DataRx != (DataTx + 1)) {
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
*       _Echo1
*
*/
static int _Echo1(unsigned DeviceId) {
  int NumBytes2Send;
  int i;
  int r;
  char ac[100];

  r = 0;
  if (USBBULK_OpenEx(DeviceId) == NULL) {
    _MessageBox("Unable to connect to USB BULK device");
    return 1;
  }
  _ShowDriverInfo();
  USBBULK_SetTimeoutEx(DeviceId, 3600 * 1000);
  printf("Enter the number of bytes to be send to the echo client: ");
  ac[0] = 96;
  _cgets(ac);
  NumBytes2Send = atoi(&ac[2]);
  for (i = 0; i < NumBytes2Send; i++) {
    char DataTx;

    DataTx = i % 255;
    if (_SendReceive1(DeviceId, DataTx)) {
      r = 1;
      break;
    }
  }
  if (r == 0) {
    printf ("\n%d bytes successfully transferred.", NumBytes2Send);
  }
  USBBULK_CloseEx(DeviceId);
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
  }
  Restart = 'N';
  do {
    char acRepeat[10];
    printf("To which device do you want to connect?\nPlease type in device number (e.g. '0' for the first device):");
    scanf("%d", &DeviceId);
    if (DeviceId < USB_MAX_DEVICES) {
      if ((1 << DeviceId) & DeviceMask) {
        printf("Starting Echo...\n");

        r = _Echo1(DeviceId);
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
      }
    }
  } while (Restart == 'Y');  
  if (r == 0) {
    printf("Communication with USB BULK device succesful!");
  }
  return r;
}

/******************************* End of file ************************/