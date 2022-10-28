:: ################################################################################################################
:: # symfony-project-template - Windows - Stop Prod containers                                                    #
:: # @author: Axel Salem                                                                                          #
:: ################################################################################################################

:: Shut down Windows current command echoing
@ECHO OFF

:: Stop and delete PROD containers and PROD network
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
