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
@echo                 Dang Cai Dat Dropbox. Vui Long Cho
@echo off
pushd "%~dp0"

:: Set File Name Link User Agent
set "FILENAME=Dropbox-HieuckIT.exe"
set "LINK64=https://www.dropbox.com/download?os=win"
set "LINK32=link"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Terminate the Dropbox Process
tasklist | find /i "Dropbox.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "Dropbox.exe" /f
)

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Dropbox...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK64%"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK32%"
)

if not exist "%FILENAME%" (
    echo Download Dropbox failed.
    echo Please check your network connection. Exiting in 5 seconds...
    timeout /t 5 /nobreak >nul
    exit
)

:: Install
echo Installing Dropbox...
"%FILENAME%" /S

:: Check Installation Process
if not exist "%ProgramFiles(x86)%\Dropbox\Client\Dropbox.exe" (
	echo Installation Dropbox failed.
	echo Please try Run as Administrator. Exiting in 5 seconds...
	timeout /t 5 /nobreak >nul
    exit
) else (
	echo Installation Dropbox complete.
)

:: Clean Up
del "%FILENAME%"
echo The script will automatically close in 5 seconds.
timeout /t 5 /nobreak >nul
popd