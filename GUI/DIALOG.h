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
--------------------END-OF-HEADER-------------------------------------
*/

#ifndef DIALOG_H
#define DIALOG_H

#include "WM.h"
#include "BUTTON.h"
#include "CHECKBOX.h"
#include "DROPDOWN.h"
#include "EDIT.h"
#include "FRAMEWIN.h"
#include "GRAPH.h"
#include "HEADER.h"
#include "ICONVIEW.h"
#include "LISTBOX.h"
#include "LISTVIEW.h"
#include "LISTWHEEL.h"
#include "MENU.h"
#include "MULTIEDIT.h"
#include "PROGBAR.h"
#include "RADIO.h"
#include "SCROLLBAR.h"
#include "SLIDER.h"
#include "TEXT.h"
#include "TREEVIEW.h"

#if GUI_WINSUPPORT

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

WM_HWIN WINDOW_CreateIndirect   (const GUI_WIDGET_CREATE_INFO * pCreateInfo, WM_HWIN hWinParent, int x0, int y0, WM_CALLBACK * cb);
void    WINDOW_SetBkColor       (WM_HWIN hObj, GUI_COLOR Color);
void    WINDOW_SetDefaultBkColor(GUI_COLOR Color);

GUI_COLOR WINDOW_GetDefaultBkColor(void);

void WINDOW_Callback(WM_MESSAGE * pMsg);

#if defined(__cplusplus)
  }
#endif

#endif

#endif

