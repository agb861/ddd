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
File        : Dialog.h
Purpose     : Dialog box include
----------------------------------------------------------------------
Open items:
None
--------------------END-OF-HEADER-------------------------------------
*/

#ifndef DIALOG_INTERN_H
#define DIALOG_INTERN_H

#include "WM.h"

#if GUI_WINSUPPORT


#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

/*********************************************************************
*
*           typedefs
*
**********************************************************************
*/

typedef struct  GUI_WIDGET_CREATE_INFO_struct GUI_WIDGET_CREATE_INFO;
typedef WM_HWIN GUI_WIDGET_CREATE_FUNC       (const GUI_WIDGET_CREATE_INFO* pCreate, WM_HWIN hWin, int x0, int y0, WM_CALLBACK* cb);

/*********************************************************************
*
*           structures
*
**********************************************************************
*/
struct GUI_WIDGET_CREATE_INFO_struct {
  GUI_WIDGET_CREATE_FUNC* pfCreateIndirect;
  const char* pName;                     /* Text ... Not used on all widgets */
  I16 Id;                                /* ID ... should be unique in a dialog */
  I16 x0, y0, xSize, ySize;              /* Define position and size */
  U16 Flags;                             /* Widget specific create flags (opt.) */
  I32 Para;                              /* Widget specific parameter (opt.) */ 
};

/*********************************************************************
*
*           Create functions for well known widgets
*
**********************************************************************
*/

WM_HWIN BUTTON_CreateIndirect   (const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
WM_HWIN CHECKBOX_CreateIndirect (const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
WM_HWIN EDIT_CreateIndirect     (const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
WM_HWIN FRAMEWIN_CreateIndirect (const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
WM_HWIN RADIO_CreateIndirect    (const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
WM_HWIN SLIDER_CreateIndirect   (const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
WM_HWIN SCROLLBAR_CreateIndirect(const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);
WM_HWIN TEXT_CreateIndirect     (const GUI_WIDGET_CREATE_INFO* pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK* cb);

/*********************************************************************
*
*           Public API functions
*
**********************************************************************
*/
int     GUI_ExecDialogBox     (const GUI_WIDGET_CREATE_INFO* paWidget, int NumWidgets, WM_CALLBACK* cb, WM_HWIN hParent, int x0, int y0);
int     GUI_ExecCreatedDialog (WM_HWIN hDialog);
WM_HWIN GUI_CreateDialogBox   (const GUI_WIDGET_CREATE_INFO* paWidget, int NumWidgets, WM_CALLBACK* cb, WM_HWIN hParent, int x0, int y0);
void    GUI_SetDialogStatusPtr(WM_HWIN hDialog, WM_DIALOG_STATUS* pDialogStatus); /* not to documented */
WM_DIALOG_STATUS*  GUI_GetDialogStatusPtr(WM_HWIN hDialog);                       /* not to documented */
void    GUI_EndDialog(WM_HWIN hWin, int r);
LCD_COLOR DIALOG_GetBkColor(void);                                                /* obsolete */
LCD_COLOR DIALOG_SetBkColor(LCD_COLOR BkColor);                                   /* obsolete */

#if defined(__cplusplus)
  }
#endif


#endif   /* GUI_WINSUPPORT */
#endif

