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
File    : I2C_PCA9532.c
Purpose : I2C interface for PCA9532
--------  END-OF-HEADER  ---------------------------------------------
*/

#include "I2CPCA9532.h"

/*********************************************************************
*
*       Defines
*
**********************************************************************
*/

/* I2C return codes */
#define I2C_CODE_OK       (0)
#define I2C_CODE_DATA     (1)
#define I2C_CODE_RTR      (2)
#define I2C_CODE_ERROR    (3)
#define I2C_CODE_FULL     (4)
#define I2C_CODE_EMPTY    (5)
#define I2C_CODE_BUSY     (6)

/* I2C modes */
#define I2C_MODE_ACK0     (0)
#define I2C_MODE_ACK1     (1)
#define I2C_MODE_READ     (2)


/****** Addresses of sfrs and peripheral identifiers ****************/
#define PINSEL_BASE_ADDR  (0xE002C000)
#define I2C0_BASE_ADDR    (0xE001C000)

#if 0
#define FIO_BASE_ADDR     (0x3FFFC000)
#define PWM1_BASE_ADDR    (0xE0018000)
#define SPI0_BASE_ADDR    (0xE0020000)
#define IO_BASE_ADDR      (0xE0028000)
#define LCDC_BASE_ADDR    (0xFFE10000)
#endif

/****** SFRs and identifiers used for LED demo **********************/
#define PINSEL1           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0004))

#define I20CONSET         (*(volatile unsigned long *)(I2C0_BASE_ADDR   + 0x0000))
#define I20STAT           (*(volatile unsigned long *)(I2C0_BASE_ADDR   + 0x0004))
#define I20DAT            (*(volatile unsigned long *)(I2C0_BASE_ADDR   + 0x0008))
#define I20ADR            (*(volatile unsigned long *)(I2C0_BASE_ADDR   + 0x000C))
#define I20SCLH           (*(volatile unsigned long *)(I2C0_BASE_ADDR   + 0x0010))
#define I20SCLL           (*(volatile unsigned long *)(I2C0_BASE_ADDR   + 0x0014))
#define I20CONCLR         (*(volatile unsigned long *)(I2C0_BASE_ADDR   + 0x0018))



#if 0
#define PINSEL0           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0000))
#define PINSEL2           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0008))
#define PINSEL3           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x000C))
#define PINSEL4           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0010))
#define PINSEL9           (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0024))
#define PINSEL10          (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0028))
#define PINSEL11          (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x002C))


#define FIO2DIR           (*(volatile unsigned long *)(FIO_BASE_ADDR    + 0x0040))
#define FIO2SET           (*(volatile unsigned long *)(FIO_BASE_ADDR    + 0x0058))

#define PWM1TCR           (*(volatile unsigned long *)(PWM1_BASE_ADDR   + 0x0004))
#define PWM1PR            (*(volatile unsigned long *)(PWM1_BASE_ADDR   + 0x000C))
#define PWM1MCR           (*(volatile unsigned long *)(PWM1_BASE_ADDR   + 0x0014))
#define PWM1MR0           (*(volatile unsigned long *)(PWM1_BASE_ADDR   + 0x0018))
#define PWM1MR1           (*(volatile unsigned long *)(PWM1_BASE_ADDR   + 0x001C))
#define PWM1PCR           (*(volatile unsigned long *)(PWM1_BASE_ADDR   + 0x004C))
#define PWM1LER           (*(volatile unsigned long *)(PWM1_BASE_ADDR   + 0x0050))

#define S0SPCR            (*(volatile unsigned long *)(SPI0_BASE_ADDR   + 0x0000))
#define S0SPSR            (*(volatile unsigned long *)(SPI0_BASE_ADDR   + 0x0004))
#define S0SPDR            (*(volatile unsigned long *)(SPI0_BASE_ADDR   + 0x0008))
#define S0SPCCR           (*(volatile unsigned long *)(SPI0_BASE_ADDR   + 0x000C))

#define IO0SET            (*(volatile unsigned long *)(IO_BASE_ADDR     + 0x0004))
#define IO0DIR            (*(volatile unsigned long *)(IO_BASE_ADDR     + 0x0008))
#define IO0CLR            (*(volatile unsigned long *)(IO_BASE_ADDR     + 0x000C))

#define LCD_CFG           (*(volatile unsigned long *)(0xE01FC1B8))

