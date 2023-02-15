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
@echo                 Dang Cai Dat Zalo. Vui Long Cho
@echo off
if exist %Windir%\SysWOW64 goto X64

if exist ZaloSetup-23.1.1.exe goto I32

:D32
wget -q --show-progress https://res-download-pc-te-vnno-pt-2.zadn.vn/hybrid/ZaloSetup-23.1.1.exe goto I32

:I32
FOR %%i IN ("Zalo*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Thanh Cong.

goto END

:X64
if  exist ZaloSetup-23.1.1.exe goto I64

:D64
wget -q --show-progress https://res-download-pc-te-vnno-pt-2.zadn.vn/hybrid/ZaloSetup-23.1.1.exe goto I64

:I64
FOR %%i IN ("Zalo*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Thanh Cong.

goto END

:END
del ZaloSetup-23.1.1.exe
echo.
echo Installation completed successfully