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
@echo                 Dang Cai Dat TenPhanMem. Vui Long Cho
@echo off

pushd "%~dp0"
: Terminate the TenPhanMem Process
tasklist | find /i "TenKill.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "TenKill.exe" /f
)

:Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:Check Install File
if exist "TenTep*HieuckIT.exe" (
	goto "Install"
)

: Set User Agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:Download
echo Downloading TenPhanMem...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "TenTep-HieuckIT.exe" "link64"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "TenTep-HieuckIT.exe" "link32"
) else (
	echo Download TenPhanMem failed.
	echo Please check your network connection. Retrying in 5 seconds...
	timeout /t 5 /nobreak >nul
	goto "Download"
)

:Install
echo Installing TenPhanMem...
FOR %%i IN ("TenTep*.exe") DO Set FileName="%%i"
%FileName% /S

: Check Installation Process
if exist "%ProgramFiles%\path\" (
	echo Installation TenPhanMem complete.
) else (
	echo Installation TenPhanMem failed.
	echo Please try Run as Administrator.
	goto "Clean Up"
)

:License
::copy /y "%~dp0\banquyenneuco" "vaoday"
	
: Clean Up
del "TenTep*.exe"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd