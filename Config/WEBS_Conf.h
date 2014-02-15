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
File    : WEBS_Conf.h
Purpose : Webserver add-on.
---------------------------END-OF-HEADER------------------------------
*/

#ifndef _WEBS_CONF_H_
#define _WEBS_CONF_H_ 1

#include "IP.h"

//
// Logging
//
#ifdef DEBUG
  #define WEBS_WARN(p)              IP_Logf_Application p
  #define WEBS_LOG(p)               IP_Logf_Application p
#else
  #define WEBS_WARN(p)
  #define WEBS_LOG(p)
#endif

#ifndef    WEBS_IN_BUFFER_SIZE
  #define  WEBS_IN_BUFFER_SIZE      256      // Buffer size should be at least 256 bytes
#endif

#ifndef    WEBS_OUT_BUFFER_SIZE
  #define  WEBS_OUT_BUFFER_SIZE     512      // Buffer size can be decreased. To small buffers will result in a lack of performance and decreases the quality of service.
#endif

#ifndef    WEBS_PARA_BUFFER_SIZE
  #define  WEBS_PARA_BUFFER_SIZE    256
#endif

#define WEBS_MEMCPY IP_MEMCPY

//
// CGI start and end strings
//
#define WEBS_CGI_START_STRING "<!--#exec cgi=\""
#define WEBS_CGI_END_STRING   "\"-->"

#endif     // Avoid multiple inclusion




























