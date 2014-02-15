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
File        : WM.h
Purpose     : Windows manager include
----------------------------------------------------------------------
*/

#ifndef WM_H            /* Make sure we only include it once */
#define WM_H


#include "GUI_ConfDefaults.h"
#include "GUI_Type.h"      /* Needed because of typedefs only */
#include "WM_GUI.h"       /* Some functions needed by GUI routines */
#include "GUI.h"

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

/* Static memory devices */
#ifndef   WM_SUPPORT_STATIC_MEMDEV
  #define WM_SUPPORT_STATIC_MEMDEV 0
#endif

/* Support for transparency. Switching it off makes Wm smaller and faster */
#ifndef   WM_SUPPORT_TRANSPARENCY
  #define WM_SUPPORT_TRANSPARENCY 1 /* Should be defined outside of GUI_WINSUPPORT because of "#if GUI_WINSUPPORT && WM_SUPPORT_TRANSPARENCY" in some files */
#endif

/* This is for tests only. It will fill the invalid area of a window.
   Can be used for debugging. */
#ifndef WM_SUPPORT_DIAG
  #ifdef WIN32   /* In simulation */
    #define WM_SUPPORT_DIAG GUI_WINSUPPORT
  #else
    #define WM_SUPPORT_DIAG 0
  #endif
#endif

/* Make sure we actually have configured windows. If we have not,
  there is no point for a windows manager and it will therefor not
  generate any code !
*/

#if GUI_WINSUPPORT

/*********************************************************************
*
*       Config defaults
*/
#ifndef   WM_ASSERT
  #define WM_ASSERT(expr) GUI_DEBUG_ASSERT(expr)
#endif

#ifndef   WM_SUPPORT_TOUCH
  #define WM_SUPPORT_TOUCH        GUI_SUPPORT_TOUCH
#endif

#ifndef   WM_SUPPORT_OBSTRUCT
  #define WM_SUPPORT_OBSTRUCT 1
#endif

/* Allow older API calls */
#ifndef   WM_COMPATIBLE_MODE
  #define WM_COMPATIBLE_MODE 1
#endif

/* Send a message if visibility of a window has changed */
#ifndef   WM_SUPPORT_NOTIFY_VIS_CHANGED
  #define WM_SUPPORT_NOTIFY_VIS_CHANGED 0
#endif

#ifndef   WM_SUPPORT_CPP
  #if defined (_MSC_VER)
    #define WM_SUPPORT_CPP 1
  #else
    #define WM_SUPPORT_CPP 0
  #endif
#endif

/*********************************************************************
*
*       Locking macros
*/
#define WM_LOCK()   GUI_LOCK()
#define WM_UNLOCK() GUI_UNLOCK()

/*********************************************************************
*
*       Data types
*/
typedef struct {
  int Key, PressedCnt;
} WM_KEY_INFO;

typedef struct {
  int NumItems, v, PageSize;
} WM_SCROLL_STATE;

typedef struct {
  int Done;
  int ReturnValue;
} WM_DIALOG_STATUS;

typedef struct {
  int x,y;
  U8  State;
  U8  StatePrev;
} WM_PID_STATE_CHANGED_INFO;

/*********************************************************************
*
*       Messages Ids
*
* The following is the list of windows messages.
*/
#define WM_CREATE                   0x0001  /* The first message received, right after client has actually been created */
#define WM_MOVE                     0x0003  /* window has been moved (Same as WIN32) */

#define WM_SIZE                     0x0005  /* Is sent to a window after its size has changed (Same as WIN32, do not change !) */

#define WM_DELETE                   11      /* Delete (Destroy) command: This tells the client to free its data strutures since the window
                                               it is associates with no longer exists.*/
#define WM_TOUCH                    12      /* Touch screen message */
#define WM_TOUCH_CHILD              13      /* Touch screen message to ancestors */
#define WM_KEY                      14      /* Key has been pressed */

#define WM_PAINT                    0x000F  /* Repaint window (because content is (partially) invalid */

#if GUI_SUPPORT_MOUSE
#define WM_MOUSEOVER                16      /* Mouse has moved, no key pressed */
#define WM_MOUSEOVER_END            18      /* Mouse has moved, no key pressed */
#endif

#define WM_PID_STATE_CHANGED        17      /* Pointer input device state has changed */

