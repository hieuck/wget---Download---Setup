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
@echo                 Dang Cai Dat Coc Coc. Vui Long Cho
@echo off

::taskkill /F /IM Foxit.exe
if exist %Windir%\SysWOW64 goto X64

if exist coccoc*32*.exe goto I32
if not exist coccoc*32*.exe goto D32

:D32
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://files-cdn.coccoc.com/browser/coccoc_vi_machine.exe' -OutFile 'coccoc_vi_32_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("coccoc*32*.exe") DO Set FileName="%%i"
%FileName% /INSTALL
@echo Cai Dat Thanh Cong.
goto Lic

:X64
if  exist coccoc*64*.exe goto I64
if not exist coccoc*64*..exe goto D64

:D64
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://files-cdn.coccoc.com/browser/x64/coccoc_vi_machine.exe' -OutFile 'coccoc_vi_64_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("coccoc*64*.exe") DO Set FileName="%%i"
%FileName% /INSTALL
@echo Cai Dat Thanh Cong.
goto Lic

:Lic
::copy /y "ban_quyen_neu_co" "vao_day"
goto END

:END
del coccoc*.exe
echo.
echo Installation completed successfully