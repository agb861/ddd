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
File    : BSP.c
Purpose : Dummy BSP for LPC2468
--------  END-OF-HEADER  ---------------------------------------------
*/

#include "BSP.h"
#include "RTOS.h"
#include "GUI.h"
#include "GUIDRV_Lin.h"
#include "I2CPCA9532.h"
#include "LCDConf.h"

/*********************************************************************
*
*       Configuration
*
**********************************************************************
*/
#define TOUCHTIMERINTERVAL     (10)  // Interval in ms

/*********************************************************************
*
*       Layer configuration (to be modified)
*
**********************************************************************
*/
//
// Physical display size
//
#define XSIZE_PHYS                320
#define YSIZE_PHYS                240

//
// Virtual display size
//
#define VXSIZE_PHYS               (2 * XSIZE_PHYS)
#define VYSIZE_PHYS               YSIZE_PHYS

//
// Color conversion
//
#define COLOR_CONVERSION          GUICC_565

//
// Display driver
//
#define DISPLAY_DRIVER            GUIDRV_Lin_OSX_16_API

//
// Pixel width in bytes
//
#define PIXEL_WIDTH               2

//
// Touch controller values
//
#define TOUCH_AD_TOP              (184)
#define TOUCH_AD_BOTTOM           (3894)
#define TOUCH_AD_LEFT             (154)
#define TOUCH_AD_RIGHT            (3834)

//
// Video RAM address
//
#define VRAM_ADDR             ((U32)&_aVRAM[0])

//
// Video RAM
//
static U32 _aVRAM[(VXSIZE_PHYS * VYSIZE_PHYS / (4 / PIXEL_WIDTH)) + 8];

/*********************************************************************
*
*       Configuration checking
*
**********************************************************************
*/
#ifndef   VXSIZE_PHYS
  #define VXSIZE_PHYS XSIZE_PHYS
#endif
#ifndef   VYSIZE_PHYS
  #define VYSIZE_PHYS YSIZE_PHYS
#endif
#ifndef   VRAM_ADDR
  #define VRAM_ADDR 0
#endif

#ifndef   XSIZE_PHYS
  #error Physical X size of display is not defined!
#endif
#ifndef   YSIZE_PHYS
  #error Physical Y size of display is not defined!
#endif
#ifndef   COLOR_CONVERSION
  #error Color conversion not defined!
#endif
#ifndef   DISPLAY_DRIVER
  #error No display driver defined!
#endif

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/

#define INT_INDEX_MAC                (21)

/* LED states */
#define LED_SET                      (0)
#define LED_CLR                      (1)
#define LED_TOGGLE                   (2)

/****** Addresses of sfrs and peripheral identifiers ****************/
#define PINSEL_BASE_ADDR             (0xE002C000)
#define PINMODE_BASE_ADDR            (0xE002C040)
#define FIO_BASE_ADDR                (0x3FFFC000)
#define PWM1_BASE_ADDR               (0xE0018000)
#define SPI0_BASE_ADDR               (0xE0020000)
#define IO_BASE_ADDR                 (0xE0028000)
#define LCDC_BASE_ADDR               (0xFFE10000)

/****** SFRs and identifiers used for SPI initialization ************/
#define SPI_BASE_ADDR                (0xE0020000)
#define SPI_S0SPCR                   (*(volatile U32*) SPI_BASE_ADDR)
#define SPI_S0SPSR                   (*(volatile U32*) (SPI_BASE_ADDR + 0x04))
#define SPI_S0SPDR                   (*(volatile U32*) (SPI_BASE_ADDR + 0x08))
#define SPI_S0SPCCR                  (*(volatile U32*) (SPI_BASE_ADDR + 0x0C))

#define CS_PIN                       (1 << 20)  //P0.20

/****** SFRs and identifiers used for LED demo **********************/
#define PINSEL0                      (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x0000))
#define PINSEL1                      (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x0004))
#define PINSEL2                      (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x0008))
#define PINSEL3                      (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x000C))
#define PINSEL4                      (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x0010))
#define PINSEL9                      (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x0024))
#define PINSEL10                     (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x0028))
#define PINSEL11                     (*(volatile U32 *)(PINSEL_BASE_ADDR + 0x002C))

#define PINMODE0                     (*(volatile U32 *)(PINMODE_BASE_ADDR + 0x0000))
#define PINMODE1                     (*(volatile U32 *)(PINMODE_BASE_ADDR + 0x0004))
#define PINMODE3                     (*(volatile U32 *)(PINMODE_BASE_ADDR + 0x000C))
#define PINMODE4                     (*(volatile U32 *)(PINMODE_BASE_ADDR + 0x0010))
#define PINMODE9                     (*(volatile U32 *)(PINMODE_BASE_ADDR + 0x0024))


