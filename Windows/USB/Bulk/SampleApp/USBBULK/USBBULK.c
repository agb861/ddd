/*********************************************************************
*                SEGGER MICROCONTROLLER GmbH & Co. KG                *
*        Solutions for real time microcontroller applications        *
**********************************************************************
*                                                                    *
*        (c) 2003-2012     SEGGER Microcontroller GmbH & Co KG       *
*                                                                    *
*        Internet: www.segger.com    Support:  support@segger.com    *
*                                                                    *
**********************************************************************

----------------------------------------------------------------------
File    : USBBULK.c
Purpose : USB functions
---------------------------END-OF-HEADER------------------------------
*/

#define WIN32_LEAN_AND_MEAN

#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <setupapi.h>
#include <WINIOCTL.H>
#include "USBBULK.h"

/*********************************************************************
*
*       Defines, configurable
*
**********************************************************************
*/
#define USBBULK_PIPE_READ_PATH     "\\pipe00"
#define USBBULK_PIPE_WRITE_PATH    "\\pipe01"

#define DEFAULT_TIMEOUT            10 * 1000 // 10 seconds

/*********************************************************************
*
*       Defines, non configurable
*
**********************************************************************
*/
#define USB_BULK_IOCTL_INDEX                   0x0111
#define IOCTL_USB_BULK_GET_CONFIG_DESCRIPTOR   CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  0, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_RESET_DEVICE            CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  1, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_RESET_PIPE              CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  2, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_SET_MODE                CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  3, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_GET_MODE                CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  4, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_GET_VERSION             CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  5, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_GET_COMPILE_DATE        CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  6, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_GET_READ_TRANSFER_SIZE  CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  7, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_GET_WRITE_TRANSFER_SIZE CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  8, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_GET_SN                  CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX +  9, METHOD_BUFFERED, FILE_ANY_ACCESS)
#define IOCTL_USB_BULK_GET_ENUM_TICK_COUNT     CTL_CODE(FILE_DEVICE_UNKNOWN, USB_BULK_IOCTL_INDEX + 10, METHOD_BUFFERED, FILE_ANY_ACCESS)

#define MIN(a,b)    (a < b) ? a : b

static GUID _BulkGUID = {0x54654e76, 0xdcf7, 0x4a7f, 0x87, 0x8a, 0x4e, 0x8f, 0xca, 0xa, 0xcc, 0x9a};

/*********************************************************************
*
*       Types
*
**********************************************************************
*/
typedef struct {
  HANDLE     hDevice;           // handle to device
  HANDLE     hPipeRead;         // handle to pipe in
  HANDLE     hPipeWrite;        // handle to pipe out
  OVERLAPPED OverlapRead;
  int        Timeout;
  unsigned   MaxReadTransferSize;
  unsigned   MaxWriteTransferSize;
  char       acBuffer[USBBULK_BUFFERSIZE];
  unsigned   BufferCnt;
  char       PendingRead;
  char       ShortReadEnabled;
  char       ShortWriteEnabled;
} CONN_INFO;

typedef struct {
  char acName[256];
} DEVICE_NAME;

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static CONN_INFO * _apConnInfo[USB_MAX_DEVICES];
static int         _IsInited;
static unsigned    _NumDevices;
static U16         _VendorId  = 0x8765;
static U16         _ProductId = 0x1234;
static DEVICE_NAME _aDeviceName[USB_MAX_DEVICES];

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/



/*********************************************************************
*
*       _Char2Hex
*/
static int _Char2Hex(char c) {
  if ((c >= '0') && (c <= '9')) {
    return c - '0';
  } else if ((c >= 'a') && (c <= 'f')) {
    return c - 'a'+10;
  } else if ((c >= 'A') && (c <= 'F')) {
    return c - 'A'+10;
  }
  return -1;
}


/*********************************************************************
*
*       _ParseHex
*/
static U16 _ParseHex(const char * p, unsigned NumChars) {
  char c;
  U16  r;

  r = 0;
  while (NumChars--) {
    int Digit;

    c = *p++;
    Digit = _Char2Hex(c);
    if (Digit < 0) {
      return 0;
    }
    r = (r << 4) + Digit;
  }
  return r;
}

/*********************************************************************
*
*       _GetVendorId
*/
static U16 _GetVendorId(const char * s) {
  U16    r;
  char * p;

  r = 0;
  p = strstr(s, "vid_");
  if (p) {
    p += 4;
    r = _ParseHex(p, 4);
  }
  return r;
}


