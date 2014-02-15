#line 1 "Setup\\RTOSInit.c"




































 

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

 





 







 

#line 40 "Setup\\RTOSInit.c"





 










 




















#line 86 "Setup\\RTOSInit.c"





 




#line 105 "Setup\\RTOSInit.c"




 

















 








 





 

 





#line 159 "Setup\\RTOSInit.c"










 




 










 

 



#line 198 "Setup\\RTOSInit.c"




 



#line 223 "Setup\\RTOSInit.c"

#line 238 "Setup\\RTOSInit.c"

 

#line 252 "Setup\\RTOSInit.c"

 




 




#line 269 "Setup\\RTOSInit.c"

 
 







#line 285 "Setup\\RTOSInit.c"

 
 




#line 302 "Setup\\RTOSInit.c"

 

#line 350 "Setup\\RTOSInit.c"

 



#line 363 "Setup\\RTOSInit.c"




















 






 










 
static void _InitPLL(void) {
  if (*(volatile unsigned int*)0xE01FC088 & (1 << 25)) {
    *(volatile unsigned int*)0xE01FC080  |= (1 << 1);
    *(volatile unsigned int*)0xE01FC08C  = 0xAA;
    *(volatile unsigned int*)0xE01FC08C  = 0x55;
  }
  *(volatile unsigned int*)0xE01FC080     = 0;                         
  *(volatile unsigned int*)0xE01FC08C    = 0xAA;
  *(volatile unsigned int*)0xE01FC08C    = 0x55;



  *(volatile unsigned int*)0xE01FC1A0        &= ~(1 << 4);                
  *(volatile unsigned int*)0xE01FC1A0        |=  (1 << 5);                
  *(volatile unsigned int*)0xE01FC10C  = 1;                         

  *(volatile unsigned int*)0xE01FC084     = ((12) - 1);   
  *(volatile unsigned int*)0xE01FC08C    = 0xAA;
  *(volatile unsigned int*)0xE01FC08C    = 0x55;
  *(volatile unsigned int*)0xE01FC080     = 1;                         
  *(volatile unsigned int*)0xE01FC08C    = 0xAA;
  *(volatile unsigned int*)0xE01FC08C    = 0x55;
  do {
  } while ((*(volatile unsigned int*)0xE01FC088 & (1 << 26)) == 0);   
  *(volatile unsigned int*)0xE01FC104  = 4;                         
  *(volatile unsigned int*)0xE01FC108  = 5;                         

  *(volatile unsigned int*)0xE01FC1A8   = (0xAAAAAAAA);
  *(volatile unsigned int*)0xE01FC1AC   = (0xAAAAAAAA);

  *(volatile unsigned int*)0xE01FC080     = (1 << 0) | (1 << 1);       
  *(volatile unsigned int*)0xE01FC08C    =  0xAA;
  *(volatile unsigned int*)0xE01FC08C    =  0x55;
}







 
static void _Init_VIC(void) {
  int Index;

  *(volatile unsigned int*)(0xFFFFF000 + 0x014) = 0xFFFFFFFF;            
  *(volatile unsigned int*)(0xFFFFF000 + 0xF00)     = 0;                     
  for (Index = 0; Index < 32; Index++) {
    OS_ARM_InstallISRHandler(Index, 0);      
  }
  *(volatile unsigned int*)(0xFFFFF000 + 0x01C)   = 0xFFFFFFFF;            
  *(volatile unsigned int*)(0xFFFFF000 + 0x00C)      = 0;                     
}




 
static void _OS_ISR_Tick(void) {
  *(volatile unsigned int*)(0xE0004000 + 0x00) = (1 << 0);  
  OS_HandleTick();                     



}







 
static void _EMC_Init(void) {
  volatile unsigned long i;
  volatile unsigned long Dummy;

  *(volatile unsigned long *)((0xFFE08000) + 0x0000)  = (1 << 0);    
  *(volatile unsigned int*)0xE01FC0C4      |= (1 << 11);   
  *(volatile unsigned int*)((0xE002C000) + 0x10)     = 0
                 | (1 << 28)  
                 | (1 << 30)  
                 ;

  *(volatile unsigned int*)((0xE002C000) + 0x14)     = 0
                 | (1 <<  0)  
                 | (1 <<  2)  
                 | (1 <<  4)  
                 | (1 <<  8)  
                 | (1 << 16)  
                 | (1 << 24)  
                 | (1 << 26)  
                 | (1 << 28)  
                 | (1 << 30)  
                 ;
  *(volatile unsigned int*)((0xE002C000) + 0x1C)     = 0
                 | (1 <<  0)  
                 | (1 <<  2)  
                 | (1 <<  4)  
                 | (1 <<  6)  
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
                 | (1 << 28)  
                 | (1 << 30)  
                 ;
#line 529 "Setup\\RTOSInit.c"
  *(volatile unsigned int*)((0xE002C000) + 0x18)     = 0
                 | (1 <<  0)  
                 | (1 <<  2)  
                 | (1 <<  4)  
                 | (1 <<  6)  
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
                 | (1 << 28)  
                 | (1 << 30)  
                 ;
  *(volatile unsigned int*)((0xE002C000) + 0x20)     = 0
                 | (1 <<  0)  
                 | (1 <<  2)  
                 | (1 <<  4)  
                 | (1 <<  6)  
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
                 | (1 << 28)  
                 | (1 << 30)  
                 ;
  *(volatile unsigned int*)((0xE002C000) + 0x24)     = 0
                 | (1 <<  0)  
                 | (1 <<  2)  
                 | (1 <<  4)  
                 | (1 <<  6)  
                 | (1 <<  8)  
                 | (1 << 10)  
                 | (1 << 12)  
                 | (1 << 14)  
                 | (1 << 16)  
                 | (1 << 18)  
                 | (1 << 20)  
                 | (1 << 22)  
                 | (1 << 28)  
                 | (1 << 30)  
                 ;

  
  
  
  *(volatile unsigned long *)((0xFFE08000) + 0x0030)         = 1;
  *(volatile unsigned long *)((0xFFE08000) + 0x0034)        = 3;
  *(volatile unsigned long *)((0xFFE08000) + 0x0038)       = 5;
  *(volatile unsigned long *)((0xFFE08000) + 0x003C)        = 1;
  *(volatile unsigned long *)((0xFFE08000) + 0x0040)        = 5;
  *(volatile unsigned long *)((0xFFE08000) + 0x0044)         = 1;
  *(volatile unsigned long *)((0xFFE08000) + 0x0048)         = 5;
  *(volatile unsigned long *)((0xFFE08000) + 0x004C)        = 5;
  *(volatile unsigned long *)((0xFFE08000) + 0x0050)        = 5;
  *(volatile unsigned long *)((0xFFE08000) + 0x0054)        = 1;
  *(volatile unsigned long *)((0xFFE08000) + 0x0058)        = 1;
  *(volatile unsigned long *)((0xFFE08000) + 0x0028) = 1;

  *(volatile unsigned long *)((0xFFE08000) + 0x0104) = 0
                        | (0x2 << 0)  
                        | (0x2 << 8)  
                        ;
  *(volatile unsigned long *)((0xFFE08000) + 0x0100) = 0x5488;       
#line 626 "Setup\\RTOSInit.c"
  
  
  
  for (i = 0; i < 5000; i++) {        
  }
  *(volatile unsigned long *)((0xFFE08000) + 0x0020) = 0
                        | (1   << 0)  
                        | (1   << 1)  
                        | (0x3 << 7)  
                        ;
  
  
  
  for (i = 0; i < 10000; i++) {       
  }
  *(volatile unsigned long *)((0xFFE08000) + 0x0020) = 0
                        | (1 << 0)    
                        | (1 << 1)    
                        | (1 << 8)    
                        ;
  *(volatile unsigned long *)((0xFFE08000) + 0x0024) = 0x02;         
  
  
  
  for (i = 0; i < 5000; i++) {        
  }
  *(volatile unsigned long *)((0xFFE08000) + 0x0024) = 0x1C;         
  *(volatile unsigned long *)((0xFFE08000) + 0x0020) = 0
                        | (1 << 0)    
                        | (1 << 1)    
                        | (1 << 7)    
                        ;

  Dummy = *((volatile unsigned long*)((0xA0000000) | (0x22 << 11)));  



  *(volatile unsigned long *)((0xFFE08000) + 0x0020)  = 0x00;        
  *(volatile unsigned long *)((0xFFE08000) + 0x0100) |= (1 << 19);   
  
  
  
  for (i = 0; i < (50 * 100); i++) { 
  }
  *(volatile unsigned long *)((0xFFE08000) + 0x0204)  = 0x02;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0208)  = 0x02;       
  *(volatile unsigned long *)((0xFFE08000) + 0x020C)   = 0x1F;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0210) = 0x1F;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0214)   = 0x1F;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0218) = 0x0F;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0200)   = 0
                         | (1 << 0)  
                         | (1 << 7)  
                         ;
  *(volatile unsigned long *)((0xFFE08000) + 0x0224)  = 0x02;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0228)  = 0x02;       
  *(volatile unsigned long *)((0xFFE08000) + 0x022C)   = 0x08;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0230) = 0x1F;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0234)   = 0x08;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0238) = 0x0F;       
  *(volatile unsigned long *)((0xFFE08000) + 0x0220)   = (1 << 7);   
  
  
  
  for (i = 0; i < (50 * 10); i++) {  
  }
}






 








 
void OS_InitHW(void) {
  __disable_irq();
  _Init_VIC();                   
  
  *(volatile unsigned int*)0xE01FC0C4      |=  (1 << 1);   
  *(volatile unsigned int*)(0xE0004000 + 0x04) &= ~(1 << 0);                  
  *(volatile unsigned int*)(0xE0004000 + 0x00)   =  (1 << 0);     
  *(volatile unsigned int*)(0xE0004000 + 0x0C)   = 0;                          
  *(volatile unsigned int*)(0xE0004000 + 0x18)  = (((57600000uL)/2) / 1000) - 1;     
  *(volatile unsigned int*)(0xE0004000 + 0x14)  =  (1 << 0)                   
                | (1 << 1);                  
  *(volatile unsigned int*)(0xE0004000 + 0x08)   =  0;                         
  *(volatile unsigned int*)(0xE0004000 + 0x04) |=  (1 << 0);                  
  
  OS_ARM_InstallISRHandler(4, &_OS_ISR_Tick); 
  OS_ARM_EnableISR(4);                        
  OS_ARM_ISRSetPrio(4, 15);                   
  
  OS_COM_Init();
  OS_RestoreI();
}












 
void OS_Idle(void) {     
  while (1) {
  }
}








 
unsigned int OS_GetTime_Cycles(void) {
  unsigned int time;
  unsigned int count;

  count = *(volatile unsigned int*)(0xE0004000 + 0x08);                               
  time  = (OS_Time);                           
  if ((*(volatile unsigned int*)(0xE0004000 + 0x00) & (1 << 0)) != 0) {  
    time++;                                         
    count = *(volatile unsigned int*)(0xE0004000 + 0x08);                             
  }
  return ((((57600000uL)/2) / 1000)) * time + count;
}













 
unsigned int OS_ConvertCycles2us(unsigned int Cycles) {
  return Cycles/(((57600000uL)/2)/1000000);
}






 

