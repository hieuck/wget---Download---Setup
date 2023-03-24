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
@echo                 Dang Cai Dat Notepad++. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "Notepad++.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading Notepad++...
if %ARCH%==x64 (
    curl "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.1/npp.8.5.1.Installer.x64.exe" -O -L --max-redirs 20 -A "%USERAGENT%"
) else (
    curl "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.1/npp.8.5.1.Installer.exe" -O -L --max-redirs 20 -A "%USERAGENT%"
)

:: Install
echo Installing Notepad++...
FOR %%i IN ("npp*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\Notepad++\Notepad++.exe" (
	echo Installation complete.
) else (
	echo Installation failed.
)

::License
::copy /y "banquyenneuco" "vaoday"

:: Clean up
del "npp*.exe"
timeout /t 5
popd