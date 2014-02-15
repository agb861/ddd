#line 1 "Setup\\USBH_Config_LPC24xx.c"















 






 
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


 

#line 25 "Setup\\USBH_Config_LPC24xx.c"
#line 1 "USBH\\USBH.h"















 




#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"
 
 
 





 










#line 27 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"








 

 
 
  typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 






#line 119 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"











 

#line 22 "USBH\\USBH.h"
#line 1 "Inc\\SEGGER.h"















 




#line 1 "GUI\\Global.h"















 









 
#line 33 "GUI\\Global.h"



 
#line 22 "Inc\\SEGGER.h"











 










 
void SEGGER_ARM_memcpy(void * pDest, const void * pSrc, int NumBytes);
void SEGGER_memcpy    (void * pDest, const void * pSrc, int NumBytes);
void SEGGER_snprintf(char * pBuffer, int BufferSize, const char * sFormat, ...);







 
#line 23 "USBH\\USBH.h"
#line 1 "USBH\\USBH_ConfDefaults.h"















 




#line 1 "Setup\\USBH_Conf.h"















 

























 
#line 22 "USBH\\USBH_ConfDefaults.h"




 


#line 56 "USBH\\USBH_ConfDefaults.h"

#line 78 "USBH\\USBH_ConfDefaults.h"














#line 101 "USBH\\USBH_ConfDefaults.h"


#line 115 "USBH\\USBH_ConfDefaults.h"
























#line 146 "USBH\\USBH_ConfDefaults.h"



 
#line 24 "USBH\\USBH.h"







typedef struct USBH_HOST_CONTROLLER   USBH_HOST_CONTROLLER;
typedef struct USB_DEVICE             USB_DEVICE;
typedef struct USBH_OHCI_DEVICE       USBH_OHCI_DEVICE;
typedef struct USBH_HUB_PORT          USBH_HUB_PORT;
typedef struct USB_HUB                USB_HUB;
typedef struct USBH_OHCI_DUMMY_INT_EP USBH_OHCI_DUMMY_INT_EP;
typedef struct USB_INTERFACE          USB_INTERFACE;








 
#line 65 "USBH\\USBH.h"

void USBH_Logf_Application   (const char * sFormat, ...);
void USBH_Warnf_Application  (const char * sFormat, ...);
void USBH_sprintf_Application(      char * pBuffer, unsigned BufferSize, const char * sFormat, ...);






 
void USBH_Log          (const char * s);
void USBH_Warn         (const char * s);
void USBH_SetLogFilter (unsigned long FilterMask);
void USBH_SetWarnFilter(unsigned long FilterMask);
void USBH_AddLogFilter (unsigned long FilterMask);
void USBH_AddWarnFilter(unsigned long FilterMask);
void USBH_Logf         (unsigned long Type,             const char * sFormat, ...);
void USBH_Warnf        (unsigned long Type,             const char * sFormat, ...);
void USBH_PrintfSafe   (char       * pBuffer, const char * sFormat, int BufferSize, va_list * pParamList);
void USBH_Panic        (const char * sError);






 
void USBH_OS_Delay           (unsigned ms);
void USBH_OS_DisableInterrupt(void);
void USBH_OS_EnableInterrupt (void);
void USBH_OS_Init            (void);
void USBH_OS_Unlock          (void);
void USBH_OS_AssertLock      (void);
void USBH_OS_Lock            (void);
unsigned long  USBH_OS_GetTime32       (void);


void USBH_OS_LockSys       (void);
void USBH_OS_UnlockSys     (void);

void USBH_OS_WaitNetEvent  (unsigned ms);
void USBH_OS_SignalNetEvent(void);

void USBH_OS_WaitISR       (void);
void USBH_OS_SignalISR     (void);






 


typedef struct      USBH_OS_EVENT_OBJ     USBH_OS_EVENT_OBJ;
USBH_OS_EVENT_OBJ * USBH_OS_AllocEvent    (void);                       
void                USBH_OS_FreeEvent     (USBH_OS_EVENT_OBJ * pEvent); 
void                USBH_OS_SetEvent      (USBH_OS_EVENT_OBJ * pEvent); 
void                USBH_OS_ResetEvent    (USBH_OS_EVENT_OBJ * pEvent); 
void                USBH_OS_WaitEvent     (USBH_OS_EVENT_OBJ * pEvent);
int                 USBH_OS_WaitEventTimed(USBH_OS_EVENT_OBJ * pEvent, unsigned long milliSeconds);


void USBH_OS_WaitItem     (void * pWaitItem);
void USBH_OS_WaitItemTimed(void * pWaitItem, unsigned Timeout);
void USBH_OS_SignalItem   (void * pWaitItem);
void USBH_OS_AddTickHook  (void(* pfHook)(void));

void USBH_Task                (void);
char USBH_IsExpired           (signed long Time);
int  USBH_GetVersion          (void);
void USBH_Init                (void);
void USBH_X_Config            (void);
void USBH_AssignMemory        (unsigned long * pMem, unsigned long NumBytes);
void USBH_AssignTransferMemory(unsigned long * pMem, unsigned long NumBytes);




















#line 171 "USBH\\USBH.h"








#line 191 "USBH\\USBH.h"




















#line 217 "USBH\\USBH.h"



#line 231 "USBH\\USBH.h"


#line 240 "USBH\\USBH.h"










typedef struct USB_DEVICE_DESCRIPTOR { 
  unsigned char  bLength;
  unsigned char  bDescriptorType;
  unsigned short bcdUSB;
  unsigned char  bDeviceClass;
  unsigned char  bDeviceSubClass;
  unsigned char  bDeviceProtocol;
  unsigned char  bMaxPacketSize0;
  unsigned short idVendor;
  unsigned short idProduct;
  unsigned short bcdDevice;
  unsigned char  iManufacturer;
  unsigned char  iProduct;
  unsigned char  iSerialNumber;
  unsigned char  bNumConfigurations;
} USB_DEVICE_DESCRIPTOR;



typedef struct USB_CONFIGURATION_DESCRIPTOR { 
  unsigned char  bLength;
  unsigned char  bDescriptorType;
  unsigned short wTotalLength;
  unsigned char  bNumInterfaces;
  unsigned char  bConfigurationValue;
  unsigned char  iConfiguration;
  unsigned char  bmAttributes;
  unsigned char  MaxPower;
} USB_CONFIGURATION_DESCRIPTOR;






typedef struct USB_INTERFACE_DESCRIPTOR { 
  unsigned char bLength;
  unsigned char bDescriptorType;
  unsigned char bInterfaceNumber;
  unsigned char bAlternateSetting;
  unsigned char bNumEndpoints;
  unsigned char bInterfaceClass;
  unsigned char bInterfaceSubClass;
  unsigned char bInterfaceProtocol;
  unsigned char iInterface;
} USB_INTERFACE_DESCRIPTOR;







typedef struct USB_ENDPOINT_DESCRIPTOR { 
  unsigned char  bLength;
  unsigned char  bDescriptorType;
  unsigned char  bEndpointAddress;
  unsigned char  bmAttributes;
  unsigned short wMaxPacketSize;
  unsigned char  bInterval;
} USB_ENDPOINT_DESCRIPTOR;

#line 319 "USBH\\USBH.h"

typedef struct USB_STRING_DESCRIPTOR { 
  unsigned char  bLength;
  unsigned char  bDescriptorType;
  unsigned short bString[1];                        
} USB_STRING_DESCRIPTOR;





typedef struct USB_DEVICE_QUALIFIER_DESCRIPTOR { 
  unsigned char  bLength;
  unsigned char  bDescriptorType;
  unsigned short bcdUSB;
  unsigned char  bDeviceClass;
  unsigned char  bDeviceSubClass;
  unsigned char  bDeviceProtocol;
  unsigned char  bMaxPacketSize0;
  unsigned char  bNumConfigurations;
  unsigned char  bReserved;
} USB_DEVICE_QUALIFIER_DESCRIPTOR;



