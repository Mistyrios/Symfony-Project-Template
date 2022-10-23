@ECHO OFF
docker container rm symfony-project-template-dev-php-cli -f
docker container rm symfony-project-template-dev-nginx -f
docker container rm symfony-project-template-dev-php-fpm -f
docker container rm symfony-project-template-dev-mysql -f
docker network rm dev_symfony-project-template_dev_network
