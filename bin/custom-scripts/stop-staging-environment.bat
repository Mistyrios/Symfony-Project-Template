@ECHO OFF
docker container rm symfony-project-template-staging-php-cli -f
docker container rm symfony-project-template-staging-nginx -f
docker container rm symfony-project-template-staging-php-fpm -f
docker container rm symfony-project-template-staging-mysql -f
docker network rm dev_symfony-project-template_staging_network
