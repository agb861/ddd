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
File    : GUI_IP_emExporer.c

Purpose : emWin and emFile demo application showing an explorer like
          file browser
--------  END-OF-HEADER  ---------------------------------------------
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "GUI.h"
#include "GUI_VNC.h"
#include "Dialog.h"
#include "Listview.h"
#include "Menu.h"
#include "FS.h"
#include "IP.h"
#include "BSP.h"
#include "RTOS.h"
#include "TaskPrio.h"

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/
#define YSIZE   230

/* Menu identifier */
#define ID_MENU_EXIT      (GUI_ID_USER +  0)
#define ID_MENU_SETTINGS  (GUI_ID_USER +  1)
#define ID_MENU_ABOUT     (GUI_ID_USER +  2)
#define ID_MENU_MAXIMIZE  (GUI_ID_USER +  3)
#define ID_MENU_MINIMIZE  (GUI_ID_USER +  4)
#define ID_MENU_RESTORE   (GUI_ID_USER +  5)
#define ID_MENU_OPENFILE  (GUI_ID_USER +  6)
#define ID_MENU_OPENDIR   (GUI_ID_USER +  7)

#define BUTTON_OPENFILE   (GUI_ID_USER +  8)
#define SYSTEM_ICON                       9

/* File type definition */
#define FILE_UNKNOWN                      0
#define FILE_DIRECTORY                    1
#define FILE_TXT                          2
#define FILE_BMP                          3
#define FILE_JPG                          4

/*********************************************************************
*
*       type definition
*
**********************************************************************
*/
#define WM_DBLCLICK     WM_USER + 1

typedef struct {
  char * pFileName;
  U32    Size;
  U8     Attributes;
  U8     FileType;
} DIRECTORY_ENTRY;

typedef int (FILE_HANDLER_CB)(char * pFileName);

typedef struct FILE_TYPE {
  char *       pFileExtension;
  FILE_HANDLER_CB* pfOpenHandler;
} FILE_TYPE;

/*********************************************************************
*
*       Prototypes
*
**********************************************************************
*/
static int     _OpenTxtFile   (char * pFileName);
static int     _OpenBmpFile   (char * pFileName);
static int     _FILE_OpenFile (char * pFileName);
static WM_HWIN _GetFrameHandle(void);

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static unsigned char  acCache[4096];
static WM_CALLBACK * _pfFrameCallback;
static WM_CALLBACK * _pfListviewCallback;
static WM_HWIN       _hFrame, _hDriveButton;
static WM_HWIN       _hEthFrameWin;
static WM_HWIN       _hEthWin;
static MENU_Handle   _hSystemMenu, _hContextMenu, _hMainMenu;
static int           _Clicked, _yTouch, _xTouch;
static WM_HMEM       _hTimer;
static char        * _sText;
static FS_FILE     * _pFile;
static U32           _IPAddr;
static char          _acIP[16];

static OS_STACKPTR int _aStack[256];       // Task stack
static OS_STACKPTR int _aIPRxStack[128];
static OS_STACKPTR int _aEthWindowStack[256];
static OS_TASK         _TCB;              // Task-control-blocks
static OS_TASK         _IPRxTCB;
static OS_TASK         _EthWindow_TCB;    // Task-control-blocks

static const GUI_WIDGET_CREATE_INFO _aDialogFrame[] = {
  { FRAMEWIN_CreateIndirect, ""     ,               0,     10,         40, 220, YSIZE, FRAMEWIN_CF_MOVEABLE},
  { BUTTON_CreateIndirect,   "Close",     GUI_ID_OK,      120, YSIZE - 45,  60,    20 },
};


/*   Palette
The following are the entries of the palette table.
Every entry is a 32-bit value (of which 24 bits are actually used)
the lower   8 bits represent the Red component,
the middle  8 bits represent the Green component,
the highest 8 bits (of the 24 bits used) represent the Blue component
as follows:   0xBBGGRR
*/

static GUI_CONST_STORAGE GUI_COLOR ColorsSystemIcon[] = {
     0x0000FF,0xFFAB8E,0xFFFFFF,0xFFD4D4
    ,0xFFE2B1,0x000000,0xFDD2DE,0xFDD2DC
    ,0xFCD2DA,0xFCD1D8,0xFBD1D6,0xFBD1D4
    ,0xFAD0D2,0xFAD0D0,0xF9D0CE,0xF9CFCD
    ,0xFCD1DA,0xFBD0D5,0xFAD0D1,0xF8CFCA
    ,0xF7CFC6,0xFACFD1,0xF7CEC6,0xF6CEC2
    ,0xF8CFC9,0xF8CFC8,0xF5CEBE,0xF7CEC8
    ,0xF5CEC1,0xF4CDBD,0xF4CDB9,0xF6CDC4
    ,0xF6CDC2,0xF5CDC0,0xF5CDBF,0xF4CDBB
    ,0xF3CCB9,0xF3CCB7,0xF3CCB5,0xF2CBB4
    ,0xF5CDBE,0xF4CDBC,0xF4CCBB,0xF2CBB5
    ,0xF2CBB3,0xF2CBB1,0xF1CBB0,0x003131
};

GUI_CONST_STORAGE GUI_LOGPALETTE PalSystemIcon = {
  48,	/* number of entries */
  1, 	/* Has transparency */
  &ColorsSystemIcon[0]
};

static GUI_CONST_STORAGE unsigned char acSystemIcon[] = {
  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x01, 0x02, 0x03, 0x03, 0x03, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00,
  0x01, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x05,
  0x01, 0x02, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x01, 0x05,
  0x01, 0x02, 0x10, 0x09, 0x02, 0x02, 0x0A, 0x0B, 0x02, 0x0E, 0x02, 0x0F, 0x0F, 0x01, 0x05,
  0x01, 0x02, 0x11, 0x02, 0x12, 0x0D, 0x02, 0x02, 0x13, 0x02, 0x14, 0x02, 0x0F, 0x01, 0x05,
  0x01, 0x02, 0x15, 0x02, 0x02, 0x02, 0x13, 0x02, 0x16, 0x02, 0x17, 0x02, 0x0F, 0x01, 0x05,
  0x01, 0x02, 0x0F, 0x02, 0x18, 0x19, 0x02, 0x02, 0x17, 0x02, 0x1A, 0x02, 0x0F, 0x01, 0x05,
  0x01, 0x02, 0x1B, 0x16, 0x02, 0x02, 0x1C, 0x02, 0x1D, 0x02, 0x1E, 0x02, 0x0F, 0x01, 0x05,
  0x01, 0x02, 0x1F, 0x20, 0x21, 0x22, 0x1D, 0x23, 0x23, 0x24, 0x25, 0x26, 0x27, 0x01, 0x05,
  0x01, 0x02, 0x21, 0x28, 0x29, 0x2A, 0x24, 0x25, 0x25, 0x2B, 0x2C, 0x2D, 0x2E, 0x01, 0x05,
  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x05,
  0x00, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F, 0x2F
};

