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
File    : OS_USBH_MSD.c
Purpose : Sample program for embOS & USBH USB host stack.
          Demonstrates use of the USBH stack.
--------- END-OF-HEADER --------------------------------------------*/


#include <stdio.h>
#include "RTOS.h"
#include "BSP.h"
#include "USBH.h"
#include "USBH_MSD.h"
#include "FS.h"

/*********************************************************************
*
*       Local defines, configurable
*
**********************************************************************
*/
#define COUNTOF(a)  (sizeof(a)/sizeof(a[0]))

enum {
  TASK_PRIO_APP = 150,
  TASK_PRIO_USBH_MAIN,
  TASK_PRIO_USBH_ISR
};

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_STACKPTR int     _StackMain[1024/sizeof(int)];
static OS_TASK             _TCBMain;

static OS_STACKPTR int     _StackIsr[1024/sizeof(int)];
static OS_TASK             _TCBIsr;
static volatile char       _MSDReady;
static U8                  _CurrentDevIndex;

/*********************************************************************
*
*       Static Code
*
**********************************************************************
*/

#if 1

/*********************************************************************
*
*       _CalcKBytes
*
*  Function description
*    Multiplies 2 values and returns the result divided by 1024.
*    The reason for using a routine is that with a simple multiplication,
*    the 4GB range that a U32 can hold is typically exceeded.
*
*  Parameters
*    NumItems      Number of items such as number of sectors
*    BytesPerItem  Bytes per item, such as number of bytes is a sector or cluster. MUST BE A POWER OF 2!
*/
static U32 _CalcXBytes(U32 NumItems, U32 BytesPerItem, unsigned ShiftCnt) {
  int i;
  U32 v;

  //
  // Compute number of bits to shift. 512: -1, 1024:0, 2048: 1
  //
  i = -ShiftCnt;
  while (BytesPerItem) {
    BytesPerItem >>= 1;
    i++;
  }
  //
  // Shift NumItems to compute the result
  //
  if (i > 0) {
    v = NumItems << i;
  } else if (i < 0) {
    v = NumItems >> -i;
  }
  return v;
}

/*********************************************************************
*
*       _CalcKBytes
*
*  Function description
*    Multiplies 2 values and returns the result divided by 1024.
*    The reason for using a routine is that with a simple multiplication,
*    the 4GB range that a U32 can hold is typically exceeded.
*
*  Parameters
*    NumItems      Number of items such as number of sectors
*    BytesPerItem  Bytes per item, such as number of bytes is a sector or cluster. MUST BE A POWER OF 2!
*/
static U32 _CalcKBytes(U32 NumItems, U32 BytesPerItem) {
  return _CalcXBytes(NumItems, BytesPerItem, 11);
}

/*********************************************************************
*
*       _CalcMBytes
*
*/
static U32 _CalcMBytes(U32 NumItems, U32 BytesPerItem) {
  return _CalcXBytes(NumItems, BytesPerItem, 21);
}


/*********************************************************************
*
*       _ShowDiskInfo
*/
static void _ShowDiskInfo(const char * s) {
  FS_DISK_INFO DiskInfo;

  if (FS_GetVolumeInfo(s, &DiskInfo) != 0) {
    printf("**** Failed to retrieve volume information\n");
  } else {
    U32 DiskSpace;
    U32 FreeSpace;
    U32 BytesPerCluster;

    BytesPerCluster   = DiskInfo.BytesPerSector * DiskInfo.SectorsPerCluster;
    DiskSpace = _CalcKBytes(DiskInfo.NumTotalClusters, BytesPerCluster);
    FreeSpace = _CalcKBytes(DiskInfo.NumFreeClusters, BytesPerCluster);
    printf("\n**** Volume information for %s\n"
           "   %10d KBytes total disk space\n"
           "   %10d KBytes available free space\n\n"
           "   %10d bytes per cluster\n"
           "   %10d clusters available on volume\n"
           "   %10d free cluster available on volume\n"
           , s, DiskSpace, FreeSpace, BytesPerCluster, DiskInfo.NumTotalClusters, DiskInfo.NumFreeClusters);
  }
}

#else

/*********************************************************************
*
*       _ShowDiskInfo
*/
static void _ShowDiskInfo(const char * s) {
  U32 v;

  v = FS_GetVolumeSizeKB(s);
  if (v <= 0x7fff) {
    printf("Total space: %u kBytes\n", v);
  } else if (v <= 0x2000000UL) {
    v >>= 10;
    printf("Total space: %u MBytes\n", v);
  } else {
    v >>= 20;
    printf("Total space: %u GBytes\n", v);
  }
}

#endif