#define FIO2DIR                      (*(volatile U32 *)(FIO_BASE_ADDR    + 0x0040))
#define FIO2PIN                      (*(volatile U32 *)(FIO_BASE_ADDR    + 0x0054))
#define FIO2SET                      (*(volatile U32 *)(FIO_BASE_ADDR    + 0x0058))

#define PWM1TCR                      (*(volatile U32 *)(PWM1_BASE_ADDR   + 0x0004))
#define PWM1PR                       (*(volatile U32 *)(PWM1_BASE_ADDR   + 0x000C))
#define PWM1MCR                      (*(volatile U32 *)(PWM1_BASE_ADDR   + 0x0014))
#define PWM1MR0                      (*(volatile U32 *)(PWM1_BASE_ADDR   + 0x0018))
#define PWM1MR1                      (*(volatile U32 *)(PWM1_BASE_ADDR   + 0x001C))
#define PWM1PCR                      (*(volatile U32 *)(PWM1_BASE_ADDR   + 0x004C))
#define PWM1LER                      (*(volatile U32 *)(PWM1_BASE_ADDR   + 0x0050))

#define S0SPCR                       (*(volatile U32 *)(SPI0_BASE_ADDR   + 0x0000))
#define S0SPSR                       (*(volatile U32 *)(SPI0_BASE_ADDR   + 0x0004))
#define S0SPDR                       (*(volatile U32 *)(SPI0_BASE_ADDR   + 0x0008))
#define S0SPCCR                      (*(volatile U32 *)(SPI0_BASE_ADDR   + 0x000C))

#define IO0SET                       (*(volatile U32 *)(IO_BASE_ADDR     + 0x0004))
#define IO0DIR                       (*(volatile U32 *)(IO_BASE_ADDR     + 0x0008))
#define IO0CLR                       (*(volatile U32 *)(IO_BASE_ADDR     + 0x000C))

#define LCD_CFG                      (*(volatile U32 *)(0xE01FC1B8))

#define LCD_TIMH                     (*(volatile U32 *)(LCDC_BASE_ADDR   + 0x0000))
#define LCD_TIMV                     (*(volatile U32 *)(LCDC_BASE_ADDR   + 0x0004))
#define LCD_POL                      (*(volatile U32 *)(LCDC_BASE_ADDR   + 0x0008))
#define LCD_LE                       (*(volatile U32 *)(LCDC_BASE_ADDR   + 0x000C))
#define LCD_UPBASE                   (*(volatile U32 *)(LCDC_BASE_ADDR   + 0x0010))
#define LCD_CTRL                     (*(volatile U32 *)(LCDC_BASE_ADDR   + 0x0018))
#define LCD_INTMSK                   (*(volatile U32 *)(LCDC_BASE_ADDR   + 0x001C))


#define LCD_PAL_ADDR                                             (LCDC_BASE_ADDR   + 0x0200)

#define MAC_MODULEID                 (*(volatile U32 *)(0xFFE00FFC))  // MAC ID register



//
// System Control Block(SCB) modules include Memory Accelerator Module,
// Phase Locked Loop, VPB divider, Power Control, External Interrupt,
// Reset, and Code Security/Debugging
//
#define SCB_BASE_ADDR	0xE01FC000
/* Power Control */
#define PCON                         (*(volatile U32 *)(SCB_BASE_ADDR + 0x0C0))
#define PCONP                        (*(volatile U32 *)(0xE01FC0C4))

//
// On LPC23xx, the names are USBClkCtrl and USBClkSt; on LPC24xx, the names are
// OTG_CLK_CTRL and OTG_CLK_STAT respectively.
//
#define USBOTG_CLK_BASE_ADDR	0xFFE0CFF0
#define OTG_CLK_CTRL                 (*(volatile U32 *)(USBOTG_CLK_BASE_ADDR + 0x04))
#define OTG_CLK_STAT                 (*(volatile U32 *)(USBOTG_CLK_BASE_ADDR + 0x08))

#define EXTINT                       (*(volatile U32 *)(0xE01FC140))
#define EXTMODE                      (*(volatile U32 *)(0xE01FC148))

#define INT_INDEX_USB  22

/*	register PCONP */
#define PCUSB 	                      ((U32)1<<31) /* USB interface power/clock 0 */

/* USB PIN selection masks */