GUI_CONST_STORAGE GUI_BITMAP bmSystemIcon = {
 15, /* XSize */
 14, /* YSize */
 15, /* BytesPerLine */
 8, /* BitsPerPixel */
 acSystemIcon,  /* Pointer to picture data (indices) */
 &PalSystemIcon  /* Pointer to palette */
};

static FILE_TYPE _aFileType[256]= {
  {"TXT", _OpenTxtFile},
  {"BMP", _OpenBmpFile},
  {"txt", _OpenTxtFile},
  {"bmp", _OpenBmpFile}
};

static int _NumFileTypes = 4;

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/


/*******************************************************************
*
*       _DefaultProc
*/
static void _DefaultProc(WM_MESSAGE *pMsg, int Type, WM_CALLBACK * pfCallback) {
  WM_HWIN hFrame;
  hFrame  = pMsg->hWin;
  switch (pMsg->MsgId) {
  case WM_INIT_DIALOG:
  {
    WM_HWIN hFrame, hClient, hWidget;
    GUI_RECT r;
    char * pText;
    hFrame  = pMsg->hWin;
    hClient = WM_GetClientWindow(hFrame);
    FRAMEWIN_SetTitleHeight(hFrame, 14);
    FRAMEWIN_SetTextAlign  (hFrame, GUI_TA_CENTER);
    FRAMEWIN_SetFont       (hFrame, &GUI_Font10_1);
    WM_GetClientRectEx(hClient, &r);
    if (Type == FILE_TXT) {
      hWidget = MULTIEDIT_CreateEx(r.x0, r.y0, r.x1, r.y1 - 30, hClient, WM_CF_SHOW, MULTIEDIT_CF_READONLY | MULTIEDIT_CF_AUTOSCROLLBAR_V | MULTIEDIT_CF_AUTOSCROLLBAR_H, GUI_ID_MULTIEDIT0, 0, _sText);
      pText = "Text Viewer";
    } else {
      if (Type == FILE_JPG) {
        pText = "JPEG Viewer";
      } else {
        pText = "Bitmap Viewer";
      }
      hWidget = WM_CreateWindowAsChild(r.x0, r.y0, r.x1, r.y1 - 30, hClient, WM_CF_SHOW, pfCallback, 0);
    }
    FRAMEWIN_SetText(hFrame, pText);
    WM_SetAnchor(hWidget, WM_CF_ANCHOR_BOTTOM | WM_CF_ANCHOR_TOP | WM_CF_ANCHOR_LEFT   | WM_CF_ANCHOR_RIGHT);
    hWidget = WM_GetDialogItem(hFrame, GUI_ID_OK);
    WM_SetAnchor(hWidget, WM_CF_ANCHOR_BOTTOM  | WM_CF_ANCHOR_RIGHT | WM_CF_ANCHOR_LEFT);
    break;
  }
  case WM_NOTIFY_PARENT:
  {
    int NCode;
    NCode = pMsg->Data.v;                 /* Notification code */
    if (NCode == WM_NOTIFICATION_RELEASED) {
      int Id     = WM_GetId(pMsg->hWinSrc);      /* Id of widget */
      switch (Id) {
      case GUI_ID_OK:
        GUI_EndDialog(hFrame, 0);
        break;
      default:
        break;
      }
    }
    break;
  }
  case WM_SIZE:
  {
    int WindowXSize, ButtonXSize, ButtonYPos, WindowYPos;
    BUTTON_Handle hButton;
    WM_HWIN hClient;
    hClient = WM_GetClientWindow(pMsg->hWin);
    WM_DefaultProc(pMsg);
    hButton = WM_GetDialogItem(pMsg->hWin, GUI_ID_OK);
    ButtonXSize = WM_GetWindowSizeX(hButton);
    if (ButtonXSize != 60) {
       WM_SetXSize(hButton, 60);
    }
    WindowXSize = WM_GetWindowSizeX(hClient);
    ButtonYPos  = WM_GetWindowOrgY(hButton);
    WindowYPos  = WM_GetWindowOrgY(hClient);
    WM_MoveChildTo(hButton, (WindowXSize - ButtonXSize) / 2, ButtonYPos - WindowYPos);
    break;

  }
  case WM_KEY:
  {
    int Key = ((WM_KEY_INFO*)(pMsg->Data.p))->Key;
    switch (Key) {
    case GUI_KEY_ESCAPE:
      GUI_EndDialog(hFrame, 1);
      break;
    case GUI_KEY_ENTER:
      GUI_EndDialog(hFrame, 0);
      break;
    }
    break;
  }
  default:
    WM_DefaultProc(pMsg);
    break;
  }
}

/*******************************************************************
*
*       _cbTextCallback
*/
static void _cbTextCallback(WM_MESSAGE * pMsg) {
  if (pMsg->MsgId == WM_INIT_DIALOG) {
    _DefaultProc(pMsg, FILE_TXT, NULL);
  } else {
    _DefaultProc(pMsg, 0, NULL);
  }
}

/*******************************************************************
*
*       _OpenTxtFile
*/
static int _OpenTxtFile(char * pFileName) {
  int       r;
  
  _pFile = FS_FOpen(pFileName, "r");
  if (_pFile) {
    WM_HWIN   hDlg;
    GUI_HMEM  hText;
    int       Size;
    Size  = FS_GetFileSize(_pFile);
    hText = GUI_ALLOC_AllocZero(Size + 1);
    if (hText == 0) {
      GUI_MessageBox("No memory available", "Memory allocation", GUI_MB_OK | GUI_MB_WARNING);
      return -1;
    }
    _sText = (char *)GUI_ALLOC_h2p(hText);
    FS_Read(_pFile, _sText, Size);
    FS_FClose(_pFile);
    _sText[Size] = 0;
    hDlg = GUI_CreateDialogBox(_aDialogFrame, GUI_COUNTOF(_aDialogFrame), &_cbTextCallback, WM_HBKWIN, 0, 0);
    WM_SetFocus(hDlg);
    r = GUI_ExecCreatedDialog(hDlg);
    GUI_ALLOC_Free(hText);
    _sText = NULL;
  }
  return r;
}

