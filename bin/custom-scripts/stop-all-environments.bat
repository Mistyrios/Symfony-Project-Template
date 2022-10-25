@ECHO OFF
docker container rm symfony-project-template-dev-php-cli -f
docker container rm symfony-project-template-dev-nginx -f
docker container rm symfony-project-template-dev-php-fpm -f
docker container rm symfony-project-template-dev-mysql -f
docker network rm dev_symfony-project-template_dev_network
docker container rm symfony-project-template-staging-php-cli -f
docker container rm symfony-project-template-staging-nginx -f
docker container rm symfony-project-template-staging-php-fpm -f
docker container rm symfony-project-template-staging-mysql -f
docker network rm dev_symfony-project-template_staging_network
docker container rm symfony-project-template-prod-php-cli -f
docker container rm symfony-project-template-prod-nginx -f
docker container rm symfony-project-template-prod-php-fpm -f
docker container rm symfony-project-template-prod-mysql -f
docker network rm dev_symfony-project-template_prod_network
