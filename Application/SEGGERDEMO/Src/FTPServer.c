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
File    : OS_IP_FTPServer.c
Purpose : Sample program for embOS/IP FTP server.
--------- END-OF-HEADER --------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include "TaskPrio.h"
#include "RTOS.h"
#include "BSP.h"
#include "GUI.h"
#include "GUIDemo.h"
#include "IP.h"
#include "IP_FTPServer.h"

/*********************************************************************
*
*       Defines, configurable
*
**********************************************************************
*/
#define MAX_CONNECTIONS    1

enum {
  USER_ID_ANONYMOUS = 1,
  USER_ID_ADMIN
};

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static int  _ConnectCnt;

/*********************************************************************
*
*       static data
*/

//
// FTP server TCBs and stacks
//
static OS_TASK          _aFTPTasks[MAX_CONNECTIONS];
static OS_STACKPTR int  _aFTPStacks[MAX_CONNECTIONS][2800/sizeof(int)];


static const IP_FS_API * _pFS_API;       // File system info

/**************************************************************************************************************************************************************
*
*       IP interface.
*
*  Mapping of the required socket functions to the actual IP stack.
*  This is required becasue the socket functions are slightly different on different systems.
*/

/*********************************************************************
*
*       _accept
*/
static long _accept(long Socket, struct sockaddr * pAddr, int * pAddrLen) {
  return accept(Socket, pAddr, pAddrLen);
}

/*********************************************************************
*
*       _bind
*/
static int _bind(long Socket, struct sockaddr * pAddr, int AddrLen) {
  return bind(Socket, pAddr, AddrLen);
}

/*********************************************************************
*
*       _connect
*/
static int _connect(long Socket, struct sockaddr * pAddr, int AddrLen) {
  return connect(Socket, pAddr, AddrLen);
}

/*********************************************************************
*
*       _closesocket
*/
static int _closesocket(int pConnectionInfo) {
  return closesocket((long)pConnectionInfo);
}

/*********************************************************************
*
*       _listen
*/
static int _listen(long Socket, int Backlog) {
  return listen(Socket, Backlog);
}

/*********************************************************************
*
*       _Recv
*/
static int _Recv(unsigned char * buf, int len, void * pConnectionInfo) {
  return recv((long)pConnectionInfo, (char *)buf, len, 0);
}

/*********************************************************************
*
*       _Send
*/
static int _Send(const unsigned char * buf, int len, void* pConnectionInfo) {
  return send((long)pConnectionInfo, (const char *)buf, len, 0);
}

/*********************************************************************
*
*       _socket
*/
static int _socket(int Domain, int Type, int Proto) {
  return socket(Domain, Type, Proto);
}

/*********************************************************************
*
*       _htons
*/
static U16 _htons(U16 HostShort) {
  return htons(HostShort);
}

/*********************************************************************
*
*       _getsockname
*/
static int _getsockname(long Socket, struct sockaddr * Addr, int * AddrLen) {
  return getsockname(Socket, Addr, AddrLen);
}

/*********************************************************************
*
*       _getpeername
*/
static int _getpeername(long Socket, struct sockaddr * Addr, int * AddrLen) {
  return getpeername(Socket, Addr, AddrLen);
}

/*********************************************************************
*
*       _Connect
*
*  Function description
*    This function is called from the FTP server module if the client
*    uses active FTP to establish the data connection.
*/
static FTPS_SOCKET _Connect(FTPS_SOCKET CtrlSocket, U16 Port) {
  int                DataSock;
  struct sockaddr_in Data;
  struct sockaddr_in PeerAddr;
  int                ConnectStatus;
  int                AddrSize;

  DataSock = _socket(AF_INET, SOCK_STREAM, 0);  // Create a new socket for data connection to the client
  if (DataSock != SOCKET_ERROR) {               // Socket created?
    Data.sin_family      = AF_INET;
    Data.sin_port        = _htons(20);
    Data.sin_addr.s_addr = INADDR_ANY;
    _bind(DataSock, (struct sockaddr *)&Data, sizeof(Data));
    //
    //  Get IP address of connected client and connect to listening port
    //
    AddrSize = sizeof(struct sockaddr_in);
    _getpeername((long)CtrlSocket, (struct sockaddr *)&PeerAddr, &AddrSize);
    PeerAddr.sin_port = _htons(Port);
    ConnectStatus  = _connect(DataSock, (struct sockaddr *)&PeerAddr, sizeof(struct sockaddr_in));
    if (ConnectStatus == 0) {
      return (void*)DataSock;
    }
  }
  return NULL;
}

/*********************************************************************
*
*       _Disconnect
*
*  Function description
*    This function is called from the FTP server module to close the
*    the data connection.
*/
static void _Disconnect(FTPS_SOCKET socket) {
  _closesocket((long) socket);
}

