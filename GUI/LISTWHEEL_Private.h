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
File        : LISTWHEEL_Private.h
Purpose     : Private LISTWHEEL include
--------------------END-OF-HEADER-------------------------------------
*/

#ifndef LISTWHEEL_PRIVATE_H
#define LISTWHEEL_PRIVATE_H

#include "LISTWHEEL.h"
#include "WM.h"
#include "GUI_ARRAY.h"
#include "WIDGET.h"

#if GUI_WINSUPPORT

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/
#define LISTWHEEL_STATE_PRESSED WIDGET_STATE_USER0

/*********************************************************************
*
*       Object definition
*
**********************************************************************
*/

typedef struct {
  void * pData;
  char acText[1];
} LISTWHEEL_ITEM;

typedef struct {
  const GUI_FONT GUI_UNI_PTR * pFont;
  GUI_COLOR aBackColor[2];
  GUI_COLOR aTextColor[2];
  I16 Align;
} LISTWHEEL_PROPS;

typedef struct {
  WIDGET Widget;
  GUI_ARRAY ItemArray;
  WIDGET_DRAW_ITEM_FUNC * pfOwnerDraw;
  LISTWHEEL_PROPS Props;
  void * pData;
  #if GUI_DEBUG_LEVEL > 1
    int DebugId;
  #endif
  WM_HMEM hTimer;
  unsigned LBorder;
  unsigned RBorder;
  unsigned LineHeight;
  int Sel;
  int TimeTouched;   // Time stamp of last touch event
  int Pos;           // Current position in pixels
  int Velocity;      // Motion in pixels
  int SnapPosition;  // Snap position in pixels
  int TouchPos;      // Y-position of last touch event
  int ySizeData;     // Data size in pixels
  int Destination;   // Destination position in pixels
} LISTWHEEL_OBJ;

/*********************************************************************
*
*       Macros for internal use
*
**********************************************************************
*/
#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  #define LISTWHEEL_INIT_ID(p) p->DebugId = LISTWHEEL_ID
#else
  #define LISTWHEEL_INIT_ID(p)
#endif

#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  LISTWHEEL_OBJ * LISTWHEEL_LockH(LISTWHEEL_Handle h);
  #define LISTWHEEL_LOCK_H(h)   LISTWHEEL_LockH(h)
#else
  #define LISTWHEEL_LOCK_H(h)   (LISTWHEEL_OBJ *)GUI_LOCK_H(h)
#endif

/*********************************************************************
*
*       Private (module internal) data
*
**********************************************************************
*/
extern LISTWHEEL_PROPS LISTWHEEL_DefaultProps;

/*********************************************************************
*
*       Private (module internal) functions
*
**********************************************************************
*/
const char * LISTWHEEL__GetpStringLocked(LISTWHEEL_Handle hObj, int Index);

#endif /* GUI_WINSUPPORT */

#else                            /* Avoid problems with empty object modules */
  void LISTWHEEL_C(void) {}
#endif

/*************************** End of file ****************************/
