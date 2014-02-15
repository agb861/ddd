#line 1 "FS\\FS_X_embOS.c"
















 






 

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



 

#line 27 "FS\\FS_X_embOS.c"
#line 1 "FS\\FS_Int.h"















 




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



 

#line 22 "FS\\FS_Int.h"
#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
 
 
 




 
 



 













  


 








#line 46 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


  
  typedef unsigned int size_t;










    



    typedef unsigned short wchar_t;  
#line 75 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { __int64 quot, rem; } lldiv_t;
    


#line 96 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
   



 

   




 
#line 115 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) __int64 atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) __int64 strtoll(const char * __restrict  ,
                               char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned __int64 strtoull(const char * __restrict  ,
                                         char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 415 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 503 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 532 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __pure int abs(int  );
   



 

extern __declspec(__nothrow) __pure div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __pure long int labs(long int  );
   



 




extern __declspec(__nothrow) __pure ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __pure __int64 llabs(__int64  );
   



 




extern __declspec(__nothrow) __pure lldiv_t lldiv(__int64  , __int64  );
   











 
#line 613 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"



 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __pure __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __pure __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 



 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 867 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdlib.h"


 

#line 23 "FS\\FS_Int.h"
#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"
 
 
 
 





 






 








#line 33 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"






#line 47 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"

 
#line 57 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"

 
 









 
#line 79 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"





#line 131 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"

extern __declspec(__nothrow) __pure unsigned char **__rt_ctype_table(void);







    extern int (isalnum)(int  );

     





    extern int (isalpha)(int  );

     





    extern int (iscntrl)(int  );

     
     

 




    extern int (isdigit)(int  );

     

    extern int (isblank)(int  );
     
     
     





    extern int (isgraph)(int  );

     





    extern int (islower)(int  );

     





    extern int (isprint)(int  );

     
     





    extern int (ispunct)(int  );

     





    extern int (isspace)(int  );

     





    extern int (isupper)(int  );

     

 
 

__inline int __isxdigit_helper(int __t) { return (__t ^ (__t << 2)); }




    extern int (isxdigit)(int  );

     



extern int tolower(int  );
     
     

extern int toupper(int  );
     
     







#line 270 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\ctype.h"



 

#line 24 "FS\\FS_Int.h"

#line 1 "FS\\FS_Types.h"















 





#line 1 "GUI\\Global.h"















 









 
#line 33 "GUI\\Global.h"



 
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







 
#line 26 "FS\\FS_Int.h"
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







 
#line 27 "FS\\FS_Int.h"
#line 1 "FS\\FS_Debug.h"


















 




#line 1 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"
 
 
 





 










#line 27 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"








 

 
 
  typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 






#line 119 "C:\\Program Files (x86)\\Keil\\V473\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"











 

#line 25 "FS\\FS_Debug.h"
#line 26 "FS\\FS_Debug.h"
#line 27 "FS\\FS_Debug.h"


#line 35 "FS\\FS_Debug.h"

#line 43 "FS\\FS_Debug.h"










 

void FS_AddWarnFilter (unsigned long FilterMask);
void FS_SetWarnFilter (unsigned long FilterMask);
void FS_AddLogFilter  (unsigned long FilterMask);
void FS_SetLogFilter  (unsigned long FilterMask);
void FS_AddErrorFilter(unsigned long FilterMask);
void FS_SetErrorFilter(unsigned long FilterMask);

void FS_PrintfSafe(char * pBuffer, const char * sFormat, int BufferSize, va_list * pParamList);
void FS_ErrorOutf(unsigned long Type, const char * sFormat, ...);
void FS_Logf     (unsigned long Type, const char * sFormat, ...);
void FS_Warnf    (unsigned long Type, const char * sFormat, ...);






 






 

 

#line 89 "FS\\FS_Debug.h"






 

 

#line 106 "FS\\FS_Debug.h"






 
 

#line 122 "FS\\FS_Debug.h"








 















 
#line 28 "FS\\FS_Int.h"
#line 29 "FS\\FS_Int.h"
#line 1 "FS\\FS_OS.h"



















 





#line 27 "FS\\FS_OS.h"





void FS_X_OS_Lock   (unsigned LockIndex);
void FS_X_OS_Unlock (unsigned LockIndex);

void FS_X_OS_Init   (unsigned MaxNumLocks);
void FS_X_OS_DeInit (void);

unsigned long  FS_X_OS_GetTime(void);

int  FS_X_OS_Wait   (int Timeout);
void FS_X_OS_Signal (void);







 
#line 30 "FS\\FS_Int.h"

#line 1 "FS\\FAT.h"















 




#line 1 "FS\\FS_Int.h"















 

#line 970 "FS\\FS_Int.h"

 
#line 22 "FS\\FAT.h"








 
int  FS_FAT_GetDiskInfo   (FS_VOLUME * pVolume, FS_DISK_INFO * pDiskData, int Flags);
unsigned long  FS_FAT_GetDiskSpace  (FS_VOLUME * pVolume);
int  FS_FAT_GetVolumeLabel(FS_VOLUME * pVolume, char * pVolumeLabel, unsigned VolumeLabelSize);
int  FS_FAT_SetVolumeLabel(FS_VOLUME * pVolume, const char * pVolumeLabel);




 

unsigned long  FS_FAT_Read(FS_FILE *pFile, void *pData, unsigned long NumBytes);





 
unsigned long  FS_FAT_Write  (FS_FILE   * pFile, const void *pData, unsigned long NumBytes);
void FS_FAT_Close  (FS_FILE   * pFile);
void FS_FAT_Clean  (FS_VOLUME * pVolume);





 
char FS_FAT_Open   (const char * pFileName, FS_FILE * pFile, char DoDel, char DoOpen, char DoCreate);




 
int  FS_FAT_CheckBPB(FS_VOLUME * pVolume);
int  FS_FAT_CreateJournalFile(FS_VOLUME * pVolume, unsigned long NumClusters, unsigned long * pFirstSector, unsigned long * pNumSectors);
int  FS_FAT_OpenJournalFile(FS_VOLUME * pVolume);
unsigned long  FS_FAT_GetIndexOfLastSector(FS_VOLUME * pVolume);




 
int  FS_FAT_Format  (FS_VOLUME * pVolume, FS_FORMAT_INFO    * pFormatInfo);
int  FS_FAT_FormatEx(FS_VOLUME * pVolume, FS_FORMAT_INFO_EX * pFormatInfoEx);





 
int   FS_FAT_Move(const char * sOldName, const char * sNewName, FS_VOLUME * pVolume);






 
char  FS_FAT_SetDirEntryInfo(FS_VOLUME * pVolume, const char * sName, const void * p, int Mask);
char  FS_FAT_GetDirEntryInfo(FS_VOLUME * pVolume, const char * sName,       void * p, int Mask);




 
int   FS_FAT_Rename(const char * sOldName, const char * sNewName, FS_VOLUME * pVolume);




 
int   FS_FAT_OpenDir  (const char *pDirName, FS__DIR *pDir);
int   FS_FAT_CloseDir (FS__DIR *pDir);
int   FS_FAT_ReadDir  (FS__DIR *pDir, FS_DIRENTRY_INFO * pDirEntryInfo);
int   FS_FAT_RemoveDir(FS_VOLUME * pVolume, const char *pDirName);
int   FS_FAT_CreateDir(FS_VOLUME * pVolume, const char *pDirName);






 
int FS_FAT_SetEndOfFile(FS_FILE * pFile);





 
int FS_FAT__CheckDisk(FS_VOLUME * pVolume, FS_DISK_INFO * pDiskInfo, void * pBuffer, unsigned long BufferSize, int MaxRecursionLevel, FS_QUERY_F_TYPE * pfOnError);







 
#line 33 "FS\\FS_Int.h"
















 














 

typedef struct {
  int TypeMask;     
  int ModeMask;     
} CACHE_MODE;

typedef struct {
  int TypeMask;     
  int NumSectors;   
} CACHE_QUOTA;

typedef struct {
  unsigned long FirstSector;
  unsigned long NumSectors;
} CACHE_FREE;








 
struct FS_FAT_INFO {
  unsigned long          NumSectors;       
  unsigned short          BytesPerSec;      
  unsigned short          ldBytesPerSector; 
  unsigned long          FirstDataSector;
  unsigned long          BytesPerCluster;
  unsigned long          FATSize;          
  unsigned long          RootDirPos;        
  unsigned short          RootEntCnt;        
  unsigned short          RsvdSecCnt;        
  unsigned char           SecPerClus;        
  unsigned char           NumFATs;           
  unsigned char           FATType;           
  unsigned long          NumClusters;
  unsigned long          NumFreeClusters;   
  unsigned long          NextFreeCluster;   

  unsigned short          FSInfoSector;
  unsigned short          FSInfoSectorIsInvalidated;

};

struct FS_EFS_INFO {
  unsigned long          NumSectors;         
  unsigned short          BytesPerSector;     
  unsigned short          ldBytesPerSector;   
  unsigned long          FirstDataSector;    
  unsigned long          BytesPerCluster;    
  unsigned long          EFSTableSize;       
  unsigned long          RootDirPos;         
  unsigned char           SectorsPerCluster;  
  unsigned long          NumClusters;        
  unsigned long          NumFreeClusters;    
  unsigned long          NextFreeCluster;    
};


typedef union {
  FS_FAT_INFO  FATInfo;
  FS_EFS_INFO  EFSInfo;
  struct {
    unsigned long          NumSectors;         
    unsigned short          BytesPerSector;     
    unsigned short          ldBytesPerSector;   
  } Info;
} FS_INFO;

typedef struct {
  unsigned char Unit;
  unsigned char IsInited;
  unsigned char JournalIsActive;
  unsigned char JournalUnit;

  const FS_CACHE_API * pCacheAPI;
  void               * pCacheData;


  FS_BUSY_LED_CALLBACK * pfSetBusyLED;




  FS_ONDEVICEACTIVITYHOOK * pfOnDeviceActivityHook;
} FS_DEVICE_DATA;

struct FS_DEVICE {
  const FS_DEVICE_TYPE * pType;
  FS_DEVICE_DATA         Data;
};

struct FS_PARTITION {
  FS_DEVICE Device;
  unsigned long       StartSector;
  unsigned long       NumSectors;
};

typedef struct {
  int   InUse;
  unsigned long * pBuffer;
} SECTOR_BUFFER;


typedef void        FS_CB_CLOSE               (FS_FILE    * pFile);
typedef int         FS_CB_CHECKFS_API         (FS_VOLUME  * pVolume);
typedef unsigned long         FS_CB_READ                (FS_FILE    * pFile,           void  * pData, unsigned long NumBytes);
typedef unsigned long         FS_CB_WRITE               (FS_FILE    * pFile,     const void  * pData, unsigned long NumBytes);
typedef char        FS_CB_OPEN                (const char * pFileName, FS_FILE * pFile, char DoDel, char DoOpen, char DoCreate);
typedef int         FS_CB_FORMAT              (FS_VOLUME  * pVolume,   FS_FORMAT_INFO * pFormatInfo);
typedef int         FS_CB_OPENDIR             (const char * pDirName,  FS__DIR *pDir);
typedef int         FS_CB_CLOSEDIR            (FS__DIR    * pDir);
typedef int         FS_CB_READDIR             (FS__DIR    * pDir,      FS_DIRENTRY_INFO * pDirEntryInfo);
typedef int         FS_CB_REMOVEDIR           (FS_VOLUME  * pVolume,   const char * pDirName);
typedef int         FS_CB_CREATEDIR           (FS_VOLUME  * pVolume,   const char * pDirName);
typedef int         FS_CB_RENAME              (const char * sOldName,  const char * sNewName, FS_VOLUME * pVolume);
typedef int         FS_CB_MOVE                (const char * sOldName,  const char * sNewName, FS_VOLUME * pVolume);
typedef char        FS_CB_SETDIRENTRYINFO     (FS_VOLUME  * pVolume,   const char * sName, const void * p, int Mask);
typedef char        FS_CB_GETDIRENTRYINFO     (FS_VOLUME  * pVolume,   const char * sName,       void * p, int Mask);
typedef int         FS_CB_SETENDOFFILE        (FS_FILE    * pFile);
typedef void        FS_CB_UNMOUNT             (FS_VOLUME  * pVolume);

typedef int         FS_CB_GETDISKINFO         (FS_VOLUME  * pVolume,   FS_DISK_INFO * pDiskData, int Flags);
typedef int         FS_CB_GETVOLUMELABEL      (FS_VOLUME  * pVolume,   char * pVolumeLabel, unsigned VolumeLabelSize);
typedef int         FS_CB_SETVOLUMELABEL      (FS_VOLUME  * pVolume,   const char * pVolumeLabel);
typedef int         FS_CB_CREATEJOURNALFILE   (FS_VOLUME  * pVolume,   unsigned long NumBytes, unsigned long * pFirstSector, unsigned long * pNumSectors);
typedef int         FS_CB_OPENJOURNALFILE     (FS_VOLUME  * pVolume);
typedef unsigned long         FS_CB_GETINDEXOFLASTSECTOR(FS_VOLUME  * pVolume);
typedef int         FS_CB_CHECKDISK           (FS_VOLUME  * pVolume,   FS_DISK_INFO * pDiskInfo, void * pBuffer, unsigned long BufferSize, int MaxRecursionLevel, FS_QUERY_F_TYPE * pfOnError);
typedef void        FS_CB_UPDATE_FILE         (FS_FILE    * pFile);

typedef struct {
  FS_CB_CHECKFS_API          * pfCheckBootSector;
  FS_CB_OPEN                 * pfOpen;
  FS_CB_CLOSE                * pfClose;
  FS_CB_READ                 * pfRead;
  FS_CB_WRITE                * pfWrite;
  FS_CB_FORMAT               * pfFormat;
  FS_CB_OPENDIR              * pfOpenDir;
  FS_CB_CLOSEDIR             * pfCloseDir;
  FS_CB_READDIR              * pfReadDir;
  FS_CB_REMOVEDIR            * pfRemoveDir;
  FS_CB_CREATEDIR            * pfCreateDir;
  FS_CB_RENAME               * pfRename;
  FS_CB_MOVE                 * pfMove;
  FS_CB_SETDIRENTRYINFO      * pfSetDirEntryInfo;
  FS_CB_GETDIRENTRYINFO      * pfGetDirEntryInfo;
  FS_CB_SETENDOFFILE         * pfSetEndOfFile;
  FS_CB_UNMOUNT              * pfUnmount;
  FS_CB_GETDISKINFO          * pfGetDiskInfo;
  FS_CB_GETVOLUMELABEL       * pfGetVolumeLabel;
  FS_CB_SETVOLUMELABEL       * pfSetVolumeLabel;
  FS_CB_CREATEJOURNALFILE    * pfCreateJournalFile;
  FS_CB_OPENJOURNALFILE      * pfOpenJournalFile;
  FS_CB_GETINDEXOFLASTSECTOR * pfGetIndexOfLastSector;
  FS_CB_CHECKDISK            * pfCheckDisk;
  FS_CB_UPDATE_FILE          * pfUpdateFile;
} FS_FS_API;

struct FS_VOLUME {
  FS_PARTITION Partition;
  FS_INFO      FSInfo;
  unsigned char           PartitionIndex;
  unsigned char           IsMounted;
  unsigned char           AllowAutoMount;
  unsigned char           InUse;



  FS_VOLUME *  pNext;
};




 
struct FS_DIR {
  FS__DIR     Dir;
  FS_DIRENT   DirEntry;
  signed short         error;               
  unsigned char          InUse;               
};




 
typedef union {
    struct {
      unsigned long      CurClusterFile;  
      unsigned long      CurClusterAbs;   
      unsigned long      DirEntrySector;  
      unsigned short      DirEntryIndex;   
      unsigned short      NumAdjClusters;  
    } Fat;
    struct {
      unsigned long      DirCluster;      
      unsigned long      DirEntryPos;     
      unsigned long      CurClusterFile;  
      unsigned long      CurClusterAbs;   
      unsigned short      NumAdjClusters;  
    } Efs;
} FS_INT_DATA;


typedef struct FS_FILE_OBJ FS_FILE_OBJ;
typedef struct {
  unsigned char       * pData;
  unsigned long        SectorIndex;
  unsigned   Off;
  unsigned   Size;
} FS_FILE_BUFFER;


struct FS_FILE_OBJ {       
  unsigned long           FirstCluster;    
  unsigned long           Size;            
  FS_VOLUME   * pVolume;
  unsigned char            UseCnt;          
  FS_INT_DATA   Data;




  FS_FILE_BUFFER * pBuffer;

  FS_FILE_OBJ * pNext;
};

struct FS_FILE {  
  FS_FILE_OBJ * pFileObj;
  unsigned long           FilePos;         
  signed short           Error;           
  unsigned char            InUse;           
  unsigned char            AccessFlags;
  FS_FILE     * pNext;
};





 
struct FS_SB {
  unsigned long SectorNo;



  FS_PARTITION * pPart;
  unsigned char *           pBuffer;
  char           IsDirty;
  char           HasError;
  unsigned char             Type;
  unsigned char             Read;           
};




 
unsigned long           FS__GetMediaStartSecEx(FS_VOLUME * pVolume, unsigned long * pNumSectors, unsigned char* pBuffer);
unsigned long           FS__GetMediaStartSec(unsigned char PartIndex, unsigned char *pBuffer);
signed char   FS__LocatePartition(FS_VOLUME * pVolume);




 
unsigned short           FS_LoadU16LE (const unsigned char *pBuffer);
unsigned long           FS_LoadU32LE (const unsigned char *pBuffer);
void          FS_StoreU16LE(      unsigned char *pBuffer, unsigned Data);
void          FS_StoreU24LE(      unsigned char *pBuffer, unsigned long Data);
void          FS_StoreU32LE(      unsigned char *pBuffer, unsigned long Data);




 
unsigned long           FS_LoadU32BE (const unsigned char *pBuffer);
unsigned short           FS_LoadU16BE (const unsigned char *pBuffer);
void          FS_StoreU32BE(      unsigned char *pBuffer, unsigned long Data);
void          FS_StoreU16BE(      unsigned char *pBuffer, unsigned Data);






 
struct FS_CACHE_API {
  char   (*pfReadFromCache)   (FS_DEVICE * pDevice,      unsigned long SectorNo,       void * pData, unsigned char  Type);
  char   (*pfUpdateCache)     (FS_DEVICE * pDevice,      unsigned long SectorNo, const void * pData, unsigned char  Type);     
  void   (*pfInvalidateCache) (void      * pCacheData);
  int    (*pfCommand)         (FS_DEVICE * pDevice   ,   int Cmd, void *p);
  char   (*pfWriteIntoCache)  (FS_DEVICE * pDevice   ,   unsigned long SectorNo, const void * pData, unsigned char  Type);     

};





 
void FS__SB_Clean          (FS_SB * pSB);
char FS__SB_Create         (FS_SB * pSB, FS_PARTITION *pPart);
void FS__SB_Delete         (FS_SB * pSB);
void FS__SB_Flush          (FS_SB * pSB);
void FS__SB_MarkDirty      (FS_SB * pSB);
void FS__SB_MarkValid      (FS_SB * pSB, unsigned long SectorNo, unsigned char Type);
void FS__SB_MarkNotDirty   (FS_SB * pSB);
char FS__SB_Read           (FS_SB * pSB);
void FS__SB_SetSector      (FS_SB * pSB, unsigned long SectorNo, unsigned char Type);
char FS__SB_Write          (FS_SB * pSB);









 
void    FS_Lock_SB  (FS_PARTITION * pPart, unsigned long SectorIndex);
void    FS_Unlock_SB(FS_PARTITION * pPart, unsigned long SectorIndex);






 
int   FS__CACHE_CommandVolume  (FS_VOLUME * pVolume, int Cmd, void * pData);
int   FS__CACHE_CommandDevice  (FS_DEVICE * pDevice, int Cmd, void * pData);
void  FS__CACHE_CleanNL        (FS_DEVICE * pDevice);
void  FS__CACHE_Clean          (FS_VOLUME * pVolume);






 
unsigned char *  FS__AllocSectorBuffer (void);
void  FS__FreeSectorBuffer  (void * p);





 
void           FS_memcpy(void * pDest, const void * pSrc, int NumBytes);
const char *   FS__strchr     (const char *s, int c);
void           FS__AddSpaceHex(unsigned long v, unsigned char Len, char** ps);





 
FS_VOLUME * FS__FindVolume     (const char *pFullName, const char ** pFileName);
int         FS__Mount          (FS_VOLUME * pVolume, unsigned char MountType);
int         FS__AutoMount      (FS_VOLUME * pVolume);
void        FS__Unmount        (FS_VOLUME * pVolume);
void        FS__UnmountLL      (FS_VOLUME * pVolume);
void        FS__UnmountForcedLL(FS_VOLUME * pVolume);
void        FS__Sync           (FS_VOLUME * pVolume);
void        FS__STORAGE_Sync   (FS_VOLUME * pVolume);





 
int         FS__FClose           (FS_FILE * pFile);
unsigned long         FS__GetFileSize      (FS_FILE * pFile);
unsigned long         FS__Read             (FS_FILE * pFile,       void * pData, unsigned long NumBytes);
unsigned long         FS__Write            (FS_FILE * pFile, const void * pData, unsigned long NumBytes);
int         FS__Verify           (FS_FILE * pFile, const void * pData, unsigned long NumBytes);
int         FS__Remove           (const char * pFileName);
FS_FILE *   FS__FOpen            (const char * pFileName, const char * pMode);
FS_FILE *   FS__FOpenEx          (const char * pFileName, unsigned char AccessFlags, char DoCreate, char DoDel, char DoOpen);
FS_FILE *   FS__OpenEx           (FS_VOLUME  * pVolume,   const char * sFilePath, unsigned char AccessFlags, char DoCreate, char DoDel, char DoOpen);

unsigned long         FS__CalcSizeInBytes  (unsigned long NumClusters,   unsigned long SectorsPerCluster, unsigned long BytesPerSector);
unsigned long         FS__CalcSizeInKB     (unsigned long NumClusters, unsigned long SectorsPerCluster, unsigned long BytesPerSector);

FS_VOLUME * FS__AddDevice        (const FS_DEVICE_TYPE * pDevType);
int         FS__AddPhysDevice    (const FS_DEVICE_TYPE * pDevType);

int         FS__IoCtl            (FS_VOLUME * pVolume, signed long Cmd, signed long Aux, void *pBuffer);
int         FS__Format           (FS_VOLUME * pVolume, FS_FORMAT_INFO * pFormatInfo);
int         FS__SD_Format        (FS_VOLUME  * pVolume);
int         FS__GetNumVolumes    (void);
int         FS__CopyFile         (const char * sSource, const char   * sDest);
int         FS__GetVolumeInfo    (const char * sVolume, FS_DISK_INFO * pInfo);
int         FS__GetVolumeInfoEx  (const char * sVolume, FS_DISK_INFO * pInfo, int Flags);
int         FS__CreateDir        (const char * sDir);
int         FS__MkDir            (const char * pDirName);
int         FS__RmDir            (const char * pDirName);
int         FS__FSeek            (FS_FILE *pFile, signed long Offset, int Origin);
signed long         FS__FTell            (FS_FILE *pFile);
int         FS__GetFileTimeEx    (const char * pName, unsigned long * pTimeStamp, int Index);
int         FS__SetFileTimeEx    (const char * pName, unsigned long   TimeStamp,  int Index);
int         FS__SetFileAttributes(const char * pName, unsigned char    Attributes);
unsigned char          FS__GetFileAttributes(const char * pName);
int         FS__SetEndOfFile     (FS_FILE    * pFile);
void        FS__RemoveDevices    (void);
void        FS__RemoveDevice     (FS_VOLUME * pVolume);

FS_DIR    * FS__OpenDir      (const char *pDirName);
FS_DIRENT * FS__ReadDir      (FS_DIR *pDir);
int         FS__CloseDir     (FS_DIR *pDir);
void        FS__RewindDir    (FS_DIR *pDir);
void        FS__DirEnt2Attr  (FS_DIRENT *pDirEnt, unsigned char* pAttr);
unsigned long         FS__GetNumFiles  (FS_DIR *pDir);
int         FS__FindFirstFile(FS_FIND_DATA * pfd, const char * sPath, char * sFilename, int sizeofFilename);
int         FS__FindFirstFileEx(FS_FIND_DATA * pfd, FS_VOLUME * pVolume, const char * sPath, char * sFilename, int sizeofFilename);
int         FS__FindNextFile (FS_FIND_DATA * pfd);
void        FS__FindClose    (FS_FIND_DATA * pfd);

int         FS__FormatLow      (FS_VOLUME * pVolume);
void        FS__UnmountForced  (FS_VOLUME * pVolume);
int         FS__GetVolumeStatus(FS_VOLUME * pVolume);

int         FS__ReadSector   (FS_VOLUME * pVolume,       void * pData, unsigned long SectorIndex);
int         FS__ReadSectors  (FS_VOLUME * pVolume,       void * pData, unsigned long SectorIndex, unsigned long NumSectors);
int         FS__WriteSector  (FS_VOLUME * pVolume, const void * pData, unsigned long SectorIndex);
int         FS__WriteSectors (FS_VOLUME * pVolume, const void * pData, unsigned long SectorIndex, unsigned long NumSectors);
int         FS__GetDeviceInfo(FS_VOLUME * pVolume, FS_DEV_INFO * pDevInfo);
int         FS__IsLLFormatted(FS_VOLUME * pVolume);





 
int         FS__FCloseNL             (FS_FILE   * pFile);
int         FS__CACHE_CommandDeviceNL(FS_DEVICE * pDevice, int Cmd, void * pData);
int         FS__IoCtlNL              (FS_VOLUME * pVolume, signed long Cmd, signed long Aux, void * Buffer);
void        FS__UnmountForcedNL      (FS_VOLUME * pVolume);
void        FS__UnmountNL            (FS_VOLUME * pVolume);
int         FS__MountNL              (FS_VOLUME * pVolume, unsigned char MountType);
int         FS__AutoMountNL          (FS_VOLUME * pVolume);





 
FS_FILE * FS__AllocFileHandle(void);
void      FS__FreeFileHandle(FS_FILE * pFile);





 
FS_FILE_OBJ * FS__AllocFileObj(const char  * sFullFileName);
FS_FILE_OBJ * FS__GetFileObj  (const char  * sFullFileName);
void          FS__FreeFileObj (FS_FILE_OBJ * pFileObj);





 
int  FS__ECC256_Apply(unsigned long * pData, unsigned long eccRead);
unsigned long  FS__ECC256_Calc (const unsigned long * pData);
int  FS__ECC256_IsValid(unsigned long ecc);
unsigned long  FS__ECC256_Load (const unsigned char * p);
void FS__ECC256_Store(unsigned char * p, unsigned long ecc);





 
unsigned long      FS__DivideU32Up            (unsigned long Nom, unsigned long Div);
unsigned long      FS_CRC32_Calc              (const unsigned char* pData, unsigned NumBytes, unsigned long crc);
unsigned FS_BITFIELD_CalcSize       (unsigned NumItems, unsigned BitsPerItem);
unsigned FS_BITFIELD_CalcNumBitsUsed(unsigned v);
unsigned long      FS_BITFIELD_Read           (const void * pBase, unsigned BitOff, unsigned NumBits);
void     FS_BITFIELD_Write          (unsigned char * pBase, unsigned BitOff, unsigned NumBits, unsigned long v);






 
extern FS_FILE       * FS__pFirstFilehandle;
extern FS_FILE_OBJ   * FS__pFirstFileObj;
extern FS_VOLUME       FS__FirstVolume;
extern FS_DIR          FS__aDirHandle  [1];
extern unsigned short             FS__MaxSectorSize;
extern unsigned char              FS__IsInited;
extern int             FS__NumVolumes;
extern SECTOR_BUFFER * FS__paSectorBuffer;
extern unsigned        FS__NumSectorBuffers;
extern char            FS__UpdateDirAfterWrite;















 

#line 610 "FS\\FS_Int.h"
  
  
  
  





















#line 674 "FS\\FS_Int.h"

void FS_OS_Lock  (unsigned LockIndex);
void FS_OS_Unlock(unsigned LockIndex);
void FS_OS_Init  (unsigned NumLocks);
void FS_OS_DeInit(void);





 
int  FS__JOURNAL_Begin     (FS_VOLUME * pVolume);
int  FS__JOURNAL_End       (FS_VOLUME * pVolume);
void FS__JOURNAL_Delete    (FS_VOLUME * pVolume, unsigned long LastSectorInFS);
void FS__JOURNAL_Invalidate(FS_VOLUME * pVolume);
int  FS__JOURNAL_Clean     (FS_VOLUME * pVolume);

#line 706 "FS\\FS_Int.h"

#line 713 "FS\\FS_Int.h"










 















 



#line 823 "FS\\FS_Int.h"

void        FS_MAP_Close               (FS_FILE    * pFile);
int         FS_MAP_CheckFS_API         (FS_VOLUME  * pVolume);
unsigned long         FS_MAP_Read                (FS_FILE    * pFile,           void  * pData, unsigned long NumBytes);
unsigned long         FS_MAP_Write               (FS_FILE    * pFile,     const void  * pData, unsigned long NumBytes);
char        FS_MAP_Open                (const char * pFileName, FS_FILE * pFile, char DoDel, char DoOpen, char DoCreate);
int         FS_MAP_Format              (FS_VOLUME  * pVolume,   FS_FORMAT_INFO * pFormatInfo);
int         FS_MAP_OpenDir             (const char * pDirName,  FS__DIR *pDir);
int         FS_MAP_CloseDir            (FS__DIR    * pDir);
int         FS_MAP_ReadDir             (FS__DIR    * pDir,      FS_DIRENTRY_INFO * pDirEntryInfo);
int         FS_MAP_RemoveDir           (FS_VOLUME  * pVolume,   const char * pDirName);
int         FS_MAP_CreateDir           (FS_VOLUME  * pVolume,   const char * pDirName);
int         FS_MAP_Rename              (const char * sOldName,  const char * sNewName, FS_VOLUME * pVolume);
int         FS_MAP_Move                (const char * sOldName,  const char * sNewName, FS_VOLUME * pVolume);
char        FS_MAP_SetDirEntryInfo     (FS_VOLUME  * pVolume,   const char * sName, const void * p, int Mask);
char        FS_MAP_GetDirEntryInfo     (FS_VOLUME  * pVolume,   const char * sName,       void * p, int Mask);
int         FS_MAP_SetEndOfFile        (FS_FILE    * pFile);
void        FS_MAP_Clean               (FS_VOLUME  * pVolume);
int         FS_MAP_GetDiskInfo         (FS_VOLUME  * pVolume,   FS_DISK_INFO * pDiskData, int Flags);
int         FS_MAP_GetVolumeLabel      (FS_VOLUME  * pVolume,   char * pVolumeLabel, unsigned VolumeLabelSize);
int         FS_MAP_SetVolumeLabel      (FS_VOLUME  * pVolume,   const char * pVolumeLabel);
int         FS_MAP_CreateJournalFile   (FS_VOLUME  * pVolume,   unsigned long NumBytes, unsigned long * pFirstSector, unsigned long * pNumSectors);
int         FS_MAP_OpenJournalFile     (FS_VOLUME  * pVolume);
unsigned long         FS_MAP_GetIndexOfLastSector(FS_VOLUME  * pVolume);
int         FS_MAP_CheckDisk           (FS_VOLUME  * pVolume,   FS_DISK_INFO * pDiskInfo, void * pBuffer, unsigned long BufferSize, int MaxRecursionLevel, FS_QUERY_F_TYPE * pfOnError);
void        FS_MAP_UpdateFile          (FS_FILE    * pFile);










 

int            FS__CLIB_atoi    (const char *s);
int            FS__CLIB_memcmp  (const void *s1, const void *s2, unsigned n);
void *         FS__CLIB_memset  (void *s, int c, unsigned long n);
int            FS__CLIB_strcmp  (const char *s1, const char *s2);
char *         FS__CLIB_strcpy  (char *s1, const char *s2);
unsigned       FS__CLIB_strlen  (const char *s);
int            FS__CLIB_strncmp (const char *s1, const char *s2, int n);
char *         FS__CLIB_strncpy (char *s1, const char *s2, unsigned long n);
int            FS__CLIB_toupper (int c);
char *         FS__CLIB_strcat  (char *s1, const char *s2);
char *         FS__CLIB_strncat (char *s1, const char *s2, unsigned long n);


#line 909 "FS\\FS_Int.h"










 

int    FS_LB_GetStatus           (FS_DEVICE    * pDevice);
unsigned short    FS_GetSectorSize          (FS_DEVICE    * pDevice);
int    FS_LB_GetDeviceInfo       (FS_DEVICE    * pDevice, FS_DEV_INFO * pDevInfo);
int    FS_LB_InitMedium          (FS_DEVICE    * pDevice);
int    FS_LB_InitMediumIfRequired(FS_DEVICE    * pDevice);
int    FS_LB_Ioctl               (FS_DEVICE    * pDevice, signed long Cmd,         signed long Aux,              void * pBuffer);
void   FS_LB_FreePartSectors     (FS_PARTITION * pPart,   unsigned long SectorIndex, unsigned long NumSectors);
int    FS_LB_ReadBurst           (FS_PARTITION * pPart,   unsigned long SectorNo,    unsigned long NumSectors,       void * pBuffer, unsigned char Type);
int    FS_LB_ReadDevice          (FS_DEVICE    * pDevice, unsigned long Sector,                            void * pBuffer, unsigned char Type);
int    FS_LB_ReadPart            (FS_PARTITION * pPart,   unsigned long Sector,                            void * pBuffer, unsigned char Type);
int    FS_LB_WriteBurst          (FS_PARTITION * pPart,   unsigned long SectorNo,    unsigned long NumSectors, const void * pBuffer, unsigned char Type);
int    FS_LB_WriteDevice         (FS_DEVICE    * pDevice, unsigned long Sector,                      const void * pBuffer, unsigned char Type);
int    FS_LB_WritePart           (FS_PARTITION * pPart,   unsigned long Sector,                      const void * pBuffer, unsigned char Type);
int    FS_LB_WriteMultiple       (FS_PARTITION * pPart,   unsigned long Sector,      unsigned long NumSectors, const void * pBuffer, unsigned char Type);









 

int FS__JOURNAL_Create           (FS_VOLUME * pVolume, unsigned long FirstSector, unsigned long NumSectors);
int FS__JOURNAL_GetNumFreeSectors(FS_VOLUME * pVolume);
int FS__JOURNAL_IsPresent        (FS_VOLUME * pVolume);
int FS__JOURNAL_Mount            (FS_VOLUME * pVolume);
int FS__JOURNAL_Read             (const FS_DEVICE * pDevice, unsigned long SectorNo, void * pBuffer, unsigned long NumSectors);
int FS__JOURNAL_Write            (const FS_DEVICE * pDevice, unsigned long SectorNo, const void * pBuffer, unsigned long NumSectors, unsigned char RepeatSame);
void FS__JOURNAL_DeInit          (FS_VOLUME * pVolume);






 











 
#line 28 "FS\\FS_X_embOS.c"
#line 29 "FS\\FS_X_embOS.c"

#line 1 "OS\\RTOS.h"
















 









 

#line 30 "OS\\RTOS.h"






 

#line 50 "OS\\RTOS.h"

 






 











 





 




  typedef void    OS_ISR_HANDLER(void);
  void            OS_irq_handler(void);      
  void            OS_IRQ_SERVICE(void);      
  void            OS_USER_irq_func(void);    
  OS_ISR_HANDLER* OS_ARM_InstallISRHandler (int ISRIndex, OS_ISR_HANDLER* pFunc);
  void            OS_ARM_EnableISR         (int ISRIndex);
  void            OS_ARM_DisableISR        (int ISRIndex);
  int             OS_ARM_ISRSetPrio        (int ISRIndex, int Prio);
  void            OS_ARM_AssignISRSource   (int ISRIndex, int Source);
  void            OS_ARM_EnableISRSource   (int SourceIndex);
  void            OS_ARM_DisableISRSource  (int SourceIndex);
  void            OS_StartTask             (void);
  void            OS_InitPLL               (void);




 

 
  
extern const struct OS_EXTEND_TASK_CONTEXT OS_VFP_ExtendContext;

 

void OS_ARM_ICACHE_Enable(void);
void OS_ARM_DCACHE_Enable(void);
void OS_ARM_DCACHE_CleanRange     (void* p, unsigned int NumBytes);
void OS_ARM_DCACHE_InvalidateRange(void* p, unsigned int NumBytes);
void OS_ARM_CACHE_Sync(void);

void OS_ARM_MMU_Enable(unsigned int* pTranslationTable);
void OS_ARM_MMU_InitTT(unsigned int* pTranslationTable);
void OS_ARM_MMU_AddTTEntries(unsigned int* pTranslationTable, unsigned int CacheMode, unsigned int VIndex, unsigned int PIndex, unsigned int NumEntries);

void OS_ARM720_CACHE_Enable(void);
void OS_ARM720_CACHE_CleanRange(void* p, unsigned int NumBytes);
void OS_ARM720_CACHE_InvalidateRange(void* p, unsigned int NumBytes);

void OS_ARM720_MMU_Enable(unsigned int* pTranslationTable);
void OS_ARM720_MMU_InitTT(unsigned int* pTranslationTable);
void OS_ARM720_MMU_AddTTEntries(unsigned int* pTranslationTable, unsigned int CacheMode, unsigned int VIndex, unsigned int PIndex, unsigned int NumEntries);














 










 






















 








 

#line 1 "Config\\OS_Config.h"












 

















 





#line 43 "Config\\OS_Config.h"



 
#line 187 "OS\\RTOS.h"















 



 
#line 213 "OS\\RTOS.h"

#line 283 "OS\\RTOS.h"












 






 

#line 310 "OS\\RTOS.h"































































 










































#line 423 "OS\\RTOS.h"






















 

#line 453 "OS\\RTOS.h"

#line 460 "OS\\RTOS.h"






 

































 


















 

 

 




 
 


 


 





 







 


 




 



 
#line 569 "OS\\RTOS.h"









 
#line 586 "OS\\RTOS.h"

 


 
#line 597 "OS\\RTOS.h"

 



 


 




 




 


 


 












 





 
#line 651 "OS\\RTOS.h"

 





 
#line 669 "OS\\RTOS.h"

#line 676 "OS\\RTOS.h"






 
#line 689 "OS\\RTOS.h"

 
#line 699 "OS\\RTOS.h"

 
#line 708 "OS\\RTOS.h"

 




 














 


















 





#line 761 "OS\\RTOS.h"

 

































 

typedef struct OS_TASK         OS_TASK;
typedef struct OS_WAIT_LIST    OS_WAIT_LIST;
typedef struct OS_WAIT_OBJ     OS_WAIT_OBJ;
typedef struct OS_WAIT_OBJ_EX  OS_WAIT_OBJ_EX;
typedef struct OS_REGS         OS_REGS;

typedef void voidRoutine(void);
typedef void OS_RX_CALLBACK(unsigned char Data);
typedef void OS_TIMERROUTINE(void);
typedef void OS_TIMER_EX_ROUTINE(void *);
typedef void OS_ON_TERMINATE_FUNC(OS_TASK *);

typedef void OS_TICK_HOOK_ROUTINE(void);






 
struct OS_WAIT_OBJ {
  OS_WAIT_LIST * pWaitList;
};

struct OS_WAIT_OBJ_EX {
  OS_WAIT_OBJ WaitObj;
  int v;
};

struct OS_WAIT_LIST {
  OS_WAIT_LIST * pNext;     
  OS_WAIT_LIST * pPrev;
  OS_WAIT_OBJ  * pWaitObj;
  OS_TASK      * pTask;
};










 
typedef struct OS_EXTEND_TASK_CONTEXT {
  void (*pfSave)   (      void * pStack);
  void (*pfRestore)(const void * pStack);
} OS_EXTEND_TASK_CONTEXT;









 
struct OS_TASK {
  
  
  
  
  OS_TASK * pNext;                        
  OS_REGS  * pStack;           
  
  OS_WAIT_LIST * pWaitList;               
  int        Timeout;
  unsigned char          Priority;
  unsigned char          Stat;
  unsigned char          Events;                  
  unsigned char          EventMask;               
  
  
  

    OS_TASK      * pPrev;                   

  
  
  

    const char * Name;

  
  
  




  
  
  




  
  
  





  
  
  

    unsigned char  TimeSliceRem;
    unsigned char  TimeSliceReload;

  
  
  

    const OS_EXTEND_TASK_CONTEXT * pExtendContext;

  
  
  



  
  
  



};




 
typedef struct OS_timer OS_TIMER;
struct OS_timer {
  OS_TIMER * pNext;
  voidRoutine* Hook;
  int Time;
  int Period;
  char    Active;



};




 
typedef struct {
  OS_TIMER Timer;
  OS_TIMER_EX_ROUTINE * pfUser;
  void * pData;
} OS_TIMER_EX;




 
typedef struct OS_TICK_HOOK OS_TICK_HOOK;
struct OS_TICK_HOOK {
  OS_TICK_HOOK*          pNext;
  OS_TICK_HOOK_ROUTINE * pfUser;
};




 
typedef struct OS_RSEMA OS_RSEMA;
struct OS_RSEMA {
  OS_WAIT_OBJ WaitObj;
  OS_TASK * pTask;                 
  unsigned char UseCnt;
  OS_RSEMA * pNext;



};




 
typedef struct OS_CSEMA OS_CSEMA;
struct OS_CSEMA {
  OS_WAIT_OBJ WaitObj;
  unsigned int Cnt;




};




 
typedef struct OS_MAILBOX OS_MAILBOX;
struct OS_MAILBOX {
  OS_WAIT_OBJ WaitObj;



  char *pData;
  unsigned int nofMsg;
  unsigned int maxMsg;
  unsigned int iRd;
  unsigned char  sizeofMsg;



};




 
typedef struct OS_Q OS_Q;
struct OS_Q {
  OS_WAIT_OBJ WaitObj;
  OS_Q*    pNext;           
  unsigned char*   pData;
  unsigned int  Size;
  unsigned int  MsgCnt;
  unsigned int  offFirst;
  unsigned int  offLast;



};




 






typedef struct OS_MEMF OS_MEMF;
struct OS_MEMF {
  OS_WAIT_OBJ WaitObj;
  OS_MEMF* pNext;           
  void*    pPool;
  unsigned short   NumBlocks;
  unsigned short   BlockSize;
  unsigned short   NumFreeBlocks;
  unsigned short   MaxUsed;
  void*    pFree;




};




 
typedef struct  OS_EVENT OS_EVENT;

struct OS_EVENT {
  OS_WAIT_OBJ WaitObj;
  unsigned char       Signaled;



};




 
typedef struct {
  unsigned int  Time;
  void    *pCurrentTask;
  void    *p;
  unsigned int  v;
  unsigned char   iRout;
} OS_TRACE_ENTRY;







 




 
#line 1107 "OS\\RTOS.h"

 

 




 

typedef union {
  int Dummy;            
  struct {
    unsigned char Region;
    unsigned char DI;
  } Cnt;
} OS_COUNTERS;



  extern   volatile int OS_Time;
  extern   int         OS_TimeDex;
  extern   OS_COUNTERS OS_Counters;

  extern   unsigned char  OS_IntMSInc;
  extern   unsigned char  OS_Pending;
  extern   volatile unsigned char  OS_Status;


    extern   unsigned char  OS_TimeSlice;
    extern   unsigned char  OS_TimeSliceAtStart;





  extern         unsigned int OS_TicksPerMS;
  extern         int     OS_IntTicksInc;
#line 1154 "OS\\RTOS.h"


    extern  unsigned char OS_POWER_Levels[(5)];


  



 

    extern   OS_TASK      * OS_pTask;              
    extern   OS_TASK      * OS_pCurrentTask;       
    extern   OS_TASK volatile * volatile OS_pActiveTask;
    extern   OS_TIMER     * OS_pTimer;             
    extern   OS_TIMER     * OS_pCurrentTimer;      
    extern  OS_RSEMA      * OS_pRSema;
#line 1177 "OS\\RTOS.h"
    extern    OS_MEMF      * OS_pMEMF;             
    extern    OS_TICK_HOOK * OS_pTickHook;         
#line 1196 "OS\\RTOS.h"

#line 1269 "OS\\RTOS.h"

 




 








 






#line 1311 "OS\\RTOS.h"

#line 1334 "OS\\RTOS.h"





 












void OS_CreateTask_R  ( OS_TASK * pTask,
                      const char*Name,
                      unsigned char Priority,
                      void (*pRoutine)(void),
                      void  *pStack,
                      unsigned int StackSize
                      ,unsigned int TimeSlice
        );
void OS_CreateTaskEx_R  ( OS_TASK * pTask,
                        const char*Name,
                        unsigned char Priority,
                        void (*pRoutine)(void *),
                        void  *pStack,
                        unsigned int StackSize
                        ,unsigned int TimeSlice,
                        void * pContext
        );

void OS_ExtendTaskContext(const OS_EXTEND_TASK_CONTEXT * pExtendContext);






 

void  OS_Delay(int ms);                 
void  OS_DelayUntil(int t);             
unsigned char OS_GetSuspendCnt  (OS_TASK* pTask);   
void  OS_GetState       (OS_TASK* pTask);
char  OS_IsTask         (OS_TASK* pTask);   
void  OS_Resume         (OS_TASK* pTask);   
void  OS_SetTaskName    (OS_TASK * pTask, const char* s);
void  OS_SetPriority    (OS_TASK* pTask, unsigned char Prio);  
void  OS_Suspend        (OS_TASK* pTask);   
void  OS_Terminate      (OS_TASK* pTask);   
void  OS_TerminateError (void);             
void  OS_WakeTask       (OS_TASK* pTask);   
void  OS_Yield          (void);             












 

const char* OS_GetCPU(void);
const char* OS_GetLibMode(void);
const char* OS_GetModel(void);
const char* OS_GetLibName(void);

unsigned int OS_GetVersion(void);










  const char* OS_GetTaskName(OS_TASK *);




#line 1440 "OS\\RTOS.h"

unsigned int OS_GetSysStackBase(void);   
unsigned int OS_GetSysStackSize(void);   
unsigned int OS_GetIntStackBase(void);   
unsigned int OS_GetIntStackSize(void);   


  unsigned char OS_SetTimeSlice(OS_TASK * pTask, unsigned char TimeSlice);
  unsigned char OS_GetTimeSliceRem(OS_TASK  * pTask);






unsigned char    OS_GetPriority(OS_TASK * pTask);   


int     OS_GetNumTasks(void);               

OS_TASK* OS_TaskIndex2Ptr(int TaskIndex);   

#line 1475 "OS\\RTOS.h"


#line 1484 "OS\\RTOS.h"






 

int OS_WAIT_OBJ_GetSize(void);
int OS_WAIT_OBJ_EX_GetSize(void);
int OS_WAIT_LIST_GetSize(void);
int OS_EXTEND_TASK_CONTEXT_GetSize(void);
int OS_TASK_GetSize(void);
int OS_REGS_GetSize(void);
int OS_TIMER_GetSize(void);
int OS_TIMER_EX_GetSize(void);
int OS_TICK_HOOK_GetSize(void);
int OS_RSEMA_GetSize(void);
int OS_CSEMA_GetSize(void);
int OS_MAILBOX_GetSize(void);
int OS_Q_GetSize(void);
int OS_MEMF_GetSize(void);
int OS_EVENT_GetSize(void);
int OS_TRACE_ENTRY_GetSize(void);






 


void OS_LeaveRegion(void);





 

#line 1535 "OS\\RTOS.h"

#line 1543 "OS\\RTOS.h"






 




void OS_RestoreI(void);   






 










#line 1589 "OS\\RTOS.h"

#line 1597 "OS\\RTOS.h"


void OS_CallISR        (void (*pRoutine)(void));
void OS_CallNestableISR(void (*pRoutine)(void));


#line 1610 "OS\\RTOS.h"



















#line 1638 "OS\\RTOS.h"







#line 1651 "OS\\RTOS.h"

#line 1659 "OS\\RTOS.h"

#line 1666 "OS\\RTOS.h"







#line 1681 "OS\\RTOS.h"

#line 1690 "OS\\RTOS.h"











void OS_SetFastIntPriorityLimit(unsigned int Priority);






 

int      OS_Use             (OS_RSEMA * pRSema);  
void     OS_Unuse           (OS_RSEMA * pRSema);  
char     OS_Request         (OS_RSEMA * pRSema);  
int      OS_GetSemaValue    (OS_RSEMA * pRSema);  
OS_TASK* OS_GetResourceOwner(OS_RSEMA * pRSema);  

void     OS_CreateRSema     (OS_RSEMA * pRSema);  
void     OS_DeleteRSema     (OS_RSEMA * pRSema);  








 

void  OS_CreateCSema    (OS_CSEMA * pCSema, unsigned int InitValue);   
void  OS_DeleteCSema    (OS_CSEMA * pCSema);                      
int   OS_GetCSemaValue  (OS_CSEMA * pCSema);                      
unsigned char OS_SetCSemaValue  (OS_CSEMA * pCSema, unsigned int value);       
void  OS_SignalCSema    (OS_CSEMA * pCSema);                      
void  OS_SignalCSemaMax (OS_CSEMA * pCSema, unsigned int MaxValue);    
void  OS_WaitCSema      (OS_CSEMA * pCSema);                      
int   OS_WaitCSemaTimed (OS_CSEMA * pCSema, int TimeOut);     
char  OS_CSemaRequest   (OS_CSEMA * pCSema);                      








 

void OS_CreateMB          (OS_MAILBOX * pMB, unsigned char sizeofMsg, unsigned int maxnofMsg, void* Buffer);     
void OS_ClearMB           (OS_MAILBOX * pMB);
void OS_PutMail           (OS_MAILBOX * pMB, void* pMail);
char OS_PutMailCond       (OS_MAILBOX * pMB, void* pMail);
void OS_PutMailFront      (OS_MAILBOX * pMB, void* pMail);
char OS_PutMailFrontCond  (OS_MAILBOX * pMB, void* pMail);
void OS_GetMail           (OS_MAILBOX * pMB, void* pDest);
char OS_GetMailCond       (OS_MAILBOX * pMB, void* pDest);
void OS_PutMail1          (OS_MAILBOX * pMB, const char* pMail);
char OS_PutMailCond1      (OS_MAILBOX * pMB, const char* pMail);
void OS_PutMailFront1     (OS_MAILBOX * pMB, const char* pMail);
char OS_PutMailFrontCond1 (OS_MAILBOX * pMB, const char* pMail);
void OS_GetMail1          (OS_MAILBOX * pMB, char* pDest);
char OS_GetMailCond1      (OS_MAILBOX * pMB, char* pDest);
char OS_GetMailTimed      (OS_MAILBOX * pMB, void* pDest, int Timeout);
void OS_DeleteMB          (OS_MAILBOX * pMB);
void OS_WaitMail          (OS_MAILBOX * pMB);












 

void    OS_Q_Create       (OS_Q* pQ, void*pData, unsigned int Size);
void    OS_Q_Clear        (OS_Q* pQ);                                 
int     OS_Q_GetMessageCnt(OS_Q* pQ);                                 
int     OS_Q_Put          (OS_Q* pQ, const void* pSrc, unsigned int Size);
int     OS_Q_GetPtr       (OS_Q* pQ, void**ppData);
int     OS_Q_GetPtrCond   (OS_Q* pQ, void**ppData);                   
int     OS_Q_GetPtrTimed  (OS_Q* pQ, void**ppData, int Timeout);  
void    OS_Q_Purge        (OS_Q* pQ);






 

char OS_ClearEvents          (OS_TASK * pTask);                  
char OS_GetEventsOccured     (OS_TASK * pTask);                  
void OS_SignalEvent          (char Event, OS_TASK * pTask);      
char OS_WaitEvent            (char EventMask);                   
char OS_WaitEventTimed       (char EventMask, int TimeOut);  
char OS_WaitSingleEvent      (char EventMask);                   
char OS_WaitSingleEventTimed (char EventMask, int TimeOut);  






 

#line 1818 "OS\\RTOS.h"

void    OS_CreateTimer    (OS_TIMER * pTimer, OS_TIMERROUTINE* Callback, int Timeout);
void    OS_RetriggerTimer (OS_TIMER * pTimer);
void    OS_StartTimer     (OS_TIMER * pTimer);
void    OS_StopTimer      (OS_TIMER * pTimer);
void    OS_DeleteTimer    (OS_TIMER * pTimer);                   
int OS_GetTimerPeriod (OS_TIMER * pTimer);                   
unsigned char   OS_GetTimerStatus (OS_TIMER * pTimer);                   
int OS_GetTimerValue  (OS_TIMER * pTimer);                   
void    OS_SetTimerPeriod (OS_TIMER * pTimer, int Period);   










 
void    OS_CreateTimerEx (OS_TIMER_EX * pTimerEx, OS_TIMER_EX_ROUTINE* Callback, int Timeout, void * pData);

#line 1849 "OS\\RTOS.h"















 


  void* OS_malloc(unsigned int);
  void  OS_free  (void* pMemBlock);
  void* OS_realloc  (void* pMemBlock, unsigned NewSize);







 

void  OS_MEMF_Create(OS_MEMF* pMEMF, void* pPool, unsigned short NumBlocks, unsigned short BlockSize);
void  OS_MEMF_Delete(OS_MEMF* pMEMF);
void* OS_MEMF_Alloc(OS_MEMF* pMEMF, int Purpose);
void* OS_MEMF_AllocTimed(OS_MEMF* pMEMF, int Timeout, int Purpose);
void* OS_MEMF_Request(OS_MEMF* pMEMF, int Purpose);
void  OS_MEMF_Release(OS_MEMF* pMEMF, void* pMemBlock);
void  OS_MEMF_FreeBlock(void* pMemBlock);
int   OS_MEMF_GetNumFreeBlocks(OS_MEMF* pMEMF);
char  OS_MEMF_IsInPool(OS_MEMF* pMEMF, void* pMemBlock);
int   OS_MEMF_GetMaxUsed(OS_MEMF* pMEMF);
int   OS_MEMF_GetNumBlocks(OS_MEMF* pMEMF);
int   OS_MEMF_GetBlockSize(OS_MEMF* pMEMF);






 

 

void  OS_EVENT_Create    (OS_EVENT* pEvent);
void  OS_EVENT_Delete    (OS_EVENT* pEvent);

unsigned char OS_EVENT_Get       (OS_EVENT* pEvent);
void  OS_EVENT_Pulse     (OS_EVENT* pEvent);
void  OS_EVENT_Reset     (OS_EVENT* pEvent);
void  OS_EVENT_Set       (OS_EVENT* pEvent);
void  OS_EVENT_Wait      (OS_EVENT* pEvent);
char  OS_EVENT_WaitTimed (OS_EVENT* pEvent, int Timeout);









 


void    OS_Timing_Start(unsigned int* pCycle);
void    OS_Timing_End(unsigned int* pCycle);
unsigned int  OS_Timing_Getus(unsigned int* pCycle);








 
#line 1943 "OS\\RTOS.h"

void    OS_POWER_UsageInc(unsigned int Level);
void    OS_POWER_UsageDec(unsigned int Level);
unsigned int OS_POWER_GetMask(void);







 
#line 1962 "OS\\RTOS.h"






 



















 

#line 2022 "OS\\RTOS.h"
   
#line 2036 "OS\\RTOS.h"
   
   






#line 2052 "OS\\RTOS.h"









 

 
void   OS_InitHW(void);
void   OS_Idle(void);
unsigned int OS_ConvertCycles2us(unsigned int Cycles);
unsigned int OS_GetTime_Cycles(void);
void   OS_COM_Init(void);
void   OS_COM_Send1(unsigned char c);

 
void   OS_Error(int code);

 void  OS_Start(void);                   
 void  OS_Switch(void);                  
 int   OS_SwitchFromInt(void);           

void  OS_InitKern(void);              
unsigned char OS_OnTx(void);                  
void  OS_OnRx(unsigned char c);       
void  OS_Send1(unsigned char c);              
void  OS_SendString(const char* s);   
OS_RX_CALLBACK* OS_SetRxCallback(OS_RX_CALLBACK* cb);
unsigned char OS_EvaPacketEx(const unsigned char * pSrc, unsigned short SrcLen, unsigned char** pReturn);   

void  OS_COM_ClearTxActive(void);     









 




 
#line 2112 "OS\\RTOS.h"

void OS__di(void);
void OS__ei(void);
void OS__SaveIPL(void);
void OS__RestIPL(void);
void OS_SIM_Init(void);

 
void OS_HandleTick(void);        
void OS_HandleTickDI(void);      

 
 
void OS_HandleTick_Ex(void);     
void OS_HandleTickDI_Ex(void);   

void OS_AddTickHook(OS_TICK_HOOK* pHook, OS_TICK_HOOK_ROUTINE * pfUser);
void OS_RemoveTickHook(OS_TICK_HOOK* pHook);

 
void OS_SetIntFreq(unsigned int f);
void OS_Exit(int code);
void OS_UseDos(void);
void OS_UnuseDos(void);
int  OS_GetKey(void);
int  OS_WaitKey(void);

 





 







 

#line 31 "FS\\FS_X_embOS.c"






 
static OS_RSEMA * _paSema;
static char       _NumLocks;
static OS_EVENT   _Event;





 





 
void FS_X_OS_Lock(unsigned LockIndex) {
  OS_RSEMA * pSema;

  pSema = _paSema + LockIndex;
  if (pSema) {
    OS_Use(pSema);
  }
}





 
void FS_X_OS_Unlock(unsigned LockIndex) {
  OS_RSEMA * pSema;

  pSema = _paSema + LockIndex;
  if (pSema) {
    OS_Unuse(pSema);
  }
}

















 
void FS_X_OS_Init(unsigned NumLocks) {
  unsigned i;
  OS_RSEMA * pSema;

  _paSema = (OS_RSEMA *)FS_AllocZeroed(NumLocks* sizeof(OS_RSEMA));
  pSema =_paSema;
  for (i = 0; i < NumLocks; i++) {
    OS_CreateRSema(pSema++);
  }
  OS_EVENT_Create(&_Event);
}













 
void FS_X_OS_DeInit(void) {
  unsigned i;
  OS_RSEMA  * pSema;
  unsigned    NumLocks;

  NumLocks = _NumLocks;
  pSema   = &_paSema[0];
  for (i = 0; i < NumLocks; i++) {
    OS_DeleteRSema(pSema);
    pSema++;
  }
  OS_EVENT_Delete(&_Event);
  FS_Free(_paSema);
  _paSema  = 0;
  _NumLocks = 0;
}





 
unsigned long  FS_X_OS_GetTime(void) {
  return (unsigned long)(OS_Time);
}














 
int FS_X_OS_Wait(int Timeout) {
  int r;

  r = -1;
  if (OS_EVENT_WaitTimed(&_Event, Timeout) == 0) {
    r = 0;
  }
  return r;
}








 
void FS_X_OS_Signal(void) {
  OS_EVENT_Set(&_Event);
}


 
