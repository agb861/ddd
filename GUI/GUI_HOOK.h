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
File        : GUI_HOOK.h
Purpose     : Hook handling routines
--------------------END-OF-HEADER-------------------------------------
*/

#ifndef GUI_HOOK_H
#define GUI_HOOK_H

#include "WM_Intern.h"

#if GUI_WINSUPPORT

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

/*********************************************************************
*
*       Types
*
**********************************************************************
*/

typedef int GUI_HOOK_FUNC(WM_MESSAGE* pMsg);

typedef struct GUI_HOOK {
  struct GUI_HOOK* pNext;
  GUI_HOOK_FUNC*   pHookFunc;
} GUI_HOOK;

/*********************************************************************
*
*       Functions
*
**********************************************************************
*/

void GUI_HOOK_Add   (GUI_HOOK** ppFirstHook, GUI_HOOK* pNewHook, GUI_HOOK_FUNC* pHookFunc);
void GUI_HOOK_Remove(GUI_HOOK** ppFirstHook, GUI_HOOK* pHook);

#if defined(__cplusplus)
  }
#endif

#endif   /* GUI_WINSUPPORT */
#endif   /* GUI_HOOK_H */

/*************************** End of file ****************************/
