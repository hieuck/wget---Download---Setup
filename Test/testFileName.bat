@echo off
set "SoftName=DirectX"
set "FileName=."
set "Link="
setlocal
for %%F in ("%FileName%") do (
	set "BaseName=%%~nF"
	if not "%%~xF"=="" (
		set "Extension=%%~xF"
	) else (
		set "Extension=.HieuckIT"
	)
)
echo BaseName: %BaseName%
echo Extension: %Extension%
if not "%Extension%"=="msi" if not "%Extension%"=="exe" if not "%Extension%"=="zip" set "Extension=.HieuckIT"

if not "%FileName%"=="" (
	if not "%BaseName%"=="" (
		set "FileName=%BaseName%%Extension%"
	) else (
		set "FileName=%SoftName%%Extension%"
	)
) else (
	set "FileName=%SoftName%%Extension%"
)

echo FileName: %FileName%
pause
endlocal
if /i "%Extension%"==".msi" (
	goto check_msi
) else if /i "%Extension%"==".exe" (
	goto check_exe
) else if /i "%Extension%"==".zip" (
	goto check_zip
) else (
	set "FileName=%FileName%"
	goto check_done
)

pause