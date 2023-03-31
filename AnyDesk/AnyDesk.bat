@ECHO OFF
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