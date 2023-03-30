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
@echo                 Dang Cai Dat TenPhanMem. Vui Long Cho
@echo off
pushd "%~dp0"
:: Set File Name Link User Agent
set "FILENAME=TenPhanMem-HieuckIT.exe"
set "LINK64=link"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
set "Admin="

:: Check if Command Prompt is running with administrator privileges
net session >nul 2>&1
if %errorlevel% == 0 (
	echo Command Prompt is running as Administrator.
) else (
	if "%Admin%"=="Yes" (
		echo Please Run as Administrator. Exiting in 5 seconds...
		for /l %%i in (5,-1,1) do (
			echo Exiting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
		exit
	) else (
		echo Warning: This program may not function correctly without administrator privileges.
		for /l %%i in (5,-1,1) do (
			echo Starting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
	)
)

:: Terminate the TenPhanMem Process
tasklist | find /i "TenKill.exe" > nul
if %errorlevel% equ 0 (
	taskkill /im "TenKill.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Download
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
@echo                 Dang Cai Dat TenPhanMem. Vui Long Cho
@echo off
pushd "%~dp0"
echo Downloading TenPhanMem...
if %ARCH%==x64 (
	wget --no-check-certificate --show-progress -q -O "%FILENAME%" "%LINK64%"
) else (
	wget --no-check-certificate --show-progress -q -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
	echo Download TenPhanMem failed.
	echo Please check your network connection. Exiting in 5 seconds...
	for /l %%i in (5,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

:: Install
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
@echo                 Dang Cai Dat TenPhanMem. Vui Long Cho
@echo off
pushd "%~dp0"
echo Installing TenPhanMem...
"%FILENAME%" /S

:: Check Installation Process
if exist "%ProgramFiles%\path\TenKill.exe" (
	echo Installation TenPhanMem complete.
) else (
	echo Installation TenPhanMem failed.
	echo Please try Run as Administrator.
)

:: License
echo Cr4cking TenPhanMem...
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
for /l %%i in (5,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
	if exist "%FILENAME%" (
	del "%FILENAME%"
	)
)
popd