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
@echo                 Dang Cai Dat tenphanmem. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "tenkill.exe"

if exist %Windir%\SysWOW64 goto X64

if exist tentep*32*.exe goto I32
if not exist tentep*32*.exe goto D32

:D32
@echo Dang Tai Xuong tenphanmem...
curl -L --max-redirs 20 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -o tentep-32_HieuckIT.exe link32
@echo Tai Xuong tenphanmem Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat tenphanmem...
FOR %%i IN ("tentep*32*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat tenphanmem Thanh Cong.
goto Lic

:X64
if  exist tentep*64*.exe goto I64
if not exist tentep*64*.exe goto D64

:D64
@echo Dang Tai Xuong tenphanmem...
curl -L --max-redirs 20 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -o tentep-64_HieuckIT.exe link64
@echo Tai Xuong tenphanmem Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat tenphanmem...
FOR %%i IN ("tentep*64*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat tenphanmem Thanh Cong.
goto Lic

:Lic
::copy /y "banquyenneuco" "vaoday"
goto END

:END
del tentep*.exe
echo.
echo Installation completed successfully