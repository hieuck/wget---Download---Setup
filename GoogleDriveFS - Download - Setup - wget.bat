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
tasklist | find /i "GoogleDriveFS.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im GoogleDriveFS.exe /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Google Drive...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "GoogleDriveFS-HieuckIT.exe" "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
) else (
    wget --no-check-certificate -q --show-progress -O "GoogleDriveFS-HieuckIT.exe" "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
)

:: Install
echo Installing Google Drive...
FOR %%i IN ("GoogleDriveFS*.exe") DO Set FileName="%%i"
%FileName% /S

::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "GoogleDriveFS*.exe"
timeout /t 5
popd