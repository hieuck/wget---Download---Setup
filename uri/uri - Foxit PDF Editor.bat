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
@echo                 Dang Cai Dat Foxit Reader. Vui Long Cho
@echo off

taskkill /F /IM FoxitEditor.exe
if exist %Windir%\SysWOW64 goto X64

if exist Foxit*.exe goto I32
if not exist Foxit*.exe goto D32

:D32
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://www.foxit.com/downloads/pdf-editor-thanks.html?product=Foxit-PhantomPDF-Business' -OutFile 'FoxitEditorSetup-32_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("Foxit*Editor*Setup*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
@echo Cai Dat Thanh Cong.
goto Lic

:X64
if  exist Foxit*.exe goto I64
if not exist Foxit*.exe goto D64

:D64
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://www.foxit.com/downloads/pdf-editor-thanks.html?product=Foxit-PhantomPDF-Business&platform=Windows' -OutFile 'FoxitEditorSetup-64_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("Foxit*Editor*Setup*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
@echo Cai Dat Thanh Cong.
goto Lic

:Lic
::copy /y "ban_quyen_neu_co" "vao_day"
goto END

:END
del Foxit*.exe
echo.
echo Installation completed successfully