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
@echo                 Dang Cai Dat qBittorrent. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=qBittorrent-HieuckIT.exe"
set "LINK64=https://www.fosshub.com/qBittorrent.html?dwl=qbittorrent_4.5.2_lt20_qt6_x64_setup.exe"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the qBittorrent Process
tasklist | find /i "qBittorrent.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "qBittorrent.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading qBittorrent...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK64%"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download qBittorrent failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing qBittorrent...
"%FILENAME%" /S

:: Check Installation Process
if not exist "%ProgramFiles%\qBittorrent\qbittorrent.exe" (
	echo Installation qBittorrent failed.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	timeout /t 5 /nobreak >nul
    exit
) else (
	echo Installation qBittorrent complete.
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd