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
@echo                 Dang Cai Dat Aweray Remote. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Aweray Remote process
tasklist | find /i "AweSun.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "AweSun.exe" /f
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
echo Downloading Aweray Remote...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "AweSun-HieuckIT.exe" "https://down.aweray.com/awesun/windows/Aweray_Remote_2.0.0.45399_x64.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "AweSun-HieuckIT.exe" "https://down.aweray.com/awesun/windows/Aweray_Remote_2.0.0.45399_Win32.exe"
)

:: Install
echo Installing Aweray Remote...
FOR %%i IN ("AweSun*.exe") DO Set FileName="%%i"
%FileName% /S /COMPONENTS="all"
if exist "%ProgramFiles%\Aweray\AweSun\AweSun.exe" (
	echo Installation Aweray Remote complete.
) else (
	echo Installation Aweray Remote failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "AweSun*.exe"
timeout /t 5
echo Please close the script manually if automatically close fails.
popd