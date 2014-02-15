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
File    : OS_IP_Webserver.c
Purpose : Sample program for embOS & TCP/IP
--------- END-OF-HEADER --------------------------------------------*/


#include <stdio.h>
#include <stdlib.h>
#include "TaskPrio.h"
#include "RTOS.h"
#include "BSP.h"
#include "IP.h"
#include "IP_Webserver.h"

/*********************************************************************
*
*       Local defines, configurable
*
**********************************************************************
*/
#define MAX_CONNECTIONS          2
#define MAX_CONNECTION_INFO      10

/*********************************************************************
*
*       Static const
*
**********************************************************************
*/

WEBS_ACCESS_CONTROL _aAccessControl[] = {
  { "/conf/", "Login for configuration", "user:pass" },
  { "/", NULL, NULL },
  0
};

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/

//
// Webserver TCBs and stacks
//
static OS_TASK          _aWebTasks[MAX_CONNECTIONS];
static OS_STACKPTR int  _aWebStacks[MAX_CONNECTIONS][4096/sizeof(int)];

static const IP_FS_API * _pFS_API;     // File system info

//
// Variables used for CGI samples
//
static int  _ConnectCnt;
static U32  _Percentage = 50;
static char _aLEDState[8];
static char _aLEDStateNew[8];
static char _acColor[8] = "#FFFFFF\0";
static char _acFirstName[12];
static char _acLastName[12];

//
// Socket function mappings
//
static int _closesocket(long pConnectionInfo) {
  return closesocket((long)pConnectionInfo);
}

static int _Send(const unsigned char * buf, int len, void* pConnectionInfo) {
  return send((long)pConnectionInfo, (const char *)buf, len, 0);
}

static int _Recv(unsigned char * buf, int len, void* pConnectionInfo) {
  return recv((long)pConnectionInfo, (char *)buf, len, 0);
}

/*********************************************************************
*
*       _ListenAtTcpAddr
*
* Starts listening at the given TCP port.
*/
static long _ListenAtTcpAddr(U16 Port) {
  long sock;
  struct sockaddr_in addr;

  sock = socket(AF_INET, SOCK_STREAM, 0);
  if (sock != SOCKET_ERROR) {
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_port = htons(Port);
    addr.sin_addr.s_addr = INADDR_ANY;
    bind(sock, (struct sockaddr *)&addr, sizeof(addr));
    listen(sock, 1);
  }
  return sock;
}

/*********************************************************************
*
*       _CopyString
*/
static void _CopyString(char * sDest, const char * sSrc, int DestSize) {
  char c;

  while (--DestSize > 0) {
    c = *sSrc++;
    if (c == 0) {
      break;
    }
    *sDest++ = c;
  }
  *sDest = 0;
}


/*********************************************************************
*
*       _callback_ExecCounter
*/
static void _callback_ExecCounter(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  char ac[40];
  static U32 Cnt;

  Cnt++;
  sprintf(ac, "You are visitor no. %d", Cnt);
  IP_WEBS_SendString(pOutput, ac);
}

