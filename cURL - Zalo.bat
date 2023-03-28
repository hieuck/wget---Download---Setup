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
@echo                 Dang Cai Dat Zalo. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "Zalo.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading Zalo...
if %ARCH%==x64 (
    curl "https://zalo.me/download/zalo-pc?utm=90000" -o "ZaloSetup.exe" -L --max-redirs 20 -A "%USERAGENT%"
) else (
    curl "https://zalo.me/download/zalo-pc?utm=90000" -o "ZaloSetup.exe" -L --max-redirs 20 -A "%USERAGENT%"
)

:: Install
echo Installing Zalo...
FOR %%i IN ("Zalo*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%LocalAppData%\Programs\Zalo\Zalo.exe" (
	echo Installation complete.
) else (
	echo Installation failed.
)
::License
::copy /y "banquyenneuco" "vaoday"

:: Clean up
del "Zalo*.exe"
timeout /t 5
popd