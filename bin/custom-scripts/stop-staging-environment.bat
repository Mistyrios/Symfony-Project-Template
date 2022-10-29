:: ################################################################################################################
:: # symfony-project-template - Windows - Stop Staging containers                                                 #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Stop and delete STAGING containers and STAGING network
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Stop and delete STAGING containers                                  -
ECHO -----------------------------------------------------------------------

docker container rm symfony-project-template-staging-php-cli -f
docker container rm symfony-project-template-staging-nginx -f
docker container rm symfony-project-template-staging-php-fpm -f
docker container rm symfony-project-template-staging-mysql -f
docker network rm dev_symfony-project-template_staging_network

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - STAGING symfony-project-template containers successfully stopped.   -
ECHO -----------------------------------------------------------------------
