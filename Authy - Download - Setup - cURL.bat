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
@echo                 Dang Cai Dat Authy. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Authy process
tasklist | find /i "Authy Desktop.exe.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "Authy Desktop.exe.exe" /f
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
echo Downloading Authy...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Authy-HieuckIT.exe" "https://electron.authy.com/download?channel=stable&arch=x64&platform=win32&version=latest&product=authy"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Authy-HieuckIT.exe" "https://electron.authy.com/download?channel=stable&arch=x32&platform=win32&version=latest&product=authy"
)

:: Install
echo Installing Authy...
FOR %%i IN ("Authy*.exe") DO Set FileName="%%i"
%FileName% /S /D=C:\Program Files (x86)\Authy /TYPE=full
if exist "%ProgramFiles(x86)%\Authy\Authy Desktop.exe" (
	echo Installation Authy complete.
	::License
	::copy /y "%~dp0\banquyenneuco" "vaoday"
) else (
	echo Installation Authy failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "Authy*.exe"
timeout /t 5
popd