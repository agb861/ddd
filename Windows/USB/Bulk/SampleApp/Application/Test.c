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
File    : Test.c
Purpose : USB BULK Test Application
---------------------------END-OF-HEADER------------------------------
*/

#include <stdio.h>
#include <windows.h>
#include "USBBULK.h"

/*********************************************************************
*
*       defines, configurable
*
**********************************************************************
*/

#define SIZEOF_BUFFER  0x4000
#define INC_TEST_START  1
#define INC_TEST_END    1024

/*********************************************************************
*
*       static data
*
**********************************************************************
*/


static char _acTxBuffer[SIZEOF_BUFFER];
static char _acRxBuffer[SIZEOF_BUFFER];


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
*       _SendBuffer
*
*/
static int _SendBuffer(unsigned char* pData, int Len) {
  int  r;
  char ac[2];

  if (Len) {
    printf("Writing %d bytes\n", Len);
    //
    //  Send 16bit Len, MSB first to be compatible with SampleApp
    //
    ac[0] = (Len >> 8);
    ac[1] = (Len & 0xFF);
    r = USBBULK_Write(ac, 2);
    if (r == 0) {
      _MessageBox("Could not write to device");
      return 0;
    }
    r = USBBULK_Write(pData, Len);
    return r;
  } else {
    return 0;
  }
}

/*********************************************************************
*
*       _ReadBuffer
*
*/
static int _ReadBuffer(unsigned char* pDest, int Len) {
  int r;

  printf("Reading %d bytes\n", Len);
  r = USBBULK_Read (pDest, Len);
  if (r == 0) {
    _MessageBox("Could not read from device (time out)");
  }
  return r;
}

/*********************************************************************
*
*       _SendReceive1
*
*/
static int _SendReceive1(unsigned char DataTx) {
  unsigned char DataRx;
  int r;

  printf("Writing one byte\n");
  r = USBBULK_Write(&DataTx, 1);
  if (r == 0) {
    _MessageBox("Could not write to device");
  }
  printf("Reading one byte\n");
  r = USBBULK_Read (&DataRx, 1);
  if (r == 0) {
    _MessageBox("Could not read from device (time out)");
  }
  if (DataRx != (DataTx + 1)) {
    _MessageBox("Wrong data read");
    return 1;
  }
  printf("Operation succesful!\n\n");
  return 0;
}

/*********************************************************************
*
*       _Test
*
*/
static int _Test(void) {
  int i;
  int NumBytes;
  int r;
  int t;
  //
  // Do a simple 1 byte test first
  //
  r = _SendReceive1(0x12);
  if (r) {
    return r;
  }
  r = _SendReceive1(0x13);
  if (r) {
    return r;
  }
  //
  // Initially fill buffer
  //
  for (NumBytes = 0; NumBytes < SIZEOF_BUFFER; NumBytes++) {
    _acTxBuffer[NumBytes] = NumBytes % 255; 
  }
  //
  // Test different sizes
  //
  for (NumBytes = INC_TEST_START; NumBytes <= INC_TEST_END; NumBytes++) {  // Send and receive various data packets
    r = _SendBuffer(_acTxBuffer, NumBytes);
    if (r != NumBytes) {
      _MessageBox("Could not write to device (time out)");
      return 1;
    }
    r = _ReadBuffer(_acRxBuffer, NumBytes);
    if (r != NumBytes) {
      _MessageBox("Could not read from device (time out)");
      return 1;
    }
    if (memcmp(_acRxBuffer, _acTxBuffer, NumBytes)) {
      _MessageBox("Wrong data received");
      return 1;
    }
  }
  //
  // Test speed
  //
  printf("Testing speed:");
  t = GetTickCount();
  for (i = 0; i< 500; i++) {
    int NumBytes = 4 * 1024;
    _acTxBuffer[0] = NumBytes >> 8;
    _acTxBuffer[1] = NumBytes & 255;
    USBBULK_WriteRead(_acTxBuffer, NumBytes + 2, _acTxBuffer, NumBytes);
    if (i %10 == 0) {
      printf(".");
    }
  }
  t = GetTickCount() - t;
  printf("\nPerformance: %d ms for 4MB", t);
  return 0;
}


/*********************************************************************
*
*       main
*
* Function description
*/
int main(int argc, char* argv[]) {
  int  r;
  char ac[200];
  unsigned Ver;

  if (USBBULK_Open() == NULL) {
    _MessageBox("Unable to connect to USB BULK device");
    return 1;
  }
  USBBULK_GetDriverCompileDate(ac, sizeof(ac));
  Ver = USBBULK_GetDriverVersion();
  printf("USB BULK driver version: %d.%.2d%c, compiled: %s\n", Ver / 10000, (Ver / 100) % 100, (Ver % 100) + 'a', ac);
  USBBULK_SetTimeout(3600 * 1000);
  r = _Test();
  USBBULK_Close();
  if (r == 0) {
    printf("Communication with USB BULK device succesful!");
  }
  return r;
}

/******************************* End of file ************************/