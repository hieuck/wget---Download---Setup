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

taskkill /F /IM FoxitPDFReader.exe
if exist %Windir%\SysWOW64 goto X64

if exist Foxit*32*.exe goto I32
if not exist Foxit*32*.exe goto D32

:D32
@echo Dang Tai Xuong Foxit Reader...
wget --no-check-certificate -O Foxit-32_HieuckIT.exe -q --show-progress https://www.foxit.com/downloads/latest.html?product=Foxit-Reader&platform=Windows&version=&package_type=&language=English&distID=
@echo Tai Xuong Foxit Reader Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat Foxit Reader...
FOR %%i IN ("Foxit*32*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
@echo Cai Dat Foxit Reader Thanh Cong.
goto Lic

:X64
if  exist Foxit*64*.exe goto I64
if not exist Foxit*64*.exe goto D64

:D64
@echo Dang Tai Xuong Foxit Reader...
wget --no-check-certificate -O Foxit-64_HieuckIT.exe -q --show-progress https://www.foxit.com/downloads/latest.html?product=Foxit-Reader
@echo Tai Xuong Foxit Reader Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat Foxit Reader...
FOR %%i IN ("Foxit*64*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
@echo Cai Dat Foxit Reader Thanh Cong.
goto Lic

:Lic
::copy /y "banquyenneuco" "vaoday"
goto END

:END
del Foxit*.exe
echo.
echo Installation completed successfully