/*********************************************************************
*
*       _GetProductId
*/
static U16 _GetProductId(const char * s) {
  U16    r;
  char * p;

  r = 0;
  p = strstr(s, "pid_");
  if (p) {
    p += 4;
    r = _ParseHex(p, 4);
  }
  return r;
}

/*********************************************************************
*
*       _CheckIDs
*/
static int _CheckIDs(const char *sDevicePath) {
  U16 VendorId;
  U16 ProductId;

  VendorId  = _GetVendorId(sDevicePath);
  ProductId = _GetProductId(sDevicePath);
  if (VendorId != _VendorId) {
    return 1;
  }
  if (ProductId != _ProductId) {
    return 1;
  }
  return 0;
}

/*********************************************************************
*
*       _RetrieveInfo
*/
static int _RetrieveInfo(HANDLE hDevList, SP_DEVICE_INTERFACE_DATA * pDevData, DEVICE_NAME * pDeviceName) {
  SP_INTERFACE_DEVICE_DETAIL_DATA * pDevDetail;
  DWORD                             ReqLen;
  BOOL                              succ;

  ReqLen     = 0;
  pDevDetail = NULL;
  // get length of INTERFACE_DEVICE_DETAIL_DATA, allocate buffer
  // This function call returns the system error "buffer too small" (code 122).
  // We ignore this return code.
  SetupDiGetDeviceInterfaceDetail(hDevList, pDevData, NULL, ReqLen, &ReqLen, NULL);
  pDevDetail = (SP_INTERFACE_DEVICE_DETAIL_DATA*)malloc(ReqLen);
  if (pDevDetail == NULL ) {
    // Memory allocation failed
    return 0;
  }
  // now get the INTERFACE_DEVICE_DETAIL_DATA struct
  ZeroMemory(pDevDetail,ReqLen);
  pDevDetail->cbSize = sizeof(SP_INTERFACE_DEVICE_DETAIL_DATA);
  succ = SetupDiGetDeviceInterfaceDetail(hDevList, pDevData, pDevDetail, ReqLen, &ReqLen, NULL);
  if (succ == FALSE) {
    // Could not retrieve information about the device
    free(pDevDetail);
    return 0;
  }
  if (_CheckIDs(pDevDetail->DevicePath)) {
    // Device does not match with Product and vendor id.
    free(pDevDetail);
    return 0;
  }
  strcpy(pDeviceName->acName, pDevDetail->DevicePath);
  free(pDevDetail);
  return 1;
}


/*********************************************************************
*
*       _Init
*/
static int _Init(void) {
  if (_IsInited == 0) {
    // variables needed for device enumeration
    HDEVINFO                 hDevList;
    SP_DEVICE_INTERFACE_DATA DevData;
    BOOL                     succ;
    DWORD                    i;
    DEVICE_NAME            * pDeviceName;

    // create a list of attached devices
    hDevList = SetupDiGetClassDevs(&_BulkGUID, NULL, NULL, DIGCF_DEVICEINTERFACE | DIGCF_PRESENT);
    if (hDevList == INVALID_HANDLE_VALUE) {
      printf("SetupDiGetClassDevs failed, err=%d\n",GetLastError());
      return 0;
    }
    // enumerate device interfaces
    ZeroMemory(&DevData,sizeof(DevData));
    DevData.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
    _NumDevices = 0;
    pDeviceName = &_aDeviceName[0];
    for (i = 0; i < 127; i++) {
      DWORD LastError;
      succ = SetupDiEnumDeviceInterfaces(hDevList, NULL, &_BulkGUID, i, &DevData);
      if (succ == 0) {
        LastError = GetLastError();
        if (LastError == ERROR_NO_MORE_ITEMS) {
          break;
        } else {
          // There are no device attached using the usb bulk driver
          SetupDiDestroyDeviceInfoList(hDevList);
          return 0;
        }
      }
      if (_RetrieveInfo(hDevList, &DevData, pDeviceName)) {
        _NumDevices++;
        pDeviceName++;

      }
    }
    SetupDiDestroyDeviceInfoList(hDevList);
    _IsInited = 1;
  }
  return 1;
}

