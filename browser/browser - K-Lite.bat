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
@echo                 Dang Cai Dat K-Lite Codec Pack Mega. Vui Long Cho
@echo off

@pushd "%UserProfile%\Downloads"
@cd /d "%UserProfile%\Downloads"
taskkill /F /IM mpc-hc64.exe

if exist %Windir%\SysWOW64 goto X64

if exist K-Lite*32*.exe goto I32
if not exist K-Lite*32*.exe goto D32

:D32
@echo Dang Tai Xuong K-Lite Codec Pack Mega Bang Trinh Duyet...
@echo Hay Cho Den Khi Tai Xuong K-Lite Codec Pack Mega Hoan Tat.
start https://codecguide.com/download_k-lite_codec_pack_mega.htm
pause
goto I32

:I32
@echo Dang Cai Dat K-Lite Codec Pack Mega...
FOR %%i IN ("K-Lite*32*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT
@echo Cai Dat K-Lite Codec Pack Mega Thanh Cong.
goto Lic

:X64
if  exist K-Lite*64*.exe goto I64
if not exist K-Lite*64*.exe goto D64

:D64
@echo Dang Tai Xuong K-Lite Codec Pack Mega Bang Trinh Duyet...
@echo Hay Cho Den Khi Tai Xuong K-Lite Codec Pack Mega Hoan Tat.
start https://codecguide.com/download_k-lite_codec_pack_mega.htm
pause
goto I64

:I64
@echo Dang Cai Dat K-Lite Codec Pack Mega...
FOR %%i IN ("K-Lite*64*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT
@echo Cai Dat K-Lite Codec Pack Mega Thanh Cong.
goto Lic

:Lic
::copy /y "banquyenneuco" "vaoday"
goto END

:END
del K-Lite*.exe
echo.
echo Installation completed successfully