#line 1 "Util\\JLINKDCC_Process.c"




































































































 

#line 1 "Inc\\JLINKDCC.h"















 






void JLINKDCC_Process(void);
void JLINKDCC_HandleDataAbort(void);
void JLINKDCC_SendString(const char * s);
void JLINKDCC_SendChar(char c);
void JLINKDCC_SendOnChannel      (unsigned Channel, unsigned char* pData, int NumItems);
void JLINKDCC_SetpfOnRx          (unsigned Channel, void          (* pf)(unsigned Channel, unsigned char c));
void JLINKDCC_SetpfOnTx          (unsigned Channel, void          (* pf)(unsigned Channel));
void JLINKDCC_SendCharOnChannelNB(unsigned Channel, unsigned char Data);



 

#line 104 "Util\\JLINKDCC_Process.c"





   
  extern unsigned long CP14_ReadDCCStat(void);
  extern unsigned long CP14_ReadDCC(void);
  extern void CP14_WriteDCC(unsigned long Data);







 









 





#line 145 "Util\\JLINKDCC_Process.c"












 

unsigned char JLINKDCC_IsInHandler;
unsigned char JLINKDCC_AbortOccurred;






 

void (* _pfOnRx[2]) (unsigned Channel, unsigned char Data);
void (* _pfOnTx[2]) (unsigned Channel);


static unsigned short _NumReadItems;
static unsigned int _Command;
static unsigned int _Addr;

static char _acBuffer[1024];
static int  _RdPos;
static int  _WrPos;

static int _ActiveChannel    = 0;

static char _WritePendingNB  = 0;
static unsigned int  _PendingPacketNB = 0;

static char _WritePending;
static unsigned int  _Data;






 

