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
@echo                 Dang Cai Dat Foxit Reader. Vui Long Cho
@echo off

taskkill /F /IM FoxitPDFReader.exe
if exist %Windir%\SysWOW64 goto X64

if exist FoxitPDFReader*32*.exe goto I32
if not exist FoxitPDFReader*32*.exe goto D32

:D32
@echo Dang Tai Xuong Foxit Reader...
powershell -Command "Invoke-WebRequest -Uri ''https://www.foxit.com/downloads/latest.html?product=Foxit-Reader&platform=Windows&version=&package_type=&language=English&distID=' -OutFile 'FoxitPDFReader-32_HieuckIT.exe'"
@echo Tai Xuong Foxit Reader Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat Foxit Reader...
FOR %%i IN ("FoxitPDFReader*32*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Foxit Reader Thanh Cong.
goto Lic

:X64
if  exist FoxitPDFReader*64*.exe goto I64
if not exist FoxitPDFReader*64*.exe goto D64

:D64
@echo Dang Tai Xuong Foxit Reader...
powershell -Command "Invoke-WebRequest -Uri 'https://www.foxit.com/downloads/latest.html?product=Foxit-Reader&platform=Windows&version=&package_type=&language=English&distID=' -OutFile 'FoxitPDFReader-64_HieuckIT.exe'"
@echo Tai Xuong Foxit Reader Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat Foxit Reader...
FOR %%i IN ("FoxitPDFReader*64*.exe") DO Set FileName="%%i"
%FileName% /S
@echo Cai Dat Foxit Reader Thanh Cong.
goto Lic

:Lic
::copy /y "banquyenneuco" "vaoday"
goto END

:END
del FoxitPDFReader*.exe
echo.
echo Installation completed successfully