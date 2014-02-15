#line 1 "IP\\IP_FS\\emFile\\IP_FS_FS.c"















 

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



 

#line 19 "IP\\IP_FS\\emFile\\IP_FS_FS.c"
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



 

#line 20 "IP\\IP_FS\\emFile\\IP_FS_FS.c"
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








 




#line 21 "IP\\IP_FS\\emFile\\IP_FS_FS.c"
#line 1 "FS\\FS.h"



















 










 

#line 1 "FS\\FS_ConfDefaults.h"















 




#line 1 "Config\\FS_Conf.h"















 


















#line 43 "Config\\FS_Conf.h"




#line 22 "FS\\FS_ConfDefaults.h"
#line 23 "FS\\FS_ConfDefaults.h"







 






 









































  
  
  
#line 88 "FS\\FS_ConfDefaults.h"


















































 


































 















 









 
#line 214 "FS\\FS_ConfDefaults.h"














 




 







 








 
#line 258 "FS\\FS_ConfDefaults.h"




 

















  
  
  


  
  
  




  
  
  









 



 
#line 34 "FS\\FS.h"
#line 1 "FS\\FS_Types.h"















 





#line 23 "FS\\FS_Types.h"












 

































#line 77 "FS\\FS_Types.h"










 








 










 
typedef struct FS_FAT_INFO    FS_FAT_INFO;
typedef struct FS_EFS_INFO    FS_EFS_INFO;
typedef struct FS_SB          FS_SB;






 
typedef struct FS_CACHE_API     FS_CACHE_API;
typedef struct FS_DEVICE        FS_DEVICE;
typedef struct FS_DIR           FS_DIR;
typedef struct FS_FILE          FS_FILE;
typedef struct FS_PARTITION     FS_PARTITION;
typedef struct FS_VOLUME        FS_VOLUME;
typedef struct FS_DEVICE_TYPE   FS_DEVICE_TYPE;
typedef struct FS_DIRENT        FS_DIRENT;
typedef struct FS_DEV_INFO      FS_DEV_INFO;







 
#line 35 "FS\\FS.h"
#line 1 "FS\\FS_Storage.h"



















 









 

#line 33 "FS\\FS_Storage.h"
#line 34 "FS\\FS_Storage.h"
#line 1 "FS\\FS_Dev.h"















 








 
#line 35 "FS\\FS_Storage.h"


















 




 











 
struct FS_DEV_INFO {
  unsigned short NumHeads;           
  unsigned short SectorsPerTrack;    
  unsigned long NumSectors;         
  unsigned short BytesPerSector;     
};


typedef void (FS_ONDEVICEACTIVITYHOOK)(FS_DEVICE * pDevice, unsigned Operation, unsigned long StartSector, unsigned long NumSectors, int Sectortype);









 




 
int              FS_IsLLFormatted     (const char * sVolume);
int              FS_FormatLLIfRequired(const char * sVolume);
void             FS_UnmountForced     (const char * sVolume);
int              FS_GetVolumeStatus   (const char * sVolume);
FS_VOLUME *      FS_FindVolume        (const char * sVolume);




 
#line 111 "FS\\FS_Storage.h"

int      FS_STORAGE_GetDeviceInfo(const char * sVolume, FS_DEV_INFO * pDevInfo);
unsigned FS_STORAGE_Init         (void);
int      FS_STORAGE_ReadSector   (const char * sVolume,       void * pData, unsigned long SectorIndex);
int      FS_STORAGE_WriteSector  (const char * sVolume, const void * pData, unsigned long SectorIndex);
int      FS_STORAGE_ReadSectors  (const char * sVolume,       void * pData, unsigned long FirstSector, unsigned long NumSectors);
void     FS_STORAGE_Sync         (const char * sVolume);
void     FS_STORAGE_Unmount      (const char * sVolume);
void     FS_STORAGE_UnmountForced(const char * sVolume);
int      FS_STORAGE_WriteSectors (const char * sVolume, const void * pData, unsigned long FirstSector, unsigned long NumSectors);
void     FS_SetOnDeviceActivityHook(const char * sVolume, FS_ONDEVICEACTIVITYHOOK * pfOnDeviceActivityHook);





 
typedef struct {
  unsigned long ReadOperationCnt;       
  unsigned long ReadSectorCnt;          
  unsigned long ReadSectorCachedCnt;    
  unsigned long WriteOperationCnt;      
  unsigned long WriteSectorCnt;         
} FS_STORAGE_COUNTERS;

