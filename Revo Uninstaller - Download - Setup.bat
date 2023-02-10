@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=15
@cls
echo.
echo.
echo.
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.  
@echo                 Dang Cai Dat Revo Uninstaller. Vui Long Cho
@echo off
if exist %Windir%\SysWOW64 goto X64

if exist Revo*.exe goto I32
if not exist Revo*.exe goto D32

:D32
@echo Dang Tai Xuong...
wget -q --show-progress https://download.revouninstaller.com/download/RevoUninProSetup.exe
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("Revo*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
goto Lic

:X64
if  exist Revo*.exe goto I64
if not exist Revo*.exe goto D64

:D64
@echo Dang Tai Xuong...
wget -q --show-progress https://download.revouninstaller.com/download/RevoUninProSetup.exe
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("Revo*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
goto Lic

:Lic
copy /y "revouninstallerpro5.lic" "%PROGRAMDATA%\VS Revo Group\Revo Uninstaller Pro\"
goto END

:END
del Revo*.exe
echo.
echo Installation completed successfully