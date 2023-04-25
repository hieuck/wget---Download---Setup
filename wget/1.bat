@echo off
color 0B
:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=70 lines=15 & title Autodesk License Patcher & cls
SET liveincolor=1 & SET "c_underline=[4m" & SET "c_reset=[0m" & SET "c_Red_Blak=[91;40m" & SET "c_Gre_Blak=[92;40m" & SET "c_Yel_Blak=[93;40m" & SET "c_Blu_Blak=[94;40m" & SET "c_Mag_Blak=[95;40m" & SET "c_Cya_Blak=[96;40m" & SET "c_Whi_Blak=[97;40m"

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )
echo The current date and time are: %date% %time%
echo %c_Red_Blak%1%c_reset%
echo %c_Gre_Blak%2%c_reset%
echo %c_Yel_Blak%3%c_reset%
echo %c_Blu_Blak%4%c_reset%
echo %c_Mag_Blak%5%c_reset%
echo %c_Cya_Blak%6%c_reset%
echo %c_Whi_Blak%7%c_reset%
echo %c_Red_Blak%8
pause