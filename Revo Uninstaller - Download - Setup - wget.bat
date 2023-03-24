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

pushd "%~dp0"
taskkill /F /IM "RevoUninPro.exe"
:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Download
echo Downloading Revo Uninstaller...
if %ARCH%==x64 (
    wget --no-check-certificate -q --show-progress -O "Revo-HieuckIT.exe" "https://download.revouninstaller.com/download/RevoUninProSetup.exe"
) else (
    wget --no-check-certificate -q --show-progress -O "Revo-HieuckIT.exe" "https://download.revouninstaller.com/download/RevoUninProSetup.exe"
)

:: Install
echo Installing Revo Uninstaller...
FOR %%i IN ("Revo*.exe") DO Set FileName="%%i"
%FileName% /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
if exist "%ProgramFiles%\VS Revo Group\Revo Uninstaller Pro\RevoUninPro.exe" (
	echo Installation Revo Uninstaller complete.
) else (
	echo Installation Revo Uninstaller failed.
)
::License
@echo Dang Kich Hoat Revo Uninstaller...
del "%PROGRAMDATA%\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro5.lic"
copy /y "revouninstallerpro5.lic" "%PROGRAMDATA%\VS Revo Group\Revo Uninstaller Pro\"

:: Clean up
del "Revo*.exe"
timeout /t 5
popd