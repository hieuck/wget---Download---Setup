@echo off

set OSVersion=

if "%OSVERSION:~0,1%"=="5" (
    set OSVersion=Windows7
) else if "%OSVERSION:~0,1%"=="10" (
    set OSVersion=Windows10
) else (
    echo Unknown Windows version
)

echo OS version: %OSVersion%
if "%OSVERSION%"=="Windows7" (
	echo Sorry, this software is not compatible with Windows 7. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
		)
	exit
)