/*** PINSEL0 ***/
#define PS0_P012_USB_PPWR2      (1 << 24)    /*Port Power enable signal for USB port 2. */
#define PS0_P013_USB_UP_LED2    (1 << 26)    /* USB port 2 GoodLink LED indicator.
                                                It is LOW when device is configured (non-control endpoints enabled).
                                                It is HIGH when the device is not configured or during global suspend.
                                           */
#define PS0_P014_USB_HSTEN2     (1 << 28)    /* Host Enabled status for USB port 2.*/
#define PS0_P014_USB_CONN2      (2 << 28)    /* USB device SoftConnect control for USB port 2.*/

/*** PINSEL1 ***/
#define PS1_P029_USB_DP1        (1 << 26)         /* USB port 1 bidirectional D+ line. */
#define PS1_P030_USB_DM1        (1 << 28)         /* USB port 1 bidirectional D-line, USB DM2 has an own pin! */
#define PS1_P031_USB_DP2        (1 << 30)         /* USB port 2 bidirectional D+ Line*/

/*** PINSEL3 ***/
#define PS3_P118_USB_UP_LED1    (1 <<  4)       /* USB port 1 GoodLink LED indicator. It is LOW when device is configured (non-control endpoints enabled).*/
#define PS3_P119_USB_TX_E1      (1 <<  6)     /* Transmit Enable signal for USB port 1 (OTG transceiver). */
#define PS3_P119_USB_PPWR1      (2 <<  6)     /* Port Power enable signal for USB port 1. */
/***** OTG TRANCEIVER and Port 1 Power Overcurrent ****/
#define PS3_P120_USB_TX_DP1     (1 <<  8)           /* D+ transmit data for USB port 1 (OTG transceiver). */
#define PS3_P121_USB_TX_DM1     (1 << 10)          /* D- transmit data for USB port 1 (OTG transceiver).*/
#define PS3_P122_USB_RCV1       (1 << 12)            /* Differential receive data for USB port 1 (OTG transceiver). */
#define PS3_P122_USB_PWRD1      (2 << 12)            /* Power Status for USB port 1 (host power switch). */
#define PS3_P123_USB_RX_DP1     (1 << 14)          /* D+ receive data for USB port 1 (OTG transceiver). */
#define PS3_P124_USB_RX_DM1     (1 << 16)          /*D- receive data for USB port 1 (OTG transceiver).*/
#define PS3_P125_USB_LS1        (1 << 18)           /* Low-speed status for USB port 1 (OTG transceiver). */
#define PS3_P125_USB_HSTEN1     (2 << 18)           /* Low-speed status for USB port 1 (OTG transceiver). */
#define PS3_P126_USB_SSPND1     (1 << 20)           /*USB port 1 Bus Suspend status (OTG transceiver). */
#define PS3_P127_USB_INT1       (1 << 22)            /* USB port 1 OTG ATX interrupt (OTG transceiver). */
#define PS3_P127_USB_OVRCR1     (2 << 22)           /* USB port 1 Over-Current status. */
#define PS3_P128_USB_SCL1       (1 << 24)            /* USB port 1 Over-Current status. */
#define PS3_P129_USB_SDA1       (1 << 26)            /* USB port 1 I2C serial data (OTG transceiver). */
/***** Port 2 Power Overcurrent ****/
#define PS3_P130_USB_PWRD2      (1 << 28)      /* Power Status for USB port 2. */
#define PS3_P130_USB_VBUS       (2 << 28)      /* Indicates the presence of USB bus power. */
#define PS3_P131_USB_OVECR2     (1 << 30)      /* Over-Current status for USB port 2. */

//
// USB clock control
// USBClkCtrl reg. OTG clock control register,
// also referred as OTG clock control register!!!	
//
#define USB_HOST_CLK_EN	(1<<0)
#define USB_DEV_CLK_EN	(1<<1)
#define USB_I2C_CLK_EN	(1<<2)
#define USB_OTG_CLK_EN	(1<<3)
#define USB_AHB_CLK_EN	(1<<4)


/* PIN mode register values */

#define PIN_MODE_PULL_UP   0
#define PIN_MODE_NO_PULLS  2
#define PIN_MODE_PULL_DOWN 3
#define PIN_MODE_MASK      3

#define PINMODE_GET_0_TO_15(PIN_NUMBER,PIN_MODE)     ((PIN_MODE) << PIN_NUMBER)
#define PINMODE_GET_16_TO_31(PIN_NUMBER,PIN_MODE)    ((PIN_MODE) << (PIN_NUMBER-16))


