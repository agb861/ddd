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
File    : RTOS.h
Purpose : include file for embOS,
          to be included in every C-module accessing embOS-routines
--------  END-OF-HEADER  ---------------------------------------------
*/

#ifndef RTOS_H_INCLUDED        /* Avoid multiple inclusion          */
#define RTOS_H_INCLUDED

/*********************************************************************
*
*       Chip specifics for ARM7TDMI / ARM9TDMI and KEIL ARM MDK
*
**********************************************************************
*/

#include <string.h>                            /* req. for memset.h */

/*********************************************************************
*
*     Specifics for ARM cores and KEIL-MDK compiler
*
**********************************************************************
*/

#define OS_PORT_REVISION          (1)                // Port specific revision
#define OS_PTR_OP_IS_ATOMIC       (1)
#define OS_GetTime()              (OS_Time)
#define OS_GetTime32()            (OS_Time)
#define OS_I32                    int
#define OS_SIZEOF_INT             (4)                // Size of integer in bytes
#define OS_BIG_ENDIAN             (0)                
#define OS_SUPPORT_SYSSTACK_INFO  (1)                // Option to supply more info  to viewer
#define OS_SUPPORT_OS_ALLOC       (1)                // Define whether OS_Alloc is supported
#define OS_SP_ADJUST              (0)
#define OS_EnterIntStack()                           // Int stack is automatically used by ARM
#define OS_LeaveIntStack()                           // Int stack is automatically used by ARM

/*****  Core specific configuration *********************************/

#define OS_SUPPORT_INTSTACK_INFO            (1)      // Option to supply more info  to viewer
#define OS_SWITCH_FROM_INT_MODIFIES_STACK   (1)
#define OS_INTERRUPTS_ARE_NESTABLE_ON_ENTRY (0)
#define OS_SUPPORT_INT_PRIORITY             (0)              // No selectable interrupt priorities with ARM

/*****  End of configuration settings *******************************/

#ifdef __TARGET_ARCH_4T
  #define OS_CPU "ARM4/KEIL_MDK"
#else
  #define OS_CPU "ARM5/KEIL_MDK"
#endif

#define OS_DI() __disable_irq()    /* We use the default intrinsic function */
#define OS_EI() __enable_irq()     /* We use the default intrinsic function */


/* Option to get Stack pointer information  */
#define OS_INIT_STACK_INFO()

/*********************************************************************
*
*       Port specific (non OS generic) functions
*/
#ifdef __cplusplus
  extern "C" {
#endif

  typedef void    OS_ISR_HANDLER(void);
  void            OS_irq_handler(void);     /* Declare function to make sure it is arm pcs */
  void            OS_IRQ_SERVICE(void);     /* embOS int handler in RTOSVect.asm  */
  void            OS_USER_irq_func(void);   /* User interrupt handler from UserIrq.c */
  OS_ISR_HANDLER* OS_ARM_InstallISRHandler (int ISRIndex, OS_ISR_HANDLER* pFunc);
  void            OS_ARM_EnableISR         (int ISRIndex);
  void            OS_ARM_DisableISR        (int ISRIndex);
  int             OS_ARM_ISRSetPrio        (int ISRIndex, int Prio);
  void            OS_ARM_AssignISRSource   (int ISRIndex, int Source);
  void            OS_ARM_EnableISRSource   (int SourceIndex);
  void            OS_ARM_DisableISRSource  (int SourceIndex);
  void            OS_StartTask             (void);
  void            OS_InitPLL               (void);

/*********************************************************************
*
*       Core specific implementation
*/

/****** Support for ARM VFP *****************************************/
  
extern const struct OS_EXTEND_TASK_CONTEXT OS_VFP_ExtendContext;

/****** Support for ARM MMU and caches ******************************/

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

#define OS_ARM_CACHEMODE_NC_NB    ((0 << 3) | (0 << 2))
#define OS_ARM_CACHEMODE_C_NB     ((1 << 3) | (0 << 2))
#define OS_ARM_CACHEMODE_NC_B     ((0 << 3) | (1 << 2))
#define OS_ARM_CACHEMODE_C_B      ((1 << 3) | (1 << 2))
#define OS_ARM_CACHEMODE_ILLEGAL  (0x01)

#ifdef __cplusplus
  } 
#endif

/*********************************************************************
*
*     Port specific revision
*/

/*********************************************************************
*
*       Check configuration
*
**********************************************************************

This is required in order to automatically create the correct identifiers
in order to be able to autoamitcally remap the identifiers.

*/

#ifdef __thumb
  #define OS_CPUMODE_PREFIX "T"
#else
  #define OS_CPUMODE_PREFIX "A"
#endif

#ifdef __TARGET_ARCH_4T
  #define OS_CPU_PREFIX "4"
#else
  #define OS_CPU_PREFIX "5"
#endif

#ifdef __BIG_ENDIAN
  #define OS_ENDIAN_PREFIX "B"
#else
  #define OS_ENDIAN_PREFIX "L"
#endif

#define OS_MODEL OS_CPUMODE_PREFIX OS_CPU_PREFIX OS_ENDIAN_PREFIX


/****** End of chip / compiler specific part ************************/

/*********************************************************************
*
*       Generic portion of the OS starts here
*
**********************************************************************
This file (original name OS_RAW.h) is part of RTOS.h, the include
file for the OS.
*/

#if (!defined(OS_LIBMODE_XR) && !defined(OS_LIBMODE_R)  &&   \
     !defined(OS_LIBMODE_S)  && !defined(OS_LIBMODE_SP) &&   \
     !defined(OS_LIBMODE_D)  && !defined(OS_LIBMODE_DP) &&   \
     !defined(OS_LIBMODE_DT))
#include "OS_Config.h"
#endif

#define OS_VERSION_GENERIC (36004)      /*   Generic version 3.60d  */

#ifndef   OS_PORT_REVISION
  #define OS_PORT_REVISION 0
#endif

#define OS_VERSION OS_VERSION_GENERIC + (OS_PORT_REVISION * 25)

/*********************************************************************
*
*       Defines for library types
*
**********************************************************************
*/

/* If library type is not selected yet (on project level,
   for example), then select DP by default
*/
#if (!defined(OS_LIBMODE_XR) && !defined(OS_LIBMODE_R)  &&   \
     !defined(OS_LIBMODE_S)  && !defined(OS_LIBMODE_SP) &&   \
     !defined(OS_LIBMODE_D)  && !defined(OS_LIBMODE_DP) &&   \
     !defined(OS_LIBMODE_DT))
#define OS_LIBMODE_DP
#endif

#if defined(OS_LIBMODE_XR)                                   // Extremely small release - without Round robin support
  #define OS_CHECKSTACK       0
  #define OS_DEBUG            0
  #define OS_PROFILE          0
  #define OS_SUPPORT_TICKSTEP 0
  #define OS_TRACE            0
  #define OS_RR_SUPPORTED     0
  #define OS_TRACKNAME        0
  #define OS_SUPPORT_SAVE_RESTORE_HOOK 0
  #define OS_CreateTask   OS_CreateTask_XR
  #define OS_CreateTaskEx OS_CreateTaskEx_XR
  #define OS_LIBMODE "XR"
#elif defined(OS_LIBMODE_R)                                  // Release build
  #define OS_CHECKSTACK       0
  #define OS_DEBUG            0
  #define OS_PROFILE          0
  #define OS_SUPPORT_TICKSTEP 0
  #define OS_TRACE            0
  #define OS_CreateTask   OS_CreateTask_R
  #define OS_CreateTaskEx OS_CreateTaskEx_R
  #define OS_LIBMODE "R"
#elif defined(OS_LIBMODE_S)                                  // Release build with stack check
  #define OS_CHECKSTACK       1
  #define OS_DEBUG            0
  #define OS_PROFILE          0
  #define OS_SUPPORT_TICKSTEP 0
  #define OS_TRACE            0
  #define OS_CreateTask   OS_CreateTask_S
  #define OS_CreateTaskEx OS_CreateTaskEx_S
  #define OS_LIBMODE "S"
#elif defined(OS_LIBMODE_SP)                                 // Release build with stack check and profiling
  #define OS_CHECKSTACK       1
  #define OS_DEBUG            0
  #define OS_PROFILE          1
  #define OS_SUPPORT_TICKSTEP 1
  #define OS_TRACE            0
  #define OS_CreateTask   OS_CreateTask_SP
  #define OS_CreateTaskEx OS_CreateTaskEx_SP
  #define OS_LIBMODE "SP"
#elif defined(OS_LIBMODE_D)                                  // Debug build
  #define OS_CHECKSTACK       1
  #define OS_DEBUG            1
  #define OS_PROFILE          0
  #define OS_SUPPORT_TICKSTEP 1
  #define OS_TRACE            0
  #define OS_CreateTask   OS_CreateTask_D
  #define OS_CreateTaskEx OS_CreateTaskEx_D
  #define OS_LIBMODE "D"
#elif defined(OS_LIBMODE_DP)                                  // Debug build with profiling
  #define OS_CHECKSTACK       1
  #define OS_PROFILE          1
  #define OS_DEBUG            1
  #define OS_SUPPORT_TICKSTEP 1
  #define OS_TRACE            0
  #define OS_CreateTask   OS_CreateTask_DP
  #define OS_CreateTaskEx OS_CreateTaskEx_DP
  #define OS_LIBMODE "DP"
#elif defined(OS_LIBMODE_DT)                                  // Debug build with profiling and trace
  #define OS_CHECKSTACK       1
  #define OS_DEBUG            1
  #define OS_PROFILE          1
  #define OS_SUPPORT_TICKSTEP 1
  #define OS_TRACE            1
  #define OS_CreateTask   OS_CreateTask_DT
  #define OS_CreateTaskEx OS_CreateTaskEx_DT
  #define OS_LIBMODE "DT"
#else
  #error Please define library type used !
#endif

/*********************************************************************
*
*       OS compile time switches
*
**********************************************************************

These compile time switches can be modified when recompiling
the library. Usually, the values are in OSCHIP.H, which is then
merged with OS_RAW.H to form RTOS.H.
If the values are not defined in OSCHIP.H, the default values
below are used.
*/

/* Make it possible to place const data in RAM via
   define and therefore via command line. This is required
   for some smaller CPUs in small memory models
   It is defined to be "const" by default, but can be defined to nothing
   by simply adding a -DOS_CONST_DATA on the commandline
*/

#ifndef   OS_CONST_DATA
  #define OS_CONST_DATA const  /* Default      */
