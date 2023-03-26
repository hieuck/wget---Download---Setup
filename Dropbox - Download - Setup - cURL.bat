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
:: Terminate the Dropbox process
tasklist | find /i "Dropbox.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "Dropbox.exe" /f
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
echo Downloading Dropbox...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Dropbox-HieuckIT.exe" "https://www.dropbox.com/download?os=win"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Dropbox-HieuckIT.exe" "link32"
)

:: Install
echo Installing Dropbox...
FOR %%i IN ("Dropbox*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles(x86)%\Dropbox\Client\Dropbox.exe" (
	echo Installation Dropbox complete.
) else (
	echo Installation Dropbox failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "Dropbox*.exe"
timeout /t 5
popd