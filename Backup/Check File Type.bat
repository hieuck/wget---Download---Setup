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

