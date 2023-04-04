@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

set "SOFTNAME=Visual C++ runtime"
set "DOWNLOAD_PATH=%~dp0vc_redist"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: URLs and versions for different versions
set "URL[2005]=https://download.microsoft.com/download/6/B/B/6BB661D6-A8AE-4819-B79F-236472F6070C/vcredist_x86.exe"
set "URL[2005x64]=https://download.microsoft.com/download/6/B/B/6BB661D6-A8AE-4819-B79F-236472F6070C/vcredist_x64.exe"
set "URL[2008]=https://download.microsoft.com/download/d/3/4/d34f4aeb-9c2c-4ddf-bc3b-47f21c156732/vcredist_x86.exe"
set "URL[2008x64]=https://download.microsoft.com/download/d/3/4/d34f4aeb-9c2c-4ddf-bc3b-47f21c156732/vcredist_x64.exe"
set "URL[2010]=https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14F-2F95E031B123/vcredist_x86.exe"
set "URL[2010x64]=https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14F-2F95E031B123/vcredist_x64.exe"
set "URL[2012]=https://download.microsoft.com/download/D/0/F/D0F51D39-B609-49A9-9D14-38B0B4EBE1E2/vcredist_x86.exe"
set "URL[2012x64]=https://download.microsoft.com/download/D/0/F/D0F51D39-B609-49A9-9D14-38B0B4EBE1E2/vcredist_x64.exe"
set "URL[2013]=https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe"
set "URL[2013x64]=https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
set "URL[2015]=https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x86.exe"
set "URL[2015x64]=https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe"
set "URL[2017]=https://download.visualstudio.microsoft.com/download/pr/11100272/15ccb3f02745c7b0e3566b62e6f898ec/d3b1f3448e3d3e6e9a9bcbecf632ff23/vc_redist.x86.exe"
set "URL[2017x64]=https://download.visualstudio.microsoft.com/download/pr/11100273/7a119c6a7c7f8b6f8/vc_redist.x64.exe"
set "URL[2019]=https://aka.ms/vs/16/release/vc_redist.x86.exe"
set "URL[2019x64]=https://aka.ms/vs/16/release/vc_redist.x64.exe"
set "VERSION[2005]=2005"
set "VERSION[2005x64]=2005 x64"
set "VERSION[2008]=2008"
set "VERSION[2008x64]=2008 x64"
set "VERSION[2010]=2010"
set "VERSION[2010x64]=2010 x64"
set "VERSION[2012]=2012"
set "VERSION[2012x64]=2012 x64"
set "VERSION[2013]=2013"
set "VERSION[2013x64]=2013 x64"
set "VERSION[2015]=2015"
set "VERSION[2015x64]=2015 x64"
set "VERSION[2017]=2017"
set "VERSION[2017x64]=2017 x64"
set "VERSION[2019]=2019"
set "VERSION[2019x64]=2019 x64"

:: Create download folder
if not exist "%DOWNLOAD_PATH%" mkdir "%DOWNLOAD_PATH%"

:: Download and install each version
for /f "tokens=2 delims==" %%I in ('set URL[') do (
set "URL=%%I"
set "VERSION=!VERSION[%%I]!"
set "FILENAME=!URL:~-19!"
set "FILENAME=!FILENAME:-=!"
set "FILENAME=!FILENAME:/=!"
set "FILENAME=!FILENAME:%SOFTNAME%=!"
set "FILENAME=!FILENAME:%ARCH%=!"
set "DOWNLOAD_FILE=%DOWNLOAD_PATH%!FILENAME!"

if not exist "!DOWNLOAD_FILE!" (
    echo Downloading !SOFTNAME! !ARCH! !VERSION!...
    curl -L --max-redirs 20 --insecure -o "!DOWNLOAD_FILE!" "!URL!" --user-agent "!USERAGENT!"
    if errorlevel 1 (
        echo Download of !SOFTNAME! !ARCH! !VERSION! failed. Exiting...
        exit /b 1
    )
)

echo Installing !SOFTNAME! !ARCH! !VERSION!...
start /wait "" "!DOWNLOAD_FILE!" /install /quiet /norestart
if errorlevel 1 (
    echo Installation of !SOFTNAME! !ARCH! !VERSION! failed. Exiting...
    exit /b 1
)
)

echo Done.