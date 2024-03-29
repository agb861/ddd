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
File        : GUIDEMO_Cursor.c
Purpose     : shows Cursor-API
----------------------------------------------------------------------
*/

#include "GUI.h"
#include "GUIDEMO.h"

#if (SHOW_GUIDEMO_CURSOR && GUI_SUPPORT_CURSOR && GUI_SUPPORT_TOUCH)

/*********************************************************************
*
*       defines
*
**********************************************************************
*/

#define countof(Obj) (sizeof(Obj)/sizeof(Obj[0]))

#define NUM_CURSORS   3
#define XMAX         28

/*********************************************************************
*
*       types
*
**********************************************************************
*/

typedef struct {
  const GUI_CURSOR* pCursor;
  char              Size;
} CURSOR_INFO;

typedef struct {
  const CURSOR_INFO aCursor[NUM_CURSORS];
  const char*       pType;
} CURSORTYPE_INFO;

/*********************************************************************
*
*       static data
*
**********************************************************************
*/

static const CURSORTYPE_INFO _CursorArrow = {
  &GUI_CursorArrowS, 'S',
  &GUI_CursorArrowM, 'M',
  #if (NUM_CURSORS == 3)
    &GUI_CursorArrowL, 'L',
    "arrow cursors"
  #else
    "arrow\ncursors"
  #endif
};


static const CURSORTYPE_INFO _CursorArrowI = {
  &GUI_CursorArrowSI, 'S',
  &GUI_CursorArrowMI, 'M',
  #if (NUM_CURSORS == 3)
    &GUI_CursorArrowLI, 'L',
    "inverted arrow cursors"
  #else
    "inverted\narrow cursors"
  #endif
};

static const CURSORTYPE_INFO _CursorCross = {
  &GUI_CursorCrossS, 'S',
  &GUI_CursorCrossM, 'M',
  #if (NUM_CURSORS == 3)
    &GUI_CursorCrossL, 'L',
    "cross cursors"
  #else
    "cross\ncursors"
  #endif
};

static const CURSORTYPE_INFO _CursorCrossI = {
  &GUI_CursorCrossSI, 'S',
  &GUI_CursorCrossMI, 'M',
  #if (NUM_CURSORS == 3)
    &GUI_CursorCrossLI, 'L',
    "inverted cross cursors"
  #else
    "inverted\ncross cursors"
  #endif
};

/*********************************************************************
*
*       static code
*
**********************************************************************
*/
/*********************************************************************
*
*       _ShowCursorType
*/
static void _ShowCursorType(const CURSORTYPE_INFO* pCursorType, int x0, int y0) {
  const GUI_CURSOR* pCursor;
  char Char;
  int i, x, y;
  int yMax = 0;
  int yHot = 0;
  /* Calculate height and width of biggest cursor */
  for (i = 0; i < NUM_CURSORS; i++) {
    pCursor = pCursorType->aCursor[i].pCursor;
    if (pCursor->pBitmap->YSize > yMax) {
      yMax = pCursor->pBitmap->YSize;
      yHot = pCursor->yHot;
    }
  }
  GUI_SetFont(&GUI_FontComic18B_ASCII);
  #if (NUM_CURSORS != 3)
    GUI_SetLBorder(x0);
  #endif
  GUI_DispStringAt(pCursorType->pType, x0, y0);
  y0 += GUI_GetFontDistY() + 1;
  GUI_SetFont(&GUI_Font13B_ASCII);
  for (i = 0; i < NUM_CURSORS; i++) {
    pCursor = pCursorType->aCursor[i].pCursor;
    Char    = pCursorType->aCursor[i].Size;
    y = y0 + yHot - pCursor->yHot;
    x = ((pCursor->pBitmap->XSize - GUI_GetCharDistX(Char)) >> 1);
    GUI_DrawBitmap(pCursor->pBitmap, x0 + XMAX * i + 5,     y);
    GUI_DispCharAt(Char,             x0 + XMAX * i + 5 + x, y0 + yMax + 2);
  }
}

/*********************************************************************
*
*       _DispCursor
*/
static void _DispCursor(void) {
  int y0, dx, dy;
  GUI_CURSOR_Hide();
  GUI_SetTextMode(GUI_TM_TRANS);
  GUI_SetFont(&GUI_FontComic24B_ASCII);
  GUI_DispStringAt("Available\n  cursors:", 18, 12);
  /* Display the cursors */
  y0 = 68;
  dx = (int)(LCD_GetXSize() / 2.5);
  dy = 75;
  _ShowCursorType(&_CursorArrow,    0, y0);
  _ShowCursorType(&_CursorCross,    0, y0 + dy);
  _ShowCursorType(&_CursorArrowI,  dx, y0);
  _ShowCursorType(&_CursorCrossI,  dx, y0 + dy);
}

/*********************************************************************
*
*       public code
*
**********************************************************************
*/
/*********************************************************************
*
*       GUIDEMO_Cursor
*/
void GUIDEMO_Cursor(void) {
  GUIDEMO_ShowIntro("Cursor",
                    "\nemWin supports"
                    "\nsoftware cursor");
  GUIDEMO_SetBkColor(GUI_BLUE);
  GUI_Clear();
  _DispCursor();
  GUIDEMO_Delay(/*1500*/4000);
  GUIDEMO_NotifyStartNext();
  GUI_CURSOR_Show();
  GUI_CURSOR_SetPosition(0,0);
  GUI_CURSOR_Select(&GUI_CursorArrowM);
}

#else

void GUIDEMO_Cursor(void) {}

#endif