/*******************************************************************
*
*       _GetBmpData
*/
#define BUFFER_SIZE 1024
static unsigned char _acFileBuffer[BUFFER_SIZE];
static int _GetBmpData(void *p, const U8 **ppData, unsigned NumBytes, U32 StartOfFile) {
  int NumBytesRead;
  *ppData = _acFileBuffer;

  if (StartOfFile) {
    /* Reset file pointer to the beginning of the file */
    FS_SetFilePos(_pFile, 0, FS_FILE_BEGIN);
  }
  NumBytesRead = FS_Read(_pFile, _acFileBuffer, NumBytes);
  return NumBytesRead;
}

/*******************************************************************
*
*       _cbBMPWindow
*/
static void _cbBMPWindow(WM_MESSAGE * pMsg) {
  switch (pMsg->MsgId) {
  case WM_PAINT:
  {
    int xPos, yPos;
    int XSize, YSize;
    GUI_RECT r;
    WM_GetInsideRect(&r);
    GUI_ClearRectEx(&r);
    XSize = GUI_BMP_GetXSizeEx(_GetBmpData, NULL);
    YSize = GUI_BMP_GetYSizeEx(_GetBmpData, NULL);
    xPos = (r.x1  - XSize) / 2;
    yPos = (r.y1  - YSize) / 2;
    if (yPos < 0) {
     yPos = 0;
    }
    if (xPos < 0) {
     xPos = 0;
    }
    GUI_BMP_DrawEx(_GetBmpData, NULL, xPos, yPos);
    break;
  }
  default:
    WM_DefaultProc(pMsg);
  }
}

/*******************************************************************
*
*       _cbBmpCallback
*/
static void _cbBmpCallback(WM_MESSAGE * pMsg) {
  if (pMsg->MsgId == WM_INIT_DIALOG) {
    _DefaultProc(pMsg, FILE_BMP, _cbBMPWindow);
  } else {
    _DefaultProc(pMsg, 0, NULL);
  }
}

/*******************************************************************
*
*       _OpenBmpFile
*/
static int _OpenBmpFile(char * pFileName) {
  int r;

  _pFile = FS_FOpen(pFileName, "r");
  if (_pFile) {
    WM_HWIN hDlg;
    WM_SetCreateFlags(0);
    hDlg = GUI_CreateDialogBox(_aDialogFrame, GUI_COUNTOF(_aDialogFrame), &_cbBmpCallback, WM_HBKWIN, 0, 0);
    WM_SetCreateFlags(WM_CF_MEMDEV);
    WM_SetFocus(hDlg);
    r = GUI_ExecCreatedDialog(hDlg);
    FS_FClose(_pFile);
  }
  return r;
}

/*******************************************************************
*
*       _cbMessageBox
*/
static void _cbMessageBox(WM_MESSAGE* pMsg) {
  WM_HWIN hWin = pMsg->hWin;
  switch (pMsg->MsgId) {
  case WM_NOTIFY_PARENT:
    if (pMsg->Data.v == WM_NOTIFICATION_RELEASED) {
      int Id = WM_GetId(pMsg->hWinSrc);
      GUI_EndDialog(hWin, (Id == GUI_ID_OK) ? 1 : 0);
    }
    break;
  default:
    WM_DefaultProc(pMsg);
  }
}


/*******************************************************************
*
*       _AddMenuItem
*/
static void _AddMenuItem(MENU_Handle hMenu, MENU_Handle hSubmenu, const char* pText, U16 Id, U16 Flags) {
  MENU_ITEM_DATA Item;
  Item.pText    = pText;
  Item.hSubmenu = hSubmenu;
  Item.Flags    = Flags;
  Item.Id       = Id;
  MENU_AddItem(hMenu, &Item);
}

/*******************************************************************
*
*       _CreateMenu
*/
static void _CreateMenu(WM_HWIN hWin) {
  MENU_Handle hMenuFile;
  /* Disable this menu item, since there are no options that we can configure now
  MENU_Handle hMenuOptions;
  */
  MENU_SetDefaultFont(&GUI_Font10_1);
  /* Create menu 'File' */
  hMenuFile = MENU_CreateEx(0, 0, 0, 0, WM_UNATTACHED, 0, MENU_CF_VERTICAL, 0);
  _AddMenuItem(hMenuFile, 0, "Open File",          ID_MENU_OPENFILE, MENU_IF_DISABLED);
  _AddMenuItem(hMenuFile, 0, "Open Directory",     ID_MENU_OPENDIR,  MENU_IF_DISABLED);
  _AddMenuItem(hMenuFile, 0, "",                   0,                MENU_IF_SEPARATOR);
  _AddMenuItem(hMenuFile, 0, "Exit",               ID_MENU_EXIT,     0);
  /* Create main menu */
  _hMainMenu = MENU_CreateEx(0, 0, 0, 0, WM_UNATTACHED, 0, MENU_CF_HORIZONTAL, 0);
  _AddMenuItem(_hMainMenu, hMenuFile,    "File",    0, 0);
  /* Attach menu to framewin */
  FRAMEWIN_AddMenu(hWin, _hMainMenu);
}

/*******************************************************************
*
*       _CreateSystemMenu
*/
static void _CreateSystemMenu(void) {
  /*
   * Create the system menu in order to have already in memory
   */
  _hSystemMenu = MENU_CreateEx(0, 0, 0, 0, WM_UNATTACHED, 0, MENU_CF_VERTICAL, 0);
  _AddMenuItem(_hSystemMenu, 0, "Maximize", ID_MENU_MAXIMIZE, 0);
  _AddMenuItem(_hSystemMenu, 0, "Minimize", ID_MENU_MINIMIZE, 0);
  _AddMenuItem(_hSystemMenu, 0, "Restore",  ID_MENU_RESTORE,  0);
  _AddMenuItem(_hSystemMenu, 0, ""        , 0               , MENU_IF_SEPARATOR);
  _AddMenuItem(_hSystemMenu, 0, "Close",    ID_MENU_EXIT,     0);
}

