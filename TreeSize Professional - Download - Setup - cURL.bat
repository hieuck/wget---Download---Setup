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
@echo                 Dang Cai Dat TreeSize Professional. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "TreeSize.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading TreeSize Professional...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -O "https://downloads.jam-software.de/treesize/TreeSize-x64-Demo.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "tentep-HieuckIT.exe" "link32"
)

:: Install
echo Installing TreeSize Professional...
FOR %%i IN ("TreeSize*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
if exist "%ProgramFiles%\JAM Software\TreeSize\TreeSize.exe" (
	echo Installation TreeSize Professional complete.
) else (
	echo Installation TreeSize Professional failed.
)
::License
if exist "%ProgramFiles%\JAM Software\TreeSize\TreeSize.exe" (
	del "%ProgramFiles%\JAM Software\TreeSize\TreeSize.exe"
	copy /y "%~dp0\TreeSize Professional Cr4ck\TreeSize.exe" "%ProgramFiles%\JAM Software\TreeSize\"
	echo Cr4ck TreeSize Professional complete.
) else (
	echo Cr4ck TreeSize Professional failed.
	echo Please Run as Administrator.
)
:: Clean up
del "TreeSize*.exe"
timeout /t 5
popd