#else
  #undef  OS_CONST_DATA
  #define OS_CONST_DATA        /* define blank */
#endif

#ifndef   OS_INTERWORK
  #define OS_INTERWORK
#endif

#ifndef   OS_SCHEDULER_ACTIVATED_BY_EXCEPTION
  #define OS_SCHEDULER_ACTIVATED_BY_EXCEPTION   (0)
#endif

#ifndef   OS_STACK_ADR
  #define OS_STACK_ADR OS_U32
#endif

#ifndef   OS_MODEL
  #define OS_MODEL ""
#endif

#ifndef   OS_MEMSET
  #define OS_MEMSET(a,v,s) memset(a,v,s)
#endif

#ifndef   OS_MEMCPY
  #define OS_MEMCPY(dest,src,cnt) memcpy(dest,src,cnt)
#endif

#ifndef   OS_STRLEN
  #define OS_STRLEN(s) strlen(s)
#endif

#ifndef   OS_DUMMY_STATEMENT
  #define OS_DUMMY_STATEMENT()
#endif

#ifndef   OS_USEPARA
  #define OS_USEPARA(para) para=para
#endif

#ifndef   OS_SUPPORT_TICKSTEP
  #define OS_SUPPORT_TICKSTEP 0
#endif

#ifndef   OS_TRACKNAME
  #define OS_TRACKNAME (1)
#endif

#ifndef   OS_TRACE
  #define OS_TRACE (0)
#endif

#ifndef   OS_SUPPORT_SAVE_RESTORE_HOOK
  #define OS_SUPPORT_SAVE_RESTORE_HOOK  (1)
#endif

#ifndef   OS_RR_SUPPORTED
  #define OS_RR_SUPPORTED (1)
#endif

#ifndef   OS_STACK_AT_BOTTOM
  #define OS_STACK_AT_BOTTOM (0)
#endif

/*  Settings for NON-ANSI compiler syntax
    The default behaviour complies with IAR.
*/
#ifndef   OS_COMPILER_LOCATION_LEFT
  #define OS_COMPILER_LOCATION_LEFT 1  /* (req. for IAR) */
#endif

#ifndef   OS_COMPILER_STORAGE_MODIFIER_LEFT
  #define OS_COMPILER_STORAGE_MODIFIER_LEFT 1  /* default for all except KEIL */
#endif

#define OS_LINK_MAILBOXES (OS_DEBUG)

#ifndef   OS_CHECK
  #define OS_CHECK 0
#endif

#ifndef   OS_ALIGN_PTR
  #define OS_ALIGN_PTR (1)
#endif

#ifndef   OS_ALIGN_INT
  #define OS_ALIGN_INT (1)
#endif

#ifndef   OS_PTR_TO_VALUE
  #define OS_PTR_TO_VALUE(p) (p)
#endif

#ifndef   OS_IDLE
  #define OS_IDLE() OS_Idle()
#endif

#ifndef   OS_PTR_OP_IS_ATOMIC
  #define OS_PTR_OP_IS_ATOMIC   (0)         // Helps to minimize code size and execution time. Some code is not required if setting pointers is an atomic operation (32 bit CPUs or 16 bit CPUs in near model)
#endif

#ifndef   OS_SUSPEND_TASK_ON_TERMINATE      // Sets the task state of a terminated task to "suspended". Primarily used in the OS simulation, because the windows scheduler might re-activate a suspended task
  #define OS_SUSPEND_TASK_ON_TERMINATE (0)
#endif

#ifndef   OS_INIT_EXPLICITLY
  #define OS_INIT_EXPLICITLY  (0)           // If enabled, OS_InitKern() initializes Non-Zero globals. Required only for faulty compiler (or startup-code) which do not perform proper init of globals during startup.
#endif

#ifndef   OS_TASK_LIST_HAS_PPREV
  #define OS_TASK_LIST_HAS_PPREV   OS_RR_SUPPORTED
#else
  #if (OS_TASK_LIST_HAS_PPREV == 0) && OS_RR_SUPPORTED
    #error  "Invalid combination of config switches"
  #endif
#endif

#ifndef   OS_SUPPORT_CALL_ISR
  #define OS_SUPPORT_CALL_ISR (1)
#endif

#ifndef   OS_PREPARE_STACKPOINTER
  #define OS_PREPARE_STACKPOINTER()
#endif

#ifndef   OS_SUPPORT_POWER
  #define OS_SUPPORT_POWER (1)
#endif

#ifndef   OS_POWER_NUM_COUNTERS
  #define OS_POWER_NUM_COUNTERS (5)
#endif

/*********************************************************************
*
*       Check Compile time switches
*
**********************************************************************
*/

#ifndef OS_SIZEOF_INT
  #error "Please define OS_SIZEOF_INT (OSChip.h)"
#endif
#ifndef OS_BIG_ENDIAN
  #error "Please define OS_BIG_ENDIAN (OSChip.h)"
#endif

#if (OS_STACK_AT_BOTTOM != 0) && (OS_STACK_AT_BOTTOM != 1)
  /*
  *  Only 0 or 1 is allowed, because OS_STACK_AT_BOTTOM is used for calculations!
  */
  #error "OS_STACK_AT_BOTTOM has to be defined to 0 or 1"
#endif

/*********************************************************************
*
*       Basic type defines
*
**********************************************************************
*/

#ifndef   OS_I8
  #define OS_I8 signed char
#endif

#ifndef   OS_U8
  #define OS_U8 unsigned char
#endif

#ifndef   OS_I16
  #define OS_I16 signed short
#endif

#ifndef   OS_U16
  #define OS_U16 unsigned short
#endif

#ifndef   OS_I32
  #define OS_I32 long
#endif

#ifndef   OS_U32
  #define OS_U32 unsigned OS_I32
#endif

/* Defines a true integer. This type is guaranteed
   a) to have at least 8 bits,
   b) to compile and execute best on the target CPU
   It will normally be the same as an int, but on most
   8-bit CPUs it will be replaced by a character because
   the CPU can deal with 8 bits more efficient than with
   16 bit integers.
   Use with care !
*/
#ifndef   OS_INT
  #define OS_INT       int
#endif

#ifndef   OS_UINT
  #define OS_UINT      unsigned OS_INT
#endif

#ifndef   OS_TIME
  #define OS_TIME      int
#endif


/*********************************************************************
*
*       Error codes
*
**********************************************************************
*/

/* User 0..99  ***********************************/

/* Port 100..119 *********************************/
#define OS_ERR_ISR_INDEX                      (100)
#define OS_ERR_ISR_VECTOR                     (101)
#define OS_ERR_ISR_PRIO                       (102)

/* OS generic ************************************/
/* stack overflow or invalid stack */
#define OS_ERR_STACK                          (120)

/* Counting semaphore overflow */
#define OS_ERR_CSEMA_OVERFLOW                 (121)

/* Power management module */
#define OS_ERR_POWER_OVER                     (122)
#define OS_ERR_POWER_UNDER                    (123)
#define OS_ERR_POWER_INDEX                    (124)


/* invalid or non-initialized data structures */
#define OS_ERR_INV_TASK                       (128)
#define OS_ERR_INV_TIMER                      (129)
#define OS_ERR_INV_MAILBOX                    (130)
#define OS_ERR_INV_CSEMA                      (132)
#define OS_ERR_INV_RSEMA                      (133)

/* Using GetMail1 or PutMail1 or GetMailCond1 or PutMailCond1 on
   a non-1 byte mailbox  */
#define OS_ERR_MAILBOX_NOT1                   (135)

/* Waitable objects deleted with waiting tasks or occupied by task */
#define OS_ERR_MAILBOX_DELETE                 (136)
#define OS_ERR_CSEMA_DELETE                   (137)
#define OS_ERR_RSEMA_DELETE                   (138)

/* internal errors, please contact SEGGER Microcontrollersysteme */
#define OS_ERR_MAILBOX_NOT_IN_LIST            (140)
#define OS_ERR_TASKLIST_CORRUPT               (142)

/* not matching routine calls or macro usage */
#define OS_ERR_UNUSE_BEFORE_USE               (150)
#define OS_ERR_LEAVEREGION_BEFORE_ENTERREGION (151)
#define OS_ERR_LEAVEINT                       (152)
#define OS_ERR_DICNT                          (153)
#define OS_ERR_INTERRUPT_DISABLED             (154)
#define OS_ERR_TASK_ENDS_WITHOUT_TERMINATE    (155)
#define OS_ERR_RESOURCE_OWNER                 (156)

#define OS_ERR_ILLEGAL_IN_ISR                 (160)  /* not a legal system call during interrupt */
#define OS_ERR_ILLEGAL_IN_TIMER               (161)  /* not a legal system call during timer */
#define OS_ERR_ILLEGAL_OUT_ISR                (162)  /* not a legal system call outside interrupt */
#define OS_ERR_NOT_IN_ISR                     (163)  /* OS_EnterInterrupt() has been called, but CPU is not in ISR state */
#define OS_ERR_IN_ISR                         (164)  /* OS_EnterInterrupt() has not been called, but CPU is in ISR state */

#define OS_ERR_INIT_NOT_CALLED                (165)  /* OS_InitKern() was not called */

/* Double used data structures */
#define OS_ERR_2USE_TASK                      (170)
#define OS_ERR_2USE_TIMER                     (171)
#define OS_ERR_2USE_MAILBOX                   (172)
#define OS_ERR_2USE_BSEMA                     (173)
#define OS_ERR_2USE_CSEMA                     (174)
#define OS_ERR_2USE_RSEMA                     (175)
#define OS_ERR_2USE_MEMF                      (176)

/* Communication errors (OSCOM) */
#define OS_ERR_NESTED_RX_INT                  (180)

/* Fixed block memory pool  */
#define OS_ERR_MEMF_INV                       (190)
#define OS_ERR_MEMF_INV_PTR                   (191)
#define OS_ERR_MEMF_PTR_FREE                  (192)
#define OS_ERR_MEMF_RELEASE                   (193)
#define OS_ERR_POOLADDR                       (194)
#define OS_ERR_BLOCKSIZE                      (195)

/* Task suspend / resume errors */
#define OS_ERR_SUSPEND_TOO_OFTEN              (200)
#define OS_ERR_RESUME_BEFORE_SUSPEND          (201)

/* Other task related errors */
#define OS_ERR_TASK_PRIORITY                  (202)

/* Event object */
#define OS_ERR_EVENT_INVALID                  (210)
#define OS_ERR_2USE_EVENTOBJ                  (211)
#define OS_ERR_EVENT_DELETE                   (212)