/*********************************************************************
*
*       _Write
*
* Function description
*/
static int _Write(CONN_INFO * pConnInfo, const void * pBuffer, unsigned NumBytes) {
  const char * p;
  unsigned NumBytesWrittenTotal;

  NumBytesWrittenTotal = 0;
  if (pConnInfo) {
    p = (const char *) pBuffer;
    while (NumBytes) {
      unsigned long NumBytesAtOnce;
      unsigned long NumBytesWritten;
      NumBytesAtOnce = MIN(NumBytes, pConnInfo->MaxWriteTransferSize);
      if (!WriteFile(pConnInfo->hPipeWrite, p, NumBytesAtOnce, &NumBytesWritten, NULL)) {
        break;
      }
      NumBytes             -= NumBytesWritten;
      p                    += NumBytesWritten;
      NumBytesWrittenTotal += NumBytesWritten;
      if (pConnInfo->ShortWriteEnabled) {
        break;
      }
    }
  }
  return NumBytesWrittenTotal;
}


/*********************************************************************
*
*       _Copy2ApplicationBuffer
*
* Function description
*/
static unsigned _Copy2ApplicationBuffer(CONN_INFO * pConnInfo, void ** ppBuf, unsigned * pNumBytes) {
  unsigned   NumBytes2Copy = 0;
  char    ** ppBuffer;

  ppBuffer = (char **)ppBuf;
  NumBytes2Copy = MIN(*pNumBytes, pConnInfo->BufferCnt);
  memcpy(*ppBuffer, pConnInfo->acBuffer, NumBytes2Copy);
  pConnInfo->BufferCnt -= NumBytes2Copy;
  *pNumBytes            -= NumBytes2Copy;
  *ppBuffer             += NumBytes2Copy;
  return NumBytes2Copy;
}

/*********************************************************************
*
*       _Read
*
* Function description
*/
static int _Read(CONN_INFO * pConnInfo, void * pBuffer, unsigned NumBytesReq) {
  unsigned long  nBytesRead = 0;
  unsigned long  NumBytesRead = 0;
  int            NumBytesAtOnce;
  unsigned       NumBytesCopied;
  DWORD          r;

  if (pConnInfo) {
    if (NumBytesReq == 0) {
      return 0;
    }
    if (pConnInfo->BufferCnt) {
      NumBytesCopied  = _Copy2ApplicationBuffer(pConnInfo, &pBuffer, &NumBytesReq);
    }
    if (NumBytesReq) {
      do {
        NumBytesAtOnce = MIN(NumBytesReq, pConnInfo->MaxReadTransferSize);
        if (pConnInfo->PendingRead == 0) {
          char  * pWriteBuffer;
          pWriteBuffer = &pConnInfo->acBuffer[pConnInfo->BufferCnt];
          //
          //  Ignore the number of bytes read by ReadFile since we use a Overlap structure.
          // 
          ReadFile(pConnInfo->hPipeRead, pWriteBuffer, NumBytesAtOnce, NULL, &pConnInfo->OverlapRead);
        }
        r = WaitForSingleObject(pConnInfo->OverlapRead.hEvent, pConnInfo->Timeout);
        if (r == WAIT_TIMEOUT) {
          //
          // On a timeout we set PendingRead to 1 and let return the number of bytes we already have read.
          //
          GetOverlappedResult(pConnInfo->hPipeRead, &pConnInfo->OverlapRead, &NumBytesRead, FALSE);
          pConnInfo->PendingRead = 1;
          return NumBytesRead;

        }
        pConnInfo->PendingRead = 0;
        // check on the results of the asynchronous read 
        GetOverlappedResult(pConnInfo->hPipeRead, &pConnInfo->OverlapRead, &NumBytesRead, FALSE);
        if (NumBytesRead == 0) {
          return -1; /* Device is not connected to host */
        }
        pConnInfo->BufferCnt += NumBytesRead;
        nBytesRead            += NumBytesRead;
        NumBytesCopied         = _Copy2ApplicationBuffer(pConnInfo, &pBuffer, &NumBytesAtOnce);
        NumBytesReq           -= NumBytesCopied; 
        if (pConnInfo->ShortReadEnabled) {
          break;
        }

      } while(NumBytesReq);
    }
  }
  return nBytesRead;

}

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

/*********************************************************************
*
*       USBBULK_SetTimeoutEx
*
* Function description
*/
void USBBULK_SetTimeoutEx(unsigned Id, int Timeout) {
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  if (pConnInfo) {
    pConnInfo->Timeout = (DWORD) Timeout;
  }
}

