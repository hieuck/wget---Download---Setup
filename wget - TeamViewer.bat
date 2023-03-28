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

:: Download
echo Downloading TeamViewer...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "TeamViewer-HieuckIT.exe" "https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe"
) else (
    wget --no-check-certificate -q --show-progress -O "TeamViewer-HieuckIT.exe" "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
)

:: Install
echo Installing TeamViewer...
FOR %%i IN ("TeamViewer*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\TeamViewer\TeamViewer.exe" (
	echo Installation TeamViewer complete.
) else (
	echo Installation TeamViewer failed.
)
::License
::copy /y "%~dp0\banquyenneuco" "vaoday"

:: Clean up
del "TeamViewer*.exe"
timeout /t 5
popd