:: ################################################################################################################
:: # symfony-project-template - Windows - Start Staging containers                                                #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Ask for confirmation first, for this takes a long time and can be called by mistake
ECHO ---------------------------------------------------
ECHO - symfony-project-template STAGING Containers     -
ECHO - (You need to have Docker installed to proceed)  -
ECHO ---------------------------------------------------

:: Ask people if they really want to proceed
:ask
ECHO.
SET /P confirm="Are you SURE you want to rebuild staging containers? (Y/y/N/n) "
ECHO.

:: Use that variable prompted from user to go further or not
:: Note that Windows shell scripts don't really like multiple commands and nesting
:: So we just use ugly loops for now. :(
IF /I "%confirm%"=="y" (GOTO :start) ELSE (GOTO :bypass)

:: Start the script
:start

:: Start the staging containers
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - (Re)generating / (Re)starting Staging containers                    -
ECHO - Tagging them with staging prefix, forced recreation                 -
ECHO -----------------------------------------------------------------------
docker-compose -f "docker-sources/global-docker-compose.yml" -f "docker-sources/staging-docker-compose.yml" -p staging up -d --force-recreate --build
ECHO -----------------------------------------------------------------------

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - STAGING symfony-project-template containers successfully started.   -
ECHO -----------------------------------------------------------------------

:: Echo current containers
ECHO.
ECHO -----------------------------------------------------------------------
ECHO Those are your currently active containers.
docker ps -a

:: Echo current networks
ECHO.
ECHO Those are your currently active networks.
docker network ls
ECHO -----------------------------------------------------------------------
ECHO.

:: Just stop here and go to the end!
GOTO end

:: If the user answered "n"
:bypass
ECHO.
ECHO OK, then. See you around! :)
ECHO -----------------------------------------------------------------------

:: The end!
:end