typedef struct USB_INTERFACE_ASSOCIATION_DESCRIPTOR { 
  unsigned char bLength;
  unsigned char bDescriptorType;
  unsigned char bFirstInterface;
  unsigned char bInterfaceCount;
  unsigned char bFunctionClass;
  unsigned char bFunctionSubClass;
  unsigned char bFunctionProtocol;
  unsigned char iFunction;
} USB_INTERFACE_ASSOCIATION_DESCRIPTOR;

typedef struct USB_COMMON_DESCRIPTOR { 
  unsigned char bLength;
  unsigned char bDescriptorType;
} USB_COMMON_DESCRIPTOR;

typedef struct USB_SETUP_PACKET { 
  unsigned char  Type;
  unsigned char  Request;
  unsigned short Value;
  unsigned short Index;
  unsigned short Length;
} USBH_SETUP_PACKET;











 













#line 407 "USBH\\USBH.h"













#line 426 "USBH\\USBH.h"








#line 441 "USBH\\USBH.h"














#line 469 "USBH\\USBH.h"







typedef unsigned int USBH_STATUS;




#line 493 "USBH\\USBH.h"













#line 512 "USBH\\USBH.h"














#line 533 "USBH\\USBH.h"











typedef enum {
  USBH_SUBSTATE_IDLE,                                     
  USBH_SUBSTATE_TIMER,                                    
  USBH_SUBSTATE_TIMERURB,                                 
  USBH_SUBSTATE_TIMEOUT_PENDING_URB                       
} USBH_SUBSTATE_STATE;

typedef void USBH_SUBSTATE_FUNC(void *context); 











 






 












typedef struct USBH_DLIST USBH_DLIST;
struct USBH_DLIST {
  USBH_DLIST * pNext;
  USBH_DLIST * pPrev;
};

















#line 617 "USBH\\USBH.h"

#line 631 "USBH\\USBH.h"



typedef struct USBH_HCM_ITEM_HEADER {



  
  union {
    struct USBH_HCM_ITEM_HEADER * Next;
    USBH_DLIST                    ListEntry;
  } Link;
  volatile unsigned long           PhyAddr;            
  struct USBH_HCM_POOL * pOwningPool;         
} USBH_HCM_ITEM_HEADER;

typedef struct USBH_HCM_POOL {



  unsigned long               ContiguousMemoryPhyAddr;
  void            * pItemHeaderStartAddr;      
  USBH_HCM_ITEM_HEADER * pHead;                     

  
  unsigned long               NumberOfItems;            
  unsigned long               SizeOfItem;               
  unsigned long               SizeOfExtension;          

  
  void            * pItemHeaderEndAddr;
  unsigned long               EndContiguousMemoryPhyAddr;
  unsigned long               RefCount;                 
} USBH_HCM_POOL;










USBH_STATUS            USBH_HCM_AllocPool         (USBH_HCM_POOL        * Pool,    unsigned long NumberOfItems, unsigned long SizeOfPhysItem, unsigned long SizeOfExtension, unsigned long Alignment);
void                   USBH_HCM_FreePool          (USBH_HCM_POOL        * MemPool);
USBH_HCM_ITEM_HEADER * USBH_HCM_GetItem           (USBH_HCM_POOL        * MemPool);
USBH_HCM_ITEM_HEADER * USBH_HCM_GetItemFromPhyAddr(USBH_HCM_POOL        * MemPool, unsigned long PhyAddr);
void                   USBH_HCM_PutItem           (USBH_HCM_ITEM_HEADER * Item);
void                   USBH_HCM_FillPhyMemory     (USBH_HCM_ITEM_HEADER * Item,    unsigned char Val);
unsigned long                    USBH_HCM_IsPhysAddrInPool  (USBH_HCM_POOL        * MemPool, unsigned long PhyAddr);


#line 690 "USBH\\USBH.h"































































 
typedef enum {
  USBH_OHCI_DEV_STATE_HALT,
  USBH_OHCI_DEV_STATE_SUSPEND, 
  USBH_OHCI_DEV_STATE_RESUME,
  USBH_OHCI_DEV_STATE_RUNNING
} USBH_OHCI_DEV_STATE;


typedef struct USBH_OHCI_TRANSFER_BUFFER {
  USBH_HCM_ITEM_HEADER   ItemHeader;
  unsigned char              * pUrbBuffer;       
  unsigned long               Transferred;     
  unsigned long               RemainingLength; 
  int               UsbToHostFlag;   
} USBH_OHCI_TRANSFER_BUFFER;



















 



typedef void * USBH_NOTIFICATION_HANDLE; 






 

typedef unsigned int USBH_INTERFACE_ID; 
typedef unsigned int USBH_DEVICE_ID;    


#line 812 "USBH\\USBH.h"



typedef struct USBH_INTERFACE_MASK {
  unsigned short Mask;
  unsigned short VendorId;
  unsigned short ProductId;
  unsigned short bcdDevice;
  unsigned char  Interface;
  unsigned char  Class;
  unsigned char  SubClass;
  unsigned char  Protocol;
} USBH_INTERFACE_MASK;

typedef void * USBH_INTERFACE_LIST_HANDLE; 

typedef enum {
  USBH_SPEED_UNKNOWN,
  USBH_LOW_SPEED,
  USBH_FULL_SPEED,
  USBH_HIGH_SPEED
} USBH_SPEED;


typedef struct USBH_INTERFACE_INFO {
  USBH_INTERFACE_ID InterfaceId;
  USBH_DEVICE_ID    DeviceId;
  unsigned short               VendorId;
  unsigned short               ProductId;
  unsigned short               bcdDevice;
  unsigned char                Interface;
  unsigned char                Class;
  unsigned char                SubClass;
  unsigned char                Protocol;
  unsigned int      OpenCount;
  unsigned char                ExclusiveUsed;
  USBH_SPEED        Speed;
  unsigned char                acSerialNumber[256]; 
  unsigned char                SerialNumberSize;  
} USBH_INTERFACE_INFO;






 


USBH_INTERFACE_LIST_HANDLE USBH_CreateInterfaceList (USBH_INTERFACE_MASK        * pInterfaceMask, unsigned int * pInterfaceCount);
void                       USBH_DestroyInterfaceList(USBH_INTERFACE_LIST_HANDLE   hInterfaceList);
USBH_INTERFACE_ID          USBH_GetInterfaceId      (USBH_INTERFACE_LIST_HANDLE   hInterfaceList, unsigned int Index);
USBH_STATUS                USBH_GetInterfaceInfo    (USBH_INTERFACE_ID            InterfaceId, USBH_INTERFACE_INFO * pInterfaceInfo);


typedef enum {
  USBH_ADD_DEVICE,
  USBH_REMOVE_DEVICE
} USBH_PNP_EVENT;



typedef void USBH_ON_PNP_EVENT_FUNC(void * pContext, USBH_PNP_EVENT Event, USBH_INTERFACE_ID InterfaceId);


typedef struct USBH_PNP_NOTIFICATION {
  USBH_ON_PNP_EVENT_FUNC * pfPnpNotification; 
  void                   * pContext;         
  USBH_INTERFACE_MASK      InterfaceMask;   
} USBH_PNP_NOTIFICATION;

USBH_NOTIFICATION_HANDLE           USBH_RegisterPnPNotification    (USBH_PNP_NOTIFICATION    * pPnPNotification);
void                               USBH_UnregisterPnPNotification  (USBH_NOTIFICATION_HANDLE   Handle);
typedef void                     * USBH_ENUM_ERROR_HANDLE; 










#line 904 "USBH\\USBH.h"


typedef struct USBH_ENUM_ERROR {
  int         Flags;
  int         PortNumber;
  USBH_STATUS Status;
  int         ExtendedErrorInformation; 
} USBH_ENUM_ERROR;



