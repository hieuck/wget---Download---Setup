::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::																								::
::							https://linktr.ee/hieuckit											::
::		Github:				https://github.com/hieuck/curl-uri-wget-download-setup				::
::		Facebook:			https://www.facebook.com/ZzhieuhuhongzZ/							::
::		Donate to me:		Vietcombank - 9966595263 - LE TRUNG HIEU							::
::																								::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
pushd "%~dp0"

REM Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

REM Detect Windows Architecture
set "ARCH=x86"
if exist "%SystemRoot%\SysWOW64" set "ARCH=x64"

title _Hieuck.IT_'s Windows Application Setting Up...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.
@echo                 The current date and time are: %date% %time%
@echo                 Dang Cau Hinh Microsoft Office Installer. Vui Long Cho...
@echo off
REM Required Configuration Settings

set "Extract7z="
set "License=Yes"

REM set "SoftName=Microsoft Office Installer"
set "Process=OfficeClickToRun.exe"

set "FileName="
set "SoftNameVersion="
set "FileDLwB=MicrosoftOffice*.exe"

set "SupportOldWindows=Yes"
set "Support32Bit=Yes"
set "UserAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

REM Set code based on Windows Architecture
REM Source Link: 

setlocal

:menu
echo Do you want to use which version of Microsoft Office?
echo 1. Office ProPlusRetail				2. Office ProPlus2019Volume
echo.
echo 3. Office ProPlus2021Volume			4. Office O365ProPlusRetail

REM The number corresponding to the default choice
set "defaultChoice=3"
echo Select an option (1 or 2 or 3 or 4) [Default is %defaultChoice%]: 
choice /c 1234 /t 5 /d %defaultChoice% /n >nul

REM Check the errorlevel to determine the choice made by the user
if errorlevel 4 (
	set "choice=4"
) else if errorlevel 3 (
	set "choice=3"
) else if errorlevel 2 (
	set "choice=2"
) else if errorlevel 1 (
	set "choice=1"
)

REM Display the choice made
if "%choice%"=="1" (
	echo You have chosen to use Office Professional Plus 2016 - ProPlusRetail.
	set "SoftName=Microsoft Office Professional Plus 2016"
	set "Link=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Setup/Office/setup/MicrosoftOfficeSetupWindows7.exe"
	set "OfficeConfiguration=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-2016-64.xml"
	if /i "%ARCH%"=="x86" set "OfficeConfiguration=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-2016-32.xml"
) else if "%choice%"=="2" (
	echo You have chosen to use Office Professional Plus 2019 Volume License - ProPlus2019Volume.
	set "SoftName=Microsoft Office Professional Plus 2019 Volume License"
	set "Link=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Setup/Office/setup/MicrosoftOfficeSetupWindows10.exe"
	set "OfficeConfiguration=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-2019-64.xml"
	if /i "%ARCH%"=="x86" set "OfficeConfiguration=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-2019-64.xml"
) else if "%choice%"=="3" (
	echo You have chosen to use Office Professional Plus 2021 Volume License - ProPlus2021Volume.
	set "SoftName=Microsoft Office Professional Plus 2021 Volume License"
	set "Link=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Setup/Office/setup/MicrosoftOfficeSetupWindows10.exe"
	set "OfficeConfiguration=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-2021-64.xml"
	if /i "%ARCH%"=="x86" set "OfficeConfiguration=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-2021-32.xml"
) else if "%choice%"=="4" (
	echo You have chosen to use Microsoft 365 Apps for Enterprise - O365ProPlusRetail.
	set "SoftName=Microsoft Microsoft 365 Apps for Enterprise"
	set "Link=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Setup/Office/setup/MicrosoftOffice365Setup.exe"
	set "OfficeConfiguration=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-365.xml"
) else (
	echo Invalid choice. Please select 1, 2, 3, or 4.
	goto menu
)

:: Set the Link as an environment variable
setx SoftName "%SoftName%"
setx Link "%Link%"
setx OfficeConfiguration "%OfficeConfiguration%"

endlocal

set "SoftName=%SoftName%"

set "LinkForOldWindows="
set "LinkForOldWindows32bit="
set "LinkForOldWindows64bit="

set "Link=%Link%"
set "LinkForAllWindows32bit="
set "LinkForAllWindows64bit="

