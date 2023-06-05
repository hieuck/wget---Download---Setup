@echo off
set "SoftName=DirectX"
set "FileName=."

setlocal enabledelayedexpansion

rem Data structure to store format-extension information
set "Formats=msi exe zip"

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
        rem Loop through the formats in the data structure
        for %%F in (%Formats%) do (
            rem Check if FileName matches the format
            if /i "%FileName%"=="%%~F" (
                set "BaseName=%SoftName%"
                set "Extension=.%%~F"
                set "FileName=!BaseName!!Extension!"
            )
        )
        
        rem Check if FileName doesn't match any format
        if not "!FileName!"=="!BaseName!!Extension!" (
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