#define LCD_TIMH          (*(volatile unsigned long *)(LCDC_BASE_ADDR   + 0x0000))
#define LCD_TIMV          (*(volatile unsigned long *)(LCDC_BASE_ADDR   + 0x0004))
#define LCD_POL           (*(volatile unsigned long *)(LCDC_BASE_ADDR   + 0x0008))
#define LCD_LE            (*(volatile unsigned long *)(LCDC_BASE_ADDR   + 0x000C))
#define LCD_UPBASE        (*(volatile unsigned long *)(LCDC_BASE_ADDR   + 0x0010))
#define LCD_CTRL          (*(volatile unsigned long *)(LCDC_BASE_ADDR   + 0x0018))
#define LCD_INTMSK        (*(volatile unsigned long *)(LCDC_BASE_ADDR   + 0x001C))

#define PCONP             (*(volatile unsigned long *)(0xE01FC0C4))

#define LCD_PAL_ADDR                                  (LCDC_BASE_ADDR   + 0x0200)

#define MAC_MODULEID      (*(volatile unsigned long *)(0xFFE00FFC))  // MAC ID register
#endif
/*********************************************************************
*
*       Static functions
*
**********************************************************************
*/

/*********************************************************************
*
*       _I2C_CheckStatus()
*
*  Purpose: Checks the I2C status
*
*  Return:
*    0x00 Bus error
*    0x08 START condition transmitted
*    0x10 Repeated START condition transmitted
*    0x18 SLA + W transmitted, ACK received
*    0x20 SLA + W transmitted, ACK not received
*    0x28 Data byte transmitted, ACK received
*    0x30 Data byte transmitted, ACK not received
*    0x38 Arbitration lost
*    0x40 SLA + R transmitted, ACK received
*    0x48 SLA + R transmitted, ACK not received
*    0x50 Data byte received in master mode, ACK transmitted
*    0x58 Data byte received in master mode, ACK not transmitted
*    0x60 SLA + W received, ACK transmitted
*    0x68 Arbitration lost, SLA + W received, ACK transmitted
*    0x70 General call address received, ACK transmitted
*    0x78 Arbitration lost, general call addr received, ACK transmitted
*    0x80 Data byte received with own SLA, ACK transmitted
*    0x88 Data byte received with own SLA, ACK not transmitted
*    0x90 Data byte received after general call, ACK transmitted
*    0x98 Data byte received after general call, ACK not transmitted
*    0xA0 STOP or repeated START condition received in slave mode
*    0xA8 SLA + R received, ACK transmitted
*    0xB0 Arbitration lost, SLA + R received, ACK transmitted
*    0xB8 Data byte transmitted in slave mode, ACK received
*    0xC0 Data byte transmitted in slave mode, ACK not received
*    0xC8 Last byte transmitted in slave mode, ACK received
*    0xF8 No relevant status information, SI=0
*    0xFF Channel error
*
*  Note:
*    SI flag is not cleared!
*/
static unsigned char _I2C_CheckStatus(void) {
  unsigned char r = 0;

  //
  // Wait for I2C status to change
  //
  while ((I20CONSET & (1 << 3)) == 0) {  // SI == 0
  }
  //
  // Read I2C state
  //
  r = I20STAT;

  return r;
}

/*********************************************************************
*
*       _I2C_Start()
*/
static char _I2C_Start(void) {
  unsigned char Status = 0;
  unsigned char r      = 0;

  //
  // Issue start condition
  //
  I20CONSET |= (1 << 5);  // STA = 1, set start flag
  //
  // Wait until START transmitted
  //
  while(1) {
    Status = _I2C_CheckStatus();
    //
    // Check if start transmitted
    //
    if ((Status == 0x08) || (Status == 0x10)) {
      r = I2C_CODE_OK;
      break;
    } else if (Status != 0xF8) {  // Error
      r = Status;
      break;
    } else {
      I20CONCLR = (1 << 3);      // Clear SI flag
    }
  }
  I20CONCLR = (1 << 5);          // Clear start flag

  return r;
}

/*********************************************************************
*
*       _I2C_PutChar()
*
*  Description:
*    Sends a character on the I2C network
*
*  Return:
*    I2C_CODE_OK   - successful
*    I2C_CODE_BUSY - data register is not ready -> byte was not sent
*/
static unsigned  char _I2C_PutChar(unsigned char Data) {
  unsigned char r = 0;

  /* check if I2C Data register can be accessed */
  if ((I20CONSET & (1 << 3)) != 0) {  // SI = 1
    //
    // Send data
    //
    I20DAT    = Data;
    I20CONCLR = (1 << 3);  // Clear SI flag
    r         = I2C_CODE_OK;
  } else {
    r = I2C_CODE_BUSY;  // Data register not ready
  }

  return r;
}

