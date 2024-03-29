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
File    : USB_OS_embOS.c
Purpose : Kernel abstraction for embOS
          Do not modify to allow easy updates !
--------  END-OF-HEADER  ---------------------------------------------
*/


#include "USB_Private.h"
#include "RTOS.h"

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_EVENT _aEvent[USB_NUM_EPS];

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

/*********************************************************************
*
*       USB_OS_Init
*
*  Function description:
*    This function shall initialize all event objects that are necessary.
*
*/
void USB_OS_Init(void) {
  unsigned i;

  for (i = 0; i < COUNTOF(_aEvent); i++) {
    OS_EVENT_Create(&_aEvent[i]);
  }
}


/**********************************************************
*
*       USB_OS_Delay
*
* Function description
*   Delays for a given number of ms.
*
*/
void USB_OS_Delay(int ms) {
  OS_Delay(ms);
}

/**********************************************************
*
*       USB_OS_DecRI
*
* Function description
*   Decrement interrupt disable count and enable interrupts
*   if counter reaches 0.
*
*/
void USB_OS_DecRI(void) {
  OS_DecRI();
}

/**********************************************************
*
*        USB_OS_IncDI
*
* Function description
*   Increment interrupt disable count and disable interrupts
*
*/
void   USB_OS_IncDI(void) {
  OS_IncDI();
}

/**********************************************************
*
*       USB_OS_Signal
*
* Function description
*   Wake the task waiting for reception
*   This routine is typically called from within an interrupt
*   service routine
*
*/
void USB_OS_Signal(unsigned EPIndex) {
  OS_EVENT_Pulse(&_aEvent[EPIndex]);
}

/**********************************************************
*
*        USB_OS_Wait
*
* Function description
*   Block the task until USB_OS_SignalRx is called
*   This routine is called from a task.
*
*/
void USB_OS_Wait(unsigned EPIndex) {
  OS_EVENT_Wait(&_aEvent[EPIndex]);
}

/**********************************************************
*
*        USB_OS_WaitTimed
*
* Function description
*   Block the task until USB_OS_Signal is called 
*   or a time out occurs
*   This routine is called from a task.
*
*/
int USB_OS_WaitTimed(unsigned EPIndex, unsigned ms) {
  int r;
  r = (int)OS_EVENT_WaitTimed(&_aEvent[EPIndex], ms + 1);
  return r;
}

/**********************************************************
*
*        USB_OS_Panic
*
* Function description
*   Called if fatal error is detected.
*
* Add. info
*   Error codes:
*     1   USB_ERROR_RX_OVERFLOW
*     2   USB_ERROR_ILLEGAL_MAX_PACKET_SIZE
*     3   USB_ERROR_ILLEGAL_EPADDR
*     4   USB_ERROR_IBUFFER_SIZE_TOO_SMALL
*/
void USB_OS_Panic(unsigned ErrCode) {
  while (ErrCode);
}

/**********************************************************
*
*        USB_OS_GetTickCnt
*
* Function description
*   Returns the current system time in ticks.
*/
U32 USB_OS_GetTickCnt(void) {
  return OS_Time;
}

/*************************** End of file ****************************/