/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
static OS_TIMER _TouchTimer;
static U32      _VRAMAddr;

/*********************************************************************
*
*       Static functions
*
**********************************************************************
*/

/*********************************************************************
*
*       _Delay()
*/
static void _Delay(int ms) {
  volatile int i;

  for (i = 0; i < (50 * ms); i++) {}  // Delay of x * 1ms
}

/*********************************************************************
*
*       _SetLEDState()
*/
static void _SetLEDState(unsigned char LED, unsigned char State) {
  U8  acCommandString[2] = {0x08, 0x00};
  U8  Reg;

  if (LED > 7) {
    return;
  }
  //
  // Adjust address if LED >= 5
  //
  if (LED >= 4) {
    acCommandString[0] = 0x09;
  }
  //
  // Read current register value
  //
  OS_IncDI();
  I2CPCA9532_WriteRead(acCommandString, 1, &Reg, 1);
  OS_DecRI();
  //
  // Set new LED state
  //
  if (LED >= 4) {
    LED -= 4;  // Address was already corrected above
  }
  if (State == LED_SET) {
    Reg |= (1 << (LED * 2)); //0x01;
  } else if (State == LED_TOGGLE) {
    if (Reg & (1 << (LED * 2))) {
      Reg &= ~(1 << (LED * 2));
    } else {
      Reg |= (1 << (LED * 2));
    }
  } else {
    Reg &= ~(1 << (LED * 2));
  }
  acCommandString[1] = Reg;
  OS_IncDI();
  I2CPCA9532_WriteRead(acCommandString, sizeof(acCommandString), 0, 0);
  OS_DecRI();
}
/*********************************************************************
*
*       _LCD_HW_Init()
*/
static void _LCD_HW_Init(void) {
  PCONP   |= (1 << 20);   // Enable peripheral clock for LCDC
  //
  // Turn on LCD power
  //
  FIO2DIR |= (1 << 0);
  FIO2SET  = (1 << 0);

  //
  // Set P1.18 as PWM output
  //
  PINSEL3 &= ~(0x3 << 4);  // Clear P1[18]
  PINSEL3 |= (1 << 5);     // PWM1[1]
  PWM1PR  = 0x00;          // No prescaling
  PWM1MCR = (1 << 1);      // Reset counter if MR0 match
  PWM1MR0 = 0x3000;        // Period time equal about 5 ms
  PWM1MR1 = 0x00;
  PWM1LER = 0
            | (1 << 0)     // Latch MR0
            | (1 << 1)     // Latch MR1
            ;
  PWM1PCR = (1 << 9);      // Enable PWMENA1
  PWM1TCR = 0
            | (1 << 0)     // Enable counter
            | (1 << 3)     // Enable PWM
            ;
  //
  // Init SPI0
  //
  PINSEL0 |= (0x3uL << 30);   // SCK
  PINSEL1 |= (0
              | (0x3 << 2)  // SSEL
              | (0x3 << 4)  // MOSI
             );
  IO0DIR  |= (0
              | (1 << 16)
              | (1 << 19)
             );
  IO0SET   =  0
              | (1 << 16)
              | (1 << 19)
              ;
  S0SPCCR  =  0xC;          // SPI0 clock counter setting
  S0SPCR   =  0
              | (1 << 3)    // Clock phase control, data is sampled on second clock edge of SCK
              | (1 << 4)    // CPOL, SCK is active low
              | (1 << 5)    // MSTR, SPI operates in master mode
              ;
  PINSEL10 = 0x00;
  PINSEL0  = (PINSEL0 & 0xFFF000FF)
             | (1 <<  8)    // I2SRX_CLK  / LCDVD[0]
             | (1 << 10)    // I2SRX_WS   / LCDVD[1]
             | (1 << 12)    // I2SRX_SDA  / LCDVD[8]
             | (1 << 14)    // I2STX_CLK  / LCDVD[9]
             | (1 << 16)    // I2STX_WS   / LCDVD[16]
             | (1 << 18)    // I2STX_SDA  / LCDVD[17]
             ;
  PINSEL3  = (PINSEL3 & 0xF00000FF)
             | (1 <<  8)    // USB_TX_DP1 / LCDVD[6]  / LCDVD[10]
             | (1 << 10)    // USB_TX_DM1 / LCDVD[7]  / LCDVD[11]
             | (1 << 12)    // USB_RCV1   / LCDVD[8]  / LCDVD[12]
             | (1 << 14)    // USB_RX_DP1 / LCDVD[9]  / LCDVD[13]
             | (1 << 16)    // USB_RX_DM1 / LCDVD[10] / LCDVD[14]
             | (1 << 18)    // USB_LS1    / LCDVD[11] / LCDVD[15]
             | (1 << 20)    // USB_SSPND1 / LCDVD[12] / LCDVD[20]
             | (1 << 22)    // USB_INT1   / LCDVD[13] / LCDVD[21]
             | (1 << 24)    // USB_SCL1   / LCDVD[14] / LCDVD[22]
             | (1 << 26)    // USB_SDA1   / LCDVD[15] / LCDVD[23]
             ;
  PINSEL4  = (PINSEL4 & 0xF0300000)
             | (0x3 <<  0)  // TRACECLK   / LCDPWR
             | (0x3 <<  2)  // PIPESTAT0  / LCDLE
             | (0x3 <<  4)  // PIPESTAT1  / LCDDCLK
             | (0x3 <<  6)  // PIPESTAT2  / LCDFP
             | (0x3 <<  8)  // TRACESYNC  / LCDENAB   / LCDM
             | (0x3 << 10)  // TRACEPKT0  / LCDLP
             | (0x3 << 12)  // TRACEPKT1  / LCDVD[0]  / LCDVD[4]
             | (0x3 << 14)  // TRACEPKT2  / LCDVD[1]  / LCDVD[5]
             | (0x3 << 16)  // TRACEPKT3  / LCDVD[2]  / LCDVD[6]
             | (0x3 << 18)  // EXTIN0     / LCDVD[3]  / LCDVD[7]
             | (1   << 22)  // EINT1      / LCDCLKIN
             | (1   << 24)  // EINT2      / LCDVD[4]  / LCDVD[3]  / LCDVD[8]  / LCDVD[18]
             | (1   << 24)  // EINT3      / LCDVD[5]  / LCDVD[9]  / LCDVD[19]
             ;
  PINSEL9  = (PINSEL9 & 0xF0FFFFFF)
             | (1 << 25)    // MAT2[0]    / LCDVD[6]  / LCDVD[10] / LCDVD[2]
             | (1 << 27)    // MAT2[1]    / LCDVD[7]  / LCDVD[11] / LCDVD[3]
             ;
  PINSEL11 = 0
             | (1   << 0)   // Enable LCD port
             | (0x3 << 2)   // LCD Mode: TFT 16-bit (1:5:5:5 mode)
             ;
}