/*******************************************************************
*
*       _CreateContextMenu
*/
static void _CreateContextMenu(void) {
  /*
   * Create the context menu in order to have already in memory
   */
  _hContextMenu = MENU_CreateEx(0, 0, 0, 0, WM_UNATTACHED, 0, MENU_CF_VERTICAL, 0);
  _AddMenuItem(_hContextMenu, 0, "Open",           ID_MENU_OPENFILE, MENU_IF_DISABLED);
  _AddMenuItem(_hContextMenu, 0, "Open Directory", ID_MENU_OPENDIR , MENU_IF_DISABLED);
}

/*******************************************************************
*
*       _ShowSystemMenu
*/
static void _ShowSystemMenu(WM_HWIN hWin, int x, int y) {
  if (y) {
    y = - FRAMEWIN_GetTitleHeight(_hFrame) - 1 + y;
  }
  y -= WM_GetWindowSizeY(_hMainMenu);
  MENU_Popup(_hSystemMenu, hWin, x, y, 0, 0 , 0);
}

/*******************************************************************
*
*       _ShowContextMenu
*/
static void _ShowContextMenu(WM_HWIN hWin, int x, int y) {
  MENU_Popup (_hContextMenu, hWin, x, y, 0, 0 , 0);
}

/*******************************************************************
*
*       _InitSystemMenu
*/
static void _InitSystemMenu(MENU_Handle hMenu) {
  int Maximized, Minimized;
  Maximized = FRAMEWIN_IsMaximized(_hFrame);
  Minimized = FRAMEWIN_IsMinimized(_hFrame);
  /*
   * Depending on what size the actual frame window has,
   * unuseful menu items are disabled
   */
  if (Maximized) {
    MENU_DisableItem(hMenu, ID_MENU_MAXIMIZE);
    MENU_EnableItem(hMenu,  ID_MENU_RESTORE);
  } else {
    MENU_DisableItem(hMenu, ID_MENU_RESTORE);
    MENU_EnableItem (hMenu, ID_MENU_MAXIMIZE);
  }
  if (Minimized) {
    MENU_DisableItem(hMenu, ID_MENU_MINIMIZE);
    MENU_EnableItem(hMenu,  ID_MENU_RESTORE);
  } else {
    MENU_EnableItem (hMenu, ID_MENU_MINIMIZE);
    MENU_DisableItem(hMenu, ID_MENU_RESTORE);
  }
  if (!Minimized && !Maximized) {
    MENU_DisableItem(hMenu, ID_MENU_RESTORE);
  } else {
    MENU_EnableItem(hMenu,  ID_MENU_RESTORE);
  }
}

/*******************************************************************
*
*       _InitMainMenu
*/
static void _InitMainMenu(MENU_Handle hMenu) {
  int SelItem;
  SelItem = LISTVIEW_GetSel(WM_GetDialogItem(_hFrame, GUI_ID_LISTVIEW0));
  if (SelItem >= 0) {
   MENU_EnableItem(hMenu, ID_MENU_OPENFILE);
  } else {
   MENU_DisableItem(hMenu, ID_MENU_OPENFILE);
  }
}


/*******************************************************************
*
*       _OpenFile
*/
static void _OpenFile(void) {
  int SelItem;
  LISTVIEW_Handle hListView;
  hListView = WM_GetDialogItem(_hFrame, GUI_ID_LISTVIEW0);
  SelItem = LISTVIEW_GetSel(hListView);
  /*
   * Get the selected item and open the file
   */
  if (SelItem >= 0) {
    char acFileOpen[64];
    char acName[64];
    char acDrive[20];
    U8   Attr;
    BUTTON_GetText(_hDriveButton, acDrive, sizeof(acDrive));
    LISTVIEW_GetItemText(hListView, 0, SelItem, acName, sizeof(acName));
    sprintf(acFileOpen, "%s%s", acDrive, acName);
    Attr = FS_GetFileAttributes(acFileOpen);
    if ((Attr & FS_ATTR_DIRECTORY) == 0) {
      _FILE_OpenFile(acFileOpen);
    }
    WM_SetFocus(_hFrame);
  }
}



/*********************************************************************
*
*       _cbBkWindow
*/
static void _cbBkWindow(WM_MESSAGE* pMsg) {
  /*
   * Is used to change the background (desktop) window.
   * A bitmap or whatever can be used to look the app
   * nicer. ;)
   */
  switch (pMsg->MsgId) {
  case WM_PAINT:
    GUI_SetBkColor(GUI_BLACK);
    GUI_Clear();
    GUI_SetColor(GUI_WHITE);
    GUI_SetFont(&GUI_Font24_ASCII);
    GUI_DispStringHCenterAt("emExplorer", 120, 5);
    break;
  default:
    WM_DefaultProc(pMsg);
  }
}

/*******************************************************************
*
*       _OnMenu
*/
static void _OnMenu(WM_MESSAGE* pMsg) {
  MENU_MSG_DATA* pData = (MENU_MSG_DATA*)pMsg->Data.p;
  MENU_Handle    hMenu = pMsg->hWinSrc;
  WM_HWIN        hDlg  = pMsg->hWin;
  /*
   * All Menu messages are handled in this function.
   */
  switch (pData->MsgType) {
  case MENU_ON_INITMENU:
    if (hMenu == _hSystemMenu) {
      _InitSystemMenu(hMenu);
    } else if (hMenu == _hMainMenu || hMenu == _hContextMenu) {
      _InitMainMenu(hMenu);
    }
    break;
  case MENU_ON_ITEMSELECT:
    switch (pData->ItemId) {
    case ID_MENU_MAXIMIZE:
      FRAMEWIN_Maximize(_hFrame);
      break;
    case ID_MENU_MINIMIZE:
      FRAMEWIN_Minimize(_hFrame);
      break;
    case ID_MENU_RESTORE:
      FRAMEWIN_Restore(_hFrame);
      break;
    case ID_MENU_EXIT:
      GUI_EndDialog(hDlg, 0);
      break;
    case ID_MENU_SETTINGS:
      //ShowDialogSettings(hDlg);
      break;
    case ID_MENU_OPENFILE: {
      _OpenFile();
      break;
    }
    case ID_MENU_ABOUT:
      //ShowAboutBox(hDlg);
      break;
    }
    break;
  default:
    WM_DefaultProc(pMsg);
  }
}