void FS_STORAGE_GetCounters  (FS_STORAGE_COUNTERS * pStat);
void FS_STORAGE_ResetCounters(void);





extern FS_STORAGE_COUNTERS FS_STORAGE_Counters;









 
#line 36 "FS\\FS.h"
#line 37 "FS\\FS.h"










 

 








 
#line 68 "FS\\FS.h"

 
 











 








                                                       








 









 










 







 






 






 
enum {
  FS_ERRCODE_0FILE = 0x10,
  FS_ERRCODE_SHORTEN_CLUSTER,
  FS_ERRCODE_CROSSLINKED_CLUSTER,
  FS_ERRCODE_FEW_CLUSTER,
  FS_ERRCODE_CLUSTER_UNUSED,
  FS_ERRCODE_CLUSTER_NOT_EOC,
  FS_ERRCODE_INVALID_CLUSTER,
  FS_ERRCODE_INVALID_DIRECTORY_ENTRY
};






 
#line 170 "FS\\FS.h"






 

typedef int  FS_QUERY_F_TYPE(int ErrCode, ...);
typedef void FS_BUSY_LED_CALLBACK(unsigned char OnOff);
typedef int  FS_MEMORY_IS_ACCESSIBLE_CALLBACK(void * p, unsigned long NumBytes);

struct FS_DIRENT {
  char  DirName[260];
  unsigned char    Attributes;
  unsigned long   Size;
  unsigned long   TimeStamp;
};

typedef struct {
  unsigned long Cluster;                     
  unsigned long FirstCluster;
  unsigned long DirEntryIndex;               
  unsigned long ClusterIndex;
} FS_DIR_POS;

typedef struct {
  FS_DIR_POS  DirPos;              
  unsigned short         DirEntryIndex;
  unsigned long         FirstCluster;
  FS_VOLUME * pVolume;
  signed short         error;               
  unsigned char          InUse;               
} FS__DIR;

typedef struct {
  unsigned char     Attributes;
  unsigned long    CreationTime;
  unsigned long    LastAccessTime;
  unsigned long    LastWriteTime;
  unsigned long    FileSize;
  char * sFileName;
  int    SizeofFileName;
} FS_DIRENTRY_INFO;

typedef struct {
  unsigned char     Attributes;
  unsigned long    CreationTime;
  unsigned long    LastAccessTime;
  unsigned long    LastWriteTime;
  unsigned long    FileSize;
  char * sFileName;
  
  int SizeofFileName;
  FS__DIR Dir;
} FS_FIND_DATA;

typedef struct {
  unsigned long NumTotalClusters;
  unsigned long NumFreeClusters;
  unsigned short SectorsPerCluster;
  unsigned short BytesPerSector;
} FS_DISK_INFO;

 typedef struct {
  unsigned short        SectorsPerCluster;
  unsigned short        NumRootDirEntries;     
  FS_DEV_INFO * pDevInfo;
} FS_FORMAT_INFO;

typedef struct {
  unsigned short           SectorsPerCluster;
  unsigned short           NumRootDirEntries;     
  unsigned short           NumReservedSectors;
  unsigned char            UpdatePartition;
  FS_DEV_INFO * pDevInfo;
} FS_FORMAT_INFO_EX;

typedef struct {
  unsigned short Year;
  unsigned short Month;
  unsigned short Day;
  unsigned short Hour;
  unsigned short Minute;
  unsigned short Second;
} FS_FILETIME;




 
 
typedef struct FS_BG_DATA {
  struct FS_BG_DATA * pNext;
  unsigned long                 NumBytes;
  unsigned long                 NumBytesRem;          
  void              * pData;
  FS_FILE           * pFile;
  unsigned char                  Operation;
  void (*pfOnCompletion) (void * p);    
  void              * pCompletionData;      
  char                IsCompleted;
} FS_BG_DATA;

