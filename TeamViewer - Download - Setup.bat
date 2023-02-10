@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=15
@cls
echo.
echo.
echo.
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.  
@echo                 Dang Cai Dat TeamViewer. Vui Long Cho
@echo off
if exist %Windir%\SysWOW64 goto X64

if exist TeamViewer_Setup.exe goto I32
if not exist TeamViewer_Setup.exe goto D32

:D32
wget -q --show-progress https://download.teamviewer.com/download/TeamViewer_Setup.exe
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("Team*Setup.exe") DO Set FileName="%%i"
%FileName% /S
goto END

:X64
if  exist TeamViewer_Setup_x64.exe goto I64
if not exist TeamViewer_Setup_x64.exe goto D64

:D64
wget -q --show-progress https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("Team*Setup*64.exe") DO Set FileName="%%i"
%FileName% /S
goto END

:END
del TeamViewer*.exe
echo.
echo Installation completed successfully