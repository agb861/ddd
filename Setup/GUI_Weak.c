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
File    : GUI_Weak.c
Purpose : Weak dummy functions to compile samples with KEIL MDK which
          do not use certain GUI functions.
--------  END-OF-HEADER  ---------------------------------------------
*/

/*********************************************************************
*
*       #include Section
*
**********************************************************************
*/

#include "GUI.h"

#if GUI_SUPPORT_TOUCH // Only needed when touch support is enabled

/*********************************************************************
*
*       Global functions
*
**********************************************************************
*/
/*********************************************************************
*
*       GUI_X_Config
*
*  Function description
*    This function is called by the GUI during GUI_Init().
*    It is supposed to assign memory and set the avg memory block size.
*
*/
__weak void GUI_X_Config(void) {
}
/*********************************************************************
*
*       GUI_TOUCH_X_ActivateX()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Switches on voltage on X-axis,
*   prepares measurement for Y-axis.
*   Voltage on Y-axis is switched off.
*/
__weak void GUI_TOUCH_X_ActivateX(void) {
}

/*********************************************************************
*
*       GUI_TOUCH_X_ActivateY()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Switches on voltage on Y-axis,
*   prepares measurement for X-axis.
*   Voltage on X-axis is switched off.
*/
__weak void GUI_TOUCH_X_ActivateY(void) {
}

/*********************************************************************
*
*       GUI_TOUCH_X_MeasureX()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Measures voltage of X-axis.
*/
__weak int  GUI_TOUCH_X_MeasureX(void) {
  return -1;
}

/*********************************************************************
*
*       GUI_TOUCH_X_MeasureY()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Measures voltage of Y-axis.
*/
__weak int  GUI_TOUCH_X_MeasureY(void) {
  return -1;
}

#endif // GUI_SUPPORT_TOUCH

/****** End of File *************************************************/
