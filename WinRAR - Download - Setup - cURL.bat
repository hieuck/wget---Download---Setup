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
@echo                 Dang Cai Dat WinRAR. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=WinRAR-HieuckIT.exe"
set "LINK64=https://www.rarlab.com/rar/winrar-x64-621.exe"
set "LINK32=https://www.rarlab.com/rar/winrar-x32-621.exe"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the WinRAR Process
tasklist | find /i "WinRAR.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "WinRAR.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading WinRAR...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK64%"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download WinRAR failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing WinRAR...
%FILENAME% /S

:: Check Installation Process
if not exist "%ProgramFiles%\WinRAR\WinRAR.exe" (
	echo Installation WinRAR failed.
	echo Please try Run as Administrator.
	timeout /t 5 /nobreak >nul
	exit
) else (
	echo Installation WinRAR complete.
)

:: License
copy /y "%~dp0\WinRAR Cr4ck\rarreg.key" "%ProgramFiles%\WinRAR"	
if exist "%ProgramFiles%\WinRAR\rarreg.key" (
	echo Cr4ck WinRAR complete.
) else (
	echo Cr4ck WinRAR failed.
	echo Please try Run as Administrator.
	timeout /t 5 /nobreak >nul
	exit
)
:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd