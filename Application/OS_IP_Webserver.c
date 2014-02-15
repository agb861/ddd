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
#include "RTOS.h"
#include "BSP.h"
#include "IP.h"
#include "IP_Webserver.h"
#include "WEBS_Conf.h"        // Stack size depends on configuration

/*********************************************************************
*
*       Local defines, configurable
*
**********************************************************************
*/
#define MAX_CONNECTIONS           2
#define BACK_LOG                  5
#define MAX_CONNECTION_INFO      10

#define TASK_PRIO_IP_RX          40 // Must be the highest priority of all TCP/IP related tasks
#define TASK_PRIO_IP_MAIN        30 // Priority should be higher as all TCP/IP application tasks
#define TASK_PRIO_WEBS_PARENT    20
#define TASK_PRIO_WEBS_CHILD     10

#define STACK_SIZE_SERVER     WEBS_STACK_SIZE_CHILD     // Stack size depends on buffer size config

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
// Task stacks and Task-control-blocks
//
static int        _Stack[2048/sizeof(int)];      // Define the stack of the IPTask.
static OS_TASK    _TCB;
#if TASK_PRIO_IP_RX                             // If IP_Rx task should be used.
static int        _IPRxStack[1024/sizeof(int)];  // Define the stack of the RxTask.
static OS_TASK    _IPRxTCB;
#endif

//
// Webserver TCBs and stacks
//
static OS_TASK           _aWebTasks[MAX_CONNECTIONS];
static OS_STACKPTR int   _aWebStacks[MAX_CONNECTIONS][STACK_SIZE_SERVER/sizeof(int)];
//
// File system info
//
static const IP_FS_API * _pFS_API;
//
// Variables used for CGI samples
//
static int  _ConnectCnt;
static U32  _Percentage = 50;
static char _aLEDState[8];
static char _aLEDStateNew[8];
static char _acColor[8] = "#FFFFFF";
static char _acFirstName[12];
static char _acLastName[12];


/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _Send()
*
*  Function description
*    Wrapper for send()
*/
static int _Send(const unsigned char * buf, int len, void* pConnectionInfo) {
  int r;

  r = send((long)pConnectionInfo, (const char *)buf, len, 0);
  return r;
}

/*********************************************************************
*
*       _closesocket()
*
*  Function description
*    Wrapper for closesocket()
*/
static int _closesocket(long pConnectionInfo) {
  int r;
  struct linger Linger;

  Linger.l_onoff  = 1;  // Enable linger for this socket to verify that all data is send.
  Linger.l_linger = 1;  // Linger timeout in seconds
  setsockopt((long)pConnectionInfo, SOL_SOCKET, SO_LINGER, &Linger, sizeof(Linger));
  r = closesocket((long)pConnectionInfo);
  return r;
}


/*********************************************************************
*
*       _Recv()
*
*  Function description
*    Wrapper for recv()
*/
static int _Recv(unsigned char * buf, int len, void* pConnectionInfo) {
  int r;

  r = recv((long)pConnectionInfo, (char *)buf, len, 0);
  return r;
}

/*********************************************************************
*
*       _atoi
*
*  Function description
*    Converts a string to an interger
*/
static int _atoi(const char  * sValue) {
  int Value;
  int Digit;
  char c;

  Value = 0;
  while ((c = *sValue++) != '\0') {
    if (c >= '0' && c <= '9') {
      Digit = (int) (c - '0');
    } else {
      break;
    }
    Value = (Value * 10) + Digit;
  }
  return Value;
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
*       _callback_DefaultHandler
*/
static void _callback_DefaultHandler(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);
  IP_WEBS_SendString(pOutput, "<H1>Unknown CGI ");
  IP_WEBS_SendString(pOutput, "- Ignored</H1>");
}