typedef void           USBH_ON_ENUM_ERROR_FUNC             (void * pContext, const USBH_ENUM_ERROR   * pfEnumError);
USBH_ENUM_ERROR_HANDLE USBH_RegisterEnumErrorNotification  (void * pContext, USBH_ON_ENUM_ERROR_FUNC * pfEnumErrorCallback);
void                   USBH_UnregisterEnumErrorNotification(USBH_ENUM_ERROR_HANDLE Handle);
void                   USBH_RestartEnumError               (void);


typedef void        * USBH_INTERFACE_HANDLE;
USBH_STATUS           USBH_OpenInterface  (USBH_INTERFACE_ID InterfaceId, unsigned char Exclusive, USBH_INTERFACE_HANDLE * InterfaceHandle);
void                  USBH_CloseInterface (USBH_INTERFACE_HANDLE hInterface);






 

USBH_STATUS USBH_GetDeviceDescriptor              (USBH_INTERFACE_HANDLE hInterface, unsigned char * pBuffer, unsigned int * pBufferSize);
USBH_STATUS USBH_GetCurrentConfigurationDescriptor(USBH_INTERFACE_HANDLE hInterface, unsigned char * pBuffer, unsigned int * pBufferSize);
USBH_STATUS USBH_GetSerialNumber                  (USBH_INTERFACE_HANDLE hInterface, unsigned char * pBuffer, unsigned int * pBufferSize);
USBH_STATUS USBH_GetInterfaceDescriptor           (USBH_INTERFACE_HANDLE hInterface, unsigned char AlternateSetting, unsigned char * pBuffer,   unsigned int * pBufferSize);







typedef struct USBH_EP_MASK {
  unsigned long Mask;
  unsigned char  Index;
  unsigned char  Address;
  unsigned char  Type;
  unsigned char  Direction;
} USBH_EP_MASK;


USBH_STATUS USBH_GetEndpointDescriptor(USBH_INTERFACE_HANDLE hInterface, unsigned char AlternateSetting, const USBH_EP_MASK * pMask, unsigned char * pBuffer, unsigned int * pBufferSize);
USBH_STATUS USBH_GetDescriptor        (USBH_INTERFACE_HANDLE hInterface, unsigned char AlternateSetting,   unsigned char Type, unsigned char * pBuffer, unsigned * pBufferSize);
USBH_STATUS USBH_GetDescriptorEx      (USBH_INTERFACE_HANDLE hInterface, unsigned char Type, unsigned char DescIndex, unsigned short LangId, unsigned char * pBuffer, unsigned * pBufferSize);


USBH_STATUS USBH_GetSpeed        (USBH_INTERFACE_HANDLE hInterface, USBH_SPEED * pSpeed);
USBH_STATUS USBH_GetFrameNumber  (USBH_INTERFACE_HANDLE hInterface, unsigned long * pFrameNumber);


USBH_STATUS USBH_GetInterfaceIdByHandle(USBH_INTERFACE_HANDLE hInterface, USBH_INTERFACE_ID * pInterfaceId);






 


typedef enum USBH_FUNCTION_TAG {
  USBH_FUNCTION_CONTROL_REQUEST,   
  USBH_FUNCTION_BULK_REQUEST,      
  USBH_FUNCTION_INT_REQUEST,       
  USBH_FUNCTION_ISO_REQUEST,       
  
  USBH_FUNCTION_RESET_DEVICE,      
  USBH_FUNCTION_RESET_ENDPOINT,    
  USBH_FUNCTION_ABORT_ENDPOINT,    
  USBH_FUNCTION_SET_CONFIGURATION, 
  USBH_FUNCTION_SET_INTERFACE,     
  USBH_FUNCTION_SET_POWER_STATE
} USBH_FUNCTION;

typedef struct USBH_URB USBH_URB;
typedef void USBH_ON_COMPLETION_FUNC(USBH_URB * Urb); 
typedef void USBH_ON_COMPLETION_USER_FUNC(void * pContextData);

typedef struct USBH_HEADER_TAG {                            
  USBH_FUNCTION                  Function;                       
  USBH_STATUS                    Status;                         
  USBH_ON_COMPLETION_FUNC      * pfOnCompletion;                 
  void                         * pContext;                       
  USBH_DLIST                     ListEntry;                      
  
  void                         * pUbdContext;                     
  USBH_ON_COMPLETION_FUNC      * pfOnInternalCompletion;          
  void                         * pInternalContext;                
  unsigned long                            HcFlags;                         
  USBH_ON_COMPLETION_USER_FUNC * pfOnUserCompletion;
  void                         * pUserContext;
} USBH_HEADER;



typedef struct USBH_CONTROL_REQUEST {
  USBH_SETUP_PACKET   Setup;    
  unsigned char                  Endpoint; 
  void              * pBuffer;   
  unsigned long                 Length;   
} USBH_CONTROL_REQUEST;


typedef struct USBH_BULK_INT_REQUEST {
  unsigned char     Endpoint; 
  void * pBuffer;
  unsigned long    Length;   
} USBH_BULK_INT_REQUEST;



typedef struct USBH_ISO_PACKET_DESCRIPTOR {
  unsigned long         Offset;
  unsigned long         Length;
  USBH_STATUS Status;
} USBH_ISO_PACKET_DESCRIPTOR;








typedef struct USBH_ISO_REQUEST {
  unsigned char             Endpoint;   
  void         * pBuffer; 
  unsigned long            Length;    
  unsigned int   Flags;
  unsigned int   StartFrame;
  unsigned int                NumPackets;
  unsigned int                ErrorCount;
  USBH_ISO_PACKET_DESCRIPTOR  aIsoPacket[1];
} USBH_ISO_REQUEST;

typedef struct USBH_ENDPOINT_REQUEST {  
  unsigned char Endpoint;                          
} USBH_ENDPOINT_REQUEST;

typedef struct USBH_SET_CONFIGURATION { 
  unsigned char ConfigurationDescriptorIndex;      
} USBH_SET_CONFIGURATION;

typedef struct USBH_SET_INTERFACE {     
  unsigned char AlternateSetting;                  
} USBH_SET_INTERFACE;

typedef enum USBH_POWER_STATE {
  USBH_NORMAL_POWER,
  USBH_SUSPEND
} USBH_POWER_STATE;

typedef struct USBH_SET_POWER_STATE {
  USBH_POWER_STATE PowerState;
} USBH_SET_POWER_STATE;

struct USBH_URB {                    
  USBH_HEADER Header;
  union {
    USBH_CONTROL_REQUEST   ControlRequest;
    USBH_BULK_INT_REQUEST  BulkIntRequest;
    USBH_ISO_REQUEST       IsoRequest;
    USBH_ENDPOINT_REQUEST  EndpointRequest;
    USBH_SET_CONFIGURATION SetConfiguration;
    USBH_SET_INTERFACE     SetInterface;
    USBH_SET_POWER_STATE   SetPowerState;
  } Request;
};




USBH_STATUS   USBH_SubmitUrb(USBH_INTERFACE_HANDLE hInterface, USBH_URB * Urb);
const char  * USBH_GetStatusStr(USBH_STATUS x);

typedef void * USBH_HC_BD_HANDLE; 
typedef void * USBH_HC_HANDLE;    

USBH_STATUS USBH_BD_PreInit     (void);
USBH_STATUS USBH_BD_Init        (void);
void        USBH_Exit            (void);
void        USBH_EnumerateDevices(USBH_HC_BD_HANDLE HcBdHandle);

typedef enum USBH_HOST_STATE {
  USBH_HOST_RESET,                                                                          
  USBH_HOST_RUNNING,                                                                        
  USBH_HOST_SUSPEND                                                                         
} USBH_HOST_STATE;

