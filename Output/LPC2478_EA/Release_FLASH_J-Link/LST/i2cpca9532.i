#line 1 "Setup\\I2CPCA9532.c"















 

#line 1 "Setup\\I2CPCA9532.h"















 

         void I2CPCA9532_Init     (void);
unsigned char I2CPCA9532_WriteRead(unsigned char * pData, unsigned short NumBytesToWrite, unsigned char * pBuf, unsigned short NumBytesToRead);
#line 19 "Setup\\I2CPCA9532.c"






 

 
#line 35 "Setup\\I2CPCA9532.c"

 





 



#line 53 "Setup\\I2CPCA9532.c"

 


#line 64 "Setup\\I2CPCA9532.c"



#line 113 "Setup\\I2CPCA9532.c"





 







































 
static unsigned char _I2C_CheckStatus(void) {
  unsigned char r = 0;

  
  
  
  while (((*(volatile unsigned long *)((0xE001C000) + 0x0000)) & (1 << 3)) == 0) {  
  }
  
  
  
  r = (*(volatile unsigned long *)((0xE001C000) + 0x0004));

  return r;
}




 
static char _I2C_Start(void) {
  unsigned char Status = 0;
  unsigned char r      = 0;

  
  
  
  (*(volatile unsigned long *)((0xE001C000) + 0x0000)) |= (1 << 5);  
  
  
  
  while(1) {
    Status = _I2C_CheckStatus();
    
    
    
    if ((Status == 0x08) || (Status == 0x10)) {
      r = (0);
      break;
    } else if (Status != 0xF8) {  
      r = Status;
      break;
    } else {
      (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = (1 << 3);      
    }
  }
  (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = (1 << 5);          

  return r;
}











 
static unsigned  char _I2C_PutChar(unsigned char Data) {
  unsigned char r = 0;

   
  if (((*(volatile unsigned long *)((0xE001C000) + 0x0000)) & (1 << 3)) != 0) {  
    
    
    
    (*(volatile unsigned long *)((0xE001C000) + 0x0008))    = Data;
    (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = (1 << 3);  
    r         = (0);
  } else {
    r = (6);  
  }

  return r;
}




 
static unsigned char _I2C_WaitTransmit(void) {
  unsigned char Status = 0;

  
  
  
  while(1) {
    Status = _I2C_CheckStatus();
    
    
    
    
    if ((Status == 0x18) || (Status == 0x28)) {
      return (0);  
    } else if (Status != 0xF8) {
      return (3);  
    }
  }
}




 
static unsigned char _I2C_WriteWithWait(unsigned char Data) {
  unsigned char r = 0;

  r = _I2C_PutChar(Data);
  while(r == (6)) {
    r = _I2C_PutChar(Data);
  }
  if(r == (0))
    r = _I2C_WaitTransmit();

  return r;
}












 
static void _I2C_Stop(void) {
  (*(volatile unsigned long *)((0xE001C000) + 0x0000)) |= (1 << 4);  
  (*(volatile unsigned long *)((0xE001C000) + 0x0018))  = (1 << 3);  
  while ((*(volatile unsigned long *)((0xE001C000) + 0x0000)) & (1 << 4)) {  
  }
}











 
static unsigned char _I2C_RepeatStart(void) {
  unsigned char Status = 0;
  unsigned char r      = 0;

  
  
  
  (*(volatile unsigned long *)((0xE001C000) + 0x0000)) |= (1 << 5);  
  (*(volatile unsigned long *)((0xE001C000) + 0x0018))  = (1 << 3);  
  
  
  
  while (1) {
    Status = _I2C_CheckStatus();
    if ((Status == 0x08) || (Status == 0x10)) {
      r = (0);  
      break;
    } else if (Status != 0xF8) {
      r = Status;  
      break;
    } else {
      (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = (1 << 3);  
    }
  }
  (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = (1 << 5);  

  return r;
}














 
static unsigned char _I2C_GetChar(unsigned char Mode, unsigned char * pBuf) {
  unsigned char r = (0);

  if(Mode == (0)) {
    
    
    
    
    (*(volatile unsigned long *)((0xE001C000) + 0x0000)) |= (1 << 2);  
    (*(volatile unsigned long *)((0xE001C000) + 0x0018))  = (1 << 3);  
  } else if (Mode == (1)) {
    (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = (1 << 2);   
    (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = (1 << 3);   
  } else if (Mode == (2)) {
    
    
    
    if ((*(volatile unsigned long *)((0xE001C000) + 0x0000)) & (1 << 3)) {       
      *pBuf = (unsigned char)(*(volatile unsigned long *)((0xE001C000) + 0x0008));  
    } else {
      r = (5);  
    }
  }

  return r;
}






 




 
unsigned char I2CPCA9532_WriteRead(unsigned char * pData, unsigned short NumBytesToWrite, unsigned char * pBuf, unsigned short NumBytesToRead) {
  unsigned char  r       = 0;
  unsigned char  Status  = 0;
  unsigned short i       = 0;

  r = _I2C_Start();  
  if(r != (0)) {
    goto STOPWRITE;
  }
  r = _I2C_WriteWithWait(0xC0);  
  if (r != (0)) {
    goto STOPWRITE;
  }
  
  
  
  for (i = 0; i < NumBytesToWrite; i++) {
    r = _I2C_WriteWithWait(*pData);
    if (r != (0)) {
      goto STOPWRITE;
    }
    pData++;
  }
STOPWRITE:
  if (NumBytesToRead > 0) {
    r = _I2C_RepeatStart();  
    
    
    
    if (r == (0)) {
      r = _I2C_PutChar(0xc0 + 0x01);  
      while(r == (6)) {
        r = _I2C_PutChar(0xc0 + 0x01);
      }
    }
    
    
    
    while (1) {
      Status = _I2C_CheckStatus();
      if (Status == 0x40) {         
        break;
      } else if (Status != 0xF8) {  
        r = (3);
        break;
      }
    }
    if (r == (0)) {
      
      
      
      for (i = 1; i <= NumBytesToRead; i++) {
        
        
        
        while (1) {
          Status = _I2C_CheckStatus();
          if ((Status == 0x40) || (Status == 0x48) || (Status == 0x50 )) {  
            
            
            
            if (i == NumBytesToRead) {
              r = _I2C_GetChar((1), pBuf);
            } else {
              r = _I2C_GetChar((0), pBuf);
            }
            r = _I2C_GetChar((2), pBuf);  
            while (r == (5)) {
              r = _I2C_GetChar((2), pBuf);
            }
            pBuf++;
            break;
          } else if (Status != 0xF8) {  
            i = NumBytesToRead;
            r = (3);
            break;
          }
        }
      }
    }
  }
  _I2C_Stop();  

  return r;
}




 
void I2CPCA9532_Init(void) {
  unsigned char InitCommand[] = {0x12, 0x97, 0x80, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00};

  if (((*(volatile unsigned long *)((0xE001C000) + 0x0000)) & (1 << 6)) == 0) {  
    (*(volatile unsigned long *)((0xE002C000) + 0x0004)) &= 0
               | (0x3   << 0)  
               | (0x3   << 2)  
               | (0x3   << 4)  
               | (0x3   << 6)  
               | (0x3   << 8)  
               | (0x3   << 10) 
               | (0x3   << 12) 
               | (0x3   << 14) 
               | (0x3   << 16) 
               | (0x3   << 18) 
               | (0x3   << 20) 
               | (0x3   << 26) 
               | (0x3   << 28) 
               | (0x3uL << 30) 
               ;
    (*(volatile unsigned long *)((0xE002C000) + 0x0004)) |= 0
               | (0x1 << 22) 
               | (0x1 << 24) 
               ;
    
    
    
    (*(volatile unsigned long *)((0xE001C000) + 0x0018)) = 0
                | (1 << 2)   
                | (1 << 3)   
                | (1 << 5)   
                | (1 << 6)   
                ;
    
    
    
    (*(volatile unsigned long *)((0xE001C000) + 0x0014))    = ((*(volatile unsigned long *)((0xE001C000) + 0x0014))   & 0xFFFF0000) | 0x00000160;  
    (*(volatile unsigned long *)((0xE001C000) + 0x0010))    = ((*(volatile unsigned long *)((0xE001C000) + 0x0010))   & 0xFFFF0000) | 0x000000F0;  
    (*(volatile unsigned long *)((0xE001C000) + 0x0000)) |= (1 << 6);                                
    I2CPCA9532_WriteRead(InitCommand, sizeof(InitCommand), 0, 0);
  }
}
