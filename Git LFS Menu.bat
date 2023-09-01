@echo off
setlocal
echo  Enter Repo Path: 
set /p "LocalPath="

pushd "%LocalPath%"
cd  "%LocalPath%"
git-lfs version

:menu
echo Git LFS
echo 1. Git LFS Install				2. Git LFS Unsinstall
echo.
echo 3. Git LFS Track "*.exe"			4. Git LFS Untrack "*.exe"
echo 5. Exit
REM The number corresponding to the default choice
set "defaultChoice=5"
echo Select an option (1 or 2 or 3 or 4) [Default is %defaultChoice%]: 
choice /c 1234 /t 999 /d %defaultChoice% /n >nul

REM Check the errorlevel to determine the choice made by the user
if "%errorlevel%"=="1" (
	set "choice=1"
) else if "%errorlevel%"=="2" (
	set "choice=2"
) else if "%errorlevel%"=="3" (
	set "choice=3"
) else if "%errorlevel%"=="4" (
	set "choice=4"
)
if "%choice%"=="1" (
	git lfs install
) else if "%choice%"=="2" (
	git lfs uninstall
) else if "%choice%"=="3" (
	git lfs track "*.exe"
) else if "%choice%"=="4" (
	git lfs untrack "*.exe"
) else if "%choice%"=="5" (
	exit
)
goto menu
endlocal