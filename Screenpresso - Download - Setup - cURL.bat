@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=20
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
:: Terminate the Screenpresso process
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
%FileName% deploy --install --programfiles --quiet
if exist "%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" (
	echo Installation Screenpresso complete.
) else (
	echo Installation Screenpresso failed.
	echo Please try Run as Administrator.
)
::License
echo Please exit Screenpresso when the 'Operation succeeded' command below appears
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