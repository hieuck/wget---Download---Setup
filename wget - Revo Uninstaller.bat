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
@echo                 Dang Cai Dat Revo Uninstaller. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=Revo Uninstaller-HieuckIT.exe"
set "LINK64=https://download.revouninstaller.com/download/RevoUninProSetup.exe"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Revo Uninstaller Process
tasklist | find /i "RevoUninPro.exe" > nul
if %errorlevel% equ 0 (
	taskkill /im "RevoUninPro.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Download
echo Downloading Revo Uninstaller...
if %ARCH%==x64 (
	wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK64%"
) else (
	wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
	echo Download Revo Uninstaller failed.
	echo Please check your network connection. Exiting in 5 seconds...
	for /l %%i in (5,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

:: Install
echo Installing Revo Uninstaller...
"%FILENAME%" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-

:: Check Installation Process
if not exist "%ProgramFiles%\VS Revo Group\Revo Uninstaller Pro\RevoUninPro.exe" (
	echo Installation Revo Uninstaller failed.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	for /l %%i in (5,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
) else (
	echo Installation Revo Uninstaller complete.
)

:: License
del "%PROGRAMDATA%\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro5.lic"
if exist "%PROGRAMDATA%\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro5.lic" (
	echo Cr4cking Revo Uninstaller failed.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	for /l %%i in (5,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
) else (
	copy /y "%~dp0\Revo Uninstaller Cr4ck\revouninstallerpro5.lic" "%PROGRAMDATA%\VS Revo Group\Revo Uninstaller Pro\"
	if exist "%PROGRAMDATA%\VS Revo Group\Revo Uninstaller Pro\" (
		echo Successfully Cr4cked Revo Uninstaller.
	)
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
for /l %%i in (5,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
)
popd