/*********************************************************************
*
*       USBBULK_SetTimeout
*
* Function description
*/
void USBBULK_SetTimeout(int Timeout) {
  USBBULK_SetTimeoutEx(0, Timeout);
}

/*********************************************************************
*
*       USBBULK_OpenEx
*
* Function description
*/
void *USBBULK_OpenEx(unsigned Id) {
  CONN_INFO * pConnInfo;
  HANDLE      hTmp;
  char        acPipeName[512];
  
  hTmp      = INVALID_HANDLE_VALUE;
  _Init();
  pConnInfo = (CONN_INFO *) calloc(sizeof(CONN_INFO), 1);
  if (pConnInfo) {
    char * pDeviceName;

    
    pConnInfo->Timeout = DEFAULT_TIMEOUT;
    if (Id > _NumDevices) {
      free(pConnInfo);
      return NULL;
    }
    pDeviceName = _aDeviceName[Id].acName;
    hTmp = CreateFile(pDeviceName, GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
    
    if (hTmp != INVALID_HANDLE_VALUE) {
      pConnInfo->hDevice = hTmp;
      //
      // Create read pipe
      //
      sprintf(acPipeName, "%s%s", pDeviceName, USBBULK_PIPE_READ_PATH);
      hTmp = CreateFile(acPipeName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, FILE_FLAG_OVERLAPPED, NULL);
      if (hTmp != INVALID_HANDLE_VALUE) {
        pConnInfo->hPipeRead = hTmp;
        //
        // Init overlay structure
        //
        pConnInfo->OverlapRead;
        memset (&pConnInfo->OverlapRead, 0, sizeof(pConnInfo->OverlapRead));
        pConnInfo->OverlapRead.hEvent = CreateEvent(NULL, 1, 0, NULL);
        //
        // Create write pipe
        //
        sprintf(acPipeName, "%s%s", pDeviceName, USBBULK_PIPE_WRITE_PATH);
        hTmp = CreateFile(acPipeName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
        if (hTmp != INVALID_HANDLE_VALUE) {
          pConnInfo->hPipeWrite = hTmp;
        } else {
          CloseHandle(pConnInfo->hPipeRead);
          CloseHandle(pConnInfo->hDevice);
        }
      } else {
        CloseHandle(pConnInfo->hDevice);
      }
    }
  }
  if (hTmp == INVALID_HANDLE_VALUE) {
    free(pConnInfo);
    pConnInfo = NULL;
  }
  _apConnInfo[Id] = pConnInfo;
  if (_apConnInfo[Id]) {
    _apConnInfo[Id]->MaxReadTransferSize  = USBBULK_GetReadMaxTransferSize();
    _apConnInfo[Id]->MaxWriteTransferSize = USBBULK_GetWriteMaxTransferSize();
  }
  return pConnInfo;
}

/*********************************************************************
*
*       USBBULK_Open
*
* Function description
*/
void *USBBULK_Open(void) {
  return USBBULK_OpenEx(0);
}


/*********************************************************************
*
*       USBBULK_CloseEx
*
* Function description
*/
void USBBULK_CloseEx(unsigned Id) {
  CONN_INFO * pConnInfo;
  
  pConnInfo = _apConnInfo[Id];
  if (pConnInfo) {
    CloseHandle(pConnInfo->hPipeRead);
    CloseHandle(pConnInfo->hPipeWrite);
    CloseHandle(pConnInfo->hDevice);
    CloseHandle(pConnInfo->OverlapRead.hEvent); 
    free(pConnInfo);
    pConnInfo = NULL;
  }
  _apConnInfo[Id] = pConnInfo;
}

/*********************************************************************
*
*       USBBULK_Close
*
* Function description
*/
void USBBULK_Close(void) {
  USBBULK_CloseEx(0);
}

/*********************************************************************
*
*       USBBULK_ReadEx
*
* Function description
*/
int USBBULK_ReadEx(unsigned Id, void * pBuffer, int NumBytes) {
  CONN_INFO * pConnInfo;
  pConnInfo = _apConnInfo[Id];
  return _Read(pConnInfo, pBuffer, NumBytes);
}

/*********************************************************************
*
*       USBBULK_Read
*
* Function description
*/
int USBBULK_Read(void * pBuffer, int NumBytes) {
  return USBBULK_ReadEx(0, pBuffer, NumBytes);
}

/*********************************************************************
*
*       USBBULK_WriteEx
*/
int USBBULK_WriteEx(unsigned Id, const void * pBuffer, int NumBytes) {
  int         NumBytesWritten = 0;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  NumBytesWritten =_Write(pConnInfo, pBuffer, NumBytes);
  return NumBytesWritten;
}

/*********************************************************************
*
*       USBBULK_Write
*/
int USBBULK_Write(const void * pBuffer, int NumBytes) {
  return USBBULK_WriteEx(0, pBuffer, NumBytes);
}

/*********************************************************************
*
*       USBBULK_WriteReadEx
*
* Function description
*   Write to the device & read.
*   Reason to have this function is that it reduces latencies.
* Notes
*   (1)  This function can not be used when short read mode is enabled.
*/
int USBBULK_WriteReadEx(unsigned Id, const void * pWrBuffer, int WrNumBytes, void *  pRdBuffer, int RdNumBytes) {
  unsigned long   NumBytesWritten = 0;
  unsigned long   NumBytesRead = 0;
  CONN_INFO     * pConnInfo;
  pConnInfo = _apConnInfo[Id];
  if (pConnInfo) {
    ReadFile(pConnInfo->hPipeRead, pRdBuffer, RdNumBytes, &NumBytesRead, &pConnInfo->OverlapRead); /* Note 1 */
    if (!WriteFile(pConnInfo->hPipeWrite, pWrBuffer, WrNumBytes, &NumBytesWritten, NULL)) {
      NumBytesWritten = 0;
    }
    if (WaitForSingleObject(pConnInfo->OverlapRead.hEvent, pConnInfo->Timeout) == WAIT_TIMEOUT) {
      CancelIo(pConnInfo->hPipeRead);
      return NumBytesRead;            // Timed out, let's cancel pending I/O operation on the pipe
    }
    // check on the results of the asynchronous read 
    GetOverlappedResult(pConnInfo->hPipeRead, &pConnInfo->OverlapRead, &NumBytesRead, FALSE);
  }
  return NumBytesRead;
}

/*********************************************************************
*
*       USBBULK_WriteRead
*
* Function description
*   Write to the device & read.
*   Reason to have this function is that it reduces latencies.
* Notes
*   (1)  This function can not be used when short read mode is enabled.
*/
int USBBULK_WriteRead (const void * pWrBuffer, int WrNumBytes, void *  pRdBuffer, int RdNumBytes) {
  return USBBULK_WriteReadEx(0, pWrBuffer, WrNumBytes, pRdBuffer, RdNumBytes);
}

/*********************************************************************
*
*       USBBULK_CancelReadEx
*
* Function description
*   This cancels an initiated read.
*/
void USBBULK_CancelReadEx(unsigned Id) {
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  if (pConnInfo) {
    if (pConnInfo->PendingRead) {
      CancelIo(pConnInfo->hPipeRead);
    }
  }
}


/*********************************************************************
*
*       USBBULK_CancelRead
*
* Function description
*   This cancels an initiated read.
*/
void USBBULK_CancelRead(void) {
  USBBULK_CancelReadEx(0);
}


/*********************************************************************
*
*       USBBULK_GetConfigDescriptorEx
*/
int USBBULK_GetConfigDescriptorEx(unsigned Id, void* pBuffer, int Size) {
  int   r;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  r = 0;
  if (pConnInfo) {
   DWORD len;
 
   r = DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_GET_CONFIG_DESCRIPTOR,
                       pBuffer, Size, pBuffer, Size, &len, NULL);
  }
  return r;
}

/*********************************************************************
*
*       USBBULK_GetConfigDescriptor
*/
int USBBULK_GetConfigDescriptor (void* pBuffer, int Size) {
  return USBBULK_GetConfigDescriptorEx(0, pBuffer, Size);
}

/*********************************************************************
*
*       USBBULK_ResetPipeEx
*/
int USBBULK_ResetPipeEx(unsigned Id) {
  DWORD       Len = 0;
  BOOL        Res;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  Res = FALSE;
  if (pConnInfo) {
	  Res = DeviceIoControl(pConnInfo->hPipeRead, IOCTL_USB_BULK_RESET_PIPE, NULL, 0, NULL, 0, &Len, NULL);
	  if (Res) {
		  Res = DeviceIoControl(pConnInfo->hPipeWrite, IOCTL_USB_BULK_RESET_PIPE, NULL, 0, NULL, 0, &Len, NULL);
	  }
  }
  return Res;
}

/*********************************************************************
*
*       USBBULK_ResetPipe
*/
int USBBULK_ResetPipe(void) {
  return USBBULK_ResetPipeEx(0);
}

/*********************************************************************
*
*       USBBULK_ResetDeviceEx
*/
int USBBULK_ResetDeviceEx(unsigned Id) {
  int   r;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  r = 0;
  if (pConnInfo) {
    DWORD len = 0;

    r = DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_RESET_DEVICE, NULL, 0, NULL, 0, &len, NULL);
  }
  return r;
}