/*********************************************************************
*
*       _UpdateFileList
*/
static void _UpdateFileList(LISTVIEW_Handle hListView, WM_HWIN hButton) {
  FS_FIND_DATA fd;
  char  acFileName[FS_MAX_PATH];
  char  acFileSize[20];
  char  acFileAttributes[6];
  char  acDrive[20];
  char* apText[5];
  int   r;
  unsigned NumItems;
  /*
   * First delete all items, that are available
   */
  NumItems = LISTVIEW_GetNumRows(hListView);
  if (NumItems) {
    int i;
    for (i = NumItems - 1; i >= 0; i--) {
      LISTVIEW_DeleteRow(hListView, i);
    }
  }
  BUTTON_GetText(hButton, acDrive, sizeof(acDrive));
  _hDriveButton = hButton;
  r = FS_FindFirstFile(&fd, acDrive, acFileName, sizeof(acFileName));
  if (r == 0) {
    do {
      U8 Attr;

      Attr = fd.Attributes;
      sprintf(acFileAttributes,"%c%c%c%c%c",
              (Attr & FS_ATTR_DIRECTORY) ? 'D' : '-',
              (Attr & FS_ATTR_ARCHIVE)   ? 'A' : '-',
              (Attr & FS_ATTR_READ_ONLY) ? 'R' : '-',
              (Attr & FS_ATTR_HIDDEN)    ? 'H' : '-',
              (Attr & FS_ATTR_SYSTEM)    ? 'S' : '-');
      sprintf(acFileSize, "%i", fd.FileSize);
      apText[0] = fd.sFileName;
      apText[1] = acFileSize;
      apText[2] = "";
      apText[3] = acFileAttributes;
      apText[4] = 0;
      LISTVIEW_AddRow(hListView, apText);
    } while (FS_FindNextFile(&fd));
    FS_FindClose(&fd);
  } else {
    FS_Unmount(acDrive);
  }
}

/*********************************************************************
*
*       _OnReleased
*/
static void _OnReleased(WM_MESSAGE * pMsg) {
  WM_HWIN hDlg;
  int Id;
  Id     = WM_GetId(pMsg->hWinSrc);      /* Id of widget */
  hDlg   = pMsg->hWin;
  switch (Id) {
  case GUI_ID_OK:
    GUI_EndDialog(hDlg, 0);
    break;
  case GUI_ID_CANCEL:
    GUI_EndDialog(hDlg, 1);
    break;
  default:
    break;
  }
}

/*********************************************************************
*
*       _OnValueChanged
*/
static void _OnValueChanged(WM_MESSAGE* pMsg) {
}


/*********************************************************************
*
*       _OnSelChanged
*/
static void _OnSelChanged(WM_MESSAGE * pMsg) {
  WM_HWIN hWin;
  LISTVIEW_Handle hListView;
  hListView = WM_GetDialogItem(_hFrame, GUI_ID_LISTVIEW0);
  hWin = pMsg->hWinSrc;
  if(hWin == hListView) {
    int  SelItem;
    char acAttributes[20];
    WM_HWIN hButton;

    SelItem = LISTVIEW_GetSel(hListView);
    hButton = WM_GetDialogItem(pMsg->hWin, BUTTON_OPENFILE);
    LISTVIEW_GetItemText(hListView, 3, SelItem, acAttributes, sizeof(acAttributes));
    if ((SelItem >= 0) && (strchr(acAttributes, 'D') == 0)) {
      WM_EnableWindow(hButton);
    } else {
      WM_DisableWindow(hButton);
    }
  }
}

/*********************************************************************
*
*       _OnKey
*/
static void _OnKey(WM_HWIN hDlg, int Key) {
  switch (Key) {
  case GUI_KEY_ESCAPE:
    GUI_EndDialog(hDlg, 1);
    break;
  case GUI_KEY_ENTER:
    GUI_EndDialog(hDlg, 0);
    break;
  }
}

/*********************************************************************
*
*       _ShowMessageBox
*/
static int _ShowMessageBox(WM_HWIN hParent, const char* pTitle, const char* pText, int YesNo) {
  WM_HWIN hFrame, hClient, hBut;
  int r;
  /* Create framewin */
  hFrame = FRAMEWIN_CreateEx(65, 75, 190, 90, WM_HBKWIN, WM_CF_SHOW | WM_CF_STAYONTOP, FRAMEWIN_CF_MOVEABLE, 0, pTitle, &_cbMessageBox);
  FRAMEWIN_SetClientColor   (hFrame, GUI_WHITE);
  FRAMEWIN_SetFont          (hFrame, &GUI_Font10_1);
  FRAMEWIN_SetTextAlign     (hFrame, GUI_TA_HCENTER);
  /* Create dialog items */
  hClient = WM_GetClientWindow(hFrame);
  TEXT_CreateEx(10, 7, 170, 30, hClient, WM_CF_SHOW, GUI_TA_HCENTER, 0, pText);
  if (YesNo) {
    hBut = BUTTON_CreateEx(97, 45, 55, 18, hClient, WM_CF_SHOW, 0, GUI_ID_CANCEL);
    BUTTON_SetText        (hBut, "No");
    hBut = BUTTON_CreateEx(32, 45, 55, 18, hClient, WM_CF_SHOW, 0, GUI_ID_OK);
    BUTTON_SetText        (hBut, "Yes");
  } else {
    hBut = BUTTON_CreateEx(64, 45, 55, 18, hClient, WM_CF_SHOW, 0, GUI_ID_OK);
    BUTTON_SetText        (hBut, "Ok");
  }
  /* Exec modal dialog */
  WM_SetFocus(hFrame);
  WM_MakeModal(hFrame);
  r = GUI_ExecCreatedDialog(hFrame);
  WM_SetFocus(hParent);
  return r;
}

