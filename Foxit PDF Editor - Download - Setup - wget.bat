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
@echo                 Dang Cai Dat Foxit PDF Editor. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Foxit PDF Editor process
tasklist | find /i "FoxitPDFEditor.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "FoxitPDFEditor.exe" /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

::Check Install File
if exist "FoxitPDFEditor*.exe" (
	goto Install
)

:: Download
echo Downloading Foxit PDF Editor...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "FoxitPDFEditor-HieuckIT.exe" "https://cdn01.foxitsoftware.com/product/phantomPDF/desktop/win/12.1.1/FoxitPDFEditor1211_L10N_Setup_Website.exe"
) else (
    wget --no-check-certificate -q --show-progress -O "FoxitPDFEditor-HieuckIT.exe" "link32"
)

:: Install
:Install
echo Installing Foxit PDF Editor...
FOR %%i IN ("FoxitPDFEditor*.exe") DO Set FileName="%%i"
%FileName% /q /norestart
if exist "%ProgramFiles%\path\" (
	echo Installation Foxit PDF Editor complete.
	::License
	::copy /y "%~dp0\banquyenneuco" "vaoday"
) else (
	echo Installation Foxit PDF Editor failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "FoxitPDFEditor*.exe"
timeout /t 5
popd