/*********************************************************************
*
*       _callback_ExecCounter
*/
static void _callback_ExecCounter(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  char ac[40];
  static U32 Cnt;

  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);
  Cnt++;
  sprintf(ac, "You are visitor no. %lu", Cnt);
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
static void _callback_ExecGetOSInfo(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  OS_TASK *pTask;

  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);
  IP_WEBS_SendString(pOutput, "<H2>System info</H2>");
  IP_WEBS_SendString(pOutput, "<PRE>");
  OS_EnterRegion();
  //
  // Number of tasks
  //
  IP_WEBS_SendString(pOutput, "Number of tasks          : ");
  IP_WEBS_SendUnsigned(pOutput, OS_GetNumTasks(), 10, 0);
  IP_WEBS_SendString(pOutput, "\r\n");
  //
  // System time
  //
  IP_WEBS_SendString(pOutput, "System time              : ");
  IP_WEBS_SendUnsigned(pOutput, OS_GetTime32(), 10, 0);
  IP_WEBS_SendString(pOutput, "\r\n");
  //
  // System stack
  //
  IP_WEBS_SendString(pOutput, "System stack (size@base) : ");
  IP_WEBS_SendUnsigned(pOutput, OS_GetSysStackSize(), 10, 0);
  IP_WEBS_SendString(pOutput, "@0x");
  IP_WEBS_SendUnsigned(pOutput, OS_GetSysStackBase(), 16, 0);
  IP_WEBS_SendString(pOutput, "\r\n</PRE>");
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
static void _callback_ExecGetIPAddr(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  char ac[16];
  U32 IPAddr;

  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);
  IPAddr = IP_GetIPAddr(0);
  IP_PrintIPAddr(ac, IPAddr, sizeof(ac));
  IP_WEBS_SendString(pOutput, ac);
}

/*********************************************************************
*
*       _callback_ExecColor
*/
static void _callback_ExecColor(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  IP_USE_PARA(sPara);
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
static void _callback_ExecPercentage(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  IP_USE_PARA(sPara);
  if (sValue == NULL) {
    IP_WEBS_SendUnsigned(pOutput, _Percentage, 10, 0);
  } else {
    int v;
    v = _atoi(sValue);
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
static void _callback_ExecLastName(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  IP_USE_PARA(sPara);
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
static void _callback_ExecFirstName(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  IP_USE_PARA(sPara);
  if (sValue == NULL) {
    IP_WEBS_SendString(pOutput, _acFirstName);
  } else {
    _CopyString(_acFirstName, sValue, sizeof(_acFirstName));
  }
}

/*********************************************************************
*
*       _callback_LEDx
*
*  Function description
*    This function is called to set or get the LED state.
*/
static void _callback_LEDx(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue, unsigned LEDIndex) {
  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);

  if (sValue == NULL) {
    if (_aLEDState[LEDIndex] == 1) {             // Get LED state
      IP_WEBS_SendString(pOutput, "checked");
    } else {
      IP_WEBS_SendString(pOutput, "");
      BSP_ClrLED(LEDIndex);
    }
  } else {
    //
    // Set new LED state
    //
    if (strcmp(sValue, "on") == 0) {
      _aLEDStateNew[LEDIndex] = 1;
      BSP_SetLED(LEDIndex);
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
static void _callback_LED0(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 0);
}
static void _callback_LED1(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 1);
}
static void _callback_LED2(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 2);
}
static void _callback_LED3(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 3);
}
static void _callback_LED4(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 4);
}
static void _callback_LED5(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 5);
}
static void _callback_LED6(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 6);
}
static void _callback_LED7(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  _callback_LEDx(pOutput, sPara, sValue, 7);
}

static void _callback_SetLEDs(WEBS_OUTPUT * pOutput, const char * sPara, const char * sValue) {
  int i;

  IP_USE_PARA(pOutput);
  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);
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
  IP_USE_PARA(pOutput);
  IP_USE_PARA(sPara);
  IP_USE_PARA(sValue);
}

