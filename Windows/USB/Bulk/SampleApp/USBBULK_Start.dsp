# Microsoft Developer Studio Project File - Name="USBBULK_Start" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=USBBULK_Start - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "USBBULK_Start.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "USBBULK_Start.mak" CFG="USBBULK_Start - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "USBBULK_Start - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "USBBULK_Start - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/USBStack/Bulk/SAMPLEAPP", FDAAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "USBBULK_Start - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Output\Release"
# PROP Intermediate_Dir "Output\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /FD /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 uuid.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib shell32.lib winmm.lib setupapi.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "USBBULK_Start - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Output\Debug"
# PROP Intermediate_Dir "Output\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I "USBBULK" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FR /FD /GZ /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 winmm.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib shell32.lib setupapi.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "USBBULK_Start - Win32 Release"
# Name "USBBULK_Start - Win32 Debug"
# Begin Group "Application"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\Application\Echo1.c

!IF  "$(CFG)" == "USBBULK_Start - Win32 Release"

# ADD CPP /I "USBBULK"

!ELSEIF  "$(CFG)" == "USBBULK_Start - Win32 Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Application\EchoFast.c

!IF  "$(CFG)" == "USBBULK_Start - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "USBBULK_Start - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Application\Test.c
# PROP Exclude_From_Build 1
# End Source File
# End Group
# Begin Group "USBBULK"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\USBBULK\USBBULK.c
# End Source File
# Begin Source File

SOURCE=.\USBBULK\USBBULK.h
# End Source File
# End Group
# End Target
# End Project
