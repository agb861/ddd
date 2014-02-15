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
File        : OS_IP_SendMail.c
Purpose     : SMTP client
---------------------------END-OF-HEADER------------------------------
*/

#include "RTOS.h"
#include "BSP.h"
#include "IP.h"
#include "IP_SMTPC.h"

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_STACKPTR int _Stack[768/sizeof(int)];
static OS_TASK         _TCB;
static OS_STACKPTR int _StackMailer[0x600];
static OS_TASK         _TCBMailer;

/*********************************************************************
*
*       _Connect
*
*  Function description
*    Creates a socket and opens a TCP connection to the mail host.
*/
static SMTPC_SOCKET _Connect(char * SrvAddr) {
  long IP;
  long Sock;
  struct hostent * pHostEntry;
  struct sockaddr_in sin;
  int r;
  //
  // Convert host into mail host
  //
  pHostEntry = gethostbyname(SrvAddr);
  if (pHostEntry == NULL) {
    SMTPC_LOG(("gethostbyname failed: %s\r\n", SrvAddr));
    return NULL;
  }
  IP = *(unsigned*)(*pHostEntry->h_addr_list);
  //
  // Create socket and connect to mail server
  //
  Sock = socket(AF_INET, SOCK_STREAM, 0);
  if(Sock  == -1) {
    SMTPC_LOG(("Could not create socket!" ));
    return NULL;
  }
  IP_MEMSET(&sin, 0, sizeof(sin));
  sin.sin_family = AF_INET;
  sin.sin_port = htons(SMTPC_SERVER_PORT);
  sin.sin_addr.s_addr = IP;
  r = connect(Sock, (struct sockaddr*)&sin, sizeof(sin));
  if(r == SOCKET_ERROR) {
    SMTPC_LOG(("\nSocket error :"));
    return NULL;
  }
  SMTPC_LOG(("APP: Connected.\r\n"));
  return (SMTPC_SOCKET)Sock;
}

/*********************************************************************
*
*       _Disconnect
*
*  Function description
*    Closes a socket.
*/
static void _Disconnect(SMTPC_SOCKET Socket) {
  closesocket((long)Socket);
}

/*********************************************************************
*
*       _Send
*
*  Function description
*    Sends data via socket interface.
*/
static int _Send(const char * buf, int len, void * pConnectionInfo) {
  return send((long)pConnectionInfo, buf, len, 0);
}

/*********************************************************************
*
*       _Recv
*
*  Function description
*    Receives data via socket interface.
*/
static int _Recv(char * buf, int len, void * pConnectionInfo) {
  return recv((long)pConnectionInfo, buf, len, 0);
}

static const IP_SMTPC_API _IP_Api = {
  _Connect,
  _Disconnect,
  _Send,
  _Recv
};

/*********************************************************************
*
*       _GetTimeDate
*/
static U32 _GetTimeDate(void) {
  U32 r;
  U16 Sec, Min, Hour;
  U16 Day, Month, Year;

  Sec   = 0;        // 0 based.  Valid range: 0..59
  Min   = 0;        // 0 based.  Valid range: 0..59
  Hour  = 9;        // 0 based.  Valid range: 0..23
  Day   = 9;        // 1 based.    Means that 1 is 1. Valid range is 1..31 (depending on month)
  Month = 1;        // 1 based.    Means that January is 1. Valid range is 1..12.
  Year  = 29;       // 1980 based. Means that 2008 would be 28.
  r   = Sec / 2 + (Min << 5) + (Hour  << 11);
  r  |= (U32)(Day + (Month << 5) + (Year  << 9)) << 16;
  return r;
}

static const IP_SMTPC_APPLICATION _Application = {
  _GetTimeDate,   // Time and Date routine, adapt _GetTimeDate()
  NULL,           // Pointer to status callback function. Can be NULL.
  "sample.com"    // Your domain. According to RFC 821 the maximum total length of a domain name or number is 64 characters.
};


/*********************************************************************
*
*       Mailer
*/
static void _Mailer(void) {
  IP_SMTPC_MAIL_ADDR MailAddr[4];
  IP_SMTPC_MTA Mta;
  IP_SMTPC_MESSAGE Message;

  IP_MEMSET(&MailAddr, 0, sizeof(MailAddr));
  //
  // Sender
  //
  MailAddr[0].sName = 0; // for example, "Your name";
  MailAddr[0].sAddr = 0; // for example, "user@foobar.com";
  MailAddr[0].Type  = SMTPC_REC_TYPE_FROM;
  //
  // Recipient(s)
  //
  MailAddr[1].sName = 0; // "Recipient";
  MailAddr[1].sAddr = 0; // "recipient@foobar.com";
  MailAddr[1].Type  = SMTPC_REC_TYPE_TO;
  MailAddr[2].sName = 0; // "CC Recp 1";
  MailAddr[2].sAddr = 0; // "cc1@foobar.com";
  MailAddr[2].Type  = SMTPC_REC_TYPE_CC;
  MailAddr[3].sName = 0; // "BCC Recp 1"
  MailAddr[3].sAddr = 0; // "bcc1@foobar.com";;
  MailAddr[3].Type  = SMTPC_REC_TYPE_BCC;
  //
  // Message
  //
  Message.sSubject = "SMTP message sent via embOS/IP SMTP client";
  Message.sBody    = "embOS/IP SMTP client - www.segger.com";
  //
  // Fill mail transfer agent structure
  //
  Mta.sServer = 0; // for example, "mail.foobar.com";
  Mta.sUser   = 0; // for example, "user@foobar.com";
  Mta.sPass   = 0; // for example, "password";
  //
  // Wait until link is up. This can take 2-3 seconds if PHY has been reset.
  //
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(100);
  }
  //
  // Check if sample is configured!
  //
  if(Mta.sServer == 0) {
    SMTPC_WARN(("Configuration not valid. Enter valid SMTP server, sender and recipient(s).\r\n"));
    while(1);
  }
  IP_SMTPC_Send(&_IP_Api, &MailAddr[0], 4, &Message, &Mta, &_Application);
  while(1);
}

/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  IP_Init();
  OS_SetPriority(OS_GetTaskID(), 255);                                 // This task has highest prio for real-time application
  OS_CREATETASK(&_TCB,       "IP_Task", IP_Task, 150, _Stack);         // Start the IP task
  OS_CREATETASK(&_TCBMailer, "Mailer",  _Mailer, 100, _StackMailer);   // Start the mailer
  while (1) {
    BSP_ToggleLED(1);
    if (IP_GetCurrentLinkSpeed() == 0) {
      OS_Delay(50);
    } else {
      OS_Delay (200);
    }
  }
}

/*************************** End of file ****************************/
