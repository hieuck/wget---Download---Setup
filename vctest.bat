@echo off

setlocal EnableExtensions EnableDelayedExpansion

:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
    set "ARCH=x64"
) else (
    set "ARCH=x86"
)

set "SOFTNAME=Visual C++ runtime"
set "INSTALLER=vcredist_%VERSION%_%ARCH%.exe"
set "DOWNLOAD_PATH=%~dp0vc_redist"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Define download URLs for all versions and architectures
set "URL[2005]=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
set "URL[2005x64]=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
set "URL[2008]=https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
set "URL[2008x64]=https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
set "URL[2010]=https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
set "URL[2010x64]=https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"
set "URL[2012]=https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
set "URL[2012x64]=https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
set "URL[2013]=https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe"
set "URL[2013x64]=https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
set "URL[2015]=https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x86.exe"
set "URL[2015x64]=https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe"
set "URL[2017]=https://aka.ms/vs/15/release/vc_redist.x86.exe"
set "URL[2017x64]=https://aka.ms/vs/15/release/vc_redist.x64.exe"
set "URL[2019]=https://aka.ms/vs/16/release/vc_redist.x86.exe"
set "URL[2019x64]=https://aka.ms/vs/16/release/vc_redist.x64.exe"
set "URL[2022]=https://aka.ms/vs/17/release/vc_redist.x86.exe"
set "URL[2022x64]=https://aka.ms/vs/17/release/vc_redist.x64.exe"

:: Create download folder if it doesn't exist
if not exist "%DOWNLOAD_PATH%" mkdir "%DOWNLOAD_PATH%"

:: Download and install runtimes
for /f "tokens=2 delims==" %%G in ('set URL[') do (
    set "URL=%%G"
    set "INSTALLER=!URL:~R,-4!"
    set "INSTALL_PATH=!DOWNLOAD_PATH!\!INSTALLER!"

    if not exist "!INSTALL_PATH!" (
        echo Downloading "!SOFTNAME! !INSTALLER!..."
        curl -L --max-redirs 20 --insecure -o "%DOWNLOAD_PATH%\!INSTALLER!" "!URL[%VERSION%%ARCH%]!"

    )
pause
    echo Installing "!SOFTNAME! !INSTALLER!..."
    start /wait "" "!INSTALL_PATH!" /q /norestart
)

echo All runtimes have been installed successfully.
