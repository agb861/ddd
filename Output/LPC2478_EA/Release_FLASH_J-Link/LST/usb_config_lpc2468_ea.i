#line 1 "Setup\\USB_Config_LPC2468_EA.c"















 

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



 

#line 19 "Setup\\USB_Config_LPC2468_EA.c"
#line 1 "USB\\USB.h"
















 




#line 1 "GUI\\Global.h"















 









 
#line 33 "GUI\\Global.h"



 
#line 23 "USB\\USB.h"
#line 1 "Config\\USB_Conf.h"















 






















#line 45 "Config\\USB_Conf.h"


#line 24 "USB\\USB.h"
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



 

#line 25 "USB\\USB.h"










 

 






 




#line 56 "USB\\USB.h"














 





 








 






 









 







 
typedef struct USB_INFO_BUFFER USB_INFO_BUFFER;
typedef struct EP_STAT EP_STAT;

typedef struct {
  unsigned char bmRequestType;
  unsigned char bRequest;
  unsigned char wValueLow;
  unsigned char wValueHigh;
  unsigned char wIndexLow;
  unsigned char wIndexHigh;
  unsigned char wLengthLow;
  unsigned char wLengthHigh;
} USB_SETUP_PACKET;

typedef struct {
  unsigned char EPIn;
  unsigned char EPOut;
} USB_BULK_INIT_DATA;

typedef struct USB_HOOK {
  struct USB_HOOK * pNext;
  void    (*cb) (void* pContext);
  void     * pContext;
  unsigned   SizeOfContext;
} USB_HOOK;

typedef struct USB_HW_DRIVER {
  void     (*pfInit)                (void);
  unsigned char       (*pfAllocEP)             (unsigned char  InDir, unsigned char TransferType);
  void     (*pfUpdateEP)            (EP_STAT * pEPStat);
  void     (*pfEnable)              (void);
  void     (*pfAttach)              (void);
  unsigned (*pfGetMaxPacketSize)    (unsigned char  EPIndex);
  int      (*pfIsInHighSpeedMode)   (void);
  void     (*pfSetAddress)          (unsigned char  Addr);
  void     (*pfSetClrStallEP)       (unsigned char  EPIndex, int OnOnff);
  void     (*pfStallEP0)            (void);
  void     (*pfDisableRxInterruptEP)(unsigned char  EPIndex);
  void     (*pfEnableRxInterruptEP) (unsigned char  EPIndex);
  void     (*pfStartTx)             (unsigned char  EPIndex);
  void     (*pfSendEP)              (unsigned char  EPIndex, const unsigned char * p, unsigned NumBytes);
  void     (*pfDisableTx)           (unsigned char  EPIndex);
  void     (*pfResetEP)             (unsigned char  EPIndex);
  int      (*pfControl)             (int Cmd, void * p);
} USB_HW_DRIVER;

typedef int  USB_ON_CLASS_REQUEST(const USB_SETUP_PACKET * pSetupPacket);
typedef int  USB_ON_SETUP        (const USB_SETUP_PACKET * pSetupPacket);
typedef void USB_ADD_FUNC_DESC   (USB_INFO_BUFFER * pInfoBuffer);
typedef void USB_ON_RX_FUNC      (const unsigned char * pData, unsigned NumBytes);
typedef void USB_ISR_HANDLER     (void);






 
unsigned USB_AddEP                   (unsigned char InDir, unsigned char TransferType, unsigned short Interval, unsigned char * pBuffer, unsigned BufferSize);
void     USB_EnableIAD               (void);
int      USB_GetState                (void);
void     USB_Init                    (void);
char     USB_IsConfigured            (void);
void     USB_Start                   (void);
void     USB_SetMaxPower             (unsigned char MaxPower);
int      USB_RegisterSCHook          (USB_HOOK * pHook, void (*cb) (void* pContext), void * pContext, unsigned SizeOfContext);
int      USB_UnregisterSCHook        (USB_HOOK * pHook);