void FS_Daemon(void);
void FS_FReadNonBlock (void       * pData,
                       unsigned long          NumBytes,
                       FS_FILE    * pFile,
                       FS_BG_DATA * pBGData,                     
                       void (*pfOnCompletion) (void * p),    
                       void * pCompletionData                    
                      );
void FS_FWriteNonBlock(const void * pData,
                       unsigned long          NumBytes,
                       FS_FILE    * pFile,
                       FS_BG_DATA * pBGData,                     
                       void (*pfOnCompletion) (void * p),    
                       void * pCompletionData                    
                       );
char FS_IsCompleted(FS_BG_DATA * pBGData);






 




 
FS_FILE *        FS_FOpen (const char * pFileName, const char * pMode);
int              FS_FClose(FS_FILE    * pFile);
unsigned long              FS_FRead (      void * pData, unsigned long Size, unsigned long N, FS_FILE * pFile);
unsigned long              FS_FWrite(const void * pData, unsigned long Size, unsigned long N, FS_FILE * pFile);




 
unsigned long           FS_Read (FS_FILE * pFile,       void * pData, unsigned long NumBytes);
unsigned long           FS_Write(FS_FILE * pFile, const void * pData, unsigned long NumBytes);




 
int              FS_FSeek       (FS_FILE * pFile, signed long Offset,         int Origin);
int              FS_SetEndOfFile(FS_FILE * pFile);
signed long              FS_FTell       (FS_FILE * pFile);







 
int              FS_FEof        (FS_FILE * pFile);
signed short              FS_FError      (FS_FILE * pFile);
void             FS_ClearErr    (FS_FILE * pFile);
const char *     FS_ErrorNo2Text(int       ErrCode);




 
int              FS_CopyFile   (const char * sSource,       const char * sDest);
unsigned long              FS_GetFileSize(FS_FILE    * pFile);
int              FS_Move       (const char * sExistingName, const char * sNewName);
int              FS_Remove     (const char * pFileName);
int              FS_Rename     (const char * sOldName,      const char * sNewName);
int              FS_Truncate   (FS_FILE    * pFile,         unsigned long          NewSize);
int              FS_Verify     (FS_FILE    * pFile,         const void * pData, unsigned long NumBytes);




 
int              FS_IoCtl(const char *pDevName, signed long Cmd, signed long Aux, void *pBuffer);




 
int              FS_GetVolumeName       (int Index, char * pBuffer, int MaxSize);
unsigned long              FS_GetVolumeSize       (const char * sVolume);
unsigned long              FS_GetVolumeSizeKB     (const char * sVolume);
unsigned long              FS_GetVolumeFreeSpace  (const char * sVolume);
unsigned long              FS_GetVolumeFreeSpaceKB(const char * sVolume);
int              FS_GetNumVolumes       (void);
FS_VOLUME *      FS_AddDevice           (const FS_DEVICE_TYPE * pDevType);
void             FS_Unmount             (const char * sVolume);
int              FS_Mount               (const char * sVolName);
int              FS_MountEx             (const char * sVolume, unsigned char MountType);
int              FS_GetVolumeInfo       (const char * sVolume, FS_DISK_INFO * pInfo);
int              FS_IsVolumeMounted     (const char * sVolumeName);
int              FS_GetVolumeLabel      (const char * sVolume, char * pVolumeLabel, unsigned VolumeLabelSize);
int              FS_SetVolumeLabel      (const char * sVolume, const char * pVolumeLabel);
void             FS_STORAGE_Sync(const char * sVolume);
int              FS_IsLLFormatted       (const char * sVolume);
int              FS_IsHLFormatted       (const char * sVolume);
int              FS_FormatLLIfRequired  (const char * sVolume);
void             FS_UnmountForced       (const char * sVolume);
void             FS_SetAutoMount        (const char * sVolume, unsigned char MountType);
void             FS_STORAGE_Unmount(const char * sVolume);
int              FS_GetVolumeStatus     (const char * sVolume);
FS_VOLUME *      FS_FindVolume          (const char * sVolume);
void             FS_RemoveDevice        (const char * sVolume);
int              FS_Sync                (const char * sVolume);





 
void FS_JOURNAL_Begin  (const char *sVolume);
void FS_JOURNAL_End    (const char *sVolume);
int  FS_JOURNAL_Create (const char * sVolume, unsigned long NumBytes);









 
int              FS_SetFileAttributes(const char * pName, unsigned char Attributes);
unsigned char               FS_GetFileAttributes(const char * pName);




 
void             FS_FileTimeToTimeStamp(const FS_FILETIME * pFileTime, unsigned long *         pTimeStamp);
int              FS_GetFileTime        (const char *        pName,     unsigned long *         pTimeStamp);
int              FS_GetFileTimeEx      (const char *        pName,     unsigned long *         pTimeStamp, int Index);
int              FS_SetFileTime        (const char *        pName,     unsigned long            TimeStamp);
int              FS_SetFileTimeEx      (const char *        pName,     unsigned long            TimeStamp, int Index);
void             FS_TimeStampToFileTime(unsigned long                 TimeStamp, FS_FILETIME * pFileTime);





 
int      FS_GetNumFilesOpen(void);





 
int  FS_CreateDir      (const char * sDirPath);
int  FS_MkDir          (const char * pDirName);
int  FS_RmDir          (const char * pDirName);
char FS_FindFirstFile  (FS_FIND_DATA * pfd, const char * sPath, char * sFilename, int sizeofFilename);
char FS_FindNextFile   (FS_FIND_DATA * pfd);
void FS_FindClose      (FS_FIND_DATA * pfd);
unsigned long  FS_FAT_GrowRootDir(const char * sVolume, unsigned long NumAddEntries);






 