set "OfficeConfiguration=%OfficeConfiguration%"
set "OfficeConfigurationForOldWindows32bit="
set "OfficeConfigurationForOldWindows64bit="
set "OfficeConfigurationForNewWindows32bit="
set "OfficeConfigurationForNewWindows64bit="

set "SoftPath=%ProgramFiles%\Common Files\Microsoft Shared\ClickToRun"
set "SoftPathFor32bit="
set "SoftPathFor64bit="

set "QuietMode=/configure Configuration.xml"

set "Cr4ckFile=MAS_AIO"
set "Cr4ckPath=C:\Z_Hieuck.IT_Z"

set "Shortcut="

REM Check Compatibility for 32-bit
if /i "%Support32Bit%"=="No" (
	if /i "%ARCH%"=="x86" (
		echo Notice: This software is only compatible with Windows 64-bit operating systems. Exiting in 3 seconds...
		for /l %%i in (3,-1,1) do (
			echo Exiting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
		exit
	)
)

REM Check Windows OS Version and Check Support Old Windows
setlocal EnableDelayedExpansion
for /f "tokens=4 delims=[.] " %%i in ('ver') do (
	set "version1=%%i"
)

for /f "tokens=5 delims=[.] " %%i in ('ver') do (
	set "version2=%%i"
)
set "version=%version1%.%version2%"

if "%version%"=="6.1" goto ForOldWindows
goto ForNewWindows
endlocal

:ForOldWindows
if /i "%SupportOldWindows%"=="No" (
	echo Sorry, this software is not compatible with Windows 7. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
) else (
	if /i "%ARCH%"=="x86" (
		if not "%LinkForOldWindows32bit%"=="" (
			set "Link=%LinkForOldWindows32bit%"
		) else (
			if not "%LinkForOldWindows%"=="" (
				set "Link=%LinkForOldWindows%"
			) else (
				if not "%LinkForAllWindows32bit%"=="" (
					set "Link="%LinkForAllWindows32bit%"
				) else (
					set "Link=%Link%"
				)
			)
		)
		if not "%OfficeConfigurationForOldWindows32bit%"=="" set "OfficeConfiguration=%OfficeConfigurationForOldWindows32bit%"
		if not "%SoftPathFor32bit%"=="" set "SoftPath=%SoftPathFor32bit%"
	) else (
		if not "%LinkForOldWindows64bit%"=="" (
			set "Link=%LinkForOldWindows64bit%"
		) else (
			if not "%LinkForOldWindows%"=="" (
				set "Link=%LinkForOldWindows%"
			) else (
				if not "%LinkForAllWindows64bit%"=="" (
					set "Link=%LinkForAllWindows64bit%"
				) else (
					set "Link=%Link%"
				)
			)
		)
		if not "%OfficeConfigurationForOldWindows64bit%"=="" set "OfficeConfiguration=%OfficeConfigurationForOldWindows64bit%"
		if not "%SoftPathFor64bit%"=="" set "SoftPath=%SoftPathFor64bit%"
	)
)
goto NextStepForCheckOSVersion

:ForNewWindows
if /i "%ARCH%"=="x86" (
	if not "%LinkForAllWindows32bit%"=="" set "Link=%LinkForAllWindows32bit%"
	if not "%OfficeConfigurationForNewWindows32bit%"=="" set "OfficeConfiguration=%OfficeConfigurationForNewWindows32bit%"
	if not "%SoftPathFor32bit%"=="" set "SoftPath=%SoftPathFor32bit%"
) else (
	if not "%LinkForAllWindows64bit%"=="" set "Link=%LinkForAllWindows64bit%"
	if not "%OfficeConfigurationForNewWindows64bit%"=="" set "OfficeConfiguration=%OfficeConfigurationForNewWindows64bit%"
	if not "%SoftPathFor64bit%"=="" set "SoftPath=%SoftPathFor64bit%"
)

:NextStepForCheckOSVersion
REM Extract with 7z
if /i "%Extract7z%"=="Yes" (
	set "Admin=Yes"
	set "Link7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "Link7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
	if /i "%ARCH%"=="x86" (
		set "Link7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z32/7z.dll"
		set "Link7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z32/7z.exe"
	)
	if not "%SoftPath%"=="" (
		set "SoftPath=%SoftPath%"
	) else (
		set "SoftPath=%ProgramFiles%\%SoftName%"
	)
	if not "%Shortcut%"=="" (
		set "Shortcut=%Shortcut%"
	) else (
		set "Shortcut=Yes"
	)
) else (
	if not "%Shortcut%"=="" (
		set "Shortcut=%Shortcut%"
	) else (
		set "Shortcut=No"
	)
)

REM Set up information related to software cr4cking
if /i "%License%"=="Yes" (
	set "Admin=Yes"
	set "Cr4ckLink=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Cr4ck/!Cr4ckFile!.rar"
	set "Link7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "Link7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
	if /i "%ARCH%"=="x86" (
		set "Link7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z32/7z.dll"
		set "Link7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z32/7z.exe"
	)
	if not "%Cr4ckPath%"=="" (
		set "Cr4ckPath=%Cr4ckPath%"
	) else (
		set "Cr4ckPath=%SoftPath%"
	)
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
		set "BaseName=%FileName%"
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
				set "FileName=%BaseName%%Extension%"
				goto :Continue_Check_FileName
			)
		)

		REM Check if FileName doesn't match any format
		if not "%FileName%"=="%BaseName%%Extension%" (
			set "FileName=%BaseName%%Extension%"
		)
	) else (
		set "FileName=%SoftName%%Extension%"
	)
) else (
	if not "%Link:~-3%"=="" (
		REM Extract the extension from Link
		set "BaseName=%SoftName%"
		set "LinkExtension=%Link:~-3%"
		REM Check if LinkExtension is not in Formats
		echo %Formats% | find /i "%LinkExtension%" >nul
		if errorlevel 1 (
			set "Extension=%LinkExtension%"
		) else (
			set "Extension=.HieuckIT"
		)
		set "FileName=%BaseName%%Extension%"
		goto :Continue_Check_FileName
	) else (
		set "FileName=%SoftName%.HieuckIT"
	)
)