void     USB_CancelIO                (unsigned char EPIndex);
unsigned USB_GetNumBytesInBuffer     (unsigned char EPIndex);
int      USB_ReadEP                  (unsigned char EPOut, void * pData, unsigned NumBytesReq);
int      USB_ReadEPOverlapped        (unsigned char EPOut, void * pData, unsigned NumBytesReq);
int      USB_ReadEPTimed             (unsigned char EPOut, void * pData, unsigned NumBytesReq, unsigned ms);
int      USB_ReceiveEP               (unsigned char EPOut, void * pData, unsigned NumBytesReq);
int      USB_ReceiveEPTimed          (unsigned char EPOut, void* pData, unsigned NumBytesReq, unsigned ms);
void     USB_SetOnRXHookEP           (unsigned char EPIndex, USB_ON_RX_FUNC * pfOnRx);
void     USB_SetClrStallEP           (unsigned char EPIndex, int OnOff);
void     USB_StallEP                 (unsigned char EPIndex);
void     USB_WaitForEndOfTransfer    (unsigned char EPIndex);
int      USB_WriteEP                 (unsigned char EPIndex, const void* pData, unsigned NumBytes, char Send0PacketIfRequired);
int      USB_WriteEPOverlapped       (unsigned char EPIndex, const void* pData, unsigned NumBytes, char Send0PacketIfRequired);
int      USB_WriteEPTimed            (unsigned char EPIndex, const void* pData, unsigned NumBytes, char Send0PacketIfRequired, unsigned ms);

void     USB_SetAddFuncDesc          (USB_ADD_FUNC_DESC    * pfAddDescFunc);
void     USB_SetClassRequestHook     (unsigned InterfaceNum, USB_ON_CLASS_REQUEST * pfOnClassrequest);
void     USB_SetOnSetupHook          (unsigned InterfaceNum, USB_ON_SETUP         * pfOnSetup);
void     USB_SetOnRxEP0              (USB_ON_RX_FUNC       * pfOnRx);





 
void     USB_BULK_Add                 (const USB_BULK_INIT_DATA * pInitData);
void     USB_BULK_CancelRead          (void);
void     USB_BULK_CancelWrite         (void);
unsigned USB_BULK_GetNumBytesInBuffer (void);
unsigned USB_BULK_GetNumBytesRemToRead(void);
unsigned USB_BULK_GetNumBytesToWrite  (void);
int      USB_BULK_Read                (      void * pData, unsigned NumBytes);
int      USB_BULK_ReadOverlapped      (      void * pData, unsigned NumBytes);
int      USB_BULK_ReadTimed           (      void * pData, unsigned NumBytes, unsigned ms);
int      USB_BULK_Receive             (      void * pData, unsigned NumBytes);
int      USB_BULK_ReceiveTimed        (      void * pData, unsigned NumBytes, unsigned ms);
void     USB_BULK_SetOnRXHook         (USB_ON_RX_FUNC * pfOnRx);
void     USB_BULK_WaitForRX           (void);
void     USB_BULK_WaitForTX           (void);
int      USB_BULK_Write               (const void * pData, unsigned NumBytes);
int      USB_BULK_WriteEx             (const void * pData, unsigned NumBytes, char Send0PacketIfRequired);
int      USB_BULK_WriteExTimed        (const void * pData, unsigned NumBytes, char Send0PacketIfRequired, unsigned ms);
int      USB_BULK_WriteOverlapped     (const void * pData, unsigned NumBytes);
int      USB_BULK_WriteOverlappedEx   (const void * pData, unsigned NumBytes, char Send0PacketIfRequired);
int      USB_BULK_WriteTimed          (const void * pData, unsigned NumBytes, unsigned ms);
void     USB_BULK_WriteNULLPacket     (void);





 
void     USB_OS_Init                   (void);
void     USB_OS_Delay                  (int ms);
void     USB_OS_DecRI                  (void);
unsigned long      USB_OS_GetTickCnt             (void);
void     USB_OS_IncDI                  (void);
void     USB_OS_Panic                  (unsigned ErrCode);
void     USB_OS_Signal                 (unsigned EPIndex);
void     USB_OS_Wait                   (unsigned EPIndex);
int      USB_OS_WaitTimed              (unsigned EPIndex, unsigned ms);





 
const char * USB_GetVendorName  (void);
const char * USB_GetProductName (void);
const char * USB_GetSerialNumber(void);





 
unsigned short  USB_GetVendorId(void);
unsigned short  USB_GetProductId(void);






 
void USB_AddDriver(const USB_HW_DRIVER * pDriver);






 
void USB_X_AddDriver(void);
void USB_X_HWAttach(void);
void USB_X_EnableISR(USB_ISR_HANDLER * pfISRHandler);





 
extern const USB_HW_DRIVER USB_Driver_AtmelCAP9;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM3U;
extern const USB_HW_DRIVER USB_Driver_AtmelRM9200;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM7A3;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM7S;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM7SE;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM7X;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM9260;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM9261;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM9263;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM9G20;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM9Rx64;
extern const USB_HW_DRIVER USB_Driver_AtmelSAM9XE;
extern const USB_HW_DRIVER USB_Driver_NEC_uPD720150;
extern const USB_HW_DRIVER USB_Driver_NXPLPC17xx;
extern const USB_HW_DRIVER USB_Driver_NXPLPC214x;
extern const USB_HW_DRIVER USB_Driver_NXPLPC23xx;
extern const USB_HW_DRIVER USB_Driver_NXPLPC24xx;
extern const USB_HW_DRIVER USB_Driver_NXPLPC318x;
extern const USB_HW_DRIVER USB_Driver_OKI69Q62;
extern const USB_HW_DRIVER USB_Driver_SharpLH79524;
extern const USB_HW_DRIVER USB_Driver_SharpLH7A40x;
extern const USB_HW_DRIVER USB_Driver_STSTM32;
extern const USB_HW_DRIVER USB_Driver_STSTR71x;
extern const USB_HW_DRIVER USB_Driver_STSTR750;
extern const USB_HW_DRIVER USB_Driver_STSTR91x;
extern const USB_HW_DRIVER USB_Driver_H8SX1668R;
extern const USB_HW_DRIVER USB_Driver_H8S2472;
extern const USB_HW_DRIVER USB_Driver_TMPA910;
extern const USB_HW_DRIVER USB_Driver_TMPA900;
extern const USB_HW_DRIVER USB_Driver_NEC_70F376x;
extern const USB_HW_DRIVER USB_Driver_SH7203;
extern const USB_HW_DRIVER USB_Driver_TI_MSP430;





