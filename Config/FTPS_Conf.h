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
File    : FTPS_Conf.h
Purpose : FTP add-on configuration file.
---------------------------END-OF-HEADER------------------------------
*/

#ifndef _FTPS_CONF_H_
#define _FTPS_CONF_H_ 1

#ifdef DEBUG
  #define FTPS_WARN(p)
  #define FTPS_LOG(p)
#else
  #define FTPS_WARN(p)
  #define FTPS_LOG(p)
#endif

#define FTPS_AUTH_BUFFER_SIZE   32
#define FTPS_BUFFER_SIZE       512
#define FTPS_DATA_BUFFER_SIZE  512
#define FTPS_MAX_PATH          128
#define FTPS_MAX_PATH_DIR       64


#ifndef  FTPS_SIGN_ON_MSG
  #define FTPS_SIGN_ON_MSG "Welcome to embOS/IP FTP server"
#endif

#endif     // Avoid multiple inclusion




























