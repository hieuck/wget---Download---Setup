@ECHO OFF
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
@echo                 Dang Cai Dat AnyDesk. Vui Long Cho
@echo off
if exist %Windir%\SysWOW64 goto X64

FOR %%i IN ("AnyDesk*.exe") DO Set FileName="%%i"
%FileName% --install "C:\Program Files\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent

goto END

:X64

FOR %%i IN ("AnyDesk*.exe") DO Set FileName="%%i"
%FileName% --install "C:\Program Files (x86)\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent

goto END

:END

echo.
echo Installation completed successfully