:: ################################################################################################################
:: # symfony-project-template - Windows - Script Batch - Initialization of the project                            #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Ask for confirmation first, for this takes a long time and can be called by mistake
ECHO -----------------------------------------------------------------------
ECHO - symfony-project-template project initialisation                     -
ECHO -----------------------------------------------------------------------

:: Ask people if they really want to proceed
ECHO.
SET /P confirm="Are you SURE you want to launch the initialization script? (Y/y/N/n) "

:: Use that variable prompted from user to go further or not
:: Note that Windows shell scripts don't really like multiple commands and nesting
:: So we just use ugly loops for now. :(
IF /I "%confirm%"=="y" (GOTO :start) ELSE (GOTO :bypass)

:: Start the initialization of the project
:start

:: Install composer to use different plugin
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Composer - self-update and install vendor                           -
ECHO -----------------------------------------------------------------------

ECHO Update of composer.phar
php-sources\php\php.exe composer.phar self-update

ECHO.
ECHO Installation of
ECHO    * Symfony Twig Bundle
ECHO    * Symfony Framework Bundle
ECHO    * Symfony Maker Bundle
ECHO    * Symfony Orm Pack
ECHO    * Symfony CRUD Generator
php-sources\php\php.exe composer.phar update

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Successfully install composer vendor.                               -
ECHO -----------------------------------------------------------------------

:: Creation of the specific OS Makefile
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Creation of the specific OS Makefile                                -
ECHO - Copying windows-makefile-sample to Makefile                         -
ECHO -----------------------------------------------------------------------
COPY Makefiles\windows-makefile-sample Makefile

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Successfully create makefile.                                       -
ECHO -----------------------------------------------------------------------

:: Git Initialization
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Git initialisation                                                  -
ECHO -----------------------------------------------------------------------

:: Initialization of git
SET /P confirm="Are you SURE you want to initialise git (If git was already by you or other people, enter n or N)? (Y/y/N/n) "
ECHO.
IF /I "%confirm%"=="y" (GOTO :git-initialize) ELSE (GOTO :bypass)

:git-initialize
if not exist ./.git (
    git init
) else (
    rd /s /q .git
    git init
)

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Successfully initialise git.                                        -
ECHO -----------------------------------------------------------------------

:: Just stop here and go to the end!
GOTO end

:: If the user answered "n"
:bypass
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - OK, then. See you around! :)                                        -
ECHO -----------------------------------------------------------------------

:: The end!
:end
