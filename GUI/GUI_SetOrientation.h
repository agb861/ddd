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
File        : GUI_SetOrientation.h
Purpose     : Private include file for GUI_SetOrientation_xxx
---------------------------END-OF-HEADER------------------------------
*/

#ifndef GUI_SETORIENTATION_H
#define GUI_SETORIENTATION_H

#include "GUI_Private.h"

/*********************************************************************
*
*       Types
*
**********************************************************************
*/
/*********************************************************************
*
*       DRIVER_CONTEXT
*/
typedef struct DRIVER_CONTEXT DRIVER_CONTEXT;

struct DRIVER_CONTEXT {
  U8 * pData;
  int BytesPerPixel;
  int BytesPerLine;
  int Orientation;
  int xSize, ySize;
  int vxSize, vySize;
  int PixelOffset;
  void (* pfLog2Phys)(DRIVER_CONTEXT * pContext, int x, int y, int * px_phys, int * py_phys);
  const GUI_ORIENTATION_API * pDrawingAPI;
};

/*********************************************************************
*
*       Private interface
*
**********************************************************************
*/
void GUI__Sort(int * p0, int * p1);

#endif /* GUI_SETORIENTATION_H */

/*************************** End of file ****************************/
