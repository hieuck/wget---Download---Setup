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
@echo                 Dang Cai Dat Coc Coc. Vui Long Cho
@echo off

taskkill /F /IM browser.exe
if exist %Windir%\SysWOW64 goto X64

if exist CocCoc*32*.exe goto I32
if not exist CocCoc*32*.exe goto D32

:D32
@echo Dang Tai Xuong Coc Coc...
powershell -Command "Invoke-WebRequest -Uri ''https://files-cdn.coccoc.com/browser/coccoc_vi_machine.exe' -OutFile 'CocCoc-32_HieuckIT.exe'"
@echo Tai Xuong Coc Coc Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat Coc Coc...
FOR %%i IN ("CocCoc*32*.exe") DO Set FileName="%%i"
%FileName% /install
@echo Cai Dat Coc Coc Thanh Cong.
goto Lic

:X64
if  exist CocCoc*64*.exe goto I64
if not exist CocCoc*64*.exe goto D64

:D64
@echo Dang Tai Xuong Coc Coc...
powershell -Command "Invoke-WebRequest -Uri 'https://files-cdn.coccoc.com/browser/x64/coccoc_vi_machine.exe' -OutFile 'CocCoc-64_HieuckIT.exe'"
@echo Tai Xuong Coc Coc Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat Coc Coc...
FOR %%i IN ("CocCoc*64*.exe") DO Set FileName="%%i"
%FileName% /install
@echo Cai Dat Coc Coc Thanh Cong.
goto Lic

:Lic
::copy /y "banquyenneuco" "vaoday"
goto END

:END
del CocCoc*.exe
echo.
echo Installation completed successfully