/* Waitlist (checked build) */
#define OS_ERR_WAITLIST_RING                  (220)
#define OS_ERR_WAITLIST_PREV                  (221)
#define OS_ERR_WAITLIST_NEXT                  (222)

/* Other potential problems discovered in checked build */
#define OS_ERR_NOT_IN_REGION                  (225)

/* Cache related */
#define OS_ERR_NON_ALIGNED_INVALIDATE         (230)

/* OS special build, or internal */
#define OS_ERR_TRIAL_LIMIT                    (254)

/*********************************************************************
*
*       Trace identifier
*
**********************************************************************

Identifier from 0 to 99 are reserved for the OS
Even when not all of those are currently used,
they may be defined in the future

*/

#define OS_TRACE_ID_DEACTIVATE      (1)
#define OS_TRACE_ID_ACTIVATE        (2)
#define OS_TRACE_ID_TIMERCALLBACK   (3)

/* Task group */
#define OS_TRACE_ID_DELAY           (10)
#define OS_TRACE_ID_DELAYUNTIL      (11)
#define OS_TRACE_ID_SETPRIORITY     (12)
#define OS_TRACE_ID_WAKETASK        (13)
#define OS_TRACE_ID_CREATETASK      (14)
#define OS_TRACE_ID_TERMINATETASK   (15)
#define OS_TRACE_ID_SUSPENDTASK     (16)
#define OS_TRACE_ID_RESUMETASK      (17)
#define OS_TRACE_ID_CREATETASK_EX   (18)
#define OS_TRACE_ID_YIELD           (19)

/* Event group */
#define OS_TRACE_ID_WAITEVENT       (20)
#define OS_TRACE_ID_WAITEVENT_TIMED (21)
#define OS_TRACE_ID_SIGNALEVENT     (22)
#define OS_TRACE_ID_CLEAREVENTS     (23)

/* Mailbox group  */
#define OS_TRACE_ID_CREATEMB        (30)
#define OS_TRACE_ID_CLEARMB         (31)
#define OS_TRACE_ID_DELETEMB        (32)
#define OS_TRACE_ID_PUTMAIL         (33)
#define OS_TRACE_ID_GETMAIL         (34)
#define OS_TRACE_ID_PUTMAILCOND     (35)
#define OS_TRACE_ID_GETMAILCOND     (36)
#define OS_TRACE_ID_PUTMAIL_TIMED   (37)
#define OS_TRACE_ID_GETMAIL_TIMED   (38)
#define OS_TRACE_ID_WAITMAIL        (39)

#define OS_TRACE_ID_PUTMAIL1        (40)
#define OS_TRACE_ID_GETMAIL1        (41)
#define OS_TRACE_ID_PUTMAILCOND1    (42)
#define OS_TRACE_ID_GETMAILCOND1    (43)
#define OS_TRACE_ID_PUTMAIL_TIMED1  (44)
#define OS_TRACE_ID_GETMAIL_TIMED1  (45)

#define OS_TRACE_ID_PUTMAIL_F       (46)
#define OS_TRACE_ID_PUTMAIL_F1      (47)
#define OS_TRACE_ID_PUTMAIL_FCOND   (48)
#define OS_TRACE_ID_PUTMAIL_FCOND1  (49)

/* Resource group */
#define OS_TRACE_ID_CREATERSEMA     (50)
#define OS_TRACE_ID_USE             (51)
#define OS_TRACE_ID_UNUSE           (52)
#define OS_TRACE_ID_REQUEST         (53)
#define OS_TRACE_ID_GETSEMAVALUE    (54)
#define OS_TRACE_ID_DELETE_RSEMA    (55)

/* Counting Semaphore group */
#define OS_TRACE_ID_CREATECSEMA     (60)
#define OS_TRACE_ID_DELETECSEMA     (61)
#define OS_TRACE_ID_SIGNALCSEMA     (62)
#define OS_TRACE_ID_WAITCSEMA       (63)
#define OS_TRACE_ID_WAITCSEMATIMED  (64)
#define OS_TRACE_ID_SIGNALCSEMA_MAX (65)
#define OS_TRACE_ID_SET_CSEMAVALUE  (66)
#define OS_TRACE_ID_CSEMAREQUEST    (67)

/* Timer group    */
#define OS_TRACE_ID_CREATETIMER     (70)
#define OS_TRACE_ID_DELETETIMER     (71)
#define OS_TRACE_ID_STARTTIMER      (72)
#define OS_TRACE_ID_STOPTIMER       (73)
#define OS_TRACE_ID_RETRIGGERTIMER  (74)
#define OS_TRACE_ID_SETTIMERPERIOD  (75)
#define OS_TRACE_ID_CREATETIMER_EX  (76)

/* Heap type memory management  */
#define OS_TRACE_ID_MALLOC          (80)
#define OS_TRACE_ID_FREE            (81)
#define OS_TRACE_ID_REALLOC         (82)

/* Fixed block type memory management  */
#define OS_TRACE_ID_MEMF_CREATE     (90)
#define OS_TRACE_ID_MEMF_DELETE     (91)
#define OS_TRACE_ID_MEMF_ALLOC      (92)


/*********************************************************************
*
*       Assertions
*
**********************************************************************

  Assertions are used to generate code in the debug version
  of the OS in order catch programming faults like
  bad pointers or uninitialized data structures
*/

#if OS_DEBUG
  #define OS_ASSERT(Exp, ErrCode) { if (!(Exp)) OS_Error(ErrCode); }
#else
  #define OS_ASSERT(Exp, ErrCode)
#endif

#define OS_ASSERT_INT()           OS_ASSERT((OS_InInt != 0),          OS_ERR_ILLEGAL_OUT_ISR)
#define OS_ASSERT_NOINT()         OS_ASSERT((OS_InInt == 0),          OS_ERR_ILLEGAL_IN_ISR)
#define OS_ASSERT_NOTIMER()       OS_ASSERT((OS_InTimer == 0),        OS_ERR_ILLEGAL_IN_TIMER)
#define OS_ASSERT_DICnt()         OS_ASSERT(((OS_DICnt & 0xf0) == 0), OS_ERR_DICNT)
#define OS_ASSERT_INIT_CALLED()   OS_ASSERT((OS_InitCalled != 0),     OS_ERR_INIT_NOT_CALLED)

/*********************************************************************
*
*       Memory attributes
*
**********************************************************************
*/

#ifndef OS_STACKPTR
  #define OS_STACKPTR
#endif

#ifndef OS_SADDR
  #ifdef SADDR
    #define OS_SADDR SADDR
  #else
    #define OS_SADDR
  #endif
#endif

/* pointer modifier for data items */
#ifndef OS_DATAPTR
  #define OS_DATAPTR
#endif

#ifndef OS_RSEMAPTR
  #define OS_RSEMAPTR
#endif

#ifndef   OS_CSEMAPTR
  #define OS_CSEMAPTR
#endif

#ifndef   OS_MBPTR
  #define OS_MBPTR
#endif

#ifndef   OS_TCBPTR
  #define OS_TCBPTR
#endif

#ifndef   OS_TIMERPTR
  #define OS_TIMERPTR
#endif