#line 225 "Util\\JLINKDCC_Process.c"

 












 
static void _HandleRead(void) {
  unsigned int Data;

  if ((CP14_ReadDCCStat() & 1) == 0) {       
    return;      
  }

  Data = CP14_ReadDCC();
  
  
  
  if ((Data & 0x00000001) == 0) {
    _Addr = Data;
    return;
  }
  
  
  
  if ((Data & 0xFF000000) == 0x93000000) {
    unsigned Channel;
    Channel = (Data >> 19) & 0x1F;
    if (_pfOnRx[Channel]) {
      _pfOnRx[Channel](Channel, (Data >> 1) & 0xFF);
    }
    return;
  }
  
  
  
  _Command = Data;
  if (_Command & 0x80000000) {
    _Addr |= 1;
  }
  if (_Command & (0x01000000 | 0x02000000 | 0x04000000 | 0x08000000)) {
    _NumReadItems = (_Command >> 2) & 0xffff;
  } else {
    
    JLINKDCC_AbortOccurred = 0;

    if (_Command & 0x10000000) {
      _Data |= (_Command << 14) & 0xffff0000;
    } else {
      _Data = (_Command >> 2) & 0xffff;
    }
    if (_Command & 0x40000000) {
      *(unsigned char*)_Addr = _Data;
      _Addr += 1;
    }
    if (_Command & 0x20000000) {
      *(unsigned short*)_Addr = _Data;
      _Addr += 2;
    }
    if (_Command & 0x10000000) {
      *(unsigned int*)_Addr =_Data;
      _Addr += 4;
    }
  }
}







 
static void _HandleWrite(void) {
  unsigned int Data;
  int DCCBusy;
  int NumBytes;

  Data = 0;
  DCCBusy = CP14_ReadDCCStat() & 2;
  if (DCCBusy) {                  
    return;                       
  }

  if (_ActiveChannel) {
    unsigned int Channel;

    Channel = _ActiveChannel;
    _ActiveChannel = 0;
    if (_WritePendingNB) {
      CP14_WriteDCC(_PendingPacketNB);
      _WritePendingNB = 0;
    }
    if (_pfOnTx[Channel]) {
      _pfOnTx[Channel](Channel);
    }
    return;
  }

  
  
  
  if (_WritePending) {
    CP14_WriteDCC(_Data);
    _WritePending = 0;
    return;
  }
  
  
  
  if (_NumReadItems) {
    if (_Command & 0x08000000) {
      Data = (0xFF | 0x91CA0000);
      Data |= (JLINKDCC_AbortOccurred << 8);  
      JLINKDCC_AbortOccurred = 0;
    } else {

      
      JLINKDCC_AbortOccurred = 0;

      if (_Command & 0x04000000) {
        Data = *(unsigned char*)_Addr;
        _Addr += 1;
      } else if (_Command & 0x02000000) {
        Data = *(unsigned short*)_Addr;
        _Addr += 2;
      } else if (_Command & 0x01000000) {
        Data = *(unsigned int*)_Addr;
        _Addr += 4;
        if ((Data & 0xFF800000) == 0x93800000) {    
          _Data = 0x93c10000 | (Data >> 16);
          Data  = 0x93c00000 | (Data & 0xFFFF);
          _WritePending = 1;
        }
      }
      if (JLINKDCC_AbortOccurred) {
        Data = 0x93c20000;          
        _WritePending = 0;
        JLINKDCC_AbortOccurred = 0; 
      }
    }

    CP14_WriteDCC(Data);
    _NumReadItems--;
    return;
  }
  
  
  
  NumBytes = _WrPos - _RdPos;
  if (NumBytes < 0) {
    NumBytes += sizeof(_acBuffer);
  }
  if (NumBytes) {
    int i;
    if (NumBytes > 2) {
      NumBytes = 2;
    }
    if (NumBytes == 2) {
      Data = 0x93A00000;
    } else {
      Data = 0x93800000;
    }
    for (i = 0; i < NumBytes; i++) {
      Data |= _acBuffer[_RdPos] << (8*i);
      _RdPos++;
      if (_RdPos == sizeof(_acBuffer)) {
        _RdPos = 0;
      }
    }
    CP14_WriteDCC(Data);
  }
}







 









 
void JLINKDCC_Process(void) {
  
  
  
  if (JLINKDCC_IsInHandler) {
    return;
  }
  JLINKDCC_IsInHandler = 1;
  _HandleRead();
  _HandleWrite();
   JLINKDCC_IsInHandler = 0;
}







 
void JLINKDCC_SendChar(char c) {
  int Pos;

  Pos = _WrPos + 1;
  if (Pos == sizeof(_acBuffer)) {
    Pos = 0;
  }
  if (Pos == _RdPos) {
    return;
  }
  _acBuffer[_WrPos] = c;
  _WrPos = Pos;
}







 
void JLINKDCC_SendString(const char * s) {
  char c;
  while (1) {
    c = *s++;
    if (c == 0) {
      break;
    }
    JLINKDCC_SendChar(c);
  }
}










 
void JLINKDCC_SendCharOnChannelNB(unsigned Channel, unsigned char Data) {
  unsigned int DCCPacket;
  int DCCBusy;

  DCCPacket = 0x93800000 | (Channel << 16);
  DCCPacket |= Data;
  DCCBusy = CP14_ReadDCCStat() & 2;
  if (DCCBusy == 0) {
    CP14_WriteDCC(DCCPacket);
  } else {
    _WritePendingNB = 1;
    _PendingPacketNB = DCCPacket;
  }
  _ActiveChannel = Channel;
}









 
void JLINKDCC_SendOnChannel(unsigned Channel, unsigned char * pData, int NumItems) {
  unsigned int Data;

  if (Channel == 0)  {
    while (NumItems-- > 0) {
      Data = *pData++;
      JLINKDCC_SendChar(Data);
    }
  } else {
    while (NumItems-- > 0) {
      Data = *pData++;
      if  (NumItems > 0) {
        Data |= *pData++ << 8;
        NumItems--;
        Data |= 0x200000;
      }
      Data |= 0x93800000;
      Data |= Channel << 16;
      while (CP14_ReadDCCStat() & 2);       
      CP14_WriteDCC(Data);
    }
  }
}





 
void JLINKDCC_SetpfOnRx(unsigned Channel, void (* pf)(unsigned Channel, unsigned char Data)) {
  _pfOnRx[Channel] = pf;
}





 
void JLINKDCC_SetpfOnTx(unsigned Channel, void (* pf)(unsigned Channel)) {
  _pfOnTx[Channel] = pf;
}


 
