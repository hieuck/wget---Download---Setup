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
@echo                 Dang Cai Dat DirectX End-User Runtime. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the DirectX End-User Runtime process
tasklist | find /i "tenkill.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im tenkill.exe /f
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
echo Downloading DirectX End-User Runtime...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "DirectX-HieuckIT.exe" "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "DirectX-HieuckIT.exe" "link32"
)

:: Install
echo Installing DirectX End-User Runtime...
FOR %%i IN ("DirectX*.exe") DO Set FileName="%%i"
%FileName%  /Q

:: Clean up
del "DirectX*.exe"
timeout /t 5
popd