:: ################################################################################################################
:: # symfony-project-template - Windows - Update composer and composer vendor                                     #                                            #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Ask for confirmation first, for this takes a long time and can be called by mistake
ECHO ---------------------------------------------------
ECHO - symfony-project-template Composer               -
ECHO - (Using embedded PHP win64 executable)           -
ECHO ---------------------------------------------------

:: Ask people if they really want to proceed
ECHO.
SET /P confirm="Are you SURE you want to install/update project vendors? (Y/y/N/n) "

:: Use that variable prompted from user to go further or not
:: Note that Windows shell scripts don't really like multiple commands and nesting
:: So we just use ugly loops for now. :(
IF /I "%confirm%"=="y" (GOTO :start) ELSE (GOTO :bypass)

:: Start the update of the project
:start

ECHO.
ECHO ---------------------------------------------------
ECHO - Updating Composer                               -
ECHO ---------------------------------------------------
php-sources\php\php.exe composer.phar self-update
ECHO ---------------------------------------------------

:: Confirm what has been done
ECHO.
ECHO ---------------------------------------------------
ECHO - Successfully update composer                    -
ECHO ---------------------------------------------------

:: Start the dev containers
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Updating and Installing composer vendor from composer.json          -
ECHO -----------------------------------------------------------------------
php-sources\php\php.exe composer.phar update
ECHO -----------------------------------------------------------------------

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Successfully update composer vendor.                                -
ECHO -----------------------------------------------------------------------

:: Just stop here and go to the end!
GOTO end

:: If the user answered "n"
:bypass
ECHO.
ECHO OK, then. See you around! :)
ECHO -----------------------------------------------------------------------

:: The end!
:end
