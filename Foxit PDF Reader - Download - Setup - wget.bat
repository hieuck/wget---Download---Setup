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
@echo                 Dang Cai Dat Foxit PDF Reader. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=Foxit PDF Reader-HieuckIT.exe"
set "LINK64=https://www.foxit.com/downloads/latest.html?product=Foxit-Reader"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Foxit PDF Reader Process
tasklist | find /i "FoxitPDFReader.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "FoxitPDFReader.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Foxit PDF Reader...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK64%"
) else (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download Foxit PDF Reader failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing Foxit PDF Reader...
"%FILENAME%" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-

:: Check Installation Process
if not exist "%ProgramFiles(x86)%\Foxit Software\Foxit PDF Reader\FoxitPDFReader.exe" (
	echo Installation Foxit PDF Reader failed.
	echo Please try Run as Administrator.
	timeout /t 5 /nobreak >nul
    exit
) else (
	echo Installation Foxit PDF Reader complete.
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd