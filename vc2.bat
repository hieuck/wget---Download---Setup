@echo off

setlocal EnableDelayedExpansion

:: Detect Windows Architecture
set "arch=x86"
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set "arch=x64"

:: URLs and versions for different versions
set "vc2005=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
set "vc2008=https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
set "vc2010=https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
set "vc2012=https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
set "vc2013=https://download.visualstudio.microsoft.com/download/pr/10912113/5da66ddebb0ad32ebd4b922fd82e8e25/vcredist_x86.exe"
set "vc2015=https://download.visualstudio.microsoft.com/download/pr/6a4c74cd-8ee0-4757-9620-a11a5b48b1a7/CE4843A946EE3732EB2BFC098DB5741DC5495C7BEA204E11D379336DCC68E875/VC_redist.x86.exe"
set "vc2017=http://download.visualstudio.microsoft.com/download/pr/11100226-3548-4e03-a7ec-7ebd35a50b42/78c23676eefd920a6e87213b1c8f6b69/vc_redist.x86.exe"
set "vc2019=http://download.visualstudio.microsoft.com/download/pr/c60ec6d8-0c70-4f26-b5f2-41f76e5b5cf5/732c18634c6bc0d6b385f6b64be72d5f/vc_redist.x86.exe"
set "vc2022=http://download.visualstudio.microsoft.com/download/pr/14b2ef48-3f3e-4563-a798-e845ed9e9f3c/54d8dbb900a758f35e99d88a17b1e60c/vc_redist.x86.exe"

:: Create download folder
set "download_folder=%~dp0\vc_redist"
md "%download_folder%" 2>NUL

:: Download
if "%arch%"=="x64" (
	echo Downloading Microsoft Visual C++ runtimes 2005...
    curl -o "%download_folder%\vc2005_x86.exe" "%vc2005%"
	echo Downloading Microsoft Visual C++ runtimes 2005x64...
    curl -o "%download_folder%\vc2005_x64.exe" "%vc2005%"
	echo Downloading Microsoft Visual C++ runtimes 2008...
    curl -o "%download_folder%\vc2008_x86.exe" "%vc2008%"
	echo Downloading Microsoft Visual C++ runtimes 2008x64...
    curl -o "%download_folder%\vc2008_x64.exe" "%vc2008%"
	echo Downloading Microsoft Visual C++ runtimes 20010...
    curl -o "%download_folder%\vc2010_x86.exe" "%vc2010%"
	echo Downloading Microsoft Visual C++ runtimes 2010x64...
    curl -o "%download_folder%\vc2010_x64.exe" "%vc2010%"
	echo Downloading Microsoft Visual C++ runtimes 2012...
    curl -o "%download_folder%\vc2012_x86.exe" "%vc2012%"
	echo Downloading Microsoft Visual C++ runtimes 2012x64...
    curl -o "%download_folder%\vc2012_x64.exe" "%vc2012%"
	echo Downloading Microsoft Visual C++ runtimes 2013...
    curl -o "%download_folder%\vc2013_x86.exe" "%vc2013%"
	echo Downloading Microsoft Visual C++ runtimes 2013x64...
    curl -o "%download_folder%\vc2013_x64.exe" "%vc2013%"
	echo Downloading Microsoft Visual C++ runtimes 2015+...
    curl -o "%download_folder%\vc2015_x86.exe" "%vc2015%"
	echo Downloading Microsoft Visual C++ runtimes 2015+x64...
    curl -o "%download_folder%\vc2015_x64.exe" "%vc2015%"
::    curl -o "%download_folder%\vc2017_x64.exe" "%vc2017%"
::    curl -o "%download_folder%\vc2019_x64.exe" "%vc2019%"
::    curl -o "%download_folder%\vc2022_x64.exe" "%vc2022%"
) else (
	echo Downloading Microsoft Visual C++ runtimes 2005...
    curl -o "%download_folder%\vc2005_x86.exe" "%vc2005%"
	echo Downloading Microsoft Visual C++ runtimes 2008...
    curl -o "%download_folder%\vc2008_x86.exe" "%vc2008%"
	echo Downloading Microsoft Visual C++ runtimes 20010...
    curl -o "%download_folder%\vc2010_x86.exe" "%vc2010%"
	echo Downloading Microsoft Visual C++ runtimes 2012...
    curl -o "%download_folder%\vc2012_x86.exe" "%vc2012%"
	echo Downloading Microsoft Visual C++ runtimes 2013...
    curl -o "%download_folder%\vc2013_x86.exe" "%vc2013%"
	echo Downloading Microsoft Visual C++ runtimes 2015+...
    curl -o "%download_folder%\vc2015_x86.exe" "%vc2015%"
::    curl -o "%download_folder%\vc2017_x86.exe" "%vc2017%"
::    curl -o "%download_folder%\vc2019_x86.exe" "%vc2019%"
::    curl -o "%download_folder%\vc2022_x86.exe" "%vc2022%"
)