typedef void *      USBH_HC_EP_HANDLE;                                                           
typedef enum {
  USBH_PORT_POWER_RUNNING,
  USBH_PORT_POWER_SUSPEND
} USBH_PORT_POWER_STATE;







 

typedef void        USBH_ROOT_HUB_NOTIFICATION_FUNC(void * pContext, unsigned long Notification); 


typedef USBH_STATUS USBH_HOST_INIT_FUNC(USBH_HC_HANDLE hHostController, USBH_ROOT_HUB_NOTIFICATION_FUNC * pfUbdRootHubNotification, void * pRootHubNotificationContext);




typedef USBH_STATUS USBH_HOST_EXIT_FUNC(USBH_HC_HANDLE hHostController);


typedef USBH_STATUS USBH_SET_HC_STATE_FUNC       (USBH_HC_HANDLE   hHostController, USBH_HOST_STATE HostState); 
typedef unsigned long         USBH_GET_HC_FRAME_NUMBER_FUNC(USBH_HC_HANDLE   hHostController);                       
typedef void        USBH_HC_ON_COMPLETION_FUNC   (void          * Context,  USBH_URB           * Urb);







typedef USBH_HC_EP_HANDLE USBH_ADD_ENDPOINT_FUNC(USBH_HC_HANDLE hHostController, unsigned char EndpointType, unsigned char DeviceAddress, unsigned char EndpointAddress, unsigned short MaxFifoSize, unsigned short IntervalTime, USBH_SPEED Speed);

typedef void        USBH_RELEASE_EP_COMPLETION_FUNC(void * pContext);                         
typedef void        USBH_RELEASE_ENDPOINT_FUNC     (USBH_HC_EP_HANDLE hEndPoint, USBH_RELEASE_EP_COMPLETION_FUNC * pfReleaseEpCompletion, void * pContext);                      
typedef USBH_STATUS USBH_ABORT_ENDPOINT_FUNC       (USBH_HC_EP_HANDLE hEndPoint);             
typedef USBH_STATUS USBH_RESET_ENDPOINT_FUNC       (USBH_HC_EP_HANDLE hEndPoint);             
typedef USBH_STATUS USBH_SUBMIT_REQUEST_FUNC       (USBH_HC_EP_HANDLE hEndPoint, USBH_URB * pUrb); 






 

typedef unsigned int USBH_GET_PORT_COUNT_FUNC     (USBH_HC_HANDLE hHostController); 
typedef unsigned int USBH_GET_POWER_GOOD_TIME_FUNC(USBH_HC_HANDLE hHostController); 
typedef unsigned long          USBH_GET_HUB_STATUS_FUNC     (USBH_HC_HANDLE hHostController); 



typedef void USBH_CLEAR_HUB_STATUS_FUNC (USBH_HC_HANDLE hHostController, unsigned short FeatureSelector);
typedef unsigned long  USBH_GET_PORT_STATUS_FUNC  (USBH_HC_HANDLE hHostController, unsigned char  Port); 



typedef void USBH_CLEAR_PORT_STATUS_FUNC(USBH_HC_HANDLE hHostController, unsigned char  Port, unsigned short FeatureSelector); 



typedef void USBH_SET_PORT_POWER_FUNC   (USBH_HC_HANDLE hHostController, unsigned char  Port, unsigned char PowerOn); 



typedef void USBH_RESET_PORT_FUNC       (USBH_HC_HANDLE hHostController, unsigned char  Port); 
typedef void USBH_DISABLE_PORT_FUNC     (USBH_HC_HANDLE hHostController, unsigned char  Port); 
typedef void USBH_SET_PORT_SUSPEND_FUNC (USBH_HC_HANDLE hHostController, unsigned char  Port, USBH_PORT_POWER_STATE State); 
typedef int  USBH_CHECK_INTERRUPT_FUNC  (USBH_HC_HANDLE hHostController);
typedef void USBH_ISR_FUNC              (USBH_HC_HANDLE hHostController);

typedef struct USBH_HOST_DRIVER {
  
  USBH_HOST_INIT_FUNC           * pfHostInit;        
  USBH_HOST_EXIT_FUNC           * pfHostExit;
  USBH_SET_HC_STATE_FUNC        * pfSetHcState;
  USBH_GET_HC_FRAME_NUMBER_FUNC * pfGetFrameNumber;
  
  USBH_ADD_ENDPOINT_FUNC        * pfAddEndpoint;     
  USBH_RELEASE_ENDPOINT_FUNC    * pfReleaseEndpoint; 
  USBH_ABORT_ENDPOINT_FUNC      * pfAbortEndpoint;   
  
  USBH_RESET_ENDPOINT_FUNC      * pfResetEndpoint;   
  USBH_SUBMIT_REQUEST_FUNC      * pfSubmitRequest;   
  
  USBH_GET_PORT_COUNT_FUNC      * pfGetPortCount;
  USBH_GET_POWER_GOOD_TIME_FUNC * pfGetPowerGoodTime;
  USBH_GET_HUB_STATUS_FUNC      * pfGetHubStatus;
  USBH_CLEAR_HUB_STATUS_FUNC    * pfClearHubStatus;
  USBH_GET_PORT_STATUS_FUNC     * pfGetPortStatus;
  USBH_CLEAR_PORT_STATUS_FUNC   * pfClearPortStatus;
  USBH_SET_PORT_POWER_FUNC      * SetPortPower;
  USBH_RESET_PORT_FUNC          * pfResetPort;
  USBH_DISABLE_PORT_FUNC        * pfDisablePort;
  USBH_SET_PORT_SUSPEND_FUNC    * pfSetPortSuspend;
  USBH_CHECK_INTERRUPT_FUNC     * pfCheckIsr;
  USBH_ISR_FUNC                 * pfIsr;
} USBH_HOST_DRIVER;

USBH_HC_BD_HANDLE USBH_AddHostController   (USBH_HOST_DRIVER      * pDriver, USBH_HC_HANDLE hController);
void              USBH_RemoveHostController(USBH_HC_BD_HANDLE       HcBdHandle);
USBH_STATUS       USBH_ResetEndpoint       (USBH_INTERFACE_HANDLE   IfaceHandle, USBH_URB * urb, unsigned char Endpoint, USBH_ON_COMPLETION_FUNC Completion, void * Context);


typedef void * USBH_TIMER_HANDLE;                                                                   
typedef void   USBH_TIMER_FUNC(void * pContext);                                              

USBH_TIMER_HANDLE USBH_AllocTimer (USBH_TIMER_FUNC * pfTimerCallbackRoutine, void * Context); 
void              USBH_FreeTimer  (USBH_TIMER_HANDLE hTimer);                                  
void              USBH_StartTimer (USBH_TIMER_HANDLE hTimer, unsigned long ms);                          
void              USBH_CancelTimer(USBH_TIMER_HANDLE hTimer);                                  






 


char USBH_IsTimeOver(unsigned long Waittime, unsigned long StartTime);


typedef struct URB_SUB_STATE {
  unsigned char                           TimerCancelFlag; 
  USBH_TIMER_HANDLE            hTimer;
  USBH_SUBSTATE_STATE               State;
  USBH_URB                   * pUrb;
  
  USBH_HOST_CONTROLLER       * pHostController;
  USBH_HC_EP_HANDLE          * phEP;
  USBH_SUBMIT_REQUEST_FUNC   * pfSubmitRequest;
  USBH_ABORT_ENDPOINT_FUNC   * pfAbortEndpoint;
  USB_DEVICE                 * pDevRefCnt;
  USBH_SUBSTATE_FUNC         * pfCallback; 
  
  
  void                       * pContext;
} URB_SUB_STATE;

