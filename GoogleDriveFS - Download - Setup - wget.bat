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
@echo                 Dang Cai Dat Google Drive. Vui Long Cho
@echo off

pushd "%~dp0"
tasklist | find /i "GoogleDriveFS.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im GoogleDriveFS.exe /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Google Drive...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "GoogleDriveFS-HieuckIT.exe" "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
) else (
    wget --no-check-certificate -q --show-progress -O "GoogleDriveFS-HieuckIT.exe" "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
)

:: Install
echo Installing Google Drive...
FOR %%i IN ("GoogleDriveFS*.exe") DO Set FileName="%%i"
%FileName% /S

::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "GoogleDriveFS*.exe"
timeout /t 5
popd