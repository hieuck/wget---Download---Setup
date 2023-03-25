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
@echo                 Dang Cai Dat Screenpresso. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "Screenpresso.exe"
taskkill /F /IM "ScreenpressoRpc.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading Screenpresso...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Screenpresso-HieuckIT.exe" "https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Screenpresso-HieuckIT.exe" "link32"
)

:: Install
echo Installing Screenpresso...
FOR %%i IN ("Screenpresso*.exe") DO Set FileName="%%i"
%FileName% deploy --install -programfiles --quiet
if exist "%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" (
	echo Installation Screenpresso complete.
) else (
	echo Installation Screenpresso failed.
	echo Please try Run as Administrator.
	exit
)
::License
netsh advfirewall firewall add rule name="Block Screenpresso" dir=out action=block program="%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" enable=yes
%FileName% license -activate [3]-[screenpressopro]-[1314]-[Meffi/tPORt]-[11/10/2022]-[CCmBVJV+jaQzzj6K1OypBEp0a4JLoGunMBnIZRsEKNau6wDIOaYGz6pG81MT6JJSeOS/OIdBsMBMzCBHrDBHgQ==]

:: Clean up
del "Screenpresso*.exe"
timeout /t 5
popd