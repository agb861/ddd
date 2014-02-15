#line 1 "Setup\\BSP.c"















 

#line 1 "Inc\\BSP.h"















 




#line 1 "Inc\\SEGGER.h"















 




#line 1 "GUI\\Global.h"















 









 
#line 33 "GUI\\Global.h"



 
#line 22 "Inc\\SEGGER.h"











 










 
void SEGGER_ARM_memcpy(void * pDest, const void * pSrc, int NumBytes);
void SEGGER_memcpy    (void * pDest, const void * pSrc, int NumBytes);
void SEGGER_snprintf(char * pBuffer, int BufferSize, const char * sFormat, ...);







 
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



 


#line 19 "Setup\\BSP.c"
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

 





 







 

#line 20 "Setup\\BSP.c"
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



 
#line 21 "Setup\\BSP.c"
#line 1 "GUI\\GUIDRV_Lin.h"















 







 



extern const GUI_DEVICE_API GUIDRV_Win_API;

extern const GUI_DEVICE_API GUIDRV_Lin_1_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OY_1_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OX_1_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OXY_1_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OS_1_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSY_1_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSX_1_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSXY_1_API;

extern const GUI_DEVICE_API GUIDRV_Lin_2_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OY_2_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OX_2_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OXY_2_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OS_2_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSY_2_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSX_2_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSXY_2_API;

extern const GUI_DEVICE_API GUIDRV_Lin_4_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OY_4_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OX_4_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OXY_4_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OS_4_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSY_4_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSX_4_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSXY_4_API;

extern const GUI_DEVICE_API GUIDRV_Lin_8_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OY_8_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OX_8_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OXY_8_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OS_8_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSY_8_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSX_8_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSXY_8_API;

extern const GUI_DEVICE_API GUIDRV_Lin_16_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OY_16_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OX_16_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OXY_16_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OS_16_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSY_16_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSX_16_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSXY_16_API;

extern const GUI_DEVICE_API GUIDRV_Lin_24_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OY_24_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OX_24_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OXY_24_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OS_24_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSY_24_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSX_24_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSXY_24_API;

extern const GUI_DEVICE_API GUIDRV_Lin_32_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OY_32_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OX_32_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OXY_32_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OS_32_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSY_32_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSX_32_API;
extern const GUI_DEVICE_API GUIDRV_Lin_OSXY_32_API;




#line 162 "GUI\\GUIDRV_Lin.h"

#line 171 "GUI\\GUIDRV_Lin.h"

#line 180 "GUI\\GUIDRV_Lin.h"

#line 189 "GUI\\GUIDRV_Lin.h"

#line 198 "GUI\\GUIDRV_Lin.h"

#line 207 "GUI\\GUIDRV_Lin.h"

#line 216 "GUI\\GUIDRV_Lin.h"

#line 225 "GUI\\GUIDRV_Lin.h"





 
#line 22 "Setup\\BSP.c"
#line 1 "Setup\\I2CPCA9532.h"















 

         void I2CPCA9532_Init     (void);
unsigned char I2CPCA9532_WriteRead(unsigned char * pData, unsigned short NumBytesToWrite, unsigned char * pBuf, unsigned short NumBytesToRead);
#line 23 "Setup\\BSP.c"
#line 1 "Config\\LCDConf.h"



#line 24 "Setup\\BSP.c"






 







 











































static unsigned long _aVRAM[((2 * 320) * 240 / (4 / 2)) + 8];






 
#line 99 "Setup\\BSP.c"

#line 112 "Setup\\BSP.c"






 



 




 
#line 135 "Setup\\BSP.c"

 








 
#line 154 "Setup\\BSP.c"












#line 173 "Setup\\BSP.c"












