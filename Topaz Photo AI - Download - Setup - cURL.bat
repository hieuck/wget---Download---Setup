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
@echo                 Dang Cai Dat Topaz Photo AI. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "Topaz Photo AI.exe"

if  exist TopazPhotoAI*.msi goto Install
if not exist TopazPhotoAI*.msi goto Download

:Download
@echo Dang Tai Xuong Topaz Photo AI...
curl -L --max-redirs 20 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -o TopazPhotoAI-HieuckIT.msi https://topazlabs.com/d/photo/latest/win/full
@echo Tai Xuong Topaz Photo AI Hoan Thanh.
goto Install

:Install
@echo Dang Cai Dat Topaz Photo AI...
FOR %%i IN ("TopazPhotoAI*.msi") DO Set FileName="%%i"
%FileName% /quiet /norestart
if not exist "%ProgramFiles%\Topaz Labs LLC\Topaz Photo AI\Topaz Photo AI.exe" (
	@echo Cai Dat Topaz Photo AI That Bai. Dang Thu Lai...
	goto Install
)
@echo Cai Dat Topaz Photo AI Thanh Cong.
goto Lic

:Lic
copy /y "%~dp0\Topaz Photo AI Cr4ck\" "%ProgramFiles%\Topaz Labs LLC\Topaz Photo AI"
regedit.exe /s "%ProgramFiles%\Topaz Labs LLC\Topaz Photo AI\token.reg"
goto END

:END
::del TopazPhotoAI*.msi
echo.
echo Installation completed successfully