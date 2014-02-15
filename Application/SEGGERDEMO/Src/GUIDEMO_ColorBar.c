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
File        : GUIDEMO_ColorBar.c
Purpose     : Draws color bars
----------------------------------------------------------------------
*/

#include "GUI.h"
#include "GUIDEMO.h"

/*********************************************************************
*
*       GUIDEMO_ShowColorBar
*
**********************************************************************
*/

#if (SHOW_GUIDEMO_COLORBAR)

void GUIDEMO_ColorBar(void) {
  int nBars = 13;
  int NumColors = LCD_GetDevCap(LCD_DEVCAP_NUMCOLORS);
  int XSize = LCD_GetXSize();
  int i, yStep, y0, x0;
  int lcd_ysize;
  int BitsPerPixel;
  
  lcd_ysize = LCD_GetYSize();
  y0 = 70;
  x0 = 60;
  GUIDEMO_ShowIntro("Color bar",
                    "emWin features "
                    "\nan integrated color"
                    "\nmanagement"
                    "\nwill always find the best available color"
                    "\nfor any logical color");
	XSize -= x0;
  yStep = (lcd_ysize - y0 - 60) / nBars;
  GUI_SetColor(GUI_WHITE);
  GUI_SetBkColor(GUI_BLACK); 
  GUI_Clear();
	GUI_SetFont(&GUI_Font8x16);
	GUI_DispString("Color bars\n");
  GUI_SetFont(&GUI_Font8_ASCII);
  #ifdef LCD_CONTROLLER
    GUI_DispString("\nLCD_CONTROLLER: ");
    GUI_DispDecMin(LCD_CONTROLLER);
    GUI_DispString("\n");
  #endif
  BitsPerPixel = LCD_GetBitsPerPixel();
  GUI_DispDecMin(BitsPerPixel);
  GUI_DispString(" bpp");
  #ifdef LCD_BUSWIDTH
    GUI_DispString(", ");
    GUI_DispDecMin(LCD_BUSWIDTH);
    GUI_DispString(" bit bus");
  #endif
  GUI_DispString(", ");
  GUI_DispDecMin(NumColors);
  GUI_DispString(" colors\n");
  GUI_SetFont(&GUI_Font8x8);
  GUI_SetColor(GUI_WHITE);
  GUI_DispStringAt("Red",     0, y0 +      yStep);
  GUI_DispStringAt("Green",   0, y0 + 3  * yStep);
  GUI_DispStringAt("Blue",    0, y0 + 5  * yStep);
  GUI_DispStringAt("Grey",    0, y0 + 6  * yStep);
  GUI_DispStringAt("Yellow",  0, y0 + 8  * yStep);
  GUI_DispStringAt("Cyan",    0, y0 + 10 * yStep);
  GUI_DispStringAt("Magenta", 0, y0 + 12 * yStep);
  for (i = 0; (i < XSize) && !GUIDEMO_CheckCancel(); i++) {
    U16 cs = (255 * (U32)i) / XSize;
    U16 x = x0 + i;;
/* Red */
    GUI_SetColor(cs);
    GUI_DrawVLine(x, y0, y0 + yStep - 1);
    GUI_SetColor(0x0000ff + (255 - cs) * 0x10100L);
    GUI_DrawVLine(x, y0 + yStep, y0 + 2 * yStep - 1);
/* Green */
    GUI_SetColor(cs<<8);
    GUI_DrawVLine(x, y0 + 2 * yStep, y0 + 3 * yStep - 1);
    GUI_SetColor(0x00ff00 + (255 - cs) * 0x10001L);
    GUI_DrawVLine(x, y0 + 3 * yStep, y0 + 4 * yStep - 1);
/* Blue */
    GUI_SetColor(cs * 0x10000L);
    GUI_DrawVLine(x, y0 + 4 * yStep, y0 + 5 * yStep - 1);
    GUI_SetColor(0xff0000 + (255 - cs) * 0x00101L);
    GUI_DrawVLine(x, y0 + 5 * yStep, y0 + 6 * yStep - 1);
/* Gray */
    GUI_SetColor(cs * 0x10101L);
    GUI_DrawVLine(x, y0 + 6 * yStep, y0 + 7 * yStep - 1);
/* Yellow */
    GUI_SetColor(cs * 0x00101L);
    GUI_DrawVLine(x, y0 + 7 * yStep, y0 + 8 * yStep - 1);
    GUI_SetColor(0x00ffff + (255 - cs) * 0x10000L);
    GUI_DrawVLine(x, y0 + 8 * yStep, y0 + 9 * yStep - 1);
/* Cyan */
    GUI_SetColor(cs * 0x10100L);
    GUI_DrawVLine(x, y0 + 9 * yStep, y0 + 10 * yStep - 1);
    GUI_SetColor(0xffff00 + (255 - cs) * 0x00001L);
    GUI_DrawVLine(x, y0 + 10 * yStep, y0 + 11 * yStep - 1);
/* Magenta */
    GUI_SetColor(cs * 0x10001L);
    GUI_DrawVLine(x, y0 + 11 * yStep, y0 + 12 * yStep - 1);
    GUI_SetColor(0xff00ff + (255 - cs) * 0x00100L);
    GUI_DrawVLine(x, y0 + 12 * yStep, y0 + 13 * yStep - 1);
  }
  GUIDEMO_Wait();
}

#else

void GUIDEMO_ColorBar(void) {}

#endif

