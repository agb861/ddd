#line 1 "GUI\\GUI_VNC_X_StartServer.c"


















 

#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
 
 
 




 
 



 













  


 








#line 46 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


  
  typedef unsigned int size_t;










    



    typedef unsigned short wchar_t;  
#line 75 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { __int64 quot, rem; } lldiv_t;
    


#line 96 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
   



 

   




 
#line 115 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) __int64 atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) __int64 strtoll(const char * __restrict  ,
                               char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned __int64 strtoull(const char * __restrict  ,
                                         char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 415 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 503 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 532 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __pure int abs(int  );
   



 

extern __declspec(__nothrow) __pure div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __pure long int labs(long int  );
   



 




extern __declspec(__nothrow) __pure ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __pure __int64 llabs(__int64  );
   



 




extern __declspec(__nothrow) __pure lldiv_t lldiv(__int64  , __int64  );
   











 
#line 613 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"



 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __pure __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 



 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 867 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


 

#line 22 "GUI\\GUI_VNC_X_StartServer.c"

#line 1 "IP\\IP.h"















 
 
 
 
 
 




#line 1 "GUI\\Global.h"















 









 
#line 33 "GUI\\Global.h"



 
#line 27 "IP\\IP.h"
#line 1 "IP\\IP_ConfDefaults.h"















 




#line 1 "Setup\\IP_Conf.h"












 







#line 30 "Setup\\IP_Conf.h"
















#line 22 "IP\\IP_ConfDefaults.h"




































#line 65 "IP\\IP_ConfDefaults.h"

#line 73 "IP\\IP_ConfDefaults.h"







































#line 121 "IP\\IP_ConfDefaults.h"





#line 133 "IP\\IP_ConfDefaults.h"

#line 141 "IP\\IP_ConfDefaults.h"

#line 149 "IP\\IP_ConfDefaults.h"



#line 161 "IP\\IP_ConfDefaults.h"















 



#line 28 "IP\\IP.h"
#line 1 "IP\\IP_socket.h"















 

 
 



























 












 






 








 

#line 106 "IP\\IP_socket.h"











 








 
#line 143 "IP\\IP_socket.h"

 





 
#line 161 "IP\\IP_socket.h"

 
#line 170 "IP\\IP_socket.h"




 









 
struct   linger {
   int   l_onoff;     
   int   l_linger;    
};





 
struct sockaddr {
   unsigned short     sa_family;      
   char     sa_data[14];       
};


 

struct in_addr {
   unsigned long  s_addr;
};



 
struct sockaddr_in {
  unsigned short      sin_family;
  unsigned short      sin_port;
  struct   in_addr  sin_addr;
  char     sin_zero[8];
};







 
struct sockproto {
   unsigned short     sp_family;      
   unsigned short     sp_protocol;    
};

 







 
#line 255 "IP\\IP_socket.h"




 








 
int inet46_addr(char *str, struct sockaddr *address);

long  t_socket (int, int, int);
int   t_bind (long, struct sockaddr *, int);
int   t_listen (long, int);
long  t_accept (long, struct sockaddr *, int *);
int   t_connect (long, struct sockaddr *, int);
int   t_getpeername (long, struct sockaddr *, int * addrlen);
int   t_getsockname (long, struct sockaddr *, int * addrlen);
int   t_setsockopt (long sock, int level, int op, void * data, int dlen);
int   t_getsockopt (long sock, int level, int op, void * data, int dlen);
int   t_recv (long, char *, int, int);
int   t_send (long, const char *, int, int);
int   t_recvfrom (long s, char * buf, int len, int flags, struct sockaddr *, int*);
int   t_sendto (long s, const char * buf, int len, int flags, struct sockaddr *, int);
int   t_shutdown (long, int);
int   t_socketclose (long);
int   t_errno(long s);

char * so_perror(int);   




#line 310 "IP\\IP_socket.h"

struct hostent *  gethostbyname (char * name);


















 











 

typedef struct IP_FD_SET    
{
   unsigned fd_count;                
   long     fd_array[12];    
} IP_fd_set;

 
int t_select(IP_fd_set * in, IP_fd_set * out, IP_fd_set * ev, long tmo_seconds);




void  IP_FD_CLR  (long so, IP_fd_set * set);
void  IP_FD_SET  (long so, IP_fd_set * set);
int   IP_FD_ISSET(long so, IP_fd_set * set);









 


#line 29 "IP\\IP.h"












 
#line 48 "IP\\IP.h"

#line 56 "IP\\IP.h"
























void IP_Logf_Application(const char * sFormat, ...);
void IP_Warnf_Application(const char * sFormat, ...);













 

 




 
#line 109 "IP\\IP.h"




 
#line 120 "IP\\IP.h"

 









 
#line 139 "IP\\IP.h"

#line 146 "IP\\IP.h"





unsigned long IP_SwapU32(unsigned long v);





 
void IP_OS_Delay(unsigned ms);
void IP_OS_DisableInterrupt(void);
void IP_OS_EnableInterrupt(void);
void IP_OS_Init(void);
void IP_OS_Unlock(void);
void IP_OS_AssertLock(void);
void IP_OS_Lock  (void);
unsigned long  IP_OS_GetTime32(void);

void IP_OS_WaitNetEvent  (unsigned ms);
void IP_OS_SignalNetEvent(void);

void IP_OS_WaitRxEvent  (void);
void IP_OS_SignalRxEvent(void);

void IP_OS_WaitItem      (void * pWaitItem);
void IP_OS_WaitItemTimed (void * pWaitItem, unsigned Timeout);
void IP_OS_SignalItem(void * pWaitItem);
void IP_OS_AddTickHook(void (* pfHook)(void));

























 
typedef   unsigned long ip_addr;

typedef struct IP_PACKET {
  struct IP_PACKET * pNext;
  struct net       * pNet;          
  char             * pBuffer;       
  char             * pData;         
  ip_addr          fhost;           
  unsigned short              NumBytes;        
  unsigned short              BufferSize;      
  unsigned short              UseCnt;          
} IP_PACKET;

typedef struct IP_PHY_CONTEXT IP_PHY_CONTEXT;

typedef struct {
  unsigned (*pfRead)         (IP_PHY_CONTEXT* pContext, unsigned RegIndex);
  void     (*pfWrite)        (IP_PHY_CONTEXT* pContext, unsigned RegIndex, unsigned  val);
} IP_PHY_ACCESS;

struct IP_PHY_CONTEXT {
  const IP_PHY_ACCESS * pAccess;
  void * pContext;   
  unsigned char   Addr;
  unsigned char   UseRMII;      
  unsigned short  Anar;         
  unsigned short  Bmcr;         
};

typedef struct {
  int   (*pfInit)         (IP_PHY_CONTEXT * pContext);
  void  (*pfGetLinkState) (IP_PHY_CONTEXT * pContext, unsigned long * pDuplex, unsigned long * pSpeed);
} IP_PHY_DRIVER;

extern const IP_PHY_DRIVER IP_PHY_Generic;

typedef struct {
  int   (*pfInit)         (unsigned Unit);
  int   (*pfSendPacket)   (unsigned Unit);
  int   (*pfGetPacketSize)(unsigned Unit);                                   
  int   (*pfReadPacket)   (unsigned Unit, unsigned char * pDest, unsigned NumBytes);    
  void  (*pfTimer)        (unsigned Unit);                                   
  int   (*pfControl)      (unsigned Unit, int Cmd, void * p);                
} IP_HW_DRIVER;


typedef struct {
  unsigned NumAddr;
  const unsigned char * pHWAddr;                
} IP_NI_CMD_SET_FILTER_DATA;






 
#line 271 "IP\\IP.h"





 
#line 285 "IP\\IP.h"


void IP_NI_ClrBPressure  (unsigned Unit);
void IP_NI_SetBPressure  (unsigned Unit);






 
extern const IP_HW_DRIVER IP_Driver_AT32AP7000;
extern const IP_HW_DRIVER IP_Driver_AT91RM9200;
extern const IP_HW_DRIVER IP_Driver_CAP9;
extern const IP_HW_DRIVER IP_Driver_DM9000;
extern const IP_HW_DRIVER IP_Driver_LAN9115;
extern const IP_HW_DRIVER IP_Driver_LPC17xx;
extern const IP_HW_DRIVER IP_Driver_LPC24xx;
extern const IP_HW_DRIVER IP_Driver_LPC32xx;
extern const IP_HW_DRIVER IP_Driver_SAM7X;
extern const IP_HW_DRIVER IP_Driver_SAM9260;
extern const IP_HW_DRIVER IP_Driver_SAM9263;
extern const IP_HW_DRIVER IP_Driver_SAM9XE;
extern const IP_HW_DRIVER IP_Driver_STR912;
extern const IP_HW_DRIVER IP_Driver_NIOSII_MaCo;
extern const IP_HW_DRIVER IP_Driver_GMACII;
extern const IP_HW_DRIVER IP_Driver_MCF5329;
extern const IP_HW_DRIVER IP_Driver_MCF5223x;
extern const IP_HW_DRIVER IP_Driver_H8S2472;
extern const IP_HW_DRIVER IP_Driver_LAN9118;
extern const IP_HW_DRIVER IP_Driver_LAN91C111;
extern const IP_HW_DRIVER IP_Driver_LM3S6965;
extern const IP_HW_DRIVER IP_Driver_LM3S9B90;
extern const IP_HW_DRIVER IP_Driver_SH7670;

void IP_NI_AT32AP7000_ConfigNumRxBuffers(unsigned short NumRxBuffers);
void IP_NI_AT91RM9200_ConfigNumRxBuffers(unsigned short NumRxBuffers);
void IP_NI_SAM7X_ConfigNumRxBuffers     (unsigned short NumRxBuffers);
void IP_NI_SAM9260_ConfigNumRxBuffers   (unsigned short NumRxBuffers);
void IP_NI_SAM9263_ConfigNumRxBuffers   (unsigned short NumRxBuffers);
void IP_NI_SAM9XE_ConfigNumRxBuffers    (unsigned short NumRxBuffers);
void IP_NI_CAP9_ConfigNumRxBuffers      (unsigned short NumRxBuffers);

typedef struct IP_NI_DM9000_ACCESS  IP_NI_DM9000_ACCESS;
typedef struct DM9000_INST DM9000_INST;

struct DM9000_INST {
  unsigned char *  pHardware;
  unsigned char *  pValue;
  unsigned char    BusWidth;    
  IP_NI_DM9000_ACCESS* pAccess;
};

struct IP_NI_DM9000_ACCESS {
  void (*pf_WriteReg8)    (DM9000_INST * pInst, unsigned RegIndex,  unsigned  val);
  unsigned short  (*pf_ReadReg8)     (DM9000_INST * pInst, unsigned RegIndex);
  void (*pf_ReadData)     (DM9000_INST * pInst, unsigned char*   pDest, unsigned long NumBytes);
  void (*pf_WriteData)    (DM9000_INST * pInst, void* pPacket, unsigned long NumBytes);
};

void IP_NI_DM9000_ISR_Handler (unsigned Unit);
void IP_NI_DM9000_ConfigAddr  (unsigned Unit, void* pBase, void* pValue);
void IP_NI_DM9000_ConfigAccess(unsigned Unit, IP_NI_DM9000_ACCESS * pAccess);

void IP_NI_LAN91C111_ISR_Handler(unsigned Unit);
void IP_NI_LAN91C111_ConfigAddr (unsigned Unit, void* pBase);

void IP_NI_LAN9115_ISR_Handler   (unsigned Unit);
void IP_NI_LAN9115_ConfigBaseAddr(unsigned Unit, void* pBase);

void IP_NI_NIOSII_MaCo_ConfigNumRxBuffers(unsigned Unit, unsigned short NumRxBuffers);
void IP_NI_NIOSII_MaCo_ConfigBaseAddr    (unsigned Unit, void* pBase, unsigned IrqNumber);

void IP_NI_GMACII_ConfigBaseAddr(unsigned Unit, void* pBase, unsigned IrqNumber);




 






void IP_NI_ConfigPHYAddr (unsigned Unit, unsigned char Addr);          
void IP_NI_ConfigPHYMode (unsigned Unit, unsigned char Mode);          
void IP_NI_ConfigPoll    (unsigned Unit);
void IP_NI_SetError      (unsigned Unit);
int  IP_NI_SetTxBufferSize(unsigned Unit, unsigned NumBytes);





 
void IP_Task(void);
void IP_RxTask(void);
void IP_ShellServer(void);


typedef int (IP_RX_HOOK)(IP_PACKET * pPacket);




 
void IP_AddBuffers                (int NumBuffers, int BytesPerBuffer);
void IP_AddEtherInterface         (const IP_HW_DRIVER *pDriver);
void IP_AllowBackPressure         (char v);
void IP_AssignMemory              (unsigned long * pMem, unsigned long NumBytes);
void IP_ConfTCPSpace              (unsigned SendSpace, unsigned RecvSpace);  
void IP_Exec                      (void);
void IP_GetAddrMask               (unsigned char IFace, unsigned long * pAddr, unsigned long * pMask);
int  IP_GetCurrentLinkSpeed       (void);
unsigned long  IP_GetGWAddr                 (unsigned char IFace);
void IP_GetHWAddr                 (unsigned char IFace, unsigned char * pDest, unsigned Len);
unsigned long  IP_GetIPAddr                 (unsigned char IFace);
const char * IP_GetIPPacketInfo   (IP_PACKET * pPacket);
int  IP_GetVersion                (void);                   
void IP_ICMP_SetRxHook            (IP_RX_HOOK * pfRxHook);
int  IP_IFaceIsReady              (void);
void IP_Init                      (void);
int  IP_NI_GetCaps                (unsigned Unit);
int  IP_NI_LoadHWAddr             (unsigned Unit);
void IP_Panic                     (const char * sError);
void IP_SetAddrMask               (unsigned long Addr, unsigned long Mask);
int  IP_SetCurrentLinkState       (unsigned long Duplex, unsigned long Speed);  
void IP_SetDefaultTTL             (int v);
void IP_SetGWAddr                 (unsigned char IFace, unsigned long GWAddr);
void IP_SetHWAddr                 (const unsigned char * pHWAddr);
void IP_SetMTU                    (unsigned char IFace, unsigned long Mtu);
int  IP_SendPacket                (unsigned IFace, void * pData, int NumBytes);
int  IP_SendPing                  (ip_addr, char* pData, unsigned NumBytes, unsigned short SeqNo);
void IP_SetRxHook                 (IP_RX_HOOK * pfRxHook);
void IP_SOCKET_SetDefaultOptions  (unsigned short v);
void IP_SOCKET_SetLimit           (unsigned Limit);
void IP_TCP_Set2MSLDelay          (unsigned v);
void IP_TCP_SetConnKeepaliveOpt   (unsigned long Init, unsigned long Idle, unsigned long Period, unsigned long Cnt);
void IP_TCP_SetRetransDelayRange  (unsigned RetransDelayMin, unsigned RetransDelayMax);
void IP_X_Config                  (void);




 
void IP_Log           (const char * s);
void IP_Warn          (const char * s);
void IP_SetLogFilter  (unsigned long FilterMask);
void IP_SetWarnFilter (unsigned long FilterMask);
void IP_AddLogFilter  (unsigned long FilterMask);
void IP_AddWarnFilter (unsigned long FilterMask);







 

struct hostent {
  char *  h_name;        
  char ** h_aliases;     
  int     h_addrtype;    
  int     h_length;      
  char ** h_addr_list;   
#line 459 "IP\\IP.h"
};


struct hostent * gethostbyname (char * name);
int              IP_ResolveHost(char * host, ip_addr *   address,  int   flags);
void             IP_DNS_SetServer (unsigned long DNSServerAddr);
unsigned long              IP_DNS_GetServer (void);
int              IP_DNS_SetServerEx (unsigned char IFace, unsigned char DNSServer, const unsigned char * pDNSAddr, int AddrLen);
void             IP_DNS_GetServerEx (unsigned char IFace, unsigned char DNSServer, unsigned char * pDNSAddr, int * pAddrLen);
char           * IP_ParseIPAddr(ip_addr * ipout,  unsigned *  sbits, char *   stringin);
void             IP_DNSC_SetMaxTTL(unsigned long TTL);







 
signed long  IP_BringInBounds(signed long v, signed long Min, signed long Max);
unsigned long  IP_LoadU32BE(const unsigned char * pData);
unsigned long  IP_LoadU32LE(const unsigned char * pData);
unsigned long  IP_LoadU32TE(const unsigned char * pData);
unsigned long  IP_LoadU16BE(const unsigned char * pData);
unsigned long  IP_LoadU16LE(const unsigned char * pData);
void IP_StoreU32BE(unsigned char * p, unsigned long v);
void IP_StoreU32LE(unsigned char * p, unsigned long v);

char IP_tolower(char c);
char IP_isalpha(char c);
char IP_isalnum(char c);
int  IP_PrintIPAddr(char * pDest, unsigned long IPAddr, int BufferSize);






 
typedef  struct udp_conn * UDPCONN;
typedef  unsigned long IP_ADDR;





typedef UDPCONN IP_UDP_CONN;

IP_UDP_CONN IP_UDP_Open(IP_ADDR IPAddr, unsigned short fport, unsigned short lport, int(*)(IP_PACKET *, void * pContext) , void * pContext);
void        IP_UDP_Close(IP_UDP_CONN);
IP_PACKET * IP_UDP_Alloc(int NumBytes);
int         IP_UDP_Send       (int IFace, IP_ADDR FHost, unsigned short fport, unsigned short lport, IP_PACKET * pPacket);
int         IP_UDP_SendAndFree(int IFace, IP_ADDR FHost, unsigned short fport, unsigned short lport, IP_PACKET * pPacket);
void        IP_UDP_Free       (IP_PACKET * pPacket);
unsigned short         IP_UDP_FindFreePort(void);
unsigned short         IP_UDP_GetLPort  (const IP_PACKET *pPacket);
void *      IP_UDP_GetDataPtr(const IP_PACKET *pPacket);
void        IP_UDP_GetSrcAddr(const IP_PACKET *pPacket, void * pSrcAddr, int AddrLen);

void        IP_UDP_EnableRxChecksum(void);
void        IP_UDP_DisableRxChecksum(void);
void        IP_UDP_EnableTxChecksum(void);
void        IP_UDP_DisableTxChecksum(void);





 
IP_PACKET * IP_TCP_Alloc      (int datasize);
void        IP_TCP_Free       (        IP_PACKET * pPacket);
int         IP_TCP_Send       (long s, IP_PACKET * pPacket);
int         IP_TCP_SendAndFree(long s, IP_PACKET * pPacket);






 
void     IP_DHCPC_Activate   (int IFIndex, const char *sHost, const char *sDomain, const char *sVendor);
unsigned IP_DHCPC_GetState   (int IFIndex);
void     IP_DHCPC_Halt       (int IFIndex);
void     IP_DHCPC_SetCallback(int IFIndex, int (*routine)(int,int) );
void     IP_DHCPC_SetClientId(int IFIndex, const char *sClientId);







 
int IP_ShowARP       (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowICMP      (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowTCP       (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowBSDConn   (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowBSDSend   (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowBSDRcv    (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowMBuf      (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowMBufList  (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowSocketList(void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowStat      (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowUDP       (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowUDPSockets(void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowDHCPClient(void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowDNS       (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);
int IP_ShowDNS1      (void (*pfSendf)(void * pContext, const char * sFormat, ...), void * pContext);


typedef struct {
  long Socket;
  char * pBuffer;
  int BufferSize;
} IP_SENDF_CONTEXT;

void IP_Sendf(void * pContext, const char * sFormat, ...);





 



typedef void * IP_CONNECTION_HANDLE;
typedef struct {
  void * pSock;
  long hSock;
  unsigned long  ForeignAddr;
  unsigned long  LocalAddr;
  unsigned short  ForeignPort;
  unsigned short  LocalPort;
  unsigned char   Type;
  unsigned char   TcpState;
  unsigned short  TcpMtu;
  unsigned short  TcpMss;
  unsigned long  TcpRetransDelay;
  unsigned long  TcpIdleTime;
  unsigned long  RxWindowCur;
  unsigned long  RxWindowMax;
  unsigned long  TxWindow;
} IP_CONNECTION;

int IP_INFO_GetConnectionList(IP_CONNECTION_HANDLE *pDest, int MaxItems);
int IP_INFO_GetConnectionInfo(IP_CONNECTION_HANDLE h, IP_CONNECTION * p);
const char * IP_INFO_ConnectionType2String(unsigned char Type);
const char * IP_INFO_ConnectionState2String(unsigned char State);









#line 24 "GUI\\GUI_VNC_X_StartServer.c"
#line 1 "OS\\RTOS.H"
















 









 

#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"


  
  typedef unsigned int size_t;








extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 185 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 201 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 224 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 239 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 262 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 494 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"



 

#line 30 "OS\\RTOS.H"






 

#line 50 "OS\\RTOS.H"

 






 











 





 




  typedef void    OS_ISR_HANDLER(void);
  void            OS_irq_handler(void);      
  void            OS_IRQ_SERVICE(void);      
  void            OS_USER_irq_func(void);    
  OS_ISR_HANDLER* OS_ARM_InstallISRHandler (int ISRIndex, OS_ISR_HANDLER* pFunc);
  void            OS_ARM_EnableISR         (int ISRIndex);
  void            OS_ARM_DisableISR        (int ISRIndex);
  int             OS_ARM_ISRSetPrio        (int ISRIndex, int Prio);
  void            OS_ARM_AssignISRSource   (int ISRIndex, int Source);
  void            OS_ARM_EnableISRSource   (int SourceIndex);
  void            OS_ARM_DisableISRSource  (int SourceIndex);
  void            OS_StartTask             (void);
  void            OS_InitPLL               (void);




 

 
  
extern const struct OS_EXTEND_TASK_CONTEXT OS_VFP_ExtendContext;

 

void OS_ARM_ICACHE_Enable(void);
void OS_ARM_DCACHE_Enable(void);
void OS_ARM_DCACHE_CleanRange     (void* p, unsigned int NumBytes);
void OS_ARM_DCACHE_InvalidateRange(void* p, unsigned int NumBytes);
void OS_ARM_CACHE_Sync(void);

void OS_ARM_MMU_Enable(unsigned int* pTranslationTable);
void OS_ARM_MMU_InitTT(unsigned int* pTranslationTable);
void OS_ARM_MMU_AddTTEntries(unsigned int* pTranslationTable, unsigned int CacheMode, unsigned int VIndex, unsigned int PIndex, unsigned int NumEntries);

void OS_ARM720_CACHE_Enable(void);
void OS_ARM720_CACHE_CleanRange(void* p, unsigned int NumBytes);
void OS_ARM720_CACHE_InvalidateRange(void* p, unsigned int NumBytes);

void OS_ARM720_MMU_Enable(unsigned int* pTranslationTable);
void OS_ARM720_MMU_InitTT(unsigned int* pTranslationTable);
void OS_ARM720_MMU_AddTTEntries(unsigned int* pTranslationTable, unsigned int CacheMode, unsigned int VIndex, unsigned int PIndex, unsigned int NumEntries);














 










 






















 








 

#line 1 "Config\\OS_Config.h"












 

















 





#line 43 "Config\\OS_Config.h"



 
#line 187 "OS\\RTOS.H"















 



 
#line 213 "OS\\RTOS.H"

#line 283 "OS\\RTOS.H"












 






 

#line 310 "OS\\RTOS.H"































































 










































#line 423 "OS\\RTOS.H"






















 

#line 453 "OS\\RTOS.H"

#line 460 "OS\\RTOS.H"






 

































 


















 

 

 




 
 


 


 





 







 


 




 



 
#line 569 "OS\\RTOS.H"









 
#line 586 "OS\\RTOS.H"

 


 
#line 597 "OS\\RTOS.H"

 



 


 




 




 


 


 












 





 
#line 651 "OS\\RTOS.H"

 





 
#line 669 "OS\\RTOS.H"

#line 676 "OS\\RTOS.H"






 
#line 689 "OS\\RTOS.H"

 
#line 699 "OS\\RTOS.H"

 
#line 708 "OS\\RTOS.H"

 




 














 


















 





#line 761 "OS\\RTOS.H"

 

































 

typedef struct OS_TASK         OS_TASK;
typedef struct OS_WAIT_LIST    OS_WAIT_LIST;
typedef struct OS_WAIT_OBJ     OS_WAIT_OBJ;
typedef struct OS_WAIT_OBJ_EX  OS_WAIT_OBJ_EX;
typedef struct OS_REGS         OS_REGS;

typedef void voidRoutine(void);
typedef void OS_RX_CALLBACK(unsigned char Data);
typedef void OS_TIMERROUTINE(void);
typedef void OS_TIMER_EX_ROUTINE(void *);
typedef void OS_ON_TERMINATE_FUNC(OS_TASK *);

typedef void OS_TICK_HOOK_ROUTINE(void);






 
struct OS_WAIT_OBJ {
  OS_WAIT_LIST * pWaitList;
};

struct OS_WAIT_OBJ_EX {
  OS_WAIT_OBJ WaitObj;
  int v;
};

struct OS_WAIT_LIST {
  OS_WAIT_LIST * pNext;     
  OS_WAIT_LIST * pPrev;
  OS_WAIT_OBJ  * pWaitObj;
  OS_TASK      * pTask;
};










 
typedef struct OS_EXTEND_TASK_CONTEXT {
  void (*pfSave)   (      void * pStack);
  void (*pfRestore)(const void * pStack);
} OS_EXTEND_TASK_CONTEXT;









 
struct OS_TASK {
  
  
  
  
  OS_TASK * pNext;                        
  OS_REGS  * pStack;           
  
  OS_WAIT_LIST * pWaitList;               
  int        Timeout;
  unsigned char          Priority;
  unsigned char          Stat;
  unsigned char          Events;                  
  unsigned char          EventMask;               
  
  
  

    OS_TASK      * pPrev;                   

  
  
  

    const char * Name;

  
  
  




  
  
  




  
  
  





  
  
  

    unsigned char  TimeSliceRem;
    unsigned char  TimeSliceReload;

  
  
  

    const OS_EXTEND_TASK_CONTEXT * pExtendContext;

  
  
  



  
  
  



};




 
typedef struct OS_timer OS_TIMER;
struct OS_timer {
  OS_TIMER * pNext;
  voidRoutine* Hook;
  int Time;
  int Period;
  char    Active;



};




 
typedef struct {
  OS_TIMER Timer;
  OS_TIMER_EX_ROUTINE * pfUser;
  void * pData;
} OS_TIMER_EX;




 
typedef struct OS_TICK_HOOK OS_TICK_HOOK;
struct OS_TICK_HOOK {
  OS_TICK_HOOK*          pNext;
  OS_TICK_HOOK_ROUTINE * pfUser;
};




 
typedef struct OS_RSEMA OS_RSEMA;
struct OS_RSEMA {
  OS_WAIT_OBJ WaitObj;
  OS_TASK * pTask;                 
  unsigned char UseCnt;
  OS_RSEMA * pNext;



};




 
typedef struct OS_CSEMA OS_CSEMA;
struct OS_CSEMA {
  OS_WAIT_OBJ WaitObj;
  unsigned int Cnt;




};




 
typedef struct OS_MAILBOX OS_MAILBOX;
struct OS_MAILBOX {
  OS_WAIT_OBJ WaitObj;



  char *pData;
  unsigned int nofMsg;
  unsigned int maxMsg;
  unsigned int iRd;
  unsigned char  sizeofMsg;



};




 
typedef struct OS_Q OS_Q;
struct OS_Q {
  OS_WAIT_OBJ WaitObj;
  OS_Q*    pNext;           
  unsigned char*   pData;
  unsigned int  Size;
  unsigned int  MsgCnt;
  unsigned int  offFirst;
  unsigned int  offLast;



};




 






typedef struct OS_MEMF OS_MEMF;
struct OS_MEMF {
  OS_WAIT_OBJ WaitObj;
  OS_MEMF* pNext;           
  void*    pPool;
  unsigned short   NumBlocks;
  unsigned short   BlockSize;
  unsigned short   NumFreeBlocks;
  unsigned short   MaxUsed;
  void*    pFree;




};




 
typedef struct  OS_EVENT OS_EVENT;

struct OS_EVENT {
  OS_WAIT_OBJ WaitObj;
  unsigned char       Signaled;



};




 
typedef struct {
  unsigned int  Time;
  void    *pCurrentTask;
  void    *p;
  unsigned int  v;
  unsigned char   iRout;
} OS_TRACE_ENTRY;







 




 
#line 1107 "OS\\RTOS.H"

 

 




 

typedef union {
  int Dummy;            
  struct {
    unsigned char Region;
    unsigned char DI;
  } Cnt;
} OS_COUNTERS;



  extern   volatile int OS_Time;
  extern   int         OS_TimeDex;
  extern   OS_COUNTERS OS_Counters;

  extern   unsigned char  OS_IntMSInc;
  extern   unsigned char  OS_Pending;
  extern   volatile unsigned char  OS_Status;


    extern   unsigned char  OS_TimeSlice;
    extern   unsigned char  OS_TimeSliceAtStart;





  extern         unsigned int OS_TicksPerMS;
  extern         int     OS_IntTicksInc;
#line 1154 "OS\\RTOS.H"


    extern  unsigned char OS_POWER_Levels[(5)];


  



 

    extern   OS_TASK      * OS_pTask;              
    extern   OS_TASK      * OS_pCurrentTask;       
    extern   OS_TASK volatile * volatile OS_pActiveTask;
    extern   OS_TIMER     * OS_pTimer;             
    extern   OS_TIMER     * OS_pCurrentTimer;      
    extern  OS_RSEMA      * OS_pRSema;
#line 1177 "OS\\RTOS.H"
    extern    OS_MEMF      * OS_pMEMF;             
    extern    OS_TICK_HOOK * OS_pTickHook;         
#line 1196 "OS\\RTOS.H"

#line 1269 "OS\\RTOS.H"

 




 








 






#line 1311 "OS\\RTOS.H"

#line 1334 "OS\\RTOS.H"





 












void OS_CreateTask_R  ( OS_TASK * pTask,
                      const char*Name,
                      unsigned char Priority,
                      void (*pRoutine)(void),
                      void  *pStack,
                      unsigned int StackSize
                      ,unsigned int TimeSlice
        );
void OS_CreateTaskEx_R  ( OS_TASK * pTask,
                        const char*Name,
                        unsigned char Priority,
                        void (*pRoutine)(void *),
                        void  *pStack,
                        unsigned int StackSize
                        ,unsigned int TimeSlice,
                        void * pContext
        );

void OS_ExtendTaskContext(const OS_EXTEND_TASK_CONTEXT * pExtendContext);






 

void  OS_Delay(int ms);                 
void  OS_DelayUntil(int t);             
unsigned char OS_GetSuspendCnt  (OS_TASK* pTask);   
void  OS_GetState       (OS_TASK* pTask);
char  OS_IsTask         (OS_TASK* pTask);   
void  OS_Resume         (OS_TASK* pTask);   
void  OS_SetTaskName    (OS_TASK * pTask, const char* s);
void  OS_SetPriority    (OS_TASK* pTask, unsigned char Prio);  
void  OS_Suspend        (OS_TASK* pTask);   
void  OS_Terminate      (OS_TASK* pTask);   
void  OS_TerminateError (void);             
void  OS_WakeTask       (OS_TASK* pTask);   
void  OS_Yield          (void);             












 

const char* OS_GetCPU(void);
const char* OS_GetLibMode(void);
const char* OS_GetModel(void);
const char* OS_GetLibName(void);

unsigned int OS_GetVersion(void);










  const char* OS_GetTaskName(OS_TASK *);




#line 1440 "OS\\RTOS.H"

unsigned int OS_GetSysStackBase(void);   
unsigned int OS_GetSysStackSize(void);   
unsigned int OS_GetIntStackBase(void);   
unsigned int OS_GetIntStackSize(void);   


  unsigned char OS_SetTimeSlice(OS_TASK * pTask, unsigned char TimeSlice);
  unsigned char OS_GetTimeSliceRem(OS_TASK  * pTask);






unsigned char    OS_GetPriority(OS_TASK * pTask);   


int     OS_GetNumTasks(void);               

OS_TASK* OS_TaskIndex2Ptr(int TaskIndex);   

#line 1475 "OS\\RTOS.H"


#line 1484 "OS\\RTOS.H"






 

int OS_WAIT_OBJ_GetSize(void);
int OS_WAIT_OBJ_EX_GetSize(void);
int OS_WAIT_LIST_GetSize(void);
int OS_EXTEND_TASK_CONTEXT_GetSize(void);
int OS_TASK_GetSize(void);
int OS_REGS_GetSize(void);
int OS_TIMER_GetSize(void);
int OS_TIMER_EX_GetSize(void);
int OS_TICK_HOOK_GetSize(void);
int OS_RSEMA_GetSize(void);
int OS_CSEMA_GetSize(void);
int OS_MAILBOX_GetSize(void);
int OS_Q_GetSize(void);
int OS_MEMF_GetSize(void);
int OS_EVENT_GetSize(void);
int OS_TRACE_ENTRY_GetSize(void);






 


void OS_LeaveRegion(void);





 

#line 1535 "OS\\RTOS.H"

#line 1543 "OS\\RTOS.H"






 




void OS_RestoreI(void);   






 










#line 1589 "OS\\RTOS.H"

#line 1597 "OS\\RTOS.H"


void OS_CallISR        (void (*pRoutine)(void));
void OS_CallNestableISR(void (*pRoutine)(void));


#line 1610 "OS\\RTOS.H"



















#line 1638 "OS\\RTOS.H"







#line 1651 "OS\\RTOS.H"

#line 1659 "OS\\RTOS.H"

#line 1666 "OS\\RTOS.H"







#line 1681 "OS\\RTOS.H"

#line 1690 "OS\\RTOS.H"











void OS_SetFastIntPriorityLimit(unsigned int Priority);






 

int      OS_Use             (OS_RSEMA * pRSema);  
void     OS_Unuse           (OS_RSEMA * pRSema);  
char     OS_Request         (OS_RSEMA * pRSema);  
int      OS_GetSemaValue    (OS_RSEMA * pRSema);  
OS_TASK* OS_GetResourceOwner(OS_RSEMA * pRSema);  

void     OS_CreateRSema     (OS_RSEMA * pRSema);  
void     OS_DeleteRSema     (OS_RSEMA * pRSema);  








 

void  OS_CreateCSema    (OS_CSEMA * pCSema, unsigned int InitValue);   
void  OS_DeleteCSema    (OS_CSEMA * pCSema);                      
int   OS_GetCSemaValue  (OS_CSEMA * pCSema);                      
unsigned char OS_SetCSemaValue  (OS_CSEMA * pCSema, unsigned int value);       
void  OS_SignalCSema    (OS_CSEMA * pCSema);                      
void  OS_SignalCSemaMax (OS_CSEMA * pCSema, unsigned int MaxValue);    
void  OS_WaitCSema      (OS_CSEMA * pCSema);                      
int   OS_WaitCSemaTimed (OS_CSEMA * pCSema, int TimeOut);     
char  OS_CSemaRequest   (OS_CSEMA * pCSema);                      








 

void OS_CreateMB          (OS_MAILBOX * pMB, unsigned char sizeofMsg, unsigned int maxnofMsg, void* Buffer);     
void OS_ClearMB           (OS_MAILBOX * pMB);
void OS_PutMail           (OS_MAILBOX * pMB, void* pMail);
char OS_PutMailCond       (OS_MAILBOX * pMB, void* pMail);
void OS_PutMailFront      (OS_MAILBOX * pMB, void* pMail);
char OS_PutMailFrontCond  (OS_MAILBOX * pMB, void* pMail);
void OS_GetMail           (OS_MAILBOX * pMB, void* pDest);
char OS_GetMailCond       (OS_MAILBOX * pMB, void* pDest);
void OS_PutMail1          (OS_MAILBOX * pMB, const char* pMail);
char OS_PutMailCond1      (OS_MAILBOX * pMB, const char* pMail);
void OS_PutMailFront1     (OS_MAILBOX * pMB, const char* pMail);
char OS_PutMailFrontCond1 (OS_MAILBOX * pMB, const char* pMail);
void OS_GetMail1          (OS_MAILBOX * pMB, char* pDest);
char OS_GetMailCond1      (OS_MAILBOX * pMB, char* pDest);
char OS_GetMailTimed      (OS_MAILBOX * pMB, void* pDest, int Timeout);
void OS_DeleteMB          (OS_MAILBOX * pMB);
void OS_WaitMail          (OS_MAILBOX * pMB);












 

void    OS_Q_Create       (OS_Q* pQ, void*pData, unsigned int Size);
void    OS_Q_Clear        (OS_Q* pQ);                                 
int     OS_Q_GetMessageCnt(OS_Q* pQ);                                 
int     OS_Q_Put          (OS_Q* pQ, const void* pSrc, unsigned int Size);
int     OS_Q_GetPtr       (OS_Q* pQ, void**ppData);
int     OS_Q_GetPtrCond   (OS_Q* pQ, void**ppData);                   
int     OS_Q_GetPtrTimed  (OS_Q* pQ, void**ppData, int Timeout);  
void    OS_Q_Purge        (OS_Q* pQ);






 

char OS_ClearEvents          (OS_TASK * pTask);                  
char OS_GetEventsOccured     (OS_TASK * pTask);                  
void OS_SignalEvent          (char Event, OS_TASK * pTask);      
char OS_WaitEvent            (char EventMask);                   
char OS_WaitEventTimed       (char EventMask, int TimeOut);  
char OS_WaitSingleEvent      (char EventMask);                   
char OS_WaitSingleEventTimed (char EventMask, int TimeOut);  






 

#line 1818 "OS\\RTOS.H"

void    OS_CreateTimer    (OS_TIMER * pTimer, OS_TIMERROUTINE* Callback, int Timeout);
void    OS_RetriggerTimer (OS_TIMER * pTimer);
void    OS_StartTimer     (OS_TIMER * pTimer);
void    OS_StopTimer      (OS_TIMER * pTimer);
void    OS_DeleteTimer    (OS_TIMER * pTimer);                   
int OS_GetTimerPeriod (OS_TIMER * pTimer);                   
unsigned char   OS_GetTimerStatus (OS_TIMER * pTimer);                   
int OS_GetTimerValue  (OS_TIMER * pTimer);                   
void    OS_SetTimerPeriod (OS_TIMER * pTimer, int Period);   










 
void    OS_CreateTimerEx (OS_TIMER_EX * pTimerEx, OS_TIMER_EX_ROUTINE* Callback, int Timeout, void * pData);

#line 1849 "OS\\RTOS.H"















 


  void* OS_malloc(unsigned int);
  void  OS_free  (void* pMemBlock);
  void* OS_realloc  (void* pMemBlock, unsigned NewSize);







 

void  OS_MEMF_Create(OS_MEMF* pMEMF, void* pPool, unsigned short NumBlocks, unsigned short BlockSize);
void  OS_MEMF_Delete(OS_MEMF* pMEMF);
void* OS_MEMF_Alloc(OS_MEMF* pMEMF, int Purpose);
void* OS_MEMF_AllocTimed(OS_MEMF* pMEMF, int Timeout, int Purpose);
void* OS_MEMF_Request(OS_MEMF* pMEMF, int Purpose);
void  OS_MEMF_Release(OS_MEMF* pMEMF, void* pMemBlock);
void  OS_MEMF_FreeBlock(void* pMemBlock);
int   OS_MEMF_GetNumFreeBlocks(OS_MEMF* pMEMF);
char  OS_MEMF_IsInPool(OS_MEMF* pMEMF, void* pMemBlock);
int   OS_MEMF_GetMaxUsed(OS_MEMF* pMEMF);
int   OS_MEMF_GetNumBlocks(OS_MEMF* pMEMF);
int   OS_MEMF_GetBlockSize(OS_MEMF* pMEMF);






 

 

void  OS_EVENT_Create    (OS_EVENT* pEvent);
void  OS_EVENT_Delete    (OS_EVENT* pEvent);

unsigned char OS_EVENT_Get       (OS_EVENT* pEvent);
void  OS_EVENT_Pulse     (OS_EVENT* pEvent);
void  OS_EVENT_Reset     (OS_EVENT* pEvent);
void  OS_EVENT_Set       (OS_EVENT* pEvent);
void  OS_EVENT_Wait      (OS_EVENT* pEvent);
char  OS_EVENT_WaitTimed (OS_EVENT* pEvent, int Timeout);









 


void    OS_Timing_Start(unsigned int* pCycle);
void    OS_Timing_End(unsigned int* pCycle);
unsigned int  OS_Timing_Getus(unsigned int* pCycle);








 
#line 1943 "OS\\RTOS.H"

void    OS_POWER_UsageInc(unsigned int Level);
void    OS_POWER_UsageDec(unsigned int Level);
unsigned int OS_POWER_GetMask(void);







 
#line 1962 "OS\\RTOS.H"






 



















 

#line 2022 "OS\\RTOS.H"
   
#line 2036 "OS\\RTOS.H"
   
   






#line 2052 "OS\\RTOS.H"









 

 
void   OS_InitHW(void);
void   OS_Idle(void);
unsigned int OS_ConvertCycles2us(unsigned int Cycles);
unsigned int OS_GetTime_Cycles(void);
void   OS_COM_Init(void);
void   OS_COM_Send1(unsigned char c);

 
void   OS_Error(int code);

 void  OS_Start(void);                   
 void  OS_Switch(void);                  
 int   OS_SwitchFromInt(void);           

void  OS_InitKern(void);              
unsigned char OS_OnTx(void);                  
void  OS_OnRx(unsigned char c);       
void  OS_Send1(unsigned char c);              
void  OS_SendString(const char* s);   
OS_RX_CALLBACK* OS_SetRxCallback(OS_RX_CALLBACK* cb);
unsigned char OS_EvaPacketEx(const unsigned char * pSrc, unsigned short SrcLen, unsigned char** pReturn);   

void  OS_COM_ClearTxActive(void);     









 




 
#line 2112 "OS\\RTOS.H"

void OS__di(void);
void OS__ei(void);
void OS__SaveIPL(void);
void OS__RestIPL(void);
void OS_SIM_Init(void);

 
void OS_HandleTick(void);        
void OS_HandleTickDI(void);      

 
 
void OS_HandleTick_Ex(void);     
void OS_HandleTickDI_Ex(void);   

void OS_AddTickHook(OS_TICK_HOOK* pHook, OS_TICK_HOOK_ROUTINE * pfUser);
void OS_RemoveTickHook(OS_TICK_HOOK* pHook);

 
void OS_SetIntFreq(unsigned int f);
void OS_Exit(int code);
void OS_UseDos(void);
void OS_UnuseDos(void);
int  OS_GetKey(void);
int  OS_WaitKey(void);

 





 







 

#line 25 "GUI\\GUI_VNC_X_StartServer.c"
#line 1 "GUI\\GUI.h"















 




#line 1 "GUI\\GUI_ConfDefaults.h"



















 




#line 1 "Config\\GUIConf.h"















 







 





 





 
#line 46 "Config\\GUIConf.h"




 




 
#line 26 "GUI\\GUI_ConfDefaults.h"

#line 34 "GUI\\GUI_ConfDefaults.h"









#line 52 "GUI\\GUI_ConfDefaults.h"

#line 59 "GUI\\GUI_ConfDefaults.h"






 




 
#line 77 "GUI\\GUI_ConfDefaults.h"




 








































#line 129 "GUI\\GUI_ConfDefaults.h"

































 
#line 170 "GUI\\GUI_ConfDefaults.h"

 





 
#line 185 "GUI\\GUI_ConfDefaults.h"












 
#line 22 "GUI\\GUI.h"
#line 1 "GUI\\GUI_Type.h"



















 




#line 1 "GUI\\LCD.h"















 




#line 22 "GUI\\LCD.h"
#line 23 "GUI\\LCD.h"















 












 








 







 








 
typedef int LCD_DRAWMODE;
typedef unsigned long LCD_COLOR;
 



 
typedef struct { signed short x,y; } GUI_POINT;
typedef struct { signed short x0,y0,x1,y1; } LCD_RECT;

typedef struct {
  int              NumEntries; 
  char             HasTrans;         
  const LCD_COLOR  * pPalEntries; 
} LCD_LOGPALETTE; 

 
typedef struct {
  int x,y;
  unsigned char KeyStat;
} LCD_tMouseState;

typedef struct {
  int               NumEntries; 
  const LCD_COLOR * pPalEntries; 
} LCD_PHYSPALETTE; 




 
typedef LCD_COLOR      tLCDDEV_Index2Color  (unsigned Index);
typedef unsigned int   tLCDDEV_Color2Index  (LCD_COLOR Color);
typedef unsigned int   tLCDDEV_GetIndexMask (void);




 
typedef struct {
  tLCDDEV_Color2Index  * pfColor2Index;
  tLCDDEV_Index2Color  * pfIndex2Color;
  tLCDDEV_GetIndexMask * pfGetIndexMask;
} LCD_API_COLOR_CONV;

extern const LCD_API_COLOR_CONV LCD_API_ColorConv_0;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_2;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M2;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_4;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M4;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_5;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_111;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_222;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_233;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_323;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_332;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_12;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_12_1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_444_16;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_555;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_565;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_556;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_655;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_666;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_822216;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_84444;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8666;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8666_1;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_888;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_8888;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M111;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M222;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M233;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M323;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M332;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_12;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M444_16;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M555;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M565;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M556;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M655;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M666;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8565;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M888;
extern const LCD_API_COLOR_CONV LCD_API_ColorConv_M8888;

#line 208 "GUI\\LCD.h"




 
#line 221 "GUI\\LCD.h"












 
typedef void         tLCDDEV_DrawPixel    (int x, int y);
typedef void         tLCDDEV_DrawHLine    (int x0, int y0,  int x1);
typedef void         tLCDDEV_DrawVLine    (int x , int y0,  int y1);
typedef void         tLCDDEV_FillRect     (int x0, int y0, int x1, int y1);
typedef unsigned int tLCDDEV_GetPixelIndex(int x, int y);
typedef void         tLCDDEV_SetPixelIndex(int x, int y, int ColorIndex);
typedef void         tLCDDEV_XorPixel     (int x, int y);
typedef void         tLCDDEV_FillPolygon  (const GUI_POINT* pPoints, int NumPoints, int x0, int y0);
typedef void         tLCDDEV_FillPolygonAA(const GUI_POINT* pPoints, int NumPoints, int x0, int y0);
typedef void         tLCDDEV_GetRect      (LCD_RECT*pRect);
typedef int          tLCDDEV_Init         (void);
typedef void         tLCDDEV_On           (void);
typedef void         tLCDDEV_Off          (void);
typedef void         tLCDDEV_SetLUTEntry  (unsigned char Pos, LCD_COLOR color);
typedef void *       tLCDDEV_GetDevFunc   (int Index);
typedef signed long          tLCDDEV_GetDevProp   (int Index);
typedef void         tLCDDEV_SetOrg       (int x, int y);




 
typedef struct GUI_DEVICE     GUI_DEVICE;
typedef struct GUI_DEVICE_API GUI_DEVICE_API;

typedef void tLCDDEV_DrawBitmap   (int x0, int y0, int xsize, int ysize,
                       int BitsPerPixel, int BytesPerLine,
                       const unsigned char  * pData, int Diff,
                       const void* pTrans);    


















 

#line 298 "GUI\\LCD.h"

int LCD_GetXSizeMax(void);
int LCD_GetYSizeMax(void);
int LCD_GetVXSizeMax(void);
int LCD_GetVYSizeMax(void);
int LCD_GetBitsPerPixelMax(void);

int LCD_GetXSizeEx          (int LayerIndex);
int LCD_GetYSizeEx          (int LayerIndex);
int LCD_GetVXSizeEx         (int LayerIndex);
int LCD_GetVYSizeEx         (int LayerIndex);
int LCD_GetBitsPerPixelEx   (int LayerIndex);
unsigned long LCD_GetNumColorsEx      (int LayerIndex);
int LCD_GetXMagEx           (int LayerIndex);
int LCD_GetYMagEx           (int LayerIndex);
int LCD_GetMirrorXEx        (int LayerIndex);
int LCD_GetMirrorYEx        (int LayerIndex);
int LCD_GetSwapXYEx         (int LayerIndex);
int LCD_GetReversLUTEx      (int LayerIndex);
int LCD_GetPhysColorsInRAMEx(int LayerIndex);

int LCD_GetXSize            (void);
int LCD_GetYSize            (void);
int LCD_GetVXSize           (void);
int LCD_GetVYSize           (void);
int LCD_GetBitsPerPixel     (void);
unsigned long LCD_GetNumColors        (void);
int LCD_GetXMag             (void);
int LCD_GetYMag             (void);
int LCD_GetMirrorX          (void);
int LCD_GetMirrorY          (void);
int LCD_GetSwapXY           (void);
int LCD_GetReversLUT        (void);
int LCD_GetPhysColorsInRAM  (void);

signed long LCD__GetBPP      (unsigned long IndexMask);
signed long LCD__GetBPPDevice(unsigned long IndexMask);

tLCDDEV_Index2Color * LCD_GetpfIndex2ColorEx(int LayerIndex);
tLCDDEV_Color2Index * LCD_GetpfColor2IndexEx(int LayerIndex);

tLCDDEV_Color2Index * LCD_GetpfColor2Index(void);

int LCD_GetNumLayers(void);

LCD_COLOR * LCD_GetPalette  (void);
LCD_COLOR * LCD_GetPaletteEx(int LayerIndex);




 
                                        
#line 372 "GUI\\LCD.h"




 
                                           





 
                                        






 
typedef struct {
  void * pVRAM;
} LCD_X_SETVRAMADDR_INFO;

typedef struct {
  int xPos, yPos;
} LCD_X_SETORG_INFO;

typedef struct {
  LCD_COLOR Color;
  unsigned char Pos;
} LCD_X_SETLUTENTRY_INFO;

typedef struct {
  int xSize, ySize;
} LCD_X_SETSIZE_INFO;

typedef struct {
  int xPos, yPos;
} LCD_X_SETPOS_INFO;

typedef struct {
  int Alpha;
} LCD_X_SETALPHA_INFO;

typedef struct {
  int OnOff;
} LCD_X_SETVIS_INFO;

typedef struct {
  int AlphaMode;
} LCD_X_SETALPHAMODE_INFO;

typedef struct {
  int ChromaMode;
} LCD_X_SETCHROMAMODE_INFO;

typedef struct {
  LCD_COLOR ChromaMin;
  LCD_COLOR ChromaMax;
} LCD_X_SETCHROMA_INFO;




 
#line 451 "GUI\\LCD.h"

int  LCD_X_DisplayDriver(unsigned LayerIndex, unsigned Cmd, void * pData);
void LCD_X_Config(void);




 
int LCD_SetAlphaEx     (int LayerIndex, int Alpha);
int LCD_SetPosEx       (int LayerIndex, int xPos, int yPos);
int LCD_SetSizeEx      (int LayerIndex, int xSize, int ySize);
int LCD_SetVisEx       (int LayerIndex, int OnOff);
int LCD_SetVRAMAddrEx  (int LayerIndex, void * pVRAM);
int LCD_SetVSizeEx     (int LayerIndex, int xSize, int ySize);
int LCD_SetAlphaModeEx (int LayerIndex, int AlphaMode);
int LCD_SetChromaModeEx(int LayerIndex, int ChromaMode);
int LCD_SetChromaEx    (int LayerIndex, LCD_COLOR ChromaMin, LCD_COLOR ChromaMax);

int LCD_SetAlpha     (int Alpha);
int LCD_SetVRAMAddr  (void * pVRAM);
int LCD_SetVSize     (int xSize, int ySize);
int LCD_SetSize      (int xSize, int ySize);
int LCD_SetVis       (int OnOff);
int LCD_SetPos       (int xPos, int yPos);
int LCD_SetAlphaMode (int AlphaMode);
int LCD_SetChromaMode(int ChromaMode);
int LCD_SetChroma    (LCD_COLOR ChromaMin, LCD_COLOR ChromaMax);
int LCD_SetLUTEntry  (unsigned char Pos, LCD_COLOR Color);




 
int LCD_GetPosEx(int LayerIndex, int * pxPos, int * pyPos);

int LCD_GetPos  (int * pxPos, int * pyPos);





 
typedef struct {
  void (* pfStart)   (int x0, int y0, int x1, int y1);
  void (* pfSetPixel)(int PixelIndex);
  void (* pfNextLine)(void);
  void (* pfEnd)     (void);
} LCD_API_NEXT_PIXEL;

LCD_API_NEXT_PIXEL * LCD_GetNextPixelAPI(void);




 
typedef void         tLCD_HL_DrawHLine    (int x0, int y0,  int x1);
typedef void         tLCD_HL_DrawPixel    (int x0, int y0);

typedef struct {
  tLCD_HL_DrawHLine*          pfDrawHLine;
  tLCD_HL_DrawPixel*          pfDrawPixel;
} tLCD_HL_APIList;

void LCD_DrawHLine(int x0, int y0,  int x1);
void LCD_DrawPixel(int x0, int y0);
void LCD_DrawVLine  (int x, int y0,  int y1);





 
void LCD_SetClipRectEx(const LCD_RECT* pRect);
void LCD_SetClipRectMax(void);

 
signed long  LCD_GetDevCap  (int Index);
signed long  LCD_GetDevCapEx(int LayerIndex, int Index);

 
int LCD_Init(void);

void LCD_SetBkColor   (LCD_COLOR Color);  
void LCD_SetColor     (LCD_COLOR Color);  
void LCD_SetPixelIndex(int x, int y, int ColorIndex);

 
void LCD_InitLUT(void);
int  LCD_SetLUTEntryEx(int LayerIndex, unsigned char Pos, LCD_COLOR Color);
void LCD_SetLUTEx(int LayerIndex, const LCD_PHYSPALETTE * pPalette);
void LCD_SetLUT  (const LCD_PHYSPALETTE * pPalette);

 
void LCD_DrawBitmap_RLE8(int x0,int y0,int xsize, int ysize, const unsigned char  *pPixel, const LCD_LOGPALETTE  * pLogPal, int xMag, int yMag);
void LCD_DrawBitmap_RLE4(int x0,int y0,int xsize, int ysize, const unsigned char  *pPixel, const LCD_LOGPALETTE  * pLogPal, int xMag, int yMag);
void LCD_DrawBitmap_565 (int x0,int y0,int xsize, int ysize, const unsigned char  *pPixel, const LCD_LOGPALETTE  * pLogPal, int xMag, int yMag);
void LCD_DrawBitmap_M565(int x0,int y0,int xsize, int ysize, const unsigned char  *pPixel, const LCD_LOGPALETTE  * pLogPal, int xMag, int yMag);

LCD_DRAWMODE LCD_SetDrawMode  (LCD_DRAWMODE dm);
void LCD_SetColorIndex(unsigned PixelIndex);
void LCD_SetBkColorIndex(unsigned PixelIndex);
void LCD_FillRect(int x0, int y0, int x1, int y1);
typedef void tLCD_SetPixelAA(int x, int y, unsigned char Intens);

void LCD_SetPixelAA        (int x, int y, unsigned char Intens);
void LCD_SetPixelAA_NoTrans(int x, int y, unsigned char Intens);
void LCD_SetPixelAA_Xor    (int x, int y, unsigned char Intens);

LCD_COLOR    LCD_AA_MixColors(LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);
LCD_COLOR    LCD_MixColors256(LCD_COLOR Color, LCD_COLOR BkColor, unsigned Intens);
LCD_COLOR    LCD_GetPixelColor(int x, int y);      
unsigned int LCD_GetPixelIndex(int x, int y);
int          LCD_GetBkColorIndex (void);
int          LCD_GetColorIndex (void);




 


typedef void tLCD_DrawBitmap(int x0, int y0, int xsize, int ysize,
                             int xMul, int yMul, int BitsPerPixel, int BytesPerLine,
                             const unsigned char  * pPixel, const void * pTrans);
typedef void tRect2TextRect (LCD_RECT * pRect);

struct tLCD_APIList_struct {
  tLCD_DrawBitmap   * pfDrawBitmap;
  tRect2TextRect    * pfRect2TextRect;
};

typedef struct tLCD_APIList_struct tLCD_APIList;

extern tLCD_APIList LCD_APIListCCW;
extern tLCD_APIList LCD_APIListCW;
extern tLCD_APIList LCD_APIList180;

#line 594 "GUI\\LCD.h"




 
void LCD__SetPhysColor(unsigned char Pos, LCD_COLOR Color);




 




int LCD_ControlCache  (int Cmd);
int LCD_ControlCacheEx(int LayerIndex, int Cmd);




 
unsigned         LCD_Color2Index     (LCD_COLOR Color);
LCD_COLOR        LCD_Index2Color     (int Index);
LCD_COLOR        LCD_Index2ColorEx   (int i, unsigned LayerIndex);




 
unsigned char LCD_X_Read00(void);
unsigned char LCD_X_Read01(void);
void LCD_X_Write00 (unsigned char c);
void LCD_X_Write01 (unsigned char c);
void LCD_X_WriteM01(unsigned char * pData, int NumBytes);







 
#line 26 "GUI\\GUI_Type.h"
#line 27 "GUI\\GUI_Type.h"




 
typedef const char *  GUI_ConstString;

typedef LCD_COLOR       GUI_COLOR;
typedef LCD_LOGPALETTE  GUI_LOGPALETTE;
typedef LCD_DRAWMODE    GUI_DRAWMODE;
typedef LCD_RECT        GUI_RECT;

typedef struct {
  void      (* pfDraw)  (int x0,
                         int y0,
                         int xsize, 
                         int ysize, 
                         const unsigned char  * pPixel, 
                         const LCD_LOGPALETTE  * pLogPal, 
                         int xMag, 
                         int yMag);
  GUI_COLOR (* pfIndex2Color)(unsigned Index);
  void      (* pfDrawHW)(int x0,
                         int y0,
                         int xsize, 
                         int ysize, 
                         const unsigned char  * pPixel, 
                         const LCD_LOGPALETTE  * pLogPal, 
                         int xMag, 
                         int yMag);
} GUI_BITMAP_METHODS;

typedef struct {
  unsigned short XSize;
  unsigned short YSize;
  unsigned short BytesPerLine;
  unsigned short BitsPerPixel;
  const unsigned char  * pData;
  const GUI_LOGPALETTE  * pPal;
  const GUI_BITMAP_METHODS * pMethods;
} GUI_BITMAP;





 
typedef struct {
  unsigned short ID;
  unsigned short Format;
  unsigned short XSize;
  unsigned short YSize;
  unsigned short BytesPerLine;
  unsigned short BitsPerPixel;
  unsigned short NumColors;
  unsigned short HasTrans;
} GUI_BITMAP_STREAM;

typedef struct {
  int    Cmd;
  unsigned long    v;
  void * p;
} GUI_BITMAPSTREAM_PARAM;

typedef struct {
  int XSize;
  int YSize;
  int BitsPerPixel;
  int NumColors;
  int HasTrans;
} GUI_BITMAPSTREAM_INFO;

typedef void * (* GUI_BITMAPSTREAM_CALLBACK)(GUI_BITMAPSTREAM_PARAM * pParam);

typedef struct {
  int x,y;
  unsigned char  Pressed;
  unsigned char  Layer;
} GUI_PID_STATE;

typedef struct {
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  int Delay;
} GUI_GIF_IMAGE_INFO;

typedef struct {
  int xSize;
  int ySize;
  int NumImages;
} GUI_GIF_INFO;




 



 
typedef struct {
  signed short c0;
  signed short c1;
} GUI_FONT_TRANSLIST;

typedef struct {
  unsigned short FirstChar;
  unsigned short LastChar;
  const GUI_FONT_TRANSLIST  * pList;
} GUI_FONT_TRANSINFO;

typedef struct {
  unsigned char XSize;
  unsigned char XDist;
  unsigned char BytesPerLine;
  const unsigned char  * pData;
} GUI_CHARINFO;

typedef struct {
  unsigned char XSize;
  unsigned char YSize;
  signed char XPos;
  signed char YPos;
  unsigned char XDist;
  const unsigned char  * pData;
} GUI_CHARINFO_EXT;

typedef struct GUI_FONT_PROP {
  unsigned short First;                                               
  unsigned short Last;                                                
  const GUI_CHARINFO          * paCharInfo;      
  const struct GUI_FONT_PROP  * pNext;           
} GUI_FONT_PROP;

typedef struct GUI_FONT_PROP_EXT {
  unsigned short First;                                               
  unsigned short Last;                                                
  const GUI_CHARINFO_EXT          * paCharInfo;  
  const struct GUI_FONT_PROP_EXT  * pNext;       
} GUI_FONT_PROP_EXT;

typedef struct {
  const unsigned char  * pData;
  const unsigned char  * pTransData;
  const GUI_FONT_TRANSINFO  * pTrans;
  unsigned short FirstChar;
  unsigned short LastChar;
  unsigned char XSize;
  unsigned char XDist;
  unsigned char BytesPerLine;
} GUI_FONT_MONO;







 
typedef struct {
  unsigned short Flags;
  unsigned char Baseline;
  unsigned char LHeight;      
  unsigned char CHeight;      
} GUI_FONTINFO;

#line 201 "GUI\\GUI_Type.h"




 
typedef unsigned short  tGUI_GetCharCode(const char  *s);
typedef int  tGUI_GetCharSize(const char  *s);
typedef int  tGUI_CalcSizeOfChar(unsigned short Char);
typedef int  tGUI_Encode(char *s, unsigned short Char);

typedef struct {
  tGUI_GetCharCode*            pfGetCharCode;
  tGUI_GetCharSize*            pfGetCharSize;
  tGUI_CalcSizeOfChar*         pfCalcSizeOfChar;
  tGUI_Encode*                 pfEncode;
} GUI_UC_ENC_APILIST;




 
typedef int  tGUI_GetLineDistX(const char  *s, int Len);
typedef int  tGUI_GetLineLen(const char  *s, int MaxLen);
typedef void tGL_DispLine(const char  *s, int Len);

typedef struct {
  tGUI_GetLineDistX*          pfGetLineDistX;
  tGUI_GetLineLen*            pfGetLineLen;
  tGL_DispLine*               pfDispLine;
} tGUI_ENC_APIList;

extern const tGUI_ENC_APIList GUI_ENC_APIList_SJIS;
extern const tGUI_ENC_APIList GUI_ENC_APIList_EXT;




 
typedef struct GUI_FONT GUI_FONT;

typedef void GUI_DISPCHAR    (unsigned short c);
typedef int  GUI_GETCHARDISTX(unsigned short c);
typedef void GUI_GETFONTINFO (const GUI_FONT  * pFont, GUI_FONTINFO * pfi);
typedef char GUI_ISINFONT    (const GUI_FONT  * pFont, unsigned short c);
typedef int  GUI_GETCHARINFO (unsigned short c, GUI_CHARINFO_EXT * pInfo);

#line 253 "GUI\\GUI_Type.h"





 
void GUIMONO_DispChar (unsigned short c); int GUIMONO_GetCharDistX(unsigned short c); void GUIMONO_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIMONO_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIMONO_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 267 "GUI\\GUI_Type.h"

 
void GUIPROP_DispChar (unsigned short c); int GUIPROP_GetCharDistX(unsigned short c); void GUIPROP_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 277 "GUI\\GUI_Type.h"

 
void GUIPROP_EXT_DispChar (unsigned short c); int GUIPROP_EXT_GetCharDistX(unsigned short c); void GUIPROP_EXT_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_EXT_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 287 "GUI\\GUI_Type.h"

 
void GUIPROP_FRM_DispChar (unsigned short c); int GUIPROP_FRM_GetCharDistX(unsigned short c); void GUIPROP_FRM_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_FRM_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_FRM_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 297 "GUI\\GUI_Type.h"

 
void GUIPROP_DispChar (unsigned short c); int GUIPROP_GetCharDistX(unsigned short c); void GUIPROP_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 307 "GUI\\GUI_Type.h"

 
void GUIPROPAA_DispChar (unsigned short c); int GUIPROPAA_GetCharDistX(unsigned short c); void GUIPROPAA_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROPAA_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROPAA_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 317 "GUI\\GUI_Type.h"

 
void GUIPROP_AA2_DispChar (unsigned short c); int GUIPROP_AA2_GetCharDistX(unsigned short c); void GUIPROP_AA2_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA2_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_AA2_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 327 "GUI\\GUI_Type.h"

 
void GUIPROP_AA2_EXT_DispChar (unsigned short c); int GUIPROP_AA2_EXT_GetCharDistX(unsigned short c); void GUIPROP_AA2_EXT_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA2_EXT_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_AA2_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 337 "GUI\\GUI_Type.h"

 
void GUIPROP_AA2_DispChar (unsigned short c); int GUIPROP_AA2_GetCharDistX(unsigned short c); void GUIPROP_AA2_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA2_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_AA2_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 347 "GUI\\GUI_Type.h"

 
void GUIPROP_AA4_DispChar (unsigned short c); int GUIPROP_AA4_GetCharDistX(unsigned short c); void GUIPROP_AA4_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA4_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_AA4_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 357 "GUI\\GUI_Type.h"

 
void GUIPROP_AA4_EXT_DispChar (unsigned short c); int GUIPROP_AA4_EXT_GetCharDistX(unsigned short c); void GUIPROP_AA4_EXT_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA4_EXT_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_AA4_EXT_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 367 "GUI\\GUI_Type.h"

 
void GUIPROP_AA4_DispChar (unsigned short c); int GUIPROP_AA4_GetCharDistX(unsigned short c); void GUIPROP_AA4_GetFontInfo (const GUI_FONT  * pFont, GUI_FONTINFO * pfi); char GUIPROP_AA4_IsInFont (const GUI_FONT  * pFont, unsigned short c); int GUIPROP_AA4_GetCharInfo (unsigned short c, GUI_CHARINFO_EXT * pInfo);
#line 377 "GUI\\GUI_Type.h"





struct GUI_FONT {
  GUI_DISPCHAR     * pfDispChar; 
  GUI_GETCHARDISTX * pfGetCharDistX; 
  GUI_GETFONTINFO  * pfGetFontInfo; 
  GUI_ISINFONT     * pfIsInFont;
  GUI_GETCHARINFO  * pfGetCharInfo;
  const tGUI_ENC_APIList* pafEncode;
  unsigned char YSize;
  unsigned char YDist;
  unsigned char XMag;
  unsigned char YMag;
  union {
    const void               * pFontData;
    const GUI_FONT_MONO      * pMono;
    const GUI_FONT_PROP      * pProp;
    const GUI_FONT_PROP_EXT  * pPropExt;
  } p;
  unsigned char Baseline;
  unsigned char LHeight;      
  unsigned char CHeight;      
};




 
typedef struct {
  unsigned long ID;            
  unsigned short YSize;         
  unsigned short YDist;         
  unsigned short Baseline;      
  unsigned short LHeight;       
  unsigned short CHeight;       
  unsigned short NumAreas;      
} GUI_SI_FONT;

typedef struct {
  unsigned short First;         
  unsigned short Last;          
} GUI_SIF_CHAR_AREA;

typedef struct {
  unsigned short XSize;         
  unsigned short XDist;         
  unsigned short BytesPerLine;  
  unsigned short Dummy;
  unsigned long OffData;       
} GUI_SIF_CHARINFO;

typedef struct {
  unsigned short XSize;         
  unsigned short YSize;         
  signed short XOff;          
  signed short YOff;          
  unsigned short XDist;         
  unsigned short Dummy;
  unsigned long OffData;       
} GUI_SIF_CHARINFO_EXT;

typedef struct tGUI_SIF_APIList_struct {
  GUI_DISPCHAR          * pfDispChar;
  GUI_GETCHARDISTX      * pfGetCharDistX;
  GUI_GETFONTINFO       * pfGetFontInfo;
  GUI_ISINFONT          * pfIsInFont;
  GUI_GETCHARINFO       * pfGetCharInfo;
  const tGUI_ENC_APIList* pafEncode;
} tGUI_SIF_APIList;

#line 458 "GUI\\GUI_Type.h"




 
typedef int GUI_XBF_GET_DATA_FUNC(unsigned long Off, unsigned short NumBytes, void * pVoid, void * pBuffer);

typedef struct {
  unsigned short First;                          
  unsigned short Last;                           
  void * pVoid;                       
  GUI_XBF_GET_DATA_FUNC * pfGetData;  
} GUI_XBF_DATA;

typedef struct tGUI_XBF_APIList_struct {
  GUI_DISPCHAR          * pfDispChar;
  GUI_GETCHARDISTX      * pfGetCharDistX;
  GUI_GETFONTINFO       * pfGetFontInfo;
  GUI_ISINFONT          * pfIsInFont;
  GUI_GETCHARINFO       * pfGetCharInfo;
  const tGUI_ENC_APIList* pafEncode;
} tGUI_XBF_APIList;

#line 487 "GUI\\GUI_Type.h"




 
typedef struct {
  const void * pData;       
  unsigned long NumBytes;             
} GUI_TTF_DATA;

typedef struct {
  GUI_TTF_DATA * pTTF;      
  unsigned long aImageTypeBuffer[4];  
  int PixelHeight;         


 
  int FaceIndex;           

 
} GUI_TTF_CS;




 




typedef     signed long      GUI_HWIN;
typedef     signed long      GUI_HSPRITE;




 
typedef struct {
  
  
  
  void (* pfWrite8_A0)  (unsigned char Data);
  void (* pfWrite8_A1)  (unsigned char Data);
  void (* pfWriteM8_A0) (unsigned char * pData, int NumItems);
  void (* pfWriteM8_A1) (unsigned char * pData, int NumItems);
  unsigned char   (* pfRead8_A0)   (void);
  unsigned char   (* pfRead8_A1)   (void);
  void (* pfReadM8_A0)  (unsigned char * pData, int NumItems);
  void (* pfReadM8_A1)  (unsigned char * pData, int NumItems);
  
  
  
  void (* pfWrite16_A0) (unsigned short Data);
  void (* pfWrite16_A1) (unsigned short Data);
  void (* pfWriteM16_A0)(unsigned short * pData, int NumItems);
  void (* pfWriteM16_A1)(unsigned short * pData, int NumItems);
  unsigned short  (* pfRead16_A0)  (void);
  unsigned short  (* pfRead16_A1)  (void);
  void (* pfReadM16_A0) (unsigned short * pData, int NumItems);
  void (* pfReadM16_A1) (unsigned short * pData, int NumItems);
  
  
  
  void (* pfFlushBuffer)(void);
} GUI_PORT_API;



 
#line 23 "GUI\\GUI.h"
#line 1 "GUI\\GUI_Version.h"















 








 
#line 24 "GUI\\GUI.h"








 









 








 
typedef struct GUI_CONTEXT GUI_CONTEXT;

#line 60 "GUI\\GUI.h"
  void GUI_Lock(void);
  void GUI_Unlock(void);
  void GUITASK_Init(void);
  void GUITASK_CopyContext(void);
  GUI_CONTEXT * GUITASK_GetpContext(int Index);









 
struct GUI_DEVICE_API {
  
  
  
  int DeviceClassIndex;
  
  
  
  void     (* pfDrawBitmap   )(GUI_DEVICE * pDevice, int x0, int y0, int xsize, int ysize, int BitsPerPixel, int BytesPerLine, const unsigned char  * pData, int Diff, const unsigned long * pTrans);
  void     (* pfDrawHLine    )(GUI_DEVICE * pDevice, int x0, int y0,  int x1);
  void     (* pfDrawVLine    )(GUI_DEVICE * pDevice, int x , int y0,  int y1);
  void     (* pfFillRect     )(GUI_DEVICE * pDevice, int x0, int y0, int x1, int y1);
  unsigned (* pfGetPixelIndex)(GUI_DEVICE * pDevice, int x, int y);
  void     (* pfSetPixelIndex)(GUI_DEVICE * pDevice, int x, int y, int ColorIndex);
  void     (* pfXorPixel     )(GUI_DEVICE * pDevice, int x, int y);
  
  
  
  void     (* pfSetOrg       )(GUI_DEVICE * pDevice, int x, int y);
  
  
  
  void   (*(* pfGetDevFunc)   (GUI_DEVICE * pDevice, int Index))(void);
  signed long      (* pfGetDevProp   )(GUI_DEVICE * pDevice, int Index);
  void    *(* pfGetDevData   )(GUI_DEVICE * pDevice, int Index);
  void     (* pfGetRect      )(GUI_DEVICE * pDevice, LCD_RECT * pRect);
};




 
typedef enum { 
  DEVICE_CLASS_DRIVER,
  DEVICE_CLASS_DRIVER_MODIFIER,   
  DEVICE_CLASS_VNC,
  DEVICE_CLASS_SPRITE,
  DEVICE_CLASS_MEMDEV,
  DEVICE_CLASS_ALPHA,
  DEVICE_CLASS_AUTOALPHA,
  DEVICE_CLASS_MEASDEV
} DEVICE_CLASS;






 



extern const GUI_DEVICE_API GUIDRV_Win_API;

extern const GUI_DEVICE_API GUIDRV_Template_API;



















 
struct GUI_DEVICE {
  
  
  
  GUI_DEVICE * pNext;
  GUI_DEVICE * pPrev;
  
  
  
  union {
    signed long hContext; 
    void   * pContext; 
  } u;
  
  
  
  const GUI_DEVICE_API     * pDeviceAPI;
  const LCD_API_COLOR_CONV * pColorConvAPI;
  unsigned short Flags;
  int LayerIndex;
};

extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_1;
extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_8;
extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_16;
extern const GUI_DEVICE_API GUI_MEMDEV_DEVICE_32;







 
typedef union {
  unsigned char  aColorIndex8[2];
  unsigned short aColorIndex16[2];
  unsigned long aColorIndex32[2];
} LCD_COLORINDEX_UNION;

struct GUI_CONTEXT {
  
  
  
  LCD_COLORINDEX_UNION LCD;
  LCD_RECT       ClipRect;
  unsigned char             DrawMode;
  unsigned char             SelLayer;
  unsigned char             TextStyle;
  
  
  
  GUI_RECT * pClipRect_HL;                 
  unsigned char         PenSize;
  unsigned char         PenShape;
  unsigned char         LineStyle;
  
  
  
  const GUI_FONT            * pAFont;
  const GUI_UC_ENC_APILIST * pUC_API;    
  signed short LBorder;
  signed short DispPosX, DispPosY;
  signed short DrawPosX, DrawPosY;
  signed short TextMode, TextAlign;
  GUI_COLOR Color, BkColor;                
  
  
  

    const GUI_RECT* WM__pUserClipRect;
    GUI_HWIN hAWin;
    int xOff, yOff;

  
  
  
  GUI_DEVICE * apDevice[(16)];
  
  
  
  signed long    hDevData;
  GUI_RECT    ClipRectPrev;
  
  
  
  const tLCD_HL_APIList * pLCD_HL;       
  unsigned char AA_Factor;
  unsigned char AA_HiResEnable;
};

 









 
GUI_DEVICE * GUI_DEVICE_Create       (const GUI_DEVICE_API * pDeviceAPI, const LCD_API_COLOR_CONV * pColorConvAPI, unsigned short Flags, int LayerIndex);
GUI_DEVICE * GUI_DEVICE_CreateAndLink(const GUI_DEVICE_API * pDeviceAPI, const LCD_API_COLOR_CONV * pColorConvAPI, unsigned short Flags, int LayerIndex);
void         GUI_DEVICE_Delete       (GUI_DEVICE * pDevice);
int          GUI_DEVICE_Link         (GUI_DEVICE * pDevice);
void         GUI_DEVICE_Unlink       (GUI_DEVICE * pDevice);
GUI_DEVICE * GUI_DEVICE__GetpDriver  (int LayerIndex);
GUI_DEVICE * GUI_DEVICE__GetpDevice  (int LayerIndex, int DeviceClass);




 
int          GUI_Init             (void);
void         GUI_SetDefault       (void);
GUI_DRAWMODE GUI_SetDrawMode      (GUI_DRAWMODE dm);
const char * GUI_GetVersionString (void);
void         GUI_SaveContext_W      (      GUI_CONTEXT* pContext);
void         GUI_RestoreContext   (const GUI_CONTEXT* pContext);
void         GUI_SetScreenSizeX   (int xSize);
void         GUI_SetScreenSizeY   (int ySize);
int          GUI_GetScreenSizeX   (void);
int          GUI_GetScreenSizeY   (void);
const GUI_RECT * GUI_SetClipRect  (const GUI_RECT * pRect);




 
int  GUI_RectsIntersect(const GUI_RECT* pr0, const GUI_RECT* pr1);
void GUI_MoveRect       (GUI_RECT *pRect, int x, int y);
void GUI_MergeRect      (GUI_RECT* pDest, const GUI_RECT* pr0, const GUI_RECT* pr1);
int  GUI__IntersectRects(GUI_RECT* pDest, const GUI_RECT* pr0, const GUI_RECT* pr1);
void GUI__IntersectRect (GUI_RECT* pDest, const GUI_RECT* pr0);
void GUI__ReduceRect    (GUI_RECT* pDest, const GUI_RECT *pRect, int Dist);




 
void GUI__CompactPixelIndices  (unsigned long * pBuffer, int NumPixels, int BitsPerPixel);
void GUI__CompactPixelIndicesEx(unsigned long * pBuffer, int NumPixels, int BitsPerPixel, tLCDDEV_Color2Index * pfColor2Index);
void GUI__Config(void);
signed long  GUI__CosHQ(signed long Ang1000);
int  GUI__DivideRound     (int a, int b);
signed long  GUI__DivideRound32   (signed long a, signed long b);
void GUI__ExpandPixelIndices   (void * pBuffer, int NumPixels, int BitsPerPixel);
void GUI__ExpandPixelIndicesEx (void * pBuffer, int NumPixels, int BitsPerPixel, tLCDDEV_Index2Color * pfIndex2Color);
void GUI__memcpy(void * pDest, const void * pSrc, int NumBytes);
int  GUI__SetText(signed long * phText, const char * s);
signed long  GUI__SinHQ(signed long Ang1000);




 
GUI_COLOR GUI_GetBkColor     (void);
GUI_COLOR GUI_GetColor       (void);
int       GUI_GetBkColorIndex(void);
int       GUI_GetColorIndex  (void);
unsigned char        GUI_GetPenSize     (void);
unsigned char        GUI_GetPenShape    (void);
unsigned char        GUI_GetLineStyle   (void);

void      GUI_SetBkColor   (GUI_COLOR);
void      GUI_SetColor     (GUI_COLOR);
void      GUI_SetBkColorIndex(int Index);
void      GUI_SetColorIndex(int Index);

unsigned char        GUI_SetPenSize   (unsigned char Size);
unsigned char        GUI_SetPenShape  (unsigned char Shape);
unsigned char        GUI_SetLineStyle (unsigned char Style);

 
char      GUI_GetDecChar(void);
char      GUI_SetDecChar(char c);




 
int       GUI_Color2Index(GUI_COLOR color);
GUI_COLOR GUI_Color2VisColor(GUI_COLOR color);
char      GUI_ColorIsAvailable(GUI_COLOR color);
GUI_COLOR GUI_Index2Color(int Index);
unsigned long       GUI_CalcColorDist (GUI_COLOR Color0, GUI_COLOR  Color1);
unsigned long       GUI_CalcVisColorError(GUI_COLOR color);




 
void GUI_Log      (const char *s);
void GUI_Log1     (const char *s, int p0);
void GUI_Log2     (const char *s, int p0, int p1);
void GUI_Log3     (const char *s, int p0, int p1, int p2);
void GUI_Log4     (const char *s, int p0, int p1, int p2,int p3);
void GUI_Warn     (const char *s);
void GUI_Warn1    (const char *s, int p0);
void GUI_Warn2    (const char *s, int p0, int p1);
void GUI_Warn3    (const char *s, int p0, int p1, int p2);
void GUI_Warn4    (const char *s, int p0, int p1, int p2, int p3);
void GUI_ErrorOut (const char *s);
void GUI_ErrorOut1(const char *s, int p0);
void GUI_ErrorOut2(const char *s, int p0, int p1);
void GUI_ErrorOut3(const char *s, int p0, int p1, int p2);
void GUI_ErrorOut4(const char *s, int p0, int p1, int p2, int p3);




 
void GUI_Clear            (void);
void GUI_ClearRect        (int x0, int y0, int x1, int y1);
void GUI_ClearRectEx      (const GUI_RECT* pRect);
void GUI_DrawArc          (int x0, int y0, int rx, int ry, int a0, int a1);
void GUI_DrawBitmap       (const GUI_BITMAP  * pBM, int x0, int y0);
void GUI_DrawBitmapMag    (const GUI_BITMAP  * pBM, int x0, int y0, int XMul, int YMul);
void GUI_DrawBitmapEx     (const GUI_BITMAP  * pBM, int x0, int y0, int xCenter, int yCenter, int xMag, int yMag);
void GUI_DrawBitmapExp    (int x0, int y0, int XSize, int YSize, int XMul,  int YMul, int BitsPerPixel, int BytesPerLine, const unsigned char  * pData, const GUI_LOGPALETTE  * pPal);
void GUI_DrawBitmapHWAlpha(const GUI_BITMAP  * pBM, int x0, int y0);
void GUI_DrawCircle       (int x0, int y0, int r);
void GUI_DrawEllipse      (int x0, int y0, int rx, int ry);
void GUI_DrawGradientV    (int x0, int y0, int x1, int y1, GUI_COLOR Color0, GUI_COLOR Color1);
void GUI_DrawGradientH    (int x0, int y0, int x1, int y1, GUI_COLOR Color0, GUI_COLOR Color1);
void GUI_DrawGraph        (signed short *pay, int NumPoints, int x0, int y0);
void GUI_DrawGraphEx      (signed short *pay, int NumPoints, int x0, int y0, int Numerator, int Denominator, int MirrorX);
void GUI_DrawHLine        (int y0, int x0, int x1);
void GUI_DrawLine         (int x0, int y0, int x1, int y1);
void GUI_DrawLineRel      (int dx, int dy);
void GUI_DrawLineTo       (int x, int y);
void GUI_DrawPie          (int x0, int y0, int r, int a0, int a1, int Type);
void GUI_DrawPixel        (int x, int y);
void GUI_DrawPoint        (int x, int y);
void GUI_DrawPolygon      (const GUI_POINT* pPoints, int NumPoints, int x0, int y0);
void GUI_DrawPolyLine     (const GUI_POINT* pPoints, int NumPoints, int x0, int y0);
void GUI_DrawFocusRect    (const GUI_RECT *pRect, int Dist);
void GUI_DrawRect         (int x0, int y0, int x1, int y1);
void GUI_DrawRectEx       (const GUI_RECT *pRect);
void GUI_DrawRoundedRect  (int x0, int y0, int x1, int y1, int r);
void GUI_DrawVLine        (int x0, int y0, int y1);
void GUI_FillCircle       (int x0, int y0, int r);
void GUI_FillEllipse      (int x0, int y0, int rx, int ry);
void GUI_FillPolygon      (const GUI_POINT* pPoints, int NumPoints, int x0, int y0);
void GUI_FillRect         (int x0, int y0, int x1, int y1);
void GUI_FillRectEx       (const GUI_RECT* pRect);
void GUI_FillRoundedRect  (int x0, int y0, int x1, int y1, int r);
void GUI_GetClientRect    (GUI_RECT* pRect);
void GUI_InvertRect       (int x0, int y0, int x1, int y1);
void GUI_MoveRel          (int dx, int dy);
void GUI_MoveTo           (int x, int y);




 
typedef int GUI_GET_DATA_FUNC(void * p, const unsigned char ** ppData, unsigned NumBytes, unsigned long Off);




 
int GUI_GIF_Draw           (const void * pGIF, unsigned long NumBytes,         int x0, int y0);
int GUI_GIF_DrawEx         (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_GIF_DrawSub        (const void * pGIF, unsigned long NumBytes,         int x0, int y0, int Index);
int GUI_GIF_DrawSubEx      (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Index);
int GUI_GIF_DrawSubScaled  (const void * pGIF, unsigned long NumBytes,         int x0, int y0, int Index, int Num, int Denom);
int GUI_GIF_DrawSubScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Index, int Num, int Denom);
int GUI_GIF_GetComment     (const void * pGIF, unsigned long NumBytes,         unsigned char * pBuffer, int MaxSize, int Index);
int GUI_GIF_GetCommentEx   (GUI_GET_DATA_FUNC * pfGetData, void * p, unsigned char * pBuffer, int MaxSize, int Index);
int GUI_GIF_GetImageInfo   (const void * pGIF, unsigned long NumBytes,         GUI_GIF_IMAGE_INFO * pInfo, int Index);
int GUI_GIF_GetImageInfoEx (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_GIF_IMAGE_INFO * pInfo, int Index);
int GUI_GIF_GetInfo        (const void * pGIF, unsigned long NumBytes,         GUI_GIF_INFO * pInfo);
int GUI_GIF_GetInfoEx      (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_GIF_INFO * pInfo);
int GUI_GIF_GetXSize       (const void * pGIF);
int GUI_GIF_GetXSizeEx     (GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_GIF_GetYSize       (const void * pGIF);
int GUI_GIF_GetYSizeEx     (GUI_GET_DATA_FUNC * pfGetData, void * p);




 
int GUI_BMP_Draw        (const void * pFileData,                  int x0, int y0);
int GUI_BMP_DrawEx      (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_BMP_DrawScaled  (const void * pFileData,                  int x0, int y0, int Num, int Denom);
int GUI_BMP_DrawScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Num, int Denom);
int GUI_BMP_GetXSize    (const void * pFileData);
int GUI_BMP_GetXSizeEx  (GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_BMP_GetYSize    (const void * pFileData);
int GUI_BMP_GetYSizeEx  (GUI_GET_DATA_FUNC * pfGetData, void * p);




 
int GUI_PNG_Draw      (const void * pFileData, int DataSize, int x0, int y0);
int GUI_PNG_DrawEx    (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_PNG_GetXSize  (const void * pFileData, int FileSize);
int GUI_PNG_GetXSizeEx(GUI_GET_DATA_FUNC * pfGetData, void * p);
int GUI_PNG_GetYSize  (const void * pFileData, int FileSize);
int GUI_PNG_GetYSizeEx(GUI_GET_DATA_FUNC * pfGetData, void * p);




 
typedef struct {
  int XSize;
  int YSize;
} GUI_JPEG_INFO;

#line 473 "GUI\\GUI.h"

int GUI_JPEG_Draw        (const void * pFileData, int DataSize,    int x0, int y0);
int GUI_JPEG_DrawEx      (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_JPEG_DrawScaled  (const void * pFileData, int DataSize,    int x0, int y0, int Num, int Denom);
int GUI_JPEG_DrawScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Num, int Denom);
int GUI_JPEG_GetInfo     (const void * pFileData, int DataSize,    GUI_JPEG_INFO* pInfo);
int GUI_JPEG_GetInfoEx   (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_JPEG_INFO * pInfo);



int GUI_JPEG1_Draw        (const void * pFileData, int DataSize,    int x0, int y0);
int GUI_JPEG1_DrawEx      (GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0);
int GUI_JPEG1_DrawScaled  (const void * pFileData, int DataSize,    int x0, int y0, int Num, int Denom);
int GUI_JPEG1_DrawScaledEx(GUI_GET_DATA_FUNC * pfGetData, void * p, int x0, int y0, int Num, int Denom);
int GUI_JPEG1_GetInfo     (const void * pFileData, int DataSize,    GUI_JPEG_INFO * pContext);
int GUI_JPEG1_GetInfoEx   (GUI_GET_DATA_FUNC * pfGetData, void * p, GUI_JPEG_INFO * pContext);




 
typedef struct {
  const  GUI_BITMAP * pBitmap;
  int xHot, yHot;
} GUI_CURSOR;


  int                            GUI_CURSOR_GetState     (void);
  void                           GUI_CURSOR_Hide         (void);
  void                           GUI_CURSOR_SetXor       (const GUI_BITMAP * pBM, int x, int y);
  void                           GUI_CURSOR_SetPosition  (int x, int y);
  const GUI_CURSOR  * GUI_CURSOR_Select       (const GUI_CURSOR  * pCursor);
  void                           GUI_CURSOR_Show         (void);
  const GUI_CURSOR  * GUI_CURSOR_SelectEx     (const GUI_CURSOR  * pCursor, int Layer);
  void                           GUI_CURSOR_HideEx       (int Layer);
  void                           GUI_CURSOR_ShowEx       (int Layer);
  int                            GUI_CURSOR_GetStateEx   (int Layer);
  void                           GUI_CURSOR_SetPositionEx(int xNewPos, int yNewPos, int Layer);
  void                           GUI_CURSOR_GetCursorRect(GUI_RECT * pRect);
  void                           GUI_CURSOR_GetCursorRectEx(GUI_RECT * pRect, int Layer);
  void                           GUI_CURSOR_SetPixelIndexEx(int x, int y, int Index, int Layer);
  void                           GUI_CURSOR_XorPixelIndexEx(int x, int y, int Layer);








 



GUI_HSPRITE GUI_SPRITE__CreateEx           (const GUI_BITMAP  * pBM, int x, int y, int Layer, unsigned short Flags);  
GUI_HSPRITE GUI_SPRITE_Create              (const GUI_BITMAP  * pBM, int x, int y);
GUI_HSPRITE GUI_SPRITE_CreateEx            (const GUI_BITMAP  * pBM, int x, int y, int Layer);
void        GUI_SPRITE_Delete              (GUI_HSPRITE hSprite);
int         GUI_SPRITE_GetState            (GUI_HSPRITE hSprite);
void        GUI_SPRITE_Hide                (GUI_HSPRITE hSprite);
int         GUI_SPRITE_SetBitmap           (GUI_HSPRITE hSprite, const GUI_BITMAP  * pBM);
int         GUI_SPRITE_SetBitmapAndPosition(GUI_HSPRITE hSprite, const GUI_BITMAP  * pBM, int x, int y);
void        GUI_SPRITE_SetPosition         (GUI_HSPRITE hSprite, int x, int y);
void        GUI_SPRITE_Show                (GUI_HSPRITE hSprite);




 
extern const GUI_CURSOR GUI_CursorArrowS,  GUI_CursorArrowSI;
extern const GUI_CURSOR GUI_CursorArrowM,  GUI_CursorArrowMI;
extern const GUI_CURSOR GUI_CursorArrowL,  GUI_CursorArrowLI;
extern const GUI_CURSOR GUI_CursorCrossS,  GUI_CursorCrossSI;
extern const GUI_CURSOR GUI_CursorCrossM,  GUI_CursorCrossMI;
extern const GUI_CURSOR GUI_CursorCrossL,  GUI_CursorCrossLI;
extern const GUI_CURSOR GUI_CursorHeaderM, GUI_CursorHeaderMI;

extern const GUI_BITMAP GUI_BitmapArrowS, GUI_BitmapArrowSI;
extern const GUI_BITMAP GUI_BitmapArrowM, GUI_BitmapArrowMI;
extern const GUI_BITMAP GUI_BitmapArrowL, GUI_BitmapArrowLI;
extern const GUI_BITMAP GUI_BitmapCrossS, GUI_BitmapCrossSI;
extern const GUI_BITMAP GUI_BitmapCrossM, GUI_BitmapCrossMI;
extern const GUI_BITMAP GUI_BitmapCrossL, GUI_BitmapCrossLI;




 
typedef enum { GUI_WRAPMODE_NONE, GUI_WRAPMODE_WORD, GUI_WRAPMODE_CHAR } GUI_WRAPMODE;




 
void  GUI_DispCEOL             (void);
void  GUI_DispChar             (unsigned short c);
void  GUI_DispCharAt           (unsigned short c, signed short x, signed short y);
void  GUI_DispChars            (unsigned short c, int Cnt);
void  GUI_DispNextLine         (void);
void  GUI_DispString           (const char  * s);
void  GUI_DispStringAt         (const char  * s, int x, int y);
void  GUI_DispStringAtCEOL     (const char  * s, int x, int y);
void  GUI_DispStringHCenterAt  (const char  * s, int x, int y);
void  GUI__DispStringInRect    (const char  * s, GUI_RECT * pRect, int TextAlign, int MaxNumChars);
void  GUI_DispStringInRect     (const char  * s, GUI_RECT * pRect, int TextAlign);

  void  GUI_DispStringInRectEx (const char  * s, GUI_RECT * pRect, int TextAlign, int MaxLen, const tLCD_APIList * pLCD_Api);

void  GUI_DispStringInRectMax  (const char  * s, GUI_RECT * pRect, int TextAlign, int MaxLen);  
void  GUI_DispStringInRectWrap (const char  * s, GUI_RECT * pRect, int TextAlign, GUI_WRAPMODE WrapMode);  
void  GUI_DispStringLen        (const char  * s, int Len);
void  GUI_GetTextExtend        (GUI_RECT* pRect, const char  * s, int Len);
int   GUI_GetYAdjust           (void);
int   GUI_GetDispPosX          (void);
int   GUI_GetDispPosY          (void);
const GUI_FONT  * GUI_GetFont(void);
int   GUI_GetCharDistX(unsigned short c);
int   GUI_GetStringDistX       (const char  * s);
GUI_DRAWMODE GUI_GetDrawMode   (void);
int   GUI_GetFontDistY         (void);
int   GUI_GetFontSizeY         (void);
void  GUI_GetFontInfo          (const GUI_FONT  * pFont, GUI_FONTINFO * pfi);
void  GUI_GetOrg               (int * px, int * py);
int   GUI_GetYSizeOfFont       (const GUI_FONT  * pFont);
int   GUI_GetYDistOfFont       (const GUI_FONT  * pFont);
int   GUI_GetTextAlign         (void);
int   GUI_GetTextMode          (void);
char  GUI_IsInFont             (const GUI_FONT  * pFont, unsigned short c);
int   GUI_SetTextAlign         (int Align);
int   GUI_SetTextMode          (int Mode);
char  GUI_SetTextStyle         (char Style);
int   GUI_SetLBorder           (int x);
void  GUI_SetOrg               (int x, int y);
const GUI_FONT  * GUI_SetFont(const GUI_FONT  * pNewFont);
char  GUI_GotoXY               (int x, int y);
char  GUI_GotoX                (int x);
char  GUI_GotoY                (int y);
int   GUI_WrapGetNumLines      (const char  * pText, int xSize, GUI_WRAPMODE WrapMode);

int   GUI_GetLeadingBlankCols (unsigned short c);  
int   GUI_GetTrailingBlankCols(unsigned short c);  




 
void GUI_SIF_CreateFont(const void * pFontData, GUI_FONT * pFont, const tGUI_SIF_APIList * pFontType);
void GUI_SIF_DeleteFont(GUI_FONT * pFont);




 
int  GUI_XBF_CreateFont(GUI_FONT * pFont, GUI_XBF_DATA * pXBF, const tGUI_XBF_APIList * pFontType, GUI_XBF_GET_DATA_FUNC * pfGetData, void * pVoid);
void GUI_XBF_DeleteFont(GUI_FONT * pFont);




 
int  GUI_TTF_CreateFont   (GUI_FONT * pFont, GUI_TTF_CS * pCS);
void GUI_TTF_DestroyCache (void);
void GUI_TTF_Done         (void);
int  GUI_TTF_GetFamilyName(GUI_FONT * pFont, char * pBuffer, int NumBytes);
int  GUI_TTF_GetStyleName (GUI_FONT * pFont, char * pBuffer, int NumBytes);
void GUI_TTF_SetCacheSize (unsigned MaxFaces, unsigned MaxSizes, unsigned long MaxBytes);




 
int   GUI_UC_ConvertUC2UTF8   (const unsigned short  * s, int Len, char * pBuffer, int BufferSize);
int   GUI_UC_ConvertUTF82UC   (const char  * s, int Len, unsigned short * pBuffer, int BufferSize);
int   GUI_UC_Encode           (char* s, unsigned short Char);
int   GUI_UC_GetCharSize      (const char  * s);
unsigned short   GUI_UC_GetCharCode      (const char  * s);
void  GUI_UC_SetEncodeNone    (void);
void  GUI_UC_SetEncodeUTF8    (void);

void GUI_UC_DispString(const unsigned short  *s);
void GUI_UC2DB (unsigned short Code, unsigned char* pOut);
unsigned short  GUI_DB2UC (unsigned char Byte0, unsigned char Byte1);




 
void GUI_DispBin  (unsigned long  v, unsigned char Len);
void GUI_DispBinAt(unsigned long  v, signed short x, signed short y, unsigned char Len);
void GUI_DispDec  (signed long v, unsigned char Len);
void GUI_DispDecAt (signed long v, signed short x, signed short y, unsigned char Len);
void GUI_DispDecMin(signed long v);
void GUI_DispDecShift(signed long v, unsigned char Len, unsigned char Shift);
void GUI_DispDecSpace(signed long v, unsigned char MaxDigits);
void GUI_DispHex  (unsigned long v, unsigned char Len);
void GUI_DispHexAt(unsigned long v, signed short x, signed short y, unsigned char Len);
void GUI_DispSDec(signed long v, unsigned char Len);
void GUI_DispSDecShift(signed long v, unsigned char Len, unsigned char Shift);




 
void GUI_DispFloat    (float v, char Len);
void GUI_DispFloatFix (float v, char Len, char Fract);
void GUI_DispFloatMin (float v, char Fract);
void GUI_DispSFloatFix(float v, char Len, char Fract);
void GUI_DispSFloatMin(float v, char Fract);




 

   
  signed long GUI_ALLOC_GetNumFreeBlocks(void);
  signed long GUI_ALLOC_GetNumFreeBytes (void);
  signed long GUI_ALLOC_GetNumUsedBlocks(void);
  signed long GUI_ALLOC_GetNumUsedBytes (void);
#line 698 "GUI\\GUI.h"

signed long           GUI_ALLOC_AllocInit     (const void * pInitData, signed long Size);
signed long           GUI_ALLOC_AllocNoInit   (signed long size);
signed long           GUI_ALLOC_AllocZero     (signed long size);
void               GUI_ALLOC_AssignMemory  (void * p, unsigned long NumBytes);
void               GUI_ALLOC_Free          (signed long  hMem);
void               GUI_ALLOC_FreeFixedBlock(void * p);
void               GUI_ALLOC_FreePtrArray  (signed long * pArray, int NumElems);
void               GUI_ALLOC_FreePtr       (signed long * phMem);
void *             GUI_ALLOC_GetFixedBlock (signed long Size);
signed long GUI_ALLOC_GetMaxSize    (void);
signed long GUI_ALLOC_GetSize       (signed long  hMem);
void *             GUI_ALLOC_h2p           (signed long  hMem);
signed long           GUI_ALLOC_p2h           (void * p);
void               GUI_ALLOC_Init          (void);
void               GUI_ALLOC_Lock          (void);
void *             GUI_ALLOC_LockH         (signed long  hMem);
signed long           GUI_ALLOC_Realloc       (signed long hOld, int NewSize);
signed long GUI_ALLOC_RequestSize   (void);
void               GUI_ALLOC_SetAvBlockSize(unsigned long BlockSize);
void               GUI_ALLOC_Unlock        (void);
void *             GUI_ALLOC_UnlockH       (void);




 



typedef signed long GUI_MEMDEV_Handle;
typedef void GUI_CALLBACK_VOID_P(void* p);

typedef struct {
  GUI_RECT rView, rPrev;
  char FirstCall;
} GUI_AUTODEV;

typedef struct {
  char DrawFixed;
  char IsMeasurement;
} GUI_AUTODEV_INFO;

int  GUI_MEMDEV_CreateAuto(GUI_AUTODEV * pAutoDev);
void GUI_MEMDEV_DeleteAuto(GUI_AUTODEV * pAutoDev);
int  GUI_MEMDEV_DrawAuto  (GUI_AUTODEV * pAutoDev, GUI_AUTODEV_INFO * pAutoDevInfo, GUI_CALLBACK_VOID_P * pfDraw, void * pData);

 
GUI_MEMDEV_Handle GUI_MEMDEV_Create     (int x0, int y0, int XSize, int YSize);
GUI_MEMDEV_Handle GUI_MEMDEV_CreateEx   (int x0, int y0, int XSize, int YSize, int Flags);
GUI_MEMDEV_Handle GUI_MEMDEV_CreateFixed(int x0, int y0, 
                                         int xsize, int ysize, int Flags,
                                         const GUI_DEVICE_API     * pDeviceAPI,
                                         const LCD_API_COLOR_CONV * pColorConvAPI);
void GUI_MEMDEV_Clear         (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyFromLCD   (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyFromLCDAA (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyToLCD     (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyToLCDAA   (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_CopyToLCDAt   (GUI_MEMDEV_Handle hMem, int x, int y);
int  GUI_MEMDEV_CompareWithLCD(GUI_MEMDEV_Handle hMem, int*px, int*py, int *pExp, int*pAct);
void GUI_MEMDEV_Delete        (GUI_MEMDEV_Handle MemDev);
void GUI_MEMDEV_DrawPerspectiveX(GUI_MEMDEV_Handle hMem, int x, int y, int h0, int h1, int dx, int dy);
int  GUI_MEMDEV_GetXPos       (GUI_MEMDEV_Handle hMem);
int  GUI_MEMDEV_GetXSize      (GUI_MEMDEV_Handle hMem);
int  GUI_MEMDEV_GetYPos       (GUI_MEMDEV_Handle hMem);
int  GUI_MEMDEV_GetYSize      (GUI_MEMDEV_Handle hMem);
void GUI_MEMDEV_MarkDirty     (GUI_MEMDEV_Handle hMem, int x0, int y0, int x1, int y1);
void GUI_MEMDEV_ReduceYSize   (GUI_MEMDEV_Handle hMem, int YSize);
void GUI_MEMDEV_Rotate        (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
void GUI_MEMDEV_RotateHQ      (GUI_MEMDEV_Handle hSrc, GUI_MEMDEV_Handle hDst, int dx, int dy, int a, int Mag);
GUI_MEMDEV_Handle GUI_MEMDEV_Select (GUI_MEMDEV_Handle hMem);   
void  GUI_MEMDEV_SetOrg        (GUI_MEMDEV_Handle hMem, int x0, int y0);
void  GUI_MEMDEV_WriteAt       (GUI_MEMDEV_Handle hMem, int x, int y);
void  GUI_MEMDEV_Write         (GUI_MEMDEV_Handle hMem);
void  GUI_MEMDEV_WriteAlphaAt  (GUI_MEMDEV_Handle hMem, int Alpha, int x, int y);
void  GUI_MEMDEV_WriteAlpha    (GUI_MEMDEV_Handle hMem, int Alpha);
void  GUI_MEMDEV_WriteExAt     (GUI_MEMDEV_Handle hMem, int x, int y, int xMag, int yMag, int Alpha);
void  GUI_MEMDEV_WriteEx       (GUI_MEMDEV_Handle hMem, int xMag, int yMag, int Alpha);
int   GUI_MEMDEV_Draw          (GUI_RECT * pRect, GUI_CALLBACK_VOID_P * pfDraw, void * pData, int MemSize, int Flags);
int   GUI_MEMDEV_DrawStatic    (GUI_RECT * pRect, GUI_CALLBACK_VOID_P * pfDraw, void * pData, GUI_MEMDEV_Handle * phDst, int Flags);
void* GUI_MEMDEV_GetDataPtr    (GUI_MEMDEV_Handle hMem);
void  GUI_MEMDEV_SetColorConv  (GUI_MEMDEV_Handle hMem, const LCD_API_COLOR_CONV * pColorConvAPI);
int   GUI_MEMDEV_GetBitsPerPixel(GUI_MEMDEV_Handle hMemDev);

void     GUI_SelectLCD(void);




 
typedef struct {
  unsigned long UserAlpha;
} GUI_ALPHA_STATE;



unsigned GUI_EnableAlpha     (unsigned OnOff);
unsigned long      GUI_RestoreUserAlpha(GUI_ALPHA_STATE * pAlphaState);
unsigned GUI_SetAlpha        (unsigned char Alpha);
unsigned long      GUI_SetUserAlpha    (GUI_ALPHA_STATE * pAlphaState, unsigned long UserAlpha);




 
unsigned GUI_SelectLayer(unsigned Index);

int  GUI_SetLayerPosEx  (unsigned Index, int xPos, int yPos);
int  GUI_SetLayerSizeEx (unsigned Index, int xSize, int ySize);
int  GUI_SetLayerVisEx  (unsigned Index, int OnOff);
int  GUI_SetLayerAlphaEx(unsigned Index, int Alpha);
void GUI_GetLayerPosEx  (unsigned Index, int * pxPos, int * pyPos);

void     GUI_AssignCursorLayer(unsigned Index, unsigned CursorLayer);
unsigned GUI_GetCursorLayer   (unsigned Index);




 



 
typedef struct {
  void     (* pfDrawBitmap   )(GUI_DEVICE * pDevice, int x0, int y0, int xsize, int ysize, int BitsPerPixel, int BytesPerLine, const unsigned char  * pData, int Diff, const unsigned long * pTrans);
  void     (* pfDrawHLine    )(GUI_DEVICE * pDevice, int x0, int y0,  int x1);
  void     (* pfDrawVLine    )(GUI_DEVICE * pDevice, int x , int y0,  int y1);
  void     (* pfFillRect     )(GUI_DEVICE * pDevice, int x0, int y0, int x1, int y1);
  unsigned (* pfGetPixelIndex)(GUI_DEVICE * pDevice, int x, int y);
  void     (* pfSetPixelIndex)(GUI_DEVICE * pDevice, int x, int y, int ColorIndex);
  void     (* pfXorPixel     )(GUI_DEVICE * pDevice, int x, int y);
  int      BytesPerPixel;
} GUI_ORIENTATION_API;

extern const GUI_ORIENTATION_API GUI_OrientationAPI_C0;
extern const GUI_ORIENTATION_API GUI_OrientationAPI_C8;
extern const GUI_ORIENTATION_API GUI_OrientationAPI_C16;
extern const GUI_ORIENTATION_API GUI_OrientationAPI_C32;






int GUI_SetOrientation        (int Orientation);
int GUI_SetOrientationEx      (int Orientation, int LayerIndex);
int GUI_SetOrientationExCached(int Orientation, int LayerIndex, const GUI_ORIENTATION_API * pAPI);




 
typedef signed long GUI_MEASDEV_Handle;

GUI_MEASDEV_Handle GUI_MEASDEV_Create (void);
void               GUI_MEASDEV_Delete (GUI_MEASDEV_Handle hMemDev);
void               GUI_MEASDEV_Select (GUI_MEASDEV_Handle hMem);
void               GUI_MEASDEV_GetRect(GUI_MEASDEV_Handle hMem, GUI_RECT *pRect);
void               GUI_MEASDEV_ClearRect(GUI_MEASDEV_Handle hMem);




 
void GUI_RotatePolygon(GUI_POINT* pDest, const GUI_POINT* pSrc, int NumPoints, float Angle);
void GUI_MagnifyPolygon(GUI_POINT* pDest, const GUI_POINT* pSrc, int NumPoints, int Mag);
void GUI_EnlargePolygon(GUI_POINT* pDest, const GUI_POINT* pSrc, int NumPoints, int Len);




 






int GUI_CreateBitmapFromStreamIDX(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLE4(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLE8(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM565(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamM555(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLE16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamRLEM16(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStream24(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
int GUI_CreateBitmapFromStreamAlpha(GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);

int  GUI_CreateBitmapFromStream  (GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const void * p);
void GUI_DrawStreamedBitmap      (const void * p, int x, int y);
int  GUI_DrawStreamedBitmapEx    (GUI_GET_DATA_FUNC * pfGetData, const void * p, int x, int y);
void GUI_GetStreamedBitmapInfo   (const void * p, GUI_BITMAPSTREAM_INFO * pInfo);
int  GUI_GetStreamedBitmapInfoEx (GUI_GET_DATA_FUNC * pfGetData, const void * p, GUI_BITMAPSTREAM_INFO * pInfo);
void GUI_SetStreamedBitmapHook   (GUI_BITMAPSTREAM_CALLBACK pfStreamedBitmapHook);




 
typedef void GUI_CALLBACK_VOID_U8_P(unsigned char Data, void * p);

void GUI_BMP_SerializeEx(GUI_CALLBACK_VOID_U8_P * pfSerialize, int x0, int y0, int xSize, int ySize, void * p);
void GUI_BMP_Serialize  (GUI_CALLBACK_VOID_U8_P * pfSerialize, void * p);




 
void GUI_Delay  (int Period);
int  GUI_GetTime(void);
int  GUI_Exec(void);          
int  GUI_Exec1(void);         




 
int     GUI_MessageBox   (const char * sMessage, const char * sCaption, int Flags);









 
typedef struct {
  int Time;
  unsigned long            Context;
} GUI_TIMER_MESSAGE;

typedef signed long GUI_TIMER_HANDLE;
typedef void GUI_TIMER_CALLBACK(  GUI_TIMER_MESSAGE* pTM);

GUI_TIMER_HANDLE GUI_TIMER_Create   (GUI_TIMER_CALLBACK* cb, int Time,  unsigned long Context, int Flags);
void             GUI_TIMER_Delete   (GUI_TIMER_HANDLE hObj);

 
void GUI_TIMER_SetPeriod (GUI_TIMER_HANDLE hObj, int Period);
void GUI_TIMER_SetTime   (GUI_TIMER_HANDLE hObj, int Period);
void GUI_TIMER_SetDelay  (GUI_TIMER_HANDLE hObj, int Delay);
void GUI_TIMER_Restart   (GUI_TIMER_HANDLE hObj);
int  GUI_TIMER_Exec(void);




 
void GUI_AA_DisableHiRes     (void);
void GUI_AA_EnableHiRes      (void);
int  GUI_AA_GetFactor        (void);
void GUI_AA_SetFactor        (int Factor);
void GUI_AA_DrawArc          (int x0, int y0, int rx, int ry, int a0, int a1);
void GUI_AA_DrawLine         (int x0, int y0, int x1, int y1);
void GUI_AA_DrawPolyOutline  (const GUI_POINT * pSrc, int NumPoints, int Thickness, int x, int y);
void GUI_AA_DrawPolyOutlineEx(const GUI_POINT * pSrc, int NumPoints, int Thickness, int x, int y, GUI_POINT * pBuffer);
void GUI_AA_DrawRoundedRect  (int x0, int y0, int x1, int y1, int r);
void GUI_AA_FillCircle       (int x0, int y0, int r);
void GUI_AA_FillPolygon      (GUI_POINT* pPoints, int NumPoints, int x0, int y0);
void GUI_AA_FillRoundedRect  (int x0, int y0, int x1, int y1, int r);




 
 
void GUI_StoreKeyMsg(int Key, int Pressed);
void GUI_SendKeyMsg (int Key, int Pressed);
int  GUI_PollKeyMsg(void);

 
int  GUI_GetKey(void);
int  GUI_WaitKey(void);
void GUI_StoreKey(int c);
void GUI_ClearKeyBuffer(void);




 
void GUI_WaitEvent(void);




 
void GUI_JOYSTICK_StoreState(const GUI_PID_STATE * pState);




 
void GUI_PID_StoreState(const GUI_PID_STATE *pState);
int  GUI_PID_GetState  (      GUI_PID_STATE *pState);




 
int  GUI_MOUSE_GetState  (      GUI_PID_STATE *pState);
void GUI_MOUSE_StoreState(const GUI_PID_STATE *pState);




 
int  GUI_TOUCH_GetState     (GUI_PID_STATE *pState);
void GUI_TOUCH_GetUnstable  (int* px, int* py);   
void GUI_TOUCH_SetLayer     (int Layer);
void GUI_TOUCH_StoreState   (int x, int y);
void GUI_TOUCH_StoreStateEx (const GUI_PID_STATE *pState);
void GUI_TOUCH_StoreUnstable(int x, int y);




 
void GUI_MOUSE_DRIVER_PS2_Init(void);                
void GUI_MOUSE_DRIVER_PS2_OnRx(unsigned char Data);




 
void GUI_TOUCH_Exec                 (void);
int  GUI_TOUCH_Calibrate            (int Coord, int Log0, int Log1, int Phys0, int Phys1);
void GUI_TOUCH_SetDefaultCalibration(void);
int  GUI_TOUCH_GetxPhys             (void);     
int  GUI_TOUCH_GetyPhys             (void);     
void GUI_TOUCH_GetCalData           (int Coord, int* pMin,int* pMax);
void GUI_TOUCH_SetOrientation       (unsigned Orientation);
void GUI_TOUCH_SetOrientationPhys   (unsigned Orientation);








 
void GUI_TOUCH_X_ActivateX(void);
void GUI_TOUCH_X_ActivateY(void);
void GUI_TOUCH_X_Disable  (void);
int  GUI_TOUCH_X_MeasureX (void);
int  GUI_TOUCH_X_MeasureY (void);














 




void GUI_X_Config(void);
void GUI_X_Init(void);




void GUI_X_ExecIdle(void);




int  GUI_X_GetTime(void);
void GUI_X_Delay(int Period);




void GUI_X_Unlock(void);
void GUI_X_Lock(void);
unsigned long  GUI_X_GetTaskId(void);
void GUI_X_InitOS(void);




void GUI_X_WaitEvent(void);
void GUI_X_WaitEventTimed(int Period);
void GUI_X_SignalEvent(void);




void GUI_X_Log(const char *s);
void GUI_X_Warn(const char *s);
void GUI_X_ErrorOut(const char *s); 




 
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE4;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE8;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLE16;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsRLEM16;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods8888;

extern const GUI_BITMAP_METHODS GUI_BitmapMethods888;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM888;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods555;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM555;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods565;
extern const GUI_BITMAP_METHODS GUI_BitmapMethodsM565;
extern const GUI_BITMAP_METHODS GUI_BitmapMethods24;




#line 1138 "GUI\\GUI.h"

extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_Ext;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_Frm;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA2;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA4;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA2_EXT;
extern const tGUI_SIF_APIList GUI_SIF_APIList_Prop_AA4_EXT;

extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_Ext;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_Frm;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_AA2_Ext;
extern const tGUI_XBF_APIList GUI_XBF_APIList_Prop_AA4_Ext;









 
#line 1180 "GUI\\GUI.h"












 
#line 1201 "GUI\\GUI.h"




#line 1215 "GUI\\GUI.h"

#line 1226 "GUI\\GUI.h"

#line 1237 "GUI\\GUI.h"

#line 1248 "GUI\\GUI.h"






#line 1262 "GUI\\GUI.h"

#line 1273 "GUI\\GUI.h"

#line 1284 "GUI\\GUI.h"



















































 








 








 









 







 
#line 1397 "GUI\\GUI.h"






 






 



extern const GUI_FONT GUI_Font8_ASCII,        GUI_Font8_1;
extern const GUI_FONT GUI_Font10S_ASCII,      GUI_Font10S_1;
extern const GUI_FONT GUI_Font10_ASCII,       GUI_Font10_1;
extern const GUI_FONT GUI_Font13_ASCII,       GUI_Font13_1;
extern const GUI_FONT GUI_Font13B_ASCII,      GUI_Font13B_1;
extern const GUI_FONT GUI_Font13H_ASCII,      GUI_Font13H_1;
extern const GUI_FONT GUI_Font13HB_ASCII,     GUI_Font13HB_1;
extern const GUI_FONT GUI_Font16_ASCII,       GUI_Font16_1,       GUI_Font16_HK,    GUI_Font16_1HK;
extern const GUI_FONT GUI_Font16B_ASCII,      GUI_Font16B_1;
extern const GUI_FONT GUI_Font20_ASCII,       GUI_Font20_1;
extern const GUI_FONT GUI_Font20B_ASCII,      GUI_Font20B_1;
extern const GUI_FONT GUI_Font24_ASCII,       GUI_Font24_1;
extern const GUI_FONT GUI_Font24B_ASCII,      GUI_Font24B_1;
extern const GUI_FONT GUI_Font32_ASCII,       GUI_Font32_1;
extern const GUI_FONT GUI_Font32B_ASCII,      GUI_Font32B_1;




extern const GUI_FONT GUI_Font20F_ASCII;




extern const GUI_FONT GUI_Font4x6;
extern const GUI_FONT GUI_Font6x8,            GUI_Font6x9;
extern const GUI_FONT GUI_Font6x8_ASCII,      GUI_Font6x8_1;
extern const GUI_FONT GUI_Font8x8,            GUI_Font8x9;
extern const GUI_FONT GUI_Font8x8_ASCII,      GUI_Font8x8_1;
extern const GUI_FONT GUI_Font8x10_ASCII;
extern const GUI_FONT GUI_Font8x12_ASCII;
extern const GUI_FONT GUI_Font8x13_ASCII,     GUI_Font8x13_1;
extern const GUI_FONT GUI_Font8x15B_ASCII,    GUI_Font8x15B_1;
extern const GUI_FONT GUI_Font8x16,           GUI_Font8x17,       GUI_Font8x18;
extern const GUI_FONT GUI_Font8x16x1x2,       GUI_Font8x16x2x2,   GUI_Font8x16x3x3;
extern const GUI_FONT GUI_Font8x16_ASCII,     GUI_Font8x16_1;




extern const GUI_FONT GUI_FontD24x32;
extern const GUI_FONT GUI_FontD32;
extern const GUI_FONT GUI_FontD36x48;
extern const GUI_FONT GUI_FontD48;
extern const GUI_FONT GUI_FontD48x64;
extern const GUI_FONT GUI_FontD64;
extern const GUI_FONT GUI_FontD60x80;
extern const GUI_FONT GUI_FontD80;




extern const GUI_FONT GUI_FontComic18B_ASCII, GUI_FontComic18B_1;
extern const GUI_FONT GUI_FontComic24B_ASCII, GUI_FontComic24B_1;




 



#line 1512 "GUI\\GUI.h"









#line 1544 "GUI\\GUI.h"




#line 1556 "GUI\\GUI.h"
















 
#line 1581 "GUI\\GUI.h"

#line 1590 "GUI\\GUI.h"

 






 






 









 








 
#line 1881 "GUI\\GUI.h"




 
#line 1896 "GUI\\GUI.h"



 
#line 26 "GUI\\GUI_VNC_X_StartServer.c"
#line 1 "GUI\\GUI_VNC.h"



















 




#line 1 "GUI\\GUI_Private.h"















 




#line 22 "GUI\\GUI_Private.h"
#line 1 "GUI\\LCD_Protected.h"















 




#line 22 "GUI\\LCD_Protected.h"




 
typedef struct {
  LCD_COLOR * paColor;
  signed short         NumEntries;
} LCD_LUT_INFO;

typedef struct {
  tLCDDEV_DrawPixel  * pfDrawPixel;
  tLCDDEV_DrawHLine  * pfDrawHLine;
  tLCDDEV_DrawVLine  * pfDrawVLine;
  tLCDDEV_FillRect   * pfFillRect;
  tLCDDEV_DrawBitmap * pfDrawBitmap;
} LCD_API_LIST;




 
extern const unsigned char LCD_aMirror[256];
extern unsigned long LCD__aConvTable[256];




 
void LCD_UpdateColorIndices   (void);
int  LCD_PassingBitmapsAllowed(void);
void LCD_EnableCursor         (int OnOff);
void LCD_SelectLCD            (void);

void LCD_DrawBitmap(int x0, int y0,
                    int xsize, int ysize,
                    int xMul, int yMul,
                    int BitsPerPixel,
                    int BytesPerLine,
                    const unsigned char  * pPixel,
                    const unsigned long * pTrans);




 
tLCDDEV_Index2Color LCD_Index2Color_555;
tLCDDEV_Index2Color LCD_Index2Color_565;
tLCDDEV_Index2Color LCD_Index2Color_8666;
tLCDDEV_Index2Color LCD_Index2Color_888;
tLCDDEV_Index2Color LCD_Index2Color_8888;
tLCDDEV_Index2Color LCD_Index2Color_M555;
tLCDDEV_Index2Color LCD_Index2Color_M565;
tLCDDEV_Index2Color LCD_Index2Color_M888;

tLCDDEV_Color2Index LCD_Color2Index_8666;



 

#line 23 "GUI\\GUI_Private.h"
#line 1 "GUI\\GUI_Debug.h"


















 




#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stddef.h"
 






 

 
 
 





 





#line 34 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stddef.h"

typedef signed int ptrdiff_t;


  
  typedef unsigned int size_t;








   



      typedef unsigned short wchar_t;  
#line 70 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stddef.h"



    

   









#line 91 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stddef.h"



 

#line 25 "GUI\\GUI_Debug.h"

#line 27 "GUI\\GUI_Debug.h"

#line 34 "GUI\\GUI_Debug.h"

#line 42 "GUI\\GUI_Debug.h"

#line 50 "GUI\\GUI_Debug.h"






 












 

 

#line 96 "GUI\\GUI_Debug.h"






 

 

#line 129 "GUI\\GUI_Debug.h"






 
 

#line 161 "GUI\\GUI_Debug.h"






 











 
#line 24 "GUI\\GUI_Private.h"
#line 1 "GUI\\WM_GUI.h"















 








int       WM__InitIVRSearch(const GUI_RECT* pMaxRect);
int       WM__GetNextIVR   (void);
int       WM__GetOrgX_AA(void);
int       WM__GetOrgY_AA(void);










#line 48 "GUI\\WM_GUI.h"








 
#line 26 "GUI\\GUI_Private.h"














 








 


































 











 
#line 106 "GUI\\GUI_Private.h"







 
typedef signed long GUI_USAGE_Handle;
typedef struct tsUSAGE_APIList tUSAGE_APIList;
typedef struct GUI_Usage GUI_USAGE;




typedef GUI_USAGE_Handle tUSAGE_CreateCompatible(GUI_USAGE* p);
typedef void        tUSAGE_AddPixel        (GUI_USAGE* p, int x, int y);
typedef void        tUSAGE_AddHLine        (GUI_USAGE* p, int x0, int y0, int len);
typedef void        tUSAGE_Clear           (GUI_USAGE* p);
typedef void        tUSAGE_Delete          (GUI_USAGE_Handle h);
typedef int         tUSAGE_GetNextDirty    (GUI_USAGE* p, int *pxOff, int yOff);



void GUI_USAGE_DecUseCnt(GUI_USAGE_Handle  hUsage);

GUI_USAGE_Handle GUI_USAGE_BM_Create(int x0, int y0, int xsize, int ysize, int Flags);
void    GUI_USAGE_Select(GUI_USAGE_Handle hUsage);
void    GUI_USAGE_AddRect(GUI_USAGE*  pUsage, int x0, int y0, int xSize, int ySize);






struct tsUSAGE_APIList {
  tUSAGE_AddPixel*                pfAddPixel;
  tUSAGE_AddHLine*                pfAddHLine;
  tUSAGE_Clear*                   pfClear;
  tUSAGE_CreateCompatible*        pfCreateCompatible;
  tUSAGE_Delete*                  pfDelete;
  tUSAGE_GetNextDirty*            pfGetNextDirty;
} ;

struct GUI_Usage {
  signed short x0, y0, XSize, YSize;
  const tUSAGE_APIList *pAPI;
  signed short UseCnt;
};







 


typedef struct {
  GUI_DEVICE * pDevice;
  signed short                   x0, y0, XSize, YSize;
  unsigned               BytesPerLine;
  unsigned               BitsPerPixel;
  signed long               hUsage;
} GUI_MEMDEV;



void         GUI_MEMDEV__CopyFromLCD (GUI_MEMDEV_Handle hMem);
void         GUI_MEMDEV__GetRect     (GUI_RECT* pRect);
unsigned     GUI_MEMDEV__Color2Index (LCD_COLOR Color);
LCD_COLOR    GUI_MEMDEV__Index2Color (int Index);
unsigned int GUI_MEMDEV__GetIndexMask(void);

GUI_MEMDEV_Handle GUI_MEMDEV__CreateFixed(int x0, int y0, int xSize, int ySize, int Flags,
                                          const GUI_DEVICE_API     * pDeviceAPI,
                                          const LCD_API_COLOR_CONV * pColorConvAPI);

void * GUI_MEMDEV__XY2PTR             (int x,int y);
void * GUI_MEMDEV__XY2PTREx           (GUI_MEMDEV * pDev, int x,int y);
void   GUI_MEMDEV__WriteToActiveAt    (GUI_MEMDEV_Handle hMem,int x, int y);
void   GUI_MEMDEV__WriteToActiveOpaque(GUI_MEMDEV_Handle hMem,int x, int y);
void   GUI_MEMDEV__WriteToActiveAlpha (GUI_MEMDEV_Handle hMem,int x, int y);
void   GUI_MEMDEV__ReadLine           (int x0, int y, int x1, unsigned long * pBuffer);

unsigned GUI__AlphaSuppressMixing(int OnOff);

void     GUI_MEMDEV__SuppressMixing   (unsigned OnOff);
unsigned GUI_MEMDEV__GetSuppressMixing(void);











 









 

int  GUI_cos(int angle);
int  GUI_sin(int angle);
extern const unsigned long GUI_Pow10[10];

 
int  GUI_AA_Init       (int x0, int x1);
int  GUI_AA_Init_HiRes (int x0, int x1);
void GUI_AA_Exit       (void);
signed short  GUI_AA_HiRes2Pixel(int HiRes);

void GL_FillCircleAA_HiRes(int x0, int y0, int r);

void GUI_AA__DrawCharAA2(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);
void GUI_AA__DrawCharAA4(int x0, int y0, int XSize, int YSize, int BytesPerLine, const unsigned char * pData);

 
int        GUI_SIF__GetCharDistX(unsigned short c);
void       GUI_SIF__GetFontInfo        (const GUI_FONT  * pFont, GUI_FONTINFO * pfi);
char       GUI_SIF__IsInFont           (const GUI_FONT  * pFont, unsigned short c);
const unsigned char * GUI_SIF__GetpCharInfo       (const GUI_FONT  * pFont, unsigned short c, unsigned SizeOfCharInfo);
int        GUI_SIF__GetNumCharAreas    (const GUI_FONT  * pFont);
int        GUI_SIF__GetCharDistX_ExtFrm(unsigned short c);
void       GUI_SIF__GetFontInfo_ExtFrm (const GUI_FONT  * pFont, GUI_FONTINFO * pfi);
char       GUI_SIF__IsInFont_ExtFrm    (const GUI_FONT  * pFont, unsigned short c);
int        GUI_SIF__GetCharInfo_ExtFrm (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void       GUI_SIF__ClearLine_ExtFrm   (const char  * s, int Len);

 
int        GUI_XBF__GetOff       (const GUI_XBF_DATA * pXBF_Data, unsigned c, unsigned long * pOff);
int        GUI_XBF__GetOffAndSize(const GUI_XBF_DATA * pXBF_Data, unsigned c, unsigned long * pOff, unsigned short * pSize);
int        GUI_XBF__GetCharDistX (unsigned short c);
void       GUI_XBF__GetFontInfo  (const GUI_FONT  * pFont, GUI_FONTINFO * pInfo);
char       GUI_XBF__IsInFont     (const GUI_FONT  * pFont, unsigned short c);
int        GUI_XBF__GetCharInfo  (unsigned short c, GUI_CHARINFO_EXT * pInfo);
void       GUI_XBF__ClearLine    (const char  * s, int Len);

 
void GUI_AddHex     (unsigned long v, unsigned char Len, char ** ps);
void GUI_AddBin     (unsigned long v, unsigned char Len, char ** ps);
void GUI_AddDecMin  (signed long v, char ** ps);
void GUI_AddDec     (signed long v, unsigned char Len, char ** ps);
void GUI_AddDecShift(signed long v, unsigned char Len, unsigned char Shift, char ** ps);
long GUI_AddSign    (long v, char ** ps);
int  GUI_Long2Len   (signed long v);




int   GUI_UC__CalcSizeOfChar   (unsigned short Char);
unsigned short   GUI_UC__GetCharCodeInc   (const char  ** ps);
int   GUI_UC__NumChars2NumBytes(const char  * s, int NumChars);
int   GUI_UC__NumBytes2NumChars(const char  * s, int NumBytes);

int  GUI__GetLineNumChars  (const char  * s, int MaxNumChars);
int  GUI__GetNumChars      (const char  * s);
int  GUI__GetOverlap       (unsigned short Char);
int  GUI__GetLineDistX     (const char  * s, int Len);
int  GUI__GetFontSizeY     (void);
int  GUI__HandleEOLine     (const char  ** ps);
void GUI__DispLine         (const char  * s, int Len, const GUI_RECT* pr);
void GUI__AddSpaceHex      (unsigned long v, unsigned char Len, char ** ps);
void GUI__CalcTextRect     (const char  * pText, const GUI_RECT* pTextRectIn, GUI_RECT* pTextRectOut, int TextAlign);

int  GUI__WrapGetNumCharsDisp       (const char  * pText, int xSize, GUI_WRAPMODE WrapMode);
int  GUI__WrapGetNumCharsToNextLine (const char  * pText, int xSize, GUI_WRAPMODE WrapMode);
int  GUI__WrapGetNumBytesToNextLine (const char  * pText, int xSize, GUI_WRAPMODE WrapMode);
void GUI__memset    (unsigned char * p, unsigned char Fill, int NumBytes);
void GUI__memset16  (unsigned short* p, unsigned short Fill, int NumWords);
int  GUI__strlen    (const char  * s);
int  GUI__strcmp    (const char  * s0, const char  * s1);
int  GUI__strcmp_hp (signed long hs0, const char  * s1);

 
int  GUI__GetCursorPosX     (const char  * s, int Index, int MaxNumChars);
int  GUI__GetCursorPosChar  (const char  * s, int x, int NumCharsToNextLine);
unsigned short  GUI__GetCursorCharacter(const char  * s, int Index, int MaxNumChars, int * pIsRTL);

 
unsigned short  GUI__GetPresentationForm     (unsigned short Char, unsigned short Next, unsigned short Prev, int * pIgnoreNext, const char  * s);
int  GUI__IsArabicCharacter       (unsigned short c);

 
int  GUI__BIDI_Log2Vis         (const char  * s, int NumChars, char * pBuffer, int BufferSize);
int  GUI__BIDI_GetCursorPosX   (const char  * s, int NumChars, int Index);
int  GUI__BIDI_GetCursorPosChar(const char  * s, int NumChars, int x);
unsigned short  GUI__BIDI_GetLogChar      (const char  * s, int NumChars, int Index);
int  GUI__BIDI_GetCharDir      (const char  * s, int NumChars, int Index);
int  GUI__BIDI_IsNSM           (unsigned short Char);

 
const GUI_FONT_PROP * GUIPROP__FindChar(const GUI_FONT_PROP * pProp, unsigned short c);

 
const GUI_FONT_PROP_EXT  * GUIPROP_EXT__FindChar(const GUI_FONT_PROP_EXT * pPropExt, unsigned short c);
void  GUIPROP_EXT__DispLine      (const char  * s, int Len);
void  GUIPROP_EXT__ClearLine     (const char  * s, int Len);
void  GUIPROP_EXT__SetfpClearLine(void (* fpClearLine)(const char  * s, int Len));

 
unsigned short GUI__Read16(const unsigned char ** ppData);
unsigned long GUI__Read32(const unsigned char ** ppData);

 
void GUI__GetOrg(int * px, int * py);
void GUI__SetOrgHook(void(* pfHook)(int x, int y));

 
int              GUI_TIMER__IsActive    (void);
int   GUI_TIMER__GetPeriod   (void);
GUI_TIMER_HANDLE GUI_TIMER__GetNextTimer(GUI_TIMER_HANDLE hTimer, unsigned long * pContext);

 
tLCDDEV_Index2Color * GUI_GetpfIndex2ColorEx(int LayerIndex);
tLCDDEV_Color2Index * GUI_GetpfColor2IndexEx(int LayerIndex);

unsigned long*  LCD_GetpPalConvTable        (const LCD_LOGPALETTE  *  pLogPal);
unsigned long*  LCD_GetpPalConvTableUncached(const LCD_LOGPALETTE  *  pLogPal);

 
#line 349 "GUI\\GUI_Private.h"

void GUI__ReadHeaderFromStream  (GUI_BITMAP_STREAM * pBitmapHeader, const unsigned char * pData);
void GUI__CreateBitmapFromStream(GUI_BITMAP_STREAM * pBitmapHeader, const unsigned char * pData, GUI_BITMAP * pBMP, GUI_LOGPALETTE * pPAL, const GUI_BITMAP_METHODS * pMethods);






 
void GL_DispChar         (unsigned short c);
void GL_DrawArc          (int x0, int y0, int rx, int ry, int a0, int a1);
void GL_DrawBitmap       (const GUI_BITMAP  * pBM, int x0, int y0);
void GL_DrawCircle       (int x0, int y0, int r);
void GL_DrawEllipse      (int x0, int y0, int rx, int ry);
void GL_DrawHLine        (int y0, int x0, int x1);
void GL_DrawPolygon      (const GUI_POINT* pPoints, int NumPoints, int x0, int y0);
void GL_DrawPoint        (int x, int y);
void GL_DrawLine1        (int x0, int y0, int x1, int y1);
void GL_DrawLine1Ex      (int x0, int y0, int x1, int y1, unsigned * pPixelCnt);
void GL_DrawLineRel      (int dx, int dy);
void GL_DrawLineTo       (int x, int y);
void GL_DrawLineToEx     (int x, int y, unsigned * pPixelCnt);
void GL_DrawLine         (int x0, int y0, int x1, int y1);
void GL_DrawLineEx       (int x0, int y0, int x1, int y1, unsigned * pPixelCnt);
void GL_MoveTo           (int x, int y);
void GL_FillCircle       (int x0, int y0, int r);
void GL_FillCircleAA     (int x0, int y0, int r);
void GL_FillEllipse      (int x0, int y0, int rx, int ry);
void GL_FillPolygon      (const GUI_POINT* pPoints, int NumPoints, int x0, int y0);
void GL_SetDefault       (void);








 
typedef int  GUI_tfTimer(void);
typedef int  WM_tfHandlePID(void);







 
extern const unsigned char  GUI_Pixels_ArrowS[45];
extern const unsigned char  GUI_Pixels_ArrowM[60];
extern const unsigned char  GUI_Pixels_ArrowL[150];
extern const unsigned char  GUI_Pixels_CrossS[33];
extern const unsigned char  GUI_Pixels_CrossM[126];
extern const unsigned char  GUI_Pixels_CrossL[248];
extern const unsigned char  GUI_PixelsHeaderM[5 * 17];

extern const GUI_LOGPALETTE GUI_CursorPal;
extern const GUI_LOGPALETTE GUI_CursorPalI;







 
extern GUI_RECT  GUI_RectDispString;  






 
extern unsigned char GUI__CharHasTrans;






 
extern int GUITASK__EntranceCnt;






 

int       GUI_GetBitmapPixelIndex(const GUI_BITMAP  * pBMP, unsigned x, unsigned y);
GUI_COLOR GUI_GetBitmapPixelColor(const GUI_BITMAP  * pBMP, unsigned x, unsigned y);
int       GUI_GetBitmapPixelIndexEx(int BitsPerPixel, int BytesPerLine, const unsigned char  * pData, unsigned x, unsigned y);

void      GUI__DrawBitmap16bpp(int x0, int y0, int xsize, int ysize, const unsigned char  * pPixel, const LCD_LOGPALETTE  * pLogPal, int xMag, int yMag, tLCDDEV_Index2Color * pfIndex2Color);
void      GUI__SetPixelAlpha  (int x, int y, unsigned char Alpha, LCD_COLOR Color);
LCD_COLOR GUI__MixColors      (LCD_COLOR Color, LCD_COLOR BkColor, unsigned char Intens);

extern const GUI_UC_ENC_APILIST GUI_UC_None;






 



#line 472 "GUI\\GUI_Private.h"

void LCD_ReadRect  (int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
void GUI_ReadRect  (int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);
void GUI_ReadRectEx(int x0, int y0, int x1, int y1, unsigned long * pBuffer, GUI_DEVICE * pDevice);






 
typedef struct {
  void         (* pfSetColor)   (LCD_COLOR Index);
  void         (* pfSetBkColor) (LCD_COLOR Index);
  LCD_DRAWMODE (* pfSetDrawMode)(LCD_DRAWMODE dm);
} LCD_SET_COLOR_API;

extern const LCD_SET_COLOR_API * LCD__pSetColorAPI;

extern unsigned long * LCD_pBkColorIndex;
extern unsigned long * LCD_pColorIndex;






 








 






extern  GUI_CONTEXT        GUI_Context;         
extern  char               GUI_DecChar;
extern           GUI_tfTimer*       GUI_pfTimerExec;
extern           WM_tfHandlePID*    WM_pfHandlePID;
extern      void (*GUI_pfDispCharStyle)(unsigned short Char);


  extern const     tLCD_APIList *     GUI_pLCD_APIList;    


extern signed short GUI_OrgX, GUI_OrgY;










 
#line 26 "GUI\\GUI_VNC.h"











 












 
typedef int (*GUI_tSend)   (const unsigned char * pData, int len, void* pConnectInfo);
typedef int (*GUI_tReceive)(      unsigned char * pData, int len, void* pConnectInfo);

typedef struct GUI_VNC_CONTEXT {
  GUI_DEVICE * pDevice;
  struct GUI_VNC_CONTEXT * pNext;
  int LayerIndex;
  int BytesPerPixel;
  int BitsPerPixel;  
  
  
  
  GUI_tSend    pfSend;
  GUI_tReceive pfReceive;
  void       * pConnectInfo;
  unsigned short          ServerIndex;
  
  
  
  int x0Dirty, y0Dirty, x1Dirty, y1Dirty;
  int XSize, YSize;
  int xOrg, yOrg, xOrgNew, yOrgNew;
  int OrgLock;
  
  
  
  char ClientSupportsHextile;
  char IsBigEndian;
} GUI_VNC_CONTEXT;

typedef struct {
  void (* pfGetChallenge)(unsigned char * pChallenge);
  void (* pfGetResponse )(unsigned char * pResponse );
} GUI_VNC_AUTHENTICATION;






 
void GUI_VNC_SetDESKey(unsigned char * pKey, int Mode);
void GUI_VNC_DoDES    (unsigned char * pInblock, unsigned char * pOutblock);






 
void GUI_VNC_AttachToLayer      (GUI_VNC_CONTEXT * pContext, int LayerIndex);
void GUI_VNC_EnableKeyboardInput(int OnOff);
int  GUI_VNC_GetNumConnections  (void);
int  GUI_VNC_Process            (GUI_VNC_CONTEXT * pContext, GUI_tSend pfSend, GUI_tReceive pfReceive, void * pConnectInfo);
void GUI_VNC_RingBell           (void);
void GUI_VNC_SetAuthentication  (GUI_VNC_AUTHENTICATION * pAuthentication);
void GUI_VNC_SetPassword        (unsigned char * sPassword);
void GUI_VNC_SetProgName        (const char * sProgName);
void GUI_VNC_SetSize            (unsigned xSize, unsigned ySize);

 
int  GUI_VNC_X_StartServer(int LayerIndex, int ServerIndex);
void GUI_VNC_X_getpeername(unsigned long * Addr);







 
#line 27 "GUI\\GUI_VNC_X_StartServer.c"
#line 1 "Inc\\TaskPrio.h"












 







 
enum {
  TASKPRIO_TOUCH = 100,   
  TASKPRIO_WINDOW,        
  TASKPRIO_FTPSCHILD,     
  TASKPRIO_FTPSPARENT,    
  TASKPRIO_FTPS,          
  TASKPRIO_WEBS,          
  TASKPRIO_WEBSCHILD,     
  TASKPRIO_WEBSPARENT,    
  TASKPRIO_USB,           
  TASKPRIO_MAINTASK,      
  TASKPRIO_VNC,           
  TASKPRIO_USBH_MAIN,     
  TASKPRIO_USBH_ISR,      
  TASKPRIO_IPMAIN,        
  TASKPRIO_IPRX,          
  TASKPRIO_TRIALWINDOW    
};




 
#line 28 "GUI\\GUI_VNC_X_StartServer.c"






 
static GUI_VNC_CONTEXT    _Context;
static struct sockaddr_in _Addr;




static  int _StackVNCServer[1000];




static OS_TASK         _VNCServer_TCB;






 








 
static int _Send(const unsigned char * buf, int len, void * pConnectionInfo) {
  int r;

  r = t_send((long)pConnectionInfo, (const char *)buf, len, 0);
  return r;
}









 
static int _Recv(unsigned char * buf, int len, void * pConnectionInfo) {
  return t_recv((long)pConnectionInfo, (char *)buf, len, 0);
}






 
static int _ListenAtTcpAddr(unsigned short Port) {
  int sock;
  struct sockaddr_in addr;

  sock = t_socket(2,1,0);
  memset(&addr, 0, sizeof(addr));
  addr.sin_family      = 2;
  addr.sin_port        = ((unsigned short)((unsigned short)(Port) >> 8) | (unsigned short)((unsigned short)(Port) << 8));
  addr.sin_addr.s_addr = 0L;
  t_bind(sock,(struct sockaddr *)&addr,sizeof(addr));
  t_listen(sock,1);
  return sock;
}













 
static void _ServerTask(void) {
  int s, Sock, AddrLen;
  unsigned short Port;

  
  
  
  Port = 5900 + _Context.ServerIndex; 
  
  
  
  do {
    s = _ListenAtTcpAddr(Port);
    if (s != -1) {
      break;
    }
    OS_Delay(100); 
  } while (1);
  
  
  
  while (1) {
    
    
    
    AddrLen = sizeof(_Addr);
    if ((Sock = t_accept(s, (struct sockaddr*)&_Addr, &AddrLen)) == -1) {
      continue; 
    }
    
    
    
    GUI_VNC_Process(&_Context, _Send, _Recv, (void *)Sock);
    
    
    
    t_socketclose(Sock);
    memset(&_Addr, 0, sizeof(struct sockaddr_in));
  }
}






 














 
int GUI_VNC_X_StartServer(int LayerIndex, int ServerIndex) {
  
  
  
  GUI_VNC_AttachToLayer(&_Context, LayerIndex);
  _Context.ServerIndex = ServerIndex;
  
  
  
  OS_CreateTask_R (&_VNCServer_TCB, "VNC Server", TASKPRIO_VNC, _ServerTask, (void *)_StackVNCServer, sizeof(_StackVNCServer) ,2 );
  
  
  
  return 0;
}











 
void GUI_VNC_X_getpeername(unsigned long * Addr) {
  *Addr = _Addr.sin_addr.s_addr;
}

 

