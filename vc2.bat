@ECHO OFF
:: Detect Windows Architecture
if exist "%SYSTEMROOT%\SysWOW64" (
	set "ARCH=x64"
) else (
	set "ARCH=x86"
)

:: Set Admin License Soft File Process Name User Agent
set "SOFTNAME=Microsoft Visual C++ runtimes"
set "USERAGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

:: Set code based on Windows Architecture
setlocal EnableDelayedExpansion
:: URLs and versions for different versions
set "vc2005=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
set "vc2008=https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
set "vc2010=https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
set "vc2012=https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
set "vc2013=https://download.visualstudio.microsoft.com/download/pr/10912113/5da66ddebb0ad32ebd4b922fd82e8e25/vcredist_x86.exe"
set "vc2015=https://download.visualstudio.microsoft.com/download/pr/6a4c74cd-8ee0-4757-9620-a11a5b48b1a7/CE4843A946EE3732EB2BFC098DB5741DC5495C7BEA204E11D379336DCC68E875/VC_redist.x86.exe"
set "vc2005x64=https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
set "vc2008x64=https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
set "vc2010x64=https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"
set "vc2012x64=https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
set "vc2013x64=https://download.visualstudio.microsoft.com/download/pr/10912041/cee5d6bca2ddbcd039da727bf4acb48a/vcredist_x64.exe"
set "vc2015x64=https://download.visualstudio.microsoft.com/download/pr/bcb0cef1-f8cb-4311-8a5c-650a5b694eab/2257B3FBE3C7559DE8B31170155A433FAF5B83829E67C589D5674FF086B868B9/VC_redist.x64.exe"
:: Create download folder
set "download_folder=%~dp0\vc_redist"
md "%download_folder%" 2>NUL

:: Download
echo Downloading Microsoft Visual C++ runtimes...
if "%arch%"=="x64" (
    curl -o "%download_folder%\vc2005_x64.exe" "%vc2005x64%"
    curl -o "%download_folder%\vc2008_x64.exe" "%vc2008x64%"
    curl -o "%download_folder%\vc2010_x64.exe" "%vc2010x64%"
    curl -o "%download_folder%\vc2012_x64.exe" "%vc2012x64%"
    curl -o "%download_folder%\vc2013_x64.exe" "%vc2013x64%"
    curl -o "%download_folder%\vc2015_x64.exe" "%vc2015x64%"
) else (
    curl -o "%download_folder%\vc2005_x86.exe" "%vc2005%"
    curl -o "%download_folder%\vc2008_x86.exe" "%vc2008%"
    curl -o "%download_folder%\vc2010_x86.exe" "%vc2010%"
    curl -o "%download_folder%\vc2012_x86.exe" "%vc2012%"
    curl -o "%download_folder%\vc2013_x86.exe" "%vc2013%"
    curl -o "%download_folder%\vc2015_x86.exe" "%vc2015%"
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
) else (
	start /wait "" "%download_folder%\vc2005_x86.exe" /q
	start /wait "" "%download_folder%\vc2008_x86.exe" /q
	start /wait "" "%download_folder%\vc2010_x86.exe" /q
	start /wait "" "%download_folder%\vc2012_x86.exe" /q
	start /wait "" "%download_folder%\vc2013_x86.exe" /q
	start /wait "" "%download_folder%\vc2015_x86.exe" /install /quiet /norestart
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
rmdir /s /q "%download_folder%"

echo Done.