/*********************************************************************
*
*       _callback_ExecGetConnectionInfo
*/
static void _callback_ExecGetConnectionInfo(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  IP_CONNECTION_HANDLE hConnection[MAX_CONNECTION_INFO];
  IP_CONNECTION Info;
  int  NumConnections;
  int  NumValidConnections;
  int  i;
  int  r;
  char ac[16];

  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);
  IP_WEBS_SendString(pOutput, "<H2>Connection info</H2>");
  IP_WEBS_SendString(pOutput, "<PRE>");
  OS_EnterRegion();
  //
  // Number of connections
  //
  IP_WEBS_SendString(pOutput, "Total connections: ");
  NumConnections = IP_INFO_GetConnectionList(&hConnection[0], MAX_CONNECTION_INFO);
  NumValidConnections = NumConnections;
  for (i = 0; i < NumConnections; i++) {
    r = IP_INFO_GetConnectionInfo(hConnection[i], &Info);
    if (r != 0) {
      NumValidConnections--;
    }
  }
  IP_WEBS_SendUnsigned(pOutput, NumValidConnections, 10, 0);
  IP_WEBS_SendString(pOutput, "\r\n</PRE>");
  //
  // Table with connection infos
  //
  IP_WEBS_SendString(pOutput, "<H2>List of TCP connections</H2>");
  IP_WEBS_SendString(pOutput, "<table border=\"1\" frame=\"void\"cellpadding=\"2\">");
  IP_WEBS_SendString(pOutput, "<tr>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Socket</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Local</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Peer</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>State</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>MTU/MSS</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Retrans. delay</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Idle time</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Local window</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Peer window</b></td>");
  for (i = 0; i < NumConnections; i++) {
    r = IP_INFO_GetConnectionInfo(hConnection[i], &Info);
    if (r == 0) {
      IP_WEBS_SendString(pOutput, "<tr><td>");
      IP_WEBS_SendUnsigned(pOutput, (unsigned)Info.hSock, 10, 0);
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output Local Addr & Port, such as    "192.168.1.1:81"
      //
      if (Info.LocalAddr == 0) {
        IP_WEBS_SendString(pOutput, "Any");
      } else {
        IP_PrintIPAddr(ac, Info.LocalAddr, sizeof(ac));
        IP_WEBS_SendString(pOutput, ac);
      }
      IP_WEBS_SendString(pOutput, ":");
      IP_WEBS_SendUnsigned(pOutput, Info.LocalPort, 10, 0);
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output Peer Addr & Port, such as    "192.168.1.1:81"
      //
      if (Info.ForeignAddr == 0) {
        IP_WEBS_SendString(pOutput, "---");
      } else {
        IP_PrintIPAddr(ac, Info.ForeignAddr, sizeof(ac));
        IP_WEBS_SendString(pOutput, ac);
        IP_WEBS_SendString(pOutput, ":");
        IP_WEBS_SendUnsigned(pOutput, Info.ForeignPort, 10, 0);
      }
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output State, such as   "LISTEN"
      //
      IP_WEBS_SendString(pOutput, IP_INFO_ConnectionState2String(Info.TcpState));
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output MTU/MSS
      //
      IP_WEBS_SendUnsigned(pOutput, Info.TcpMtu, 10, 0);
      IP_WEBS_SendString(pOutput, "/");
      IP_WEBS_SendUnsigned(pOutput, Info.TcpMss, 10, 0);
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output retrans. delay
      //
      IP_WEBS_SendUnsigned(pOutput, Info.TcpRetransDelay, 10, 0);
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output TCP idle time
      //
      IP_WEBS_SendUnsigned(pOutput, Info.TcpIdleTime, 10, 0);
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output local window size
      //
      IP_WEBS_SendUnsigned(pOutput, Info.RxWindowCur, 10, 0);
      IP_WEBS_SendString(pOutput, "/");
      IP_WEBS_SendUnsigned(pOutput, Info.RxWindowMax, 10, 0);
      IP_WEBS_SendString(pOutput, "</td><td>");
      //
      // Output peer window size
      //
      IP_WEBS_SendUnsigned(pOutput, Info.TxWindow, 10, 0);
      IP_WEBS_SendString(pOutput, "</td></tr>");
    }
  }
  OS_LeaveRegion();
  IP_WEBS_SendString(pOutput, "</table>");
}

