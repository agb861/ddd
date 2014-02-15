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
File        : FS_RO.c
Purpose     : Implementation of read only file system
---------------------------END-OF-HEADER------------------------------
*/

#include <stdio.h>
#include <string.h>
#include "IP_FS.h"

typedef struct {
  const char * sFilename;
  const unsigned char * pData;
  unsigned int FileSize;
} DIR_ENTRY;

#include "generated\embos.h"            /* HTML page       */
#include "generated\index.h"            /* HTML page       */
#include "generated\SeggerLogo.h"       /* SeggerLogo.gif  */
#include "generated\bg.h"               /* bg.png          */
#include "generated\stats.h"            /* HTML page       */
#include "generated\Authen.h"           /* HTML page       */
#include "generated\FormsGET.h"         /* HTML page       */
#include "generated\FormsPOST.h"        /* HTML page       */
#include "generated\favicon.h"          /* favicon.ico     */
#include "generated\CallVirtualFile.h"  /* HTML page       */
#include "generated\about.h"            /* HTML page       */
//#include "generated\SendviaSMTP.h"      /* HTML page       */

DIR_ENTRY _aFile[] =  {
  /* file name     file array    current size  */
  /* ---------     ----------    ------------  */
  { "/embos.htm",           embos_file,           EMBOS_SIZE           },
  { "/index.htm",           index_file,           INDEX_SIZE           },
  { "/seggerlogo.gif",      seggerlogo_file,      SEGGERLOGO_SIZE      },
  { "/bg.png",              bg_file,              BG_SIZE              },
  { "/stats.htm",           stats_file,           STATS_SIZE           },
  { "/conf/Authen.htm",     authen_file,          AUTHEN_SIZE          },
  { "/FormsGET.htm",        formsget_file,        FORMSGET_SIZE        },
  { "/CallVirtualFile.htm", callvirtualfile_file, CALLVIRTUALFILE_SIZE },
  { "/FormsPOST.htm",       formspost_file,       FORMSPOST_SIZE       },
  { "/about.htm",           about_file,           ABOUT_SIZE           },
  { "/favicon.ico",         favicon_file,         FAVICON_SIZE         },
//  { "/SendviaSMTP.htm",     sendviasmtp_file,     SENDVIASMTP_SIZE     },
  { "/memory.bin",          0,                    0x10000              },   // Pseudo file for speed tests
  { 0 }
};


/*********************************************************************
*
*       _CompareDir
*/
static int _CompareDir(const char * sDir, const char * sFilename) {
  int i;
  char c0, c1;

  for (i = 0; ; i++) {
    c0 = *sDir++;
    if (c0 == 0) {
      break;
    }
    c1 = *sFilename++;
    if (c0 != c1) {
      return 1; // No match, file not in this directory
    }
  }
  return 0; // match
}

/*********************************************************************
*
*       _FS_RO_FS_Open
*/
static void * _FS_RO_FS_Open  (const char *sFilename) {
  DIR_ENTRY * pEntry;
  int i;

  for (i = 0; ; i++) {
    pEntry = &_aFile[i];
    if (pEntry->sFilename == NULL) {
      break;
    }
    if (strcmp(sFilename, pEntry->sFilename) == 0) {
      return pEntry;
    }
  }
  return NULL;
}

/*********************************************************************
*
*       _FS_RO_Close
*/
static int _FS_RO_Close (void *hFile) {
  (void)hFile;
  return 0;
}

/*********************************************************************
*
*       _FS_RO_ReadAt
*/
static int _FS_RO_ReadAt(void * hFile, void *pDest, U32 Pos, U32 NumBytes) {
  DIR_ENTRY * pEntry;
  pEntry = (DIR_ENTRY *)hFile;
  memcpy(pDest, pEntry->pData + Pos, NumBytes);
  return 0;
}

/*********************************************************************
*
*       _FS_RO_GetLen
*/
static long _FS_RO_GetLen(void * hFile) {
  DIR_ENTRY * pEntry;
  pEntry = (DIR_ENTRY *)hFile;
  return pEntry->FileSize;
}

/*********************************************************************
*
*       _FS_RO_ForEachDirEntry
*/
static void _FS_RO_ForEachDirEntry (void * pContext, const char * sDir, void (*pf) (void * pContext, void * pFileEntry)) {
  int i;
  for (i = 0; ; i++) {
    if (_aFile[i].sFilename == NULL) {
      break;
    }
    if (_CompareDir(sDir, _aFile[i].sFilename) == 0) {
      pf(pContext, &_aFile[i]);
    }
  }
}

/*********************************************************************
*
*       _FS_RO_GetFileName
*/
static void _FS_RO_GetFileName(void * pFileEntry, char * sBuffer, U32 SizeofBuffer) {
  DIR_ENTRY * pEntry;

  (void)SizeofBuffer;
  pEntry = (DIR_ENTRY *)pFileEntry;
  strcpy(sBuffer, pEntry->sFilename + 1);
}

/*********************************************************************
*
*       Public data
*
**********************************************************************
*/
const IP_FS_API IP_FS_ReadOnly = {
  _FS_RO_FS_Open,
  _FS_RO_Close,
  _FS_RO_ReadAt,
  _FS_RO_GetLen,
  _FS_RO_ForEachDirEntry,
  _FS_RO_GetFileName,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL
};

/*************************** End of file ****************************/

