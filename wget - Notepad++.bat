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
@echo                 Dang Cai Dat Notepad++. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=Notepad++-HieuckIT.exe"
set "LINK64=https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.1/npp.8.5.1.Installer.x64.exe"
set "LINK32=https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.1/npp.8.5.1.Installer.exe"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Notepad++ Process
tasklist | find /i "Notepad++.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "Notepad++.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Notepad++...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK64%"
) else (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download Notepad++ failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing Notepad++...
"%FILENAME%" /S

:: Check Installation Process
if not exist "%ProgramFiles%\Notepad++\Notepad++.exe" (
	echo Installation Notepad++ failed.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	timeout /t 5 /nobreak >nul
    exit
) else (
	echo Installation Notepad++ complete.
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd