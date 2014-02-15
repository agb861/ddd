#line 1 "IP\\IP_FS\\FS_RO\\FS_RO.c"















 

#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
 
 
 





 






 













#line 38 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 129 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 948 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"



 

#line 19 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"


  
  typedef unsigned int size_t;








extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 185 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 201 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 224 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 239 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 262 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 494 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\string.h"



 

#line 20 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS.h"

















 




#line 1 "GUI\\Global.h"















 









 
#line 33 "GUI\\Global.h"



 
#line 24 "IP\\IP_FS.h"










 

typedef struct {
  
  
  
  void * (*pfOpenFile)   (const char *sFilename);
  int    (*pfCloseFile)  (void *hFile);
  int    (*pfReadAt)     (void * hFile, void *pBuffer, unsigned long Pos, unsigned long NumBytes);
  long   (*pfGetLen)     (void * hFile);
  
  
  
  void   (*pfForEachDirEntry)       (void * pContext, const char * sDir, void (*pf) (void * pContext, void * pFileEntry));
  void   (*pfGetDirEntryFileName)   (void * pFileEntry, char * sFileName, unsigned long SizeOfBuffer);
  unsigned long    (*pfGetDirEntryFileSize)   (void * pFileEntry, unsigned long * pFileSizeHigh);
  unsigned long    (*pfGetDirEntryFileTime)   (void * pFileEntry);
  int    (*pfGetDirEntryAttributes) (void * pFileEntry);
  
  
  
  void * (*pfCreate)     (const char * sFileName);
  void * (*pfDeleteFile) (const char *sFilename);
  int    (*pfRenameFile) (const char *sOldFilename, const char *sNewFilename);
  int    (*pfWriteAt)    (void * hFile, void *pBuffer, unsigned long Pos, unsigned long NumBytes);
  
  
  
  int    (*pfMKDir)      (const char * sDirName);
  int    (*pfRMDir)      (const char * sDirName);
} IP_FS_API;

extern const IP_FS_API IP_FS_ReadOnly;   
extern const IP_FS_API IP_FS_Win32;      
extern const IP_FS_API IP_FS_FS;         








 




#line 21 "IP\\IP_FS\\FS_RO\\FS_RO.c"

typedef struct {
  const char * sFilename;
  const unsigned char * pData;
  unsigned int FileSize;
} DIR_ENTRY;

#line 1 "IP\\IP_FS\\FS_RO\\generated\\embos.h"
 
 






extern const unsigned char embos_file[];

#line 29 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\index.h"
 
 






extern const unsigned char index_file[];

#line 30 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\SeggerLogo.h"
 
 






extern const unsigned char seggerlogo_file[];

#line 31 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\bg.h"
 
 






extern const unsigned char bg_file[];

#line 32 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\stats.h"
 
 






extern const unsigned char stats_file[];

#line 33 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\Authen.h"
 
 






extern const unsigned char authen_file[];

#line 34 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\FormsGET.h"
 
 






extern const unsigned char formsget_file[];

#line 35 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\FormsPOST.h"
 
 






extern const unsigned char formspost_file[];

#line 36 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\favicon.h"
 
 






extern const unsigned char favicon_file[];

#line 37 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\CallVirtualFile.h"
 
 






extern const unsigned char callvirtualfile_file[];

#line 38 "IP\\IP_FS\\FS_RO\\FS_RO.c"
#line 1 "IP\\IP_FS\\FS_RO\\generated\\about.h"
 
 






extern const unsigned char about_file[];

#line 39 "IP\\IP_FS\\FS_RO\\FS_RO.c"


DIR_ENTRY _aFile[] =  {
   
   
  { "/embos.htm",           embos_file,           1208           },
  { "/index.htm",           index_file,           1497           },
  { "/seggerlogo.gif",      seggerlogo_file,      1998      },
  { "/bg.png",              bg_file,              1786              },
  { "/stats.htm",           stats_file,           1302           },
  { "/conf/Authen.htm",     authen_file,          1210          },
  { "/FormsGET.htm",        formsget_file,        3847        },
  { "/CallVirtualFile.htm", callvirtualfile_file, 1615 },
  { "/FormsPOST.htm",       formspost_file,       1578       },
  { "/about.htm",           about_file,           2753           },
  { "/favicon.ico",         favicon_file,         246         },

  { "/memory.bin",          0,                    0x10000              },   
  { 0 }
};





 
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
      return 1; 
    }
  }
  return 0; 
}




 
static void * _FS_RO_FS_Open  (const char *sFilename) {
  DIR_ENTRY * pEntry;
  int i;

  for (i = 0; ; i++) {
    pEntry = &_aFile[i];
    if (pEntry->sFilename == 0) {
      break;
    }
    if (strcmp(sFilename, pEntry->sFilename) == 0) {
      return pEntry;
    }
  }
  return 0;
}




 
static int _FS_RO_Close (void *hFile) {
  (void)hFile;
  return 0;
}




 
static int _FS_RO_ReadAt(void * hFile, void *pDest, unsigned long Pos, unsigned long NumBytes) {
  DIR_ENTRY * pEntry;
  pEntry = (DIR_ENTRY *)hFile;
  memcpy(pDest, pEntry->pData + Pos, NumBytes);
  return 0;
}




 
static long _FS_RO_GetLen(void * hFile) {
  DIR_ENTRY * pEntry;
  pEntry = (DIR_ENTRY *)hFile;
  return pEntry->FileSize;
}




 
static void _FS_RO_ForEachDirEntry (void * pContext, const char * sDir, void (*pf) (void * pContext, void * pFileEntry)) {
  int i;
  for (i = 0; ; i++) {
    if (_aFile[i].sFilename == 0) {
      break;
    }
    if (_CompareDir(sDir, _aFile[i].sFilename) == 0) {
      pf(pContext, &_aFile[i]);
    }
  }
}




 
static void _FS_RO_GetFileName(void * pFileEntry, char * sBuffer, unsigned long SizeofBuffer) {
  DIR_ENTRY * pEntry;

  (void)SizeofBuffer;
  pEntry = (DIR_ENTRY *)pFileEntry;
  strcpy(sBuffer, pEntry->sFilename + 1);
}






 
const IP_FS_API IP_FS_ReadOnly = {
  _FS_RO_FS_Open,
  _FS_RO_Close,
  _FS_RO_ReadAt,
  _FS_RO_GetLen,
  _FS_RO_ForEachDirEntry,
  _FS_RO_GetFileName,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
};

 

