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
File        : GUIDEMO.h
Purpose     : Configuration file of GUIDemo
----------------------------------------------------------------------
*/

#ifndef GUIDEMO_H
#define GUIDEMO_H

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

/*********************************************************************
*
*       Internal used
*
*********************************************************************
*/
GUI_COLOR GUIDEMO_SetBkColor       (GUI_COLOR Color);
GUI_COLOR GUIDEMO_SetColor         (GUI_COLOR Color);
void      GUIDEMO_Wait             (void);
int       GUIDEMO_Delay            (int t);
void      GUIDEMO_ShowIntro        (const char*s, const char* sExplain);
void      GUIDEMO_ShowInfo         (const char* sExplain);
int       GUIDEMO_CheckCancel      (void);
void      GUIDEMO_NotifyStartNext  (void);
void      GUIDEMO_HideInfoWin      (void);
int       GUIDEMO_WaitKey          (void);
void      GUIDEMO_ShowControlWin   (int Show);

/*********************************************************************
*
*       Demo modules
*
*********************************************************************
*/
void GUIDEMO_Automotive(void);
void GUIDEMO_Bitmap(void);
void GUIDEMO_ColorBar(void);
void GUIDEMO_Cursor(void);
void GUIDEMO_Graph(void);
void GUIDEMO_IconView(void);
void GUIDEMO_ImageFlow(void);
void GUIDEMO_Intro(void);
void GUIDEMO_Listview(void);
void GUIDEMO_Speed(void);
void GUIDEMO_TransparentDialog(void);
void GUIDEMO_Treeview(void);
void GUIDEMO_VScreen(void);
void GUIDEMO_WashingMachine(void);
void GUIDEMO_ZoomAndRotate(void);

extern const GUI_BITMAP bmSeggerLogoBlue;

/*********************************************************************
*
*       Configuration of modules to be used
*
*********************************************************************
*/
#ifndef   SHOW_GUIDEMO_AUTOMOTIVE
  #define SHOW_GUIDEMO_AUTOMOTIVE        (1)
#endif
#ifndef   SHOW_GUIDEMO_BITMAP
  #define SHOW_GUIDEMO_BITMAP            (1)
#endif
#ifndef   SHOW_GUIDEMO_COLORBAR
  #define SHOW_GUIDEMO_COLORBAR          (1)
#endif
#ifndef   SHOW_GUIDEMO_CURSOR
  #define SHOW_GUIDEMO_CURSOR            (1)
#endif
#ifndef   SHOW_GUIDEMO_GRAPH
  #define SHOW_GUIDEMO_GRAPH             (1)
#endif
#ifndef   SHOW_GUIDEMO_ICONVIEW
  #define SHOW_GUIDEMO_ICONVIEW          (1)
#endif
#ifndef   SHOW_GUIDEMO_IMAGEFLOW
  #define SHOW_GUIDEMO_IMAGEFLOW         (1)
#endif
#ifndef   SHOW_GUIDEMO_LISTVIEW
  #define SHOW_GUIDEMO_LISTVIEW          (1)
#endif
#ifndef   SHOW_GUIDEMO_SPEED
  #define SHOW_GUIDEMO_SPEED             (1)
#endif
#ifndef   SHOW_GUIDEMO_TRANSPARENTDIALOG
  #define SHOW_GUIDEMO_TRANSPARENTDIALOG (1)
#endif
#ifndef   SHOW_GUIDEMO_TREEVIEW
  #define SHOW_GUIDEMO_TREEVIEW          (1)
#endif
#ifndef   SHOW_GUIDEMO_VSCREEN
  #define SHOW_GUIDEMO_VSCREEN           (1)
#endif
#ifndef   SHOW_GUIDEMO_WASHINGMACHINE
  #define SHOW_GUIDEMO_WASHINGMACHINE    (1)
#endif
#ifndef   SHOW_GUIDEMO_ZOOMANDROTATE
  #define SHOW_GUIDEMO_ZOOMANDROTATE     (1)
#endif

/*********************************************************************
*
*       Configuration macros
*
*********************************************************************
*/
#ifndef   GUIDEMO_USE_VNC
  #define GUIDEMO_USE_VNC         (0)
#endif
#ifndef   GUIDEMO_LISTVIEW_NOMOVE
  #define GUIDEMO_LISTVIEW_NOMOVE (0)
#endif
#ifndef   GUIDEMO_SHOW_SPRITES
  #define GUIDEMO_SHOW_SPRITES    (1)
#endif

#if defined(__cplusplus)
  }
#endif

#endif

/*************************** End of file ****************************/