/*********************************************************************
*
*       _callback_ExecGetOSInfo
*/
static void _callback_ExecGetOSInfo(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  OS_TASK *pTask;

  OS_EnterRegion();
  IP_WEBS_SendString(pOutput, "<H2>System info</H2>");
  IP_WEBS_SendString(pOutput, "<PRE>");
  //
  // Number of tasks
  //
  IP_WEBS_SendString(pOutput, "<table><tr>");
  IP_WEBS_SendString(pOutput, "<td>Number of tasks</td><td>");
  IP_WEBS_SendUnsigned(pOutput, OS_GetNumTasks(), 10, 0);
  IP_WEBS_SendString(pOutput, "</td></tr>");
  //
  // System time
  //
  IP_WEBS_SendString(pOutput, "<tr><td>System time</td><td>");
  IP_WEBS_SendUnsigned(pOutput, OS_GetTime32(), 10, 0);
  IP_WEBS_SendString(pOutput, "</td></tr>");
  //
  // System stack
  //
  IP_WEBS_SendString(pOutput, "<tr><td>System stack (size@base)</td><td>");
  IP_WEBS_SendUnsigned(pOutput, OS_GetSysStackSize(), 10, 0);
  IP_WEBS_SendString(pOutput, "@0x");
  IP_WEBS_SendUnsigned(pOutput, OS_GetSysStackBase(), 10, 0);
  IP_WEBS_SendString(pOutput, "</td></tr></table></PRE>");
  //
  // Table with task infos
  //
  IP_WEBS_SendString(pOutput, "<H2>List of tasks</H2>");
  IP_WEBS_SendString(pOutput, "<table border=\"1\" frame=\"void\" cellpadding=\"2\">");
  IP_WEBS_SendString(pOutput, "<tr>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Id</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Priority</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Task names</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Context switches</b></td>");
  IP_WEBS_SendString(pOutput, "<td align=\"left\"><b>Task Stack</b></td>");
  for (pTask = OS_pTask; pTask; pTask = pTask->pNext) {
    IP_WEBS_SendString(pOutput, "<tr>");
    IP_WEBS_SendString(pOutput, "<td>");
    IP_WEBS_SendString(pOutput, "0x");
    IP_WEBS_SendUnsigned(pOutput, (U32)pTask, 16, 0);
    IP_WEBS_SendString(pOutput, "</td>");
    //
    // Priorities
    //
    IP_WEBS_SendString(pOutput, "<td align=\"right\">");
    IP_WEBS_SendUnsigned(pOutput, OS_GetPriority(pTask), 10, 0);
    IP_WEBS_SendString(pOutput, "</td>");
    //
    // Task names
    //
    IP_WEBS_SendString(pOutput, "<td>");
    IP_WEBS_SendString(pOutput, OS_GetTaskName(pTask));
    IP_WEBS_SendString(pOutput, "</td>");
    //
    // NumActivations
    //
    IP_WEBS_SendString(pOutput, "<td align=\"right\">");
    IP_WEBS_SendUnsigned(pOutput, OS_STAT_GetNumActivations(pTask), 10, 0);
    IP_WEBS_SendString(pOutput, "</td>");
    //
    // Task stack info
    //
    IP_WEBS_SendString(pOutput, "<td align=\"right\">");
    IP_WEBS_SendUnsigned(pOutput, OS_GetStackUsed(pTask), 10, 0);
    IP_WEBS_SendString(pOutput, "/");
    IP_WEBS_SendUnsigned(pOutput, OS_GetStackSize(pTask), 10, 0);
    IP_WEBS_SendString(pOutput, "@0x");
    IP_WEBS_SendUnsigned(pOutput, (U32)OS_GetStackBase(pTask), 16, 0);
    IP_WEBS_SendString(pOutput, "</td>");
    IP_WEBS_SendString(pOutput, "</tr>");
  }
  OS_LeaveRegion();
  IP_WEBS_SendString(pOutput, "</table>");
  IP_WEBS_SendString(pOutput, "");
  IP_WEBS_SendString(pOutput, "");
}

/*********************************************************************
*
*       _callback_ExecGetIPAddr
*/
static void _callback_ExecGetIPAddr(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  char ac[16];
  U32 IPAddr;

  IPAddr = IP_GetIPAddr(0);
  IP_PrintIPAddr(ac, IPAddr, sizeof(ac));
  IP_WEBS_SendString(pOutput, ac);
}