/*********************************************************************
*
*       _Listen
*
*  Function description
*    This function is called from the FTP server module if the client
*    uses passive FTP. It creates socket and searches for a free port
*    which can be used for the data connection.
*
*  Return value
*    > 0   Socket descriptor
*    NULL  Error
*/
static FTPS_SOCKET _Listen(FTPS_SOCKET CtrlSocket, U16 *pPort, U8 * pIPAddr) {
  struct sockaddr_in addr;
  U16  Port;
  int  DataSock;
  int  AddrSize;

  addr.sin_family = AF_INET;
  addr.sin_port   = 0;                          // Let Stack find a free port
  addr.sin_addr.s_addr = INADDR_ANY;
  DataSock = _socket(AF_INET, SOCK_STREAM, 0);  // Create a new socket for data connection to the client
  if(DataSock == SOCKET_ERROR) {                // Socket created?
    return NULL;
  }
  _bind(DataSock, (struct sockaddr *)&addr, sizeof(addr));
  _listen(DataSock, 1);
  //
  //  Get port number stack has assigned
  //
  AddrSize = sizeof(struct sockaddr_in);
  _getsockname((long)DataSock, (struct sockaddr *)&addr, &AddrSize);
  Port = htons(addr.sin_port);
  *pPort = Port;
  _getsockname((long)CtrlSocket, (struct sockaddr *)&addr, &AddrSize);
  Port = htons(addr.sin_port);
  *pIPAddr++ = addr.sin_addr.s_addr;
  *pIPAddr++ = addr.sin_addr.s_addr >> 8;
  *pIPAddr++ = addr.sin_addr.s_addr >> 16;
  *pIPAddr   = addr.sin_addr.s_addr >> 24;
  return (FTPS_SOCKET)DataSock;
}

/*********************************************************************
*
*       _Accept
*
*  Function description
*    This function is called from the FTP server module if the client
*    uses passive FTP. It sets the command socket to non-blocking before
*    accept() will be called. This guarantees that the FTP server always
*    returns even if the connection to the client gets lost while
*    accept() waits for a connection. The timeout is set to 10 seconds.
*
*  Return value
*    0    O.K.
*   -1    Error
*/
static int _Accept(FTPS_SOCKET CtrlSocket, FTPS_SOCKET * pSocket) {
  int Socket;
  int DataSock;
  int SoError;
  int t0;
  int t;
  struct sockaddr Addr;
  int AddrSize;
  int Opt;

  AddrSize = sizeof(Addr);
  Socket   = *(int*)pSocket;
  //
  // Set command socket non-blocking
  //
  Opt      = 1;
  setsockopt(Socket, SOL_SOCKET, SO_NONBLOCK, &Opt, sizeof(Opt));
  t0 = IP_OS_GetTime32();
  do {
    DataSock = _accept(Socket, &Addr, &AddrSize);
    if (DataSock != SOCKET_ERROR) {
      //
      // Set command socket blocking
      //
      Opt = 0;
      setsockopt(Socket, SOL_SOCKET, SO_NONBLOCK, &Opt, sizeof(Opt));
      //
      // Set data socket blocking. The data socket inherits the blocking
      // mode from the socket that was used as parameter for accept().
      // Therefore, we have to set it blocking after creation.
      // SO_KEEPALIVE is required to quarantee that the socket will be
      // closed even if the client has lost the connection to server
      // before he closed the connection.
      //
      setsockopt(DataSock, SOL_SOCKET, SO_NONBLOCK, &Opt, sizeof(Opt));
      Opt=1;
      setsockopt(DataSock, SOL_SOCKET, SO_KEEPALIVE, &Opt, sizeof(Opt));
      *pSocket = (FTPS_SOCKET)DataSock;
      return 0;                  // Successfully connected
    }
    getsockopt(Socket, SOL_SOCKET, SO_ERROR, &SoError, sizeof(SoError));
    if (SoError != EWOULDBLOCK) {
      return SOCKET_ERROR;       // Not in progress and not successful, error...
    }
    t = IP_OS_GetTime32() - t0;
    if (t >= 10000) {
      return SOCKET_ERROR;
    }
    OS_Delay(1);                 // Give lower prior tasks some time
  } while (1);
}

/*********************************************************************
*
*       IP_FTPS_API
*
*  Description
*    IP stack function table
*/
static const IP_FTPS_API _IP_API = {
  _Send,
  _Recv,
  _Connect,
  _Disconnect,
  _Listen,
  _Accept
};

/**************************************************************************************************************************************************************
*
*       User management.
*/

/*********************************************************************
*
*       _FindUser
*
*  Function description
*    Callback function for user management.
*    Checks if user name is valid.
*
*  Return value
*    0    UserID invalid or unknown
*  > 0    UserID, no password required
*  < 0    - UserID, password required
*/
static int _FindUser (const char * sUser) {
  if (strcmp(sUser, "Admin") == 0) {
    return - USER_ID_ADMIN;
  }
  if (strcmp(sUser, "anonymous") == 0) {
    return USER_ID_ANONYMOUS;
  }
  return 0;
}

/*********************************************************************
*
*       _CheckPass
*
*  Function description
*    Callback function for user management.
*    Checks user password.
*
*  Return value
*    0    UserID know, password valid
*    1    UserID unknown or password invalid
*/
static int _CheckPass (int UserId, const char * sPass) {
  if ((UserId == USER_ID_ADMIN) && (strcmp(sPass, "Secret") == 0)) {
    return 0;
  } else {
    return 1;
  }
}