/*********************************************************************
*
*       USBBULK_ResetDevice
*/
int USBBULK_ResetDevice(void) {
  return USBBULK_ResetDeviceEx(0);
}

/*********************************************************************
*
*       USBBULK_GetDriverVersion
*/
unsigned USBBULK_GetDriverVersion(void) {
  unsigned Version;
  unsigned i;
  DWORD len = 0;
  CONN_INFO * pConnInfo;

  pConnInfo = NULL;
  for (i = 0; i < USB_MAX_DEVICES; i++) {
    if (_apConnInfo[i]) {
      pConnInfo = _apConnInfo[i];
      break;
    }
  }
  Version = 0;
  if (pConnInfo) {
    DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_GET_VERSION, NULL, 0, &Version, sizeof(Version), &len, NULL);
  }
  return Version;
}

/*********************************************************************
*
*       USBBULK_GetDriverCompileDate
*/
unsigned USBBULK_GetDriverCompileDate(char * s, unsigned Size) {
  DWORD       Len = 0;
  unsigned    i;
  unsigned    r;
  CONN_INFO * pConnInfo;

  pConnInfo = NULL;
  for (i = 0; i < USB_MAX_DEVICES; i++) {
    if (_apConnInfo[i]) {
      pConnInfo = _apConnInfo[i];
      break;
    }
  }
  r = 0;
  if (pConnInfo) {
   r = DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_GET_COMPILE_DATE, NULL, 0, s, Size, &Len, NULL);
  }
  return r;
}


