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
@echo                 Dang Cai Dat tenphanmem. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the tenphanmem process
tasklist | find /i "tenkill.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im tenkill.exe /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading tenphanmem...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "tentep-HieuckIT.exe" "link64"
) else (
    wget --no-check-certificate -q --show-progress -O "tentep-HieuckIT.exe" "link32"
)

:: Install
echo Installing tenphanmem...
FOR %%i IN ("tentep*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\path\" (
	echo Installation tenphanmem complete.
	::License
	::copy /y "%~dp0\banquyenneuco" "vaoday"
) else (
	echo Installation tenphanmem failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "tentep*.exe"
timeout /t 5
popd