URB_SUB_STATE * USBH_URB_SubStateAllocInit    (USBH_HOST_CONTROLLER * pHostController, USBH_HC_EP_HANDLE * phEP, USBH_SUBSTATE_FUNC * pfRoutine, void * pContext);
USBH_STATUS     USBH_URB_SubStateInit         (URB_SUB_STATE * pSubState, USBH_HOST_CONTROLLER * pHostController, USBH_HC_EP_HANDLE * phEP, USBH_SUBSTATE_FUNC * pfRoutine, void * pContext);
USBH_STATUS     USBH_URB_SubStateSubmitRequest(URB_SUB_STATE * pSubState, USBH_URB * pUrb, unsigned long Timeout, USB_DEVICE * pDevRefCnt);
void            USBH_URB_SubStateWait         (URB_SUB_STATE * pSubState, unsigned long Timeout, USB_DEVICE * pDevRefCnt);
void            USBH_URB_SubStateExit         (URB_SUB_STATE * pSubState);
void            USBH_URB_SubStateFree         (URB_SUB_STATE * pSubState);
char       USBH_URB_SubStateIsIdle       (URB_SUB_STATE * pSubState);

USBH_STATUS USBH_OHCI_TRANSFER_SubmitRequest       (USBH_HC_EP_HANDLE hEP, USBH_URB * pUrb);
void        USBH_OHCI_TRANSFER_ProcessDoneInterrupt(USBH_OHCI_DEVICE * pDev);





typedef struct USBH_DEFAULT_EP {



  USB_DEVICE         * pUsbDevice; 
  USBH_HC_EP_HANDLE    hEP;  
  unsigned int         UrbCount;
} USBH_DEFAULT_EP;



typedef enum {
  DEV_ENUM_IDLE,                 
  DEV_ENUM_START,                
  DEV_ENUM_GET_DEVICE_DESC_PART, 
  DEV_ENUM_GET_DEVICE_DESC,      
  DEV_ENUM_GET_CONFIG_DESC_PART, 
  DEV_ENUM_GET_CONFIG_DESC,      
  DEV_ENUM_GET_LANG_ID,          
  DEV_ENUM_GET_SERIAL_DESC,      
  DEV_ENUM_SET_CONFIGURATION,    
  DEV_ENUM_INIT_HUB,             
  DEV_ENUM_RESTART,              
  DEV_ENUM_REMOVED               
} DEV_ENUM_STATE;

typedef enum { 
  DEV_STATE_UNKNOWN = 0,
  DEV_STATE_REMOVED,
  DEV_STATE_ENUMERATE,
  DEV_STATE_WORKING,
  DEV_STATE_SUSPEND
} USB_DEV_STATE;


typedef void POST_ENUM_FUNC(void* pContext);

struct USB_DEVICE {



  USBH_DLIST                   ListEntry;              
  USBH_DLIST                   TempEntry;              
  char                    TempFlag;
  long                         RefCount;
  USBH_HOST_CONTROLLER       * pHostController;         
  USBH_DLIST                   UsbInterfaceList;       
  unsigned int                 InterfaceCount;
  USBH_HUB_PORT              * pParentPort;             
  unsigned char                           UsbAddress;             
  USBH_SPEED                   DeviceSpeed;            
  unsigned char                           MaxFifoSize;            
  unsigned char                           ConfigurationIndex;     
  unsigned char                           NumConfigurations;      
  
  USB_DEVICE_DESCRIPTOR        DeviceDescriptor;       
  unsigned char                           aDeviceDescriptorBuffer[(18)];
  unsigned char                         * pConfigDescriptor;       
  unsigned short                          ConfigDescriptorSize;
  unsigned short                          LanguageId;             
  unsigned char                         * pSerialNumber;           
  unsigned int                 SerialNumberSize;
  unsigned short                          DevStatus;              
  USBH_DEFAULT_EP              DefaultEp;              
  USB_HUB                    * pUsbHub;                 
  USB_DEV_STATE                State;                  
  USBH_URB                     EnumUrb;                
  void                       * pCtrlTransferBuffer;     
  unsigned int                 CtrlTransferBufferSize;
  
  
  URB_SUB_STATE                SubState;
  DEV_ENUM_STATE               EnumState;
  char                    EnumSubmitFlag;         
  
  POST_ENUM_FUNC             * pfPostEnumFunction;
  void                       * pPostEnumerationContext;
  USBH_DEVICE_ID               DeviceId;               
};


typedef struct USB_ENDPOINT {
  USBH_DLIST          ListEntry;          



  USB_INTERFACE     * pUsbInterface;       
  unsigned char                * pEndpointDescriptor; 
  USBH_HC_EP_HANDLE   hEP;           
  unsigned long                 UrbCount;
} USB_ENDPOINT;







struct USB_INTERFACE {



  USBH_DLIST          ListEntry;                
  USB_DEVICE        * pDevice;                   
  USBH_DLIST          UsbEndpointList;          
  unsigned int        EndpointCount;
  unsigned char                  CurrentAlternateSetting;
  unsigned char                * pInterfaceDescriptor;
  unsigned char                * pAlternateSettingDescriptor;
  unsigned char                  NewAlternateSetting;
  unsigned char                * pNewAlternateSettingDescriptor;
  unsigned int        OpenCount;
  unsigned char                  ExclusiveUsed;
  USB_ENDPOINT      * pEpMap[32]; 
  USBH_INTERFACE_ID   InterfaceId;              
};

USBH_STATUS USBH_BD_InitDefaultEndpoint            (USB_DEVICE    * pUsbDevice);
USBH_STATUS USBH_BD_DefaultEpSubmitUrb             (USB_DEVICE    * Dev,       USBH_URB * Urb);
USBH_STATUS USBH_BD_SubmitSetInterface             (USB_INTERFACE * UsbInterface, unsigned short Interface, unsigned short AlternateSetting, USBH_ON_COMPLETION_FUNC * Completion, USBH_URB * OriginalUrb);
USBH_STATUS USBH_BD_SubmitClearFeatureEndpointStall(USBH_DEFAULT_EP   * DefaultEp, USBH_URB * Urb, unsigned char Endpoint, USBH_ON_COMPLETION_FUNC * InternalCompletion, void * HcContext);
void        USBH_BD_ReleaseDefaultEndpoint         (USBH_DEFAULT_EP   * UsbEndpoint);
void        USBH_BD_DefaultEpUrbCompletion         (USBH_URB          * Urb);


#line 1391 "USBH\\USBH.h"




#line 1415 "USBH\\USBH.h"

USB_DEVICE * USBH_CreateNewUsbDevice(USBH_HOST_CONTROLLER * HostController);

void         USBH_StartEnumeration                  (USB_DEVICE * Dev, POST_ENUM_FUNC * PostEnumFunction, void * Context);
void         USBH_DeleteDevice                      (USB_DEVICE * Dev);
void         USBH_DeleteInterfaces                  (USB_DEVICE * Dev);
void         USBH_MarkDeviceAsRemoved               (USB_DEVICE * Dev);
void         USBH_MarkParentAndChildDevicesAsRemoved(USB_DEVICE * Dev);
void         UbdProcessSetConf                      (USB_DEVICE * Dev);
unsigned char         * USBH_GetNextInterfaceDesc              (USB_DEVICE * Dev, unsigned char  * Start, unsigned char InterfaceNumber, unsigned int AlternateSetting);
unsigned char         * USBH_GetNextEndpointDesc               (USB_DEVICE * Dev, unsigned char  * Start, unsigned char Endpoint);
void         USBH_CreateInterfaces                  (void * Context);
unsigned short          USBH_GetUshortFromDesc                 (void * Buffer,    unsigned short   Offset);
unsigned char           USBH_GetUcharFromDesc                  (void * Buffer,    unsigned short   Offset);






 