/*********************************************************************
*
*       _LCD_SetBacklight()
*/
static void _LCD_SetBacklight(unsigned char Percent) {
  PWM1MR1 = ((unsigned long)0x3000 * (unsigned long)(100 - Percent)) / (unsigned long)100;
  PWM1LER = (1 << 1);
}

/*********************************************************************
*
*       _LCD_Ctrl_Init()
*/
static void _LCD_Ctrl_Init(void) {
  unsigned long* pPal = 0;
  unsigned char  i;

  LCD_CTRL &= 0xFFFFFFFE;  // Disable the display

  // ppl value to set = ppl / 16 -1 (2:7)
  // hsw value to set = hsw - 1     (8:15)
  // hfp value to set = hfp - 1     (16:23)
  // hbp value to set = hbp - 1     (24:31)
  LCD_TIMH   = 0
               | (((240 / 16) - 1) <<  2)  // (Pixels per line / 16) - 1
               | (( 2 - 1)         <<  8)  // Horizontal synchronization pulse width - 1
               | ((10 - 1)         << 16)  // Horizontal front porch - 1
               | ((28 - 1)         << 24)  // Horizontal back porch  - 1
               ;
  LCD_TIMV   = 0
               | ((320 - 1)        <<  0)  // Lines per panel - 1
               | ((  2 - 1)        << 10)  // Vertical synchronization pulse width - 1
               | ((  2 - 1)        << 16)  // Vertical front porch
               | ((  3 - 1)        << 24)  // Vertical back porch
               ;
  LCD_POL    = 0
               | (( 13 - 2) <<  0)  // Lower five bits of panel clock divisor
               |         (1 << 11)  // Invert vertical synchronization
               |         (1 << 12)  // Invert horizontal synchronization
               |         (1 << 13)  // Invert panel clock
               | ((240 - 1) << 16)  // Clocks per line = (Pixels per line / 1) - 1
               ;
  LCD_LE     = 0x00;                // skip line end control
  LCD_INTMSK = 0;                   // Disable interrupts
  LCD_CTRL   = 0
               | (0x06 << 1)        // 16 bits per pixel
               | (   1 << 5)        // TFT
               ;
  //
  // Clear palette
  //
  pPal = (unsigned long*)LCD_PAL_ADDR;
  for (i = 0; i < 128; i++) {
    *pPal++ = 0;
  }
  LCD_CFG = 0x00;  // 0 = Divide by 1
  _Delay(20);
}

