@echo off

set "Password=123"
set "SourceFolder=%~dp1"
set "RARName=%~n1"
set "RARFile=%SourceFolder%%RARName%.rar"

set "Index=1"
:LOOP
if exist "%RARFile%" (
    set "RARFile=%SourceFolder%%RARName% (%Index%).rar"
    set /a "Index+=1"
    goto :LOOP
)

"C:\Program Files\WinRAR\WinRAR.exe" a -p%Password% -r -ep -ibck "%RARFile%" "%~nx1\*.*"

echo File %RARFile% created successfully!
pause