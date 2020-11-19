rem Initial Load

rem Variables

rem Verbose Mode - Displays debug messages. Default value is "false" and options are: "false, true"
Set "verbosemode=false"

@echo off
setlocal enabledelayedexpansion
cls 
Set "name=WinCMD"
Set "version=0.1 rewrite"
Set "author=Beef"
Set "slogan=an open-source command line"

title %name%, %slogan%
echo Welcome to %name%, %slogan%.
echo This is a beta product.
echo Everything you see here is subject to change at any time, without warning.
echo To get started, type help.
if %verbosemode%==true (
    echo DEBUG: Initial Load completed successfully
)

rem Command Handler

:command

if %verbosemode%==true (
    echo DEBUG: Command handler loaded successfully
)
title %name%, an open source command line
echo.
color a
set /p "input=%USERNAME%@%name%:~%CD%$ "

title %name% - %input%

rem Command Declarations

if %input%==help (
    goto help
)
if %input%==test (
    goto test
)
if %input%==credits (
    goto test
)
if %input%==reload (
    WinCMD.bat
)
if %input%==defaultbrowser (
    goto defaultbrowser
)
if %input%==doscmd (
    goto doscmd
)
) else (
    set "error=invalidcommand"
    goto errorhandler
)

rem Error Handler

:errorhandler
echo ===%name% Error Handler===
if %error%==invalidcommand (
    echo That was not a valid command.
    goto command
)
) else (
    echo Unknown error code. If you see this, contact a dev!
)

rem Command Functions

:help
echo ===%name% Commands===
echo help - Displays this command list.
echo credits - Displays program credits.
echo reload - Reloads WinCMD. Useful for debugging.
echo.
goto command

:credits
echo === %name%, %slogan%. ===
echo Created by %author%
IF not '%name%'=='WinCMD' (
echo Built upon the WinCMD core by Beef
)
goto command

:defaultbrowser
start https://github.com/Beefers/WinCMD
goto command

:test
echo This is a test.
echo.
goto command

:doscmd
cls
color f
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
echo Microsoft Windows [Version %VERSION%]
echo (c) %author% Corporation. No rights reserved.
echo This Command Prompt is a visual recreation of Windows Command Prompt, running under WinCMD.
echo.
Set /p "doscmd=%CD%>"
%doscmd%
goto command