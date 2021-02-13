Rem Made by Connor Slade (Sigma#8214 on Discord) (https://github.com/Basicprogrammer10 on Github)
@echo off
Rem Set Vars:
set toCompile=%1
set doRun=%2
set masmLoc=%3
set version=0.7
cls

Rem OnRun Stuff:
echo [45mMASM auto Compile V%version% - By Sigma#8214[0m
if "%toCompile%"=="" call :HelpPage
if "%masmLoc%"  =="" call :DefultInstallDir

Rem Compile:
echo [36m[*] STARTING COMPILE[35m
%masmLoc%\bin\ml /c /Zd /coff %toCompile%
echo [32m[*] COMPILE COMPLETE[0m

Rem Linking:
echo [36m[*] STARTING LINKINGE[35m
%masmLoc%\bin\link /SUBSYSTEM:CONSOLE %toCompile:~0,-4%.obj
echo [32m[*] LINKINGE COMPLETE[0m

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
GOTO :END

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