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

--------  END-OF-HEADER  ---------------------------------------------
*/

#ifndef SYSCONF_H                       /* Avoid multiple inclusion */
#define SYSCONF_H

#ifndef   GUI_SUPPORT_CURSOR
  #define GUI_SUPPORT_CURSOR  (1)
#endif

#ifndef   GUI_SUPPORT_TOUCH
  #define GUI_SUPPORT_TOUCH   (1)
#endif

/*********************************************************************
*
*       Configuration of included middleware components
*/
#ifndef   INCLUDE_USB
  #define INCLUDE_USB (0)
#endif

/*********************************************************************
*
*       Configuration of demo applications included/excluded in SEGGERDEMO
*/
#ifndef   INCLUDE_TREEVIEWDEMO
  #define INCLUDE_TREEVIEWDEMO       (0)
#endif

#ifndef   INCLUDE_INCONVIEWDEMO
  #define INCLUDE_INCONVIEWDEMO      (0)
#endif

#endif                                  /* Avoid multiple inclusion */

/*****  EOF  ********************************************************/