:Continue_Check_FileName
REM Check if Link's extension matches any format and differs from FileName's extension
set "LinkExtension=%Link:~-3%"
for %%F in (%Formats%) do (
	REM Check if the extracted extension matches the format and differs from FileName's extension
	if /i "%LinkExtension%"=="%%~F" if not "%Extension%"=="%%~F" (
		REM set "BaseName=%SoftName%"
		set "Extension=.%%~F"
		set "FileName=%BaseName%%Extension%"
		goto :ExportResult
	)
)

REM If Link's extension didn't match any format or matched FileName's extension, use Link's extension for FileName
set "LinkExtension=%Link:~-3%"
set "FoundFormat="
for %%F in (%Formats%) do (
	if /i "%LinkExtension%"=="%%~F" (
		set "FoundFormat=1"
		set "Extension=.%%~F"
	)
)

if not defined FoundFormat (
	if "%Extension%"=="" (
		set "Extension=.HieuckIT"
	)
)

:ExportResult
set "FileName=%BaseName%%Extension%"

echo Information related to %SoftName%:> %Temp%\hieuckitlog.txt
echo.>> %Temp%\hieuckitlog.txt
echo Link: %Link:&=^&%>> %Temp%\hieuckitlog.txt
echo FileName: %FileName%>> %Temp%\hieuckitlog.txt
if not "%OfficeConfiguration%"=="" echo Office Configuration: %OfficeConfiguration%>> %Temp%\hieuckitlog.txt
if not "%SoftPath%"=="" echo SoftPath: %SoftPath%>> %Temp%\hieuckitlog.txt
if not "%Cr4ckFile%"=="" echo Cr4ckFile: %Cr4ckFile%>> %Temp%\hieuckitlog.txt
if not "%Cr4ckLink%"=="" echo Cr4ckLink: %Cr4ckLink%>> %Temp%\hieuckitlog.txt
if not "%Cr4ckPath%"=="" echo Cr4ckPath: %Cr4ckPath%>> %Temp%\hieuckitlog.txt
echo Shortcut: %Shortcut%>> %Temp%\hieuckitlog.txt
type "%Temp%\hieuckitlog.txt"
timeout /t 2

