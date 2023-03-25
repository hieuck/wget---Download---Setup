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
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading tenphanmem...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "tentep-HieuckIT.exe" "link64"
) else (
    wget --no-check-certificate -q --show-progress -O "tentep-HieuckIT.exe" "link32"
)

:: Install
echo Installing tenphanmem...
FOR %%i IN ("tentep*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\path\tenkill.exe" (
	echo Installation tenphanmem complete.
) else (
	echo Installation tenphanmem failed.
	echo Please try Run as Administrator.
	goto cleanup
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
:cleanup
del "tentep*.exe"
timeout /t 5
popd