#define WM_GET_INSIDE_RECT          20      /* get inside rectangle: client rectangle minus pixels lost to effect */
#define WM_GET_ID                   21      /* Get id of widget */
#define WM_SET_ID                   22      /* Set id of widget */
#define WM_GET_CLIENT_WINDOW        23      /* Get window handle of client window. Default is the same as window */
#define WM_CAPTURE_RELEASED         24      /* Let window know that mouse capture is over */

#define WM_INIT_DIALOG              29      /* Inform dialog that it is ready for init */

#define WM_SET_FOCUS                30      /* Inform window that it has gotten or lost the focus */
#define WM_GET_ACCEPT_FOCUS         31      /* Find out if window can accept the focus */
#define WM_NOTIFY_CHILD_HAS_FOCUS   32      /* Sent to parent when child receives / loses focus */

#define WM_NOTIFY_OWNER_KEY         33      /* Some widgets (e.g. listbox) notify owner when receiving key messages */

#define WM_GET_BKCOLOR              34      /* Return back ground color (only frame window and similar) */
#define WM_GET_SCROLL_STATE         35      /* Query state of scroll bar */

#define WM_SET_SCROLL_STATE         36      /* Set scroll info ... only effective for scrollbars */

#define WM_NOTIFY_CLIENTCHANGE      37      /* Client area may have changed */
#define WM_NOTIFY_PARENT            38      /* Notify parent. Information is detailed as notification code */
#define WM_NOTIFY_PARENT_REFLECTION 39      /* Notify parent reflection. 
                                               Sometimes send back as a result of the WM_NOTIFY_PARENT message
                                               to let child react on behalf of its parent.
                                               Information is detailed as notification code */
#define WM_NOTIFY_ENABLE            40      /* Enable or disable widget */
#define WM_NOTIFY_VIS_CHANGED       41      /* Visibility of a window has or may have changed */

#define WM_HANDLE_DIALOG_STATUS     42      /* Set or get dialog status */
#define WM_GET_RADIOGROUP           43      /* Send to all siblings and children of a radio control when
                                               selection changed */
#define WM_MENU                     44      /* Send to owner window of menu widget */
#define WM_SCREENSIZE_CHANGED       45      /* Send to all windows when size of screen has changed */

#define WM_TIMER                    0x0113  /* Timer has expired              (Keep the same as WIN32) */
#define WM_WIDGET                   0x0300  /* 256 messages reserved for Widget messages */
#define WM_USER                     0x0400  /* Reserved for user messages ... (Keep the same as WIN32) */


/*********************************************************************
*
*       Notification codes
*
* The following is the list of notification codes send
* with the WM_NOTIFY_PARENT message
*/
#define WM_NOTIFICATION_CLICKED             1
#define WM_NOTIFICATION_RELEASED            2
#define WM_NOTIFICATION_MOVED_OUT           3
#define WM_NOTIFICATION_SEL_CHANGED         4
#define WM_NOTIFICATION_VALUE_CHANGED       5
#define WM_NOTIFICATION_SCROLLBAR_ADDED     6      /* Scroller added */
#define WM_NOTIFICATION_CHILD_DELETED       7      /* Inform window that child is about to be deleted */
#define WM_NOTIFICATION_GOT_FOCUS           8
#define WM_NOTIFICATION_LOST_FOCUS          9
#define WM_NOTIFICATION_SCROLL_CHANGED     10

#define WM_NOTIFICATION_WIDGET             11      /* Space for widget defined notifications */
#define WM_NOTIFICATION_USER               16      /* Space for  application (user) defined notifications */

/*********************************************************************
*
*       Memory management
*/
#define WM_HWIN        GUI_HWIN
#define WM_HWIN_NULL   GUI_HMEM_NULL
#define WM_HMEM        GUI_HMEM
#define WM_HMEM_NULL   GUI_HMEM_NULL
#define WM_HTIMER      GUI_HMEM

/*********************************************************************
*
*       Window defines
*/
#define WM_HBKWIN      WM_GetDesktopWindow()                /* Handle of background window */
#define WM_UNATTACHED  ((WM_HMEM)-1)                        /* Do not attach to a window */

/*********************************************************************
*
*       Window create flags.
* These flags can be passed to the create window
* function as flag-parameter. The flags are combinable using the
* binary or operator.
*/
#define WM_CF_HASTRANS         (1 << 0)  /* Has transparency. Needs to be defined for windows which do not fill the entire
                                          section of their (client) rectangle. */
#define WM_CF_HIDE             (0 << 1)  /* Hide window after creation (default !) */
#define WM_CF_SHOW             (1 << 1)  /* Show window after creation */
#define WM_CF_MEMDEV           (1 << 2)  /* Use memory device for redraws */
#define WM_CF_STAYONTOP        (1 << 3)  /* Stay on top */
#define WM_CF_DISABLED         (1 << 4)  /* Disabled: Does not receive PID (mouse & touch) input */

