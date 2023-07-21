REM Download with browser
for %%F in ("%FileName%") do set "size=%%~zF"
if %size% equ 0 (
	echo %SoftName% download failed. File size is 0KB. Downloading with browser....
	goto DLwB
) else if %size% lss 1048576 (
	echo %SoftName% download failed. File size is less than 1MB. Downloading with browser....
	goto DLwB
) else (
	goto ExitDLwB
)

:DLwB
if exist "%UserProfile%\OneDrive\Downloads" (
	pushd "%UserProfile%\OneDrive\Downloads"
) else (
	pushd "%UserProfile%\Downloads"
)

start "" "%Link%" /WAIT /D "%~dp0" /B "%FileName%"
if not "%FileDLwB%"=="" set "FileDLwB=%FileDLwB%"

:CheckExist
for /R %%i in ("%FileDLwB%") do set "FileNameDLwB=%%i"
if not exist "%FileNameDLwB%" (
	timeout /t 1 /nobreak >nul & goto CheckExist
)

move /y "%FileNameDLwB%" "%~dp0%FileName%"

:ExitDLwB
pushd "%~dp0"

if not exist "%FileName%" (
	echo Download %SoftName% failed.
	echo Please check your network connection. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)
