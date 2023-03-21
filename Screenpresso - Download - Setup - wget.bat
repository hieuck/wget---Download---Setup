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
@echo                 Dang Cai Dat Screenpresso. Vui Long Cho
@echo off
pushd "%~dp0"
taskkill /F /IM Screenpresso.exe
taskkill /F /IM ScreenpressoRpc.exe
netsh advfirewall firewall add rule name="Block Screenpresso" dir=out action=block program="%ProgramFiles%\Learnpulse\Screenpresso\Screenpresso.exe" enable=yes

if exist %Windir%\SysWOW64 goto X64

if exist Screenpresso*32*.exe goto I32
if not exist Screenpresso*32*.exe goto D32

:D32
@echo Dang Tai Xuong Screenpresso...
wget --no-check-certificate -O Screenpresso-32_HieuckIT.exe -q --show-progress https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe
@echo Tai Xuong Screenpresso Hoan Thanh.
goto I32

:I32
@echo Dang Cai Dat Screenpresso...
FOR %%i IN ("Screenpresso*32*.exe") DO Set FileName="%%i"
%FileName% deploy --install --programfiles --quiet
::%FileName% license -activate [3]-[screenpressopro]-[1314]-[Meffi/tPORt]-[11/10/2022]-[CCmBVJV+jaQzzj6K1OypBEp0a4JLoGunMBnIZRsEKNau6wDIOaYGz6pG81MT6JJSeOS/OIdBsMBMzCBHrDBHgQ==]
@echo Cai Dat Screenpresso Thanh Cong.
goto Lic

:X64
if  exist Screenpresso*64*.exe goto I64
if not exist Screenpresso*64*.exe goto D64

:D64
@echo Dang Tai Xuong Screenpresso...
wget --no-check-certificate -O Screenpresso-64_HieuckIT.exe -q --show-progress https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe
@echo Tai Xuong Screenpresso Hoan Thanh.
goto I64

:I64
@echo Dang Cai Dat Screenpresso...
FOR %%i IN ("Screenpresso*64*.exe") DO Set FileName="%%i"
%FileName% deploy --install -programfiles --quiet
::%FileName% license --activate [3]-[screenpressopro]-[1314]-[Meffi/tPORt]-[11/10/2022]-[CCmBVJV+jaQzzj6K1OypBEp0a4JLoGunMBnIZRsEKNau6wDIOaYGz6pG81MT6JJSeOS/OIdBsMBMzCBHrDBHgQ==]
@echo Cai Dat Screenpresso Thanh Cong.
goto Lic

:Lic
::copy /y "banquyenneuco" "vaoday"
goto END

:END
del Screenpresso*.exe
echo.
echo Installation completed successfully