/*********************************************************************
*
*       _I2C_WaitTransmit()
*/
static unsigned char _I2C_WaitTransmit(void) {
  unsigned char Status = 0;

  //
  // Wait till data transmitted
  //
  while(1) {
    Status = _I2C_CheckStatus();
    //
    // SLA+W transmitted, ACK received or
    // data byte transmitted, ACK received
    //
    if ((Status == 0x18) || (Status == 0x28)) {
      return I2C_CODE_OK;  // Data transmitted and ACK received
    } else if (Status != 0xF8) {
      return I2C_CODE_ERROR;  // Error, no relevant status information
    }
  }
}

/*********************************************************************
*
*       _I2C_WriteWithWait()
*/
static unsigned char _I2C_WriteWithWait(unsigned char Data) {
  unsigned char r = 0;

  r = _I2C_PutChar(Data);
  while(r == I2C_CODE_BUSY) {
    r = _I2C_PutChar(Data);
  }
  if(r == I2C_CODE_OK)
    r = _I2C_WaitTransmit();

  return r;
}

/*********************************************************************
*
*       _I2C_Stop()
*
*  Purpose:
*    Generates a stop condition in master mode or recovers from an error
*    condition in slave mode.
*
*  Note: After this function is run, you may need a bus free time before
*        you can generate a new start condition.
*
*/
static void _I2C_Stop(void) {
  I20CONSET |= (1 << 4);  // STO = 1, set stop flag
  I20CONCLR  = (1 << 3);  // Clear SI flag
  while (I20CONSET & (1 << 4)) {  // Wait till STOP detected (while STO = 1)
  }
}

/*********************************************************************
*
*       _I2C_RepeatStart()
*
*  Description:
*    Generates a start condition on I2C when bus is free.
*    Master mode will also automatically be entered.
*
*    Note: After a stop condition, you may need a bus free time before you
*          can generate a new start condition.
*/
static unsigned char _I2C_RepeatStart(void) {
  unsigned char Status = 0;
  unsigned char r      = 0;

  //
  // Issue a start condition
  //
  I20CONSET |= (1 << 5);  // STA = 1, set start flag
  I20CONCLR  = (1 << 3);  // Clear SI flag
  //
  // Wait until START transmitted
  //
  while (1) {
    Status = _I2C_CheckStatus();
    if ((Status == 0x08) || (Status == 0x10)) {
      r = I2C_CODE_OK;  // Start transmitted
      break;
    } else if (Status != 0xF8) {
      r = Status;  // Error
      break;
    } else {
      I20CONCLR = (1 << 3);  // Clear SI flag
    }
  }
  I20CONCLR = (1 << 5);  // Clear start flag

  return r;
}

/*********************************************************************
*
*       _I2C_GetChar()
*
* Description:
*    Read a character. I2C master mode is used.
*    This function is also used to prepare if the master shall generate
*    acknowledge or not acknowledge.
*
*  Parameter:
*    Mode: I2C_MODE_ACK0 Set ACK=0. Slave sends next byte
*          I2C_MODE_ACK1 Set ACK=1. Slave sends last byte
*          I2C_MODE_READ Read data from data register
*/
static unsigned char _I2C_GetChar(unsigned char Mode, unsigned char * pBuf) {
  unsigned char r = I2C_CODE_OK;

  if(Mode == I2C_MODE_ACK0) {
    //
    // Operation mode is changed from master transmit to master receive
    // Set ACK = 0 (informs slave to send next byte)
    //
    I20CONSET |= (1 << 2);  // AA = 1
    I20CONCLR  = (1 << 3);  // Clear SI flag
  } else if (Mode == I2C_MODE_ACK1) {
    I20CONCLR = (1 << 2);   // Set ACK = 1 (informs slave to send last byte)
    I20CONCLR = (1 << 3);   // Clear SI flag
  } else if (Mode == I2C_MODE_READ) {
    //
    // Check if I2C Data register can be accessed
    //
    if (I20CONSET & (1 << 3)) {       // SI = 1
      *pBuf = (unsigned char)I20DAT;  // Read data
    } else {
      r = I2C_CODE_EMPTY;  // No data available
    }
  }

  return r;
}

/*********************************************************************
*
*       Global functions
*
**********************************************************************
*/

