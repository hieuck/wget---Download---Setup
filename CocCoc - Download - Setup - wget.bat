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
@echo                 Dang Cai Dat Coc Coc. Vui Long Cho
@echo off
if exist %Windir%\SysWOW64 goto X64

if exist coccoc_vi_32.exe goto I32
if not exist coccoc_vi_32.exe goto D32

:D32
@echo Dang Tai Xuong...
wget -O coccoc_vi_32.exe -q --show-progress https://files-cdn.coccoc.com/browser/coccoc_vi_machine.exe goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("coccoc*32.exe") DO Set FileName="%%i"
%FileName% /install
@echo Cai Dat Thanh Cong.

goto END

:X64
if  exist coccoc_vi_64.exe goto I64
if not exist coccoc_vi_64.exe goto D64

:D64
@echo Dang Tai Xuong...
wget -O coccoc_vi_64.exe -q --show-progress https://files-cdn.coccoc.com/browser/x64/coccoc_vi_machine.exe goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("coccoc*64.exe") DO Set FileName="%%i"
%FileName% /install
@echo Cai Dat Thanh Cong.

goto END

:END
del coccoc*.exe
echo.
echo Installation completed successfully