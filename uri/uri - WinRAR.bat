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

taskkill /F /IM WinRAR.exe
if exist %Windir%\SysWOW64 goto X64

if exist WinRAR*32*.exe goto I32
if not exist WinRAR*32*.exe goto D32

:D32
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://www.rarlab.com/rar/winrar-x32-621.exe' -OutFile 'WinRAR_HieuckIT_32.exe'"
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("WinRAR*32*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Thanh Cong.
goto Lic

:X64
if  exist WinRAR*64*.exe goto I64
if not exist WinRAR*64*.exe goto D64

:D64
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://www.rarlab.com/rar/winrar-x64-621.exe' -OutFile 'WinRAR_HieuckIT_64.exe'"
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("WinRAR*64*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Thanh Cong.
goto Lic

:Lic
copy /y "rarreg.key" "%ProgramFiles%\WinRAR"
goto END

:END
del WinRAR*.exe
echo.
echo Installation completed successfully