@REM Initial Load

@REM Start-up Tasks
@echo off
setlocal enableextensions >NUL
chcp 65001 >NUL

@REM Variables

@REM Name - The name displayed around the program. This was made dynamic to allow for easy forking. Default value is "WinCMD".
Set "name=WinCMD" >NUL

@REM Version - The version string displayed around the program.
Set "version=1.1r" >NUL

@REM Author - The name of the program's author. This was made dynamic to allow for easy forking. Default value is "Beef" (Hey, that's me!)
Set "author=Beef" >NUL

@REM Slogan - The program's slogan, usually displayed after the Name variable. This was made dynamic to allow for easy forking. Default value is "an open-source command line".
Set "slogan=an open-source command line" >NUL

@REM Verbose Mode - Displays debug messages. Default value is "false" and options are: "false, true"
Set "verbosemode=false" >NUL

@REM Experiments - Enables experimental functionality e.g. commands. Default value is "false" and options are: "false, true"
Set "enableexperiments=false" >NUL

@REM ShellStyle - Changes the design of the shell from the new one to the old one. Default value is "zsh" and options are: "zsh, bash"
Set "shellstyle=zsh" >NUL

@REM Theme - The design of the CLI, including background colors and text colors. Default value is "wincmd" and options are: "wincmd, dark, light, aperture, lemonade, powershell"
Set "theme=wincmd" >NUL

@REM Checks
:checkarch
if %PROCESSOR_ARCHITECTURE%==AMD64 (
    set "arch=AMD64" >NUL
)
if %PROCESSOR_ARCHITECTURE%==IA64 (
    set "arch=IA64" >NUL
)
if %PROCESSOR_ARCHITECTURE%==ARM64 (
    set "arch=ARM64" >NUL
)
if %PROCESSOR_ARCHITECTURE%==EM64T (
    set "arch=EM64T" >NUL
)
if %PROCESSOR_ARCHITECTURE%==X86 (
    set "arch=X86" >NUL
)
goto loadmessage

:loadmessage
cls
echo Welcome to %name%, %slogan%.
echo Type help to get started.
goto displayarch

:displayarch
if %arch%==AMD64 (
    goto amd64
)
if %arch%==IA64 (
    goto ia64
)
if %arch%==ARM64 (
    goto arm64
)
if %arch%==EM64T (
    goto em64t
)
if %arch%==X86 (
    goto x86
)

:amd64
if %verbosemode%==true (
    echo DEBUG: Processor Architecture is AMD64, continuing without warning prompt.
)
goto finishload

:ia64
if %verbosemode%==true (
    echo DEBUG: Processor Architecture is IA64, warning user.
)
echo You are running %name% on an untested processor architecture, IA64.
echo The program will still run, but we cannot guarantee everything will work as intended.
goto finishload

:arm64
if %verbosemode%==true (
    echo DEBUG: Processor Architecture is ARM64, warning user.
)
echo You are running %name% on an untested processor architecture, ARM64.
echo The program will still run, but we cannot guarantee everything will work as intended.
goto finishload

:em64t
if %verbosemode%==true (
    echo DEBUG: Processor Architecture is EM64T, warning user.
)
echo You are running %name% on an untested processor architecture, EM64T.
echo The program will still run, but we cannot guarantee everything will work as intended.
goto finishload

:x86
if %verbosemode%==true (
    echo DEBUG: Processor Architecture is x86, continuing without warning prompt.
)
goto finishload

:finishload
if %verbosemode%==true (
    echo.
    echo DEBUG: Initial Load completed successfully
)
goto command

@REM Command Handler
@REM Initial Checks and Adjustments
:command
title %name%, %slogan%
if %verbosemode%==true (
    echo.
    echo DEBUG: Command handler initial checks completed successfully
)
goto themeprocessing

@REM Theme Processing
:themeprocessing
echo.
if %theme%==wincmd (
    color 0a
)
if %theme%==dark (
    color 07
)
if %theme%==light (
    color f0
)
if %theme%==aperture (
    color 06
)
if %theme%==lemonade (
    color 0E
)
if %theme%==powershell (
    color 1f
)
if %verbosemode%==true (
    echo DEBUG: Theme processing completed successfully
)
goto shellstyleprocessing

