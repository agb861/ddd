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
#include "USBHID.h"

/*********************************************************************
*
*       defines, configurable
*
**********************************************************************
*/
#define USB_HID_DEFAULT_VENDOR_PAGE  0x12   // Must be identical to target hardware, Allowed values 8bit value (0x00-0xff).

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
  MessageBox(NULL, s, "USB HID sample application", MB_OK);
}


/*********************************************************************
*
*       _SendReceive1
*
*/
static int _SendReceive(unsigned DeviceId, U8 * pDataTx, unsigned NumBytes2Send, U8 * pDataRx, unsigned NumBytes2Receive) {
  int r;

  r = USBHID_Write(DeviceId, pDataTx, NumBytes2Send);
  USBHID_Read(DeviceId, pDataRx, NumBytes2Receive);
  if (r < 1) {
    _MessageBox("Could not write to device");
    return 1;                      // Error
  }
  if (*pDataRx != (*pDataTx + 1)) {
    _MessageBox("Wrong data read");
    return 1;                      // Error
  }
  printf(".");
  return 0;
}

/*********************************************************************
*
*       _Echo1
*
*/
static int _Echo1(unsigned DeviceId) {
  int      i;
  int      r;
  int      NumEchoes;
  char     ac[100];
  unsigned InputReportLength;
  unsigned OutputReportLength;
  U8     * pDataRx;
  U8     * pDataTx;

  r = 0;
  if (USBHID_Open(DeviceId) != 0) {
    _MessageBox("Unable to connect to USB HID device");
    return 1;
  }
  //
  //  Retrieve report sizes
  // 
  InputReportLength  = USBHID_GetInputReportSize(DeviceId);
  OutputReportLength = USBHID_GetOutputReportSize(DeviceId);
  //
  // Alloc memeory for in/out report
  pDataTx = (U8 *)calloc(OutputReportLength, sizeof(U8));
  pDataRx = (U8 *)calloc(InputReportLength,  sizeof(U8));
  if ((pDataRx == NULL) || (pDataTx == NULL)) {
    printf("No memory available to create buffer for sending/receiving data\n");
    r = 1;
    goto End;
  }
  printf("Enter the number of echoes to be sent to the echo client: ");
  ac[0] = 96;
  _cgets(ac);
  NumEchoes = atoi(&ac[2]);
  for (i = 0; i < NumEchoes; i++) {

    *pDataTx = i % 255;
    if (_SendReceive(DeviceId, pDataTx, OutputReportLength, pDataRx, InputReportLength)) {
      r = 1;
      break;
    }
  }
  if (r == 0) {
    printf ("\n%d echoes successfully transferred.", NumEchoes);
  }
End:
  free(pDataTx);
  free(pDataRx);
  USBHID_Close(DeviceId);
  return r;
}

/*********************************************************************
*
*       _ShowInfo
*
*/
static void _ShowInfo(unsigned DeviceId) {  
  char     ac[255];
  U16      VendorId;
  U16      ProductId;
  unsigned InputReportLength;
  unsigned OutputReportLength;

  USBHID_GetProductName(DeviceId, ac, sizeof(ac));
  VendorId  = USBHID_GetVendorId(DeviceId);
  ProductId = USBHID_GetProductId(DeviceId);
  InputReportLength = USBHID_GetInputReportSize(DeviceId);
  OutputReportLength = USBHID_GetOutputReportSize(DeviceId);
  printf("Device %d:\n"
         "  Productname: %s\n"
         "  VID        : 0x%.4x\n"
         "  PID        : 0x%.4x\n"
         "  ReportSizes:\n"
         "   Input     : %d bytes\n"
         "   Output    : %d bytes\n", DeviceId, ac, VendorId, ProductId, InputReportLength, OutputReportLength);
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
  //
  //  Initialize first
  //
  USBHID_Init(USB_HID_DEFAULT_VENDOR_PAGE);
  //
  //  Check first, how many devices are available.
  //
  Restart = 'N';
  r       = 1;  // Set error so far
  do {
    char acRepeat[10];

    NumDevices = USBHID_GetNumAvailableDevices(&DeviceMask);
    if (NumDevices == 1) {
      _ShowInfo(0);
    } else if (NumDevices) {
      printf("AvailableDevices = %d\n", NumDevices);
      for (r = 0; r < 32; r++) {
        if ((1 << r) & DeviceMask) {
          _ShowInfo(r);
        }
      }
      printf("To which device do you want to connect? ");
      scanf("%d", &DeviceId);
    } else {
      printf("No devices available\n");
      break;
    }
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
    printf("Communication with USB HID device succesful!");
  }
  USBHID_Exit();
  return r;
}

/******************************* End of file ************************/