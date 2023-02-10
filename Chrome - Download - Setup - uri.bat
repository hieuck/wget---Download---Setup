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
@echo                 Dang Cai Dat Google Chrome. Vui Long Cho
@echo off

taskkill /F /IM Chrome.exe
if exist %Windir%\SysWOW64 goto X64

if exist Chrome*32*.exe goto I32
if not exist Chrome*32*.exe goto D32

:D32
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://www.google.com/intl/vi/chrome/thank-you.html?platform=win&statcb=1&installdataindex=empty&defaultbrowser=0#' -OutFile 'Chrome_32_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat...
FOR %%i IN ("Chrome*32*.exe") DO Set FileName="%%i"
%FileName% /S
goto Lic

:X64
if  exist Chrome*64*.exe goto I64
if not exist Chrome*64*.exe goto D64

:D64
@echo Dang Tai Xuong...
powershell -Command "Invoke-WebRequest -Uri 'https://www.google.com/intl/vi/chrome/thank-you.html?statcb=1&installdataindex=empty&defaultbrowser=1#' -OutFile 'Chrome_64_HieuckIT.exe'"
@echo Tai Xuong Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat...
FOR %%i IN ("Chrome*64*.exe") DO Set FileName="%%i"
%FileName% /S
goto Lic

:Lic
::copy /y "ban_quyen_neu_co" "vao_day"
goto END

:END
del Chrome*.exe
echo.
echo Installation completed successfully