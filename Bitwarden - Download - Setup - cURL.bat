@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=20
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
@echo                 Dang Cai Dat Bitwarden. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=Bitwarden-HieuckIT.exe"
set "LINK64=https://vault.bitwarden.com/download/?app=desktop&platform=windows"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Bitwarden Process
tasklist | find /i "Bitwarden.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "Bitwarden.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Bitwarden...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK64%"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download Bitwarden failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing Bitwarden...
"%FILENAME%" /S

:: Check Installation Process
if not exist "%LocalAppData%\Programs\Bitwarden\Bitwarden.exe" (
	echo Installation Bitwarden failed.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	timeout /t 5 /nobreak >nul
    exit
) else (
	echo Installation Bitwarden complete.
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd