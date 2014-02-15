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
File        : GUIDEMO_Graph.c
Purpose     : Several GUIDEMO routines
----------------------------------------------------------------------
*/

#include "GUI.h"
#include <math.h>
#include <stdlib.h>
#include "GUIDEMO.h"

#if (SHOW_GUIDEMO_GRAPH && GUI_SUPPORT_MEMDEV)

/*********************************************************************
*
*       Structure containing information for drawing routine
*
**********************************************************************
*/

typedef struct {
  I16 * aY;
} PARAM;

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/
#define DEG2RAD (3.1415926f / 180)

#define COLOR_GRAPH0 GUI_GREEN
#define COLOR_GRAPH1 GUI_YELLOW

/*********************************************************************
*
*       static data
*
**********************************************************************
*/

static int _YSize;

/*********************************************************************
*
*       Draws the graph
*
**********************************************************************
*/

static void _Draw(void * p) {
  int i;
  PARAM * pParam = (PARAM *)p;
  int lcd_xsize;
  int lcd_ysize;
  lcd_xsize = LCD_GetXSize();
  lcd_ysize = LCD_GetYSize();  
  GUI_SetBkColor(GUI_BLACK);
  GUI_SetColor(GUI_DARKGRAY);
  GUI_ClearRect(19, (lcd_ysize - 20) - _YSize, (lcd_xsize - 2), (lcd_ysize - 21));
  for (i = 0; i < (_YSize / 2); i += 20) {
    GUI_DrawHLine((lcd_ysize - 20) - (_YSize / 2) + i, 19, (lcd_xsize - 2));
    if (i) {
      GUI_DrawHLine((lcd_ysize - 20) - (_YSize / 2) - i, 19, (lcd_xsize - 2));
    }
  }
  for (i = 40; i < (lcd_xsize - 20); i += 40) {
    GUI_DrawVLine(18 + i, (lcd_ysize - 20) - _YSize, (lcd_ysize - 21));
  }
  GUIDEMO_SetColor(COLOR_GRAPH0);
  GUI_DrawGraph(pParam->aY, (lcd_xsize - 20), 19, (lcd_ysize - 20) - _YSize);
}

static void _Draw2(void * p) {
  PARAM * pParam = (PARAM *)p;
  _Draw(p);
  GUI_SetColor(COLOR_GRAPH1);
  GUI_DrawGraph(pParam->aY+15, (LCD_GetXSize() - 20), 19, (LCD_GetYSize() - 20) - _YSize);
}

/*********************************************************************
*
*       Labels the x & y-axis
*
**********************************************************************
*/

static void _Label(void) {
  int x, y;
  GUI_SetPenSize(1);
  GUI_ClearRect(0, (LCD_GetYSize() - 21) - _YSize, (LCD_GetXSize() - 1), (LCD_GetYSize() - 1));
  GUI_DrawRect(18, (LCD_GetYSize() - 21) - _YSize, (LCD_GetXSize() - 1), (LCD_GetYSize() - 20));
  GUI_SetFont(&GUI_Font6x8);
  for (x = 0; x < (LCD_GetXSize() - 20); x += 40) {
    int xPos = x + 18;
    GUI_DrawVLine(xPos, (LCD_GetYSize() - 20), (LCD_GetYSize() - 14));
    GUI_DispDecAt(x / 40, xPos - 2, (LCD_GetYSize() - 9), 1);
  }
  for (y = 0; y < _YSize / 2; y += 20) {
    int yPos = (LCD_GetYSize() - 20) - _YSize / 2 + y;
    GUI_DrawHLine(yPos, 13, 18);
    if (y) {
      GUI_GotoXY(1, yPos - 4);
      GUI_DispSDec(-y / 20, 2);
      yPos = (LCD_GetYSize() - 20) - _YSize / 2 - y;
      GUI_DrawHLine(yPos, 13, 18);
      GUI_GotoXY(1, yPos - 4);
      GUI_DispSDec(y / 20, 2);
    } else {
      GUI_DispCharAt('0', 7, yPos - 4);
    }
  }
}

/*********************************************************************
*
*       Draws random data
*
**********************************************************************
*/

static void _GetRandomData(I16 * paY, int Time, int n) {
  int aDiff, i;
  if (Time > 5000)
    Time -= 5000;
  if (Time > 2500)
    Time = 5000 - Time;
  Time /= 200;
  aDiff = Time * Time + 1;
  for (i = 0; i < n; i++) {
    if (!i) {
      paY[i] = rand() % _YSize;
    } else {
      int Rnd0, Rnd1, yD;
      I16 yNew;
      Rnd0 = rand();
      yD = aDiff - (Rnd0 % aDiff);
      Rnd1 = rand();
      if (Rnd1 > Rnd0) {
        yNew = paY[i-1] + yD;
      } else {
        yNew = paY[i-1] - yD;
      }
      if (yNew > _YSize) {
        yNew -= yD;
      } else { if (yNew < 0)
        yNew += yD;
      }
      paY[i] = yNew;
    }
  }
}

static void _ShowText(const char * sText) {
  int lcd_xsize;
  lcd_xsize = LCD_GetXSize();
  GUIDEMO_SetColor(GUI_WHITE);
  GUIDEMO_SetBkColor(GUI_RED);
  GUI_ClearRect(0, 0, lcd_xsize, 60);
  GUI_SetFont(&GUI_FontComic18B_ASCII);
  GUI_DispStringAt(sText, 10, 20);
}

static void _LabelMS(void) {
  GUI_SetFont(&GUI_Font6x8);
  GUI_DispStringAt("msec/graph:", 10, 50);
}

static void _DisplayTime(int tDiff) {
  GUI_GotoXY(80, 50);
  GUIDEMO_SetColor(GUI_WHITE);
  GUIDEMO_SetBkColor(GUI_RED);
  GUI_DispDecSpace(tDiff, 3);
}

static void _DemoRandomGraph(void) {
  PARAM Param;
  int tDiff, t0;
  int Cnt = 0;
  GUI_HMEM hMem;
  GUI_RECT Rect;
  int lcd_xsize;
  int lcd_ysize;
  lcd_xsize = LCD_GetXSize();
  lcd_ysize = LCD_GetYSize();
  Rect.x0 = 19;
  Rect.y0 = (lcd_ysize - 20) - _YSize;
  Rect.x1 = lcd_xsize - 2;
  Rect.y1 = lcd_ysize - 21;
  hMem = GUI_ALLOC_AllocZero((LCD_GetXSize() - 20) * sizeof(I16));
  _ShowText("Random graph");
  GUI_LOCK();
  Param.aY = (I16*)GUI_ALLOC_h2p(hMem);
  GUI_UNLOCK();    /* Note: unlocking is permitted only if no further allocation is done so hMem stays valid */
  _LabelMS();
  t0 = GUI_GetTime();
  while(((tDiff = (GUI_GetTime() - t0)) < 10000) && !GUIDEMO_CheckCancel()) {
    U32 t1, tDiff2;
    _GetRandomData(Param.aY, tDiff, (lcd_xsize - 20));
    t1 = GUI_GetTime();
    GUI_MEMDEV_Draw(&Rect, _Draw, &Param, 0, GUI_MEMDEV_NOTRANS);
    tDiff2 = GUI_GetTime() - t1;
    if (tDiff2 < 100) {
      GUI_Delay(100 - tDiff2);
    }
    if(!((++Cnt)%10)) {
      _DisplayTime(tDiff2);
    }
  }
  GUI_ALLOC_Free(hMem);
}

/*********************************************************************
*
*       Draws a sine wave
*
**********************************************************************
*/

static void _GetSineData(I16 * paY, int n) {
  int i;
  I32 s;
  for (i = 0; i < n; i++) {
    s = GUI__SinHQ(i * 4 * 1000);
    paY[i] = (I16)(((s * _YSize / 2) >> 16) + _YSize / 2);
  }
}

static void _DemoSineWave(void) {
  PARAM Param;
  I16 * pStart;
  int t0, Cnt = 0;
  GUI_HMEM hMem;
  GUI_RECT Rect;
  Rect.x0 = 19;
  Rect.y0 = (LCD_GetYSize() - 20) - _YSize;
  Rect.x1 = LCD_GetXSize() - 2;
  Rect.y1 = LCD_GetYSize() - 21;
  hMem = GUI_ALLOC_AllocZero((LCD_GetXSize() + 90) * sizeof(I16));
  _ShowText("Sine wave");
  GUI_LOCK();
  pStart = (I16*)GUI_ALLOC_h2p(hMem);
  GUI_UNLOCK();    /* Note: unlocking is permitted only if no further allocation is done so hMem stays valid */
  _GetSineData(pStart, LCD_GetXSize() + 90);
  _LabelMS();
  t0 = GUI_GetTime();
  while(((GUI_GetTime() - t0) < 10000) && !GUIDEMO_CheckCancel()) {
    U32 t1, tDiff2;
    if (Cnt % 90) {
      Param.aY++;
    } else {
      Param.aY = pStart;
    }
    t1 = GUI_GetTime();
    GUI_MEMDEV_Draw(&Rect, _Draw2, &Param, 0, GUI_MEMDEV_NOTRANS);
    tDiff2 = GUI_GetTime() - t1;
    if (tDiff2 < 100) {
      GUI_Delay(100 - tDiff2);
    }
    if(!((++Cnt) % 10)) {
      _DisplayTime(tDiff2);
    }
  }
  GUI_ALLOC_Free(hMem);
}

/*********************************************************************
*
*       GUIDEMO_Graph
*
**********************************************************************
*/

void GUIDEMO_Graph(void) {
  _YSize = (LCD_GetYSize() - 100);
  GUIDEMO_ShowIntro("Drawing a graph",
                    "\nOptimized drawing routine"
                    "\nfor drawing graph data");
  GUI_Clear();
  _Label();
  _DemoRandomGraph();
  GUIDEMO_NotifyStartNext();
  _DemoSineWave();
}

#else

void GUIDEMO_Graph(void) {}

#endif
