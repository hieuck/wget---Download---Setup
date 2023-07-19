@echo off
set "SoftName=DirectX"
set "FileName=7z"
set "Link=https://example.com/file.zip"

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

echo BaseName1: %BaseName%
echo Extension1: %Extension%
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
    set "FileName=%SoftName%.HieuckIT"
)

echo Link: %Link:~-4%
echo BaseName: %BaseName%
echo Extension: %Extension%
echo FileName: %FileName%
pause
endlocal
