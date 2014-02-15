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
File    : USB_MSD_Private.h
Purpose : Private MSD header
--------  END-OF-HEADER  ---------------------------------------------
*/

#ifndef MSD_PRIVATE_H
#define MSD_PRIVATE_H

#include "USB_MSD.h"

#if defined(__cplusplus)
extern "C" {     /* Make sure we have C-declarations in C++ programs */
#endif


/*********************************************************************
*
*       defines, fixed
*/

#if MSD_DEBUG_LEVEL == 2
  #define MSD_DPRINT(_s) printf _s  /* Debug output */
  #define MSD_DERROR(_s) printf _s  /* Error output */
#elif MSD_DEBUG_LEVEL == 1
  #define MSD_DPRINT(_s)
  #define MSD_DERROR(_s) printf _s  /* Error output */
#else
  #define MSD_DPRINT(_s)
  #define MSD_DERROR(_s)
#endif

/*********************************************************************
*
*       defines
*
**********************************************************************
*/
#define CMD_TEST_UNIT_READY                  0x00
#define CMD_REQUEST_SENSE                    0x03
#define CMD_INQUIRY                          0x12
#define CMD_PREVENT_ALLOW_REMOVAL            0x1e
#define CMD_MODE_SENSE6                      0x1A
#define CMD_START_STOP_UNIT                  0x1B
#define CMD_READ_FORMAT_CAPACITY             0x23
#define CMD_READ_CAPACITY                    0x25
#define CMD_READ_6                           0x08
#define CMD_READ_10                          0x28
#define CMD_READ_12                          0xA8
#define CMD_READ_16                          0x88
#define CMD_WRITE                            0x2A
#define CMD_VERIFY                           0x2F
#define CMD_MODE_SENSE10                     0x5A
//
// MMC Commands for CDROM
//
#define CMD_MMC_READ_TOC                     0x43 
#define CMD_MMC_GET_CONFIGURATION            0x46 
#define CMD_MMC_GET_EVENT_STATUSNOTIFICATION 0x4A 
#define CMD_MMC_READ_DISKINFO                0x51 
#define CMD_MMC_READ_TRACKINFO               0x52 
#define CMD_MMC_SET_CDSPEED                  0xBB 
#define CMD_MMC_MECHANISM_STATUS             0xBD
#define CMD_MMC_READ_CD                      0xBE
#define CMD_MMC_READ_CD_MSF                  0xB9

#define MSD_RESET                0x21FF
#define MSD_GET_MAX_LUN          0xA1FE

#define TRANSFER_NONE                        0x00
#define TRANSFER_HOST_TO_DEVICE              0x01
#define TRANSFER_DEVICE_TO_HOST              0x02

#define CBW_LEN                              0x1f
#define CBW_SIGNATURE                        0x43425355

#define CSW_LEN                              0x0d
#define CSW_SIGNATURE                        0x53425355

#define CSW_STATUS_OK                        0x00
#define CSW_STATUS_FAILED                    0x01
#define CSW_STATUS_PHASE_ERROR               0x02

#define MSD_STATE_OK                         0
#define MSD_STATE_PHASE_ERROR                (1 << 0)
#define MSD_STATE_STALL_EP_OUT               (1 << 1)
#define MSD_STATE_STALL_EP_IN                (1 << 2)

#define SENSE_KEY_NO_SENSE                   0x00
#define SENSE_KEY_RECOVERED_ERROR            0x01
#define SENSE_KEY_NOT_READY                  0x02
#define SENSE_KEY_MEDIUM_ERROR               0x03
#define SENSE_KEY_HARDWARE_ERROR             0x04
#define SENSE_KEY_ILLEGAL_REQUEST            0x05
#define SENSE_KEY_UNIT_ATTENTION             0x06
#define SENSE_KEY_DATA_PROTECT               0x07
#define SENSE_KEY_BLANK_CHECK                0x08
#define SENSE_KEY_VENDOR_SPECIFIC            0x09
#define SENSE_KEY_COPY_ABORTED               0x0A
#define SENSE_KEY_ABORTED_COMMAND            0x0B
#define SENSE_KEY_VOLUME_OVERFLOW            0x0D
#define SENSE_KEY_MISCOMPARE                 0x0E


#define MSD_DEVICE_TYPE_DISK                 0x00
#define MSD_DEVICE_TYPE_CDROM                0x05
/*********************************************************************
*
*       Types
*
**********************************************************************
*/
typedef struct {
  U32 Signature;
  U32 Tag;
  U32 TransferLen;
  U8  Flags;
  U8  Lun;
  U8  CBLen;
  U8  aCmd[16];
} CBW;

struct _LUN_INFO {
  U8                           Lun;
  U8                           SenseKey;                // Stores the sense key
  U8                           Asc;                     // Additional sense code
  U8                           Ascq;                    // Additional sense code qualifier
  PREVENT_ALLOW_REMOVAL_HOOK * pfOnPreventAllowRemoval;
  READ_WRITE_HOOK            * pfOnReadWrite;
  USB_MSD_INST_DATA            InstData;
  U8                           DisconnectRequested;
  U8                           IsDisconnected;
};

  
void USB_MSD_StallEPIn           (void);
void USB_MSD_StallEPOut          (void);
void USB_MSD_Write               (const void * pData, unsigned NumBytes, char Send0PacketIfRequired);
int  USB_MSD_Read                (      void * pData, unsigned Len);
void USB_MSD_UpdateSenseData     (LUN_INFO * pLUNInfo, U8 SenseKey, U8 AddSenseCode, U8 AddSenseCodeQualifier);
void USB_MSD_SendNULLPacket      (void);


#if defined(__cplusplus)
  }              /* Make sure we have C-declarations in C++ programs */
#endif

#endif                 /* Avoid multiple inclusion */

/**************************** end of file ***************************/
