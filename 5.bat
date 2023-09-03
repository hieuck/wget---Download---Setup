@echo off

setlocal enabledelayedexpansion

REM set "Link=https://drive.google.com/open?id=1DWF1TJzirSwd4-2La1AOLHqVFNBoEScg"
REM set "Link=https://hieuck-my.sharepoint.com/:u:/g/personal/hieuck_hieuck_onmicrosoft_com/Ea4DdKPYGixLllAoVDnKAPQBoVOMnWfhKrdrQcE84DSHeQ?e=cIRSfS"
REM set "Link=https://www.dropbox.com/scl/fi/ehr9fiybekdwguhkx83wz/TechSmithCamtasia2022Setup.exe?rlkey=a9p1d0w3drdeubl6zw81c2xpb&dl=0"
REM set "Link=https://drive.google.com/file/d/12YouWSR03jUenJ6oF53FUhegw87q3IUG/view?pli=1"
set "Link=https://drive.google.com/open?id=1H9RotfXp6KpKoSBIq8WMdgdYhmkI-_0s&usp=drive_fs"

REM Check if the Link contains "www.dropbox.com" and replace it
echo !Link! | findstr /i /c:"www.dropbox.com" >nul
if !errorlevel!==0 (
		set "Link=!Link:www.dropbox.com=dl.dropboxusercontent.com!"
	goto TheNextStepOfDirectDownloadLink
)

REM Check if the Link contains "/view" and extract the file ID
echo !Link! | findstr /i /c:"/view" >nul
if !errorlevel!==0 (
	for /f "tokens=5 delims=/" %%a in ("!Link!") do (
		set "file_id=%%a"
	)
	REM Remove "/view?pli=1" and construct the download link
	set "Link=https://drive.google.com/uc?export=download&id=!file_id!"
	goto TheNextStepOfDirectDownloadLink
)

REM Check if the Link contains "open?id=" and convert it
echo !Link! | findstr /i /c:"open?id=" >nul
if !errorlevel!==0 (
	REM Replace "open?id=" with "uc?export=download&id="
	set "Link=!Link:open?id=uc?export=download&id!"
	
	REM Split the Link at "&usp=drive_fs" and keep the first part
	for /f "tokens=2,* delims=&" %%a in ("!Link!") do (
		set "Link=https://drive.google.com/uc?export=download&%%a"
	)

	goto TheNextStepOfDirectDownloadLink
)

REM Check if the Link contains "sharepoint.com" and convert it
echo !Link! | findstr /i /c:"sharepoint.com" >nul
if !errorlevel!==0 (
	for /f "delims=? tokens=1" %%a in ("!Link!") do (
		set "Base_Link=%%a"
	)
    set "Link=!Base_Link!?download=1"
    goto TheNextStepOfDirectDownloadLink
)

:TheNextStepOfDirectDownloadLink

echo Link: !Link! > %Temp%\hieuckitlog.txt
echo Link Export: !Link! >> %Temp%\hieuckitlog.txt
type %Temp%\hieuckitlog.txt
pause
