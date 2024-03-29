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
File        : DROPDOWN.h
Purpose     : Multiple choice object include
--------------------END-OF-HEADER-------------------------------------
*/

#ifndef DROPDOWN_H
#define DROPDOWN_H

#include "WM.h"
#include "DIALOG_Intern.h"      /* Req. for Create indirect data structure */
#include "LISTBOX.h"

#if GUI_WINSUPPORT

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

typedef WM_HMEM DROPDOWN_Handle;

/************************************************************
*
*       Create flags
*/
#define DROPDOWN_CF_AUTOSCROLLBAR   (1 << 0)
#define DROPDOWN_CF_UP              (1 << 1)

/*********************************************************************
*
*       Color indices
*/
#define DROPDOWN_CI_UNSEL    0
#define DROPDOWN_CI_SEL      1
#define DROPDOWN_CI_SELFOCUS 2

#define DROPDOWN_CI_ARROW    0
#define DROPDOWN_CI_BUTTON   1

/*********************************************************************
*
*                 Standard member functions
*
**********************************************************************
*/

#define DROPDOWN_EnableMemdev(hObj)  WM_EnableMemdev(hObj)
#define DROPDOWN_DisableMemdev(hObj) WM_DisableMemdev(hObj)
#define DROPDOWN_Delete(hObj)        WM_DeleteWindow(hObj)
#define DROPDOWN_Paint(hObj)         WM_Paint(hObj)
#define DROPDOWN_Invalidate(hObj)    WM_InvalidateWindow(hObj)

/*********************************************************************
*
*                 Create functions
*
**********************************************************************
*/

DROPDOWN_Handle DROPDOWN_Create        (WM_HWIN hWinParent, int x0, int y0, int xsize, int ysize, int Flags);
DROPDOWN_Handle DROPDOWN_CreateIndirect(const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
DROPDOWN_Handle DROPDOWN_CreateEx      (int x0, int y0, int xsize, int ysize, WM_HWIN hParent,
                                        int WinFlags, int ExFlags, int Id);

/*********************************************************************
*
*       The callback ...
*
* Do not call it directly ! It is only to be used from within an
* overwritten callback.
*/
void DROPDOWN_Callback(WM_MESSAGE * pMsg);

/*********************************************************************
*
*                 Member functions
*
**********************************************************************
*/

void     DROPDOWN_AddKey          (DROPDOWN_Handle hObj, int Key);
void     DROPDOWN_AddString       (DROPDOWN_Handle hObj, const char* s);
void     DROPDOWN_Collapse        (DROPDOWN_Handle hObj);
void     DROPDOWN_DecSel          (DROPDOWN_Handle hObj);
void     DROPDOWN_DecSelExp       (DROPDOWN_Handle hObj);
void     DROPDOWN_DeleteItem      (DROPDOWN_Handle hObj, unsigned int Index);
void     DROPDOWN_Expand          (DROPDOWN_Handle hObj);
unsigned DROPDOWN_GetItemDisabled (DROPDOWN_Handle hObj, unsigned Index);
unsigned DROPDOWN_GetItemSpacing  (DROPDOWN_Handle hObj);
LISTBOX_Handle DROPDOWN_GetListbox(DROPDOWN_Handle hObj);
int      DROPDOWN_GetNumItems     (DROPDOWN_Handle hObj);
int      DROPDOWN_GetSel          (DROPDOWN_Handle hObj);
int      DROPDOWN_GetSelExp       (DROPDOWN_Handle hObj);
void     DROPDOWN_IncSel          (DROPDOWN_Handle hObj);
void     DROPDOWN_IncSelExp       (DROPDOWN_Handle hObj);
void     DROPDOWN_InsertString    (DROPDOWN_Handle hObj, const char* s, unsigned int Index);
void     DROPDOWN_SetAutoScroll   (DROPDOWN_Handle hObj, int OnOff);
void     DROPDOWN_SetBkColor      (DROPDOWN_Handle hObj, unsigned int Index, GUI_COLOR color);
void     DROPDOWN_SetColor        (DROPDOWN_Handle hObj, unsigned int Index, GUI_COLOR Color);
void     DROPDOWN_SetFont         (DROPDOWN_Handle hObj, const GUI_FONT GUI_UNI_PTR * pfont);
void     DROPDOWN_SetItemDisabled (DROPDOWN_Handle hObj, unsigned Index, int OnOff);
void     DROPDOWN_SetItemSpacing  (DROPDOWN_Handle hObj, unsigned Value);
void     DROPDOWN_SetSel          (DROPDOWN_Handle hObj, int Sel);
void     DROPDOWN_SetSelExp       (DROPDOWN_Handle hObj, int Sel);
void     DROPDOWN_SetScrollbarColor(DROPDOWN_Handle hObj, unsigned Index, GUI_COLOR Color);
void     DROPDOWN_SetScrollbarWidth(DROPDOWN_Handle hObj, unsigned Width);
void     DROPDOWN_SetTextAlign    (DROPDOWN_Handle hObj, int Align);
void     DROPDOWN_SetTextColor    (DROPDOWN_Handle hObj, unsigned int index, GUI_COLOR color);
void     DROPDOWN_SetTextHeight   (DROPDOWN_Handle hObj, unsigned TextHeight);


/*********************************************************************
*
*                 Global functions
*
**********************************************************************
*/
GUI_COLOR                    DROPDOWN_GetDefaultBkColor       (int Index);
GUI_COLOR                    DROPDOWN_GetDefaultColor         (int Index);
const GUI_FONT GUI_UNI_PTR * DROPDOWN_GetDefaultFont          (void);
GUI_COLOR                    DROPDOWN_GetDefaultScrollbarColor(int Index);
void                         DROPDOWN_SetDefaultFont          (const GUI_FONT GUI_UNI_PTR * pFont);
GUI_COLOR                    DROPDOWN_SetDefaultBkColor       (int Index, GUI_COLOR Color);
GUI_COLOR                    DROPDOWN_SetDefaultColor         (int Index, GUI_COLOR Color);
GUI_COLOR                    DROPDOWN_SetDefaultScrollbarColor(int Index, GUI_COLOR Color);

#if defined(__cplusplus)
  }
#endif

#endif   /* GUI_WINSUPPORT */
#endif   /* DROPDOWN_H */