@REM Shell-Style Processing
:shellstyleprocessing
if %verbosemode%==true (
    echo.
    echo DEBUG: Shell-style processing completed successfully
)
if %shellstyle%==zsh (
    goto stylezsh
)
if %shellstyle%==bash (
    goto stylebash
)

@REM Shell-Styles
:stylezsh
if %verbosemode%==true (
    echo.
    echo DEBUG: Shell-Style %shellstyle% loaded successfully
)
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
if %verbosemode%==true (
    echo.
    echo DEBUG: Input processing completed successfully
)

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
if %input%=="changelog" (
    goto changelog
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
@REM Might be finished in a later release.
@REM if %input%==%pcmd% (
@REM     goto plugin
@REM )
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
if %error%==invalidsetting (
    echo That was not a valid setting.
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
    echo settings - Lets you change all of %name%'s variables.
    echo new - Launches a new window of %name%. Now using an improved method!
    echo clear - Clears the screen.
    echo changelog - Shows %name%'s changelog in the most recent update.
)
if %helpvalue%=="useful" (
    echo ===%name% commands in %helpvalue% category===
    echo defaultbrowser - Starts your default browser. Definitely not a shameless plug, nope...
    echo reload - Reloads %name%. Useful for debugging.
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
echo The options are: verbosemode, enableexperiments, shellstyle, theme
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
if %setting%=="theme" (
    goto changetheme
)
) ELSE (
    set "error=invalidsetting"
    goto errorhandler
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

:changetheme
echo You have chosen to change the setting: %setting%
echo The valid values for that setting are: wincmd, dark, light, aperture, lemonade, powershell. The default is wincmd.
set /p "unparsedoption=Enter option here: "
set "option="%unparsedoption%""
echo.
if %option%=="wincmd" (
    set "theme=wincmd"
    echo Successfully changed setting theme. New value is: wincmd
    goto command
)
if %option%=="dark" (
    set "theme=dark"
    echo Successfully changed setting theme. New value is: dark
    goto command
)
if %option%=="light" (
    set "theme=light"
    echo Successfully changed setting theme. New value is: light
    goto command
)
if %option%=="aperture" (
    set "theme=aperture"
    echo Successfully changed setting theme. New value is: aperture
    goto command
)
if %option%=="lemonade" (
    set "theme=lemonade"
    echo Successfully changed setting theme. New value is: lemonade
    goto command
)
if %option%=="powershell" (
    set "theme=powershell"
    echo Successfully changed setting theme. New value is: powershell
    goto command
)
) else (
    echo That was not a valid option for theme.
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
echo ===Version %version%===
echo * Added Themes and ShellStyle! Found within the settings command, which also allows you to change many other options.
echo * Rewrote/reorganised the command handler to allow for ShellStyle and Themes, and to make it easier to work with.
echo * Optimised load time, and cleaned up the file.
echo * Other general fixes to functionality and to comments.
echo ===Sneak Peek===
echo Next update, more overhauls will come to crucial parts of WinCMD, such as the Error Handler. There will also be ways to install WinCMD to system32, and potentially, plugins!
echo The update should arrive any time this week, with betas being released regularly.

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

:load
call %userprofile%\Desktop\wincmdplugins\testplugin.cmd
echo You just loaded: %pluginname%, %plugindescription%
set "pcmd="%plugincmd%""

:plugin
if defined %pcmd% (
    %line1%
    %line2%
)
) else (
    set "error=invalidcommand"
    goto errorhandler
)

:update
if %enableexperiments%==true (
    echo this is not complete yet, but it is coming soon™
)
goto command

:cmd
title [%name%] Command Prompt
for /f "tokens=4-5 delims=. " %%i in ('ver') do set WINVERSION=%%i.%%j
echo.
echo Microsoft Windows [Version %WINVERSION%]
echo (c) %author% Corporation. No rights reserved.
echo This Command Prompt is a visual recreation of Windows Command Prompt, running under %name%.
if %verbosemode%==true (
    echo DEBUG: CMD recreation loaded successfully
)
echo.
Set /p "cmd=%CD%>"
title [%name%] Command Prompt - %cmd%
%cmd%
goto command