Rem Made by Connor Slade (Sigma#8214 on Discord) (https://github.com/Basicprogrammer10 on Github)
@echo off
Rem Set Vars:
set toCompile=%1
set doRun=%2
set masmLoc=%3
set version=0.8
cls

Rem OnRun Stuff:
echo [45mMASM auto Compile V%version% - By Sigma#8214[0m
if "%toCompile%"=="" call :HelpPage
if "%masmLoc%"  =="" call :DefultInstallDir

Rem Compile:
echo [36m[*] STARTING COMPILE[35m
call :DelIfIs %toCompile:~0,-4%.obj
%masmLoc%\bin\ml /c /Zd /coff %toCompile%
if errorlevel 1 call :Fail COMPILE
echo [32m[*] COMPILE COMPLETE[0m

Rem Linking:
echo [36m[*] STARTING LINKING[35m
call :DelIfIs %toCompile:~0,-4%.exe
%masmLoc%\bin\link /SUBSYSTEM:CONSOLE %toCompile:~0,-4%.obj
if errorlevel 1 call :Fail LINKING
echo [32m[*] LINKING COMPLETE[0m

Rem Running:
if "%doRun%"  =="true" call :RunExe

GOTO END

Rem Functions n Stuff:
:DefultInstallDir
set "masmLoc=C:\masm32"
GOTO :END

:RunExe
echo [36m[*] RUNNING[35m
%toCompile:~0,-4%.exe
echo.
echo [32m[*] FINISHED RUNNING[0m 
echo [35m[*] RETURNED:[0m [36m%errorlevel%[0m
GOTO :END

:DelIfIs
IF EXIST %~1 DEL /F %~1
GOTO :End

:Fail
echo [31m[*] %~1 FAILED[0m
EXIT

:HelpPage
echo [44m########## HELP ##########[0m
echo [35mUsage:   [0m [36mCompile.bat[0m [32m[File.asm][0m [33m[AutoRun][0m [33m[Masm Install]
echo.
echo [35mExample1:[0m [36mCompile.bat[0m                               - Shows this Help Menu
echo [35mExample2:[0m [36mCompile.bat[0m [32mHelloWorld.asm[0m                - Compiles with defult MASM location
echo [35mExample3:[0m [36mCompile.bat[0m [32mHelloWorld.asm[0m [33mtrue[0m           - Auto run (true / false)
echo [35mExample4:[0m [36mCompile.bat[0m [32mHelloWorld.asm[0m [33mtrue[0m [33mC:\masm32[0m - PICK ALL OPTIONS
EXIT

:END