void     FS_DirEnt2Attr   (FS_DIRENT  * pDirEnt, unsigned char   * pAttr);
void     FS_DirEnt2Name   (FS_DIRENT  * pDirEnt, char * pBuffer);
unsigned long      FS_DirEnt2Size   (FS_DIRENT  * pDirEnt);
unsigned long      FS_DirEnt2Time   (FS_DIRENT  * pDirEnt);
unsigned long      FS_GetNumFiles   (FS_DIR     * pDir);

FS_DIR    * FS_OpenDir    (const char * pDirName);
int         FS_CloseDir   (FS_DIR     * pDir);
FS_DIRENT * FS_ReadDir    (FS_DIR     * pDir);
void        FS_RewindDir  (FS_DIR     * pDir);




 
void FSTask(void);




 
void     FS_Init          (void);







 
int              FS_FormatLLIfRequired(const char * sVolumeName);
int              FS_FormatLow         (const char * sVolumeName);
int              FS_Format            (const char * sVolumeName, FS_FORMAT_INFO * pFormatInfo);
int              FS_FormatSD          (const char * sVolumeName);




 
const char * FS_CheckDisk_ErrCode2Text(int ErrCode);
int          FS_CheckDisk(const char * sVolumeName, void * pBuffer, unsigned long BufferSize, int MaxRecursionLevel, FS_QUERY_F_TYPE * pfOnError);
void         FS_FAT_AbortCheckDisk(void);




 








 
void FS_FAT_SupportLFN(void);
void FS_SetMaxSectorSize(unsigned MaxSectorSize);
void FS_WriteUpdateDir(char OnOff);





 







 
void FS_SetBusyLEDCallback(const char * sVolumeName, FS_BUSY_LED_CALLBACK * pfBusyLEDCallback);





 
void FS_SetMemAccessCallback(const char * sVolumeName, FS_MEMORY_IS_ACCESSIBLE_CALLBACK * pfIsAccessibleCallback);





 
struct FS_DEVICE_TYPE {      
  const char *      (*pfGetName)      (unsigned char Unit);
  int               (*pfAddDevice)    (void);                                                       
  int               (*pfRead)         (unsigned char Unit, unsigned long SectorNo,       void *pBuffer, unsigned long NumSectors);
  int               (*pfWrite)        (unsigned char Unit, unsigned long SectorNo, const void *pBuffer, unsigned long NumSectors, unsigned char RepeatSame);
  int               (*pfIoCtl)        (unsigned char Unit, signed long Cmd, signed long Aux, void *pBuffer);
  int               (*pfInitMedium)   (unsigned char Unit);                                                       
  int               (*pfGetStatus)    (unsigned char Unit);
  int               (*pfGetNumUnits)  (void);
};

