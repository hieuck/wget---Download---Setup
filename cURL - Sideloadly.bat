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
@echo                 Dang Cai Dat Sideloadly. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Sideloadly process
tasklist | find /i "Sideloadly.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im Sideloadly.exe /f
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
echo Downloading Sideloadly...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Sideloadly-HieuckIT.exe" "https://sideloadly.io/SideloadlySetup64.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Sideloadly-HieuckIT.exe" "https://sideloadly.io/SideloadlySetup32.exe"
)

:: Install
echo Installing Sideloadly...
FOR %%i IN ("Sideloadly*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%LocalAppData%\Sideloadly\" (
	echo Installation Sideloadly complete.
) else (
	echo Installation Sideloadly failed.
	echo Please try Run as Administrator.
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "Sideloadly*.exe"
timeout /t 5
popd