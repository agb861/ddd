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
File        : GUI_VNC.h
Purpose     : Publics for the VNC server
---------------------------END-OF-HEADER------------------------------

Attention : Do not modify this file ! If you do, you will not
            be able do update to a later GUI version !

*/

#ifndef  GUI_VNC_H
#define  GUI_VNC_H

#include "GUI_Private.h"

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif


/*********************************************************************
*
*       Defines
*
**********************************************************************
*/
#define GUI_VNC_NO_ERROR            0
#define GUI_VNC_ERROR_MISC          1
#define GUI_VNC_ERROR_WRONGFORMAT   2

#define GUI_DES_ENCRYPT 0
#define GUI_DES_DECRYPT 1

/*********************************************************************
*
*       Types
*
**********************************************************************
*/
typedef int (*GUI_tSend)   (const U8 * pData, int len, void* pConnectInfo);
typedef int (*GUI_tReceive)(      U8 * pData, int len, void* pConnectInfo);

typedef struct GUI_VNC_CONTEXT {
  GUI_DEVICE * pDevice;
  struct GUI_VNC_CONTEXT * pNext;
  int LayerIndex;
  int BytesPerPixel;
  int BitsPerPixel;  // Note, that from within the VNC server the function LCD_GetBitsBerPixel() can not be used because the VNC server runs in a separate thread and the device chain can change during the function call
  //
  // Connection related data
  //
  GUI_tSend    pfSend;
  GUI_tReceive pfReceive;
  void       * pConnectInfo;
  U16          ServerIndex;
  //
  // Display related info
  //
  int x0Dirty, y0Dirty, x1Dirty, y1Dirty;
  int XSize, YSize;
  int xOrg, yOrg, xOrgNew, yOrgNew;
  int OrgLock;
  //
  // Status
  //
  char ClientSupportsHextile;
  char IsBigEndian;
} GUI_VNC_CONTEXT;

typedef struct {
  void (* pfGetChallenge)(U8 * pChallenge);
  void (* pfGetResponse )(U8 * pResponse );
} GUI_VNC_AUTHENTICATION;

/*********************************************************************
*
*       Private Functions
*
**********************************************************************
*/
void GUI_VNC_SetDESKey(U8 * pKey, int Mode);
void GUI_VNC_DoDES    (U8 * pInblock, U8 * pOutblock);

/*********************************************************************
*
*       Public Functions
*
**********************************************************************
*/
void GUI_VNC_AttachToLayer      (GUI_VNC_CONTEXT * pContext, int LayerIndex);
void GUI_VNC_EnableKeyboardInput(int OnOff);
int  GUI_VNC_GetNumConnections  (void);
int  GUI_VNC_Process            (GUI_VNC_CONTEXT * pContext, GUI_tSend pfSend, GUI_tReceive pfReceive, void * pConnectInfo);
void GUI_VNC_RingBell           (void);
void GUI_VNC_SetAuthentication  (GUI_VNC_AUTHENTICATION * pAuthentication);
void GUI_VNC_SetPassword        (U8 * sPassword);
void GUI_VNC_SetProgName        (const char * sProgName);
void GUI_VNC_SetSize            (unsigned xSize, unsigned ySize);

/****  External routine to link the server to the system ... USER defined ! ****/
int  GUI_VNC_X_StartServer(int LayerIndex, int ServerIndex);
void GUI_VNC_X_getpeername(U32 * Addr);

#if defined(__cplusplus)
  }
#endif

#endif   /* Avoid multiple inclusion */

/*************************** End of file ****************************/
