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
@echo                 Dang Cai Dat Sideloadly. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Sideloadly process
tasklist | find /i "Sideloadly.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im Sideloadly.exe /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Sideloadly...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "Sideloadly-HieuckIT.exe" "https://sideloadly.io/SideloadlySetup64.exe"
) else (
    wget --no-check-certificate -q --show-progress -O "Sideloadly-HieuckIT.exe" "https://sideloadly.io/SideloadlySetup32.exe"
)

:: Install
echo Installing Sideloadly...
FOR %%i IN ("Sideloadly*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%LocalAppData%\Sideloadly\" (
	echo Installation Sideloadly complete.
) else (
	echo Installation Sideloadly failed.
	echo Please try Run as Administrator.
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "Sideloadly*.exe"
timeout /t 5
popd