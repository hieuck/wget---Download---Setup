@echo off

setlocal EnableDelayedExpansion

:: Detect Windows Architecture
set "arch=x86"
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set "arch=x64"

:: URLs and versions for different versions
set "vc2005=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
set "vc2008=http://download.microsoft.com/download/d/3/4/d34eb4a2-d4a6-4ca9-9b4d-2a6977ebd8e5/vcredist_x86.exe"
set "vc2010=http://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe"
set "vc2012=http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU3/vcredist_x86.exe"
set "vc2013=http://download.microsoft.com/download/0/6/4/064F84EA-D1D4-4BD6-A14E-87635F9300DC/vcredist_x86.exe"
set "vc2015=http://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x86.exe"
set "vc2017=http://download.visualstudio.microsoft.com/download/pr/11100226-3548-4e03-a7ec-7ebd35a50b42/78c23676eefd920a6e87213b1c8f6b69/vc_redist.x86.exe"
set "vc2019=http://download.visualstudio.microsoft.com/download/pr/c60ec6d8-0c70-4f26-b5f2-41f76e5b5cf5/732c18634c6bc0d6b385f6b64be72d5f/vc_redist.x86.exe"
set "vc2022=http://download.visualstudio.microsoft.com/download/pr/14b2ef48-3f3e-4563-a798-e845ed9e9f3c/54d8dbb900a758f35e99d88a17b1e60c/vc_redist.x86.exe"

:: Create download folder
set "download_folder=%~dp0\vc_redist"
md "%download_folder%" 2>NUL

:: Download
echo Downloading Microsoft Visual C++ runtimes...
if "%arch%"=="x64" (
    curl -o "%download_folder%\vc2005_x64.exe" "%vc2005%"
    curl -o "%download_folder%\vc2008_x64.exe" "%vc2008%"
    curl -o "%download_folder%\vc2010_x64.exe" "%vc2010%"
    curl -o "%download_folder%\vc2012_x64.exe" "%vc2012%"
    curl -o "%download_folder%\vc2013_x64.exe" "%vc2013%"
    curl -o "%download_folder%\vc2015_x64.exe" "%vc2015%"
    curl -o "%download_folder%\vc2017_x64.exe" "%vc2017%"
    curl -o "%download_folder%\vc2019_x64.exe" "%vc2019%"
    curl -o "%download_folder%\vc2022_x64.exe" "%vc2022%"
) else (
    curl -o "%download_folder%\vc2005_x86.exe" "%vc2005%"
    curl -o "%download_folder%\vc2008_x86.exe" "%vc2008%"
    curl -o "%download_folder%\vc2010_x86.exe" "%vc2010%"
    curl -o "%download_folder%\vc2012_x86.exe" "%vc2012%"
    curl -o "%download_folder%\vc2013_x86.exe" "%vc2013%"
    curl -o "%download_folder%\vc2015_x86.exe" "%vc2015%"
    curl -o "%download_folder%\vc2017_x86.exe" "%vc2017%"
    curl -o "%download_folder%\vc2019_x86.exe" "%vc2019%"
    curl -o "%download_folder%\vc2022_x86.exe" "%vc2022%"
)

:: install
echo Installing Microsoft Visual C++ runtimes...
if "%arch%"=="x64" (
	start /wait "" "%download_folder%\vc2005_x64.exe" /q
	start /wait "" "%download_folder%\vc2008_x64.exe" /q
	start /wait "" "%download_folder%\vc2010_x64.exe" /q
	start /wait "" "%download_folder%\vc2012_x64.exe" /q
	start /wait "" "%download_folder%\vc2013_x64.exe" /q
	start /wait "" "%download_folder%\vc2015_x64.exe" /install /quiet /norestart
	start /wait "" "%download_folder%\vc2017_x64.exe" /install /quiet /norestart
	start /wait "" "%download_folder%\vc2019_x64.exe" /install /quiet /norestart
	start /wait "" "%download_folder%\vc2022_x64.exe" /install /quiet /norestart
) else (
	start /wait "" "%download_folder%\vc2005_x86.exe" /q
	start /wait "" "%download_folder%\vc2008_x86.exe" /q
	start /wait "" "%download_folder%\vc2010_x86.exe" /q
	start /wait "" "%download_folder%\vc2012_x86.exe" /q
	start /wait "" "%download_folder%\vc2013_x86.exe" /q
	start /wait "" "%download_folder%\vc2015_x86.exe" /install /quiet /norestart
	start /wait "" "%download_folder%\vc2017_x86.exe" /install /quiet /norestart
	start /wait "" "%download_folder%\vc2019_x86.exe" /install /quiet /norestart
	start /wait "" "%download_folder%\vc2022_x86.exe" /install /quiet /norestart
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
