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
File        : ICONVIEW_Private.h
Purpose     : ICONVIEW private header file
--------------------END-OF-HEADER-------------------------------------
*/

#ifndef ICONVIEW_PRIVATE_H
#define ICONVIEW_PRIVATE_H

#include "WM.h"
#include "GUI_ARRAY.h"
#include "ICONVIEW.h"

#if GUI_WINSUPPORT

/*********************************************************************
*
*       Types
*
**********************************************************************
*/
typedef struct {
  const GUI_FONT GUI_UNI_PTR * pFont;
  GUI_COLOR aBkColor[3];
  GUI_COLOR aTextColor[3];
  int FrameX, FrameY;
  int SpaceX, SpaceY;
  int TextAlign;
} ICONVIEW_PROPS;

typedef struct {
  WIDGET          Widget;
  WM_SCROLL_STATE ScrollStateV;
  WM_SCROLL_STATE ScrollStateH;
  ICONVIEW_PROPS  Props;
  GUI_ARRAY       ItemArray;
  int             xSizeItems;
  int             ySizeItems;
  int             Sel;
  U16             Flags;
  /* Type check in debug version */
  #if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
    int DebugId;
  #endif  
} ICONVIEW_OBJ;

typedef void tDrawImage(GUI_RECT * pRect, const void * pData);
typedef void tDrawText (ICONVIEW_OBJ * pObj, GUI_RECT * pRect, const char * s);

typedef struct {
  tDrawImage * pfDrawImage;
  tDrawText  * pfDrawText;
  const void * pData;
  int SizeofData;
  char acText[1];
} ICONVIEW_ITEM;

/*********************************************************************
*
*       Macros for internal use
*
**********************************************************************
*/
#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  #define ICONVIEW_INIT_ID(p) p->DebugId = ICONVIEW_ID
#else
  #define ICONVIEW_INIT_ID(p)
#endif

#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  ICONVIEW_OBJ * ICONVIEW_LockH(ICONVIEW_Handle h);
  #define ICONVIEW_LOCK_H(h)   ICONVIEW_LockH(h)
#else
  #define ICONVIEW_LOCK_H(h)   (ICONVIEW_OBJ *)GUI_LOCK_H(h)
#endif

#endif   /* GUI_WINSUPPORT */
#endif   /* ICONVIEW_H */

/*************************** End of file ****************************/
