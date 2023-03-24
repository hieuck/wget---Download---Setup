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
@echo                 Dang Cai Dat TeamViewer. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "TeamViewer.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading TeamViewer...
if %ARCH%==x64 (
    curl -L --max-redirs 20 -A "%USERAGENT%" -o "TeamViewer-HieuckIT.exe" "https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe"
) else (
    curl -L --max-redirs 20 -A "%USERAGENT%" -o "TeamViewer-HieuckIT.exe" "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
)

:: Install
echo Installing TeamViewer...
FOR %%i IN ("TeamViewer*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\TeamViewer\TeamViewer.exe" (
	echo Installation complete.
) else (
	echo Installation failed.
)
::License
::copy /y "banquyenneuco" "vaoday"

:: Clean up
del "TeamViewer*.exe"
timeout /t 5
popd