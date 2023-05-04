::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::																								::
::							https://linktr.ee/hieuckit											::
::		Github:				https://github.com/hieuck/curl-uri-wget-download-setup				::
::		Facebook:			https://www.facebook.com/ZzhieuhuhongzZ/							::
::		Donate to me:		Vietcombank - 9966595263 - LE TRUNG HIEU							::
::																								::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )

title _Hieuck.IT_'s Windows Application Setting Up...
color 0B
mode con:cols=100 lines=17
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
@echo                 Dang Cau Hinh %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Set License Extract7z Soft Process Name CheckOSVersion User Agent
set "License=Yes"
set "Extract7z="
set "SOFTNAME=Microsoft Office"
set "PROCESS=OfficeClickToRun.exe"
set "CheckOSVersion=Yes"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Set code based on Windows Architecture
:: Source link: 

set "LINK=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Setup/MicrosoftOfficeSetupWindows10.exe"
if %ARCH%==x86 (
	set "CONFIGOFFICE=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Configuration-2021-32.xml"
) else (
	set "CONFIGOFFICE=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Configuration-2021-64.xml"
)
SET "QUIETMODE=/configure Configuration.xml"
set "SOFTPATH=%PROGRAMFILES%\Common Files\Microsoft Shared\ClickToRun"

:: Set up information related to software cr4cking
if "%License%"=="Yes" (
	set "Admin=Yes"
	set "CR4CKFILE=MAS_AIO"
	set "CR4CKPATH=C:\Z_Hieuck.IT_Z"
	set "CR4CKLINK=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Cr4ck/!CR4CKFILE!.rar"
	set "LINK7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "LINK7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
)

::Extract with 7z
if "%Extract7z%"=="Yes" (
	set "FILENAME=%SOFTNAME%-HieuckIT.zip"
	set "Admin=Yes"
	set "Shortcut=Yes"
	set "SOFTPATH=%PROGRAMFILES%\%SOFTNAME%"
	set "LINK7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "LINK7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
) else (
	set "Shortcut=No"
	set "FILENAME=%SOFTNAME%-HieuckIT.exe "
)
set "SOFTLOCATION=%SOFTPATH%\%PROCESS%"

::Check Windows OS Version
if /i "%CheckOSVersion%"=="no" (
	goto SkipCheckOSVersion
)

setlocal EnableDelayedExpansion
for /f "tokens=4 delims=[.] " %%i in ('ver') do (
	set "version1=%%i"
)

for /f "tokens=5 delims=[.] " %%i in ('ver') do (
	set "version2=%%i"
)
set "version=%version1%.%version2%"

if "%version%"=="6.1" (
	echo This software is not compatible with Windows 7. Starting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Starting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
)
endlocal

set "LINK=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Setup/MicrosoftOfficeSetupWindows7.exe"
if %ARCH%==x86 (
	set "CONFIGOFFICE=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Configuration-2016-32.xml"
) else (
	set "CONFIGOFFICE=https://raw.githubusercontent.com/hieuck/curl-uri-wget-download-setup/main/Setup/Configuration-2016-64.xml"
)
:SkipCheckOSVersion