/*******************************************************************
*
*       _FILE_OpenFile
*/
static int _FILE_OpenFile(char * pFileName) {
  char * pExtension;
  FILE_TYPE * pFileType;
  int i;
  /*
   * Find the Extension
   */
  pFileType = (FILE_TYPE *)&_aFileType[0];
  pExtension = strrchr(pFileName, '.');
  pExtension++;
  i = 0;
  do {
    if (strcmp(pFileType->pFileExtension, pExtension) == 0) {
		return (pFileType->pfOpenHandler)(pFileName);
    }
    pFileType++;
  } while(++i < _NumFileTypes);
  _ShowMessageBox(_GetFrameHandle(), "", "Unsupported file type,\nonly *.txt and *.bmp files", 0);
  return 0;
}

/*********************************************************************
*
*       Screen2ClientX
*/
static int Client2ScreenX(WM_HWIN hWin, int x) {
  int xOffset;
  xOffset = WM_GetWindowOrgX(hWin);
  return (xOffset + x);
}

/*********************************************************************
*
*       Screen2ClientY
*/
static int Client2ScreenY(WM_HWIN hWin, int y) {
  int yOffset;
  yOffset = WM_GetWindowOrgY(hWin);
  return (yOffset + y);
}
/*********************************************************************
*
*       _OnKey
*/
static void _OnTouch(WM_MESSAGE * pMsg) {
  const GUI_PID_STATE * pState;
  int x, y;
  pState = (const GUI_PID_STATE*)pMsg->Data.p;
  if (pState) {
    if (pState->Pressed & 0x02) {
       x = pState->x;
       y = pState->y;
       _ShowSystemMenu(WM_GetClientWindow(pMsg->hWin), x, y);
    } else if (pState->Pressed & 0x01) {
      x = Client2ScreenX(pMsg->hWin, pState->x);
      y = Client2ScreenY(pMsg->hWin, pState->y);
      if (_Clicked && (_xTouch  == x) && (_yTouch  == y)) {
        WM_MESSAGE Msg;
        _Clicked = 0;
        Msg.Data    = pMsg->Data;
        Msg.MsgId   = WM_DBLCLICK;
        Msg.hWinSrc = pMsg->hWin;
        WM_SendMessage(pMsg->hWin, &Msg);
      } else {
          _Clicked = 1;
          _yTouch  = y;
          _xTouch  = x;
        (*_pfFrameCallback)(pMsg);
      }
    } else {
      (*_pfFrameCallback)(pMsg);
    }
  } else {
    (*_pfFrameCallback)(pMsg);
  }
}

/*********************************************************************
*
*       _OnItemClicked
*/
static void _OnItemClicked(WM_MESSAGE * pMsg) {
}

/*********************************************************************
*
*       _OnTouchChild
*/
static void _OnTouchChild(WM_MESSAGE * pMsg) {
}

/*********************************************************************
*
*       _OnNotifyParent
*/
static void _OnNotifyParent(WM_MESSAGE * pMsg) {
  int NCode;
  NCode = pMsg->Data.v;                 /* Notification code */
  switch (NCode) {
  case WM_NOTIFICATION_CLICKED:
    _OnItemClicked(pMsg);
    break;
  case WM_NOTIFICATION_VALUE_CHANGED:
    _OnValueChanged(pMsg);
    break;
  case WM_NOTIFICATION_SEL_CHANGED:
    _OnSelChanged(pMsg);
  case WM_NOTIFICATION_RELEASED:      /* React only if released */
    _OnReleased(pMsg);
    break;
  }
}

/*********************************************************************
*
*       _cbFrameClient
*/
static void _cbFrameClient(WM_MESSAGE * pMsg) {
  WM_HWIN hDlg;
  hDlg = pMsg->hWin;
  switch (pMsg->MsgId) {
  case WM_MENU:
    _OnMenu(pMsg);
    break;
  case WM_KEY: {
    int Key = ((WM_KEY_INFO*)(pMsg->Data.p))->Key;
    _OnKey(hDlg, Key);
    break;
  }
  case WM_TOUCH_CHILD:
    _OnTouchChild(pMsg);
    break;
  case WM_NOTIFY_PARENT: {
    _OnNotifyParent(pMsg);
    break;
  }
  case WM_DELETE: {
    WM_DIALOG_STATUS * pDialogStatus;
    pDialogStatus = GUI_GetDialogStatusPtr(hDlg);
    pDialogStatus->Done = 1;
    break;
  }
  case WM_TIMER:
    break;
  default:
    WM_DefaultProc(pMsg);
  }
}

/*********************************************************************
*
*       _cbFrame
*/
static void _cbFrame(WM_MESSAGE * pMsg) {
  switch (pMsg->MsgId) {
  case WM_NOTIFY_PARENT:
    if (pMsg->Data.v == WM_NOTIFICATION_RELEASED) {
      int Id;
      WM_HWIN hWin;
      Id   = WM_GetId(pMsg->hWinSrc);
      hWin = pMsg->hWin;
      if (Id == SYSTEM_ICON) {
        _ShowSystemMenu(WM_GetClientWindow(hWin), 0, 0);
      } else {
        (*_pfFrameCallback)(pMsg);
      }
    }
    break;
  case WM_DBLCLICK:
  {
    WM_HWIN hWin = pMsg->hWin;
    if (FRAMEWIN_IsMaximized(hWin) || FRAMEWIN_IsMinimized(hWin)) {
      FRAMEWIN_Restore(hWin);
    } else {
      FRAMEWIN_Maximize(hWin);
    }
    break;
  }
  case WM_TOUCH:
   _OnTouch(pMsg);
   break;
  case WM_TIMER:
    if (_Clicked) {
      _Clicked = 0;
    }
    break;
  case WM_DELETE:
    WM_DeleteTimer(_hTimer);
    (*_pfFrameCallback)(pMsg);
    break;
  case WM_PAINT:
    WM_InvalidateWindow(WM_GetDialogItem(_hFrame, SYSTEM_ICON));
  default:
    if (_pfFrameCallback) {
      (*_pfFrameCallback)(pMsg);
    }
  }
}

