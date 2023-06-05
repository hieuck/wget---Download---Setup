@echo off
set "SoftName=DirectX"
set "FileName="

setlocal enabledelayedexpansion
for %%F in ("%FileName%") do (
	set "BaseName=%%~nF"
	if not "%%~xF"=="" (
		set "Extension=%%~xF"
	) else (
		set "Extension=.HieuckIT"
		set "BaseName=!FileName!"
	)
)

echo BaseName: %BaseName%
echo Extension: %Extension%
echo.
if not "%FileName%"=="" (
	if not "%BaseName%"=="" (
		if /i "%FileName%"=="msi" (
			set "BaseName=%SoftName%"
			set "Extension=.msi"
			set "FileName=!BaseName!!Extension!"
		) else if /i "%FileName%"=="exe" (
			set "BaseName=%SoftName%"
			set "Extension=.exe"
			set "FileName=!BaseName!!Extension!"
		) else if /i "%FileName%"=="zip" (
			set "BaseName=%SoftName%"
			set "Extension=.zip"
			set "FileName=!BaseName!!Extension!"
		) else (
			set "FileName=%BaseName%%Extension%"
		)
	) else (
		set "FileName=%SoftName%%Extension%"
	)
) else (
	set "FileName=%SoftName%.HieuckIT"
)


echo BaseName: %BaseName%
echo Extension: %Extension%
echo FileName: %FileName%
pause
endlocal