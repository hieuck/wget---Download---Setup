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

if exist %Windir%\SysWOW64 goto X64

if exist Zalo*.exe goto I32
if not exist Zalo*.exe goto D32

:D32
@echo Dang Tai Xuong Zalo...
powershell -Command "Invoke-WebRequest -Uri 'https://zalo.me/download/zalo-pc?utm=90000' -OutFile 'Zalo_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat Zalo...
FOR %%i IN ("Zalo*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Zalo Thanh Cong.
goto Lic

:X64

if  exist Zalo*.exe goto I64
if not exist Zalo*.exe goto D64

:D64
@echo Dang Tai Xuong Zalo...
powershell -Command "Invoke-WebRequest -Uri 'https://zalo.me/download/zalo-pc?utm=90000' -OutFile 'Zalo_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
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