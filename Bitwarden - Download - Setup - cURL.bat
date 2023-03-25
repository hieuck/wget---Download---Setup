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
@echo                 Dang Cai Dat Bitwarden. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "Bitwarden.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading Bitwarden...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Bitwarden-HieuckIT.exe" "https://vault.bitwarden.com/download/?app=desktop&platform=windows"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "Bitwarden-HieuckIT.exe" "link32"
)

:: Install
echo Installing Bitwarden...
FOR %%i IN ("Bitwarden*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%LocalAppData%\Programs\Bitwarden\Bitwarden.exe" (
	echo Installation Bitwarden complete.
) else (
	echo Installation Bitwarden failed.
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "Bitwarden*.exe"
timeout /t 5
popd