void         USBH_BD_EnumTimerFunction      (void       * Context);
void         USBH_BD_SetConfTimerFunction   (void       * Context);
void         USBH_BD_ProcessEnum            (void       * usbDevice);
unsigned int USBH_GetPendingUrbCount        (USB_DEVICE * Dev);
int          USBH_CheckCtrlTransferBuffer   (USB_DEVICE * Dev, unsigned short                   RequestLength);
void         USBH_EnumParentPortRestart     (USB_DEVICE * Dev, USBH_STATUS           status);
void         USBH_ProcessEnumPortError      (USB_DEVICE * dev, USBH_STATUS           enumStatus);
USBH_STATUS  USBH_SearchUsbInterface        (USB_DEVICE * dev, USBH_INTERFACE_MASK * iMask, USB_INTERFACE * * iface);

USBH_STATUS    USBH_GetEndpointDescriptorFromInterface(USB_INTERFACE * usbInterface, unsigned char alternateSetting, const USBH_EP_MASK * mask, unsigned char * * descriptor);
USBH_STATUS    USBH_GetDescriptorFromInterface(USB_INTERFACE * pUsbInterface, unsigned char alternateSetting, unsigned char Type, unsigned char ** ppDescriptor);
USB_ENDPOINT * USBH_BD_NewEndpoint    (USB_INTERFACE * UsbInterface, unsigned char * EndpointDescriptor);
void           USBH_BD_DeleteEndpoint (USB_ENDPOINT  * UsbEndpoint);
USBH_STATUS    USBH_BD_EpSubmitUrb    (USB_ENDPOINT  * UsbEndpoint, USBH_URB * Urb);
void           USBH_BD_EpUrbCompletion(USBH_URB      * Urb);





USB_INTERFACE * USBH_BD_NewUsbInterface    (USB_DEVICE    * pDevice);
void            USBH_BD_DeleteUsbInterface (USB_INTERFACE * pUsbInterface);
USBH_STATUS     USBH_BD_CreateEndpoints    (USB_INTERFACE * pUsbInterface);
void            USBH_BD_RemoveEndpoints    (USB_INTERFACE * pUsbInterface);
void            USBH_BD_AddUsbEndpoint     (USB_ENDPOINT  * pUsbEndpoint);
void            USBH_RemoveUsbEndpoint     (USB_ENDPOINT  * pUsbEndpoint);
USBH_STATUS     USBH_BD_CompareUsbInterface(USB_INTERFACE * pInterface, USBH_INTERFACE_MASK * pInterfaceMask, char EnableHubInterfaces);
unsigned int    USBH_BD_GetPendingUrbCount (USB_INTERFACE * pInterface);
void            USBH_BD_AddUsbInterface    (USB_INTERFACE * pUsbInterface);
void            USBH_BD_RemoveUsbInterface (USB_INTERFACE * pUsbInterface);

USB_ENDPOINT  * USBH_BD_SearchUsbEndpointInInterface(USB_INTERFACE * Interface, const USBH_EP_MASK * mask);

typedef struct USBH_HOST_DRIVER_INST { 



  USBH_DLIST        HostControllerList;
  unsigned long               HostControllerCount;
  
  USBH_DLIST        NotificationList;
  unsigned long               NotificationCount;
  
  USBH_DLIST        DelayedPnPNotificationList;
  unsigned long               DelayedPnPNotificationCount;
  USBH_TIMER_HANDLE DelayedPnPNotifyTimer;
  USBH_DLIST        EnumErrorNotificationList;
  unsigned long               EnumErrorNotificationCount;
  
  USBH_INTERFACE_ID NextInterfaceId;
  USBH_DEVICE_ID    NextDeviceId;
} USBH_HOST_DRIVER_INST;

void USBH_BD_AddHostController            (USBH_HOST_CONTROLLER * HostController);
void USBH_BD_RemoveHostController         (USBH_HOST_CONTROLLER * HostController);
void USBH_BD_ProcessDevicePnpNotifications(USB_DEVICE * Device, USBH_PNP_EVENT event);
void USBH_BD_AddNotification              (USB_DEVICE * Device);
void USBH_BD_RemoveNotification           (USB_DEVICE * Device);

USBH_INTERFACE_ID   USBH_BD_GetNextInterfaceId(void);
USBH_DEVICE_ID      USBH_BD_GetNextDeviceId   (void);
USB_DEVICE        * USBH_BD_GetDeviceById     (USBH_DEVICE_ID    DeviceId);
USB_INTERFACE     * USBH_BD_GetInterfaceById     (USBH_INTERFACE_ID InterfaceId);


typedef enum {
  RH_PORTRESET_IDLE, 
  RH_PORTRESET_REMOVED,
  RH_PORTRESET_INIT, 
  RH_PORTRESET_START,
  RH_PORTRESET_RESTART,
  
  RH_PORTRESET_WAIT_RESTART,
  RH_PORTRESET_RES,
  RH_PORTRESET_WAIT_RESET,
  RH_PORTRESET_SET_ADDRESS,
  RH_PORTRESET_WAIT_ADDRESS
} USBH_ROOT_HUB_PORTRESET_STATE;

typedef struct ROOT_HUB {                       



  USBH_HOST_CONTROLLER          * pHostController;      
  unsigned int                    PowerGoodTime;       
  unsigned int                    PortCount;           
  USBH_DLIST                      PortList;
  URB_SUB_STATE                   SubState;            
  URB_SUB_STATE                   InitHubPortSubState;
  USBH_ROOT_HUB_PORTRESET_STATE   PortResetEnumState;
  USBH_HUB_PORT                 * pEnumPort;
  USB_DEVICE                    * pEnumDevice;
  USBH_URB                        EnumUrb;             
  USBH_HC_EP_HANDLE               hEnumEP;
} ROOT_HUB;

USBH_STATUS     USBH_ROOTHUB_Init                      (USBH_HOST_CONTROLLER * pHostController);
void            USBH_ROOTHUB_OnNotification            (void     * pRootHubContext, unsigned long Notification);
void            USBH_ROOTHUB_Release                   (ROOT_HUB * pRootHub);
USBH_STATUS     USBH_ROOTHUB_AddPortsStartPowerGoodTime(ROOT_HUB * pRootHub);
char       USBH_ROOTHUB_ServicePorts              (ROOT_HUB * pRootHub);
USBH_HUB_PORT * USBH_ROOTHUB_GetPortByNumber           (ROOT_HUB * pRootHub, unsigned char Port);





typedef enum {
  PORT_UNKNOWN,
  PORT_REMOVED,               
  PORT_CONNECTED,             
  PORT_RESTART,               
  PORT_SUSPEND,               
  PORT_RESET,                 
  PORT_ENABLED,               
  PORT_ERROR                  
} PORT_STATE;

struct USBH_HUB_PORT {              



  USBH_DLIST           ListEntry;          
  ROOT_HUB           * RootHub;            
  USB_HUB            * ExtHub;             
  unsigned long                  PortStatus;         
  unsigned long                  PortStatusShadow;   
  USBH_SPEED           PortSpeed;          
  PORT_STATE           PortState;          
  USB_DEVICE         * Device;             
  unsigned char                   HubPortNumber;      
  unsigned int         RetryCounter;       
  unsigned char                   ConfigurationIndex; 
  char            HighPowerFlag;      
};

typedef enum { 
  USBH_HUB_PORTRESET_IDLE,
  USBH_HUB_PORTRESET_REMOVED,               
  USBH_HUB_PORTRESET_START,
  USBH_HUB_PORTRESET_RESTART,
  USBH_HUB_PORTRESET_WAIT_RESTART,
  USBH_HUB_PORTRESET_RES,
  USBH_HUB_PORTRESET_IS_ENABLED,
  USBH_HUB_PORTRESET_WAIT_RESET,
  USBH_HUB_PORTRESET_SET_ADDRESS,
  USBH_HUB_PORTRESET_WAIT_SET_ADDRESS,
  USBH_HUB_PORTRESET_START_DEVICE_ENUM,
  USBH_HUB_PORTRESET_DISABLE_PORT
} USBH_HUB_PORTRESET_STATE;

