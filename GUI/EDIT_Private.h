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
File        : EDIT_Private.h
Purpose     : Internal header file
---------------------------END-OF-HEADER------------------------------
*/

#ifndef EDIT_PRIVATE_H
#define EDIT_PRIVATE_H

#include "EDIT.h"

#if GUI_WINSUPPORT

#include "WIDGET.h"

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/

#define EDIT_REALLOC_SIZE  16

#ifndef EDIT_XOFF
  #define EDIT_XOFF 1
#endif

/*********************************************************************
*
*       Types
*
**********************************************************************
*/

typedef struct EDIT_Obj_struct EDIT_Obj;

typedef struct {
  int                          Align;
  int                          Border;
  const GUI_FONT GUI_UNI_PTR * pFont;
  GUI_COLOR                    aTextColor[2];
  GUI_COLOR                    aBkColor[2];
} EDIT_PROPS;

struct EDIT_Obj_struct {
  WIDGET Widget;
  WM_HMEM hpText;
  I16 MaxLen;
  U16 BufferSize;
  I32 Min, Max;            /* Min max values as normalized floats (integers) */
  U8 NumDecs;              /* Number of decimals */
  U32 CurrentValue;        /* Current value */
  int CursorPos;           /* Cursor position. 0 means left most */
  unsigned SelSize;        /* Number of selected characters */
  U8 EditMode;             /* Insert or overwrite mode */
  U8 XSizeCursor;          /* Size of cursor when working in insert mode */
  U8 Flags;
  tEDIT_AddKeyEx     * pfAddKeyEx;     /* Handle key input */
  tEDIT_UpdateBuffer * pfUpdateBuffer;  /* Update textbuffer */
  EDIT_PROPS Props;
  WM_HTIMER hTimer;
  #if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
    int DebugId;
  #endif  
};

/*********************************************************************
*
*       Macros for internal use
*
**********************************************************************
*/
#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  #define EDIT_INIT_ID(p) p->DebugId = EDIT_ID
#else
  #define EDIT_INIT_ID(p)
#endif

#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  EDIT_Obj * EDIT_LockH(EDIT_Handle h);
  #define EDIT_LOCK_H(h)   EDIT_LockH(h)
#else
  #define EDIT_LOCK_H(h)   (EDIT_Obj *)GUI_LOCK_H(h)
#endif

/*********************************************************************
*
*       Public data (internal defaults)
*
**********************************************************************
*/

extern EDIT_PROPS EDIT__DefaultProps;

/*********************************************************************
*
*       Public functions (internal)
*
**********************************************************************
*/

void EDIT__SetCursorPos   (EDIT_Handle hObj, int CursorPos);
U16  EDIT__GetCurrentChar (EDIT_Obj * pObj);
void EDIT__SetValueUnsigned(EDIT_Handle hObj, I32 Value);

#endif /* GUI_WINSUPPORT */

#endif /* EDIT_PRIVATE_H */
