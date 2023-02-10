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
@echo                 Dang Cai Dat UltraViewer. Vui Long Cho
@echo off
if exist %Windir%\SysWOW64 goto X64

if exist UltraViewer*.exe goto I32
if not exist UltraViewer*.exe goto D32

:D32
@echo Dang Tai Xuong...
wget -q --show-progress https://www.ultraviewer.net/vi/UltraViewer_setup_6.6_vi.exe
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("UltraViewer*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
goto END

:X64
if  exist UltraViewer*.exe goto I64
if not exist UltraViewer*.exe goto D64

:D64
@echo Dang Tai Xuong...
wget -q --show-progress https://www.ultraviewer.net/vi/UltraViewer_setup_6.6_vi.exe
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("UltraViewer*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
goto END

:END
del UltraViewer*.exe
echo.
echo Installation completed successfully