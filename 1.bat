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

@echo off
set "SoftName=DirectX"
set "FileName=."  REM Đặt giá trị FileName tại đây

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

REM Xác định giá trị của biến "Extension" dựa trên phần mở rộng trong "FileName"
set "Extension=%Extension:~1%"
if "%Extension%"=="" (
    if "%FileName%"=="msi" (
        set "Extension=.msi"
    ) else if "%FileName%"=="exe" (
        set "Extension=.exe"
    ) else if "%FileName%"=="zip" (
        set "Extension=.zip"
    ) else (
        set "Extension=.HieuckIT"
    )
)
REM Kết thúc xác định giá trị của biến "Extension"

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


@echo off
set "SoftName=DirectX"
set "FileName=."  REM Đặt giá trị FileName tại đây

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

REM Xác định giá trị của biến "Extension" dựa trên phần mở rộng trong "FileName"
set "Extension=%Extension:~1%"
if "%Extension%"=="" (
    if "%FileName%"=="msi" (
        set "Extension=.msi"
    ) else if "%FileName%"=="exe" (
        set "Extension=.exe"
    ) else if "%FileName%"=="zip" (
        set "Extension=.zip"
    ) else (
        set "Extension=.HieuckIT"
    )
)
REM Kết thúc xác định giá trị của biến "Extension"

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