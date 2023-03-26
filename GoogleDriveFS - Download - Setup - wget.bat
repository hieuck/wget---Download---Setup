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
@echo                 Dang Cai Dat Google Drive. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=Google Drive-HieuckIT.exe"
set "LINK64=https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Google Drive Process
tasklist | find /i "GoogleDriveFS.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "GoogleDriveFS.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Google Drive...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK64%"
) else (
    wget --no-check-certificate -q --show-progress -O "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download Google Drive failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing Google Drive...
"%FILENAME%" /S

:: Check Installation Process
if not exist "%ProgramFiles%\Google\Drive File Stream\drive_fs.ico" (
	echo Installation Google Drive failed.
	echo Please try Run as Administrator.
	timeout /t 5 /nobreak >nul
	exit
) else (
	echo Installation Google Drive complete.
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd