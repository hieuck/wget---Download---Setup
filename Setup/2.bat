@echo off
setlocal EnableDelayedExpansion

for /f "tokens=4 delims=[.] " %%i in ('ver') do (
  set "version=%%i"
)

if !version! geq 6.1 (
	echo Sorry, this software is not compatible with Windows 7. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
		)
	exit
) else (
	echo acb
)
endlocal
pause