/*********************************************************************
*
*       _SPI_Send()
*/
static void _SPI_Send(unsigned char Data) {
  unsigned long Failsafe = 0;

  S0SPDR = Data;
  while (((S0SPSR & 0x80) == 0) && (Failsafe < 5000)) {  // while (SPI Transfer active)
    Failsafe++;
  }
  if (Failsafe >= 5000) {
    S0SPCCR = 0x08;  // SPI0 clock counter setting
    S0SPCR  = 0
             | (1 << 3)  // Clock phase control, data is sampled on second clock edge of SCK
             | (1 << 4)  // CPOL, SCK is active low
             | (1 << 5)  // MSTR, SPI operates in master mode
             ;
  }
}

/*********************************************************************
*
*       _LCD_WriteToReg()
*/
static void _LCD_WriteToReg(unsigned short Addr, unsigned short Data) {
  IO0CLR = (1 << 19);  // RESET_RS
  IO0CLR = (1 << 16);  // ACTIVATE_CS
  _SPI_Send(0);
  _SPI_Send(Addr);
  IO0SET = (1 << 16);  // DEACTIVATE_CS
  IO0SET = (1 << 19);  // SET_RS
  IO0CLR = (1 << 16);  // ACTIVATE_CS
  _SPI_Send(Data >> 8);
  _SPI_Send(Data & 0xFF);
  IO0SET = (1 << 16);  // DEACTIVATE_CS
  IO0CLR = (1 << 19);  // RESET_RS
  IO0CLR = (1 << 16);  // ACTIVATE_CS
  _SPI_Send(0);
  _SPI_Send(0x22);
  IO0SET = (1 << 16);  // DEACTIVATE_CS
}

/*********************************************************************
*
*       _LCD_DisplayInit()
*/
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

/*********************************************************************
*
*       _LCD_TurnOn()
*/
static void _LCD_TurnOn(void) {
  LCD_CTRL |= (0
               | (1 <<  0)  // Enable LCD
               | (1 << 11)  // Power On
              );
  _Delay(50);
  _LCD_DisplayInit();
  _LCD_SetBacklight(100);
}

/*********************************************************************
*
*       _ExecTouch()
*/
static void _ExecTouch(void) {
    GUI_TOUCH_Exec();
    OS_RetriggerTimer(&_TouchTimer);
}

/*********************************************************************
*
*       _TouchInit()
*/
static void _TouchInit(void) {
  PINSEL0     |= 0xc0000000;
  PINSEL1     |= 0x0000003c;
  IO0DIR      |= CS_PIN;
  IO0SET       = CS_PIN;
  SPI_S0SPCCR  = 57;
  SPI_S0SPCR   = 0x38;
}

/*********************************************************************
*
*       _Align
*/
static void * _Align(void * pMem, U32 NumBytes) {
 U32 Addr;
 Addr = (U32)pMem;
 NumBytes -= 1;
 Addr += NumBytes;
 Addr &= ~NumBytes;
 return (void*)Addr;
}

/*********************************************************************
*
*       _SetDisplayOrigin()
*/
static void _SetDisplayOrigin(int x, int y) {
  //
  // Set start address for display data and enable LCD controller
  //
  LCD_UPBASE  = (unsigned long) _VRAMAddr + (y * XSIZE_PHYS * PIXEL_WIDTH);   // Needs to be set, before LCDC is enabled
}

/*********************************************************************
*
*       Global functions
*
**********************************************************************
*/

/*********************************************************************
*
*       BSP_ETH_Init()
*/
void BSP_ETH_Init(unsigned Unit) {

  /*------------------------------------------------------------------------------
  * write to PINSEL2/3 to select the PHY functions on P1[17:0]
  *-----------------------------------------------------------------------------*/
  /* P1.6, ENET-TX_CLK, has to be set for EMAC to address a BUG in
  the rev"xx-X" or "xx-Y" silicon(see errata). On the new rev.(xxAY, released
  on 06/22/2007), P1.6 should NOT be set. */
  if (MAC_MODULEID == 0x39022000) {  // Older chip ?
    PINSEL2 = 0x50151105;            // selects P1[0,1,4,6,8,9,10,14,15]
  } else {
    PINSEL2 = 0x50150105;            // selects P1[0,1,4,8,9,10,14,15]
  }
  PINSEL3 = (PINSEL3 & ~0x0000000f) | 0x5;
}

