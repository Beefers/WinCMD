@REM Initial Load

@REM Variables

@REM Verbose Mode - Displays debug messages. Default value is "false" and options are: "false, true"
Set "verbosemode=false" >NUL

@REM Experiments - Enables experimental functionality e.g. commands. Default value is "false" and options are: "false, true"
Set "enableexperiments=false" >NUL

@REM ShellStyle - Toggles the new design for the shell, which resembles zsh. If you want, you can go back to the old bash-inspired style. This will be implemented soon.
Set "shellstyle=zsh" >NUL

@echo off
setlocal enableextensions >NUL
chcp 65001 >NUL
cls 
Set "name=WinCMD" >NUL
Set "version=1.0r" >NUL
Set "author=Beef" >NUL
Set "slogan=an open-source command line" >NUL

title %name%, %slogan%

echo Welcome to %name%, %slogan%.
echo Type help to get started.
if %verbosemode%==true (
    echo DEBUG: Initial Load completed successfully
)

@REM Command Handler (REWRITING)
@REM Initial Checks and Adjustments
:command
if %verbosemode%==true (
    echo.
    echo DEBUG: Command handler initial checks completed successfully
)
title %name%, %slogan%
color a
goto shellstyleprocessing

@REM Shell-Style Processing
:shellstyleprocessing
echo.
if %shellstyle%==zsh (
    goto stylezsh
)
if %shellstyle%==bash (
    goto stylebash
)

@REM Shell-Styles
:stylezsh
echo ┌──(%USERNAME%@%ComputerName%)-[~%CD%]
set /p "unparsedinput=└─$ "
goto inputprocessing

:stylebash
Set /p "unparsedinput=%USERNAME%@%name%:~%CD%$ "
goto inputprocessing


@REM Input Processing
:inputprocessing
set "input="%unparsedinput%""
title %name% - %input%

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
if %input%=="settings" (
    goto settings
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
if %input%=="clear" (
    goto clear
)
if %input%=="update" (
    goto update
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

@REM Error Handler

:errorhandler
echo ===%name% Error Handler===
if %error%==invalidcommand (
    echo That was not a valid command.
    goto command
)
) else (
    echo Unknown error code. If you see this, contact a dev!
)

@REM Command Functions

:help
set "helpvalue="%unparsedhelp%""
if %helpvalue%=="help" (
    echo ===%name% Command Categories===
    echo general - Everything that doesn't really fit anywhere else.
    echo useful - It's in the name; everything that you'll probably find useful is in here.
    if %enableexperiments%==true (
        echo experimental - Contains everything that's still in the works. Things *will* be broken!
    )
)
if %helpvalue%=="general" (
    echo ===%name% commands in %helpvalue% category===
    echo help - Displays this command list.
    echo credits - Displays program credits.
    echo settings - Lets you change all of WinCMD's variables. This will play a huge part soon.
    echo new - Launches a new windows of WinCMD. Now using an improved method!
    echo clear - Clears the screen.
)
if %helpvalue%=="useful" (
    echo ===%name% commands in %helpvalue% category===
    echo defaultbrowser - Starts your default browser. Definitely not a shameless plug, nope...
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
)
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
if %enableexperiments%==true (
echo This is a test.
)
goto command

:settings
echo ===%name% Settings===
echo Which setting would you like to change?
echo The options are: verbosemode, enableexperiments, shellstyle
set /p "unparsedsetting=Enter setting here: "
set "setting="%unparsedsetting%""
echo.
goto settingscheck

:settingscheck
if %setting%=="verbosemode" (
    goto changeverbose
)
if %setting%=="enableexperiments" (
    goto changeexperiments
)
if %setting%=="shellstyle" (
    goto changeshellstyle
)
) ELSE (
    echo That was not a valid setting.
    goto command
)

:changeverbose
echo You have chosen to change the setting: %setting%
echo The valid values for that setting are: true, false. The default is false.
set /p "unparsedoption=Enter option here: "
set "option="%unparsedoption%""
echo.
if %option%=="true" (
    set "verbosemode=true"
    echo Successfully changed setting verbosemode. New value is: true
    goto command
)
if %option%=="false" (
    set "verbosemode=false"
    echo Successfully changed setting verbosemode. New value is: false
    goto command
)
) else (
    echo That was not a valid option for verbosemode.
    goto command
)

:changeexperiments
echo You have chosen to change the setting: %setting%
echo The valid values for that setting are: true, false. The default is false.
set /p "unparsedoption=Enter option here: "
set "option="%unparsedoption%""
echo.
if %option%=="true" (
    set "enableexperiments=true"
    echo Successfully changed setting enableexperiments. New value is: true
    goto command
)
if %option%=="false" (
    set "enableexperiments=false"
    echo Successfully changed setting enableexperiments. New value is: false
    goto command
)
) else (
    echo That was not a valid option for enableexperiments.
    goto command
)

:changeshellstyle
echo You have chosen to change the setting: %setting%
echo The valid values for that setting are: zsh, bash. The default is zsh.
set /p "unparsedoption=Enter option here: "
set "option="%unparsedoption%""
echo.
if %option%=="zsh" (
    set "shellstyle=zsh"
    echo Successfully changed setting shellstyle. New value is: zsh
    goto command
)
if %option%=="bash" (
    set "shellstyle=bash"
    echo Successfully changed setting shellstyle. New value is: bash
    goto command
)
) else (
    echo That was not a valid option for shellstyle.
    goto command
)

:new
start cmd.exe /C %~0 parameters
goto command

:clear
cls
goto command

:changelog
echo ===%name% Changelog===

:gittest
if %enableexperiments%==true (
git --version
if errorlevel 1 (
    echo.
    echo git is not installed.
)
if not errorlevel 1 (
    echo git is installed.
)
)
goto command

:update
if %enableexperiments%==true (
    echo this is not complete yet.
)
goto command

:cmd
title [%name%] Command Prompt
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