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
@echo                 Dang Cai Dat DirectX - VCRedist - NetFx3 Tu Dong.
@echo off
winget install -e --id Microsoft.DirectX
winget install -e --id Microsoft.VCRedist.2005.x86
winget install -e --id Microsoft.VCRedist.2005.x64
winget install -e --id Microsoft.VCRedist.2008.x86
winget install -e --id Microsoft.VCRedist.2008.x64
winget install -e --id Microsoft.VCRedist.2010.x86
winget install -e --id Microsoft.VCRedist.2010.x64
winget install -e --id Microsoft.VCRedist.2012.x86
winget install -e --id Microsoft.VCRedist.2012.x64
winget install -e --id Microsoft.VCRedist.2013.x86
winget install -e --id Microsoft.VCRedist.2013.x64
winget install -e --id  Microsoft.VCRedist.2015+.x86
winget install -e --id Microsoft.VCRedist.2015+.x64
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All