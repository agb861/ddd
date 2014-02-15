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
File    : USB_Config_LPC2468_EA.c
Purpose : USB Config file for NXP 2468 Embedded artist board.
--------  END-OF-HEADER  ---------------------------------------------
*/

#include <stdio.h>
#include "USB.h"

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/
/****** Pin Connect Block *******************************************/

#define PINSEL_BASE_ADDR  (0xE002C000)
#define PINSEL1           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0004))
#define PINSEL3           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x000C))
#define PINSEL4           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0010))

/****** GPIO ********************************************************/

#define FIO_BASE_ADDR    (0x3FFFC000)
#define FIO2DIR          (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x40))
#define FIO2CLR          (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x5C))

#define GPIO_BASE_ADDR   (0xE0028000)
#define IO0PIN           (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x00))
#define IO0DIR           (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x08))

/****** Vectored interrupt controller (VIC) *************************/

#define VIC_BASE_ADDR       (0xFFFFF000)

#define VIC_IRQSTATUS       *(volatile U32*)(VIC_BASE_ADDR + 0x000)
#define VIC_FIQSTATUS       *(volatile U32*)(VIC_BASE_ADDR + 0x004)
#define VIC_RAWINTERRUPT    *(volatile U32*)(VIC_BASE_ADDR + 0x008)
#define VIC_INTSELECT       *(volatile U32*)(VIC_BASE_ADDR + 0x00C)
#define VIC_INTENABLE       *(volatile U32*)(VIC_BASE_ADDR + 0x010)
#define VIC_INTENABLECLEAR  *(volatile U32*)(VIC_BASE_ADDR + 0x014)
#define VIC_SOFTINT         *(volatile U32*)(VIC_BASE_ADDR + 0x018)
#define VIC_SOFTINTCLEAR    *(volatile U32*)(VIC_BASE_ADDR + 0x01C)

#define VIC_PRIO_0          *(volatile U32*)(VIC_BASE_ADDR + 0x200)
#define VIC_VECTORADDR      *(volatile U32*)(VIC_BASE_ADDR + 0xF00)

#define VIC_VECT_0          *(volatile U32*)(VIC_BASE_ADDR + 0x100)
#define VIC_VECT_BASE_ADDR  (VIC_BASE_ADDR + 0x100)
#define VIC_PRIO_BASE_ADDR  (VIC_BASE_ADDR + 0x200)

#ifndef   _NUM_INT_VECTORS
  #define _NUM_INT_VECTORS  (32)
#endif

#define USB_INT_INDEX       (22)

#define NUM_INT_PRIORITIES  (16)
#define INT_PRIORITY_MASK   (NUM_INT_PRIORITIES - 1)


#define USB_PORT_SEL        (*(volatile U32*)(0xFFE0C110))


/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

/*********************************************************************
*
*       USB_X_HWAttach
*/
void USB_X_HWAttach(void) {
  //
  // Configure pins
  //
  PINSEL1 |=  (1 << 26)   // Setuip P0.29 as USB1D+
          |   (1 << 28)   // Setuip P0.30 as USB1D-
          |   (1 << 30)   // Setuip P0.31 as USB2D+
          ;
  PINSEL3 |=  (1 <<  4);  // Setuip P1.18 as USB1UP_LED
  PINSEL3 &= ~(3 << 28);  // Setuip P1.18 as USB1UP_LED
            ;
  PINSEL4 &= ~(3 << 18);  // Setup USB1CONNECT as pin port since
  //
  //  Select which USb data lines shall be used
  //  For U1D+ and U1D-: __USB_PORT_SEL = 0;
  //  For U2D+ and U2D-: __USB_PORT_SEL = 3;
  //
  USB_PORT_SEL  = 0;
  FIO2DIR      |= (1 << 9);
  FIO2CLR       = (1 << 9);
  //
  // Pull down P0.14 for attach
  //
  IO0DIR |= (1 << 14);  // Set P0.14 as output
  IO0PIN &= ~(1 << 14);  // Clear P0.14 (active low)
}


/*********************************************************************
*
*       Setup which target USB driver shall be used
*/


/*********************************************************************
*
*       USB_X_AddDriver
*/
void USB_X_AddDriver(void) {
  USB_AddDriver(&USB_Driver_NXPLPC24xx);
}


/*********************************************************************
*
*       OS_ARM_InstallISRHandler
*
*/
static USB_ISR_HANDLER* _InstallISRHandler(int ISRIndex, USB_ISR_HANDLER* pISRHandler) {
  USB_ISR_HANDLER*  pfOldHandler;
  USB_ISR_HANDLER** papfISR;

  pfOldHandler = NULL;
  USB_OS_IncDI();
  papfISR = (USB_ISR_HANDLER**) &VIC_VECT_0;
  if (ISRIndex < _NUM_INT_VECTORS) {
    pfOldHandler          = *(papfISR + ISRIndex);
    *(papfISR + ISRIndex) = pISRHandler;
  }
  USB_OS_DecRI();
  return pfOldHandler;
}

/*********************************************************************
*
*       _EnableISR
*
*/
static void _EnableISR(int ISRIndex) {
  if (ISRIndex < _NUM_INT_VECTORS) {
    USB_OS_IncDI();
    VIC_INTENABLE = (1UL << ISRIndex);
    USB_OS_DecRI();
  }
}

/*********************************************************************
*
*       _ISRSetPrio
*/
static int _ISRSetPrio(int ISRIndex, int Prio) {
  U32   * pPrio;
  int     OldPrio;

  USB_OS_IncDI();
  pPrio = (U32*) VIC_PRIO_BASE_ADDR;
  OldPrio = pPrio[ISRIndex];
  pPrio[ISRIndex] = (OldPrio & ~INT_PRIORITY_MASK) | (Prio & INT_PRIORITY_MASK);
  USB_OS_DecRI();
  return OldPrio & INT_PRIORITY_MASK;
}

/*********************************************************************
*
*       USB_X_EnableISR
*
*/
void USB_X_EnableISR(USB_ISR_HANDLER * pfISRHandler) {
  _InstallISRHandler(USB_INT_INDEX, pfISRHandler);
  _EnableISR(USB_INT_INDEX);
  _ISRSetPrio(USB_INT_INDEX, 15);
}


/**************************** end of file ***************************/
