@echo off

set "LinkFromGithub="   REM Đặt giá trị LinkFromGithub ở đây
set "LinkFromDropbox="   REM Đặt giá trị LinkFromDropbox ở đây
set "LinkFromOneDrive=4"   REM Đặt giá trị LinkFromOneDrive ở đây

setlocal enabledelayedexpansion

:menu
set "Menu1=Official Website"
set "Menu2=My Github"
set "Menu3=My Dropbox"
set "Menu4=My OneDrive"

set "MenuOptions="
if not "!LinkFromGithub!"=="" (
	set "MenuOptions=!MenuOptions! 2. %Menu2%		"
)
if not "!LinkFromDropbox!"=="" (
	set "MenuOptions=!MenuOptions! 3. %Menu3%		"
)
if not "!LinkFromOneDrive!"=="" (
	set "MenuOptions=!MenuOptions! 4. %Menu4%		"
)

if not "!MenuOptions!"=="" (
	echo Do you want to use the download link from:
	echo.
    echo  1. %Menu1%	%MenuOptions%

) else (
	echo Do you want to use the download link from: %Menu1%
)

pause
goto menu