#ifdef __cplusplus
  extern "C" {
#endif

/*********************************************************************
*
*       Data structures
*
**********************************************************************
*/

typedef struct OS_TASK         OS_TASK;
typedef struct OS_WAIT_LIST    OS_WAIT_LIST;
typedef struct OS_WAIT_OBJ     OS_WAIT_OBJ;
typedef struct OS_WAIT_OBJ_EX  OS_WAIT_OBJ_EX;
typedef struct OS_REGS         OS_REGS;

typedef void voidRoutine(void);
typedef void OS_RX_CALLBACK(OS_U8 Data);
typedef void OS_TIMERROUTINE(void);
typedef void OS_TIMER_EX_ROUTINE(void *);
typedef void OS_ON_TERMINATE_FUNC(OS_TASK *);

typedef void OS_TICK_HOOK_ROUTINE(void);

/**********************************************************************
*
*       OS_WAIT_OBJ
*       OS_WAIT_LIST
*       OS_WAIT_OBJ_EX
*/
struct OS_WAIT_OBJ {
  OS_WAIT_LIST * pWaitList;
};

struct OS_WAIT_OBJ_EX {
  OS_WAIT_OBJ WaitObj;
  int v;
};

struct OS_WAIT_LIST {
  OS_WAIT_LIST * pNext;    /* Needs to be first element ! */
  OS_WAIT_LIST * pPrev;
  OS_WAIT_OBJ  * pWaitObj;
  OS_TASK      * pTask;
};


/**********************************************************************
*
*       OS_EXTEND_TASK_CONTEXT
*
*  This structure is used to define a save and restore function for
*  extension of the task context.
*  A pointer to this structure is part of the task control block
*  It is initialized by OS_ExtendTaskContext();
*/
typedef struct OS_EXTEND_TASK_CONTEXT {
  void (*pfSave)   (      void * pStack);
  void (*pfRestore)(const void * pStack);
} OS_EXTEND_TASK_CONTEXT;


/**********************************************************************
*
*       OS_TASK
*
*  This structure (referred to as "task control block" or TCB) holds all relevant information
*  about a single task. Note that some elements are optional, depending on the compile time
*  options, especially the type of build
*/
struct OS_TASK {
  //
  // Elements required for all builds
  //
  // Start of assembly relevant section. Do not move these elements
  OS_TASK * pNext;                        // Points to the TCB of the next task in the list (with equal or lower priority). Needs to be first element !
  OS_REGS OS_STACKPTR * pStack;           // Typically contains the stack pointer if the task is suspended.                 Needs to be second element !
  // End of assembly relevant section
  OS_WAIT_LIST * pWaitList;               // Points to a waitable object if task is suspended.
  OS_TIME        Timeout;
  OS_U8          Priority;
  OS_U8          Stat;
  OS_U8          Events;                  // Event storage
  OS_U8          EventMask;               // Event mask
  //
  // PPrev is required only in builds with doubly-linked task lists
  //
  #if OS_TASK_LIST_HAS_PPREV
    OS_TASK      * pPrev;                   //
  #endif
  //
  // Elements required with "Track-name" functionality only. Typically available in all builds, but can be disabled at compile time
  //
  #if OS_TRACKNAME
    const char * Name;
  #endif
  //
  // Elements required with "Stack-check" functionality only. Available in stack-check and debug builds.
  //
  #if OS_CHECKSTACK
    OS_UINT  StackSize;            // Stack size in bytes. Not required for functionality, just for analysis
    OS_U8 OS_STACKPTR* pStackBot;  // First byte of stack. Not required for functionality, just for analysis
  #endif
  //
  // Elements required with profiling or debug builds
  //
  #if (OS_PROFILE || OS_DEBUG)
    OS_U32 NumActivations;         // Counts how many times task has been activated
    OS_U32 NumPreemptions;         // Counts how many times task has been preempted
  #endif
  //
  // Elements required with profiling builds
  //
  #if OS_PROFILE
    OS_U32 ExecTotal;              // Time spent executing
    OS_U32 ExecLast;               // Time spent executing (Reference)
    OS_U32 Load;                   // Profiling builds only:
  #endif
  //
  // Elements required with Round-robin functionality only. Typically available in all builds, but can be disabled at compile time
  //
  #if OS_RR_SUPPORTED
    OS_U8  TimeSliceRem;
    OS_U8  TimeSliceReload;
  #endif
  //
  // Optional Save & Restore hook support (usually only for bigger CPUs)
  //
  #if OS_SUPPORT_SAVE_RESTORE_HOOK
    const OS_EXTEND_TASK_CONTEXT * pExtendContext;
  #endif
  //
  // Elements required with debug builds
  //
  #if OS_DEBUG
    char Id;                       // Debug builds only: Id of this control block.
  #endif
  //
  // Allow port specific extension to the task control block. Not used in most ports
  //
  #ifdef OS_TCB_CPU_EX
    OS_TCB_CPU_EX
  #endif
};

/**********************************************************************
*
*       OS_TIMER
*/
typedef struct OS_timer OS_TIMER;
struct OS_timer {
  OS_TIMER * pNext;
  voidRoutine* Hook;
  OS_TIME Time;
  OS_TIME Period;
  char    Active;
#if OS_DEBUG
  char Id;
#endif
};

/**********************************************************************
*
*       OS_TIMER_EX
*/
typedef struct {
  OS_TIMER Timer;
  OS_TIMER_EX_ROUTINE * pfUser;
  void * pData;
} OS_TIMER_EX;

/**********************************************************************
*
*       OS_TICK_HOOK
*/
typedef struct OS_TICK_HOOK OS_TICK_HOOK;
struct OS_TICK_HOOK {
  OS_TICK_HOOK*          pNext;
  OS_TICK_HOOK_ROUTINE * pfUser;
};

/**********************************************************************
*
*       OS_RSEMA
*/
typedef struct OS_RSEMA OS_RSEMA;
struct OS_RSEMA {
  OS_WAIT_OBJ WaitObj;
  OS_TASK * pTask;                /* Owner */
  OS_U8 UseCnt;
  OS_RSEMA * pNext;
#if OS_DEBUG
  char Id;
#endif
};

/**********************************************************************
*
*       OS_CSEMA
*/
typedef struct OS_CSEMA OS_CSEMA;
struct OS_CSEMA {
  OS_WAIT_OBJ WaitObj;
  OS_UINT Cnt;
#if OS_DEBUG
  OS_CSEMA * pNext;
  char Id;
#endif
};

/**********************************************************************
*
*       OS_MAILBOX
*/
typedef struct OS_MAILBOX OS_MAILBOX;
struct OS_MAILBOX {
  OS_WAIT_OBJ WaitObj;
#if OS_LINK_MAILBOXES
  OS_MAILBOX * pNext;
#endif
  char *pData;
  OS_UINT nofMsg;
  OS_UINT maxMsg;
  OS_UINT iRd;
  OS_U8  sizeofMsg;
#if OS_DEBUG
  char Id;
#endif
};

/**********************************************************************
*
*       OS_Q
*/
typedef struct OS_Q OS_Q;
struct OS_Q {
  OS_WAIT_OBJ WaitObj;
  OS_Q*    pNext;          /* ptr to next queue (for debugging / monitoring) */
  OS_U8*   pData;
  OS_UINT  Size;
  OS_UINT  MsgCnt;
  OS_UINT  offFirst;
  OS_UINT  offLast;
#if OS_DEBUG
  char Id;
#endif
};

/**********************************************************************
*
*       OS_MEMF
*/
#ifndef   OS_MEMF_MAX_ITEMS
  #define OS_MEMF_MAX_ITEMS 20
#endif

#define OS_MEMF_SIZEOF_BLOCKCONTROL 0  /* sizeof(int) in future version for debugging */

typedef struct OS_MEMF OS_MEMF;
struct OS_MEMF {
  OS_WAIT_OBJ WaitObj;
  OS_MEMF* pNext;          /* ptr to next memory pool */
  void*    pPool;
  OS_U16   NumBlocks;
  OS_U16   BlockSize;
  OS_U16   NumFreeBlocks;
  OS_U16   MaxUsed;
  void*    pFree;
  #if OS_DEBUG
    int  aiPurpose[OS_MEMF_MAX_ITEMS];
    char Id;
  #endif
};

/**********************************************************************
*
*       OS_EVENT
*/
typedef struct  OS_EVENT OS_EVENT;

struct OS_EVENT {
  OS_WAIT_OBJ WaitObj;
  OS_U8       Signaled;
#if OS_DEBUG
  char Id;
#endif
};

/**********************************************************************
*
*       OS_TRACE_ENTRY
*/
typedef struct {
  OS_U32  Time;
  void    *pCurrentTask;
  void    *p;
  OS_U32  v;
  OS_U8   iRout;
} OS_TRACE_ENTRY;


/*********************************************************************
*
*       Globals
*
**********************************************************************
*/

/*
    Handle DEFinition (storage is actually allocted) versus DEClaration
    (reference) of RTOS variables depending upon who includes this header file.
*/
#ifdef __OSGLOBAL_C__
  #define OS_EXTERN        /* Declare variables if included by RTOSKERN.C */
  #define OS_EXTERN_INIT(Var, Val) Var=Val
#else
  #define OS_EXTERN extern /* Define variables if included by anyone else */
  #define OS_EXTERN_INIT(Var, Val) Var
#endif

/*****  Mark start of memory pragma area ****************************/

/* Some compilers can not deal with memory attributes and need pragmas */
#if defined(__ghs_zda)
  #pragma ghs startzda
#endif

/********************************************************************/

typedef union {
  int Dummy;            // Make sure a full integer (32 bit on 32 bit CPUs) is used.
  struct {
    OS_U8 Region;
    OS_U8 DI;
  } Cnt;
} OS_COUNTERS;


#if OS_COMPILER_STORAGE_MODIFIER_LEFT  /* default */
  OS_EXTERN OS_SADDR  volatile OS_I32 OS_Time;
  OS_EXTERN OS_SADDR  OS_TIME         OS_EXTERN_INIT(OS_TimeDex, 16384);
  OS_EXTERN OS_SADDR  OS_COUNTERS OS_Counters;

  OS_EXTERN OS_SADDR  OS_U8  OS_EXTERN_INIT(OS_IntMSInc, 1);
  OS_EXTERN OS_SADDR  OS_U8  OS_Pending;
  OS_EXTERN OS_SADDR  volatile OS_U8  OS_Status;

  #if OS_RR_SUPPORTED
    OS_EXTERN OS_SADDR  OS_U8  OS_TimeSlice;
    OS_EXTERN OS_SADDR  OS_U8  OS_TimeSliceAtStart;
  #endif
  #if OS_SUPPORT_TICKSTEP
    OS_EXTERN OS_SADDR  volatile OS_U8   OS_TickStep;
    OS_EXTERN OS_SADDR  volatile int     OS_TickStepTime;
  #endif
  OS_EXTERN OS_SADDR        OS_UINT OS_TicksPerMS;
  OS_EXTERN OS_SADDR        int     OS_IntTicksInc;
  #if OS_PROFILE
    OS_EXTERN OS_SADDR OS_U32 OS_TS_ExecStart;
    OS_EXTERN OS_SADDR OS_U8  ProfilingOn;
  #endif
  #if OS_DEBUG
    OS_EXTERN OS_SADDR OS_U8 OS_InInt;
    OS_EXTERN OS_SADDR OS_U8 OS_InTimer;
    OS_EXTERN OS_SADDR OS_U8 OS_InitCalled;
  #endif

  #if OS_SUPPORT_POWER
    OS_EXTERN OS_SADDR OS_U8 OS_POWER_Levels[OS_POWER_NUM_COUNTERS];
  #endif

  /*** Pointers ***
    Unfortunately there is no real standard on how to define/declare
    pointers properly with extended memory attributes. There are
    currently 2 different standards, which we both support.
  */
  #if OS_COMPILER_LOCATION_LEFT
    OS_EXTERN OS_SADDR  OS_TASK      * OS_pTask;             /* linked list of all Tasks */
    OS_EXTERN OS_SADDR  OS_TASK      * OS_pCurrentTask;      /* pointer to current Task */
    OS_EXTERN OS_SADDR  OS_TASK volatile * volatile OS_pActiveTask;
    OS_EXTERN OS_SADDR  OS_TIMER     * OS_pTimer;            /* linked list of all active Timers */
    OS_EXTERN OS_SADDR  OS_TIMER     * OS_pCurrentTimer;     /* Actual expired timer which called callback */
    OS_EXTERN OS_SADDR OS_RSEMA      * OS_pRSema;
    #if OS_LINK_MAILBOXES
      OS_EXTERN OS_SADDR OS_MAILBOX  * OS_pMailbox;
    #endif
    #if OS_DEBUG
      OS_EXTERN OS_SADDR OS_CSEMA    * OS_pCSema;
    #endif
    OS_EXTERN   OS_SADDR OS_MEMF      * OS_pMEMF;            /* linked list of all fixed size memory pools */
    OS_EXTERN   OS_SADDR OS_TICK_HOOK * OS_pTickHook;        /* linked list of all tick hook functions */
  #else
    OS_EXTERN OS_TASK             * OS_SADDR OS_pTask;          /* linked list of all Tasks */
    OS_EXTERN OS_TASK             * OS_SADDR OS_pCurrentTask;   /* pointer to current Task */
    OS_EXTERN OS_TASK    volatile * OS_SADDR volatile OS_pActiveTask;
    OS_EXTERN OS_TIMER            * OS_SADDR OS_pTimer;         /* linked list of all active Timers */
    OS_EXTERN OS_TIMER            * OS_SADDR OS_pCurrentTimer;  /* Actual expired timer which called callback */
    OS_EXTERN OS_RSEMA            * OS_SADDR OS_pRSema;
    #if OS_LINK_MAILBOXES
      OS_EXTERN OS_MAILBOX        * OS_SADDR OS_pMailbox;
    #endif

    #if OS_DEBUG
      OS_EXTERN  OS_CSEMA         * OS_SADDR OS_pCSema;
    #endif
    OS_EXTERN OS_MEMF             * OS_SADDR OS_pMEMF;          /* linked list of all fixed size memory pools */
    OS_EXTERN OS_TICK_HOOK        * OS_SADDR OS_pTickHook;      /* linked list of all tick hook functions */
  #endif

#else  /*  OS_COMPILER_STORAGE_MODIFIER_LEFT == 0, needed for Keil 166 */
  OS_EXTERN volatile OS_I32 OS_SADDR OS_Time;
  OS_EXTERN OS_TIME         OS_SADDR OS_EXTERN_INIT(OS_TimeDex, 16384);
  OS_EXTERN OS_COUNTERS OS_SADDR OS_Counters;

  OS_EXTERN OS_U8 OS_SADDR OS_EXTERN_INIT(OS_IntMSInc, 1);
  OS_EXTERN OS_U8 OS_SADDR OS_Pending;
  OS_EXTERN volatile OS_U8 OS_SADDR OS_Status;
  #if OS_RR_SUPPORTED
    OS_EXTERN OS_U8 OS_SADDR OS_TimeSlice;
    OS_EXTERN OS_U8 OS_SADDR OS_TimeSliceAtStart;
  #endif
  #if OS_SUPPORT_TICKSTEP
    OS_EXTERN volatile OS_U8 OS_SADDR OS_TickStep;
    OS_EXTERN volatile int   OS_SADDR OS_TickStepTime;
  #endif
  OS_EXTERN OS_UINT OS_SADDR OS_TicksPerMS;
  OS_EXTERN int     OS_SADDR OS_IntTicksInc;
  #if OS_PROFILE
    OS_EXTERN OS_U32 OS_SADDR OS_TS_ExecStart;
    OS_EXTERN OS_U8  OS_SADDR ProfilingOn;
  #endif
  #if OS_DEBUG
    OS_EXTERN OS_U8 OS_SADDR OS_InInt;
    OS_EXTERN OS_U8 OS_SADDR OS_InTimer;
    OS_EXTERN OS_U8 OS_SADDR OS_InitCalled;
  #endif

  #if OS_SUPPORT_POWER
    OS_EXTERN OS_U8 OS_SADDR OS_POWER_Levels[OS_POWER_NUM_COUNTERS];
  #endif

  /*** Pointers ***
    Unfortunately there is no real standard on how to define/declare
    pointers properly with extended memory attributes. There are
    currently 2 different standards, which we both support.
  */
  #if OS_COMPILER_LOCATION_LEFT
    OS_EXTERN OS_SADDR  OS_TASK      * OS_pTask;             /* linked list of all Tasks */
    OS_EXTERN OS_SADDR  OS_TASK      * OS_pCurrentTask;      /* pointer to current Task */
    OS_EXTERN OS_SADDR  OS_TASK volatile * volatile OS_pActiveTask;
    OS_EXTERN OS_SADDR  OS_TIMER     * OS_pTimer;            /* linked list of all active Timers */
    OS_EXTERN OS_SADDR  OS_TIMER     * OS_pCurrentTimer;     /* Actual expired timer which called callback */
    OS_EXTERN OS_SADDR OS_RSEMA      * OS_pRSema;
    #if OS_LINK_MAILBOXES
      OS_EXTERN OS_SADDR OS_MAILBOX  * OS_pMailbox;
    #endif
    #if OS_DEBUG
      OS_EXTERN OS_SADDR OS_CSEMA    * OS_pCSema;
    #endif
      OS_EXTERN OS_SADDR OS_MEMF      * OS_pMEMF;            /* linked list of all fixed size memory pools */
      OS_EXTERN OS_SADDR OS_TICK_HOOK * OS_pTickHook;        /* linked list of all tick hook functions */

  #else
    OS_EXTERN OS_TASK             * OS_SADDR OS_pTask;          /* linked list of all Tasks */
    OS_EXTERN OS_TASK             * OS_SADDR OS_pCurrentTask;   /* pointer to current Task */
    OS_EXTERN OS_TASK    volatile * volatile OS_SADDR OS_pActiveTask;
    OS_EXTERN OS_TIMER            * OS_SADDR OS_pTimer;         /* linked list of all active Timers */
    OS_EXTERN OS_TIMER            * OS_SADDR OS_pCurrentTimer;  /* Actual expired timer which called callback */
    OS_EXTERN OS_RSEMA            * OS_SADDR OS_pRSema;
    #if OS_LINK_MAILBOXES
      OS_EXTERN OS_MAILBOX        * OS_SADDR OS_pMailbox;
    #endif
    #if OS_DEBUG
      OS_EXTERN OS_CSEMA          * OS_SADDR OS_pCSema;
    #endif

    OS_EXTERN OS_MEMF             * OS_SADDR OS_pMEMF;          /* linked list of all fixed size memory pools */
    OS_EXTERN OS_TICK_HOOK        * OS_SADDR OS_pTickHook;      /* linked list of all tick hook functions */
  #endif

#endif  /*  OS_COMPILER_STORAGE_MODIFIER_LEFT  */

/***** Mark end of memory pragma area *******************************/
#if defined(__ghs_zda)
  #pragma ghs endzda
#endif

/********************************************************************/

#define OS_RegionCnt OS_Counters.Cnt.Region
#define OS_DICnt     OS_Counters.Cnt.DI

/*********************************************************************
*
*       OS_CREATETASK macro
*       OS_CREATETASK_EX macro
*/
#if OS_RR_SUPPORTED
  #define CTPARA_TIMESLICE ,2
#else
  #define CTPARA_TIMESLICE
#endif

#if OS_TRACKNAME
  #define OS_CREATETASK(pTask, Name, Hook, Priority, pStack) \
  OS_CreateTask (pTask,                                      \
                  Name,                                      \
                  Priority,                                  \
                  Hook,                                      \
                  (void OS_STACKPTR*)pStack,                 \
                  sizeof(pStack)                             \
                  CTPARA_TIMESLICE                           \
               )
#else
  #define OS_CREATETASK(pTask, Name, Hook, Priority, pStack) \
  OS_CreateTask (pTask,                                      \
                  Priority,                                  \
                  Hook,                                      \
                  (void OS_STACKPTR*)pStack,                 \
                  sizeof(pStack)                             \
                  CTPARA_TIMESLICE                           \
               )
#endif

#if OS_TRACKNAME
  #define OS_CREATETASK_EX(pTask, Name, Hook, Priority, pStack, pContext) \
  OS_CreateTaskEx  (pTask,                                                \
                    Name,                                                 \
                    Priority,                                             \
                    Hook,                                                 \
                    (void OS_STACKPTR*)pStack,                            \
                    sizeof(pStack)                                        \
                    CTPARA_TIMESLICE,                                     \
                    pContext                                              \
               )
#else
  #define OS_CREATETASK_EX(pTask, Name, Hook, Priority, pStack, pContext) \
  OS_CreateTaskEx  (pTask,                                                \
                    Priority,                                             \
                    Hook,                                                 \
                    (void OS_STACKPTR*)pStack,                            \
                    sizeof(pStack)                                        \
                    CTPARA_TIMESLICE,                                     \
                    pContext                                              \
               )
#endif

/*********************************************************************
*
*       OS_CreateTask
*       OS_CreateTaskEx
*/
#if OS_TRACKNAME
  #define OS_CREATE_TASK_PARA_NAME      const char*Name,
#else
  #define OS_CREATE_TASK_PARA_NAME
#endif

#if OS_RR_SUPPORTED
  #define OS_CREATE_TASK_PARA_TS   ,OS_UINT TimeSlice
#else
  #define OS_CREATE_TASK_PARA_TS
#endif

void OS_CreateTask  ( OS_TASK * pTask,
                      OS_CREATE_TASK_PARA_NAME
                      OS_U8 Priority,
                      void (*pRoutine)(void),
                      void OS_STACKPTR *pStack,
                      OS_UINT StackSize
                      OS_CREATE_TASK_PARA_TS
        );
void OS_CreateTaskEx  ( OS_TASK * pTask,
                        OS_CREATE_TASK_PARA_NAME
                        OS_U8 Priority,
                        void (*pRoutine)(void *),
                        void OS_STACKPTR *pStack,
                        OS_UINT StackSize
                        OS_CREATE_TASK_PARA_TS,
                        void * pContext
        );
#if OS_SUPPORT_SAVE_RESTORE_HOOK
void OS_ExtendTaskContext(const OS_EXTEND_TASK_CONTEXT * pExtendContext);
#endif
/*********************************************************************
*
*       Task related routines
*
**********************************************************************
*/

void  OS_Delay(OS_TIME ms);                /* OSKern.c              */
void  OS_DelayUntil(OS_TIME t);            /* OSKern.c              */
OS_U8 OS_GetSuspendCnt  (OS_TASK* pTask);  /* OS_GetSuspendCnt.c    */
void  OS_GetState       (OS_TASK* pTask);
char  OS_IsTask         (OS_TASK* pTask);  /* OSIsTask.c            */
void  OS_Resume         (OS_TASK* pTask);  /* OS_Suspend.c          */
void  OS_SetTaskName    (OS_TASK * pTask, const char* s);
void  OS_SetPriority    (OS_TASK* pTask, OS_U8 Prio); /* OSSetP.c   */
void  OS_Suspend        (OS_TASK* pTask);  /* OS_Suspend.c          */
void  OS_Terminate      (OS_TASK* pTask);  /* OSTerm.c              */
void  OS_TerminateError (void);            /* OSTermE.c             */
void  OS_WakeTask       (OS_TASK* pTask);  /* OSWake.c              */
void  OS_Yield          (void);            /* OS_Yield              */

#if OS_SUSPEND_TASK_ON_TERMINATE           /* Set task state of a terminated task to "suspended" */
  #define OS_SUSPEND_TERMINATED_TASK(pTask) (pTask->Stat = 0x01)
#else
  #define OS_SUSPEND_TERMINATED_TASK(pTask)
#endif

/*********************************************************************
*
*       Info routines (OSInfo.c)
*
**********************************************************************
*/

const char* OS_GetCPU(void);
const char* OS_GetLibMode(void);
const char* OS_GetModel(void);
const char* OS_GetLibName(void);

OS_UINT OS_GetVersion(void);
#define OS_GetType() OS_GetLibMode()

#define OS_TASKID OS_TASK *
#define OS_GetTaskID() OS_pCurrentTask

#define OS_GetpCurrentTask()    OS_pCurrentTask
#define OS_GetpCurrentTimer()   OS_pCurrentTimer
#define OS_GetpCurrentTimerEx() ((OS_TIMER_EX*)OS_pCurrentTimer)

#if OS_TRACKNAME
  const char* OS_GetTaskName(OS_TASK *);
#else
  #define OS_GetTaskName(pt)  ("n/a")
#endif

#if OS_CHECKSTACK
  void OS_CheckStack(void);              /* internal usage */
  int  OS_GetStackSpace(OS_TASK * pTask);
  int  OS_GetStackUsed (OS_TASK * pTask);
  int  OS_GetStackSize (OS_TASK OS_TCBPTR * pTask);
  void OS_STACKPTR* OS_GetStackBase(OS_TASK OS_TCBPTR *pTask);
#else
  #define OS_CheckStack()
  #define OS_GetStackSpace(pt) 0
  #define OS_GetStackUsed(pt)  0
  #define OS_GetStackSize(pt)  0
  #define OS_GetStackBase(pt)  0
#endif

OS_STACK_ADR OS_GetSysStackBase(void);  /* RTOS asm part */
unsigned int OS_GetSysStackSize(void);  /* RTOS asm part */
OS_STACK_ADR OS_GetIntStackBase(void);  /* RTOS asm part */
unsigned int OS_GetIntStackSize(void);  /* RTOS asm part */

#if OS_RR_SUPPORTED
  OS_U8 OS_SetTimeSlice(OS_TASK * pTask, OS_U8 TimeSlice);
  OS_U8 OS_GetTimeSliceRem(OS_TASK OS_TCBPTR * pTask);
  #define OS_GetTimeSliceReload(pTask)  pTask->TimeSliceReload
#else
  #define OS_GetTimeSliceRem(pTask)     0
  #define OS_GetTimeSliceReload(pTask)  0
#endif

OS_U8    OS_GetPriority(OS_TASK * pTask);  /* OS_GetPrio.c       */
#define OS_GET_PRIORITY(pt) pt->Priority

int     OS_GetNumTasks(void);              /* OS_GetNumTasks.c   */

OS_TASK* OS_TaskIndex2Ptr(int TaskIndex);  /* OS_TaskIndex2Ptr.c */

#if OS_PROFILE >=1
  OS_U32 OS_STAT_GetExecTime_Cycles (OS_TASK *pTask);  /* OSStat.c   */
  int    OS_STAT_GetLoad            (OS_TASK *pTask);  /* OSStatGL.c */
  void   OS_STAT_NotifyReadyStart   (OS_TASK *pTask);  /* OSStat.c   */
  void   OS_STAT_Sample(void);                         /* OSStat.c   */
#else
  #define OS_STAT_NotifyExecEnd()
  #define OS_STAT_GetExecTime_Cycles(pTask)   0
  #define OS_STAT_GetLoad(pTask)              0
  #define OS_STAT_Sample()
  #define OS_STAT_SetClocksPerUnit(ClocksPerUnit)
  #define OS_STAT_NOTIFYREADYSTART(pTask)
#endif


#if ((OS_PROFILE >= 1) || (OS_DEBUG > 0))  /* Also available in Debug build since V3.32b */
  OS_U32 OS_STAT_GetNumActivations  (OS_TASK *pTask);  /* OSStat.c   */
  OS_U32 OS_STAT_GetNumPreemptions  (OS_TASK *pTask);  /* OSStat.c   */
#else
  #define OS_STAT_GetNumActivations(pTask)    0
  #define OS_STAT_GetNumPreemptions(pTask)    0
#endif

/*********************************************************************
*
*       Size info routines (OS_GetSize.c)
*
**********************************************************************
*/

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

/*********************************************************************
*
*       Critical regions (OsKern.c)
*
**********************************************************************
*/

#define OS_EnterRegion() {OS_RegionCnt++; }
void OS_LeaveRegion(void);

/* Macro for OS_Leaveregion.
   Main purposes:
   - Used in OS-Kernel
   - Offers the high speed variant (macro) instead of the function call
*/

#define OS_LEAVEREGION_STD()        \
  if (--OS_RegionCnt == 0) {        \
    OS_DI();                        \
    if (OS_Pending) {               \
      OS_RegionCnt = 1;             \
      OS_Switch();                  \
      OS_RegionCnt = 0;             \
    }                               \
    OS_RESTORE_I();                 \
  }

#if OS_DEBUG
 #define OS_LEAVEREGION() \
   if (!OS_RegionCnt) OS_Error(OS_ERR_LEAVEREGION_BEFORE_ENTERREGION); \
   OS_LEAVEREGION_STD()
#else
  #define OS_LEAVEREGION()  OS_LEAVEREGION_STD()
#endif

/*********************************************************************
*
*       Interrupt save/disable/restore macros
*
**********************************************************************
*/
#define OS_IncDI()       { OS_ASSERT_DICnt(); OS_DI(); OS_DICnt++; }
#define OS_DecRI()       { OS_ASSERT_DICnt(); if (--OS_DICnt==0) OS_EI(); }
#define OS_RESTORE_I()   { OS_ASSERT_DICnt(); if (OS_DICnt==0)   OS_EI(); }

void OS_RestoreI(void);  /* OS_Kern.c */

/*********************************************************************
*
*       ISR (Interrupt service routine) support
*
**********************************************************************
*/

#define RTOS_PPENDING           (1)     /*      Preemption  pending */
#define RTOS_TSPENDING          (2)     /*      Task switch pending */
#define RTOS_RRPENDING          (4)     /*      Round robin pending */


#ifndef   OS_SUPPORT_INT_PRIORITY
  #define OS_SUPPORT_INT_PRIORITY (1)
#endif

#if OS_SUPPORT_INT_PRIORITY
  #ifndef   OS_IPL_EI_DEFAULT
    #error "Please define OS_IPL_EI_DEFAULT (OSChip.h)"
  #endif

  #ifndef   OS_IPL_DI_DEFAULT
    #error "Please define OS_IPL_DI_DEFAULT (OSChip.h)"
  #endif

  #if OS_COMPILER_STORAGE_MODIFIER_LEFT
    OS_EXTERN OS_SADDR unsigned int  OS_EXTERN_INIT(OS_Ipl_EI, OS_IPL_EI_DEFAULT);
    OS_EXTERN OS_SADDR unsigned int  OS_EXTERN_INIT(OS_Ipl_DI, OS_IPL_DI_DEFAULT);
  #else
    OS_EXTERN unsigned int OS_SADDR  OS_EXTERN_INIT(OS_Ipl_EI, OS_IPL_EI_DEFAULT);
    OS_EXTERN unsigned int OS_SADDR  OS_EXTERN_INIT(OS_Ipl_DI, OS_IPL_DI_DEFAULT);
  #endif
#endif

#if OS_DEBUG
  #define OS_MARK_IN_ISR()         {OS_InInt++;}
  #define OS_MARK_OUTOF_ISR()      {if (!OS_InInt--) OS_Error(OS_ERR_LEAVEINT);}
#else
  #define OS_MARK_IN_ISR()
  #define OS_MARK_OUTOF_ISR()
#endif

#if OS_SUPPORT_CALL_ISR            // Not allowed for some CPUs
void OS_CallISR        (void (*pRoutine)(void));
void OS_CallNestableISR(void (*pRoutine)(void));
#endif

#if (OS_SWITCH_FROM_INT_MODIFIES_STACK == 0) && (OS_INTERRUPTS_ARE_NESTABLE_ON_ENTRY != 0) && (OS_SCHEDULER_ACTIVATED_BY_EXCEPTION == 0)
  //
  // FOR CPUs without separate interrupt stack which do not disable interrupts on entry,
  // OS_Enter- / Leave- Interrupt() is not defined.
  // OS_CallISR() has to be used
  //
#else

  #ifndef   OS_ENABLE_INTS_SAVE_IPL
    #define OS_ENABLE_INTS_SAVE_IPL() OS_EI()
  #endif

  #ifndef   OS_RESTORE_IPL
    #define OS_RESTORE_IPL()
  #endif

  #ifndef   OS_EI_ON_LEAVE
    #define OS_EI_ON_LEAVE()        // Required for CPUs with do not restore DI-flag by RETI. Currently only CM3.
  #endif

  #if OS_INTERRUPTS_ARE_NESTABLE_ON_ENTRY
    #define OS_DI_ON_ENTRY() OS_DI()
  #else
    #define OS_DI_ON_ENTRY()
  #endif

  #if OS_SWITCH_FROM_INT_MODIFIES_STACK
    #define OS_HANDLE_REGION_CNT_ON_LI()                                          \
      else {                                                                      \
        OS_RegionCnt--;                                                           \
      }
  #else
    #define OS_HANDLE_REGION_CNT_ON_LI()                                          \
      OS_RegionCnt--;
  #endif


  #define OS_SWITCH_FROM_INT_IF_REQUIRED()                                      \
    if ((OS_RegionCnt == 1) && OS_Pending) {                                    \
      OS_SwitchFromInt();                                                       \
    }

  #define OS_EnterInterrupt() { \
    OS_DI_ON_ENTRY();           \
    OS_MARK_IN_ISR();           \
    OS_RegionCnt++;             \
    OS_DICnt++;                 \
  }

  #define OS_LeaveInterrupt() {                                                 \
    OS_MARK_OUTOF_ISR();                                                        \
    OS_DICnt--; /* Must have been zero initially ! (We could put =0 instead) */ \
    OS_SWITCH_FROM_INT_IF_REQUIRED()                                            \
    OS_HANDLE_REGION_CNT_ON_LI();                                               \
    OS_EI_ON_LEAVE();                                                           \
  }

  #define OS_LeaveInterruptNoSwitch() { \
    OS_MARK_OUTOF_ISR();                \
    OS_DICnt--;                         \
    OS_RegionCnt--;                     \
    OS_EI_ON_LEAVE();                   \
  }

  #define OS_EnterNestableInterrupt() { \
    OS_MARK_IN_ISR();                   \
    OS_RegionCnt++;                     \
    OS_ENABLE_INTS_SAVE_IPL();          \
  }

  #define OS_LeaveNestableInterrupt() {                                         \
    OS_DI();                                                                    \
    OS_MARK_OUTOF_ISR();                                                        \
    OS_SWITCH_FROM_INT_IF_REQUIRED()                                            \
    OS_HANDLE_REGION_CNT_ON_LI();                                               \
    OS_RESTORE_IPL();                                                           \
    OS_EI_ON_LEAVE();                                                           \
  }

  #define OS_LeaveNestableInterruptNoSwitch() { \
    OS_DI();                                    \
    OS_MARK_OUTOF_ISR();                        \
    OS_RegionCnt--;                             \
    OS_RESTORE_IPL();                           \
    OS_EI_ON_LEAVE();                           \
  }
