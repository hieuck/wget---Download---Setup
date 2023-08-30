echo ^<Configuration^> > Configuration.xml
echo   ^<Add OfficeClientEdition="64" Channel="Current" AllowCdnFallback="true" OfficeMgmtCOM="false"^> >> Configuration.xml
echo     ^<Product ID="O365ProPlusRetail"^> >> Configuration.xml
echo       ^<Language ID="en-us" /^> >> Configuration.xml
echo       ^<ExcludeApp ID="Teams" /^> >> Configuration.xml
echo     ^</Product^> >> Configuration.xml
echo   ^</Add^> >> Configuration.xml
echo   ^<Remove All="true" /^> >> Configuration.xml
echo   ^<Display AcceptEULA="True" /^> >> Configuration.xml
echo   ^<Updates Enabled="true" /^> >> Configuration.xml
echo   ^<Extend DownloadFirst="true" CreateShortcuts="true" /^> >> Configuration.xml
echo ^</Configuration^> >> Configuration.xml