REM Check if Command Prompt is running with administrator privileges
net session >nul 2>&1
if %errorlevel% == 0 (
	echo Command Prompt is running as Administrator.
) else (
	if /i "%Admin%"=="Yes" (
		echo Please Run as Administrator. Exiting in 3 seconds...
		for /l %%i in (3,-1,1) do (
			echo Exiting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
		exit
	) else (
		echo Warning: This program may not function correctly without administrator privileges.
		for /l %%i in (3,-1,1) do (
			echo Starting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
	)
)

REM Terminate the %SoftName% Process
tasklist | find /i "%Process%" > nul
if %errorlevel% equ 0 (
	taskkill /im "%Process%" /f
)

REM Save the value of the %time% variable before running the batch script
set start_time=%time%

REM Download
title _Hieuck.IT_'s Windows Application Downloading...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.
@echo                 The current date and time are: %date% %time%
@echo                 Dang Tai %SoftName%. Vui Long Cho...
@echo off
echo Downloading %SoftName%...
if exist "wget.exe" (
	wget --no-check-certificate --show-progress -q -O "%FileName%" -U "%UserAgent%" "%Link%"
	wget --no-check-certificate --show-progress -q -O "Configuration.xml" -U "%UserAgent%" "%OfficeConfiguration%"
) else (
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%FileName%" "%Link%" --insecure
	curl -L --max-redirs 20 -A "%UserAgent%" -o "Configuration.xml" "%OfficeConfiguration%" --insecure || (
		echo.
		echo wget.exe or curl.exe not found to download, please download at: > %Temp%\hieuckitlog.txt
		echo. >> %Temp%\hieuckitlog.txt
		echo wget: https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/wget.exe >> %Temp%\hieuckitlog.txt
		echo wget: https://eternallybored.org/misc/wget/ >> %Temp%\hieuckitlog.txt
		echo curl: https://curl.se/download.html >> %Temp%\hieuckitlog.txt
		type "%Temp%\hieuckitlog.txt"
		start "" "%Temp%\hieuckitlog.txt"
	)
)

REM Download with browser
setlocal EnableDelayedExpansion

for %%F in ("%FileName%") do set "size=%%~zF"
for %%F in ("Configuration*.xml") do set "sizeCfg=%%~zF"

if %size% equ 0 (
	if %sizeCfg% equ 0 (
		echo %SoftName% and Configuration.xml download failed. All files have a size of 0KB. Downloading with a browser...
		goto DLwB
	) else (
		echo %SoftName% download failed. File size is 0KB. Downloading with browser...
		goto DLwB
	)
) else if %sizeCfg% equ 0 (
	echo Configuration.xml download failed. File size is 0KB. Downloading with browser...
	goto DLwB
)

goto ExitDLwB

:DLwB
if exist "%UserProfile%\OneDrive\Downloads" (
	pushd "%UserProfile%\OneDrive\Downloads"
) else (
	pushd "%UserProfile%\Downloads"
)

if %size% equ 0 (
	start "" "%Link%" /WAIT /D "%~dp0" /B "%FileName%"
) else if %sizeCfg% equ 0 (
	start "" "%OfficeConfiguration%" /WAIT /D "%~dp0" /B "Configuration.xml"
)

if not "%FileDLwB%"=="" set "FileDLwB=%FileDLwB%"

:CheckExist
for /R %%i in ("%FileDLwB%") do set "FileNameDLwB=%%i"
for /R %%i in ("Configuration*.xml") do set "FileNameDLwBCfg=%%i"
if not exist "%FileNameDLwB%" (
	timeout /t 1 /nobreak >nul & goto CheckExist
) else if not exist "%FileNameDLwBCfg%" (
	timeout /t 1 /nobreak >nul & goto CheckExist
)

echo Download completed with the browser. Installation in progress...
move /y "%FileNameDLwB%" "%~dp0%FileName%"
move /y "%FileNameDLwBCfg%" "%~dp0Configuration.xml"

endlocal
:ExitDLwB
pushd "%~dp0"

if not exist "%FileName%" (
	echo Download %SoftName% failed.
	echo Please check your network connection. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

title _Hieuck.IT_'s Windows Application Downloading 7-Zip...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.
@echo                 The current date and time are: %date% %time%
@echo                 Dang Tai 7-Zip. Vui Long Cho...
@echo off
echo Downloading 7-Zip...
if /i "%Extract7z%"=="Yes" (
	if exist "wget.exe" (
		wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%UserAgent%" "%Link7zdll%"
		wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%UserAgent%" "%Link7zexe%"
	) else (
		curl -L --max-redirs 20 -A "%UserAgent%" -o "7z.dll" "%Link7zdll%" --insecure
		curl -L --max-redirs 20 -A "%UserAgent%" -o "7z.exe" "%Link7zexe%" --insecure
	)
)

REM Install
title _Hieuck.IT_'s Windows Application Installing...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.
@echo                 The current date and time are: %date% %time%
@echo                 Dang Cai Dat %SoftName%. Vui Long Cho...
@echo off
echo Installing %SoftName%...
if /i "%Extract7z%"=="Yes" (
	@7z.exe x "%FileName%" -o"%SoftPath%" -aoa -y
) else (
	"%FileName%" %QuietMode%
)

REM Check Installation Process
echo Checking if %SoftName% installation is complete...
setlocal EnableDelayedExpansion
set count=0
:waitloop
timeout /t 1 /nobreak > nul
set /a count+=1
if exist "%SoftPath%\%Process%" goto installed
if !count! equ 30 goto timeout
goto waitloop
:timeout
echo Timeout: %SoftName% installation has not completed in 30 seconds.
goto end
:installed
echo %SoftName% has been installed successfully.
echo.>> %Temp%\hieuckitlog.txt
echo %SoftName% has been installed successfully.>> %Temp%\hieuckitlog.txt
timeout /t 2
:end

REM License
title _Hieuck.IT_'s Windows Application Cr4cking...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.
@echo                 The current date and time are: %date% %time%
@echo                 Dang Cau Hinh %SoftName%. Vui Long Cho...
@echo off
if /i "%License%"=="Yes" (
	echo Cr4cking %SoftName%...
	if exist "wget.exe" (
		if not exist "7z.dll" if not exist "7z.exe" (
			wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%UserAgent%" "%Link7zdll%"
			wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%UserAgent%" "%Link7zexe%"
		)
		wget --no-check-certificate --show-progress -q -O "%Cr4ckFile%" -U "%UserAgent%" "%Cr4ckLink%"
	) else (
		if not exist "7z.dll" if not exist "7z.exe" (
			curl -L --max-redirs 20 -A "%UserAgent%" -o "7z.dll" "%Link7zdll%" --insecure
			curl -L --max-redirs 20 -A "%UserAgent%" -o "7z.exe" "%Link7zexe%" --insecure
		)
		curl -L --max-redirs 20 -A "%UserAgent%" -o "%Cr4ckFile%" "%Cr4ckLink%" --insecure
	)
	if exist "%Cr4ckFile%" (
		@7z.exe x -p123 "%Cr4ckFile%" -o"%Cr4ckPath%" -aoa -y
		echo Successfully Cr4cked %SoftName%.
		echo.>> %Temp%\hieuckitlog.txt
		echo Successfully Cr4cked %SoftName%.>> %Temp%\hieuckitlog.txt
		del "%Cr4ckFile%"
	) else (
		echo Cr4cking %SoftName% failed.
		echo Please try running the script as Administrator.
	)
)

::Close Setup
tasklist | find /i "OfficeC2RClient.exe" > nul
if %errorlevel% equ 0 taskkill /im "OfficeC2RClient.exe" /f

REM Create Shortcut
if exist "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" copy /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" "%Public%\Desktop"
if exist "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" copy /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" "%Public%\Desktop"
if exist "%ProgramData%\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk" copy /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk" "%Public%\Desktop"
if exist "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word.lnk" copy /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word.lnk" "%Public%\Desktop"

::Check Windows OS Version to Cr4ck Office

if "%OfficeConfiguration%"=="https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Office/config/Configuration-365.xml" (
	echo Microsoft 365 Apps for Enterprise requires an activation account.
	goto NextStepAfterCr4ckForCheckOSVersion
)

setlocal EnableDelayedExpansion
for /f "tokens=4 delims=[.] " %%i in ('ver') do (
	set "version1=%%i"
)

for /f "tokens=5 delims=[.] " %%i in ('ver') do (
	set "version2=%%i"
)
set "version=%version1%.%version2%"

if "%version%"=="6.1" goto Cr4ckForWindows7
goto Cr4ckForWindows10
endlocal

:Cr4ckForWindows7
call "%Cr4ckPath%\MAS_AIO.cmd" /KMS-Office /S
timeout /t 3
call "%Cr4ckPath%\MAS_AIO.cmd" /KMS-ActAndRenewalTask /KMS-Office /S
goto NextStepAfterCr4ckForCheckOSVersion

:Cr4ckForWindows10
call "%Cr4ckPath%\MAS_AIO.cmd" /HWID /KMS-ActAndRenewalTask /KMS-Office /S

:NextStepAfterCr4ckForCheckOSVersion
REM Shortcut
if /i "%Shortcut%"=="No" (
	echo Creating Shortcut is skipped.
	goto CleanUp
)

if exist "%SoftPath%\%Process%" (
	set "TargetFile=%SoftPath%\%Process%"
) else (
	echo %SoftName% does not exist in directory "%SoftPath%". Exiting script.
	exit /b 1
)

set "ShortcutName=%SoftName%.lnk"
set "ShortcutPath=%Public%\Desktop\%ShortcutName%"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%ShortcutPath%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%TargetFile%" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%SoftPath%" >> CreateShortcut.vbs
echo oLink.Description = "Shortcut to %SoftName%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs

if exist "%Public%\Desktop\%ShortcutName%" (
	echo Creating Shortcut complete.
	echo Creating Shortcut complete.>> %Temp%\hieuckitlog.txt
) else (
	echo Creating Shortcut failed.
)

REM Clean Up
:CleanUp
title _Hieuck.IT_'s Windows Application Cleaning Up...
color 0B
mode con:cols=120 lines=17
if not exist "wget.exe" mode con:cols=80 lines=17
@cls
echo.
echo.
echo.
@echo     ��          ���   ��� ��� ������ ���   ���  �����  ���  �� ��� ���������
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo        ��       ��������� ��� ������ ���   ��� ���     �����   ���    ���
@echo       �         ���   ��� ��� ���    ���   ��� ���   � ��� ��  ���    ���
@echo     ��   �����  ���   ��� ��� ������ ���������  �����  ���  �� ���    ��� �
@echo.
@echo                 The current date and time are: %date% %time%
@echo                 Dang Don Dep %SoftName%. Vui Long Cho...
@echo off
echo Cleaning up temporary files...
echo.>> %Temp%\hieuckitlog.txt
setlocal EnableDelayedExpansion
set count=0
set deleteSuccess=0
:waitloopcheck
if exist "7z.dll" del "7z.dll">> %Temp%\hieuckitlog.txt 2>&1
if exist "7z.exe" del "7z.exe">> %Temp%\hieuckitlog.txt 2>&1
if exist "Configuration.xml" del "Configuration.xml">> %Temp%\hieuckitlog.txt 2>&1
if exist "%FileName%" (
	del "%FileName%">> %Temp%\hieuckitlog.txt 2>&1
	if not exist "%FileName%" set deleteSuccess=1
)
timeout /t 1 /nobreak > nul
set /a count+=1
if !deleteSuccess! equ 1 (
	echo The %SoftName% installer has been deleted.
	echo The %SoftName% installer has been deleted.>> %Temp%\hieuckitlog.txt
	goto endcheck
) else (
	echo.>> %Temp%\hieuckitlog.txt
)
if !count! equ 30 goto timeoutcheck
goto waitloopcheck
:timeoutcheck
echo Timeout: Deletion failed. Please delete the file manually.
echo Timeout: Deletion failed. Please delete the file manually.>> %Temp%\hieuckitlog.txt
:endcheck
REM Save the value of the %time% variable after the batch script finishes
set end_time=%time%

REM Convert the start and end times to seconds
for /f "tokens=1-3 delims=:." %%a in ("%start_time%") do set /a "start_seconds=(((%%a*60)+1%%b %% 100)*60)+1%%c %% 100"
for /f "tokens=1-3 delims=:." %%a in ("%end_time%") do set /a "end_seconds=(((%%a*60)+1%%b %% 100)*60)+1%%c %% 100"

REM Calculate the elapsed time in seconds
set /a elapsed_time=%end_seconds%-%start_seconds%

echo Time elapsed: %elapsed_time% seconds.

echo The script will automatically close in 3 seconds.
for /l %%i in (3,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
)
echo Please close the script manually if automatically close fails.
popd