/* Create only flags ... Not available as status flags */
#define WM_CF_ACTIVATE         (1 << 5)  /* If automatic activation upon creation of window is desired */
#define WM_CF_FGND             (0 << 6)  /* Put window in foreground after creation (default !) */
#define WM_CF_BGND             (1 << 6)  /* Put window in background after creation */

/* Anchor flags */
#define WM_CF_ANCHOR_RIGHT     (1 << 7)  /* Right anchor ... If parent is resized, distance to right will remain const (left is default) */
#define WM_CF_ANCHOR_BOTTOM    (1 << 8)  /* Bottom anchor ... If parent is resized, distance to bottom will remain const (top is default) */
#define WM_CF_ANCHOR_LEFT      (1 << 9)  /* Left anchor ... If parent is resized, distance to left will remain const (left is default) */
#define WM_CF_ANCHOR_TOP       (1 << 10) /* Top anchor ... If parent is resized, distance to top will remain const (top is default) */

#define WM_CF_CONST_OUTLINE    (1 << 11) /* Constant outline. This is relevant for transparent windows only. If a window is transparent
                                            and does not have a constant outline, its background is invalided instead of the window itself.
                                            This causes add. computation time when redrawing. */
#define WM_CF_LATE_CLIP        (1 << 12)
#define WM_CF_MEMDEV_ON_REDRAW (1 << 13)

#define WM_SF_INVALID_DRAW     (1 << 14)
#define WM_SF_DELETE           (1 << 15) /* Marks the window to be deleted within WM_Exec() when no callback routine is executed */

/*********************************************************************
*
*       Window manager types
*/
typedef struct WM_Obj     WM_Obj;
typedef struct WM_OBJ_X   WM_OBJ_X;
typedef struct WM_MESSAGE WM_MESSAGE;

typedef void WM_CALLBACK( WM_MESSAGE* pMsg);

struct WM_MESSAGE {
  int MsgId;            /* type of message */
  WM_HWIN hWin;         /* Destination window */
  WM_HWIN hWinSrc;      /* Source window  */
  union {
    const void* p;            /* Some messages need more info ... Pointer is declared "const" because some systems (M16C) have 4 byte const, byte 2 byte default ptrs */
    int v;
    GUI_COLOR Color;
  } Data;
};

struct WM_Obj {
  GUI_RECT Rect;        /* Outer dimensions of window */
  GUI_RECT InvalidRect; /* Invalid rectangle */
  WM_CALLBACK* cb;      /* Ptr to notification callback */
  WM_HWIN hNextLin;     /* Next window in linear list */
  WM_HWIN hParent;
  WM_HWIN hFirstChild;
  WM_HWIN hNext;
  #if WM_SUPPORT_STATIC_MEMDEV
    GUI_MEMDEV_Handle hMem; /* Static memory device */
  #endif
  U16 Status;	          /* Some status flags */
  #if WM_SUPPORT_CPP
    void * ObjPtr;
  #endif
};

struct WM_OBJ_X {       /* For debugging only if a pointer-based memory management is used */
  int    Dummy;
  struct WM_Obj Win;
};

typedef void WM_tfPollPID(void);
typedef void WM_tfForEach(WM_HWIN hWin, void * pData);

typedef void (* WM_tfInvalidateParent)  (const GUI_RECT * pInvalidRect, WM_HWIN hParent, WM_HWIN hStop);
typedef void (* WM_tfInvalidateDrawFunc)(WM_HWIN hWin);
typedef void (* WM_tfPaint1Func)        (WM_HWIN hWin, WM_Obj * pWin);

typedef struct {
  WM_HMEM  hTimer;
  WM_HWIN  hWin;
  int      UserId;
} WM_TIMER_OBJ;

/*********************************************************************
*
*       General control routines
*/
void WM_Activate  (void);
void WM_Deactivate(void);
void WM_Init      (void);
int  WM_Exec      (void);    /* Execute all jobs ... Return 0 if nothing was done. */
int  WM_Exec1     (void);    /* Execute one job  ... Return 0 if nothing was done. */
U16  WM_SetCreateFlags(U16 Flags);
WM_tfPollPID* WM_SetpfPollPID(WM_tfPollPID* pf);
void WM_SetCapture(WM_HWIN hObj, int AutoRelease);
void WM_SetCaptureMove(WM_HWIN hWin, const GUI_PID_STATE* pState, int MinVisibility, int LimitTop); /* Not yet documented */
void WM_ReleaseCapture(void);