typedef enum { 
  USBH_HUB_ENUM_IDLE,                  
  USBH_HUB_ENUM_START,                 
  USBH_HUB_ENUM_GET_STATUS,            
  USBH_HUB_ENUM_HUB_DESC,              
  USBH_HUB_ENUM_SET_POWER,             
  USBH_HUB_ENUM_POWER_GOOD,            
  USBH_HUB_ENUM_PORT_STATE,            
  USBH_HUB_ENUM_ADD_DEVICE,            
  USBH_HUB_ENUM_REMOVED                
} USBH_HUB_ENUM_STATE;


typedef enum {
  USBH_HUB_NOTIFY_IDLE,               
  USBH_HUB_NOTIFY_START,              
  USBH_HUB_NOTIFY_GET_HUB_STATUS,     
  USBH_HUB_NOTIFY_CLEAR_HUB_STATUS,
  USBH_HUB_NOTIFY_GET_PORT_STATUS,    
  USBH_HUB_NOTIFY_CLR_PORT_STATUS,    
  USBH_HUB_NOTIFY_CHECK_OVER_CURRENT,
  USBH_HUB_NOTIFY_CHECK_CONNECT,
  USBH_HUB_NOTIFY_CHECK_REMOVE,
  USBH_HUB_NOTIFY_DISABLE_PORT,       
  USBH_HUB_NOTIFY_REMOVED,            
  USBH_HUB_NOTIFY_ERROR               
} USBH_HUB_NOTIFY_STATE;

struct USB_HUB { 



  USB_DEVICE          * pHubDevice;                   
  unsigned int          PowerGoodTime;               
  unsigned int          Characteristics;             
  unsigned int          PortCount;                   
  USBH_DLIST            PortList;                    
  char             SubmitFlag;                  

  
  
  USBH_URB              NotifyUrb;
  USBH_HUB_NOTIFY_STATE NotifyState;
  USBH_HUB_NOTIFY_STATE OldNotifyState;
  URB_SUB_STATE         NotifySubState;              

  
  unsigned int          NotifyPortCt;
  USBH_HUB_PORT       * NotifyPort;
  unsigned long                   NotifyTemp;                  
  unsigned long                   Notification;                
  unsigned long                   Status;                      
  USBH_HUB_PORT       * EnumPort;                    
  USB_DEVICE          * EnumDevice;
  USBH_URB              EnumUrb;
  USBH_HUB_ENUM_STATE   EnumState;                   
  URB_SUB_STATE         EnumSubState;                

  
  POST_ENUM_FUNC  * PostEnumFunction;
  void                * PostEnumContext;
  USBH_HUB_PORTRESET_STATE   PortResetEnumState;          

  
  URB_SUB_STATE         PortResetSubState;
  URB_SUB_STATE         PortResetControlUrbSubState;
  USBH_HC_EP_HANDLE     PortResetEp0Handle;

  
  USB_ENDPOINT        * InterruptEp;
  USBH_URB              interruptUrb;
  void                * InterruptTransferBuffer;
  unsigned int          InterruptTransferBufferSize;
};

void      USBH_BD_DeleteHub(USB_HUB * hub);
void      USBH_BD_StartHub (USB_HUB * Hub, POST_ENUM_FUNC * PostEnumFunction, void * Context);
USB_HUB * USBH_BD_AllocInitUsbHub (USB_DEVICE  * dev);

 
void USBH_BD_ServiceAllHubs         (USBH_HOST_CONTROLLER * hc);
void USBH_BD_HubPrepareClrFeatureReq(USBH_URB * urb, unsigned short feature, unsigned short selector);


USBH_HUB_PORT * USBH_BD_NewHubPort   (void); 
void       USBH_BD_DeleteHubPort(USBH_HUB_PORT * HubPort);
void       USBH_BD_SetPortState (USBH_HUB_PORT * hubPort, PORT_STATE state);

















 
int USBH_BD_HubBuildChildDeviceList(USB_DEVICE * pHubDevice, USBH_DLIST * pDevList);



USBH_HUB_PORT * USBH_BD_HubGetPortByNumber(USB_HUB * Hub, unsigned char Number);

typedef enum {
  HC_UNKNOWN,
  HC_REMOVED,
  HC_WORKING,
  HC_SUSPEND
} HOST_CONTROLLER_STATE;

struct USBH_HOST_CONTROLLER {                   
  USBH_DLIST              ListEntry;            
  long                    RefCount;             
  HOST_CONTROLLER_STATE   State;                
  USBH_HOST_DRIVER_INST * pInst;                
  USBH_DLIST              DeviceList;           
  unsigned long                     DeviceCount;
  USBH_HOST_DRIVER      * pDriver;              
  USBH_HC_HANDLE          hHostController;      
  unsigned char                      UsbAddressArray[128];
  ROOT_HUB                RootHub;              
  USBH_HC_EP_HANDLE       LowSpeedEndpoint;
  USBH_HC_EP_HANDLE       FullSpeedEndpoint;
  USBH_HC_EP_HANDLE       HighSpeedEndpoint;



  
  
  USBH_HUB_PORT              * pActivePortReset;
};



#line 1750 "USBH\\USBH.h"



USBH_HOST_CONTROLLER * USBH_CreateHostController      (USBH_HOST_DRIVER * pDriver, USBH_HC_HANDLE hController);
void                   USBH_BD_FreeUsbAddress         (USBH_HOST_CONTROLLER * HostController, unsigned char Address);
void                   USBH_HC_ServicePorts           (USBH_HOST_CONTROLLER * HostController);
unsigned char                     USBH_BD_GetUsbAddress          (USBH_HOST_CONTROLLER * HostController);
void                   USBH_DeleteHostController      (USBH_HOST_CONTROLLER * Host);
void                   USBH_AddUsbDevice              (USB_DEVICE      * Device);
void                   USBH_HC_RemoveDeviceFromList   (USB_DEVICE      * Device);
void                   USBH_DefaultReleaseEpCompletion(void            * Context);
void                   USBH_Task                      (void);
void                   USBH_ISRTask                   (void);
void                   USBH_EnumTask                  (void);
void                   USBH_ConfigTransferBufferSize  (unsigned long Size);
void                   USBH_ConfigRootHub             (unsigned char SupportOvercurrent, unsigned char PortsAlwaysPowered, unsigned char PerPortPowered);
void                   USBH_ConfigMaxUSBDevices       (unsigned char NumDevices);
void                   USBH_ConfigMaxNumEndpoints     (unsigned char MaxNumBulkEndpoints, unsigned char MaxNumIntEndpoints, unsigned char MaxNumIsoEndpoints);
void                   USBH_ConfigSupportExternalHubs (unsigned char OnOff);
void                   USBH_AddController             (void);
void                   USBH_OHCI_Add                  (void * pBase);
void                   USBH_STM32_Add                 (void * pBase);
void                   USBH_ProcessISR                (unsigned Index);
void                   USBH_ServiceISR                (unsigned Index);
USBH_URB *             USBH_AllocIsoUrb               (unsigned NumIsoPackets, unsigned NumBytesForBuffer);
void                   USBH_FreeIsoUrb                (USBH_URB * pUrb);

typedef enum {
  USBH_DEVICE_EVENT_ADD,
  USBH_DEVICE_EVENT_REMOVE
} USBH_DEVICE_EVENT;

typedef void USBH_NOTIFICATION_FUNC(void * pContext, unsigned char DevIndex, USBH_DEVICE_EVENT Event);





 
typedef struct {
  unsigned Code;
  int      Value;
} USBH_HID_KEYBOARD_DATA;

typedef struct {
  int xChange;
  int yChange;
  int WheelChange;
  int ButtonState;
} USBH_HID_MOUSE_DATA;