:: Check if Command Prompt is running with administrator privileges
net session >nul 2>&1
if %errorlevel% == 0 (
	echo Command Prompt is running as Administrator.
) else (
	if "%Admin%"=="Yes" (
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

:: Terminate the %SOFTNAME% Process
tasklist | find /i "%PROCESS%" > nul
if %errorlevel% equ 0 (
	taskkill /im "%PROCESS%" /f
)

:: Save the value of the %time% variable before running the batch script
set start_time=%time%

:: Download
@ECHO OFF
title _Hieuck.IT_'s Windows Application Downloading...
color 0B
mode con:cols=100 lines=17
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
@echo                 Dang Tai %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Downloading %SOFTNAME%...
if exist "wget.exe" (
	wget --no-check-certificate --show-progress -q -O "%FILENAME%" -U "%USERAGENT%" "%LINK%"
	wget --no-check-certificate --show-progress -q -O "Configuration.xml" -U "%USERAGENT%" "%CONFIGOFFICE%"
) else (
	curl -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK%" --insecure
	curl -L --max-redirs 20 -A "%USERAGENT%" -o "Configuration.xml" "%CONFIGOFFICE%" --insecure || (
		if exist "%temp%\download_error.txt" del "%temp%\download_error.txt"
		echo.
		echo wget.exe or curl.exe not found to download, please download at: >> %temp%\download_error.txt
		echo. >> %temp%\download_error.txt
		echo wget: https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/wget.exe >> %temp%\download_error.txt
		echo wget: https://eternallybored.org/misc/wget/ >> %temp%\download_error.txt
		echo curl: https://curl.se/download.html >> %temp%\download_error.txt
		type "%temp%\download_error.txt"
		start "" "%temp%\download_error.txt"
	)
)

if not exist "%FILENAME%" (
	echo Download %SOFTNAME% failed.
	echo Please check your network connection. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

@ECHO OFF
title _Hieuck.IT_'s Windows Application Downloading 7-Zip...
color 0B
mode con:cols=100 lines=17
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
pushd "%~dp0"
echo Downloading 7-Zip...
if "%Extract7z%"=="Yes" (
	if exist "wget.exe" (
		wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%USERAGENT%" "%LINK7zdll%"
		wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%USERAGENT%" "%LINK7zexe%"
	) else (
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.dll" "%LINK7zdll%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.exe" "%LINK7zexe%" --insecure
	)
)

:: Install
@ECHO OFF
title _Hieuck.IT_'s Windows Application Installing...
color 0B
mode con:cols=100 lines=17
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
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Installing %SOFTNAME%...
if "%Extract7z%"=="Yes" (
	@7z.exe x "%FILENAME%" -o"%SOFTPATH%" -aoa -y
) else (
	"%FILENAME%" %QUIETMODE%
)

:: Check Installation Process
echo Checking if %SOFTNAME% installation is complete...
setlocal EnableDelayedExpansion
set count=0
:waitloop
timeout /t 1 /nobreak > nul
set /a count+=1
if exist "%SOFTLOCATION%" goto installed
if !count! equ 30 goto timeout
goto waitloop
:timeout
echo Timeout: %SOFTNAME% installation has not completed in 30 seconds.
goto end
:installed
echo %SOFTNAME% has been installed successfully.
timeout /t 3
:end

:: License
@ECHO OFF
title _Hieuck.IT_'s Windows Application Cr4cking...
color 0B
mode con:cols=100 lines=17
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
@echo                 Dang Cau Hinh %SOFTNAME%. Vui Long Cho...
@echo off
pushd "%~dp0"
if "%License%"=="Yes" (
	echo Cr4cking %SOFTNAME%...
	if exist "wget.exe" (
		if not exist "7z.dll" if not exist "7z.exe" (
			wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%USERAGENT%" "%LINK7zdll%"
			wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%USERAGENT%" "%LINK7zexe%"
		)
		wget --no-check-certificate --show-progress -q -O "%CR4CKFILE%" -U "%USERAGENT%" "%CR4CKLINK%"
	) else (
		if not exist "7z.dll" if not exist "7z.exe" (
			curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.dll" "%LINK7zdll%" --insecure
			curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.exe" "%LINK7zexe%" --insecure
		)
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "%CR4CKFILE%" "%CR4CKLINK%" --insecure
	)
	if exist "%CR4CKFILE%" (
		@7z.exe x -p123 "%CR4CKFILE%" -o"%CR4CKPATH%" -aoa -y
		echo Successfully Cr4cked %SOFTNAME%.
		del "%CR4CKFILE%"
	) else (
		echo Cr4cking %SOFTNAME% failed.
		echo Please try running the script as Administrator.
	)
)

::Check Windows OS Version
if /i "%CheckOSVersion%"=="no" (
	goto SkipCheckOSVersion2
)

setlocal EnableDelayedExpansion
for /f "tokens=4 delims=[.] " %%i in ('ver') do (
	set "version1=%%i"
)

for /f "tokens=5 delims=[.] " %%i in ('ver') do (
	set "version2=%%i"
)
set "version=%version1%.%version2%"

if "%version%"=="6.1" (
	echo This software is not compatible with Windows 7. Starting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Starting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
)
endlocal
"%CR4CKPATH%\MAS_AIO.cmd" /KMS-ActAndRenewalTask /KMS-Office
"%CR4CKPATH%\MAS_AIO.cmd" /KMS-Office

:SkipCheckOSVersion2

"%CR4CKPATH%\MAS_AIO.cmd" /HWID /KMS-ActAndRenewalTask /KMS-Office

:: Create Shortcut
if exist "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" copy /y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" "%PUBLIC%\Desktop"
if exist "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" copy /y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" "%PUBLIC%\Desktop"
if exist "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk" copy /y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk" "%PUBLIC%\Desktop"
if exist "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Word.lnk" copy /y "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Word.lnk" "%PUBLIC%\Desktop"

:: Shortcut
if /i "%Shortcut%"=="no" (
    echo Creating shortcut is skipped.
    goto CleanUp
)

if exist "%SOFTLOCATION%" (
	set "TARGETFILE=%SOFTLOCATION%"
) else (
	echo %SOFTNAME% does not exist in directory "%SOFTPATH%". Exiting script.
	exit /b 1
)

set "SHORTCUTNAME=%SOFTNAME%.lnk"
set "SHORTCUTPATH=%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\%SHORTCUTNAME%"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%SHORTCUTPATH%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%TARGETFILE%" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%SOFTPATH%" >> CreateShortcut.vbs
echo oLink.Description = "Shortcut to %SOFTNAME%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs

if exist "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\%SHORTCUTNAME%" (
	echo Creating shortcut complete.
) else (
	echo Creating shortcut failed.
)

:: Clean Up
:CleanUp
if exist "%FILENAME%" del "%FILENAME%"
if exist "%temp%\download_error.txt" del "%temp%\download_error.txt"
if exist "7z.dll" del "7z.dll"
if exist "7z.exe" del "7z.exe"
if exist "Configuration.xml" del "Configuration.xml"

:: Save the value of the %time% variable after the batch script finishes
set end_time=%time%

:: Convert the start and end times to seconds
for /f "tokens=1-3 delims=:." %%a in ("%start_time%") do set /a "start_seconds=(((%%a*60)+1%%b %% 100)*60)+1%%c %% 100"
for /f "tokens=1-3 delims=:." %%a in ("%end_time%") do set /a "end_seconds=(((%%a*60)+1%%b %% 100)*60)+1%%c %% 100"

:: Calculate the elapsed time in seconds
set /a elapsed_time=%end_seconds%-%start_seconds%

echo Time elapsed: %elapsed_time% seconds.

echo The script will automatically close in 3 seconds.
for /l %%i in (3,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
	if exist "7z.dll" (
		tasklist | find /i "7z.dll" > nul
		if %errorlevel% equ 0 taskkill /im "7z.dll" /f
		del "7z.dll"
	)

	if exist "7z.exe" (
		tasklist | find /i "7z.exe" > nul
		if %errorlevel% equ 0 taskkill /im "7z.exe" /f
		del "7z.exe"
	)

	if exist "%FILENAME%" (
		tasklist | find /i "%FILENAME%" > nul
		if %errorlevel% equ 0 taskkill /im "%FILENAME%" /f
		del "%FILENAME%"
	)
)
echo Please close the script manually if automatically close fails.
popd