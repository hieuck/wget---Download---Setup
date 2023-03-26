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
@echo                 Dang Cai Dat Google Drive. Vui Long Cho
@echo off

pushd "%~dp0"
tasklist | find /i "GoogleDriveFS.exe" > nul
if %errorlevel% equ 0 (
    taskkill /im GoogleDriveFS.exe /f
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
echo Downloading Google Drive...
if %ARCH%==x64 (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "GoogleDriveFS-HieuckIT.exe" "https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe"
) else (
    curl --insecure -L --max-redirs 20 -A "%USERAGENT%" -o "GoogleDriveFS-HieuckIT.exe" "link32"
)

:: Install
echo Installing Google Drive...
FOR %%i IN ("GoogleDriveFS*.exe") DO Set FileName="%%i"
%FileName% /S
rem Sort DRIVE_FS_DIR's subdirectories (/a:d) by reverse date (/o:-d) of
rem creation (/t:c) and find the first one that contains the exe.
for /f "usebackq" %%A in  (`dir "%%DRIVE_FS_DIR%%\*" /a:d /o:-d /t:c /b`) do (
  set EXE_PATH=!DRIVE_FS_DIR!\%%A\GoogleDriveFS.exe
  if exist "!EXE_PATH!" (
	echo Installation Google Drive complete.
  )
) else (
	echo Installation Google Drive failed.
	echo Please try Run as Administrator.
)

:: Clean up
del "GoogleDriveFS*.exe"
timeout /t 5
popd