/*********************************************************************
*
*       Window manager interface
*/
void    WM_AttachWindow              (WM_HWIN hWin, WM_HWIN hParent);
void    WM_AttachWindowAt            (WM_HWIN hWin, WM_HWIN hParent, int x, int y);
int     WM_CheckScrollPos            (WM_SCROLL_STATE* pScrollState, int Pos, int LowerDist, int UpperDist); /* not to be documented (may change in future version) */
void    WM_ClrHasTrans               (WM_HWIN hWin);
WM_HWIN WM_CreateWindow              (int x0, int y0, int xSize, int ySize, U16 Style, WM_CALLBACK* cb, int NumExtraBytes);
WM_HWIN WM_CreateWindowAsChild       (int x0, int y0, int xSize, int ySize, WM_HWIN hWinParent, U16 Style, WM_CALLBACK* cb, int NumExtraBytes);
void    WM_DeleteWindow              (WM_HWIN hWin);
void    WM_DetachWindow              (WM_HWIN hWin);
int     WM_GetHasTrans               (WM_HWIN hWin);
WM_HWIN WM_GetFocussedWindow         (void);
void    WM_HideWindow                (WM_HWIN hWin);
void    WM_InvalidateArea            (const GUI_RECT* pRect);
void    WM_InvalidateRect            (WM_HWIN hWin, const GUI_RECT*pRect);
void    WM_InvalidateWindow          (WM_HWIN hWin);
void    WM_InvalidateWindowAndDescsEx(WM_HWIN hWin, const GUI_RECT * pInvalidRect, U16 Flags);
void    WM_InvalidateWindowAndDescs  (WM_HWIN hWin);    /* not to be documented (may change in future version) */
int     WM_IsEnabled                 (WM_HWIN hObj);
int     WM_IsFocussable              (WM_HWIN hWin);
int     WM_IsVisible                 (WM_HWIN hWin);
int     WM_IsWindow                  (WM_HWIN hWin);    /* Check validity */
char    WM_IsCompletelyCovered       (WM_HWIN hWin);    /* Checks if the window is completely covered by other windows */
char    WM_IsCompletelyVisible       (WM_HWIN hWin);    /* Is the window completely visible ? */
void    WM_SetHasTrans               (WM_HWIN hWin);
void    WM_SetId                     (WM_HWIN hObj, int Id);
void    WM_SetTransState             (WM_HWIN hWin, unsigned State);
void    WM_ShowWindow                (WM_HWIN hWin);
void    WM_ValidateRect              (WM_HWIN hWin, const GUI_RECT*pRect);
void    WM_ValidateWindow            (WM_HWIN hWin);
int     WM_GetInvalidRect            (WM_HWIN hWin, GUI_RECT * pRect);
void    WM_SetStayOnTop              (WM_HWIN hWin, int OnOff);
int     WM_GetStayOnTop              (WM_HWIN hWin);
void    WM_SetAnchor                 (WM_HWIN hWin, U16 AnchorFlags);

/*********************************************************************
*
*       Static memory devices
*/
#if (GUI_SUPPORT_MEMDEV && GUI_WINSUPPORT)
  GUI_MEMDEV_Handle GUI_MEMDEV_GetStaticDevice    (WM_HWIN hWin);
  void              GUI_MEMDEV_EnableStaticDevices(int OnOff);
#endif

/* Move/resize windows */
void WM_MoveWindow                (WM_HWIN hWin, int dx, int dy);
void WM_ResizeWindow              (WM_HWIN hWin, int dx, int dy);
void WM_MoveTo                    (WM_HWIN hWin, int x, int y);
void WM_MoveChildTo               (WM_HWIN hWin, int x, int y);
void WM_SetSize                   (WM_HWIN hWin, int XSize, int YSize);
void WM_SetWindowPos              (WM_HWIN hWin, int xPos, int yPos, int xSize, int ySize);
int  WM_SetXSize                  (WM_HWIN hWin, int xSize);
int  WM_SetYSize                  (WM_HWIN hWin, int ySize);
int  WM_SetScrollbarH             (WM_HWIN hWin, int OnOff); /* not to be documented (may change in future version) */
int  WM_SetScrollbarV             (WM_HWIN hWin, int OnOff); /* not to be documented (may change in future version) */