/*********************************************************************
*
*       _callback_ExecColor
*/
static void _callback_ExecColor(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  if (sValue == NULL) {
    IP_WEBS_SendString(pOutput, _acColor);
  } else {
    strcpy(_acColor, sValue);
  }
}


/*********************************************************************
*
*       _callback_ExecPercentage
*/
static void _callback_ExecPercentage(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  if (sValue == NULL) {
    IP_WEBS_SendUnsigned(pOutput, _Percentage, 10, 0);
  } else {
    int v;
    v = atoi(sValue);
    if (v > 100) {
      v = 100;
    }
    if (v < 0) {
      v = 0;
    }
    _Percentage = v;
  }
}

/*********************************************************************
*
*       _callback_LastName
*/
static void _callback_ExecLastName(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  if (sValue == NULL) {
    IP_WEBS_SendString(pOutput, _acLastName);
  } else {
    _CopyString(_acLastName, sValue, sizeof(_acLastName));
  }
}

/*********************************************************************
*
*       _callback_FirstName
*/
static void _callback_ExecFirstName(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  if (sValue == NULL) {
    IP_WEBS_SendString(pOutput, _acFirstName);
  } else {
    _CopyString(_acFirstName, sValue, sizeof(_acFirstName));
  }
}


/*********************************************************************
*
*       _callback_LEDx
*/
static void _callback_LEDx(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue, unsigned LEDIndex) {
  if (sValue == NULL) {
    IP_WEBS_SendString(pOutput, _aLEDState[LEDIndex] ? "checked" : "");
  } else {
    if (strcmp(sValue, "on") == 0) {
      _aLEDStateNew[LEDIndex] = 1;
    } else {
      _aLEDStateNew[LEDIndex] = 0;
    }
  }
}

/*********************************************************************
*
*       _callback_LED0
*       _callback_LED1
*       _callback_LED2
*       _callback_LED3
*       _callback_LED4
*       _callback_LED5
*       _callback_LED6
*       _callback_LED7
*/
static void _callback_LED0(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 0);
}
static void _callback_LED1(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 1);
}
static void _callback_LED2(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 2);
}
static void _callback_LED3(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 3);
}
static void _callback_LED4(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 4);
}
static void _callback_LED5(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 5);
}
static void _callback_LED6(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 6);
}
static void _callback_LED7(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  _callback_LEDx(pOutput, sParameters, sValue, 7);
}

static void _callback_SetLEDs(WEBS_OUTPUT * pOutput, const char * sParameters, const char * sValue) {
  int i;
  for (i = 0; i < sizeof(_aLEDState); i++) {
    _aLEDState[i] = _aLEDStateNew[i];
    _aLEDStateNew[i] = 0;
  }
}

/*********************************************************************
*
*       _CB_HandleParameter
*/
static void _CB_HandleParameter(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
}

/*********************************************************************
*
*       CGI table
*
*  Description
*   CGI table, defining callback routines for dynamic content (SSI)
*/
static const WEBS_CGI _aCGI[] = {
  {"Color",       _callback_ExecColor    },
  {"Counter"   ,  _callback_ExecCounter  },
  {"GetIPAddr" ,  _callback_ExecGetIPAddr},
  {"GetOSInfos",  _callback_ExecGetOSInfo},
  {"GetIPInfos",  _callback_ExecGetConnectionInfo },
  {"FirstName",   _callback_ExecFirstName},
  {"LastName",    _callback_ExecLastName },
  {"Percentage",  _callback_ExecPercentage },
  {"LED0",        _callback_LED0 },
  {"LED1",        _callback_LED1 },
  {"LED2",        _callback_LED2 },
  {"LED3",        _callback_LED3 },
  {"LED4",        _callback_LED4 },
  {"LED5",        _callback_LED5 },
  {"LED6",        _callback_LED6 },
  {"LED7",        _callback_LED7 },
  {"SetLEDs",     _callback_SetLEDs },
  {NULL}
};