/*********************************************************************
*
*       USBBULK_SetModeEx
*/
unsigned USBBULK_SetModeEx(unsigned Id, unsigned Mode) {
  unsigned r;
  DWORD    len = 0;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  r = 0;
  if (pConnInfo) {
    r = DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_SET_MODE, &Mode, sizeof(Mode), NULL, 0, &len, NULL);
    if (r) {
      pConnInfo->ShortReadEnabled = (Mode && USBBULK_MODE_BIT_ALLOW_SHORT_READ);
      pConnInfo->ShortWriteEnabled = (Mode && USBBULK_MODE_BIT_ALLOW_SHORT_WRITE);
    }
  }
  return r;
}

/*********************************************************************
*
*       USBBULK_SetMode
*/
unsigned USBBULK_SetMode(unsigned Mode) {
  return USBBULK_SetModeEx(0, Mode);
}

/*********************************************************************
*
*       USBBULK_GetModeEx
*/
unsigned USBBULK_GetModeEx(unsigned Id) {
  DWORD len = 0;
  unsigned Mode;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  Mode = 0;
  if (pConnInfo) {
    DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_GET_MODE, NULL, 0, &Mode, sizeof(Mode), &len, NULL);
  }
  return Mode;
}

/*********************************************************************
*
*       USBBULK_GetMode
*/
unsigned USBBULK_GetMode(void) {
  return USBBULK_GetModeEx(0);
}

/*********************************************************************
*
*       USBBULK_GetReadMaxTransferSizeEx
*/
unsigned USBBULK_GetReadMaxTransferSizeEx(unsigned Id) {
  DWORD len = 0;
  unsigned MaxTransferSize;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  MaxTransferSize = 0;
  if (pConnInfo) {
    if (pConnInfo->MaxReadTransferSize == 0) {
      DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_GET_READ_TRANSFER_SIZE, NULL, 0, &MaxTransferSize, sizeof(MaxTransferSize), &len, NULL);
    } else {
      MaxTransferSize = pConnInfo->MaxReadTransferSize;
    }
  }
  return MaxTransferSize;
}

/*********************************************************************
*
*       USBBULK_GetReadMaxTransferSize
*/
unsigned USBBULK_GetReadMaxTransferSize(void) {
  return USBBULK_GetReadMaxTransferSizeEx(0);
}