extern const FS_DEVICE_TYPE    FS_RAMDISK_Driver;        
extern const FS_DEVICE_TYPE    FS_WINDRIVE_Driver;       
extern const FS_DEVICE_TYPE    FS_MMC_CardMode_Driver;   
extern const FS_DEVICE_TYPE    FS_MMC_SPI_Driver;        
extern const FS_DEVICE_TYPE    FS_IDE_Driver;            
extern const FS_DEVICE_TYPE    FS_NOR_Driver;            
extern const FS_DEVICE_TYPE    FS_GENERIC_Driver;        
extern const FS_DEVICE_TYPE    FS_NAND_Driver;           




 
typedef struct {
  unsigned long Off;
  unsigned long Size;
  unsigned long EraseCnt;
  unsigned short NumUsedSectors;
  unsigned short NumFreeSectors;
  unsigned short NumEraseableSectors;
} FS_NOR_SECTOR_INFO;

typedef struct {
  unsigned long NumPhysSectors;
  unsigned long NumLogSectors;
  unsigned long NumUsedSectors;    
} FS_NOR_DISK_INFO;

typedef struct FS_NOR_PHY_TYPE {
  int  (*pfWriteOff)         (unsigned char Unit, unsigned long Off, const void * pSrc, unsigned long Len);
  int  (*pfReadOff)          (unsigned char Unit, void * pDest, unsigned long Off, unsigned long Len);
  int  (*pfEraseSector)      (unsigned char Unit, unsigned int SectorIndex);
  void (*pfGetSectorInfo)    (unsigned char Unit, unsigned int SectorIndex, unsigned long * pOff, unsigned long * pLen);
  int  (*pfGetNumSectors)    (unsigned char Unit);
  void (*pfConfigure)        (unsigned char Unit, unsigned long BaseAddr, unsigned long StartAddr, unsigned long NumBytes);
  void (*pfOnSelectPhy)      (unsigned char Unit);
  void (*pfDeInit)           (unsigned char Unit);
} FS_NOR_PHY_TYPE;

extern const FS_NOR_PHY_TYPE FS_NOR_PHY_CFI_1x16;            
extern const FS_NOR_PHY_TYPE FS_NOR_PHY_CFI_2x16;            
extern const FS_NOR_PHY_TYPE FS_NOR_PHY_ST_M25;              

void         FS_NOR_GetDiskInfo            (unsigned char Unit, FS_NOR_DISK_INFO * pDiskInfo);
void         FS_NOR_GetSectorInfo          (unsigned char Unit, unsigned long PhysSectorIndex, FS_NOR_SECTOR_INFO * pSectorInfo);
void         FS_NOR_Configure              (unsigned char Unit, unsigned long BaseAddr, unsigned long StartAddr, unsigned long NumBytes);
void         FS_NOR_ConfigureReserve       (unsigned char Unit, unsigned char Percentage2Reserve);
void         FS_NOR_SetPhyType             (unsigned char Unit, const FS_NOR_PHY_TYPE * pPhyType);
const void * FS_NOR_LogSector2PhySectorAddr(unsigned char Unit, unsigned long LogSectorNo);
void         FS_NOR_SetSectorSize          (unsigned char Unit, unsigned short SectorSize);
int          FS_NOR_FormatLow              (unsigned char Unit);
int          FS_NOR_IsLLFormatted          (unsigned char Unit);
void         FS_NOR_SPI_Configure          (unsigned char Unit, unsigned long  SectorSize, unsigned short  NumSectors);




 
void FS_RAMDISK_Configure(unsigned char Unit, void * pData, unsigned short BytesPerSector, unsigned long NumSectors);




 
typedef struct {
  unsigned char aData[16];
} MMC_CARD_ID;

void FS_MMC_ActivateCRC        (void);
void FS_MMC_DeactivateCRC      (void);
int  FS_MMC_GetCardId          (unsigned char Unit, MMC_CARD_ID * pCardId);
void FS_MMC_CM_Allow4bitMode   (unsigned char Unit, unsigned char OnOff);





 
void FS_IDE_Configure(unsigned char Unit, unsigned char IsSlave);




 

