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
@echo                 Dang Cau Hinh %SoftName%. Vui Long Cho...
@echo off
pushd "%~dp0"
:: Set License Extract7z Soft Process Name OldWindows 32-bit Support User Agent
set "License="
set "Extract7z="
set "SoftName=Foxit PDF Reader"
set "Process=FoxitPDFReader.exe"
set "SupportOldWindows=Yes"
set "Support32Bit=Yes"
set "UserAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Set code based on Windows Architecture
:: Source Link: https://www.foxit.com/downloads/pdf-reader-thanks.html?product=Foxit-Reader&platform=Windows&version=&package_type=&language=English&formId=download-reader

set "LinkForOldWindows="
set "LinkForOldWindows32bit="
set "LinkForOldWindows64bit="

set "Link=https://www.foxit.com/downloads/latest.html?product=Foxit-Reader"
set "LinkForAllWindows32bit="
set "LinkForAllWindows64bit="

set "SoftPath="
set "SoftPathFor32bit=%ProgramFiles%\Foxit Software\Foxit PDF Reader"
set "SoftPathFor64bit=%ProgramFiles(x86)%\Foxit Software\Foxit PDF Reader"

set "QuietMode=/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"

set "Cr4ckFile="
set "Cr4ckPath="

set "Shortcut="

:: Detect Windows Architecture and Check Compatibility for 32-bit
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

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

::Check Windows OS Version and Check Support Old Windows
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
		if not "%SoftPathFor64bit%"=="" set "SoftPath=%SoftPathFor64bit%"
	)
)
goto NextStepForCheckOSVersion

:ForNewWindows
if /i "%ARCH%"=="x86" (
	if not "%LinkForAllWindows32bit%"=="" set "Link=%LinkForAllWindows32bit%"
	if not "%SoftPathFor32bit%"=="" set "SoftPath=%SoftPathFor32bit%"
) else (
	if not "%LinkForAllWindows64bit%"=="" set "Link=%LinkForAllWindows64bit%"
	if not "%SoftPathFor64bit%"=="" set "SoftPath=%SoftPathFor64bit%"
)

:NextStepForCheckOSVersion
:: Set up information related to software cr4cking
if /i "%License%"=="Yes" (
	set "Admin=Yes"
	set "Cr4ckLink=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/Cr4ck/!Cr4ckFile!.rar"
	set "Link7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "Link7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
	if not "%Cr4ckPath%"=="" (
		set "Cr4ckPath=%Cr4ckPath%"
	) else (
		set "Cr4ckPath=%SoftPath%"
	)
)

:: Extract with 7z
if /i "%Extract7z%"=="Yes" (
	set "Admin=Yes"
	set "FileName=%SoftName%-HieuckIT.zip"
	set "Link7zdll=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.dll"
	set "Link7zexe=https://github.com/hieuck/curl-uri-wget-download-setup/raw/main/7z/7z.exe"
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
	set "FileName=%SoftName%-HieuckIT.exe "
	if not "%Shortcut%"=="" (
		set "Shortcut=%Shortcut%"
	) else (
		set "Shortcut=No"
	)
)

echo Information related to %SoftName%:> %Temp%\hieuckitlog.txt
echo.>> %Temp%\hieuckitlog.txt
echo Link: %Link:&=^&%>> %Temp%\hieuckitlog.txt
echo FileName: %FileName%>> %Temp%\hieuckitlog.txt
if not "%SoftPath%"=="" echo SoftPath: %SoftPath%>> %Temp%\hieuckitlog.txt
if not "%Cr4ckFile%"=="" echo Cr4ckFile: %Cr4ckFile%>> %Temp%\hieuckitlog.txt
if not "%Cr4ckLink%"=="" echo Cr4ckLink: %Cr4ckLink%>> %Temp%\hieuckitlog.txt
if not "%Cr4ckPath%"=="" echo Cr4ckPath: %Cr4ckPath%>> %Temp%\hieuckitlog.txt
echo Shortcut: %Shortcut%>> %Temp%\hieuckitlog.txt
type "%Temp%\hieuckitlog.txt"
timeout /t 3

:: Check if Command Prompt is running with administrator privileges
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

:: Terminate the %SoftName% Process
tasklist | find /i "%Process%" > nul
if %errorlevel% equ 0 (
	taskkill /im "%Process%" /f
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
@echo                 Dang Tai %SoftName%. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Downloading %SoftName%...
if exist "wget.exe" (
	wget --no-check-certificate --show-progress -q -O "%FileName%" -U "%UserAgent%" "%Link%"
) else (
	curl -L --max-redirs 20 -A "%UserAgent%" -o "%FileName%" "%Link%" --insecure || (
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

if not exist "%FileName%" (
	echo Download %SoftName% failed.
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
if /i "%Extract7z%"=="Yes" (
	if exist "wget.exe" (
		wget --no-check-certificate --show-progress -q -O "7z.dll" -U "%UserAgent%" "%Link7zdll%"
		wget --no-check-certificate --show-progress -q -O "7z.exe" -U "%UserAgent%" "%Link7zexe%"
	) else (
		curl -L --max-redirs 20 -A "%UserAgent%" -o "7z.dll" "%Link7zdll%" --insecure
		curl -L --max-redirs 20 -A "%UserAgent%" -o "7z.exe" "%Link7zexe%" --insecure
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
@echo                 Dang Cai Dat %SoftName%. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Installing %SoftName%...
if /i "%Extract7z%"=="Yes" (
	@7z.exe x "%FileName%" -o"%SoftPath%" -aoa -y
) else (
	"%FileName%" %QuietMode%
)

:: Check Installation Process
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
@echo                 Dang Cau Hinh %SoftName%. Vui Long Cho...
@echo off
pushd "%~dp0"
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

:: Shortcut
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
) else (
	echo Creating Shortcut failed.
)

:: Clean Up
:CleanUp
@ECHO OFF
title _Hieuck.IT_'s Windows Application Cleaning Up...
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
@echo                 Dang Don Dep %SoftName%. Vui Long Cho...
@echo off
pushd "%~dp0"
echo Cleaning up temporary files...
echo.>> %Temp%\hieuckitlog.txt
setlocal EnableDelayedExpansion
set count=0
set deleteSuccess=0
:waitloopcheck
if exist "7z.dll" del "7z.dll">> %Temp%\hieuckitlog.txt 2>&1
if exist "7z.exe" del "7z.exe">> %Temp%\hieuckitlog.txt 2>&1
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
:endcheck
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
)
echo Please close the script manually if automatically close fails.
popd