/* Timer */
#ifdef GUI_X_CREATE_TIMER
  int  WM_CreateTimer    (WM_HWIN hWin, int UserID, int Period, int Mode); /* not to be documented (may change in future version) */
  void WM_DeleteTimer    (WM_HWIN hWin, int UserId); /* not to be documented (may change in future version) */
#else
  WM_HMEM WM_CreateTimer (WM_HWIN hWin, int UserID, int Period, int Mode); /* not to be documented (may change in future version) */
  void    WM_DeleteTimer (WM_HMEM hTimer); /* not to be documented (may change in future version) */
  void    WM_RestartTimer(WM_HMEM hTimer, int Period);
#endif

/* Diagnostics */
int WM_GetNumWindows(void);
int WM_GetNumInvalidWindows(void);

/* Scroll state related functions */
void WM_CheckScrollBounds(WM_SCROLL_STATE* pScrollState); /* not to be documented (may change in future version) */
int  WM_GetScrollPosH    (WM_HWIN hWin);
int  WM_GetScrollPosV    (WM_HWIN hWin);
void WM_SetScrollPosH    (WM_HWIN hWin, unsigned ScrollPos);
void WM_SetScrollPosV    (WM_HWIN hWin, unsigned ScrollPos);
int  WM_SetScrollValue   (WM_SCROLL_STATE* pScrollState, int v); /* not to be documented (may change in future version) */

/* Get / Set (new) callback function */
WM_CALLBACK * WM_SetCallback(WM_HWIN hWin, WM_CALLBACK * cb);
WM_CALLBACK * WM_GetCallback(WM_HWIN hWin);

/* Get size/origin of a window */
void WM_GetClientRect             (GUI_RECT* pRect);
void WM_GetClientRectEx           (WM_HWIN hWin, GUI_RECT* pRect);
void WM_GetInsideRect             (GUI_RECT* pRect);
void WM_GetInsideRectEx           (WM_HWIN hWin, GUI_RECT* pRect);
void WM_GetInsideRectExScrollbar  (WM_HWIN hWin, GUI_RECT* pRect); /* not to be documented (may change in future version) */
void WM_GetWindowRect             (GUI_RECT* pRect);
void WM_GetWindowRectEx           (WM_HWIN hWin, GUI_RECT* pRect);
int  WM_GetOrgX                   (void);
int  WM_GetOrgY                   (void);
int  WM_GetWindowOrgX             (WM_HWIN hWin);
int  WM_GetWindowOrgY             (WM_HWIN hWin);
int  WM_GetWindowSizeX            (WM_HWIN hWin);
int  WM_GetWindowSizeY            (WM_HWIN hWin);
WM_HWIN WM_GetFirstChild          (WM_HWIN hWin);
WM_HWIN WM_GetNextSibling         (WM_HWIN hWin);
WM_HWIN WM_GetParent              (WM_HWIN hWin);
WM_HWIN WM_GetPrevSibling         (WM_HWIN hWin);
int     WM_GetId                  (WM_HWIN hWin);
WM_HWIN WM_GetScrollbarV          (WM_HWIN hWin);
WM_HWIN WM_GetScrollbarH          (WM_HWIN hWin);
WM_HWIN WM_GetScrollPartner       (WM_HWIN hWin);
WM_HWIN WM_GetClientWindow        (WM_HWIN hObj);
GUI_COLOR WM_GetBkColor           (WM_HWIN hObj);

/* Change Z-Order of windows */
void WM_BringToBottom(WM_HWIN hWin);
void WM_BringToTop(WM_HWIN hWin);

GUI_COLOR WM_SetDesktopColor(GUI_COLOR Color);
GUI_COLOR WM_SetDesktopColorEx(GUI_COLOR Color, unsigned int LayerIndex);
void WM_SetDesktopColors(GUI_COLOR Color);

/* Select window used for drawing operations */
WM_HWIN WM_SelectWindow           (WM_HWIN  hWin);
WM_HWIN WM_GetActiveWindow        (void);
void    WM_Paint                  (WM_HWIN hObj);
void    WM_Update                 (WM_HWIN hWin);
void    WM_PaintWindowAndDescs    (WM_HWIN hWin);
void    WM_UpdateWindowAndDescs   (WM_HWIN hWin);

/* Get foreground/background windows */
WM_HWIN WM_GetDesktopWindow    (void);
WM_HWIN WM_GetDesktopWindowEx  (unsigned int LayerIndex);

/* Reduce clipping area of a window */
const GUI_RECT* WM_SetUserClipRect(const GUI_RECT* pRect);
void            WM_SetDefault     (void);