#endif

#ifndef OS_EnterIntStack
  void OS__EnterIntStack(void);
  #define OS_EnterIntStack() {OS_DI(); OS__EnterIntStack(); OS_RESTORE_I(); }
#endif

#ifndef OS_LeaveIntStack
  void OS__LeaveIntStack(void);
  #define OS_LeaveIntStack() {OS_DI(); OS__LeaveIntStack(); }
#endif

void OS_SetFastIntPriorityLimit(OS_UINT Priority);

/*********************************************************************
*
*       Resource semaphores
*
**********************************************************************
*/

int      OS_Use             (OS_RSEMA * pRSema); /* OSRsem.c   */
void     OS_Unuse           (OS_RSEMA * pRSema); /* OSRsem.c   */
char     OS_Request         (OS_RSEMA * pRSema); /* OSRsemRQ.c */
int      OS_GetSemaValue    (OS_RSEMA * pRSema); /* OSRSemGV.c */
OS_TASK* OS_GetResourceOwner(OS_RSEMA * pRSema); /* OSRsemGO.c */

void     OS_CreateRSema     (OS_RSEMA * pRSema); /* OSRsem.c   */
void     OS_DeleteRSema     (OS_RSEMA * pRSema); /* OSDelRS.c  */

#define  OS_CREATERSEMA(ps) OS_CreateRSema(ps)

