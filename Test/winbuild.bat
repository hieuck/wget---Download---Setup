set winbuild=1
for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G
echo %winbuild%
pause
if %winbuild% LSS 7600 (
