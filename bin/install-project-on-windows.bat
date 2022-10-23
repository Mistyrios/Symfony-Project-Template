:: ################################################################################################################
:: # symfony-project-template - Windows - Install Project Locally                                                 #                                            #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Change the title of the window, for pimpin' reasons :)
:: JK: this helps finding it among all open windows
TITLE symfony-project-template - Install project from composer locally.

:: Ask for confirmation first, for this takes a long time and can be called by mistake
ECHO ---------------------------------------------------
ECHO - symfony-project-template local setup            -
ECHO - (Using embedded PHP win64 executable)           -
ECHO ---------------------------------------------------

:: If command line argument is "-y", then just go on, don't ask.
IF /I "%~1"=="-y" (GOTO :start)

:: If command line argument is --help, then just go on, don't ask.
IF /I "%~1"=="--help" (GOTO :explain) ELSE (GOTO :ask)
:explain
ECHO.
ECHO Usage: install-project-on-windows.bat [OPTION]
ECHO Install project from composer locally.
ECHO.
ECHO -y                 force without confirmation
ECHO --help             display this help screen
GOTO :end

:: Ask people if they really want to proceed
:ask
ECHO.
SET /P confirm="Are you SURE you want to install/update project vendors? (Y/y/N/n) "
ECHO.

:: Use that variable prompted from user to go further or not
:: Note that Windows shell scripts don't really like multiple commands and nesting
:: So we just use ugly loops for now. :(
IF /I "%confirm%"=="y" (GOTO :start) ELSE (GOTO :bypass)

:: Start the production containers
:start

:: Start the dev containers
ECHO.
ECHO -----------------------------------------------------------------------
ECHO Updating and Installing composer project from composer.json
ECHO Updating composer.phar
ECHO -----------------------------------------------------------------------
php-sources\php\php.exe composer.phar self-update
php-sources\php\php.exe composer.phar update
ECHO -----------------------------------------------------------------------

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO Successfully update composer vendor.
ECHO -----------------------------------------------------------------------

:: Just stop here and go to the end!
GOTO end

:: If the user answered "n"
:bypass
ECHO OK, then. See you around! :)
ECHO -----------------------------------------------------------------------

:: The end!
:end
