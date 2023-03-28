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
@echo                 Dang Cai Dat Bitwarden. Vui Long Cho
@echo off
pushd "%~dp0"
:: Set File Name Link User Agent
set "FILENAME=Bitwarden-HieuckIT.exe"
set "LINK64=https://vault.bitwarden.com/download/?app=desktop&platform=windows"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Check if Command Prompt is running with administrator privileges
net session >nul 2>&1
if %errorlevel% == 0 (
	echo Command Prompt is running as Administrator.
) else (
	echo Command Prompt is not running as Administrator.
)

:: Terminate the Bitwarden Process
tasklist | find /i "Bitwarden.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "Bitwarden.exe" /f
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
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.  
@echo                 Dang Cai Dat Bitwarden. Vui Long Cho
@echo off
pushd "%~dp0"
echo Downloading Bitwarden...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK64%"
) else (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download Bitwarden failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
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
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.  
@echo                 Dang Cai Dat Bitwarden. Vui Long Cho
@echo off
pushd "%~dp0"
echo Installing Bitwarden...
"%FILENAME%" /S

:: Check Installation Process
if exist "%LocalAppData%\Programs\Bitwarden\Bitwarden.exe" (
	echo Installation Bitwarden complete.
) else (
	echo Installation Bitwarden failed.
	echo Please try Run as Administrator.
)

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