#line 905 "Setup\\RTOSInit.c"

void OS_COM_Init(void) {}
void OS_COM_Send1(unsigned char c) {
  c=c;           
  OS_COM_ClearTxActive();  
}



 









 








 
static void _OS_ISR_Undefined(void) {

    volatile unsigned int Dummy;

    Dummy = 1;
     
    while (Dummy > 0) {
    }

}








 
 void OS_irq_handler(void) {
  OS_ISR_HANDLER* pISR;
  pISR = (OS_ISR_HANDLER*) *(volatile unsigned int*)(0xFFFFF000 + 0xF00);   
  { ; OS_Counters . Cnt . Region++; __enable_irq(); };                
  if (pISR != 0) {
    pISR();                                   
  } else {
    _OS_ISR_Undefined();
  }
  __disable_irq();                                    
  *(volatile unsigned int*)(0xFFFFF000 + 0xF00) = 0;                        
  { __disable_irq(); ; if ((OS_Counters . Cnt . Region == 1) && OS_Pending) { OS_SwitchFromInt(); } else { OS_Counters . Cnt . Region--; }; ; ; };                
}




 
OS_ISR_HANDLER* OS_ARM_InstallISRHandler (int ISRIndex, OS_ISR_HANDLER* pISRHandler) {
  OS_ISR_HANDLER*  pOldHandler;
  OS_ISR_HANDLER** papISR;

#line 981 "Setup\\RTOSInit.c"
  __disable_irq();
  papISR = (OS_ISR_HANDLER**) & *(volatile unsigned int*)(0xFFFFF000 + 0x100);
  pOldHandler          = *(papISR + ISRIndex);
  *(papISR + ISRIndex) = pISRHandler;
  OS_RestoreI();
  return pOldHandler;
}




 
void OS_ARM_EnableISR(int ISRIndex) {
#line 1000 "Setup\\RTOSInit.c"
  __disable_irq();
  *(volatile unsigned int*)(0xFFFFF000 + 0x010) = (1UL << ISRIndex);
  OS_RestoreI();
}




 
void OS_ARM_DisableISR(int ISRIndex) {
#line 1016 "Setup\\RTOSInit.c"
  __disable_irq();
  *(volatile unsigned int*)(0xFFFFF000 + 0x014) = (1UL << ISRIndex);
  OS_RestoreI();
}




 
int OS_ARM_ISRSetPrio(int ISRIndex, int Prio) {
  unsigned int* pPrio;
  int     OldPrio;
#line 1034 "Setup\\RTOSInit.c"
  __disable_irq();
  pPrio = (unsigned int*) (0xFFFFF000 + 0x200);
  OldPrio = pPrio[ISRIndex];
  pPrio[ISRIndex] = (OldPrio & ~((16) - 1)) | (Prio & ((16) - 1));
  OS_RestoreI();
  return OldPrio & ((16) - 1);
}








 
 int __low_level_init(void);        
 int __low_level_init(void) {

    _InitPLL();


    *(volatile unsigned int*)(0xE01FC000)  = 0x00;              
    *(volatile unsigned int*)(0xE01FC004) = (5);  
    *(volatile unsigned int*)(0xE01FC000)  = 0x01;              

  
  
  
  _EMC_Init();

  return 1;                      
};

 

