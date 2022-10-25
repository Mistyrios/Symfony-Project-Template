:: ########################################################################################
:: # symfony-project-template - Windows - Script Batch - Initialization of the project    #
:: # @author: Axel Salem                                          #
:: ########################################################################################

:: Shut down Windows current command ECHOing
@ECHO OFF

:: Change the title of the window, for pimpin' reasons :)
:: JK: this helps finding it among all open windows
TITLE Project initialization

:: Ask for confirmation first, for this takes a long time and can be called by mistake
ECHO -------------------------------------------------------------
ECHO - symfony-project-template project initialisation           -
ECHO -------------------------------------------------------------


:: If command line argument is "-y", then just go on, don't ask.
IF /I "%~1"=="-y" (GOTO :start)

:: If command line argument is --help, then just go on, don't ask.
IF /I "%~1"=="--help" (GOTO :explain) ELSE (GOTO :ask)
:explain
ECHO.
ECHO Usage: init-project.bat [OPTION]
ECHO Initialize the symfony template project.
ECHO.
ECHO -y                 force without confirmation
ECHO --help             display this help screen

:: Ask people if they really want to proceed
:ask
ECHO.
SET /P confirm="Are you SURE you want to launch the initialization script? (Y/y/N/n) "
ECHO.

:: Use that variable prompted from user to go further or not
:: Note that Windows shell scripts don't really like multiple commands and nesting
:: So we just use ugly loops for now. :(
IF /I "%confirm%"=="y" (GOTO :start) ELSE (GOTO :bypass)

:: Start the initialization of the project
:start

:: Install composer to use different plugin
ECHO .
ECHO ---------------------------------------------------
ECHO Composer - self-update and update
ECHO ---------------------------------------------------

ECHO Update of composer.phar
php-sources\php\php.exe composer.phar self-update

ECHO .
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
ECHO Successfully update composer vendor.
ECHO -----------------------------------------------------------------------

:: Git Initialization
ECHO .
ECHO ---------------------------------------------------
ECHO Git initialisation
ECHO ---------------------------------------------------

:: Initialization of git
SET /P confirm="Are you SURE you want to initialise git (If git was already by you or other people, enter n or N)? (Y/y/N/n) "
ECHO.
IF /I "%confirm%"=="y" (GOTO :git-initialize) ELSE (GOTO :git-init-bypass)

:git-initialize
if not exist ./.git (
    git init
) else (
    rd /s /q .git
    git init
)

:git-init-bypass
:: Creation of the local .env.dev.local file from the template
ECHO ---------------------------------------------------
ECHO Creation of the local .env.dev file for docker
ECHO Copying .env.local.dist to .env.dev.local
ECHO ---------------------------------------------------
COPY environment-files\.env.[environment].local-dist.sample environment-files\.env.dev.local

:: Just stop here and go to the end!
GOTO end

:: If the user answered "n"
:bypass
ECHO OK, then. See you around! :)
ECHO ---------------------------------------------------

:: The end!
:end