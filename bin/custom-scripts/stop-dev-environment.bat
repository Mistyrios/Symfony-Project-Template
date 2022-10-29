:: ################################################################################################################
:: # symfony-project-template - Windows - Stop Dev containers                                                     #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

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
