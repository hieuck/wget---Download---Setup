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
@echo                 Dang Cai Dat WinRAR. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the WinRAR process
tasklist | find /i "WinRAR.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im WinRAR.exe /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading WinRAR...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "WinRAR-HieuckIT.exe" "https://www.rarlab.com/rar/winrar-x64-621.exe"
) else (
    wget --no-check-certificate -q --show-progress -O "WinRAR-HieuckIT.exe" "https://www.rarlab.com/rar/winrar-x32-621.exe"
)

:: Install
echo Installing WinRAR...
FOR %%i IN ("WinRAR*.exe") DO Set FileName="%%i"
%FileName% /S
if exist "%ProgramFiles%\WinRAR\WinRAR.exe" (
	echo Installation WinRAR complete.
	::License
	copy /y "%~dp0\WinRAR Cr4ck\rarreg.key" "%ProgramFiles%\WinRAR"
	if exist "%ProgramFiles%\WinRAR\rarreg.key" (
		echo Cr4ck WinRAR complete.
	) else (
		echo Cr4ck WinRAR failed.
	)

) else (
	echo Installation WinRAR failed.
)

:: Clean up
del "WinRAR*.exe"
timeout /t 5
popd