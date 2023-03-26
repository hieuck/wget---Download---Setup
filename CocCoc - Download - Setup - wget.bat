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

:: Set File Name Link User Agent
set "FILENAME=Coc Coc-HieuckIT.exe"
set "LINK64=https://files-cdn.coccoc.com/browser/x64/coccoc_vi_machine.exe"
set "LINK32=https://files-cdn.coccoc.com/browser/coccoc_vi_machine.exe"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Coc Coc Process
tasklist | find /i "browser.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "browser.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Coc Coc...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK64%"
) else (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download Coc Coc failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing Coc Coc...
"%FILENAME%" /install

:: Check Installation Process
if not exist "%ProgramFiles%\CocCoc\Browser\Application\browser.exe" (
	echo Installation Coc Coc failed.
	echo Please try Run as Administrator.
	timeout /t 5 /nobreak >nul
	exit
) else (
	echo Installation Coc Coc complete.
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd