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
@echo                 Dang Cai Dat TenPhanMem. Vui Long Cho
@echo off

pushd "%~dp0"
:Terminate the TenPhanMem Process
tasklist | find /i "TenKill.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "TenKill.exe" /f
)

:Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:Check Install File
if exist "TenTep*HieuckIT.exe" (
	goto "Install"
)

:Download
echo Downloading TenPhanMem...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "TenTep-HieuckIT.exe" "link64"
) else (
    wget --no-check-certificate -q --show-progress -O "TenTep-HieuckIT.exe" "link32"
) else (
	echo Download TenPhanMem failed.
	echo Please check your network connection. Retrying in 5 seconds...
	timeout /t 5 /nobreak >nul
	goto "Download"
)

:Install
echo Installing TenPhanMem...
FOR %%i IN ("TenTep*.exe") DO Set FileName="%%i"
%FileName% /S

:Check Installation Process
if exist "%ProgramFiles%\path\" (
	echo Installation TenPhanMem complete.
) else (
	echo Installation TenPhanMem failed.
	echo Please try Run as Administrator.
	goto "Clean Up"
)

:License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:Clean Up
del "TenTep*.exe"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd