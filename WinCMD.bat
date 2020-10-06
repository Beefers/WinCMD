rem ===Default Values and Initial Load===
@echo off 
cls 
Set name=WinCMD
Set version=0.1 beta
Set author=Beef

title %name%, an open-source command line
echo Welcome to %name%, an open-source command line
echo. 

rem ===Declares what a command is===
:command 

title %name%, an open-source command line
echo. 
color a
Set /p input=%USERNAME%@%name%:~%CD%$ 

title %name% - %input%
rem ===Loading Commands===
IF %input%==help (
goto help
)
IF %input%==doscmd (
goto doscmd
)
IF %input%==version (
goto version
)
IF %input%==new (  
goto new
)
IF %input%==credits (
goto credits
)
IF %input%==defaultbrowser (
goto defaultbrowser
)
) ELSE (
set error=cmdinvalid
goto ERROR
)
title %name%, an open-source command line
goto command

rem ===Error Handler===
:ERROR

echo ===%name% Error Handler===
IF %error%==cmdinvalid (
echo That was not a command. If you're looking to run DOS commands, type doscmd.
goto command
) ELSE (
echo invalid error code, if you see this message, contact a dev!
goto command
)


rem ===Declaring Commands===

:help
echo ===%name% Commands===
echo help - Displays this command list along with the default DOS/CMD commands.
echo version - Displays the current %name% version.
echo new - Makes a new window of %name%.
echo doscmd - Lets you run MS-DOS/Command Prompt commands. This can be used to break WinCMD.
echo defaultbrowser - Starts your default browser. (Definitely not a shameless plug, nope...)
echo credits - Displays the credits of this program.
echo.
goto command

:doscmd
Set /p doscmd="Input DOS Command - <%CD%>"
%doscmd%
goto command

:version
echo %name% %version%
goto command

:new
start WinCMD.bat
goto command

:credits
echo ===%name% Credits===
echo %name% %version%
echo Created by %author%
IF not '%name%'=='WinCMD' (
echo Built upon the WinCMD core by Beef
)
goto command

:defaultbrowser
start https://github.com/Beefers/WinCMD
goto command
