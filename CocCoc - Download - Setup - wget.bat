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

pushd "%~dp0"
taskkill /F /IM "browser.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Coc Coc...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress "https://files-cdn.coccoc.com/browser/x64/coccoc_vi_machine.exe"
) else (
    wget --no-check-certificate -q --show-progress "https://files-cdn.coccoc.com/browser/coccoc_vi_machine.exe"
)

:: Install
echo Installing Coc Coc...
FOR %%i IN ("coccoc*.exe") DO Set FileName="%%i"
%FileName% /install
if exist "%ProgramFiles%\path\browser.exe" (
	echo Installation Coc Coc complete.
) else (
	echo Installation Coc Coc failed.
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "coccoc*.exe"
timeout /t 5
popd