typedef struct {
  unsigned short          brsi;              
  unsigned long          ECC;               
  unsigned char           IsValid;           
} FS_NAND_SECTOR_INFO;

typedef struct {
  unsigned long          EraseCnt;
  unsigned long          lbi;
  unsigned short          NumSectorsBlank;               
  unsigned short          NumSectorsValid;               
  unsigned short          NumSectorsInvalid;             
  unsigned short          NumSectorsECCError;            
  unsigned short          NumSectorsECCCorrectable;      
  const char * sType;
} FS_NAND_BLOCK_INFO;

typedef struct {
  unsigned long NumPhyBlocks;
  unsigned long NumLogBlocks;
  unsigned long NumUsedPhyBlocks;
  unsigned long NumBadPhyBlocks;
  unsigned long NumPagesPerBlock;
  unsigned long NumSectorsPerBlock;
  unsigned long BytesPerPage;
  unsigned long BytesPerSector;
} FS_NAND_DISK_INFO;

typedef struct FS_NAND_DEVICE_INFO {
  unsigned char  BPP_Shift;              
  unsigned char  PPB_Shift;              
  unsigned short NumBlocks;              
} FS_NAND_DEVICE_INFO;

typedef struct FS_NAND_PHY_TYPE {
  int    (*pfEraseBlock)    (unsigned char Unit, unsigned long Block);
  int    (*pfInitGetDeviceInfo) (unsigned char Unit, FS_NAND_DEVICE_INFO * pDevInfo);
  int    (*pfIsWP)          (unsigned char Unit);
  int    (*pfRead)          (unsigned char Unit, unsigned long PageNo,       void * pData, unsigned Off, unsigned NumBytes);
  int    (*pfReadEx)        (unsigned char Unit, unsigned long PageNo,       void * pData, unsigned Off, unsigned NumBytes, void * pSpare, unsigned OffSpare, unsigned NumBytesSpare);
  int    (*pfWrite)         (unsigned char Unit, unsigned long PageNo, const void * pData, unsigned Off, unsigned NumBytes);
  int    (*pfWriteEx)       (unsigned char Unit, unsigned long PageNo, const void * pData, unsigned Off, unsigned NumBytes, const void* pSpare, unsigned OffSpare, unsigned NumBytesSpare);
} FS_NAND_PHY_TYPE;


extern const FS_NAND_PHY_TYPE FS_NAND_PHY_x;                        
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_x8;                       
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_x16;                      
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_512x8;                    
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_512x16;                   
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_2048x8;                   
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_2048x16;                  
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_4096x8;                   
extern const FS_NAND_PHY_TYPE FS_NAND_PHY_DataFlash;                

void FS_NAND_ResetStatCounters(unsigned char Unit);
void FS_NAND_SetPhyType       (unsigned char Unit, const FS_NAND_PHY_TYPE * pPhyType);
void FS_NAND_SetBlockRange    (unsigned char Unit, unsigned short FirstBlock, unsigned short MaxNumBlocks);
void FS_NAND_GetDiskInfo      (unsigned char Unit, FS_NAND_DISK_INFO * pDiskInfo);
void FS_NAND_GetBlockInfo     (unsigned char Unit, unsigned long PhysBlockIndex, FS_NAND_BLOCK_INFO * pBlockInfo);
void FS_NAND_GetSectorInfo    (unsigned char Unit, unsigned long PhysSectorIndex, FS_NAND_SECTOR_INFO * pBlockInfo);
int  FS_NAND_FormatLow        (unsigned char Unit);
int  FS_NAND_IsLLFormatted    (unsigned char Unit);




 
void WINDRIVE_Configure(unsigned char Unit, const char * sWindowsDriveName);





 
void FS_DF_ChipErase(unsigned char Unit);




 





 









 






 
#line 735 "FS\\FS.h"



 
typedef unsigned long FS_INIT_CACHE (FS_DEVICE * pDevice, void * pData,   signed long NumBytes);




 
unsigned long    FS_AssignCache     (const char * pName, void * pData, signed long NumBytes, FS_INIT_CACHE * pfInit);
void   FS_CACHE_Clean     (const char * pName);
int    FS_CACHE_Command   (const char * pName, int Cmd,      void * pData);
int    FS_CACHE_SetMode   (const char * pName, int TypeMask, int    ModeMask);
int    FS_CACHE_SetQuota  (const char * pName, int TypeMask, unsigned long    NumSectors);
int    FS_CACHE_Invalidate(const char * sVolumeName);




 
unsigned long FS_CacheAll_Init    (FS_DEVICE * pDev, void * pData, signed long NumBytes);
unsigned long FS_CacheMan_Init    (FS_DEVICE * pDev, void * pData, signed long NumBytes);
unsigned long FS_CacheRW_Init     (FS_DEVICE * pDev, void * pData, signed long NumBytes);
unsigned long FS_CacheRWQuota_Init(FS_DEVICE * pDev, void * pData, signed long NumBytes);






 




