rem Initial Load

rem Variables

rem Verbose Mode - Displays debug messages. Default value is "false" and options are: "false, true"
Set "verbosemode=false"

rem Experiments - Enables experimental functionality e.g. commands. Default value is "false" and options are: "false, true"
Set "enableexperiments=false"

@echo off
cls 
Set "name=WinCMD"
Set "version=0.1 rewrite"
Set "author=Beef"
Set "slogan=an open-source command line"

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
title %name%, %slogan%
echo.
color a
set /p "unparsedinput=%USERNAME%@%name%:~%CD%$ "
set "input="%unparsedinput%""

title %name% - %input%

rem Command Declarations

rem Help Command Declarations
if %input%=="help" (
    set "unparsedhelp=help"
    goto help
)
if %input%=="help general" (
    set "unparsedhelp=general"
    goto help
)
if %input%=="help useful" (
    set "unparsedhelp=useful"
    goto help
)
if %input%=="help experimental" (
    set "unparsedhelp=experimental"
    goto help
)
if %input%=="test" (
    goto test
)
if %input%=="credits" (
    goto credits
)
if %input%=="reload" (
    cmd.exe /C %~0 parameters
)
if %input%=="defaultbrowser" (
    goto defaultbrowser
)
if %input%=="new" (
    goto new
)
if %input%=="gittest" (
    goto gittest
)
if %input%=="cmd" (
    goto cmd
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
set "helpvalue="%unparsedhelp%""
if %helpvalue%=="help" (
    echo ===%name% Command Categories===
    echo general - everything that doesn't really fit anywhere else, but is still useful!
)
if %helpvalue%=="general" (
    echo ===%name% commands in %helpvalue% category===
    echo help - Displays this command list.
    echo credits - Displays program credits.
    echo new - Launches a new windows of WinCMD. Now using an improved method!
)
if %helpvalue%=="useful" (
    echo ===%name% commands in %helpvalue% category===
    echo defaultbrowser - Starts your default browser. (Definitely not a shameless plug, nope...)
    echo reload - Reloads WinCMD. Useful for debugging.
    echo cmd - Allows you to run MS-DOS/Command Prompt commands. Has a new look, courtesy of the rewrite.
)
if %helpvalue%=="experimental" (
    if %enableexperiments%==true (
        echo ===%name% commands in %helpvalue% category===
        echo commands in this category may be incomplete or non-functional. command comments are also not final and therefore may be informal.
        echo test - prints a test string. included during the early stages of the rewrite.
        echo gittest - tests for git on your machine.
        echo update - incomplete.
    )
    ) ELSE (
        echo Experiments are not enabled! This category is inaccessible.
    )
)
echo.
goto command

:credits
echo === %name%, %slogan%. ===
echo Created by %author%
echo Version %version%
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

:new
start cmd.exe /C %~0 parameters
goto command

:gittest
git --version
if errorlevel 1 (
    echo.
    echo git is not installed.
)
if not errorlevel 1 (
    echo git is installed.
)
goto command

:update
echo this is not complete yet.

:cmd
title [WinCMD] Command Prompt
color 7
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
echo.
echo Microsoft Windows [Version %VERSION%]
echo (c) %author% Corporation. No rights reserved.
echo This Command Prompt is a visual recreation of Windows Command Prompt, running under WinCMD.
if %verbosemode%==true (
    echo DEBUG: CMD recreation loaded successfully
)
echo.
Set /p "cmd=%CD%>"
title [%name%] Command Prompt - %cmd%
%cmd%
goto command