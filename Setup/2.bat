@echo off
setlocal EnableDelayedExpansion

for /f "tokens=4 delims=[.] " %%i in ('ver') do (
  set "version=%%i"
)

if !version! geq 10 (
  if !version! geq 22000 (
    echo This is Windows 11
  ) else (
    echo This is Windows 10
  )
) else (
  echo This is Windows 7
)

endlocal
