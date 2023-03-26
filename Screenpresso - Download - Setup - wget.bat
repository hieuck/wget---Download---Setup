@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=15
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.  
@echo                 Dang Cai Dat Screenpresso. Vui Long Cho
@echo off
pushd "%~dp0"
net session >nul 2>&1
if %errorlevel% == 0 (
	echo Command Prompt is running as Administrator.
) else (
	echo Command Prompt is not running as Administrator.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	for /l %%i in (5,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

:: Set File Name Link User Agent
set "FILENAME=Screenpresso-HieuckIT.exe"
set "LINK64=https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Screenpresso Process
tasklist | find /i "Screenpresso.exe" > nul
if %errorlevel% equ 0 (
	taskkill /im "
	Screenpresso.exe" /f
)
tasklist | find /i "ScreenpressoRpc.exe" > nul
if %errorlevel% equ 0 (
	taskkill /im "ScreenpressoRpc.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Download
echo Downloading Screenpresso...
if %ARCH%==x64 (
	wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK64%"
) else (
	wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
	echo Download Screenpresso failed.
	echo Please check your network connection. Exiting in 5 seconds...
	for /l %%i in (5,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

:: Install
echo Installing Screenpresso...
"%FILENAME%" deploy --install --programfiles --quiet

:: Check Installation Process
if not exist "%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" (
	echo Installation Screenpresso failed.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	for /l %%i in (5,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
) else (
	echo Installation Screenpresso complete.
)

:: License
echo.
echo Please exit Screenpresso when the 'Operation succeeded' command below appears
"%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" license --activate [3]-[screenpressopro]-[1314]-[Meffi/tPORt]-[11/10/2022]-[CCmBVJV+jaQzzj6K1OypBEp0a4JLoGunMBnIZRsEKNau6wDIOaYGz6pG81MT6JJSeOS/OIdBsMBMzCBHrDBHgQ==] --quiet
netsh advfirewall firewall show rule name="Block Screenpresso" > nul
if %errorlevel% neq 0 (
    netsh advfirewall firewall add rule name="Block Screenpresso" dir=out action=block program="%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" enable=yes
)
:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
for /l %%i in (5,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
)
popd