/*********************************************************************
*
*       _cbToolBar
*/
static void _cbToolBar(WM_MESSAGE * pMsg) {
  GUI_RECT Rect;
  switch(pMsg->MsgId) {
  case WM_PAINT:
    GUI_SetBkColor(FRAMEWIN_GetDefaultClientColor());
    WM_GetInsideRect(&Rect);
    GUI_Clear();
    WIDGET_Effect_3D1L.pfDrawUp();
    break;
  case WM_NOTIFY_PARENT:
  {
    int NCode;
    NCode = pMsg->Data.v;                 /* Notification code */
    if (NCode == WM_NOTIFICATION_RELEASED) {
      WM_HWIN hButton;
      hButton = pMsg->hWinSrc;
      if (WM_GetDialogItem(pMsg->hWin, BUTTON_OPENFILE) == hButton) {
        _OpenFile();
      } else {
        LISTVIEW_Handle hListView;
        WM_HWIN hOpenButton;
        hListView = WM_GetDialogItem(_hFrame, GUI_ID_LISTVIEW0);
        hOpenButton = WM_GetDialogItem(pMsg->hWin, BUTTON_OPENFILE);
        WM_DisableWindow(hOpenButton);
        _UpdateFileList(hListView, hButton);

      }
    }
    break;
  }
  default:
    WM_DefaultProc(pMsg);
  }
}

/*********************************************************************
*
*       _cbSystemIcon
*/
static void _cbSystemIcon(WM_MESSAGE* pMsg) {
  /*
   * To draw an icon in the frame window bar
   * we just overwrite the WM_PAINT message,
   * everything else is handled in the BUTTON_Callback
   */
  if (pMsg->MsgId == WM_PAINT) {
    GUI_COLOR Color, OldColor;
    GUI_RECT r;
    int x, y;
    WM_GetClientRect(&r);
    //Color = FRAMEWIN_GetBarColor(_hFrame, FRAMEWIN_GetState(_hFrame));
    Color = FRAMEWIN_GetBarColor(_hFrame, FRAMEWIN_GetActive(_hFrame));
    OldColor = GUI_GetBkColor();
    GUI_SetBkColor(Color);
    GUI_ClearRectEx(&r);
    GUI_SetBkColor(OldColor);
    x = (r.x1 - r.x0) - bmSystemIcon.XSize;
    y = (r.y1 - r.y0) - bmSystemIcon.YSize;
    GUI_DrawBitmap(&bmSystemIcon, x, y);
    return;
  }
  BUTTON_Callback(pMsg);
}


/*********************************************************************
*
*       _OnTouchListview
*/
static void _OnTouchListview(WM_MESSAGE * pMsg){
  /*
   * Checking the Touch Messages helps to check,
   * wheter a double click message should be send
   * or not.
   * Another additional feature is right click handling.
   */
  const GUI_PID_STATE * pState;
  int x, y;
  pState = (const GUI_PID_STATE*)pMsg->Data.p;
  if (pState) {
    /*
     * Is right button clicked ?
     */
    if (pState->Pressed & 0x02) {
      (*_pfListviewCallback)(pMsg);
       x = pState->x;
       y = pState->y;
       _ShowContextMenu(pMsg->hWin, x, y);
    } else if (pState->Pressed & 0x01) {
      /*
       * Send double click message ?
       */
      x = Client2ScreenX(pMsg->hWin, pState->x);
      y = Client2ScreenY(pMsg->hWin, pState->y);
      if (_Clicked && (_xTouch  == x) && (_yTouch  == y)) {
        WM_MESSAGE Msg;

        _Clicked = 0;
        Msg.Data    = pMsg->Data;
        Msg.MsgId   = WM_DBLCLICK;
        Msg.hWinSrc = pMsg->hWin;
        WM_SendMessage(pMsg->hWin, &Msg);
      } else {
          /*
           * If not, store the values and call the old callback of listview.
           */
          _Clicked = 1;
          _yTouch  = y;
          _xTouch  = x;
          (*_pfListviewCallback)(pMsg);
      }
    /*
     * Any other message should be handled by old callback.
     */
    } else {
      (*_pfListviewCallback)(pMsg);
    }
    /*
     * Any other message should be handled by old callback.
     */
  } else {
    (*_pfListviewCallback)(pMsg);
  }
}

