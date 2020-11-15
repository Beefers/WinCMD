rem Initial Load

@echo off
setlocal enabledelayedexpansion
cls 
Set "name=WinCMD"
Set "version=1.0"
Set "author=Beef"

title "%name%", an open-source command line
echo Welcome to "%name%", an open-source command line. Everything you see here is a beta product and is subject to change.

rem Command Handler

:command

title "%name%", an open source command line
echo.
color a
set /p "input=%USERNAME%@%name%:~%CD%$ "

title "%name% - %input%"

rem Command Declarations

if %input%=="help" (
    goto help
)
) else (
    set "error=invalidcommand"
    goto errorhandler
)

rem Error Handler

:errorhandler
echo ==="%name%" Error Handler===
if %error%=="invalidcommand" (
    echo That was not a valid command.
    goto command
)

rem Command Functions

:help
echo ==="%name%" Commands===
echo help - Displays this command list.
echo.
goto command