#line 192 "Setup\\BSP.c"














 
















 


 

 
#line 236 "Setup\\BSP.c"

 




 



 
#line 260 "Setup\\BSP.c"
 
















 















 
static OS_TIMER _TouchTimer;
static unsigned long      _VRAMAddr;






 




 
static void _Delay(int ms) {
  volatile int i;

  for (i = 0; i < (50 * ms); i++) {}  
}




 
static void _SetLEDState(unsigned char LED, unsigned char State) {
  unsigned char  acCommandString[2] = {0x08, 0x00};
  unsigned char  Reg;

  if (LED > 7) {
    return;
  }
  
  
  
  if (LED >= 4) {
    acCommandString[0] = 0x09;
  }
  
  
  
  { ; __disable_irq(); OS_Counters . Cnt . DI++; };
  I2CPCA9532_WriteRead(acCommandString, 1, &Reg, 1);
  { ; if (--OS_Counters . Cnt . DI==0) __enable_irq(); };
  
  
  
  if (LED >= 4) {
    LED -= 4;  
  }
  if (State == (0)) {
    Reg |= (1 << (LED * 2)); 
  } else if (State == (2)) {
    if (Reg & (1 << (LED * 2))) {
      Reg &= ~(1 << (LED * 2));
    } else {
      Reg |= (1 << (LED * 2));
    }
  } else {
    Reg &= ~(1 << (LED * 2));
  }
  acCommandString[1] = Reg;
  { ; __disable_irq(); OS_Counters . Cnt . DI++; };
  I2CPCA9532_WriteRead(acCommandString, sizeof(acCommandString), 0, 0);
  { ; if (--OS_Counters . Cnt . DI==0) __enable_irq(); };
}



 
static void _LCD_HW_Init(void) {
  (*(volatile unsigned long *)(0xE01FC0C4))   |= (1 << 20);   
  
  
  
  (*(volatile unsigned long *)((0x3FFFC000) + 0x0040)) |= (1 << 0);
  (*(volatile unsigned long *)((0x3FFFC000) + 0x0058))  = (1 << 0);

  
  
  
  (*(volatile unsigned long *)((0xE002C000) + 0x000C)) &= ~(0x3 << 4);  
  (*(volatile unsigned long *)((0xE002C000) + 0x000C)) |= (1 << 5);     
  (*(volatile unsigned long *)((0xE0018000) + 0x000C))  = 0x00;          
  (*(volatile unsigned long *)((0xE0018000) + 0x0014)) = (1 << 1);      
  (*(volatile unsigned long *)((0xE0018000) + 0x0018)) = 0x3000;        
  (*(volatile unsigned long *)((0xE0018000) + 0x001C)) = 0x00;
  (*(volatile unsigned long *)((0xE0018000) + 0x0050)) = 0
            | (1 << 0)     
            | (1 << 1)     
            ;
  (*(volatile unsigned long *)((0xE0018000) + 0x004C)) = (1 << 9);      
  (*(volatile unsigned long *)((0xE0018000) + 0x0004)) = 0
            | (1 << 0)     
            | (1 << 3)     
            ;
  
  
  
  (*(volatile unsigned long *)((0xE002C000) + 0x0000)) |= (0x3uL << 30);   
  (*(volatile unsigned long *)((0xE002C000) + 0x0004)) |= (0
              | (0x3 << 2)  
              | (0x3 << 4)  
             );
  (*(volatile unsigned long *)((0xE0028000) + 0x0008))  |= (0
              | (1 << 16)
              | (1 << 19)
             );
  (*(volatile unsigned long *)((0xE0028000) + 0x0004))   =  0
              | (1 << 16)
              | (1 << 19)
              ;
  (*(volatile unsigned long *)((0xE0020000) + 0x000C))  =  0xC;          
  (*(volatile unsigned long *)((0xE0020000) + 0x0000))   =  0
              | (1 << 3)    
              | (1 << 4)    
              | (1 << 5)    
              ;
  (*(volatile unsigned long *)((0xE002C000) + 0x0028)) = 0x00;
  (*(volatile unsigned long *)((0xE002C000) + 0x0000))  = ((*(volatile unsigned long *)((0xE002C000) + 0x0000)) & 0xFFF000FF)
             | (1 <<  8)    
             | (1 << 10)    
             | (1 << 12)    
             | (1 << 14)    
             | (1 << 16)    
             | (1 << 18)    
             ;
  (*(volatile unsigned long *)((0xE002C000) + 0x000C))  = ((*(volatile unsigned long *)((0xE002C000) + 0x000C)) & 0xF00000FF)
             | (1 <<  8)    
             | (1 << 10)    
             | (1 << 12)    
             | (1 << 14)    
             | (1 << 16)    
             | (1 << 18)    
             | (1 << 20)    
             | (1 << 22)    
             | (1 << 24)    
             | (1 << 26)    
             ;
  (*(volatile unsigned long *)((0xE002C000) + 0x0010))  = ((*(volatile unsigned long *)((0xE002C000) + 0x0010)) & 0xF0300000)
             | (0x3 <<  0)  
             | (0x3 <<  2)  
             | (0x3 <<  4)  
             | (0x3 <<  6)  
             | (0x3 <<  8)  
             | (0x3 << 10)  
             | (0x3 << 12)  
             | (0x3 << 14)  
             | (0x3 << 16)  
             | (0x3 << 18)  
             | (1   << 22)  
             | (1   << 24)  
             | (1   << 24)  
             ;
  (*(volatile unsigned long *)((0xE002C000) + 0x0024))  = ((*(volatile unsigned long *)((0xE002C000) + 0x0024)) & 0xF0FFFFFF)
             | (1 << 25)    
             | (1 << 27)    
             ;
  (*(volatile unsigned long *)((0xE002C000) + 0x002C)) = 0
             | (1   << 0)   
             | (0x3 << 2)   
             ;
}




 
static void _LCD_SetBacklight(unsigned char Percent) {
  (*(volatile unsigned long *)((0xE0018000) + 0x001C)) = ((unsigned long)0x3000 * (unsigned long)(100 - Percent)) / (unsigned long)100;
  (*(volatile unsigned long *)((0xE0018000) + 0x0050)) = (1 << 1);
}




 
static void _LCD_Ctrl_Init(void) {
  unsigned long* pPal = 0;
  unsigned char  i;

  (*(volatile unsigned long *)((0xFFE10000) + 0x0018)) &= 0xFFFFFFFE;  

  
  
  
  
  (*(volatile unsigned long *)((0xFFE10000) + 0x0000))   = 0
               | (((240 / 16) - 1) <<  2)  
               | (( 2 - 1)         <<  8)  
               | ((10 - 1)         << 16)  
               | ((28 - 1)         << 24)  
               ;
  (*(volatile unsigned long *)((0xFFE10000) + 0x0004))   = 0
               | ((320 - 1)        <<  0)  
               | ((  2 - 1)        << 10)  
               | ((  2 - 1)        << 16)  
               | ((  3 - 1)        << 24)  
               ;
  (*(volatile unsigned long *)((0xFFE10000) + 0x0008))    = 0
               | (( 13 - 2) <<  0)  
               |         (1 << 11)  
               |         (1 << 12)  
               |         (1 << 13)  
               | ((240 - 1) << 16)  
               ;
  (*(volatile unsigned long *)((0xFFE10000) + 0x000C))     = 0x00;                
  (*(volatile unsigned long *)((0xFFE10000) + 0x001C)) = 0;                   
  (*(volatile unsigned long *)((0xFFE10000) + 0x0018))   = 0
               | (0x06 << 1)        
               | (   1 << 5)        
               ;
  
  
  
  pPal = (unsigned long*)((0xFFE10000) + 0x0200);
  for (i = 0; i < 128; i++) {
    *pPal++ = 0;
  }
  (*(volatile unsigned long *)(0xE01FC1B8)) = 0x00;  
  _Delay(20);
}




 
static void _SPI_Send(unsigned char Data) {
  unsigned long Failsafe = 0;

  (*(volatile unsigned long *)((0xE0020000) + 0x0008)) = Data;
  while ((((*(volatile unsigned long *)((0xE0020000) + 0x0004)) & 0x80) == 0) && (Failsafe < 5000)) {  
    Failsafe++;
  }
  if (Failsafe >= 5000) {
    (*(volatile unsigned long *)((0xE0020000) + 0x000C)) = 0x08;  
    (*(volatile unsigned long *)((0xE0020000) + 0x0000))  = 0
             | (1 << 3)  
             | (1 << 4)  
             | (1 << 5)  
             ;
  }
}




 
static void _LCD_WriteToReg(unsigned short Addr, unsigned short Data) {
  (*(volatile unsigned long *)((0xE0028000) + 0x000C)) = (1 << 19);  
  (*(volatile unsigned long *)((0xE0028000) + 0x000C)) = (1 << 16);  
  _SPI_Send(0);
  _SPI_Send(Addr);
  (*(volatile unsigned long *)((0xE0028000) + 0x0004)) = (1 << 16);  
  (*(volatile unsigned long *)((0xE0028000) + 0x0004)) = (1 << 19);  
  (*(volatile unsigned long *)((0xE0028000) + 0x000C)) = (1 << 16);  
  _SPI_Send(Data >> 8);
  _SPI_Send(Data & 0xFF);
  (*(volatile unsigned long *)((0xE0028000) + 0x0004)) = (1 << 16);  
  (*(volatile unsigned long *)((0xE0028000) + 0x000C)) = (1 << 19);  
  (*(volatile unsigned long *)((0xE0028000) + 0x000C)) = (1 << 16);  
  _SPI_Send(0);
  _SPI_Send(0x22);
  (*(volatile unsigned long *)((0xE0028000) + 0x0004)) = (1 << 16);  
}




 
static void _LCD_DisplayInit(void) {
  _LCD_WriteToReg(0x00,0x0001);
  _Delay(20);
  _LCD_WriteToReg(0x03,0xA2A4);
  _LCD_WriteToReg(0x0C,0x0004);
  _LCD_WriteToReg(0x0D,0x0308);
  _LCD_WriteToReg(0x0E,0x3000);
  _Delay(50);
  _LCD_WriteToReg(0x1E,0x00AF);
  _LCD_WriteToReg(0x01,0x2B3F);
  _LCD_WriteToReg(0x02,0x0600);
  _LCD_WriteToReg(0x10,0x0000);
  _LCD_WriteToReg(0x07,0x0233);
  _LCD_WriteToReg(0x0B,0x0039);
  _LCD_WriteToReg(0x0F,0x0000);
  _Delay(50);
  _LCD_WriteToReg(0x30,0x0707);
  _LCD_WriteToReg(0x31,0x0204);
  _LCD_WriteToReg(0x32,0x0204);
  _LCD_WriteToReg(0x33,0x0502);
  _LCD_WriteToReg(0x34,0x0507);
  _LCD_WriteToReg(0x35,0x0204);
  _LCD_WriteToReg(0x36,0x0204);
  _LCD_WriteToReg(0x37,0x0502);
  _LCD_WriteToReg(0x3A,0x0302);
  _LCD_WriteToReg(0x3B,0x0302);

  _LCD_WriteToReg(0x23,0x0000);
  _LCD_WriteToReg(0x24,0x0000);

  _LCD_WriteToReg(0x48,0x0000);
  _LCD_WriteToReg(0x49,0x013F);
  _LCD_WriteToReg(0x4A,0x0000);
  _LCD_WriteToReg(0x4B,0x0000);

  _LCD_WriteToReg(0x41,0x0000);
  _LCD_WriteToReg(0x42,0x0000);

  _LCD_WriteToReg(0x44,0xEF00);
  _LCD_WriteToReg(0x45,0x0000);
  _LCD_WriteToReg(0x46,0x013F);
  _Delay(50);
  _LCD_WriteToReg(0x44,0xEF00);
  _LCD_WriteToReg(0x45,0x0000);
  _LCD_WriteToReg(0x4E,0x0000);
  _LCD_WriteToReg(0x4F,0x0000);
  _LCD_WriteToReg(0x46,0x013F);
}




 
static void _LCD_TurnOn(void) {
  (*(volatile unsigned long *)((0xFFE10000) + 0x0018)) |= (0
               | (1 <<  0)  
               | (1 << 11)  
              );
  _Delay(50);
  _LCD_DisplayInit();
  _LCD_SetBacklight(100);
}




 
static void _ExecTouch(void) {
    GUI_TOUCH_Exec();
    OS_RetriggerTimer(&_TouchTimer);
}




 
static void _TouchInit(void) {
  (*(volatile unsigned long *)((0xE002C000) + 0x0000))     |= 0xc0000000;
  (*(volatile unsigned long *)((0xE002C000) + 0x0004))     |= 0x0000003c;
  (*(volatile unsigned long *)((0xE0028000) + 0x0008))      |= (1 << 20);
  (*(volatile unsigned long *)((0xE0028000) + 0x0004))       = (1 << 20);
  (*(volatile unsigned long*) ((0xE0020000) + 0x0C))  = 57;
  (*(volatile unsigned long*) (0xE0020000))   = 0x38;
}




 
static void * _Align(void * pMem, unsigned long NumBytes) {
 unsigned long Addr;
 Addr = (unsigned long)pMem;
 NumBytes -= 1;
 Addr += NumBytes;
 Addr &= ~NumBytes;
 return (void*)Addr;
}




 
static void _SetDisplayOrigin(int x, int y) {
  
  
  
  (*(volatile unsigned long *)((0xFFE10000) + 0x0010))  = (unsigned long) _VRAMAddr + (y * 320 * 2);   
}






 




 
void BSP_ETH_Init(unsigned Unit) {

  

 
  

 
  if ((*(volatile unsigned long *)(0xFFE00FFC)) == 0x39022000) {  
    (*(volatile unsigned long *)((0xE002C000) + 0x0008)) = 0x50151105;            
  } else {
    (*(volatile unsigned long *)((0xE002C000) + 0x0008)) = 0x50150105;            
  }
  (*(volatile unsigned long *)((0xE002C000) + 0x000C)) = ((*(volatile unsigned long *)((0xE002C000) + 0x000C)) & ~0x0000000f) | 0x5;
}




 
void BSP_ETH_InstallISR(void (*pfISR)(void)) {
  OS_ARM_InstallISRHandler((21), pfISR);     
  OS_ARM_EnableISR((21));                    
  OS_ARM_ISRSetPrio((21), 15);               
}




 
void BSP_Init(void) {
  
  
  
  I2CPCA9532_Init();
}




 
void BSP_SetLED(int Index) {
  _SetLEDState(Index, (0));
}

