/*********************************************************************
*               SEGGER MICROCONTROLLER SYSTEME GmbH                  *
*       Solutions for real time microcontroller applications         *
**********************************************************************
*                                                                    *
*       (C) 2006   SEGGER Microcontroller Systeme GmbH               *
*                                                                    *
*       www.segger.com     Support: support@segger.com               *
*                                                                    *
**********************************************************************

----------------------------------------------------------------------
File    : I2CPCA9532.h
Purpose : I2C PCA9532 header
--------  END-OF-HEADER  ---------------------------------------------
*/

         void I2CPCA9532_Init     (void);
unsigned char I2CPCA9532_WriteRead(unsigned char * pData, unsigned short NumBytesToWrite, unsigned char * pBuf, unsigned short NumBytesToRead);
