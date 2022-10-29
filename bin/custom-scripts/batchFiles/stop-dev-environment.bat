:: ################################################################################################################
:: # symfony-project-template - Windows - Stop Dev containers                                                     #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Ask people if they really want to proceed
ECHO.
SET /P confirm="Are you SURE you want to stop DEV environment? (Y/y/N/n) "

:: Use that variable prompted from user to go further or not
:: Note that Windows shell scripts don't really like multiple commands and nesting
:: So we just use ugly loops for now. :(
IF /I "%confirm%"=="y" (GOTO :start) ELSE (GOTO :bypass)

:: Start the script
:start

:: Stop and delete DEV containers and DEV network
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Stop and delete DEV containers                                      -
ECHO -----------------------------------------------------------------------

docker container rm symfony-project-template-dev-php-cli -f
docker container rm symfony-project-template-dev-nginx -f
docker container rm symfony-project-template-dev-php-fpm -f
docker container rm symfony-project-template-dev-mysql -f
docker network rm dev_symfony-project-template_dev_network

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - DEV symfony-project-template containers successfully stopped.       -
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
