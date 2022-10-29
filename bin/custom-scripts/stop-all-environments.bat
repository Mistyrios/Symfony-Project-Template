:: ################################################################################################################
:: # symfony-project-template - Windows - Stop All containers                                                     #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Stop and delete PROD containers and PROD network
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - Stop and delete PROD containers                                     -
ECHO -----------------------------------------------------------------------

docker container rm symfony-project-template-prod-php-cli -f
docker container rm symfony-project-template-prod-nginx -f
docker container rm symfony-project-template-prod-php-fpm -f
docker container rm symfony-project-template-prod-mysql -f
docker network rm dev_symfony-project-template_prod_network

:: Confirm what has been done
ECHO.
ECHO -----------------------------------------------------------------------
ECHO - PROD symfony-project-template containers successfully stopped.      -
ECHO -----------------------------------------------------------------------

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
