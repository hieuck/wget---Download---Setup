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

setlocal

git version
echo.

:InputDrive
echo Enter Drive Path: 
set /p "DriveChar="

rem Check if the path has been set
if not exist "%DriveChar%:\" (
	echo Drive "%DriveChar%:\" not found
	goto InputDrive
)

if not exist "%DriveChar%:\stable-diffusion-webui" (
	git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
)

pushd "%DriveChar%:\stable-diffusion-webui"
call "webui-user.bat"