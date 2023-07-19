REM Check File Type
if not "%FileType%"=="" (
	if /i "%FileType%"=="msi" (
		if /i "%Link:~-4%"==".msi" (
			set "FileName=%SoftName%-HieuckIT.msi"
		) else if /i "%Link:~-4%"==".exe" (
			set "FileName=%SoftName%-HieuckIT.exe"
		) else if /i "%Link:~-4%"==".zip" (
			set "FileName=%SoftName%-HieuckIT.zip"
		) else (
			set "FileName=%SoftName%-HieuckIT.msi"
	
		)
	) else if /i "%FileType%"=="exe" (
		if /i "%Link:~-4%"==".msi" (
			set "FileName=%SoftName%-HieuckIT.msi"
		) else if /i "%Link:~-4%"==".exe" (
			set "FileName=%SoftName%-HieuckIT.exe"
		) else if /i "%Link:~-4%"==".zip" (
			set "FileName=%SoftName%-HieuckIT.zip"
		) else (
			set "FileName=%SoftName%-HieuckIT.exe"
		)
	) else if /i "%FileType%"=="zip" (
		if /i "%Link:~-4%"==".msi" (
			set "FileName=%SoftName%-HieuckIT.msi"
		) else if /i "%Link:~-4%"==".exe" (
			set "FileName=%SoftName%-HieuckIT.exe"
		) else if /i "%Link:~-4%"==".zip" (
			set "FileName=%SoftName%-HieuckIT.zip"
		) else (
			set "FileName=%SoftName%-HieuckIT.zip"
		)
	) else (
		set "FileName=%SoftName%.HieuckIT"
	)
) else if /i "%Link:~-4%"==".msi" (
	set "FileName=%SoftName%-HieuckIT.msi"
) else if /i "%Link:~-4%"==".exe" (
	set "FileName=%SoftName%-HieuckIT.exe"
) else if /i "%Link:~-4%"==".zip" (
	set "FileName=%SoftName%-HieuckIT.zip"
) else (
	set "FileName=%SoftName%.HieuckIT"
)

REM Check File Name
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
	if /i "%Link:~-4%"==".msi" (
		set "FileName=%SoftName%-HieuckIT.msi"
	) else if /i "%Link:~-4%"==".exe" (
		set "FileName=%SoftName%-HieuckIT.exe"
	) else if /i "%Link:~-4%"==".zip" (
		set "FileName=%SoftName%-HieuckIT.zip"
	) else (
		set "FileName=%SoftName%.HieuckIT"
	)
)