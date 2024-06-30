@echo off

set /p choice="Chọn hành động: 1) Bật Sandbox, 2) Tắt Sandbox: " (N1)
if %choice%==1 (
    powershell -Command "Enable-WindowsFeature -Name Microsoft-Windows-Sandbox"
    echo Sandbox đã được bật.
) else if %choice%==2 (
    powershell -Command "Disable-WindowsFeature -Name Microsoft-Windows-Sandbox"
    echo Sandbox đã được tắt.
) else (
    echo Lựa chọn không hợp lệ.
)

pause