/*********************************************************************
*
*       BSP_ETH_InstallISR()
*/
void BSP_ETH_InstallISR(void (*pfISR)(void)) {
  OS_ARM_InstallISRHandler(INT_INDEX_MAC, pfISR);     // Timer/counter interrupt vector.
  OS_ARM_EnableISR(INT_INDEX_MAC);                    // Enable timer/counter 0 interrupt.
  OS_ARM_ISRSetPrio(INT_INDEX_MAC, 15);               // lowest priority
}

/*********************************************************************
*
*       BSP_Init()
*/
void BSP_Init(void) {
  //
  // Init I2C
  //
  I2CPCA9532_Init();
}

/*********************************************************************
*
*       LED switching routines
*/
void BSP_SetLED(int Index) {
  _SetLEDState(Index, LED_SET);
}

void BSP_ClrLED(int Index) {
  _SetLEDState(Index, LED_CLR);
}

void BSP_ToggleLED(int Index) {
  _SetLEDState(Index, LED_TOGGLE);
}

/*********************************************************************
*
*       _InitLCDController
*
* Function description:
*   Initializes the display controller
*/
static void _InitLCDController(unsigned LayerIndex) {
  U32 TouchOrientation;

  //
  // Calibrate touch
  //
  TouchOrientation = (GUI_MIRROR_X * LCD_GetMirrorXEx(0)) |
                     (GUI_MIRROR_Y * LCD_GetMirrorYEx(0)) |
                     (GUI_SWAP_XY  * LCD_GetSwapXYEx (0)) ;
  GUI_TOUCH_SetOrientation(TouchOrientation);
  GUI_TOUCH_Calibrate(GUI_COORD_X, 0, 240, TOUCH_AD_TOP , TOUCH_AD_BOTTOM);  // x axis
  GUI_TOUCH_Calibrate(GUI_COORD_Y, 0, 320, TOUCH_AD_LEFT, TOUCH_AD_RIGHT);   // y axis
  //
  // LCD Init
  //
  _VRAMAddr = (U32)_Align((void *)VRAM_ADDR, 8);
  _LCD_HW_Init();
  _LCD_SetBacklight(0);
  _LCD_Ctrl_Init();
  LCD_UPBASE = _VRAMAddr;
  _LCD_TurnOn();
  //
  // Setup LCD touch
  //
  _TouchInit();
  OS_CREATETIMER(&_TouchTimer, _ExecTouch, TOUCHTIMERINTERVAL);
}

/*********************************************************************
*
*       LCD_X_DisplayDriver
*
* Purpose:
*   This function is called by the display driver for several purposes.
*   To support the according task the routine needs to be adapted to
*   the display controller. Please note that the commands marked with
*   'optional' are not cogently required and should only be adapted if
*   the display controller supports these features.
*
* Parameter:
*   LayerIndex - Index of layer to be configured
*   Cmd        - Please refer to the details in the switch statement below
*   pData      - Pointer to a LCD_X_DATA structure
*/
int LCD_X_DisplayDriver(unsigned LayerIndex, unsigned Cmd, void * pData) {
  LCD_X_SETORG_INFO * pSetOrg;

  switch (Cmd) {
  //
  // Required
  //
  case LCD_X_INITCONTROLLER:
    //
    // Called during the initialization process in order to set up the
    // display controller and put it into operation. If the display
    // controller is not initialized by any external routine this needs
    // to be adapted by the customer...
    //
    _InitLCDController(LayerIndex);
    break;
  case LCD_X_SETORG:
    //
    // Required for setting the display origin which is passed in the 'xPos' and 'yPos' element of p
    //
    pSetOrg = (LCD_X_SETORG_INFO *)pData;
    _SetDisplayOrigin(pSetOrg->xPos, pSetOrg->yPos);
  }
  return 0;
}

/*********************************************************************
*
*       LCD_X_Config
*
* Purpose:
*   Called during the initialization process in order to set up the
*   display driver configuration.
*
*/
void LCD_X_Config(void) {
  _VRAMAddr = (U32)_Align((void *)VRAM_ADDR, 8);
  //
  // Set display driver and color conversion for 1st layer
  //
  GUI_DEVICE_CreateAndLink(&DISPLAY_DRIVER, COLOR_CONVERSION, 0, 0);
  //
  // Display driver configuration, required for Lin-driver
  //
  LCD_SetSizeEx    (0, XSIZE_PHYS,   YSIZE_PHYS);
  LCD_SetVSizeEx   (0, VXSIZE_PHYS,  VYSIZE_PHYS);
  LCD_SetVRAMAddrEx(0, (void *)_VRAMAddr);
  //
  // Set user palette data (only required if no fixed palette is used)
  //
  #if defined(PALETTE)
    LCD_SetLUTEx(0, PALETTE);
  #endif
}