/*********************************************************************
*
*       I2C_PCA9532_WriteRead()
*/
unsigned char I2CPCA9532_WriteRead(unsigned char * pData, unsigned short NumBytesToWrite, unsigned char * pBuf, unsigned short NumBytesToRead) {
  unsigned char  r       = 0;
  unsigned char  Status  = 0;
  unsigned short i       = 0;

  r = _I2C_Start();  // Generate Start condition
  if(r != I2C_CODE_OK) {
    goto STOPWRITE;
  }
  r = _I2C_WriteWithWait(0xC0);  // Write PCA9532 address
  if (r != I2C_CODE_OK) {
    goto STOPWRITE;
  }
  //
  // Write data
  //
  for (i = 0; i < NumBytesToWrite; i++) {
    r = _I2C_WriteWithWait(*pData);
    if (r != I2C_CODE_OK) {
      goto STOPWRITE;
    }
    pData++;
  }
STOPWRITE:
  if (NumBytesToRead > 0) {
    r = _I2C_RepeatStart();  // Generate Start condition
    //
    // Transmit device address
    //
    if (r == I2C_CODE_OK) {
      r = _I2C_PutChar(0xc0 + 0x01);  // Write SLA+R
      while(r == I2C_CODE_BUSY) {
        r = _I2C_PutChar(0xc0 + 0x01);
      }
    }
    //
    // Wait until SLA+R transmitted
    //
    while (1) {
      Status = _I2C_CheckStatus();
      if (Status == 0x40) {         // Data transmitted and ACK received
        break;
      } else if (Status != 0xF8) {  // Error
        r = I2C_CODE_ERROR;
        break;
      }
    }
    if (r == I2C_CODE_OK) {
      //
      // Wait until address transmitted and receive data
      //
      for (i = 1; i <= NumBytesToRead; i++) {
        //
        // Wait until data transmitted
        //
        while (1) {
          Status = _I2C_CheckStatus();
          if ((Status == 0x40) || (Status == 0x48) || (Status == 0x50 )) {  // Data received
            //
            // Set generate NACK
            //
            if (i == NumBytesToRead) {
              r = _I2C_GetChar(I2C_MODE_ACK1, pBuf);
            } else {
              r = _I2C_GetChar(I2C_MODE_ACK0, pBuf);
            }
            r = _I2C_GetChar(I2C_MODE_READ, pBuf);  // Read data
            while (r == I2C_CODE_EMPTY) {
              r = _I2C_GetChar(I2C_MODE_READ, pBuf);
            }
            pBuf++;
            break;
          } else if (Status != 0xF8) {  // Error
            i = NumBytesToRead;
            r = I2C_CODE_ERROR;
            break;
          }
        }
      }
    }
  }
  _I2C_Stop();  // Generate Stop condition

  return r;
}

/*********************************************************************
*
*       I2C_PCA9532_Init()
*/
void I2CPCA9532_Init(void) {
  unsigned char InitCommand[] = {0x12, 0x97, 0x80, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00};

  if ((I20CONSET & (1 << 6)) == 0) {  // I2C was not intialized before
    PINSEL1 &= 0
               | (0x3   << 0)  // SSEL
               | (0x3   << 2)  // MISO
               | (0x3   << 4)  // MOSI
               | (0x3   << 6)  // SDA1
               | (0x3   << 8)  // SCL1
               | (0x3   << 10) // RD1
               | (0x3   << 12) // TD1
               | (0x3   << 14) // CAP3[0]
               | (0x3   << 16) // CAP3[1]
               | (0x3   << 18) // TXD3
               | (0x3   << 20) // RXD3
               | (0x3   << 26) // Reserved
               | (0x3   << 28) // Reserved
               | (0x3uL << 30) // Reserved
               ;
    PINSEL1 |= 0
               | (0x1 << 22) // GPIO port 0.27 SDA0
               | (0x1 << 24) // GPIO port 0.28 SCL0
               ;
    //
    // Clear flags
    //
    I20CONCLR = 0
                | (1 << 2)   // AAC,   Assert acknowledge clear bit
                | (1 << 3)   // SIC,   I2C interrupt clear bit
                | (1 << 5)   // STAC,  START flag clear bit
                | (1 << 6)   // I2ENC, I2C interface disable bit
                ;
    //
    // Reset registers
    //
    I20SCLL    = (I20SCLL   & 0xFFFF0000) | 0x00000160;  // SCL Duty Cycle low register
    I20SCLH    = (I20SCLH   & 0xFFFF0000) | 0x000000F0;  // SCL Duty Cycle high register
    I20CONSET |= (1 << 6);                                // I2EN, I2C interface enable bit
    I2CPCA9532_WriteRead(InitCommand, sizeof(InitCommand), 0, 0);
  }
}
