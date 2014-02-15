#line 1 "USB\\USB_OS_embOS.c"
















 


#line 1 "USB\\USB_Private.h"
















 





#line 1 "Config\\USB_Conf.h"















 






















#line 45 "Config\\USB_Conf.h"


#line 24 "USB\\USB_Private.h"
#line 1 "USB\\USB.h"
















 




#line 1 "GUI\\Global.h"















 









 
#line 33 "GUI\\Global.h"



 
#line 23 "USB\\USB.h"
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





#line 25 "USB\\USB_Private.h"
#line 26 "USB\\USB_Private.h"










 
























#line 63 "USB\\USB_Private.h"




 
#line 75 "USB\\USB_Private.h"






 
#line 89 "USB\\USB_Private.h"






 











 

enum {
  STRING_INDEX_LANGUAGE = 0,  
  STRING_INDEX_MANUFACTURER,  
  STRING_INDEX_PRODUCT,       
  STRING_INDEX_SN             
};

struct USB_INFO_BUFFER {
  unsigned Cnt;
  unsigned Sizeof;
  unsigned char * pBuffer;
};

typedef struct {
  unsigned char       * pData;
  unsigned   Size;
  unsigned   NumBytesIn;
  unsigned   RdPos;
} BUFFER;

struct EP_STAT {
  unsigned short             MaxPacketSize;
  unsigned short             Interval;
  unsigned char              EPType;
  unsigned char              EPAddr;       
  unsigned char              AllowShortPacket;
  volatile unsigned char     IsHalted;
  unsigned char           *  pData;
  volatile unsigned long    NumBytesRem;
  union {
    struct {
      volatile unsigned char     TxIsPending;
      volatile unsigned char     NextTransferPrepared;
      unsigned char              Send0PacketIfRequired;
    } TxInfo;
    USB_ON_RX_FUNC *  pfOnRx;
  } Dir;
  BUFFER          Buffer;
};

typedef struct {
  void (*pfAdd)(unsigned char FirstInterFaceNo, unsigned char NumInterfaces, unsigned char ClassNo, unsigned char SubClassNo, unsigned char ProtocolNo);
  void (*pfAddIadDesc)(int InterFaceNo, USB_INFO_BUFFER * pInfoBuffer);
} USB_IAD_API;

typedef struct {
  unsigned short                    EPs;
  unsigned char                     IFClass   ;    
  unsigned char                     IFSubClass;    
  unsigned char                     IFProtocol;    
  USB_ADD_FUNC_DESC    * pfAddFuncDesc;
  USB_ON_CLASS_REQUEST * pfOnClassRequest;
  USB_ON_SETUP         * pfOnSetup;
} INTERFACE;

typedef struct {
  unsigned char                     NumEPs;
  unsigned char                     NumIFs;
  unsigned char                     Class   ;    
  unsigned char                     SubClass;    
  unsigned char                     Protocol;    
  unsigned char                     OnTxBehavior;
  unsigned char                     SetAddressBehavior;
  volatile unsigned char            State;       
  volatile unsigned char            AllowRemoteWakeup;
  volatile unsigned char            Addr;
  INTERFACE              aIF[4];
  USB_ON_RX_FUNC       * pfOnRxEP0;
  const USB_HW_DRIVER  * pDriver;
  USB_IAD_API          * pIadAPI;
} GLOBAL;






 







