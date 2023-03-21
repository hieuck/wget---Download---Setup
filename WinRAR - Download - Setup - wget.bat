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
@echo                 Dang Cai Dat WinRAR. Vui Long Cho
@echo off
pushd "%~dp0"
taskkill /F /IM WinRAR.exe
if exist %Windir%\SysWOW64 goto X64

if exist WinRAR*32*.exe goto I32
if not exist WinRAR*32*.exe goto D32

:D32
@echo Dang Tai Xuong...
wget --no-check-certificate -q --show-progress https://www.rarlab.com/rar/winrar-x32-621.exe
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("WinRAR*32*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Thanh Cong.
goto Lic

:X64
if  exist WinRAR*64*.exe goto I64
if not exist WinRAR*64*.exe goto D64

:D64
@echo Dang Tai Xuong...
wget --no-check-certificate -q --show-progress https://www.rarlab.com/rar/winrar-x64-621.exe
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("WinRAR*64*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Thanh Cong.
goto Lic

:Lic
copy /y "rarreg.key" "%ProgramFiles%\WinRAR"
goto END

:END
del WinRAR*.exe
echo.
echo Installation completed successfully