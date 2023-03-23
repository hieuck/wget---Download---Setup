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
@echo                 Dang Cai Dat Topaz Video AI. Vui Long Cho
@echo off

pushd "%~dp0"
taskkill /F /IM "Topaz Video AI.exe"

if  exist TopazVideoAI*.msi goto Install
if not exist TopazVideoAI*.msi goto Download

:Download
@echo Dang Tai Xuong Topaz Video AI...
curl -L --max-redirs 20 -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -o TopazVideoAI-HieuckIT.msi https://topazlabs.com/d/tvai/latest/win/full
@echo Tai Xuong Topaz Video AI Hoan Thanh.
goto Install

:Install
@echo Dang Cai Dat Topaz Video AI...
FOR %%i IN ("TopazVideoAI*.msi") DO Set FileName="%%i"
%FileName% /quiet /norestart
@echo Cai Dat Topaz Video AI Thanh Cong.
goto Lic

:Lic
copy /y "%~dp0\Topaz Video AI Cr4ck\" "%ProgramFiles%\Topaz Labs LLC\Topaz Video AI"
goto END

:END
::del TopazVideoAI*.msi
echo.
echo Installation completed successfully
pause