typedef enum {
  USBH_HID_INPUT_REPORT = 0,
  USBH_HID_OUTPUT_REPORT,
  USBH_HID_FEATURE_REPORT
} USBH_HID_REPORT_TYPE;

typedef int USBH_HID_HANDLE;
typedef struct {
  USBH_HID_REPORT_TYPE ReportType;
  unsigned long ReportId;
  unsigned long ReportSize;
} USBH_HID_REPORT_INFO;

typedef struct {
  unsigned short  InputReportSize;
  unsigned short  OutputReportSize;
  unsigned short  ProductId;
  unsigned short  VendorId;
  char acName[7];
} USBH_HID_DEVICE_INFO;

typedef void USBH_HID_USER_FUNC(void * pContext);


typedef void (USBH_HID_ON_KEYBOARD_FUNC) (USBH_HID_KEYBOARD_DATA * pKeyData);
typedef void (USBH_HID_ON_MOUSE_FUNC)    (USBH_HID_MOUSE_DATA    * pMouseData);

void      USBH_HID_Exit(void);
char USBH_HID_Init(void);
void      USBH_HID_SetOnMouseStateChange   (USBH_HID_ON_MOUSE_FUNC    * pfOnChange);
void      USBH_HID_SetOnKeyboardStateChange(USBH_HID_ON_KEYBOARD_FUNC * pfOnChange);

USBH_STATUS     USBH_HID_Close                    (USBH_HID_HANDLE hDevice);
int             USBH_HID_GetNumDevices            (USBH_HID_DEVICE_INFO * pDevInfo, unsigned long NumItems);
USBH_STATUS     USBH_HID_GetReportDescriptorParsed(USBH_HID_HANDLE hDevice, USBH_HID_REPORT_INFO * pReportInfo, unsigned * pNumEntries);
USBH_STATUS     USBH_HID_GetDeviceInfo            (USBH_HID_HANDLE hDevice, USBH_HID_DEVICE_INFO * pDevInfo);
USBH_STATUS     USBH_HID_GetReportDescriptor      (USBH_HID_HANDLE hDevice, unsigned char * pReportDescriptor, unsigned NumBytes);
USBH_STATUS     USBH_HID_GetReport                (USBH_HID_HANDLE hDevice, unsigned char * pReport, unsigned long NumBytes, USBH_HID_USER_FUNC * pfFunc, void * pContextData);
USBH_HID_HANDLE USBH_HID_Open                     (const char * sName);
USBH_STATUS     USBH_HID_SetReport                (USBH_HID_HANDLE hDevice, const unsigned char * pReport, unsigned long NumBytes, USBH_HID_USER_FUNC * pfFunc, void * pContextData);
USBH_STATUS     USBH_HID_CancelIo                 (USBH_HID_HANDLE hDevice);
void            USBH_HID_RegisterNotification     (USBH_NOTIFICATION_FUNC * pfNotification, void * pContext);




 

typedef int USBH_LCD_HANDLE;

char       USBH_LCD_Init(void);
void            USBH_LCD_Exit(void);
USBH_LCD_HANDLE USBH_LCD_Open(const char * sName);
USBH_STATUS     USBH_LCD_WriteCmd(USBH_LCD_HANDLE hDevice, unsigned char * pCmdBuffer, unsigned NumBytesCmd, unsigned char * pStatusBuffer, unsigned NumBytesStatus);
USBH_STATUS     USBH_LCD_WriteDisplayData(USBH_LCD_HANDLE hDevice, unsigned char * pData, unsigned NumBytes);
USBH_STATUS     USBH_LCD_Close(USBH_LCD_HANDLE hDevice);
int             USBH_LCD_GetNumDevices(void);




 

typedef int USBH_PRINTER_HANDLE;



 


char           USBH_PRINTER_Init(void);
void                USBH_PRINTER_Exit(void);
USBH_PRINTER_HANDLE USBH_PRINTER_Open(const char * sName);
USBH_STATUS         USBH_PRINTER_Write(USBH_PRINTER_HANDLE hDevice, const unsigned char * pData, unsigned NumBytes);
USBH_STATUS         USBH_PRINTER_Read(USBH_PRINTER_HANDLE hDevice, unsigned char * pData, unsigned NumBytes);
USBH_STATUS         USBH_PRINTER_GetPortStatus(USBH_PRINTER_HANDLE hDevice, unsigned char * pStatus);
USBH_STATUS         USBH_PRINTER_ExecSoftReset(USBH_PRINTER_HANDLE hDevice);
USBH_STATUS         USBH_PRINTER_GetDeviceId(USBH_PRINTER_HANDLE hDevice, unsigned char * pData, unsigned NumBytes);
USBH_STATUS         USBH_PRINTER_Close(USBH_PRINTER_HANDLE hDevice);
int                 USBH_PRINTER_GetNumDevices(void);
void                USBH_PRINTER_RegisterNotification(USBH_NOTIFICATION_FUNC * pfNotification, void * pContext);
void                USBH_PRINTER_ConfigureTimeout(unsigned long Timeout);







 
#line 26 "Setup\\USBH_Config_LPC24xx.c"
#line 1 "Inc\\BSP.h"















 




#line 22 "Inc\\BSP.h"






 
#line 35 "Inc\\BSP.h"

 
#line 44 "Inc\\BSP.h"






 




 
void     BSP_Init       (void);
void     BSP_SetLED     (int Index);
void     BSP_ClrLED     (int Index);
void     BSP_ToggleLED  (int Index);
unsigned BSP_GetKeyStat (void);




 
void BSP_GUI_Init(void);




 
void BSP_USB_Attach         (void);
void BSP_USB_InstallISR     (void (*pfISR)(void));
void BSP_USB_InstallISR_Ex  (int ISRIndex, void (*pfISR)(void), int Prio);
void BSP_USB_ISR_Handler    (void);




 
void BSP_USBH_InstallISR    (void (*pfISR)(void));
void BSP_USBH_Init          (void);






 
void BSP_ETH_Init          (unsigned Unit);
void BSP_ETH_InstallISR    (void (*pfISR)(void));
void BSP_ETH_InstallISR_Ex (int ISRIndex, void (*pfISR)(void), int Prio);
void BSP_ETH_ISR_Handler   (void);




 
void BSP_CACHE_CleanInvalidateRange (void * p, unsigned NumBytes);
void BSP_CACHE_CleanRange           (void * p, unsigned NumBytes);
void BSP_CACHE_InvalidateRange      (void * p, unsigned NumBytes);




 
void BSP_UART_SetReadCallback(unsigned Unit, void (*pfOnRx) (unsigned Unit, unsigned char Data));
void BSP_UART_SetWriteCallback(unsigned Unit, void (*pfOnTx) (unsigned Unit));
void BSP_UART_Write1(unsigned char Data);
void BSP_UART_SetBaudrate(unsigned Baudrate);
void BSP_UART_Init(void);



 


#line 27 "Setup\\USBH_Config_LPC24xx.c"






 








 







 
static unsigned long _aPool[0x8000 / 4];             






 






 
static void _ISR(void) {
  unsigned long IntStatus;
	
  IntStatus = (*(volatile unsigned long *)(0xE01FC1C0 + 0x00));	
  if (IntStatus &  (1 << 3)) {
    USBH_ServiceISR(0);
  }
}







 
void USBH_X_Config(void) {
  USBH_AssignMemory(_aPool, sizeof(_aPool));    
  USBH_AssignTransferMemory((void*)0x7FD00000, 0x00004000);
  
  
  
  
  
  
  USBH_SetWarnFilter(0xFFFFFFFF);               
  USBH_SetLogFilter(0
                    | (1UL << 0)
  
  
  
                    | (1UL << 19)
                    | (1UL << 15)

                    );

  BSP_USBH_Init();



  USBH_OHCI_Add((void*)0xFFE0C000);
  BSP_USBH_InstallISR(_ISR);
}

 
