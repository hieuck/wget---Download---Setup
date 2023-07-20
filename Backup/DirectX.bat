@echo off
pushd "%UserProfile%\Downloads"
for %%i in ("dxwebsetup*.exe") do set FileName="%%i"
%FileName% /Q
popd
