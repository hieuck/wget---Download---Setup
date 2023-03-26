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
@echo                 Dang Cai Dat OneDrive. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the OneDrive process
tasklist | find /i "OneDrive.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im OneDrive.exe /f
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
echo Downloading OneDrive...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "OneDrive-HieuckIT.exe" "https://oneclient.sfx.ms/Win/Prod/22.131.0619.0001/amd64/OneDriveSetup.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "OneDrive-HieuckIT.exe" "link32"
)

:: Install
echo Installing OneDrive...
FOR %%i IN ("OneDrive*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\Microsoft OneDrive\" (
	echo Installation OneDrive complete.
) else (
	echo Installation OneDrive failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "OneDrive*.exe"
timeout /t 5
popd