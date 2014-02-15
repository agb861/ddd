@ECHO off
Echo CC.bat       Converting %1.%2 %3
tool\bin2c html\%1.%2 %1 %3
XCopy %1.* Generated\%1.* /Q/Y
del %1.c
del %1.h
