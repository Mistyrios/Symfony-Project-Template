#The @ at the beginning of each command is used to execute commands in silent mode (without the command being repeated at use)
# The command for the initial build of the project
init-project:
	@.\bin\custom-scripts\project-initialisation.bat
update-composer:
	@.\bin\custom-scripts\install-project-on-windows.bat

# The commands for enter in the docker containers
php-cli-dev:
	@docker exec -it symfony-project-template-dev-php-cli bash
php-cli-staging:
	@docker exec -it symfony-project-template-staging-php-cli bash
php-cli-prod:
	@docker exec -it symfony-project-template-prod-php-cli bash
php-fpm-dev:
	@docker exec -it symfony-project-template-dev-php-fpm bash
php-fpm-staging:
	@docker exec -it symfony-project-template-staging-php-fpm bash
php-fpm-prod:
	@docker exec -it symfony-project-template-prod-php-fpm bash
nginx-dev:
	@docker exec -it symfony-project-template-dev-nginx bash
nginx-staging:
	@docker exec -it symfony-project-template-staging-nginx bash
nginx-prod:
	@docker exec -it symfony-project-template-prod-nginx bash
mysql-dev:
	@docker exec -it symfony-project-template-dev-mysql bash
mysql-staging:
	@docker exec -it symfony-project-template-staging-mysql bash
mysql-prod:
	@docker exec -it symfony-project-template-prod-mysql bash

# The commands for build the docker environments
dev-env:
	@.\bin\custom-scripts\start-dev-environment.bat
staging-env:
	@.\bin\custom-scripts\start-staging-environment.bat
prod-env:
	@.\bin\custom-scripts\start-prod-environment.bat
all-env:
	@.\bin\custom-scripts\start-all-environments.bat
stop-dev-env:
	@.\bin\custom-scripts\stop-dev-environment.bat
stop-staging-env:
	@.\bin\custom-scripts\stop-staging-environment.bat
stop-prod-env:
	@.\bin\custom-scripts\stop-prod-environment.bat
stop-all-env:
	@.\bin\custom-scripts\stop-all-environments.bat