extern EP_STAT USB_aEPStat[8];
extern GLOBAL  USB_Global;






 
#line 212 "USB\\USB_Private.h"








 
unsigned USB__CalcMaxPacketSize (unsigned MaxPacketSize, unsigned char TransferType, unsigned char IsHighSpeedMode);
unsigned char       USB__EPAddr2Index      (unsigned EPAddr);
unsigned char       USB__EPIndex2Addr      (unsigned char EPIndex);
void*    USB__GetpDest          (unsigned char EPIndex,    unsigned NumBytes);
unsigned short      USB__GetU16BE          (unsigned char * p);
unsigned short      USB__GetU16LE          (unsigned char * p);
unsigned long      USB__GetU32BE          (unsigned char * p);
unsigned long      USB__GetU32LE          (unsigned char * p);
void     USB__StoreU16BE        (unsigned char * p, unsigned v);
void     USB__StoreU16LE        (unsigned char * p, unsigned v);
void     USB__StoreU32LE        (unsigned char * p, unsigned long v);
void     USB__StoreU32BE        (unsigned char * p, unsigned long v);
void     USB__HandleSetup       (const USB_SETUP_PACKET * pSetupPacket);
void     USB__OnBusReset        (void);
void     USB__OnResume          (void);
void     USB__OnRx              (unsigned char EPIndex, const unsigned char * pData, unsigned Len);
void     USB__OnRxZeroCopy      (unsigned char EpIndex, unsigned NumBytes);
void     USB__OnSetupCancel     (void);
void     USB__OnStatusChange    (unsigned char State);
void     USB__OnSuspend         (void);
void     USB__OnTx              (unsigned char EPIndex);
void     USB__OnTx0Done         (void);
void     USB__Send              (unsigned char EPIndex);
void     USB__UpdateEPHW        (void);
void     USB__WriteEP0FromISR   (const void* pData, unsigned NumBytes, char Send0PacketIfRequired);
int      USB__IsHighSpeedCapable(void);
int      USB__IsHighSpeedMode   (void);
unsigned char       USB__AllocIF           (void);
void     USB__InvalidateEP      (unsigned char EPIndex);
void     USB__StallEP0          (void);

const unsigned char * USB__BuildConfigDesc(void);
const unsigned char * USB__BuildDeviceDesc(void);







 
void USB_IB_Init  (USB_INFO_BUFFER * pInfoBuffer, unsigned char * pBuffer, unsigned SizeofBuffer);
void USB_IB_AddU8 (USB_INFO_BUFFER * pInfoBuffer, unsigned char  Data);
void USB_IB_AddU16(USB_INFO_BUFFER * pInfoBuffer, unsigned short Data);
void USB_IB_AddU32(USB_INFO_BUFFER * pInfoBuffer, unsigned long Data);






 
unsigned BUFFER_Read (BUFFER * pBuffer,       unsigned char * pData, unsigned NumBytesReq);
void     BUFFER_Write(BUFFER * pBuffer, const unsigned char * pData, unsigned NumBytes);







 
#line 21 "USB\\USB_OS_embOS.c"
#line 1 "OS\\RTOS.h"
















 









 

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

 





 







 

#line 22 "USB\\USB_OS_embOS.c"






 
static OS_EVENT _aEvent[8];






 








 
void USB_OS_Init(void) {
  unsigned i;

  for (i = 0; i < (sizeof(_aEvent)/sizeof(_aEvent[0])); i++) {
    OS_EVENT_Create(&_aEvent[i]);
  }
}









 
void USB_OS_Delay(int ms) {
  OS_Delay(ms);
}









 
void USB_OS_DecRI(void) {
  { ; if (--OS_Counters . Cnt . DI==0) __enable_irq(); };
}








 
void   USB_OS_IncDI(void) {
  { ; __disable_irq(); OS_Counters . Cnt . DI++; };
}










 
void USB_OS_Signal(unsigned EPIndex) {
  OS_EVENT_Pulse(&_aEvent[EPIndex]);
}









 
void USB_OS_Wait(unsigned EPIndex) {
  OS_EVENT_Wait(&_aEvent[EPIndex]);
}










 
int USB_OS_WaitTimed(unsigned EPIndex, unsigned ms) {
  int r;
  r = (int)OS_EVENT_WaitTimed(&_aEvent[EPIndex], ms + 1);
  return r;
}














 
void USB_OS_Panic(unsigned ErrCode) {
  while (ErrCode);
}







 
unsigned long USB_OS_GetTickCnt(void) {
  return OS_Time;
}

 
