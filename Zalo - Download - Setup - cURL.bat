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
@echo                 Dang Cai Dat Zalo. Vui Long Cho
@echo off

@pushd "%UserProfile%\Downloads"
@cd /d "%UserProfile%\Downloads"
taskkill /F /IM Zalo.exe

if exist Zalo*.exe goto Install
if not exist Zalo*.exe goto Download

:Download
@echo Dang Tai Xuong Zalo...
curl -L --max-redirs 20 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
goto Check
:Check
if not exist Zalo*.exe (
  timeout /t 5 >nul
  goto Check
)

goto Install

:Install
@echo Dang Cai Dat Zalo...
FOR %%i IN ("Zalo*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Zalo Thanh Cong.
goto Lic

:Lic
::copy /y "ban_quyen_neu_co" "vao_day"
goto END

:END
echo.
echo Installation completed successfully