/*********************************************************************
*
*       _callback_CGISample
*/
static void _callback_SendCGI(WEBS_OUTPUT * pOutput, const char * sParameters) {
  char aPara0[32];
  char aValue0[32];
  char aPara1[32];
  char aValue1[32];
  int r;

  IP_WEBS_SendString(pOutput, "<HTML><HEAD><TITLE>Virtual file example</TITLE></HEAD>");
  IP_WEBS_SendString(pOutput, "<style type=\"text/css\"> \
    H1, H2, H3, H4 { color: white; font-family: Helvetica; } \
    PRE {  color: white;  margin-left: 2%; ; font-size=150%} \
    BODY{padding:0px; margin:0px; text-align:center; font-family:Verdana, Helvetica, sans-serif; background:#6699CC url(bg.png) repeat-x; font-size:11px; color:white } \
    A:link { font-weight:bold; color:white; text-decoration:none; } \
    A:visited { font-weight:bold; color:silver; text-decoration:none; } \
    A:focus { font-weight:bold; color:white; text-decoration:underline; } \
    A:hover { font-weight:bold; color:silver; text-decoration:none; } \
    A:active { font-weight:bold; color:white; text-decoration:underline; }\
    </style>");
  IP_WEBS_SendString(pOutput, "<BODY><CENTER><HR><H2>Virtual file example</H2><HR></CENTER><BR><BR><BR>First name: ");
  r = IP_WEBS_GetParaValue(sParameters, 0, aPara0, sizeof(aPara0), aValue0, sizeof(aValue0));
  if (r == 0) {
    IP_WEBS_SendString(pOutput, aValue0);
  }
  IP_WEBS_SendString(pOutput, "<BR>Last name: ");
  r =  IP_WEBS_GetParaValue(sParameters, 1, aPara1, sizeof(aPara1), aValue1, sizeof(aValue1));
  if (r == 0) {
    IP_WEBS_SendString(pOutput, aValue1);
  }
  IP_WEBS_SendString(pOutput, "<BR><BR><BR>");
  IP_WEBS_SendString(pOutput, "<HR><CENTER><A HREF=\"index.htm\">Back to main</A></CENTER><IMG SRC=\"seggerlogo.gif\" ALT=\"Segger logo\">&nbsp;&nbsp; SEGGER Microcontroller GmbH &amp; Co. KG &nbsp;&nbsp;<A HREF=\"http://www.segger.com\">www.segger.com</A></BODY></HTML>");
}

static const WEBS_VFILES _aVFiles[]  = {
  {"Send.cgi", _callback_SendCGI  },
  NULL
};

/*********************************************************************
*
*       WEBS_APPLICATION
*
*  Description
*   Application data table, defines all application specifics used by the web server
*/
static const WEBS_APPLICATION _Application = {
  &_aCGI[0],
  &_aAccessControl[0],
  _CB_HandleParameter,
  &_aVFiles[0]
};

/*********************************************************************
*
*       _GetTimeDate
*
*  Description:
*    Returns current time and date.
*
*    Bit 0-4:   2-second count (0-29)
*    Bit 5-10:  Minutes (0-59)
*    Bit 11-15: Hours (0-23)
*    Bit 16-20: Day of month (1-31)
*    Bit 21-24: Month of year (1-12)
*    Bit 25-31: Count of years from 1980 (0-127)
*
*  Note:
*    This is a sample implementation for a clock-less system.
*    It always returns 01 Jan 2009 00:00:00 GMT
*/
static U32 _GetTimeDate(void) {
  U32 r;
  U16 Sec, Min, Hour;
  U16 Day, Month, Year;

  Sec   = 0;        // 0 based.  Valid range: 0..59
  Min   = 0;        // 0 based.  Valid range: 0..59
  Hour  = 0;        // 0 based.  Valid range: 0..23
  Day   = 1;        // 1 based.    Means that 1 is 1. Valid range is 1..31 (depending on month)
  Month = 1;        // 1 based.    Means that January is 1. Valid range is 1..12.
  Year  = 29;       // 1980 based. Means that 2008 would be 28.
  r   = Sec / 2 + (Min << 5) + (Hour  << 11);
  r  |= (U32)(Day + (Month << 5) + (Year  << 9)) << 16;
  return r;
}

