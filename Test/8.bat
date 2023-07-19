@echo off
set "SoftName=DirectX"
set "FileName=exe"
set "Link=https://zalo.me/download/zalo-pc?utm=90000"

REM Data structure to store format-extension information
set "Formats=7z exe msi rar zip"

for %%F in ("%FileName%") do (
	set "BaseName=%%~nF"
	if not "%%~xF"=="" (
		set "Extension=%%~xF"
	) else (
		set "Extension=.HieuckIT"
		set "BaseName=%FileName%"
	)
)

echo BaseName: %BaseName%
echo Extension: %Extension%
echo FileName: %FileName%
echo 0

if not "%FileName%"=="" (
	if not "%BaseName%"=="" (
		REM Loop through the formats in the data structure
		for %%F in (%Formats%) do (
			REM Check if FileName matches the format
			if /i "%FileName%"=="%%~F" (
				set "BaseName=%SoftName%"
				set "Extension=.%%~F"
				set "FileName=%BaseName%%Extension%"
				echo.
				echo BaseName: %BaseName%
				echo Extension: %Extension%
				echo FileName: %FileName%
				echo 1
				goto :Continue
			)
		)
		
		REM Check if FileName doesn't match any format
		if not "%FileName%"=="%BaseName%%Extension%" (
			set "FileName=%BaseName%%Extension%"
			echo.
			echo BaseName: %BaseName%
			echo Extension: %Extension%
			echo FileName: %FileName%
			echo 2
		)
	) else (
		set "FileName=%SoftName%%Extension%"
		echo.
		echo BaseName: %BaseName%
		echo Extension: %Extension%
		echo FileName: %FileName%
		echo 3

	)
) else (
	if not "%Link:~-3%"=="" (
		REM Extract the extension from Link
		set "BaseName=%SoftName%"
		set "FileName=%BaseName%%Extension%"
		echo.
		echo BaseName: %BaseName%
		echo Extension: %Extension%
		echo FileName: %FileName%
		echo 4
		goto :Continue
	) else (
		set "FileName=%SoftName%.HieuckIT"
		echo.
		echo BaseName: %BaseName%
		echo Extension: %Extension%
		echo FileName: %FileName%
		echo 5
	)
)

:Continue
REM Check if Link's extension matches any format and differs from FileName's extension
if not "%Link:~-3%"=="" (
	set "LinkExtension=%Link:~-3%"
	for %%F in (%Formats%) do (
		REM Check if the extracted extension matches the format and differs from FileName's extension
		if /i "%LinkExtension%"=="%%~F" if not "%Extension%"=="%%~F" (
			set "BaseName=%SoftName%"
			set "Extension=.%%~F"
			set "FileName=%BaseName%!Extension!"
			echo.
			echo BaseName: %BaseName%
			echo Extension: %Extension%
			echo FileName: %FileName%
			echo 6
			goto :PrintResult
		)
	)
	
	REM If Link's extension didn't match any format or matched FileName's extension, use Link's extension for FileName
	set "FileName=%BaseName%%Link:~-4%"
	echo.
	echo BaseName: %BaseName%
	echo Extension: %Extension%
	echo FileName: %FileName%
	echo 7
)

:PrintResult
echo FileName: %FileName%
pause
