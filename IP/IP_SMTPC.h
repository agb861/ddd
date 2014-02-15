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
File        : IP_SMTPC.h
Purpose     : Publics for the SMTP client
---------------------------END-OF-HEADER------------------------------

Attention : Do not modify this file !
*/

#ifndef  IP_SMTPCLIENT_H
#define  IP_SMTPCLIENT_H

#include "SMTPC_Conf.h"
#include "Global.h"

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif

/*********************************************************************
*
*       defines
*
**********************************************************************
*/

#ifndef   SMTPC_OUT_BUFFER_SIZE
  #define SMTPC_OUT_BUFFER_SIZE   256
#endif

#define SMTPC_REC_TYPE_TO         1
#define SMTPC_REC_TYPE_CC         2
#define SMTPC_REC_TYPE_BCC        3
#define SMTPC_REC_TYPE_FROM       4

/*********************************************************************
*
*       Types
*
**********************************************************************
*/
typedef struct {
  const char * sServer;
  const char * sUser;
  const char * sPass;
} IP_SMTPC_MTA;

typedef struct {
  const char * sName;
  const char * sAddr;
  int Type;                       // SMTPC_REC_TYPE_TO, SMTPC_REC_TYPE_CC, SMTPC_REC_TYPE_BCC
} IP_SMTPC_MAIL_ADDR;

typedef struct {
  const char      * sSubject;
  const char      * sBody;
  int               MessageSize;
} IP_SMTPC_MESSAGE;

typedef struct {
  U32 (*pfGetTimeDate) (void);
  int (*pfCallback)(int Stat, void *p);
} IP_SMTPC_APPLICATION;


typedef void * SMTPC_SOCKET;

typedef struct {
  SMTPC_SOCKET (*pfConnect)    (char * SrvAddr);
  void         (*pfDisconnect) (SMTPC_SOCKET Socket);
  int          (*pfSend)       (const char * pData, int Len, SMTPC_SOCKET Socket);
  int          (*pfReceive)    (char * pData, int Len, SMTPC_SOCKET Socket);
} IP_SMTPC_API;




/*********************************************************************
*
*       Functions
*
**********************************************************************
*/
int IP_SMTPC_Send(const IP_SMTPC_API * pIP_API, IP_SMTPC_MAIL_ADDR * paMailAddr, int NumMailAddr, IP_SMTPC_MESSAGE * pMessage, const IP_SMTPC_MTA * pMTA, const IP_SMTPC_APPLICATION * pApplication);

#if defined(__cplusplus)
  }
#endif


#endif   /* Avoid multiple inclusion */

/*************************** End of file ****************************/




