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
@echo                 Dang Cai Dat Foxit PDF Reader. Vui Long Cho
@echo off

pushd "%~dp0"
tasklist | find /i "FoxitPDFReader.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im FoxitPDFReader.exe /f
)
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Foxit PDF Reader...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "FoxitPDFReader-HieuckIT.exe" "https://www.foxit.com/downloads/latest.html?product=Foxit-Reader"
) else (
    wget --no-check-certificate -q --show-progress -O "FoxitPDFReader-HieuckIT.exe" "link32"
)

:: Install
echo Installing Foxit PDF Reader...
FOR %%i IN ("FoxitPDFReader*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
if exist "%ProgramFiles%\path\FoxitPDFReader.exe" (
	echo Installation Foxit PDF Reader complete.
) else (
	echo Installation Foxit PDF Reader failed.
	echo Please try Run as Administrator.
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "FoxitPDFReader*.exe"
timeout /t 5
popd