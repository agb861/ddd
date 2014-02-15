#line 1 "Setup\\IP_Config_LPC24xx.c"















 

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



 

#line 19 "Setup\\IP_Config_LPC24xx.c"
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









#line 20 "Setup\\IP_Config_LPC24xx.c"






 







 
static unsigned long _aPool[0x8000 / 4];                    






 
































 
void IP_X_Config(void) {
  int mtu;

  IP_AssignMemory(_aPool, sizeof(_aPool));    
  IP_AddEtherInterface(&IP_Driver_LPC24xx);   
  IP_SetHWAddr("\x00\x22\xC7\xFF\xFF\xFF");   
  
  
  
  
  
  IP_DHCPC_Activate(0, "TARGET", 0, 0);
  
  
  
  
  
  
  
  mtu = 1500;                                      
  IP_SetMTU(0, mtu);                               
  IP_AddBuffers(12, 256);                          
  IP_AddBuffers(8, mtu + 40 + 16);                 
  IP_ConfTCPSpace(3 * (mtu - 40), 3 * (mtu - 40)); 
  IP_SOCKET_SetDefaultOptions(0

                             );  
  
  
  
  
  
  
  IP_SetWarnFilter(0xFFFFFFFF);               
  IP_SetLogFilter((1UL << 0)               
                | (1UL << 14)        
                | (1UL << 17)               
























                | (1UL << 19)
                );
}

 
