@echo off
set "SoftName=DirectX"
set "FileName=msi.a"
set "Link=https://example.com/file.exe"

setlocal enabledelayedexpansion

REM Data structure to store format-extension information
set "Formats=7z exe msi rar zip"

for %%F in ("%FileName%") do (
	set "BaseName=%%~nF"
	if not "%%~xF"=="" (
		set "Extension=%%~xF"
	) else (
		set "Extension=.HieuckIT"
		set "BaseName=!FileName!"
	)
)

echo Link: %Link:~-4%
echo BaseName: %BaseName%
echo Extension: %Extension%
echo.

if not "%FileName%"=="" (
	if not "%BaseName%"=="" (
		REM Loop through the formats in the data structure
		for %%F in (%Formats%) do (
			REM Check if FileName matches the format
			if /i "%FileName%"=="%%~F" (
				set "BaseName=%SoftName%"
				set "Extension=.%%~F"
				set "FileName=!BaseName!!Extension!"
				echo 123
				goto :Continue
			)
		)
		
		REM Check if FileName doesn't match any format
		if not "!FileName!"=="!BaseName!!Extension!" (
			set "FileName=%BaseName%%Extension%"
		)
	) else (
		set "FileName=%SoftName%%Extension%"
	)
) else (
	if not "%Link:~-4%"=="" (
		REM Extract the extension from Link
		set "Extension=%Link:~-4%"
		set "BaseName=%SoftName%"
		set "FileName=!BaseName!!Extension!"
		goto :Continue
	) else (
		set "FileName=%SoftName%.HieuckIT"
	)
)

:Continue
echo Link: %Link:~-4%
echo BaseName: %BaseName%
echo Extension: %Extension%
echo FileName: %FileName%
pause
endlocal