/*********************************************************************
*
*       Counting semaphores
*
**********************************************************************
*/

void  OS_CreateCSema    (OS_CSEMA * pCSema, OS_UINT InitValue);  /* OSCSEM.c             */
void  OS_DeleteCSema    (OS_CSEMA * pCSema);                     /* OSDELCS.c            */
int   OS_GetCSemaValue  (OS_CSEMA * pCSema);                     /* OSCSEMGV.c           */
OS_U8 OS_SetCSemaValue  (OS_CSEMA * pCSema, OS_UINT value);      /* OS_SetCSemaValue.c   */
void  OS_SignalCSema    (OS_CSEMA * pCSema);                     /* OSCSEM.c             */
void  OS_SignalCSemaMax (OS_CSEMA * pCSema, OS_UINT MaxValue);   /* OS_CSEMA_SignalMax.c */
void  OS_WaitCSema      (OS_CSEMA * pCSema);                     /* OSCSEM.c             */
int   OS_WaitCSemaTimed (OS_CSEMA * pCSema, OS_TIME TimeOut);    /* OSCSEMT.c            */
char  OS_CSemaRequest   (OS_CSEMA * pCSema);                     /* OSCSEMRQ.c           */

#define OS_CREATECSEMA(ps) OS_CreateCSema(ps,0)