#line 20 "Setup\\USB_Config_LPC2468_EA.c"






 
 






 









 



#line 56 "Setup\\USB_Config_LPC2468_EA.c"


























 




 
void USB_X_HWAttach(void) {
  
  
  
  (*(volatile unsigned long *)((0xE002C000) + 0x0004)) |=  (1 << 26)   
          |   (1 << 28)   
          |   (1 << 30)   
          ;
  (*(volatile unsigned long *)((0xE002C000) + 0x000C)) |=  (1 <<  4);  
  (*(volatile unsigned long *)((0xE002C000) + 0x000C)) &= ~(3 << 28);  
            ;
  (*(volatile unsigned long *)((0xE002C000) + 0x0010)) &= ~(3 << 18);  
  
  
  
  
  
  (*(volatile unsigned long*)(0xFFE0C110))  = 0;
  (*(volatile unsigned long *)((0x3FFFC000) + 0x40))      |= (1 << 9);
  (*(volatile unsigned long *)((0x3FFFC000) + 0x5C))       = (1 << 9);
  
  
  
  (*(volatile unsigned long *)((0xE0028000) + 0x08)) |= (1 << 14);  
  (*(volatile unsigned long *)((0xE0028000) + 0x00)) &= ~(1 << 14);  
}





 





 
void USB_X_AddDriver(void) {
  USB_AddDriver(&USB_Driver_NXPLPC24xx);
}






 
static USB_ISR_HANDLER* _InstallISRHandler(int ISRIndex, USB_ISR_HANDLER* pISRHandler) {
  USB_ISR_HANDLER*  pfOldHandler;
  USB_ISR_HANDLER** papfISR;

  pfOldHandler = 0;
  USB_OS_IncDI();
  papfISR = (USB_ISR_HANDLER**) & *(volatile unsigned long*)((0xFFFFF000) + 0x100);
  if (ISRIndex < (32)) {
    pfOldHandler          = *(papfISR + ISRIndex);
    *(papfISR + ISRIndex) = pISRHandler;
  }
  USB_OS_DecRI();
  return pfOldHandler;
}





 
static void _EnableISR(int ISRIndex) {
  if (ISRIndex < (32)) {
    USB_OS_IncDI();
    *(volatile unsigned long*)((0xFFFFF000) + 0x010) = (1UL << ISRIndex);
    USB_OS_DecRI();
  }
}




 
static int _ISRSetPrio(int ISRIndex, int Prio) {
  unsigned long   * pPrio;
  int     OldPrio;

  USB_OS_IncDI();
  pPrio = (unsigned long*) ((0xFFFFF000) + 0x200);
  OldPrio = pPrio[ISRIndex];
  pPrio[ISRIndex] = (OldPrio & ~((16) - 1)) | (Prio & ((16) - 1));
  USB_OS_DecRI();
  return OldPrio & ((16) - 1);
}





 
void USB_X_EnableISR(USB_ISR_HANDLER * pfISRHandler) {
  _InstallISRHandler((22), pfISRHandler);
  _EnableISR((22));
  _ISRSetPrio((22), 15);
}


 