/* Use of memory devices */
void WM_EnableMemdev              (WM_HWIN hWin);
void WM_DisableMemdev             (WM_HWIN hWin);

int WM_OnKey(int Key, int Pressed);
void WM_MakeModal(WM_HWIN hWin);

/*********************************************************************
*
*       Message related functions
*
*  Please note that some of these functions do not yet show up in the
*  documentation, as they should not be required by application program.
*/
void      WM_NotifyParent         (WM_HWIN hWin, int Notification);
void      WM_SendMessage          (WM_HWIN hWin, WM_MESSAGE* p);
void      WM_SendMessageNoPara    (WM_HWIN hWin, int MsgId);             /* not to be documented (may change in future versionumented */
void      WM_DefaultProc          (WM_MESSAGE* pMsg);
int       WM_BroadcastMessage     (WM_MESSAGE* pMsg);
void      WM_SetScrollState       (WM_HWIN hWin, const WM_SCROLL_STATE* pState);
void      WM_SetEnableState       (WM_HWIN hItem, int State);
void      WM_SendToParent         (WM_HWIN hWin, WM_MESSAGE* pMsg);
int       WM_HasCaptured          (WM_HWIN hWin);
int       WM_HasFocus             (WM_HWIN hWin);
int       WM_SetFocus             (WM_HWIN hWin);
WM_HWIN   WM_SetFocusOnNextChild  (WM_HWIN hParent);     /* Set the focus to the next child */
WM_HWIN   WM_SetFocusOnPrevChild  (WM_HWIN hParent);     /* Set the focus to the previous child */
WM_HWIN   WM_GetDialogItem        (WM_HWIN hWin, int Id);
void      WM_EnableWindow         (WM_HWIN hWin);
void      WM_DisableWindow        (WM_HWIN hWin);
void      WM_GetScrollState       (WM_HWIN hObj, WM_SCROLL_STATE* pScrollState);
int       WM_GetUserData          (WM_HWIN hWin,       void* pDest, int SizeOfBuffer);
int       WM_SetUserData          (WM_HWIN hWin, const void* pSrc,  int SizeOfBuffer);

/*********************************************************************
*
*       Misc routines
*/
int       WM_HandlePID      (void);
WM_HWIN   WM_Screen2hWin    (int x, int y);
WM_HWIN   WM_Screen2hWinEx  (WM_HWIN hStop, int x, int y);
void      WM_ForEachDesc    (WM_HWIN hWin, WM_tfForEach * pcb, void * pData);
void      WM_SetScreenSize  (int xSize, int ySize);
int       WM_PollSimMsg     (void);

/*********************************************************************
*
*       Diagnostics routines
*/
#if (WM_SUPPORT_DIAG)
void WM_DIAG_EnableInvalidationColoring(int OnOff);
#endif

/*********************************************************************
*
*       Macros for compatibility with older versions
*/
#if WM_COMPATIBLE_MODE
  #define HBWIN             WM_HWIN
  #define HBWIN_NULL        WM_HWIN_NULL

  #define WM_HideWin        WM_HideWindow
  #define WM_ShowWin        WM_ShowWindow
  #define WM_GetKey         GUI_GetKey
  #define WM_WaitKey        GUI_WaitKey

  #define WM_ExecIdle       WM_Exec
  #define WM_ExecIdle1      WM_Exec1

  #define WM_Invalidate     WM_InvalidateWindow
  #define WM_GetWinRect     WM_GetWindowRect
  #define WM_GetWinOrgX     WM_GetWindowOrgX
  #define WM_GetWinOrgY     WM_GetWindowOrgY
  #define WM_GetWinSizeX    WM_GetWindowSizeX
  #define WM_GetWinSizeY    WM_GetWindowSizeY
  #define WM_GetXSize       WM_GetWindowSizeX
  #define WM_GetYSize       WM_GetWindowSizeY
  #define WM_SelWin         WM_SelectWindow
  #define WM_GetBackgroundWindow  WM_GetDesktopWindow
  #define WM_GetForegroundWindow    0
  #define WM_SetForegroundWindow    WM_BringToTop
  #define WM_SetUserClipArea WM_SetUserClipRect


  #define WM_Start()
  #define WM_Stop()
  #define WM_SetBkWindowColor(Color)  WM_SetDesktopColor(Color)

#endif


#endif   /* GUI_WINSUPPORT */

#if defined(__cplusplus)
}
#endif 

#endif   /* WM_H */

/*************************** End of file ****************************/