/*********************************************************************
*
*       USBBULK_GetWriteMaxTransferSizeEx
*/
unsigned USBBULK_GetWriteMaxTransferSizeEx(unsigned Id) {
  DWORD len = 0;
  unsigned MaxTransferSize;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[Id];
  MaxTransferSize = 0;
  if (pConnInfo) {
    if (pConnInfo->MaxWriteTransferSize == 0) {
      DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_GET_WRITE_TRANSFER_SIZE, NULL, 0, &MaxTransferSize, sizeof(MaxTransferSize), &len, NULL);
    } else {
      MaxTransferSize = pConnInfo->MaxWriteTransferSize;
    }
  }
  return MaxTransferSize;
}

/*********************************************************************
*
*       USBBULK_GetWriteMaxTransferSize
*/
unsigned USBBULK_GetWriteMaxTransferSize(void) {
  return USBBULK_GetWriteMaxTransferSizeEx(0);
}


/*********************************************************************
*
*       USBBULK_Control
*/
int USBBULK_Control(USBBULK_CONTROL Action, PVOID pBuffer, int Size) {
  DWORD len = 0;
  BOOL Res;
  CONN_INFO * pConnInfo;

  pConnInfo = _apConnInfo[0];
  Res = FALSE;
  if (Action == UsbResetPipe) {
    Res = DeviceIoControl(pConnInfo->hPipeRead, IOCTL_USB_BULK_RESET_PIPE, NULL, 0, NULL, 0, &len, NULL);
    if (Res) {
      Res = DeviceIoControl(pConnInfo->hPipeWrite, IOCTL_USB_BULK_RESET_PIPE, NULL, 0, NULL, 0, &len, NULL);
    }
  } else if (Action == UsbResetDevice) {
    Res = DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_RESET_DEVICE, NULL, 0, NULL, 0, &len, NULL);
  } else if (Action == UsbGetConfigDescriptor) {
    Res = DeviceIoControl(pConnInfo->hDevice, IOCTL_USB_BULK_GET_CONFIG_DESCRIPTOR,
                          pBuffer, Size, pBuffer, Size, &len, NULL);
  }
  return(Res);
}

/*********************************************************************
*
*       USBBULK_GetSN
*/
int USBBULK_GetSN(unsigned Id, char * pBuffer, unsigned NumBytes) {
  DWORD  len = 0;
  BOOL   Res;
  HANDLE hDevice;

  if (Id > _NumDevices) {
    return FALSE;
  }
  hDevice = CreateFile(_aDeviceName[Id].acName, GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
  if (hDevice  == INVALID_HANDLE_VALUE) {
    Res = FALSE;
  }
  Res = DeviceIoControl(hDevice, IOCTL_USB_BULK_GET_SN, pBuffer, NumBytes, pBuffer, NumBytes, &len, NULL);
  CloseHandle(hDevice);
  return(Res);
}


/*********************************************************************
*
*       USBBULK_GetNumAvailableDevices
*/
unsigned USBBULK_GetNumAvailableDevices(U32 * pMask) {
  unsigned      i;
  U32           Mask;
  DEVICE_NAME * pDeviceName;
 
  _Init();
  Mask  = 0;
  pDeviceName = &_aDeviceName[0];
  for (i = 0; i < USB_MAX_DEVICES; i++) {
    if (pDeviceName->acName[0] != 0) {
      Mask |= (1 << i);
    }
    pDeviceName++;
  }
  if (pMask) {
    *pMask = Mask;
  }
  return _NumDevices;
}

/*********************************************************************
*
*       USBBULK_SetUSBId
*/
void USBBULK_SetUSBId(U16 VendorId, U16 ProductId) {
  _VendorId  = VendorId;
  _ProductId = ProductId;
  _IsInited = 0;
}


/*********************************************************************
*
*       USBBULK_GetEnumTickCount
*/
U32 USBBULK_GetEnumTickCount(unsigned Id) {
  U32    r;
  HANDLE hDevice;
  DWORD  NumBytesReturned;

  if (Id > _NumDevices) {
    return 0;
  }
  r = 0;
  hDevice = CreateFile(_aDeviceName[Id].acName, GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
  if (hDevice  != INVALID_HANDLE_VALUE) {
    DeviceIoControl(hDevice, IOCTL_USB_BULK_GET_ENUM_TICK_COUNT, NULL, 0, &r, sizeof(r), &NumBytesReturned, NULL);
  }
  return r;
}

/*************************** End of file ****************************/
