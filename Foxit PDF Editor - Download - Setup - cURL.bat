@ECHO OFF
title _Hieuck.IT_'s Windows Application
color 0B
mode con:cols=100 lines=20
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
@echo                 Dang Cai Dat Foxit PDF Editor. Vui Long Cho
@echo off

pushd "%~dp0"
:: Terminate the Foxit PDF Editor process
tasklist | find /i "FoxitPDFEditor.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im "FoxitPDFEditor.exe" /f
)

:: Detect Windows architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

:: Set user agent
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Download
echo Downloading Foxit PDF Editor...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "FoxitPDFEditor-HieuckIT.exe" "https://cdn01.foxitsoftware.com/product/phantomPDF/desktop/win/12.1.1/FoxitPDFEditor1211_L10N_Setup_Website.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "FoxitPDFEditor-HieuckIT.exe" "link32"
)

:: Install
echo Installing Foxit PDF Editor...
FOR %%i IN ("FoxitPDFEditor*.exe") DO Set FileName="%%i"
%FileName% /q /norestart
if exist "%ProgramFiles(x86)%\Foxit Software\Foxit PDF Editor\FoxitPDFEditor.exe" (
	echo Installation Foxit PDF Editor complete.
	::License
	::copy /y "%~dp0\banquyenneuco" "vaoday"
) else (
	echo Installation Foxit PDF Editor failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "FoxitPDFEditor*.exe"
timeout /t 5
popd