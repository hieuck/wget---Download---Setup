::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::																								::
::							https://linktr.ee/hieuckit											::
::		Github:				https://github.com/hieuck/curl-uri-wget-download-setup				::
::		Facebook:			https://www.facebook.com/ZzhieuhuhongzZ/							::
::		Donate to me:		Vietcombank - 9966595263 - LE TRUNG HIEU							::
::																								::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@ECHO OFF
SET liveincolor=1 & SET "c_underline=[4m" & SET "c_reset=[0m" & SET "c_Red_Blak=[91;40m" & SET "c_Gre_Blak=[92;40m" & SET "c_Yel_Blak=[93;40m" & SET "c_Blu_Blak=[94;40m" & SET "c_Mag_Blak=[95;40m" & SET "c_Cya_Blak=[96;40m" & SET "c_Whi_Blak=[97;40m"

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
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.
@echo                 %c_Yel_Blak%The current date and time are: %c_Whi_Blak%%date% %time%%c_reset%
@echo                 %c_Mag_Blak%Dang Cai Dat %c_Blu_Blak%%SOFTNAME%%c_Mag_Blak%. Vui Long Cho...%c_reset%
@echo off
pushd "%~dp0"
:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Set OSVersion License Extract7z Soft Process Name User Agent
set "OSVersion="
set "License=Yes"
set "Extract7z="
set "SOFTNAME=FastStone Capture"
set "PROCESS=FSCapture.exe"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

::Check Windows OS Version
if "%OSVersion%"=="Yes" (
	setlocal EnableDelayedExpansion
	for /f "tokens=4 delims=[.] " %%i in ('ver') do (
		set "version=%%i"
	)

	if !version! geq 6.1 (
		echo Sorry, this software is not compatible with Windows 7. Exiting in 3 seconds...
		for /l %%i in (3,-1,1) do (
			echo Exiting in %%i seconds...
			timeout /t 1 /nobreak >nul
		)
		exit
	)
	endlocal
)

:: Set code based on Windows Architecture
:: Source link: https://www.faststone.org/download.htm
if %ARCH%==x86 (
	set "SOFTPATH=%PROGRAMFILES%\FastStone Capture"
) else (
	set "SOFTPATH=%PROGRAMFILES(X86)%\FastStone Capture"
)
set "LINK=https://www.faststone.org/DN/FSCaptureSetup99.exe"
set "QUIETMODE=/S"

:: Set up information related to software cr4cking
if "%License%"=="Yes" (
	set "Admin=Yes"
	set "CR4CKFILE=FastStoneCaptureCr4ck"
	set "CR4CKPATH=%LOCALAPPDATA%\FastStone\FSC"
	set "CR4CKLINK=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Cr4ck/!CR4CKFILE!.rar"
	set "LINK7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "LINK7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
)

::Extract with 7z
if "%Extract7z%"=="Yes" (
	set "FILENAME=%SOFTNAME%-HieuckIT.zip "
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

:: Check if Command Prompt is running with administrator privileges
net session >nul 2>&1
if %errorlevel% == 0 (
	echo %c_Yel_Blak%Command Prompt is running as Administrator.%c_reset%
) else (
	if "%Admin%"=="Yes" (
		echo %c_Red_Blak%Please Run as Administrator. Exiting in 3 seconds...%c_reset%
		for /l %%i in (3,-1,1) do (
			echo %c_Whi_Blak%Exiting in %%i seconds...%c_reset%
			timeout /t 1 /nobreak >nul
		)
		exit
	) else (
		echo %c_Blu_Blak%Warning: This program may not function correctly without administrator privileges.%c_reset%
		for /l %%i in (3,-1,1) do (
			echo %c_Whi_Blak%Starting in %%i seconds...%c_reset%
			timeout /t 1 /nobreak >nul
		)
	)
)

:: Terminate the %SOFTNAME% Process
tasklist | find /i "%PROCESS%" > nul
if %errorlevel% equ 0 (
	taskkill /im "%PROCESS%" /f
)

:: Download
@ECHO OFF
title _Hieuck.IT_'s Windows Application Downloading...
color 0B
mode con:cols=100 lines=17
@cls
echo.
echo.
echo.
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.
@echo                 %c_Yel_Blak%The current date and time are: %c_Whi_Blak%%date% %time%%c_reset%
@echo                 %c_Mag_Blak%Dang Cai Dat %c_Blu_Blak%%SOFTNAME%%c_Mag_Blak%. Vui Long Cho...%c_reset%
@echo off
pushd "%~dp0"
echo %c_Gre_Blak%Downloading %SOFTNAME%...%c_reset%
if exist "wget.exe" (
	wget --no-check-certificate --show-progress -q -O "%FILENAME%" -U "%USERAGENT%" "%LINK%"
) else (
	curl -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK%" --insecure
)

if not exist "%FILENAME%" (
	echo %c_Red_Blak%Download %SOFTNAME% failed.%c_reset%
	echo %c_Red_Blak%Please check your network connection. Exiting in 3 seconds...%c_reset%
	for /l %%i in (3,-1,1) do (
		echo %c_Whi_Blak%Exiting in %%i seconds...%c_reset%
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
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.
@echo                 %c_Yel_Blak%The current date and time are: %c_Whi_Blak%%date% %time%%c_reset%
@echo                 %c_Mag_Blak%Dang Cai Dat %c_Blu_Blak%%SOFTNAME%%c_Mag_Blak%. Vui Long Cho...%c_reset%
@echo off
pushd "%~dp0"
echo %c_Gre_Blak%Downloading 7-Zip...%c_reset%
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
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.
@echo                 %c_Yel_Blak%The current date and time are: %c_Whi_Blak%%date% %time%%c_reset%
@echo                 %c_Mag_Blak%Dang Cai Dat %c_Blu_Blak%%SOFTNAME%%c_Mag_Blak%. Vui Long Cho...%c_reset%
@echo off
pushd "%~dp0"
echo %c_Gre_Blak%Installing %SOFTNAME%...%c_reset%
if "%Extract7z%"=="Yes" (
	@7z.exe x "%FILENAME%" -o"%SOFTPATH%" -aoa -y
) else (
	"%FILENAME%" %QUIETMODE%
)

:: Check Installation Process
echo %c_Yel_Blak%Checking if %SOFTNAME% installation is complete...%c_reset%
setlocal EnableDelayedExpansion
set count=0
:waitloop
timeout /t 1 /nobreak > nul
set /a count+=1
if exist "%SOFTLOCATION%" goto installed
if !count! equ 30 goto timeout
goto waitloop
:timeout
echo %c_Red_Blak%Timeout: %SOFTNAME% installation has not completed in 30 seconds.%c_reset%
goto end
:installed
echo %c_Gre_Blak%%SOFTNAME% has been installed successfully.%c_reset%
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
@echo     Бл          ллл   ллл ллл лллллл ллл   ллл  ллллл  ллл  лл ллл ллллллллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo        Вл       ллллллллл ллл лллллл ллл   ллл ллл     ллллл   ллл    ллл
@echo       л         ллл   ллл ллл ллл    ллл   ллл ллл   л ллл лл  ллл    ллл
@echo     Бл   ВВВВВ  ллл   ллл ллл лллллл ллллллллл  ллллл  ллл  лл ллл    ллл В
@echo.
@echo                 %c_Yel_Blak%The current date and time are: %c_Whi_Blak%%date% %time%%c_reset%
@echo                 %c_Mag_Blak%Dang Cai Dat %c_Blu_Blak%%SOFTNAME%%c_Mag_Blak%. Vui Long Cho...%c_reset%
@echo off
pushd "%~dp0"
if "%License%"=="Yes" (
	echo %c_Gre_Blak%Cr4cking %SOFTNAME%...%c_reset%
	if exist "wget.exe" (
		wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%USERAGENT%" "%LINK7zdll%"
		wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%USERAGENT%" "%LINK7zexe%"
		wget --no-check-certificate --show-progress -q -O "%CR4CKFILE%" -U "%USERAGENT%" "%CR4CKLINK%"
	) else (
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.dll" "%LINK7zdll%" --insecure
		curl -L --max-redirs 20 -A "%USERAGENT%" -o "7z.exe" "%LINK7zexe%" --insecure
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

:: Shortcut
if /i "%Shortcut%"=="no" (
    echo %c_Yel_Blak%Creating shortcut is skipped.%c_reset%
    goto CleanUp
)

if exist "%SOFTLOCATION%" (
	set "TARGETFILE=%SOFTLOCATION%"
) else (
	echo %c_Red_Blak%%SOFTNAME% does not exist in directory "%SOFTPATH%". Exiting script.%c_reset%
	exit /b 1
)

set "SHORTCUTNAME=%SOFTNAME%.lnk"
set "SHORTCUTPATH=%PUBLIC%\Desktop\%SHORTCUTNAME%"

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%SHORTCUTPATH%" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%TARGETFILE%" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%SOFTPATH%" >> CreateShortcut.vbs
echo oLink.Description = "Shortcut to %SOFTNAME%" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs

if exist "%PUBLIC%\Desktop\%SHORTCUTNAME%" (
	echo %c_Gre_Blak%Creating shortcut complete.%c_reset%
) else (
	echo %c_Red_Blak%Creating shortcut failed.%c_reset%
)

:: Clean Up
:CleanUp
del "%FILENAME%"
if "%License%"=="Yes" (
	del 7z.dll
	del 7z.exe
) else if "%Extract7z%"=="Yes" (
	del 7z.dll
	del 7z.exe
)

echo %c_Gre_Blak%The script will automatically close in 3 seconds.%c_reset%
for /l %%i in (3,-1,1) do (
	echo %c_Whi_Blak%Closing in %%i seconds...%c_reset%
	timeout /t 1 /nobreak >nul
	if exist "7z.dll" (
		tasklist | find /i "7z.dll" > nul
		if %errorlevel% equ 0 (
			taskkill /im "7z.dll" /f
		)
	del "7z.dll"
	)
	if exist "7z.exe" (
		tasklist | find /i "7z.exe" > nul
		if %errorlevel% equ 0 (
			taskkill /im "7z.exe" /f
		)
	del "7z.exe"
	)
	if exist "%FILENAME%" (
		tasklist | find /i "%FILENAME%" > nul
		if %errorlevel% equ 0 (
			taskkill /im "%FILENAME%" /f
		)
	del "%FILENAME%"
	)
)
echo %c_Red_Blak%Please close the script manually if automatically close fails.%c_reset%
popd