typedef void   (FS_PF_FREE) (void * p);
typedef void * (FS_PF_ALLOC)(unsigned long NumBytes);



 
void * FS_Alloc         (signed long     NumBytes);
void * FS_AllocZeroed   (signed long     NumBytes);
void   FS_Free          (void *  p);
void   FS_AllocZeroedPtr(void ** pp, signed long NumBytes);
void * FS_TryAlloc      (signed long     NumBytesReq);




 
int FS_AddPhysDevice   (const FS_DEVICE_TYPE * pDevType);
int FS_LOGVOL_Create   (const char * sVolName);
int FS_LOGVOL_AddDevice(const char * sLogVolName, const FS_DEVICE_TYPE * pDevice, unsigned char Unit, unsigned long StartOff, unsigned long NumSectors);





 
void   FS_X_Log     (const char *s);
void   FS_X_Warn    (const char *s);
void   FS_X_ErrorOut(const char *s);





 
void   FS_X_Free(void * p);
void   FS_X_Panic(int ErrorCode);
void   FS_X_AddDevices(void);
unsigned long    FS_X_GetTimeDate(void);

unsigned long  FS_GetMaxSectorSize(void);
void FS_AssignMemory    (unsigned long *pMem, unsigned long NumBytes);
void FS_SetMemHandler   (FS_PF_ALLOC * pfAlloc, FS_PF_FREE * pfFree);

