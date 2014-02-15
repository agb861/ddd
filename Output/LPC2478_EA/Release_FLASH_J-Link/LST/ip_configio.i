#line 1 "Config\\IP_ConfigIO.c"















 

#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
 
 
 





 






 













#line 38 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 129 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 948 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"



 

#line 19 "Config\\IP_ConfigIO.c"
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









#line 20 "Config\\IP_ConfigIO.c"
#line 1 "OS\\RTOS.h"
















 









 

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



 

#line 30 "OS\\RTOS.h"






 

#line 50 "OS\\RTOS.h"

 






 











 





 




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



 
#line 187 "OS\\RTOS.h"















 



 
#line 213 "OS\\RTOS.h"

#line 283 "OS\\RTOS.h"












 






 

#line 310 "OS\\RTOS.h"































































 










































#line 423 "OS\\RTOS.h"






















 

#line 453 "OS\\RTOS.h"

#line 460 "OS\\RTOS.h"






 

































 


















 

 

 




 
 


 


 





 







 


 




 



 
#line 569 "OS\\RTOS.h"









 
#line 586 "OS\\RTOS.h"

 


 
#line 597 "OS\\RTOS.h"

 



 


 




 




 


 


 












 





 
#line 651 "OS\\RTOS.h"

 





 
#line 669 "OS\\RTOS.h"

#line 676 "OS\\RTOS.h"






 
#line 689 "OS\\RTOS.h"

 
#line 699 "OS\\RTOS.h"

 
#line 708 "OS\\RTOS.h"

 




 














 


















 





#line 761 "OS\\RTOS.h"

 

































 

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







 




 
#line 1107 "OS\\RTOS.h"

 

 




 

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
#line 1154 "OS\\RTOS.h"


    extern  unsigned char OS_POWER_Levels[(5)];


  



 

    extern   OS_TASK      * OS_pTask;              
    extern   OS_TASK      * OS_pCurrentTask;       
    extern   OS_TASK volatile * volatile OS_pActiveTask;
    extern   OS_TIMER     * OS_pTimer;             
    extern   OS_TIMER     * OS_pCurrentTimer;      
    extern  OS_RSEMA      * OS_pRSema;
#line 1177 "OS\\RTOS.h"
    extern    OS_MEMF      * OS_pMEMF;             
    extern    OS_TICK_HOOK * OS_pTickHook;         
#line 1196 "OS\\RTOS.h"

#line 1269 "OS\\RTOS.h"

 




 








 






#line 1311 "OS\\RTOS.h"

#line 1334 "OS\\RTOS.h"





 












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




#line 1440 "OS\\RTOS.h"

unsigned int OS_GetSysStackBase(void);   
unsigned int OS_GetSysStackSize(void);   
unsigned int OS_GetIntStackBase(void);   
unsigned int OS_GetIntStackSize(void);   


  unsigned char OS_SetTimeSlice(OS_TASK * pTask, unsigned char TimeSlice);
  unsigned char OS_GetTimeSliceRem(OS_TASK  * pTask);






unsigned char    OS_GetPriority(OS_TASK * pTask);   


int     OS_GetNumTasks(void);               

OS_TASK* OS_TaskIndex2Ptr(int TaskIndex);   

#line 1475 "OS\\RTOS.h"


#line 1484 "OS\\RTOS.h"






 

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





 

#line 1535 "OS\\RTOS.h"

#line 1543 "OS\\RTOS.h"






 




void OS_RestoreI(void);   






 










#line 1589 "OS\\RTOS.h"

#line 1597 "OS\\RTOS.h"


void OS_CallISR        (void (*pRoutine)(void));
void OS_CallNestableISR(void (*pRoutine)(void));


#line 1610 "OS\\RTOS.h"



















#line 1638 "OS\\RTOS.h"







#line 1651 "OS\\RTOS.h"

#line 1659 "OS\\RTOS.h"

#line 1666 "OS\\RTOS.h"







#line 1681 "OS\\RTOS.h"

#line 1690 "OS\\RTOS.h"











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






 

#line 1818 "OS\\RTOS.h"

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

#line 1849 "OS\\RTOS.h"















 


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








 
#line 1943 "OS\\RTOS.h"

void    OS_POWER_UsageInc(unsigned int Level);
void    OS_POWER_UsageDec(unsigned int Level);
unsigned int OS_POWER_GetMask(void);







 
#line 1962 "OS\\RTOS.h"






 



















 

#line 2022 "OS\\RTOS.h"
   
#line 2036 "OS\\RTOS.h"
   
   






#line 2052 "OS\\RTOS.h"









 

 
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









 




 
#line 2112 "OS\\RTOS.h"

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

 





 







 

#line 21 "Config\\IP_ConfigIO.c"










 
















 
static void _puts(const char * s) {
  char c;
  for (;;) {
   c = *s++;
   if (c == 0) {
     break;
   }



   putc(c, (& __stdout));

  }
}




 
static char * _WriteUnsigned(char * s, unsigned long v, int NumDigits) {
  unsigned Base;
  unsigned Div;
  unsigned long Digit;

  Digit = 1;
  Base  = 10;
  
  
  
  while (((v / Digit) >= Base) | (NumDigits-- > 1)) {
    Digit *= Base;
  }
  
  
  
  do {
    Div = v / Digit;
    v  -= Div * Digit;
    *s++ = (char)('0' + Div);
    Digit /= Base;
  } while (Digit);
  *s = 0;
  return s;
}







 
static void _ShowStamp(void) {

  {
    signed long Time;
    char ac[20];
    char * sBuffer = &ac[0];
    Time = (OS_Time);
    sBuffer = _WriteUnsigned(sBuffer, Time / 1000, 0);
    *sBuffer++ = ':';
    sBuffer = _WriteUnsigned(sBuffer, Time % 1000, 3);
    *sBuffer++ = ' ';
    *sBuffer++ = 0;
    _puts(ac);
  }



  {
    const char * s;
    s = OS_GetTaskName(0);
    if (s) {
      _puts(s);
      _puts(" - ");
    }
  }

}










 
void IP_Panic(const char * s) {
  (void)s;
  IP_OS_DisableInterrupt();





  while (1);
}

















 
void IP_Log(const char * s) {

  IP_OS_DisableInterrupt();
  _ShowStamp();
  _puts(s);
  _puts("\n");
  IP_OS_EnableInterrupt();
}












 
void IP_Warn(const char * s) {
  IP_OS_DisableInterrupt();
  _ShowStamp();
  _puts("*** Warning *** ");
  _puts(s);
  _puts("\n");
  IP_OS_EnableInterrupt();
}


 
