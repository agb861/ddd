/*********************************************************************
*                SEGGER MICROCONTROLLER GmbH & Co. KG                *
*        Solutions for real time microcontroller applications        *
**********************************************************************
*                                                                    *
*        (c) 2003-2008     SEGGER Microcontroller GmbH & Co KG       *
*                                                                    *
*        Internet: www.segger.com    Support:  support@segger.com    *
*                                                                    *
**********************************************************************

----------------------------------------------------------------------
File    : GUI_TOUCH_X.C
Purpose : GUI Touch routines
---------------------------END-OF-HEADER------------------------------
*/

#include "SysConf.h"
#include "GUI.h"

/*********************************************************************
*
*       Configuration
*
**********************************************************************
*/

#if GUI_SUPPORT_TOUCH // Only needed when touch support is enabled

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/

// I/O
#define IO_BASE_ADDR    (0xE0028000)
#define IO0SET          (*(volatile unsigned long *)(IO_BASE_ADDR     + 0x0004))
#define IO0DIR          (*(volatile unsigned long *)(IO_BASE_ADDR     + 0x0008))
#define IO0CLR          (*(volatile unsigned long *)(IO_BASE_ADDR     + 0x000C))

// SPI
#define SPI_BASE_ADDR   (0xE0020000)
#define SPI_S0SPCR      (*(volatile U32*) SPI_BASE_ADDR)
#define SPI_S0SPSR      (*(volatile U32*) (SPI_BASE_ADDR + 0x04))
#define SPI_S0SPDR      (*(volatile U32*) (SPI_BASE_ADDR + 0x08))
#define SPI_S0SPCCR     (*(volatile U32*) (SPI_BASE_ADDR + 0x0C))

#define CS_PIN            (1 << 20)  //P0.20
#define ACTIVATE_CS()     (IO0CLR = CS_PIN)
#define DEACTIVATE_CS()   (IO0SET = CS_PIN)

// Pin select
#define PINSEL_BASE_ADDR  (0xE002C000)
#define PINSEL0           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0000))
#define PINSEL1           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0004))

/*********************************************************************
*
*       Local functions
*
**********************************************************************
*/

/*********************************************************************
*
*       _SPI_Send()
*/
static unsigned char _SPI_Send(unsigned char Data) {
  unsigned int FailsafeCnt;

  SPI_S0SPDR = Data;
  FailsafeCnt = 0;
  while(((SPI_S0SPSR & 0x80) == 0) && (FailsafeCnt < 5000)) {
    FailsafeCnt++;
  }
  if (FailsafeCnt >= 5000) {
    SPI_S0SPCCR = 57;
    SPI_S0SPCR  = 0x38;
  }
  return SPI_S0SPDR;
}

/*********************************************************************
*
*       _UpdateTouch()
* Function decription:
*   Checks if a touch occured and updates the local x/y values.
*/
static U8 _IsTouch(void) {
  U32 Z1;
  U32 Z2;
  U32 x;
  U32 Pressure;

  //Read x value
  ACTIVATE_CS();
  _SPI_Send(0x83 | 0x50 | 0x00);
  x   = ((U32)_SPI_Send(0x00)) << 8;
  x  |= (U32)_SPI_Send(0x00);
  x >>= 3;
  DEACTIVATE_CS();

  //Read Z1 value
  ACTIVATE_CS();
  _SPI_Send(0x83 | 0x30 | 0x00);
  Z1   = ((U32)_SPI_Send(0x00)) << 8;
  Z1  |= (U32)_SPI_Send(0x00);
  Z1 >>= 3;
  DEACTIVATE_CS();

  //Read Z2 value
  ACTIVATE_CS();
  _SPI_Send(0x83 | 0x40 | 0x00);
  Z2  = ((U32)_SPI_Send(0x00)) << 8;
  Z2 |= (U32)_SPI_Send(0x00);
  Z2 >>= 3;
  DEACTIVATE_CS();

  //Calculate pressure
  Pressure =( x * Z2 - Z1) / Z1;

  if ((Pressure != 0) && (Pressure < 40000)) {
    return 1;  // Touch
  }
  return 0;    // No touch
}

/*********************************************************************
*
*       Global functions
*
**********************************************************************
*/

/*********************************************************************
*
*       GUI_TOUCH_X_ActivateX()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Switches on voltage on X-axis,
*   prepares measurement for Y-axis.
*   Voltage on Y-axis is switched off.
*/
void GUI_TOUCH_X_ActivateX(void) {
}

/*********************************************************************
*
*       GUI_TOUCH_X_ActivateY()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Switches on voltage on Y-axis,
*   prepares measurement for X-axis.
*   Voltage on X-axis is switched off.
*/
void GUI_TOUCH_X_ActivateY(void) {
}

/*********************************************************************
*
*       GUI_TOUCH_X_MeasureX()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Measures voltage of X-axis.
*/
int  GUI_TOUCH_X_MeasureX(void) {
  int x;

  if (_IsTouch() == 1) {
    ACTIVATE_CS();
    _SPI_Send(0x83 | 0x50 | 0x00);
    x   = ((U32)_SPI_Send(0x00)) << 8;
    x  |= (U32)_SPI_Send(0x00);
    x >>= 3;
    DEACTIVATE_CS();
    return x;
  }
  return -1;
}

/*********************************************************************
*
*       GUI_TOUCH_X_MeasureY()
*
* Function decription:
*   Called from GUI, if touch support is enabled.
*   Measures voltage of Y-axis.
*/
int  GUI_TOUCH_X_MeasureY(void) {
  int y;

  if (_IsTouch() == 1) {
    ACTIVATE_CS();
    _SPI_Send(0x83 | 0x10 | 0x00);
    y   = ((U32)_SPI_Send(0x00)) << 8;
    y  |= (U32)_SPI_Send(0x00);
    y >>= 3;
    DEACTIVATE_CS();
    return y;
  }
  return -1;
}

/********************************************************************/

#endif // GUI_SUPPORT_TOUCH

/****** End of File *************************************************/
