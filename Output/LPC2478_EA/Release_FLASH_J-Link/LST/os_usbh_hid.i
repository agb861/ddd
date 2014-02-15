#line 1 "Application\\OS_USBH_HID.c"















 


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



 

#line 20 "Application\\OS_USBH_HID.c"
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

 





 







 

#line 21 "Application\\OS_USBH_HID.c"
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



 


#line 22 "Application\\OS_USBH_HID.c"
#line 1 "USBH\\USBH.h"















 




#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"
 
 
 





 










#line 27 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"








 

 
 
  typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 






#line 119 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"











 

#line 22 "USBH\\USBH.h"
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







 
#line 23 "Application\\OS_USBH_HID.c"






 







 










 
enum {
  TASK_PRIO_APP,
  TASK_PRIO_USBH_MAIN,
  TASK_PRIO_USBH_ISR
};

typedef struct {
  union {
    USBH_HID_KEYBOARD_DATA  Keyboard;
    USBH_HID_MOUSE_DATA     Mouse;
  } Data;
  unsigned char Event;
}  HID_EVENT;

typedef struct {
  unsigned short KeyCode;
  const char * sDesc;
} SCANCODE_TO_DESC;






 
static const  SCANCODE_TO_DESC _aScanCode2StringTable[] = {
  { 0x00, "Reserved/(no event indicated) "},
  { 0x01, "Key ErrorRollOver     "},
  { 0x02, "Key POSTFail          "},
  { 0x03, "Key ErrorUndefined    "},
  { 0x04, "Key a/A               "},
  { 0x05, "Key b/B               "},
  { 0x06, "Key c/C               "},
  { 0x07, "Key d/D               "},
  { 0x08, "Key e/E               "},
  { 0x09, "Key f/F               "},
  { 0x0A, "Key g/G               "},
  { 0x0B, "Key h/H               "},
  { 0x0C, "Key i/I               "},
  { 0x0D, "Key j/J               "},
  { 0x0E, "Key k/K               "},
  { 0x0F, "Key l/L               "},
  { 0x10, "Key m/M               "},
  { 0x11, "Key n/N               "},
  { 0x12, "Key o/O               "},
  { 0x13, "Key p/P               "},
  { 0x14, "Key q/Q               "},
  { 0x15, "Key r/R               "},
  { 0x16, "Key s/S               "},
  { 0x17, "Key t/T               "},
  { 0x18, "Key u/U               "},
  { 0x19, "Key v/V               "},
  { 0x1A, "Key w/W               "},
  { 0x1B, "Key x/X               "},
  { 0x1C, "Key y/Y               "},
  { 0x1D, "Key z/Z               "},
  { 0x1E, "Key 1/!               "},
  { 0x1F, "Key 2/@               "},
  { 0x20, "Key 3/#               "},
  { 0x21, "Key 4/$               "},
  { 0x22, "Key 5/%               "},
  { 0x23, "Key 6/^               "},
  { 0x24, "Key 7/&               "},
  { 0x25, "Key 8/*               "},
  { 0x26, "Key 9/(               "},
  { 0x27, "Key 0/)               "},
  { 0x28, "Key Return (ENTER)    "},
  { 0x29, "Key ESCAPE            "},
  { 0x2A, "Key DELETE(Backspace) "},
  { 0x2B, "Key Tab               "},
  { 0x2C, "Key Spacebar          "},
  { 0x2D, "Key -/(underscore)    "},
  { 0x2E, "Key =/+               "},
  { 0x2F, "Key [/{               "},
  { 0x30, "Key ]/}               "},
  { 0x31, "Key \\/|              "},
  { 0x32, "Key Non-US #/~        "},
  { 0x33, "Key ;/:               "},
  { 0x34, "Key ‘/“               "},
  { 0x35, "Key GraveAccent/Tilde "},
  { 0x36, "Key,/<                "},
  { 0x37, "Key ./>               "},
  { 0x38, "Key //?               "},
  { 0x39, "Key Caps Lock         "},
  { 0x3A, "Key F1                "},
  { 0x3B, "Key F2                "},
  { 0x3C, "Key F3                "},
  { 0x3D, "Key F4                "},
  { 0x3E, "Key F5                "},
  { 0x3F, "Key F6                "},
  { 0x40, "Key F7                "},
  { 0x41, "Key F8                "},
  { 0x42, "Key F9                "},
  { 0x43, "Key F10               "},
  { 0x44, "Key F11               "},
  { 0x45, "Key F12               "},
  { 0x46, "Key PrintScreen       "},
  { 0x47, "Key Scroll Lock       "},
  { 0x48, "Key Pause             "},
  { 0x49, "Key Insert            "},
  { 0x4A, "Key Home              "},
  { 0x4B, "Key PageUp            "},
  { 0x4C, "Key Delete Forward    "},
  { 0x4D, "Key End               "},
  { 0x4E, "Key PageDown          "},
  { 0x4F, "Key RightArrow        "},
  { 0x50, "Key LeftArrow         "},
  { 0x51, "Key DownArrow         "},
  { 0x52, "Key UpArrow           "},
  { 0x53, "Keypad NumLock/Clear  "},
  { 0x54, "Keypad /              "},
  { 0x55, "Keypad *              "},
  { 0x56, "Keypad -              "},
  { 0x57, "Keypad +              "},
  { 0x58, "Keypad ENTER          "},
  { 0x59, "Keypad 1/End          "},
  { 0x5A, "Keypad 2/Down Arrow   "},
  { 0x5B, "Keypad 3/PageDn       "},
  { 0x5C, "Keypad 4/Left Arrow   "},
  { 0x5D, "Keypad 5              "},
  { 0x5E, "Keypad 6/Right Arrow  "},
  { 0x5F, "Keypad 7/Home         "},
  { 0x60, "Keypad 8/Up Arrow     "},
  { 0x61, "Keypad 9/PageUp       "},
  { 0x62, "Keypad 0/Insert       "},
  { 0x63, "Keypad ./Delete       "},
  { 0x64, "Key Non-US \\/|       "},
  { 0x65, "Key Application       "},
  { 0x66, "Key Power             "},
  { 0x67, "Keypad =              "},
  { 0x68, "Key F13               "},
  { 0x69, "Key F14               "},
  { 0x6A, "Key F15               "},
  { 0x6B, "Key F16               "},
  { 0x6C, "Key F17               "},
  { 0x6D, "Key F18               "},
  { 0x6E, "Key F19               "},
  { 0x6F, "Key F20               "},
  { 0x70, "Key F21               "},
  { 0x71, "Key F22               "},
  { 0x72, "Key F23               "},
  { 0x73, "Key F24               "},
  { 0x74, "Key Execute           "},
  { 0x75, "Key Help              "},
  { 0x76, "Key Menu              "},
  { 0x77, "Key Select            "},
  { 0x78, "Key Stop              "},
  { 0x79, "Key Again             "},
  { 0x7A, "Key Undo              "},
  { 0x7B, "Key Cut               "},
  { 0x7C, "Key Copy              "},
  { 0x7D, "Key Paste             "},
  { 0x7E, "Key Find              "},
  { 0x7F, "Key Mute              "},
  { 0x80, "Key Volume Up         "},
  { 0x81, "Key Volume Down       "},
  { 0x82, "Key Locking CapsLock  "},
  { 0x83, "Key Locking NumLock   "},
  { 0x84, "Key Locking ScrollLock"},
  { 0x85, "Keypad Comma          "},
  { 0x86, "Keypad Equal Sign     "},
  { 0x87, "Key International1    "},
  { 0x88, "Key International2    "},
  { 0x89, "Key International3    "},
  { 0x8A, "Key International4    "},
  { 0x8B, "Key International5    "},
  { 0x8C, "Key International6    "},
  { 0x8D, "Key International7    "},
  { 0x8E, "Key International8    "},
  { 0x8F, "Key International9    "},
  { 0x90, "Key LANG1             "},
  { 0x91, "Key LANG2             "},
  { 0x92, "Key LANG3             "},
  { 0x93, "Key LANG4             "},
  { 0x94, "Key LANG5             "},
  { 0x95, "Key LANG6             "},
  { 0x96, "Key LANG7             "},
  { 0x97, "Key LANG8             "},
  { 0x98, "Key LANG9             "},
  { 0x99, "Key Alternate Erase   "},
  { 0x9A, "Key SysReq/Attention  "},
  { 0x9B, "Key Cancel            "},
  { 0x9C, "Key Clear             "},
  { 0x9D, "Key Prior             "},
  { 0x9E, "Key Return            "},
  { 0x9F, "Key Separator         "},
  { 0xA0, "Key Out               "},
  { 0xA1, "Key Oper              "},
  { 0xA2, "Key Clear/Again       "},
  { 0xA3, "Key CrSel/Props       "},
  { 0xA4, "Key ExSel             "},
  { 0xB0, "Keypad 00             "},
  { 0xB1, "Keypad 000            "},
  { 0xB2, "Thousands Separator   "},
  { 0xB3, "Decimal Separator     "},
  { 0xB4, "Currency Unit         "},
  { 0xB5, "Currency Sub-unit     "},
  { 0xB6, "Keypad (              "},
  { 0xB7, "Keypad )              "},
  { 0xB8, "Keypad {              "},
  { 0xB9, "Keypad }              "},
  { 0xBA, "Keypad Tab            "},
  { 0xBB, "Keypad Backspace      "},
  { 0xBC, "Keypad A              "},
  { 0xBD, "Keypad B              "},
  { 0xBE, "Keypad C              "},
  { 0xBF, "Keypad D              "},
  { 0xC0, "Keypad E              "},
  { 0xC1, "Keypad F              "},
  { 0xC2, "Keypad XOR            "},
  { 0xC3, "Keypad ^              "},
  { 0xC4, "Keypad %              "},
  { 0xC5, "Keypad <              "},
  { 0xC6, "Keypad >              "},
  { 0xC7, "Keypad &              "},
  { 0xC8, "Keypad &&             "},
  { 0xC9, "Keypad |              "},
  { 0xCA, "Keypad ||             "},
  { 0xCB, "Keypad :              "},
  { 0xCC, "Keypad #              "},
  { 0xCD, "Keypad Space          "},
  { 0xCE, "Keypad @              "},
  { 0xCF, "Keypad !              "},
  { 0xD0, "Keypad Memory Store   "},
  { 0xD1, "Keypad Memory Recall  "},
  { 0xD2, "Keypad Memory Clear   "},
  { 0xD3, "Keypad Memory Add     "},
  { 0xD4, "Keypad Memory Subtract"},
  { 0xD5, "Keypad Memory Multiply"},
  { 0xD6, "Keypad Memory Divide  "},
  { 0xD7, "Keypad +/-            "},
  { 0xD8, "Keypad Clear          "},
  { 0xD9, "Keypad Clear Entry    "},
  { 0xDA, "Keypad Binary         "},
  { 0xDB, "Keypad Octal          "},
  { 0xDC, "Keypad Decimal        "},
  { 0xDD, "Keypad Hexadecimal    "},
  { 0xE0, "Key LeftControl       "},
  { 0xE1, "Key LeftShift         "},
  { 0xE2, "Key LeftAlt           "},
  { 0xE3, "Key Left GUI          "},
  { 0xE4, "Key RightControl      "},
  { 0xE5, "Key RightShift        "},
  { 0xE6, "Key RightAlt          "},
  { 0xE7, "Key Right GUI         "}
};






 
static  int         _StackMain[1024/sizeof(int)];
static OS_TASK                 _TCBMain;
static  int         _StackIsr[1024/sizeof(int)];
static OS_TASK                 _TCBIsr;
static HID_EVENT               _aHIDEvents[10];
static OS_MAILBOX              _HIDMailBox;






 



 
static const char * _ScanCode2String(unsigned Code) {
  unsigned i;
  
  for (i = 0; i < (sizeof(_aScanCode2StringTable)/sizeof(_aScanCode2StringTable[0])); i++) {
    if (Code == _aScanCode2StringTable[i].KeyCode) {
      return  _aScanCode2StringTable[i].sDesc;
    }
  }
  return "Reserved or unknown code      ";
}




 
static void _OnMouseChange(USBH_HID_MOUSE_DATA  * pMouseData) {
  HID_EVENT  HidEvent;

  HidEvent.Event = (1 << 0);
  HidEvent.Data.Mouse = *pMouseData;
  OS_PutMail(&_HIDMailBox, &HidEvent);
}




 
static void _OnKeyboardChange(USBH_HID_KEYBOARD_DATA  * pKeyData) {
  HID_EVENT  HidEvent;

  HidEvent.Event         = (1 << 1);
  HidEvent.Data.Keyboard = *pKeyData;
  OS_PutMail(&_HIDMailBox, &HidEvent);
}




 
static const char * _KeyState2String(unsigned State) {
   return State == 1 ? "pressed" : "released";
}





 



 
void MainTask(void);
void MainTask(void) {
  HID_EVENT  HidEvent;

  USBH_Init();
  OS_SetPriority(OS_pCurrentTask, TASK_PRIO_APP);                                       
  OS_CreateTask_R (&_TCBMain, "USBH_Task", TASK_PRIO_USBH_MAIN, USBH_Task, (void *)_StackMain, sizeof(_StackMain) ,2 );   
  OS_CreateTask_R (&_TCBIsr, "USBH_isr", TASK_PRIO_USBH_ISR, USBH_ISRTask, (void *)_StackIsr, sizeof(_StackIsr) ,2 );    
  USBH_HID_Init();
  USBH_HID_SetOnMouseStateChange(_OnMouseChange);
  USBH_HID_SetOnKeyboardStateChange(_OnKeyboardChange);
  
  
  
  OS_CreateMB(&_HIDMailBox, sizeof(HID_EVENT), 10, &_aHIDEvents);
  while (1) {
    BSP_ToggleLED(1);

    OS_GetMail(&_HIDMailBox, &HidEvent);
    if ((HidEvent.Event & ((1 << 0))) == (1 << 0)) {
      HidEvent.Event &= ~((1 << 0));
      USBH_Logf_Application("Mouse: xRel: %d, yRel: %d, WheelRel: %d, ButtonState: %d",
                            HidEvent.Data.Mouse.xChange, HidEvent.Data.Mouse.yChange, HidEvent.Data.Mouse.WheelChange, HidEvent.Data.Mouse.ButtonState);
    } else if ((HidEvent.Event & ((1 << 1))) == (1 << 1)) {
      HidEvent.Event &= ~((1 << 1));
      USBH_Logf_Application("Keyboard:  %s - %s", _ScanCode2String(HidEvent.Data.Keyboard.Code), _KeyState2String(HidEvent.Data.Keyboard.Value));
    }
  }
}
 