:: install
if "%arch%"=="x64" (
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2005_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2005_x64.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2008_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2008_x64.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2010_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2010_x64.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2012_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2012_x64.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2013_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2013_x64.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2015_x86.exe" /install /quiet /norestart
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2015_x64.exe" /install /quiet /norestart
::	start /wait "" "%download_folder%\vc2017_x64.exe" /install /quiet /norestart
::	start /wait "" "%download_folder%\vc2019_x64.exe" /install /quiet /norestart
::	start /wait "" "%download_folder%\vc2022_x64.exe" /install /quiet /norestart
) else (
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2005_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2008_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2010_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2012_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2013_x86.exe" /q
	echo Installing Microsoft Visual C++ runtimes ...
	start /wait "" "%download_folder%\vc2015_x86.exe" /install /quiet /norestart
::	start /wait "" "%download_folder%\vc2017_x86.exe" /install /quiet /norestart
::	start /wait "" "%download_folder%\vc2019_x86.exe" /install /quiet /norestart
::	start /wait "" "%download_folder%\vc2022_x86.exe" /install /quiet /norestart
)

:: clean up
echo Cleaning up temporary files...
if exist "%download_folder%\vc2005_x86.exe" del "%download_folder%\vc2005_x86.exe"
if exist "%download_folder%\vc2005_x64.exe" del "%download_folder%\vc2005_x64.exe"
if exist "%download_folder%\vc2008_x86.exe" del "%download_folder%\vc2008_x86.exe"
if exist "%download_folder%\vc2008_x64.exe" del "%download_folder%\vc2008_x64.exe"
if exist "%download_folder%\vc2010_x86.exe" del "%download_folder%\vc2010_x86.exe"
if exist "%download_folder%\vc2010_x64.exe" del "%download_folder%\vc2010_x64.exe"
if exist "%download_folder%\vc2012_x86.exe" del "%download_folder%\vc2012_x86.exe"
if exist "%download_folder%\vc2012_x64.exe" del "%download_folder%\vc2012_x64.exe"
if exist "%download_folder%\vc2013_x86.exe" del "%download_folder%\vc2013_x86.exe"
if exist "%download_folder%\vc2013_x64.exe" del "%download_folder%\vc2013_x64.exe"
if exist "%download_folder%\vc2015_x86.exe" del "%download_folder%\vc2015_x86.exe"
if exist "%download_folder%\vc2015_x64.exe" del "%download_folder%\vc2015_x64.exe"
if exist "%download_folder%\vc2017_x86.exe" del "%download_folder%\vc2017_x86.exe"
if exist "%download_folder%\vc2017_x64.exe" del "%download_folder%\vc2017_x64.exe"
if exist "%download_folder%\vc2019_x86.exe" del "%download_folder%\vc2019_x86.exe"
if exist "%download_folder%\vc2019_x64.exe" del "%download_folder%\vc2019_x64.exe"
if exist "%download_folder%\vc2022_x86.exe" del "%download_folder%\vc2022_x86.exe"
if exist "%download_folder%\vc2022_x64.exe" del "%download_folder%\vc2022_x64.exe"
rmdir /s /q "%download_folder%"

echo Done.
