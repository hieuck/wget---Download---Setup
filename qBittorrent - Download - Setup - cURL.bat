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
:: Terminate the qBittorrent process
tasklist | find /i "qBittorrent.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im qBittorrent.exe /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading qBittorrent...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "qBittorrent-HieuckIT.exe" "https://www.fosshub.com/qBittorrent.html?dwl=qbittorrent_4.5.2_lt20_qt6_x64_setup.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "qBittorrent-HieuckIT.exe" "link32"
)

:: Install
echo Installing qBittorrent...
FOR %%i IN ("qBittorrent*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\qBittorrent\" (
	echo Installation qBittorrent complete.
) else (
	echo Installation qBittorrent failed.
	echo Please try Run as Administrator.
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "qBittorrent*.exe"
timeout /t 5
popd