@ECHO OFF
title _Hieuck.IT_'s Windows Application
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
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho
@echo off
pushd "%~dp0"
:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Set Admin License Soft File Process Name User Agent
set "License=Yes"
set "Shortcut=No"
set "SOFTNAME=FastStone Capture"
set "FILENAME=FastStone Capture-HieuckIT.exe"
set "PROCESS=FSCapture.exe"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Set code based on Windows Architecture
if "%License%"=="Yes" (
	set "Admin=Yes"
)

if %ARCH%==x86 (
	set "SOFTPATH=%PROGRAMFILES%\FastStone Capture"
) else (
	set "SOFTPATH=%PROGRAMFILES(X86)%\FastStone Capture"
)
set "LINK=https://www.faststone.org/DN/FSCaptureSetup99.exe"
set "QUIETMODE=/S"
set "SOFTLOCATION=%SOFTPATH%\%PROCESS%"
set "CR4CKFILE=FastStoneCaptureCr4ck.rar"
set "CR4CKLINK=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/FastStoneCr4ck/FastStoneCaptureCr4ck.rar"
set "CR4CKPATH=%LOCALAPPDATA%\FastStone"

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

:: Download
@ECHO OFF
title _Hieuck.IT_'s Windows Application
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
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho
@echo off
pushd "%~dp0"
echo Downloading %SOFTNAME%...
curl -L --max-redirs 20 -A "%USERAGENT%" -o "%FILENAME%" "%LINK%" --insecure

if not exist "%FILENAME%" (
	echo Download %SOFTNAME% failed.
	echo Please check your network connection. Exiting in 3 seconds...
	for /l %%i in (3,-1,1) do (
		echo Exiting in %%i seconds...
		timeout /t 1 /nobreak >nul
	)
	exit
)

:: Install
@ECHO OFF
title _Hieuck.IT_'s Windows Application
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
@echo                 Dang Cai Dat %SOFTNAME%. Vui Long Cho
@echo off
pushd "%~dp0"
echo Installing %SOFTNAME%...
"%FILENAME%" %QUIETMODE%

:: Check Installation Process
if exist "%SOFTLOCATION%" (
	echo Installation %SOFTNAME% complete.
) else (
	echo Installation %SOFTNAME% failed.
	echo Please try Run as Administrator.
)

:: License
if "%License%"=="Yes" (
	echo Cr4cking %SOFTNAME%...
	curl -L --max-redirs 20 -A "%USERAGENT%" -o "%CR4CKFILE%" "%CR4CKLINK%" --insecure
	if exist "%CR4CKFILE%" (
		move /y "%CR4CKFILE%" "%CR4CKPATH%"
	) else (
		echo Please try running the script as Administrator.
	)
	if exist "%CR4CKPATH%\%CR4CKFILE%" (
		"%PROGRAMFILES%\WinRAR\UnRAR.exe" e -p123 /y "%CR4CKPATH%\%CR4CKFILE%" "%CR4CKPATH%"
		echo Successfully Cr4cked %SOFTNAME%.
		del "%CR4CKPATH%\%CR4CKFILE%"
	) else (
		echo Cr4cking %SOFTNAME% failed.
		echo Please try running the script as Administrator.
	)
)

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
	echo Creating shortcut complete.
) else (
	echo Creating shortcut failed.
)

:: Clean Up
:CleanUp
del "%FILENAME%"
echo The script will automatically close in 3 seconds.
for /l %%i in (3,-1,1) do (
	echo Closing in %%i seconds...
	timeout /t 1 /nobreak >nul
	if exist "%FILENAME%" (
		tasklist | find /i "%FILENAME%" > nul
		if %errorlevel% equ 0 (
			taskkill /im "%FILENAME%" /f
		)
	del "%FILENAME%"
	)
)
popd