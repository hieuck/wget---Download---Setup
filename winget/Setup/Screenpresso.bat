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
@echo                 Dang Cai Dat Screenpresso Tu Dong. Vui Long Cho
@echo off
winget install -e --id Learnpulse.Screenpresso

set "SOFTLOCATION=%PROGRAMFILES%\Learnpulse\Screenpresso\Screenpresso.exe"
echo Please exit Screenpresso when the 'Operation succeeded' command below appears
netsh advfirewall firewall show rule name="Block Screenpresso" > nul
if %errorlevel% neq 0 (
    netsh advfirewall firewall add rule name="Block Screenpresso" dir=out action=block program="%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" enable=yes
)
"%SOFTLOCATION%" license --activate [3]-[screenpressopro]-[1314]-[Meffi/tPORt]-[11/10/2022]-[CCmBVJV+jaQzzj6K1OypBEp0a4JLoGunMBnIZRsEKNau6wDIOaYGz6pG81MT6JJSeOS/OIdBsMBMzCBHrDBHgQ==] --quiet
