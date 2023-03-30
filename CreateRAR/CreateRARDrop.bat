@echo off

set "Password=your_password"
set "RARName=%~n1"
set "RARFile=%RARName%.rar"

set "Index=1"
:LOOP
if exist "%RARFile%" (
    set "RARFile=%RARName% (%Index%).rar"
    set /a "Index+=1"
    goto :LOOP
)

set /p "SourceFile=Drag and drop file here: "

set "SourceFile=%SourceFile:"=%"

"%ProgramFiles%\WinRAR\WinRAR.exe" a -p%Password% -r -ep -ibck "%RARFile%" "%SourceFile%"

echo File %RARFile% created successfully!
pause