/*********************************************************************
*
*       _pfGetFileInfo
*/
static void _pfGetFileInfo(const char * sFilename, IP_WEBS_FILE_INFO * pFileInfo){
  int v;

  //
  // .cgi files are virtual, everything else is not
  //
  v = IP_WEBS_CompareFilenameExt(sFilename, ".cgi");
  pFileInfo->IsVirtual = v ? 0 : 1;
  //
  // .htm files contain dynamic content, everything else is not
  //
  v = IP_WEBS_CompareFilenameExt(sFilename, ".htm");
  pFileInfo->AllowDynContent = v ? 0 : 1;
  //
  // If file is a virtual file or includes dynamic content,
  // get current time and date stamp as file time
  //
  pFileInfo->DateLastMod = _GetTimeDate();
  if (pFileInfo->IsVirtual || pFileInfo->AllowDynContent) {
    //
    // Set last-modified and expiration time and date
    //
    pFileInfo->DateExp     = _GetTimeDate(); // If "Expires" HTTP header field should be transmitted, set expiration date.
  } else {
    pFileInfo->DateExp     = 0xEE210000; // Expiration far away (01 Jan 2099) if content is static
  }
}

/*********************************************************************
*
*       _WebServerChildTask
*
*/
static void _WebServerChildTask(void * Context) {
  long Sock;
  int Opt;

  _pFS_API = &IP_FS_ReadOnly;
  Sock = (long)Context;
  Opt = 1;
  setsockopt(Sock, SOL_SOCKET, SO_KEEPALIVE, &Opt, sizeof(Opt));
  IP_WEBS_Process(_Send, _Recv, Context, _pFS_API, &_Application);
  _closesocket(Sock);
  _ConnectCnt--;
  OS_Terminate(0);
}

/*********************************************************************
*
*       _WebServerParentTask
*
*/
static void _WebServerParentTask(void) {
  long s, Sock;
  struct sockaddr Addr;
  int i;


  IP_WEBS_SetFileInfoCallback(&_pfGetFileInfo);
  //
  // Loop until we get a socket into listening state
  //
  do {
    s = _ListenAtTcpAddr(80);
    if (s != SOCKET_ERROR) {
      break;
    }
    OS_Delay(100);    // Try again
  } while (1);
  //
  // Loop once per client and create a thread for the actual server
  //
  while (1) {
    //
    // Wait for an incoming connection
    //
    int AddrLen = sizeof(Addr);
    if ((Sock = accept(s, &Addr, &AddrLen)) == SOCKET_ERROR) {
      continue;    // Error
    }

    if (_ConnectCnt++ < MAX_CONNECTIONS) {
      for (i = 0; i < MAX_CONNECTIONS; i++) {
        U8 r;

        r = OS_IsTask(&_aWebTasks[i]);
        if (r == 0) {
          OS_CREATETASK_EX(&_aWebTasks[i], "IP_WebserverChild", _WebServerChildTask, TASKPRIO_WEBSCHILD, _aWebStacks[i], (void *)Sock);
          break;
        }
      }
    } else {
      IP_WEBS_OnConnectionLimit(_Send, _Recv, (void *)Sock);
      OS_Delay(2000);          // Give connection some time to complete
      _closesocket(Sock);
      _ConnectCnt--;
    }
  }
}

/*********************************************************************
*
*       MainTask
*/
void WebserverTask(void);
void WebserverTask(void) {
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  OS_SetPriority(OS_GetTaskID(), TASKPRIO_WEBSPARENT);                                  // This task has highest prio!
  OS_SetTaskName(OS_GetTaskID(), "IP_WebServer");
  _WebServerParentTask();
}




/*************************** End of file ****************************/