/*********************************************************************
*
*       CGI table
*
*  Description
*   CGI table, defining callback routines for dynamic content (SSI)
*/
static const WEBS_CGI _aCGI[] = {
  {"Color",       _callback_ExecColor             },
  {"Counter"   ,  _callback_ExecCounter           },
  {"GetIPAddr" ,  _callback_ExecGetIPAddr         },
  {"GetOSInfos",  _callback_ExecGetOSInfo         },
  {"GetIPInfos",  _callback_ExecGetConnectionInfo },
  {"FirstName",   _callback_ExecFirstName         },
  {"LastName",    _callback_ExecLastName          },
  {"Percentage",  _callback_ExecPercentage        },
  {"LED0",        _callback_LED0                  },
  {"LED1",        _callback_LED1                  },
  {"LED2",        _callback_LED2                  },
  {"LED3",        _callback_LED3                  },
  {"LED4",        _callback_LED4                  },
  {"LED5",        _callback_LED5                  },
  {"LED6",        _callback_LED6                  },
  {"LED7",        _callback_LED7                  },
  {"SetLEDs",     _callback_SetLEDs               },
  {NULL,          _callback_DefaultHandler        }
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
  IP_WEBS_SendString(pOutput, "<HR><CENTER><A HREF=\"index.htm\">Back to main</A></CENTER><IMG SRC=\"segger.gif\" ALT=\"Segger logo\">&nbsp;&nbsp; SEGGER Microcontroller GmbH &amp; Co. KG &nbsp;&nbsp;<A HREF=\"http://www.segger.com\">www.segger.com</A></BODY></HTML>");
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
*       _AddToConnectCnt
*
*/
static void _AddToConnectCnt(int Delta) {
  OS_IncDI();
  _ConnectCnt += Delta;
  OS_DecRI();
}

/*********************************************************************
*
*       _WebServerChildTask
*
*/
static void _WebServerChildTask(void * Context) {
  long hSock;
  int Opt;

  _pFS_API = &IP_FS_ReadOnly;
  hSock = (long)Context;
  Opt = 1;
  setsockopt(hSock, SOL_SOCKET, SO_KEEPALIVE, &Opt, sizeof(Opt));
  if (_ConnectCnt < MAX_CONNECTIONS) {
    IP_WEBS_Process(_Send, _Recv, Context, _pFS_API, &_Application);
  } else {
    IP_WEBS_ProcessLast(_Send, _Recv, Context, _pFS_API, &_Application);
  }
  _closesocket(hSock);
  OS_EnterRegion();
  _AddToConnectCnt(-1);
  OS_Terminate(0);
  OS_LeaveRegion();
}

/*********************************************************************
*
*       _WebServerParentTask
*
*/
static void _WebServerParentTask(void) {
  struct sockaddr    Addr;
  struct sockaddr_in InAddr;
  long hSockListen;
  long hSock;
  int AddrLen;
  int i;
  int t;
  int t0;

  IP_WEBS_SetFileInfoCallback(&_pfGetFileInfo);
  //
  // Get a socket into listening state
  //
  hSockListen = socket(AF_INET, SOCK_STREAM, 0);
  if (hSockListen == SOCKET_ERROR) {
    while(1); // This should never happen!
  }
  memset(&InAddr, 0, sizeof(InAddr));
  InAddr.sin_family      = AF_INET;
  InAddr.sin_port        = htons(80);
  InAddr.sin_addr.s_addr = INADDR_ANY;
  bind(hSockListen, (struct sockaddr *)&InAddr, sizeof(InAddr));
  listen(hSockListen, BACK_LOG);
  //
  // Loop once per client and create a thread for the actual server
  //
  do {
Next:
    //
    // Wait for an incoming connection
    //
    hSock = 0;
    AddrLen = sizeof(Addr);
    if ((hSock = accept(hSockListen, &Addr, &AddrLen)) == SOCKET_ERROR) {
      continue;    // Error
    }
    //
    // Create server thread to handle connection.
    // If connection limit is reached, keep trying for some time before giving up and outputting an error message
    //
    t0 = OS_GetTime32() + 1000;
    do {
      if (_ConnectCnt < MAX_CONNECTIONS) {
        for (i = 0; i < MAX_CONNECTIONS; i++) {
          U8 r;
          r = OS_IsTask(&_aWebTasks[i]);
          if (r == 0) {
            OS_CREATETASK_EX(&_aWebTasks[i], "Webserver Child", _WebServerChildTask, TASK_PRIO_WEBS_CHILD, _aWebStacks[i], (void *)hSock);
            _AddToConnectCnt(1);
            goto Next;
          }
        }
      }
      //
      // Check time out
      //
      t = OS_GetTime32();
      if ((t - t0) > 0) {
        IP_WEBS_OnConnectionLimit(_Send, _Recv, (void *)hSock);
        _closesocket(hSock);
        break;
      }
      OS_Delay(10);
    } while(1);
  }  while(1);
}

/*********************************************************************
*
*       MainTask
*/
void MainTask(void);
void MainTask(void) {
  IP_Init();
  //
  // Start TCP/IP task
  //
  OS_CREATETASK(&_TCB,       "IP_Task",     IP_Task,              TASK_PRIO_IP_MAIN,  _Stack);
#if TASK_PRIO_IP_RX
  OS_CREATETASK(&_IPRxTCB,   "IP_RxTask",   IP_RxTask,            TASK_PRIO_IP_RX,    _IPRxStack);   // Start the IP_RxTask, optional.
#endif
  while (IP_IFaceIsReady() == 0) {
    BSP_ToggleLED(0);
    OS_Delay(200);
  }
  BSP_ClrLED(0);
  OS_SetPriority(OS_GetTaskID(), TASK_PRIO_WEBS_PARENT);                                  // This task has highest prio!
  OS_SetTaskName(OS_GetTaskID(), "IP_WebServer");
  _WebServerParentTask();
}

/*************************** End of file ****************************/