void     FS_SetDefFileBufferSize(unsigned long BufferSize);
unsigned FS_GetDefFileBufferSize(void);
void     FS_SetFileBufferSize(FS_FILE * pFile, unsigned long BufferSize);







 
#line 22 "IP\\IP_FS\\emFile\\IP_FS_FS.c"









 
static unsigned char _IsInited;






 
static const char * _sVolumeName = "";




 
static void _InitIfRequired(void) {
  if (_IsInited == 0) {
    FS_Init();
    FS_FormatLLIfRequired(_sVolumeName);
    
    
    
    if (FS_IsHLFormatted(_sVolumeName) == 0) {
      printf("High level formatting: %s\n", _sVolumeName);
      FS_Format(_sVolumeName, 0);
    }
    
    
    
    

    _IsInited = 1;
  }
}




















 
static int _ConvertPath(const char * sFilename, char * sOutFilename, unsigned long BufferSize) {
  char c;

  do {
    if (--BufferSize <= 0) {
      break;                  
    }
    c = *sFilename++;
    if (c == 0) {
      break;                  
    }
    if (c == '/') {
      c = '\\';
    }
    *sOutFilename++ = c;
  } while (1);
  *sOutFilename++ = 0;
  return 0;
}





 
static void * _FS_Open  (const char *sFilename) {
  char acAbsFilename[128];

  _InitIfRequired();         
  _ConvertPath(sFilename, acAbsFilename, sizeof(acAbsFilename));
  return FS_FOpen(acAbsFilename, "r");
}




 
static int _Close (void * hFile) {
  _InitIfRequired();         
  return FS_FClose((FS_FILE*) hFile);
}




 
static int _ReadAt(void * hFile, void *pDest, unsigned long Pos, unsigned long NumBytes) {
  _InitIfRequired();         
  FS_FSeek((FS_FILE*) hFile, Pos, 0);
  FS_Read((FS_FILE*) hFile, pDest, NumBytes);
  return 0;
}




 
static long _GetLen(void * hFile) {
  _InitIfRequired();         
  return FS_GetFileSize((FS_FILE*) hFile);

}




 
static void _ForEachDirEntry (void * pContext, const char * sDir, void (*pf) (void * pContext, void * pFileEntry)) {
  FS_FIND_DATA fd;
  char acDirname[128];
  char acFilename[128];

  _InitIfRequired();         
  _ConvertPath(sDir, acDirname, sizeof(acDirname));
  if (FS_FindFirstFile(&fd, acDirname, acFilename, sizeof(acFilename)) == 0) {
    do {
      pf(pContext, &fd);
    } while (FS_FindNextFile (&fd));
  }
  FS_FindClose(&fd);
}




 
static void _GetDirEntryFilename(void * pFileEntry, char * sFilename, unsigned long SizeofBuffer) {
  FS_FIND_DATA * pFD;

  _InitIfRequired();         
  pFD = (FS_FIND_DATA *)pFileEntry;
  strncpy(sFilename, pFD->sFileName, SizeofBuffer);
  * (sFilename + SizeofBuffer - 1) = 0;
}




 
static unsigned long _GetDirEntryFileSize (void * pFileEntry, unsigned long * pFileSizeHigh) {
  FS_FIND_DATA * pFD;

  _InitIfRequired();         
  pFD = (FS_FIND_DATA *)pFileEntry;
  return pFD->FileSize;
}




 
static unsigned long _GetDirEntryFileTime (void * pFileEntry) {
  FS_FIND_DATA * pFD;

  _InitIfRequired();         
  pFD = (FS_FIND_DATA *)pFileEntry;
  return pFD->LastWriteTime;
}







 
static int  _GetDirEntryAttributes (void * pFileEntry) {
  FS_FIND_DATA * pFD;

  _InitIfRequired();         
  pFD = (FS_FIND_DATA *)pFileEntry;
  return (pFD->Attributes & 0x10) ? 1 : 0;
}




 
static void * _Create (const char * sFilename) {
  char acAbsFilename[128];

  _InitIfRequired();         
  _ConvertPath(sFilename, acAbsFilename, sizeof(acAbsFilename));
  return FS_FOpen(acAbsFilename, "wb");
}





 
static void * _DeleteFile (const char *sFilename) {
  char acAbsFilename[128];

  _InitIfRequired();         
  _ConvertPath(sFilename, acAbsFilename, sizeof(acAbsFilename));
  return (void*)FS_Remove(acAbsFilename);
}




 
static int _RenameFile (const char *sOldFilename, const char *sNewFilename) {
  char acAbsOldFilename[128];
  char acAbsNewFilename[128];

  _InitIfRequired();         
  _ConvertPath(sOldFilename, acAbsOldFilename, sizeof(acAbsOldFilename));
  _ConvertPath(sNewFilename, acAbsNewFilename, sizeof(acAbsNewFilename));
  return FS_Rename(acAbsOldFilename, acAbsNewFilename);
}




 
static int    _WriteAt (void * hFile, void *pBuffer, unsigned long Pos, unsigned long NumBytes) {
  _InitIfRequired();         
  FS_FSeek((FS_FILE*) hFile, Pos, 0);
  return FS_Write((FS_FILE*) hFile, pBuffer, NumBytes);
}




 
static int _MKDir (const char * sDirname) {
  char acAbsDirname[128];

  _InitIfRequired();         
  _ConvertPath(sDirname, acAbsDirname, sizeof(acAbsDirname));
  return FS_MkDir(acAbsDirname);
}




 
static int _RMDir (const char * sDirname) {
  char acAbsDirname[128];

  _InitIfRequired();         
  _ConvertPath(sDirname, acAbsDirname, sizeof(acAbsDirname));
  return FS_RmDir(acAbsDirname);
}






 
const IP_FS_API IP_FS_FS = {
  _FS_Open,
  _Close,
  _ReadAt,
  _GetLen,
  _ForEachDirEntry,
  _GetDirEntryFilename,
  _GetDirEntryFileSize,
  _GetDirEntryFileTime,
  _GetDirEntryAttributes,
  _Create,
  _DeleteFile,
  _RenameFile,
  _WriteAt,
  _MKDir,
  _RMDir
};

 