/*********************************************************************
*
*       Mailboxes
*
**********************************************************************
*/
#define CREATEMB(MAILBOX, size, max, Buffer) OS_CreateMB(MAILBOX,size, max, Buffer);
void OS_CreateMB          (OS_MAILBOX * pMB, OS_U8 sizeofMsg, OS_UINT maxnofMsg, void* Buffer);    /* initialize mailbox */
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
char OS_GetMailTimed      (OS_MAILBOX * pMB, void* pDest, OS_TIME Timeout);
void OS_DeleteMB          (OS_MAILBOX * pMB);
void OS_WaitMail          (OS_MAILBOX * pMB);

#if OS_DEBUG == 0
  #define OS_GetMessageCnt(pMB) (*pMB).nofMsg
#else
  OS_UINT OS_GetMessageCnt(OS_MAILBOX * pMB);   /* get no. of available Messages */
#endif

/*********************************************************************
*
*       Message Queues (OSQ.c)
*
**********************************************************************
*/

void    OS_Q_Create       (OS_Q* pQ, void*pData, OS_UINT Size);
void    OS_Q_Clear        (OS_Q* pQ);                                /* OSQCL.c  */
int     OS_Q_GetMessageCnt(OS_Q* pQ);                                /* OSQGMC.c */
int     OS_Q_Put          (OS_Q* pQ, const void* pSrc, OS_UINT Size);
int     OS_Q_GetPtr       (OS_Q* pQ, void**ppData);
int     OS_Q_GetPtrCond   (OS_Q* pQ, void**ppData);                  /* OSQGPC.c */
int     OS_Q_GetPtrTimed  (OS_Q* pQ, void**ppData, OS_TIME Timeout); /* OSQGPT.c */
void    OS_Q_Purge        (OS_Q* pQ);

/*********************************************************************
*
*       Events
*
**********************************************************************
*/

char OS_ClearEvents          (OS_TASK * pTask);                 /* OSEVENCL.c  */
char OS_GetEventsOccured     (OS_TASK * pTask);                 /* OSEVENGE.c  */
void OS_SignalEvent          (char Event, OS_TASK * pTask);     /* OSENENS.c   */
char OS_WaitEvent            (char EventMask);                  /* OSEVENW.c   */
char OS_WaitEventTimed       (char EventMask, OS_TIME TimeOut); /* OSEVENT.c   */
char OS_WaitSingleEvent      (char EventMask);                  /* OSEVENWS.c  */
char OS_WaitSingleEventTimed (char EventMask, OS_TIME TimeOut); /* OSEVENWST.c */

/*********************************************************************
*
*       Timers(OSTIME.c)
*
**********************************************************************
*/

#ifdef OS_SIZEOF_INT
  #if OS_SIZEOF_INT == 2
    #define OS_TIMER_MAX_TIME 0x7F00
  #elif OS_SIZEOF_INT == 4
    #define OS_TIMER_MAX_TIME 0x7FFFFF00
  #else
    #error "OS_SIZEOF_INT not correctly defined"
  #endif
#endif

void    OS_CreateTimer    (OS_TIMER * pTimer, OS_TIMERROUTINE* Callback, OS_TIME Timeout);
void    OS_RetriggerTimer (OS_TIMER * pTimer);
void    OS_StartTimer     (OS_TIMER * pTimer);
void    OS_StopTimer      (OS_TIMER * pTimer);
void    OS_DeleteTimer    (OS_TIMER * pTimer);                  /* OSTIMED.c  */
OS_TIME OS_GetTimerPeriod (OS_TIMER * pTimer);                  /* OSTIMEGP.c */
OS_U8   OS_GetTimerStatus (OS_TIMER * pTimer);                  /* OSTIMEGS.c */
OS_TIME OS_GetTimerValue  (OS_TIMER * pTimer);                  /* OSTIMEGV.c */
void    OS_SetTimerPeriod (OS_TIMER * pTimer, OS_TIME Period);  /* OSTIMES.c  */

#define OS_CREATETIMER(pTimer,c,d)  \
        OS_CreateTimer(pTimer,c,d); \
        OS_StartTimer(pTimer);

/*********************************************************************
*
*       Extended timers (OSTIMERX.c)
*
**********************************************************************
*/
void    OS_CreateTimerEx (OS_TIMER_EX * pTimerEx, OS_TIMER_EX_ROUTINE* Callback, OS_TIME Timeout, void * pData);

#define OS_RetriggerTimerEx(pTimerEx)         OS_RetriggerTimer(&(pTimerEx)->Timer)
#define OS_StartTimerEx(pTimerEx)             OS_StartTimer(&(pTimerEx)->Timer)
#define OS_StopTimerEx(pTimerEx)              OS_StopTimer(&(pTimerEx)->Timer)
#define OS_DeleteTimerEx(pTimerEx)            OS_DeleteTimer(&(pTimerEx)->Timer)
#define OS_GetTimerPeriodEx(pTimerEx)         OS_GetTimerPeriod(&(pTimerEx)->Timer)
#define OS_GetTimerStatusEx(pTimerEx)         OS_GetTimerStatus(&(pTimerEx)->Timer)
#define OS_GetTimerValueEx(pTimerEx)          OS_GetTimerValue(&(pTimerEx)->Timer)
#define OS_SetTimerPeriodEx(pTimerEx,Period)  OS_SetTimerPeriod(&(pTimerEx)->Timer, Period)

#define OS_CREATETIMER_EX(pTimerEx,cb,Timeout,pData) \
        OS_CreateTimerEx(pTimerEx,cb,Timeout,pData); \
        OS_StartTimerEx(pTimerEx)

/*********************************************************************
*
*       Heap type memory management (OS_Alloc.c)
*
**********************************************************************

  This functions might not be implemented in all OS ports.
  Therefore declaration depends on condition OS_SUPPORT_OS_ALLOC
  which has to be defined in CPU specific part

*/

#if OS_SUPPORT_OS_ALLOC
  void* OS_malloc(unsigned int);
  void  OS_free  (void* pMemBlock);
  void* OS_realloc  (void* pMemBlock, unsigned NewSize);
#endif

/*********************************************************************
*
*       Fixed Block memory management
*
**********************************************************************
*/

void  OS_MEMF_Create(OS_MEMF* pMEMF, void* pPool, OS_U16 NumBlocks, OS_U16 BlockSize);
void  OS_MEMF_Delete(OS_MEMF* pMEMF);
void* OS_MEMF_Alloc(OS_MEMF* pMEMF, int Purpose);
void* OS_MEMF_AllocTimed(OS_MEMF* pMEMF, OS_TIME Timeout, int Purpose);
void* OS_MEMF_Request(OS_MEMF* pMEMF, int Purpose);
void  OS_MEMF_Release(OS_MEMF* pMEMF, void* pMemBlock);
void  OS_MEMF_FreeBlock(void* pMemBlock);
int   OS_MEMF_GetNumFreeBlocks(OS_MEMF* pMEMF);
char  OS_MEMF_IsInPool(OS_MEMF* pMEMF, void* pMemBlock);
int   OS_MEMF_GetMaxUsed(OS_MEMF* pMEMF);
int   OS_MEMF_GetNumBlocks(OS_MEMF* pMEMF);
int   OS_MEMF_GetBlockSize(OS_MEMF* pMEMF);

/*********************************************************************
*
*       Event object module
*
**********************************************************************
*/

/****** Simple OS_EVENT functions ************************************/