/*********************************************************************
*
*       _GetDirInfo
*
*  Function description
*    Callback function for user management.
*    Checks user authorizations.
*
*  Return value
*    Returns a combination of the following:
*    IP_FTPS_PERM_LIST
*    IP_FTPS_PERM_READ
*    IP_FTPS_PERM_WRITE
*/
static int _GetDirInfo (int UserId, const char * sDirIn, char * sDirOut, int DirOutSize) {
  int Perm;

  Perm = IP_FTPS_PERM_VISIBLE | IP_FTPS_PERM_READ | IP_FTPS_PERM_WRITE;
  if (strcmp(sDirIn, "ReadOnly") == 0) {
    Perm = IP_FTPS_PERM_VISIBLE | IP_FTPS_PERM_READ;
  }
  if (strcmp(sDirIn, "NotReadable") == 0) {
    Perm = IP_FTPS_PERM_VISIBLE;
  }
  if (strcmp(sDirIn, "Admin") == 0) {
    if (UserId != USER_ID_ADMIN) {
      return 0;    // Only Admin is allowed for this directory
    }
  }
  if (sDirOut == NULL) {
    return Perm;
  }
  if ((int)strlen(sDirIn) >= DirOutSize) {
    return 0;    // Does not fit
  }
  strcpy(sDirOut, sDirIn);
  return Perm;
}

/*********************************************************************
*
*       FTPS_ACCESS_CONTROL
*
*  Description
*   User/pass data table
*/
static FTPS_ACCESS_CONTROL _Access_Control = {
  _FindUser,
  _CheckPass,
  _GetDirInfo
};

/*********************************************************************
*
*       _GetTimeDate
*
*  Description:
*    Current time and date in a format suitable for the FTP server.
*
*    Bit 0-4:   2-second count (0-29)
*    Bit 5-10:  Minutes (0-59)
*    Bit 11-15: Hours (0-23)
*    Bit 16-20: Day of month (1-31)
*    Bit 21-24: Month of year (1-12)
*    Bit 25-31: Count of years from 1980 (0-127)
*
*  Note:
*    FTP server requires a real time clock for to transmit the
*    correct timestamp of files. Lists transmits either the
*    year or the HH:MM. For example:
*    -rw-r--r--   1 root 1000 Jan  1  1980 DEFAULT.TXT
*    or
*    -rw-r--r--   1 root 1000 Jul 29 11:40 PAKET01.TXT
*    The decision which of both infos the server transmits
*    depends on the system time. If the year of the system time
*    is identical to the year stored in the timestamp of the file,
*    the time will be transmitted, if not the year.
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
  Year  = 0;        // 1980 based. Means that 2008 would be 28.
  r   = Sec / 2 + (Min << 5) + (Hour  << 11);
  r  |= (U32)(Day + (Month << 5) + (Year  << 9)) << 16;
  return r;
}

/*********************************************************************
*
*       FTPS_APPLICATION
*
*  Description
*   Application data table, defines all application specifics used by the FTP server
*/
static const FTPS_APPLICATION _Application = {
  &_Access_Control,
  _GetTimeDate
};



/*********************************************************************
*
*       _ListenAtTcpAddr
*
*  Description
*    Starts listening at the given TCP port.
*/
static int _ListenAtTcpAddr(U16 Port) {
  int sock;
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
*       _FTPServerChildTask
*
*/
static void _FTPServerChildTask(void * Context) {
  int Sock;
  int Opt;

  _pFS_API = &IP_FS_FS;
  Sock = (int)Context;
  Opt = 1;
  setsockopt(Sock, SOL_SOCKET, SO_KEEPALIVE, &Opt, sizeof(Opt));
  IP_FTPS_Process(&_IP_API, Context, _pFS_API, &_Application);
  _closesocket(Sock);
  _ConnectCnt--;
  OS_Terminate(0);
}

/*********************************************************************
*
*       _FTPServerParentTask
*
*/
static void _FTPServerParentTask(void) {
  int s, Sock;
  struct sockaddr Addr;
  int i;

  //
  // Loop until we get a socket into listening state
  //
  do {
    s = _ListenAtTcpAddr(21);
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

        r = OS_IsTask(&_aFTPTasks[i]);
        if (r == 0) {
          OS_CREATETASK_EX(&_aFTPTasks[i], "IP_FTPServerChild", _FTPServerChildTask, TASKPRIO_FTPSCHILD, _aFTPStacks[i], (void *)Sock);
          break;
        }
      }
    } else {
      IP_FTPS_OnConnectionLimit(&_IP_API, (void *)Sock);
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
void FTPServerTask(void);
void FTPServerTask(void) {
  while (IP_IFaceIsReady() == 0) {
    OS_Delay(50);
  }
  OS_SetPriority(OS_GetTaskID(), TASKPRIO_FTPSPARENT);                                  // This task has highest prio!
  OS_SetTaskName(OS_GetTaskID(), "IP_FTP_Server");
  _FTPServerParentTask();
}




/*************************** End of file ****************************/