void BSP_ClrLED(int Index) {
  _SetLEDState(Index, (1));
}

void BSP_ToggleLED(int Index) {
  _SetLEDState(Index, (2));
}







 
static void _InitLCDController(unsigned LayerIndex) {
  unsigned long TouchOrientation;

  
  
  
  TouchOrientation = ((1 << 0) * LCD_GetMirrorXEx(0)) |
                     ((1 << 1) * LCD_GetMirrorYEx(0)) |
                     ((1 << 2)  * LCD_GetSwapXYEx (0)) ;
  GUI_TOUCH_SetOrientation(TouchOrientation);
  GUI_TOUCH_Calibrate(0, 0, 240, (184) , (3894));  
  GUI_TOUCH_Calibrate(1, 0, 320, (154), (3834));   
  
  
  
  _VRAMAddr = (unsigned long)_Align((void *)((unsigned long)&_aVRAM[0]), 8);
  _LCD_HW_Init();
  _LCD_SetBacklight(0);
  _LCD_Ctrl_Init();
  (*(volatile unsigned long *)((0xFFE10000) + 0x0010)) = _VRAMAddr;
  _LCD_TurnOn();
  
  
  
  _TouchInit();
  OS_CreateTimer(&_TouchTimer,_ExecTouch,(10)); OS_StartTimer(&_TouchTimer);;
}
















 
int LCD_X_DisplayDriver(unsigned LayerIndex, unsigned Cmd, void * pData) {
  LCD_X_SETORG_INFO * pSetOrg;

  switch (Cmd) {
  
  
  
  case 0x01:
    
    
    
    
    
    
    _InitLCDController(LayerIndex);
    break;
  case 0x03:
    
    
    
    pSetOrg = (LCD_X_SETORG_INFO *)pData;
    _SetDisplayOrigin(pSetOrg->xPos, pSetOrg->yPos);
  }
  return 0;
}









 
void LCD_X_Config(void) {
  _VRAMAddr = (unsigned long)_Align((void *)((unsigned long)&_aVRAM[0]), 8);
  
  
  
  GUI_DEVICE_CreateAndLink(&GUIDRV_Lin_OSX_16_API, &LCD_API_ColorConv_565, 0, 0);
  
  
  
  LCD_SetSizeEx    (0, 320,   240);
  LCD_SetVSizeEx   (0, (2 * 320),  240);
  LCD_SetVRAMAddrEx(0, (void *)_VRAMAddr);
  
  
  



}




 
void BSP_USBH_InstallISR(void (*pfISR)(void)) {
  OS_ARM_InstallISRHandler(22, pfISR);     
  OS_ARM_EnableISR(22);                    
  OS_ARM_ISRSetPrio(22, 2);               
}
































 
void BSP_USBH_Init(void) {
  
  
  
  (*(volatile unsigned long *)(0xE01FC0C4)) |= ((unsigned long)1<<31);
  
  
  
  (*(volatile unsigned long *)(0xFFE0CFF0 + 0x04))  |= (1<<0) | (1<<3) | (1<<4);
  while( ((*(volatile unsigned long *)(0xFFE0CFF0 + 0x08)) & ((1<<0) | (1<<3) | (1<<4))) != ((1<<0) | (1<<3) | (1<<4)));
	
  
	
	
	
	
	
	
  
	(*(volatile unsigned long *)((0xE002C000) + 0x0000)) |= (1 << 24) | (1 << 26);
	
  
  
	(*(volatile unsigned long *)((0xE0028000) + 0x0008)) |= (1 << 14);  
	(*(volatile unsigned long *)((0xE0028000) + 0x000C))  = (1 << 14);  
	
	
  
  
  
	(*(volatile unsigned long *)((0xE002C000) + 0x0004)) |= (1 << 26) | (1 << 28) | (1 << 30);
	(*(volatile unsigned long *)((0xE002C000) + 0x000C)) |= (1 << 4) 
          |  (1 << 28)		
          |  (1 << 30);	

  


 
  (*(volatile unsigned long *)((0xE002C040) + 0x000C)) &=~ (((3) << (27-16))
						   | ((3) << (30-16)) );
  (*(volatile unsigned long *)((0xE002C040) + 0x000C)) |= ((2) << (27-16))
  					  | ((2) << (30-16));
}


 