/*********************************************************************
*
*       _cbListView
*/
static void _cbListView(WM_MESSAGE * pMsg) {
  /*
   * Overwriting the callback must be done
   * in order to handle the WM_MENU and TOUCH Messages
   */
  switch(pMsg->MsgId) {
  case WM_MENU: {
    WM_MESSAGE Msg;
    Msg.hWinSrc = pMsg->hWinSrc;
    Msg.MsgId   = pMsg->MsgId;
    Msg.Data    = pMsg->Data;
    WM_SendMessage(WM_GetClientWindow(_hFrame), &Msg);
    break;
  }
  case WM_DBLCLICK:
    _OpenFile();
   break;
  case WM_TOUCH:
   _OnTouchListview(pMsg);
  default:
    if (_pfListviewCallback) {
      (*_pfListviewCallback)(pMsg);
    }
  }

}
/*********************************************************************
*
*       _StartemExplorer
*/
static void _StartemExplorer(void) {
  WM_HWIN hClient;
  WM_HWIN hControl, hToolBar;
  int        i;
  int        NumVolumes;
  GUI_RECT Rect;

  _hFrame = FRAMEWIN_CreateEx(0, 0, 320, 240, WM_HBKWIN, WM_CF_SHOW , FRAMEWIN_CF_MOVEABLE, 0, "emExplorer", &_cbFrameClient);
  _pfFrameCallback = WM_SetCallback(_hFrame, &_cbFrame);
  FRAMEWIN_AddCloseButton(_hFrame, FRAMEWIN_BUTTON_RIGHT, 1);
  FRAMEWIN_AddMaxButton  (_hFrame, FRAMEWIN_BUTTON_RIGHT, 0);
  FRAMEWIN_AddMinButton  (_hFrame, FRAMEWIN_BUTTON_RIGHT, 0);
  FRAMEWIN_SetResizeable (_hFrame, 1);
  FRAMEWIN_SetTitleHeight(_hFrame, 14);
  FRAMEWIN_SetTextAlign  (_hFrame, GUI_TA_LEFT);
  FRAMEWIN_SetFont       (_hFrame, &GUI_Font10_1);
  /*
   *  Create a System icon, just like in windows
   */
  hControl = FRAMEWIN_AddButton(_hFrame, 0, 2, SYSTEM_ICON);
  WM_SetCallback(hControl, &_cbSystemIcon);
  /*
   *  Get client window of frame window to create the needed widget in it
   */
  hClient = WM_GetClientWindow(_hFrame);
  /*
   *  Create a kind of toolbar.
   */
  WM_GetClientRectEx(hClient, &Rect);
  hToolBar = WM_CreateWindowAsChild(-2, 0, Rect.x1 + 8, 30, hClient, WM_CF_SHOW, &_cbToolBar, 0);
  WM_SetAnchor(hToolBar , WM_CF_ANCHOR_LEFT | WM_CF_ANCHOR_RIGHT);
  /*
   *  Create buttons in toolbar to show the available drives
   */
  NumVolumes = FS_GetNumVolumes();
  for(i = 0; i < NumVolumes; i++) {
    char acDriveName[20];
    FS_GetVolumeName(i, &acDriveName[0], sizeof(acDriveName));
    hControl = BUTTON_CreateEx(  5 + i * 50,   5, 50, 20, hToolBar, WM_CF_SHOW | WM_CF_ANCHOR_BOTTOM, 0, GUI_ID_BUTTON0 + i);
    BUTTON_SetText(hControl, acDriveName);
  }
  /*
   *  Create an additional button in toolbar open a selected file
   */
  hControl = BUTTON_CreateEx(20 + i * 50,   5, 50, 20, hToolBar, WM_CF_SHOW | WM_CF_ANCHOR_BOTTOM, 0, BUTTON_OPENFILE);
  BUTTON_SetText(hControl, "Open File");
  WM_DisableWindow(hControl);
  /*
   *  Create a listview to show available files on drive
   */
  hControl = LISTVIEW_CreateEx(5, 35, Rect.x1 - 10, Rect.y1 - 40, hClient, WM_CF_SHOW |
                                                          WM_CF_ANCHOR_BOTTOM |
                                                          WM_CF_ANCHOR_TOP    |
                                                          WM_CF_ANCHOR_LEFT   |
                                                          WM_CF_ANCHOR_RIGHT, 0, GUI_ID_LISTVIEW0);
  SCROLLBAR_CreateAttached(hControl, SCROLLBAR_CF_VERTICAL);
  LISTVIEW_AddColumn(hControl, 80, "Name",       GUI_TA_LEFT);
  LISTVIEW_AddColumn(hControl, 80, "Size",       GUI_TA_RIGHT);
  LISTVIEW_AddColumn(hControl, 60, "File type",  GUI_TA_CENTER);
  LISTVIEW_AddColumn(hControl, 60, "Attributes", GUI_TA_CENTER);
  _pfListviewCallback = WM_SetCallback(hControl, _cbListView);
  /*
   *  Create the needed menus
   */
  _CreateMenu(_hFrame);
  _CreateSystemMenu();
  _CreateContextMenu();
  WM_SetFocus(_hFrame);
  /*
   * emExplorer is dialog based application...
   * From now on, everything is handled in callbacks
   */
  _hTimer = WM_CreateTimer(_hFrame, 0, 500, 0);
  GUI_ExecCreatedDialog(_hFrame);
}

/*******************************************************************
*
*       _GetFrameHandle
*
*  This function can be used, to get the handle of the frame window
*  in order to create a child of this window.
*/
static WM_HWIN _GetFrameHandle(void) {
  return _hFrame;
}


/*********************************************************************
*
*       _EthWinCallBack()
*/
static void _EthWinCallBack(WM_MESSAGE* pMsg) {
  static char acText[50];
  switch (pMsg->MsgId) {
  case WM_PAINT:
    if (IP_IFaceIsReady() == 0) {
       strcpy(acText, "IP: Not connected");
    } else {
      _IPAddr = IP_GetIPAddr(0);
      IP_PrintIPAddr(_acIP, _IPAddr, sizeof(_acIP));
      strcpy(acText,"IP: ");
      strcat(acText, _acIP);
    }
    GUI_SetBkColor(GUI_LIGHTGRAY);
    GUI_SetColor(GUI_BLACK);
    GUI_Clear();
    GUI_GotoXY(0, 3);
    GUI_DispString(acText);
    break;
  }
}

/*********************************************************************
*
*       _EthWindowTask()
*/
static void _EthWindowTask(void) {
  int IPState = -1;
  _hEthFrameWin = FRAMEWIN_CreateEx(0, 210, 120, 30, WM_HBKWIN, WM_CF_SHOW | WM_CF_STAYONTOP, 0, 0, "Ethernet", _EthWinCallBack);
  WM_Exec();
  _hEthWin = WM_GetClientWindow(_hEthFrameWin);
  for (;;) {
    if (IP_IFaceIsReady() != IPState) {
      WM_InvalidateWindow(_hEthWin);
    }
    IPState = IP_IFaceIsReady();
    OS_Delay(500);
  }
}

/*********************************************************************
*
*       MainTask
*
*       Starts the emExplorer
*
**********************************************************************
*/
void MainTask(void);
void MainTask(void) {
  FS_Init();
  FS_FAT_SupportLFN();
  FS_AssignCache("", acCache, 4096, FS_CACHE_RW);
  FS_CACHE_SetMode("", FS_SECTOR_TYPE_MASK_DATA, FS_CACHE_MODE_R );
  GUI_Init();
  IP_Init();
  //
  // Start TCP/IP task
  //
  OS_CREATETASK(&_TCB,       "IP_Task",     IP_Task,              TASKPRIO_IPMAIN,  _aStack);
  OS_CREATETASK(&_IPRxTCB,   "IP_RxTask",   IP_RxTask,            TASKPRIO_IPRX,    _aIPRxStack);   // Start the IP_RxTask, optional.
  //
  // Start VNC server
  //
  GUI_VNC_X_StartServer(0, 0);
  //
  // Give ethernet link state some time to show get IP address and show it
  //
  OS_CREATETASK(&_EthWindow_TCB, "EthWinTask", _EthWindowTask,   TASKPRIO_WINDOW, _aEthWindowStack);

  WM_SetCallback(WM_HBKWIN, &_cbBkWindow);
  WM_SetCreateFlags(WM_CF_MEMDEV);  /* Use memory devices on all windows to avoid flicker */
  GUI_CURSOR_Show();
  while (1) {
    _StartemExplorer();
    GUI_Delay(1000);
  }
}