/*********************************************************************
*
*       BSP_USBH_InstallISR
*/
void BSP_USBH_InstallISR(void (*pfISR)(void)) {
  OS_ARM_InstallISRHandler(INT_INDEX_USB, pfISR);     // Timer/counter interrupt vector.
  OS_ARM_EnableISR(INT_INDEX_USB);                    // Enable timer/counter 0 interrupt.
  OS_ARM_ISRSetPrio(INT_INDEX_USB, 2);               // lowest priority
}

/*********************************************************************
*
*       BSP_USBH_Init
*
*   Function description
*     Initialize the USB host part of the USB module
*     The pins are shown configured:
*       PINSEL0
*         P0.12 /USB_PPWR2
*         P0.13 USP_UP_LED2
*         P0.14 /USB_HSTEN2  /USB_CONN
*       PINSEL1
*         P0.29 USB_D+1
*         P0.30 USB_D-1
*         P0.31 USB_D+2
*       PINSEL3
*         P1.18 USB_UP_LED1
*         P1.19 USB_TX_E1 /USB_PPWR1
*         P1.20 USB_TX_DP1
*         P1.21 USB_TX_DM1
*         P1.22 USB_RCV1
*         P1.23 USB_RX_DP1
*         P1.24 USB_RX_DM1
*         P1.25 USB_LS1 /USB_HSTEN1
*         P1.26 /USB_SSPND1
*         P1.27 /USB_INT1 /USB_OVRCRT1
*         P1.28 USB_SCL1
*         P1.29 USB_SDA1
*         P1.30 USB_PWRD2 VBUS
*         P1.31 /USB_OVRCR2
*
*/
void BSP_USBH_Init(void) {
  //
  // power the USB block
  //
  PCONP |= PCUSB;
  //
  // Enable USB host and USB OTG clock
  //
  OTG_CLK_CTRL  |= USB_HOST_CLK_EN | USB_OTG_CLK_EN | USB_AHB_CLK_EN;
  while( (OTG_CLK_STAT & (USB_HOST_CLK_EN | USB_OTG_CLK_EN | USB_AHB_CLK_EN)) != (USB_HOST_CLK_EN | USB_OTG_CLK_EN | USB_AHB_CLK_EN));
	//
  // Configure the pins for port1 OTG
	// The USB device is connected to port 1 	
	// port2 Host port
	// P0.12    = USB-2:PORT_PWRn
	// P0.13    = USB-2:LEDn
	// P0.13    = USB-2:HostEN2 enable the 15k pull downs, static +5V
	// P0.15 = GPIO
  //
	PINSEL0 |= PS0_P012_USB_PPWR2 | PS0_P013_USB_UP_LED2;
	//
  // if P0.14 does not correct switch disable P0.14 function
  //  configure P014 as GPIO Output */
	IO0DIR |= (1 << 14); /* P0.14 is an output */
	IO0CLR  = (1 << 14); /* P0.14 is 0, enabling the pull-downs */
	//		
	// P0.29 = USB1:D+
  // P0.30 = USB1:D-
  // P0.31 = USB2:D+
  //
	PINSEL1 |= PS1_P029_USB_DP1 | PS1_P030_USB_DM1 | PS1_P031_USB_DP2;
	PINSEL3 |= PS3_P118_USB_UP_LED1 // P1.18 = USBOTG:LEDn
          |  PS3_P130_USB_PWRD2		// P1.30 = USB2:POWEREDn
          |  PS3_P131_USB_OVECR2;	// P1.31 = USB2:OVR_CRNTn

  /* In all configurations,
     disable the pull ups on P1.27 (OTG interrupt input)
     and P1.30 (Host Port 2 Power status)
  */
  PINMODE3 &=~ (PINMODE_GET_16_TO_31(27,PIN_MODE_MASK)
						   | PINMODE_GET_16_TO_31(30,PIN_MODE_MASK) );
  PINMODE3 |= PINMODE_GET_16_TO_31(27,PIN_MODE_NO_PULLS)
  					  | PINMODE_GET_16_TO_31(30,PIN_MODE_NO_PULLS);
}


/*************************** End of file ****************************/
