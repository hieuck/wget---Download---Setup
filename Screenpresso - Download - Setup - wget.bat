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
@echo                 Dang Cai Dat Screenpresso. Vui Long Cho
@echo off

pushd "%~dp0"
tasklist | find /i "Screenpresso.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im Screenpresso.exe /f
)
tasklist | find /i "ScreenpressoRpc.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im ScreenpressoRpc.exe /f
)
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Screenpresso...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O Screenpresso-HieuckIT.exe https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe
) else (
    wget --no-check-certificate -q --show-progress -O Screenpresso-HieuckIT.exe https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe
)

:: Install
echo Installing Screenpresso...
FOR %%i IN ("Screenpresso*.exe") DO Set FileName="%%i"
%FileName% deploy --install --programfiles --quiet
if exist "%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" (
	echo Installation Screenpresso complete.
) else (
	echo Installation Screenpresso failed.
	echo Please try Run as Administrator.
)
::License
echo Please Exit Screenpresso when Cr4ck complete
"%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" license --activate [3]-[screenpressopro]-[1314]-[Meffi/tPORt]-[11/10/2022]-[CCmBVJV+jaQzzj6K1OypBEp0a4JLoGunMBnIZRsEKNau6wDIOaYGz6pG81MT6JJSeOS/OIdBsMBMzCBHrDBHgQ==] --quiet
netsh advfirewall firewall show rule name="Block Screenpresso" > nul
if %errorlevel% neq 0 (
    netsh advfirewall firewall add rule name="Block Screenpresso" dir=out action=block program="%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" enable=yes
)
tasklist | find /i "Screenpresso.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im Screenpresso.exe /f
)
tasklist | find /i "ScreenpressoRpc.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im ScreenpressoRpc.exe /f
)

:: Clean up
del "Screenpresso*.exe"
timeout /t 5
popd