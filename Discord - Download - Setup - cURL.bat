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
@echo                 Dang Cai Dat Discord . Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Discord  process
tasklist | find /i "Discord .exe" > nul
if %errorlevel% equ 0 (
    taskkill /im Discord .exe /f
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
echo Downloading Discord ...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Discord -HieuckIT.exe" "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Discord -HieuckIT.exe" "link32"
)

:: Install
echo Installing Discord ...
FOR %%i IN ("Discord *.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%LocalAppData%\Discord\" (
	echo Installation Discord  complete.
	::License
	::copy /y "%~dp0\banquyenneuco" "vaoday"
) else (
	echo Installation Discord  failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "Discord *.exe"
timeout /t 5
popd