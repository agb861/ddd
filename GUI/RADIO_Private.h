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
File        : RADIO_Private.h
Purpose     : RADIO private header file
--------------------END-OF-HEADER-------------------------------------
*/

#ifndef RADIO_PRIVATE_H
#define RADIO_PRIVATE_H

#include "WM.h"

#if GUI_WINSUPPORT

#include "RADIO.h"
#include "WIDGET.h"
#include "GUI_ARRAY.h"

/*********************************************************************
*
*       Object definition
*
**********************************************************************
*/

typedef struct {
  GUI_COLOR BkColor;
  GUI_COLOR TextColor;
  GUI_COLOR FocusColor;
  const GUI_FONT GUI_UNI_PTR* pFont;
  const GUI_BITMAP* apBmRadio[2];
  const GUI_BITMAP* pBmCheck;
} RADIO_PROPS;

typedef struct {
  WIDGET Widget;
  RADIO_PROPS Props;
  GUI_ARRAY TextArray;
  I16 Sel;                   /* current selection */
  U16 Spacing;
  U16 Height;
  U16 NumItems;
  U8  GroupId;
  #if GUI_DEBUG_LEVEL >1
    int DebugId;
  #endif  
} RADIO_Obj;

/*********************************************************************
*
*       Macros for internal use
*
**********************************************************************
*/
#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  #define RADIO_INIT_ID(p) p->DebugId = RADIO_ID
#else
  #define RADIO_INIT_ID(p)
#endif

#if GUI_DEBUG_LEVEL >= GUI_DEBUG_LEVEL_CHECK_ALL
  RADIO_Obj * RADIO_LockH(RADIO_Handle h);
  #define RADIO_LOCK_H(h)   RADIO_LockH(h)
#else
  #define RADIO_LOCK_H(h)   (RADIO_Obj *)GUI_LOCK_H(h)
#endif

/*********************************************************************
*
*       Types
*
**********************************************************************
*/

typedef void tRADIO_SetValue(RADIO_Handle hObj, int v);

/*********************************************************************
*
*       Extern data
*
**********************************************************************
*/

extern RADIO_PROPS RADIO__DefaultProps;

extern const GUI_BITMAP             RADIO__abmRadio[2];
extern const GUI_BITMAP             RADIO__bmCheck;
extern       tRADIO_SetValue*       RADIO__pfHandleSetValue;

/*********************************************************************
*
*       public functions (internal)
*
**********************************************************************
*/

void RADIO__SetValue(RADIO_Handle hObj, int v);

#endif   /* GUI_WINSUPPORT */
#endif   /* RADIO_PRIVATE_H */

/************************* end of file ******************************/