/*********************************************************************
*
*       _ShowDir
*
*/
static void _ShowDir(const char * sDirName) {
  FS_FIND_DATA fd;
  char         acFileName[256];
  char         r;

  printf("Contents of %s \n", sDirName);
  r = FS_FindFirstFile(&fd, sDirName, acFileName, sizeof(acFileName));
  if (r == 0) {
    do {
      U8 Attr;

      Attr = fd.Attributes;
      printf("%s %s Attributes: %s%s%s%s Size: %lu\n", fd.sFileName,
                          (Attr & FS_ATTR_DIRECTORY) ? "(Dir)" : "     ",
                          (Attr & FS_ATTR_ARCHIVE)   ? "A" : "-",
                          (Attr & FS_ATTR_READ_ONLY) ? "R" : "-",
                          (Attr & FS_ATTR_HIDDEN)    ? "H" : "-",
                          (Attr & FS_ATTR_SYSTEM)    ? "S" : "-",
                          fd.FileSize);
    } while (FS_FindNextFile(&fd));
    FS_FindClose(&fd);
  } else if (r == 1) {
    printf("Directory is empty");
  } else {
    printf("Unable to open directory %s\n", sDirName);
  }

}

/*********************************************************************
*
*       _CreateFile
*
*  Function description
*    Creates the "TestFile.txt" in the root directory (if it does not exist)
*    and adds one line of text.
*/
static void _CreateFile(const char * sPath) {
  FS_FILE * pFile;
  char      ac[40];

  sprintf(&ac[0], "%s\\TestFile.txt", sPath);
  printf("\nCreating file %s...", ac);

  pFile = FS_FOpen(&ac[0], "a+");
  if (pFile) {
    sprintf(ac, "System Time: %d\r\n", OS_GetTime());
    FS_Write(pFile, ac, strlen(ac));
    FS_FClose(pFile);
    printf("Ok\n");
  } else {
   printf("Failed. Could not create file\n");
  }
}

/*********************************************************************
*
*       _OnMSDReady
*
*  Function description
*    Called by the application task (MainTask) when an MSD device is plugged in.
*    It reads and displays capacity, contents of root directory and creates a file.
*/
static void _OnMSDReady(void) {
  char               ac[20];
  USBH_MSD_UNIT_INFO UnitInfo;

  FS_GetVolumeName(_CurrentDevIndex, ac, sizeof(ac));
  //
  // Check if volume needs to be high level formatted.
  // If so, we do NOT automatically do this ...
  //
  if (FS_IsHLFormatted(ac) == 0) {
    printf("Medium is not formatted.\n");
  } else {
    printf("Running sample on \"%s\"\n", ac);
    _ShowDiskInfo(ac);
    _CreateFile(ac);
    _ShowDir(ac);
    FS_Unmount("");
    USBH_MSD_GetUnitInfo(_CurrentDevIndex, &UnitInfo);
    printf("\n**** Unmount ****\n");
    printf("\nTest with following data was successful:\n");
    printf("\nVendorId:       0x%4x\n"
                          "ProductId:      0x%4x\n"
                          "VendorName:     %s\n"
                          "ProductName:    %s\n",UnitInfo.VendorId, UnitInfo.ProductId, UnitInfo.acVendorName, UnitInfo.acProductName);
    printf("Revision:       %s\n"
                          "NumSectors:     %d\n"
                          "BytesPerSector: %d\n"
                          "TotalSize:      %d MByte\n", UnitInfo.acRevision, UnitInfo.TotalSectors,  UnitInfo.BytesPerSector, _CalcMBytes(UnitInfo.TotalSectors, UnitInfo.BytesPerSector));
  }
  //
  // Wait until MSD is removed.
  //
  while (_MSDReady) {
    OS_Delay(100);
  }
}

/*********************************************************************
*
*       _cbOnAddRemoveDevice
*
*  Function description
*    Callback, called when a device is added or removed.
*    Call in the context of the USBH_Task.
*    The functionality in this routine should not block
*/
static void _cbOnAddRemoveDevice(void * pContext, U8 DevIndex, USBH_MSD_EVENT Event) {
  DevIndex = DevIndex;
  pContext = pContext;
  switch (Event) {
  case USBH_MSD_EVENT_ADD:
    printf("\n**** Device added\n");
    _MSDReady = 1;
    break;
  case USBH_MSD_EVENT_REMOVE:
    printf("\n**** Device removed\n");
    _MSDReady = 0;
    break;
  default:;   // Should never happen
  }
}

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/
/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  USBH_Init();
  OS_SetPriority(OS_GetTaskID(), TASK_PRIO_APP);                                       // This task has highest prio for real-time application
  OS_CREATETASK(&_TCBMain, "USBH_Task", USBH_Task, TASK_PRIO_USBH_MAIN, _StackMain);   // Start USBH main task
  OS_CREATETASK(&_TCBIsr, "USBH_isr", USBH_ISRTask, TASK_PRIO_USBH_ISR, _StackIsr);    // Start USBH main task
  FS_Init();
//  FS_FAT_SupportLFN();
  USBH_MSD_Init(_cbOnAddRemoveDevice, NULL);
  while (1) {
    BSP_ToggleLED(1);
    OS_Delay(100);
    if (_MSDReady) {
      _OnMSDReady();
    }
  }
}




/*************************** End of file ****************************/