void  OS_EVENT_Create    (OS_EVENT* pEvent);
void  OS_EVENT_Delete    (OS_EVENT* pEvent);

OS_U8 OS_EVENT_Get       (OS_EVENT* pEvent);
void  OS_EVENT_Pulse     (OS_EVENT* pEvent);
void  OS_EVENT_Reset     (OS_EVENT* pEvent);
void  OS_EVENT_Set       (OS_EVENT* pEvent);
void  OS_EVENT_Wait      (OS_EVENT* pEvent);
char  OS_EVENT_WaitTimed (OS_EVENT* pEvent, OS_TIME Timeout);

/*********************************************************************
*
*       Timing support (OSTiming.c)
*
**********************************************************************

 New in V3.04, but not yet documented to the end user. Great for
 run-time measurement.
*/

#define OS_TIMING OS_U32
void    OS_Timing_Start(OS_TIMING* pCycle);
void    OS_Timing_End(OS_TIMING* pCycle);
OS_U32  OS_Timing_Getus(OS_TIMING* pCycle);
#define OS_Timing_GetCycles(pPara) (*pPara)


/*********************************************************************
*
*       OS Power control module OS_Power.c
*
**********************************************************************
*/
#if OS_SUPPORT_POWER
#define OS_POWER_LEVEL0  (0x0001)
#define OS_POWER_LEVEL1  (0x0002)
#define OS_POWER_LEVEL2  (0x0004)
#define OS_POWER_LEVEL3  (0x0008)
#define OS_POWER_LEVEL4  (0x0010)
#define OS_POWER_LEVEL5  (0x0020)
#define OS_POWER_LEVEL6  (0x0040)
#define OS_POWER_LEVEL8  (0x0080)

void    OS_POWER_UsageInc(OS_UINT Level);
void    OS_POWER_UsageDec(OS_UINT Level);
OS_UINT OS_POWER_GetMask(void);
#endif

/*********************************************************************
*
*       Advanced profiling support (Module OsKern.c)
*
**********************************************************************
*/
#if OS_PROFILE >= 1
  void OS_EnableProfiling(int Period);
  #define OS_DisableProfiling() { OS_ProfilingOn=0; }
#else
  #define OS_EnableProfiling(Period);
  #define OS_DisableProfiling()
#endif

/*********************************************************************
*
*       Configuration
*
**********************************************************************
*/

#define OS_CONFIG_FRACT(f, div)                    \
  OS_TicksPerMS  = f/1000;                         \
  OS_IntMSInc    = div*1000L/f;                    \
  OS_IntTicksInc = div-(f/1000)*(div*1000L/f);

#define OS_CONFIG(f, div)     \
  OS_IntMSInc    = div*1000L/f;


/*********************************************************************
*
*       Trace support (OSTrace.c)
*
**********************************************************************

Trace support is enabled by defining OS_TRACE 1.
This is automatically done, when OS_LIBMODE_T is defined.

*/

#if OS_TRACE
  /* Declare trace function prototypes */
  void OS_TraceVoid (OS_U8 id);
  void OS_TracePtr  (OS_U8 id, void* p);
  void OS_TraceData (OS_U8 id, int v);
  void OS_TraceDataPtr (OS_U8 id, int v, void*p);
  void OS_TraceU32Ptr  (OS_U8 id, OS_U32 p0, void*p1);
  void OS_TraceEnable(void);
  void OS_TraceDisable(void);
  void OS_TraceEnableAll(void);                              /* OSTrace1.c */
  void OS_TraceDisableAll(void);                             /* OSTrace1.c */
  void OS_TraceEnableId(OS_U8 id);                           /* OSTrace1.c */
  void OS_TraceDisableId(OS_U8 id);                          /* OSTrace1.c */
  void OS_TraceEnableFilterId(OS_U8 FilterIndex, OS_U8 id);  /* OSTrace1.c */
  void OS_TraceDisableFilterId(OS_U8 FilterIndex, OS_U8 id); /* OSTrace1.c */

  /* Trace function macros, used in API functions */
  #define OS_TRACE_VOID(id)            OS_TraceVoid(id)
  #define OS_TRACE_PTR(id, p)          OS_TracePtr(id, p)
  #define OS_TRACE_DATA(id, v)         OS_TraceData(id, v)
  #define OS_TRACE_DATA_PTR(id, v, p)  OS_TraceDataPtr(id, v, p)
  #define OS_TRACE_U32_PTR(id, p0, p1) OS_TraceU32Ptr(id, p0, p1)

  #define OS_TRACE_START()                    { OS_EnterRegion();                                }
  #define OS_TRACE_START_VOID(id)             { OS_EnterRegion(); OS_TraceVoid(id);              }
  #define OS_TRACE_START_PTR(id, p)           { OS_EnterRegion(); OS_TracePtr(id, p);            }
  #define OS_TRACE_START_DATA(id, v)          { OS_EnterRegion(); OS_TraceData(id, v);           }
  #define OS_TRACE_START_DATA_PTR(id, v, p)   { OS_EnterRegion(); OS_TraceDataPtr(id, v, p);     }
  #define OS_TRACE_START_U32_PTR(id, p0, p1)  { OS_EnterRegion(); OS_TraceU32Ptr(id, u, p);      }
  #define OS_TRACE_END()                      { OS_LeaveRegion();                                }

#else
  /* Replace trace functions by empty macros if trace is not enabled */
  #define OS_TraceVoid(id)
  #define OS_TracePtr(id, p)
  #define OS_TraceData(id, v)
  #define OS_TraceDataPtr(id, v, p)
  #define OS_TraceU32Ptr(id, p0, p1)
  #define OS_TraceEnable()
  #define OS_TraceDisable()
  #define OS_TraceEnableAll()
  #define OS_TraceDisableAll()
  #define OS_TraceEnableId(id)
  #define OS_TraceDisableId(id)
  #define OS_TraceEnableFilterId(FilterIndex, id)
  #define OS_TraceDisableFilterId(FilterIndex, id)
  /* Trace function macros, used in API functions. */
  /* Expand to nothing if trace is disabled       */
  #define OS_TRACE_VOID(id)
  #define OS_TRACE_PTR(id, p)
  #define OS_TRACE_DATA(id, v)
  #define OS_TRACE_DATA_PTR(id, v, p)
  #define OS_TRACE_U32_PTR(id, p0, p1)

  #define OS_TRACE_START()
  #define OS_TRACE_START_VOID(id)
  #define OS_TRACE_START_PTR(id, p)
  #define OS_TRACE_START_DATA(id, v)
  #define OS_TRACE_START_DATA_PTR(id, v, p)
  #define OS_TRACE_START_U32_PTR(id, p0, p1)
  #define OS_TRACE_END()
#endif

/*********************************************************************
*
*        RTOSInit and misc.
*
**********************************************************************

The routines declared below are available on all targets.

*/

/* Routines in RTOSInit.c */
void   OS_InitHW(void);
void   OS_Idle(void);
OS_U32 OS_ConvertCycles2us(OS_U32 Cycles);
OS_U32 OS_GetTime_Cycles(void);
void   OS_COM_Init(void);
void   OS_COM_Send1(unsigned char c);

/* Routines in OS_Error.c, delivered as source file */
void   OS_Error(int code);

OS_INTERWORK void  OS_Start(void);                  /* RTOS ASM part   */
OS_INTERWORK void  OS_Switch(void);                 /* RTOS ASM part   */
OS_INTERWORK int   OS_SwitchFromInt(void);          /* RTOS ASM part   */

void  OS_InitKern(void);             /* OSKern.c        */
OS_U8 OS_OnTx(void);                 /* OSComRxTx1.c, Returns 1 on last byte */
void  OS_OnRx(unsigned char c);      /* OSComRxTx1.c    */
void  OS_Send1(OS_U8 c);             /* not implemented */
void  OS_SendString(const char* s);  /* OSSend.c        */
OS_RX_CALLBACK* OS_SetRxCallback(OS_RX_CALLBACK* cb);
OS_U8 OS_EvaPacketEx(const OS_U8 * pSrc, OS_U16 SrcLen, OS_U8** pReturn);  /* OS_EvaPacketEx.c */

void  OS_COM_ClearTxActive(void);    /* OSCom2.c */

/*********************************************************************
*
*        RTOS misc. optional
*
**********************************************************************

The routines declared below are available on some targets
only. (Because they do not make much sense on others)
*/

/* Timing routines. Their existance depends on the CPU. In general,
  8-bit CPUs require both routines, where 16-bit CPUs require one
  and 32-bit CPUs require none of these.
*/
#ifndef OS_GetTime
  OS_TIME OS_GetTime(void);
#endif
#ifndef OS_GetTime32
  #if (OS_SIZEOF_INT == 4)
    #define OS_GetTime32() (OS_Time)
  #else
    OS_I32 OS_GetTime32(void);
  #endif
#endif

void OS__di(void);
void OS__ei(void);
void OS__SaveIPL(void);
void OS__RestIPL(void);
void OS_SIM_Init(void);

/* Standard tick handler which increment OS time variable by one on each interrupt */
void OS_HandleTick(void);       /* New version of OS_TickHandler() without Enter- Leave-Interrupt    */
void OS_HandleTickDI(void);     /* OSTickDI.c */

/* Non standard tick handler which increment the OS time variable by OS_IntMsInc once on each interrupt */
/* One of these handler has to be used when OS_CONFIG() is used to set a tick increment unequal to 0    */
void OS_HandleTick_Ex(void);    /* OS_HandleTick_Ex.c */
void OS_HandleTickDI_Ex(void);  /* OSTickDI_Ex.c      */

void OS_AddTickHook(OS_TICK_HOOK* pHook, OS_TICK_HOOK_ROUTINE * pfUser);
void OS_RemoveTickHook(OS_TICK_HOOK* pHook);

/* Routines for the PC-version running in native mode (non-windows) */
void OS_SetIntFreq(OS_UINT f);
void OS_Exit(int code);
void OS_UseDos(void);
void OS_UnuseDos(void);
int  OS_GetKey(void);
int  OS_WaitKey(void);

/* Compatibility with manual */
#define OS_CREATEMB          OS_CreateMB
#define OS_GetUseCnt         OS_GetSemaValue
#define OS_WaitCSema_Timed   OS_WaitCSemaTimed
#define OS_WaitEvent_Timed   OS_WaitEventTimed

/********************************************************************/

#ifdef __cplusplus
  }
#endif

#endif /* RTOS_H_INCLUDED */

/*****  EOF  ********************************************************/

