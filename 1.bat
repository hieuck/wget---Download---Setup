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

if not "%FileName%"=="" (
    if not "%BaseName%"=="" (
        set "FileName=%BaseName%%Extension%"
    ) else (
        set "FileName=%SoftName%%Extension%"
    )
) else (
    set "FileName=%SoftName%.HieuckIT"
)
echo FileName: %FileName%
pause
endlocal