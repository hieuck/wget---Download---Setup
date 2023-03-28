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
@echo                 Dang Cai Dat Google Chrome. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Google Chrome process
tasklist | find /i "Chrome.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im Chrome.exe /f
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
echo Downloading Google Chrome...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Chrome-HieuckIT.exe" "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Chrome-HieuckIT.exe" "link32"
)

:: Install
echo Installing Google Chrome...
FOR %%i IN ("Chrome*.exe") DO Set FileName="%%i"
%FileName% /quiet /norestart
if exist "%ProgramFiles%\Google\Chrome\Application\" (
	echo Installation Google Chrome complete.

) else (
	echo Installation Google Chrome failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "Chrome*.exe"
timeout /t 5
popd